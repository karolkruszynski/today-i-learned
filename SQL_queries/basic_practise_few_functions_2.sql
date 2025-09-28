-- Practise tasks with: select, where, order by, subqueries, cte, case, nullif, coalesce
-- 


-- 1. SELECT, WHERE, ORDER BY
SELECT
	customer_id,
	company_name,
	country
FROM
	customers
WHERE
	country IN ('Australia', 'Canada')
ORDER BY
	company_name ASC;


-- 2. SELECT, CASE
SELECT
	product_id,
	product_name,
	unit_price,
	CASE
		WHEN unit_price < 20 THEN 'cheap'
		WHEN unit_price >= 20 AND unit_price <= 50 THEN 'moderate'
		ELSE 'expensive'
		END price_level
FROM
	products;


-- 3. SELECT, COALESCE, NULLIF
SELECT
	customer_id,
	company_name,
	COALESCE(fax,'No Fax')
FROM
	customers
ORDER BY
	company_name;


-- 4. SUBQUERY, WHERE
SELECT
	product_id,
	product_name,
	unit_price
FROM
	products
WHERE
	unit_price > (SELECT AVG(unit_price) FROM products);


-- 5. CTE, SELECT, WHERE
WITH o as
(
	SELECT
		order_id,
		customer_id,
		order_date
	FROM
		orders
	WHERE
		order_date >= '1997-01-01'
		AND
		order_date < '1998-01-01'
)
SELECT
	




















