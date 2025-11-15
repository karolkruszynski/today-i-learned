SELECT
	customer_id,
	first_name,
	last_name,
	date_added
FROM
	customers
ORDER BY
	date_added;

SELECT
	date_added,
	COUNT(*)
FROM
	customers
GROUP BY
	date_added
ORDER BY
	date_added;

-- WINDOW FUNCTION
SELECT
	customer_id,
	title,
	first_name,
	last_name,
	gender,
	COUNT(*) OVER (PARTITION BY gender) as total_customers
FROM
	customers
ORDER BY
	customer_id;

SELECT
	customer_id,
	title,
	first_name,
	last_name,
	gender,
	COUNT(*) OVER (ORDER BY customer_id) as total_customers
FROM
	customers
ORDER BY
	customer_id;


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


-- Użyj funkcji okna i napisz kwerendę, która zwraca
-- informacje o klientach oraz
-- liczbę osób, które podały swój adres.
-- Ponadto uporządkuj listę według dat.

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

































	