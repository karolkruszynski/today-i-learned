SELECT
	customer_id,
	title,
	first_name,
	last_name,
	gender,
	COUNT(*) OVER (PARTITION BY gender ORDER BY customer_id)
	as total_customers
FROM
	customers
ORDER BY
	customer_id;

--
WITH daily_rolling_count as
(SELECT
	customer_id,
	street_address,
	date_added::DATE,
	COUNT(
		CASE
			WHEN street_address IS NOT NULL THEN customer_id
			ELSE NULL
		END
	) OVER (ORDER BY date_added::DATE)
	as non_null_street_address,
	COUNT(*) OVER (ORDER BY date_added::DATE)
	as total_street_address
FROM
	customers
)
SELECT DISTINCT
	date_added,
	non_null_street_address,
	total_street_address,
	1 - 1.0 * non_null_street_address/total_street_address
	as null_address_percentage
FROM
	daily_rolling_count
ORDER BY
	date_added;

--
SELECT
	customer_id,
	title,
	first_name,
	last_name,
	gender,
	COUNT(*) OVER w as total_customers,
	SUM(
		CASE
			WHEN title IS NOT NULL THEN 1
			ELSE 0
		END
	) OVER w as total_customers_title
FROM
	customers
WINDOW w as (
	PARTITION BY gender ORDER BY customer_id
)
ORDER BY customer_id;

--
SELECT
	customer_id,
	first_name,
	last_name,
	state,
	date_added::DATE,
	RANK() OVER(
		PARTITION BY state ORDER BY date_added
	) as cust_rank
FROM
	customers
ORDER BY
	state, cust_rank;

-- Moving AVG
WITH daily_sales as (
	SELECT
		sales_transaction_date::DATE,
		SUM(sales_amount) as total_sales
	FROM
		sales
	GROUP BY
		sales_transaction_date::DATE
),
moving_average_calculation_7 as (
	SELECT
		sales_transaction_date,
		total_sales,
		AVG(total_sales) OVER (
			ORDER BY sales_transaction_date
			ROWS BETWEEN 6 PRECEDING and CURRENT ROW
		) as sales_moving_average_7,
		ROW_NUMBER() OVER (
			ORDER BY sales_transaction_date
		) as row_number
	FROM
		daily_sales
	ORDER BY 1
)
SELECT
	sales_transaction_date,
	CASE
		WHEN row_number>=7 THEN sales_moving_average_7
		ELSE NULL
	END as sales_moving_average_7
FROM
	moving_average_calculation_7;
	
--
WITH daily_sales as (
	SELECT
		sales_transaction_date::DATE,
		SUM(sales_amount) as total_sales
	FROM
		sales
	GROUP BY
		sales_transaction_date::DATE
),
sales_stats_30 as (
	SELECT
		sales_transaction_date,
		total_sales,
		MAX(total_sales) OVER (
			ORDER BY sales_transaction_date
			ROWS BETWEEN 30 PRECEDING and 1 PRECEDING
		) as max_sales_30
	FROM
		daily_sales
	ORDER BY
		1
)
SELECT
	sales_transaction_date,
	total_sales,
	max_sales_30
FROM
	sales_stats_30
WHERE
  total_sales > max_sales_30 
AND
  sales_transaction_date>='2019-01-01';

--
WITH daily_sales as (
	SELECT
		sales_transaction_date::DATE,
		SUM(sales_amount) as total_sales
	FROM
		sales
	WHERE sales_transaction_date::date >= DATE '2021-01-01'
    AND sales_transaction_date::date <  DATE '2022-01-01'
	GROUP BY
		sales_transaction_date::DATE
	ORDER BY
		1
),
moving_avg_30 as (
	SELECT
		sales_transaction_date,
		AVG(total_sales) OVER (
			ORDER BY sales_transaction_date
			ROWS BETWEEN 29 PRECEDING and CURRENT ROW
		) as moving_avg_30,
		SUM(total_sales) OVER (
			ORDER BY sales_transaction_date
			ROWS BETWEEN 29 PRECEDING AND CURRENT ROW
		) as rolling_30_sum,
		COUNT(*) OVER (
			ORDER BY sales_transaction_date
			ROWS BETWEEN 29 PRECEDING AND CURRENT ROW
		) as window_days
	FROM
		daily_sales
	ORDER BY
		1
)
SELECT
	sales_transaction_date,
	window_days,
	CASE
		WHEN window_days = 30 THEN moving_avg_30
	END as moving_avg_30,
	rolling_30_sum,
	NTILE(10) OVER (ORDER BY rolling_30_sum DESC) AS decile
FROM
	moving_avg_30
WHERE 
  window_days = 30
ORDER BY 
  decile;




























