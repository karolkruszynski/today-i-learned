-- 1.
SELECT
	product_id
FROM
	products
WHERE
	unit_price > 30;


-- 2.
SELECT
	customer_id
FROM
	orders
WHERE NOT EXISTS
	(
		SELECT
			customer_id
		FROM
			orders
		WHERE
			EXTRACT(YEAR FROM order_date) = 1999 -- EXTRACT YEAR !FROM! column name 

	);
	

-- 3.
WITH o as
	(
		SELECT
			COUNT(order_id) as total_orders,
			employee_id
		FROM
			orders
		GROUP BY
			employee_id
	)
SELECT
	e.first_name,
	e.last_name
FROM
	employees e
INNER JOIN
	o
ON e.employee_id = o.employee_id
WHERE
	o.total_orders > 50;

	
-- 4.
SELECT
	product_name
FROM
	products
WHERE 
	unit_price >
	(
		SELECT
			AVG(unit_price)
		FROM
			products
	);

	
-- 5.
SELECT
	order_id
FROM
	orders
WHERE
	order_date > '1998-01-01';


-- 6.
SELECT
	c.company_name,
	o.order_id
FROM
	customers c
LEFT JOIN
	orders o
ON c.customer_id = o.customer_id;


-- 7.
SELECT
	product_id,
	product_name
FROM
	products
ORDER BY
	product_name;


-- 8.
SELECT
	c.company_name
FROM
	customers c
WHERE (
		SELECT
			SUM(quantity*unit_price) as total
		FROM
			order_details od
		INNER JOIN
			orders o ON	od.order_id = o.order_id
		WHERE
			o.customer_id = c.customer_id
	) > 10000
ORDER BY
	c.company_name;

	
-- 9.
SELECT
	e.first_name,
	e.last_name,
	e.employee_id
FROM
	employees e
WHERE
	(
		SELECT
			COUNT(o.order_id)
		FROM
			orders o
		WHERE
			o.order_date > '1997-01-01'
		AND
			o.employee_id = e.employee_id
			
	) > 5
ORDER BY
	(
		SELECT
			COUNT(o.order_id)
		FROM
			orders o
		WHERE
			o.order_date > '1997-01-01'
		AND
			o.employee_id = e.employee_id
	) DESC


-- 10.
WITH o as
(
	SELECT
		order_id,
		customer_id
	FROM
		orders
	WHERE
		order_date > '1998-01-01'
)
SELECT
	c.company_name,
	c.country
FROM
	customers c
INNER JOIN
	o ON c.customer_id = o.customer_id
WHERE
	c.country = 'USA'

-- 11.
WITH o as 
(
	SELECT
		COUNT(order_id) as total_orders,
		customer_id
	FROM
		orders
	GROUP BY
		customer_id
)
SELECT
	o.total_orders,
	c.company_name,
	c.customer_id
FROM
	customers c
LEFT JOIN
	o ON c.customer_id = o.customer_id
ORDER BY
	total_orders DESC, c.company_name;

-- 12.
WITH a as 
(
	SELECT
		product_id
	FROM
		products
	WHERE
		unit_price > (SELECT AVG(unit_price) FROM products)
)
SELECT
	p.product_id,
	p.product_name,
	p.unit_price
FROM
	products p
INNER JOIN
	a ON a.product_id = p.product_id
ORDER BY
	p.unit_price DESC;

-- 13.
WITH od AS
(
	SELECT
		SUM(quantity*unit_price) AS order_total,
		order_id
	FROM
		order_details
	GROUP BY
		order_id
),
AvgOrderTotal AS 
(
	SELECT AVG(order_total) AS avg_total
	FROM od
)
SELECT
	o.order_id,
	od.order_total,
	CASE
		WHEN od.order_total > (SELECT avg_total FROM AvgOrderTotal)
		THEN True
		ELSE False
	END AS is_above_avg_orders_total
FROM
	orders o
INNER JOIN
	od ON od.order_id = o.order_id
WHERE
	o.order_date > '1998-01-01';


-- 14. 
SELECT
	et.territory_id,
	et.employee_id,
	e.employee_id
FROM
	employees e
FULL OUTER JOIN
	employee_territories et ON e.employee_id = et.employee_id;

-- 15.
SELECT
	product_name,
	units_on_order
FROM
	products
GROUP BY
	product_id
HAVING
	units_on_order > (SELECT AVG(units_on_order) FROM products)
ORDER BY
	units_on_order;



































	
