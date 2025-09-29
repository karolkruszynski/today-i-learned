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
WITH o1 as
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
	SUM(quantity*unit_price) as sum_of_orders,
	o.customer_id
FROM
	order_details od
INNER JOIN
	orders o ON od.order_id = o.order_id
INNER JOIN
	o1 ON o1.order_id = o.order_id
GROUP BY
	o.customer_id
HAVING
	SUM(quantity*unit_price) > 1000
ORDER BY
	o.customer_id;

-- 5. v2 version
WITH o1 as
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
	o1.customer_id,
	SUM(od.quantity * od.unit_price) as sum_of_orders
FROM
	o1
INNER JOIN
	order_details od ON o1.order_id = od.order_id
GROUP BY
	o1.customer_id
HAVING
	SUM(od.quantity * od.unit_price) > 1000
ORDER BY
	o1.customer_id;


-- 6. SELECT, CASE, ORDER BY
SELECT
	order_id,
	order_date,
	freight,
	CASE
		WHEN freight < 50 THEN 'Cheap'
		WHEN freight >= 50 AND freight <= 100 THEN 'Average'
		ELSE 'Expensive'
		END as shipment_type
FROM
	orders
ORDER BY
	shipment_type, order_date;


-- 7. SUBQUERY, COALESCE
SELECT
	c.customer_id,
	c.company_name,
	COALESCE(CAST(MAX(o.order_date) as varchar),'No order') as last_order_date
FROM
	customers c
LEFT JOIN
	orders o ON c.customer_id = o.customer_id
GROUP BY
	c.customer_id, c.company_name
ORDER BY
	c.company_name

-- 7. second version
SELECT
	c.customer_id,
	c.company_name,
	COALESCE(
		(SELECT CAST(MAX(o.order_date) as varchar) FROM orders o WHERE o.customer_id = c.customer_id),
		'Brak zamówienia'
	) as last_order_date
FROM
	customers c
ORDER BY
	c.company_name;


-- 8. CTE, SUBQUERY
WITH p1 as 
(
	SELECT
		product_id,
		SUM(quantity) as total_quantity
	FROM
		order_details
	GROUP BY
		product_id
)
SELECT
	p1.product_id,
	p1.total_quantity
FROM
	p1
WHERE
	p1.total_quantity >
	(
		SELECT
			AVG(p1.total_quantity)
		FROM
			p1
	)
ORDER BY
	p1.total_quantity DESC;



































