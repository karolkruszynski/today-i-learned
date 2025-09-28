-- Practise tasks with: select, where, order by, subqueries, cte, case, nullif, coalesce
-- 

-- 1. SELECT WHERE ORDER BY - EASY
SELECT
	customer_id,
	company_name,
	country
FROM
	customers
WHERE
	country = 'Germany'
ORDER BY
	company_name ASC;


-- 2. SELECT, CASE, NULLIF - EASY
SELECT
	product_id,
	product_name,
	unit_price,
	units_in_stock,
	CASE
		WHEN units_in_stock  = 0 THEN 'Brak'
		ELSE CAST(NULLIF(units_in_stock, 0) AS varchar)
		END as stock_status
FROM
	products;


-- 3. SELECT, WHERE, COALESCE, ORDER BY
SELECT
	order_id,
	customer_id,
	order_date,
	shipped_date,
	CASE
		WHEN shipped_date IS NOT NULL THEN 'Send'
		ELSE COALESCE(CAST(shipped_date AS varchar),'Waiting')
		END as status
FROM
	orders;


-- 4. CTE, SELECT, WHERE, ORDER BY
WITH o as
(
	SELECT
		customer_id,
		order_id
	FROM
		orders
	WHERE
		order_date >= '1997-01-01'
	AND
		order_date < '1998-01-01'
)
SELECT
	c.customer_id,
	SUM(od.quantity*od.unit_price) as total
FROM
	order_details od
INNER JOIN
	o ON o.order_id = od.order_id 
INNER JOIN
	customers c ON o.customer_id = c.customer_id
GROUP BY
	c.customer_id
HAVING
	SUM(od.quantity*od.unit_price) > 1500


-- 5. SELECT, subquery, CASE, ORDER BY
SELECT
	product_id,
	product_name,
	unit_price,
	CASE
		WHEN unit_price > (SELECT AVG(unit_price) FROM products) THEN 'Yes'
		ELSE 'No'
		END as Above_Average
FROM
	products
ORDER BY
	unit_price DESC;


















































