-- 1. 
SELECT
	order_id,
	customer_id,
	order_date,
	COUNT(*) OVER w as running_orders_per_customer,
	SUM(CASE WHEN freight IS NOT NULL THEN 1 ELSE 0 END) OVER w as
	running_freight_non_null
FROM
	orders
WINDOW w as (
	PARTITION BY customer_id
	ORDER BY order_date, order_id
)
ORDER BY
	customer_id, order_date, order_id;

-- 2.
WITH daily as (
	SELECT
		order_date::date as order_date,
		COUNT(*) as total_orders_that_day,
		SUM(
			CASE
				WHEN ship_address IS NOT NULL AND ship_city IS NOT NULL THEN 1
				ELSE 0
			END
		) as complete_ship_address_that_day
	FROM
		orders
	WHERE
		order_date IS NOT NULL
	GROUP BY
		order_date::date
)
SELECT
	order_date,
	total_orders_that_day,
	complete_ship_address_that_day,
	SUM(total_orders_that_day) OVER (
		ORDER BY order_date
		ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
	) as running_total_orders,
	SUM(complete_ship_address_that_day) OVER (
		ORDER BY order_date
		ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
	) as running_complete_orders,
	1 - 1.0 * SUM(complete_ship_address_that_day) OVER (
        ORDER BY order_date
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
      )
      / NULLIF(
          SUM(total_orders_that_day) OVER (
            ORDER BY order_date
            ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
          ), 0
        ) AS null_address_percentage
FROM
	daily
ORDER BY
	order_date;


-- 3. REAL 7 DAYS CALENDAR AVG EVEN NULL SALES THAT DAY
WITH daily_sales as (
	SELECT
		o.order_date::date as d,
		SUM(od.unit_price * od.quantity * (1 - od.discount)) as total_sales
	FROM
		orders o
	INNER JOIN
		order_details od ON o.order_id = od.order_id
	GROUP BY
		o.order_date::date
),
calendar as (
	SELECT generate_series(
           (SELECT MIN(d) FROM daily_sales),
           (SELECT MAX(d) FROM daily_sales),
           interval '1 day'
         )::date AS d
),
daily_filled as (
	SELECT
    c.d AS order_date,
    COALESCE(ds.total_sales, 0) AS total_sales
  FROM calendar c
  LEFT JOIN daily_sales ds ON ds.d = c.d
)
SELECT
	order_date,
	total_sales,
	AVG(total_sales) OVER
			(ORDER BY order_date ROWS BETWEEN 6 PRECEDING AND CURRENT ROW)
	as sales_moving_average_7
FROM
	daily_filled
ORDER BY
	order_date



-- 4.
SELECT
	customer_id,
	order_id,
	order_date::date as order_date,
	freight,
	AVG(freight) OVER (
		PARTITION BY customer_id
		ORDER BY order_date, order_id
		ROWS BETWEEN 4 PRECEDING AND CURRENT ROW
	) as moving_avg_freight_5
FROM
	orders
WHERE
	order_date >= DATE '1997-01-01'
AND
	freight IS NOT NULL
ORDER BY
	customer_id, order_date, order_id;



-- 5.
SELECT
	p.product_id,
	p.product_name,
	od.order_id,
	od.quantity,
	od.discount,
	COUNT(*) OVER w as running_lines_per_products,
	SUM(CASE WHEN od.discount > 0 THEN 1 ELSE 0 END) OVER w as running_discounted_lines
FROM
	order_details od
INNER JOIN
	products p ON od.product_id = p.product_id
WHERE
	p.unit_price > 30
WINDOW w as (
	PARTITION BY p.product_id
	ORDER BY od.order_id
	ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
)
ORDER BY
	p.product_id, od.order_id



































	