-- 1.
SELECT
	c.customer_id,
	c.company_name
FROM
	customers c
WHERE
	(
	SELECT 
		SUM(od.unit_price * od.quantity)
	FROM
		orders o
	INNER JOIN
		order_details od ON o.order_id = od.order_id
	WHERE
		o.customer_id = c.customer_id
	) > 10000
ORDER BY
	c.company_name ASC;

-- 2.
SELECT
	e.employee_id,
	e.first_name,
	e.last_name
FROM
	employees e
WHERE
	(
	SELECT
		COUNT(order_id)
	FROM
		orders o
	WHERE
		order_date > '1997-01-01'
	AND
		e.employee_id = o.employee_id
	) > 5
ORDER BY
	(
	SELECT
		COUNT(o.order_id)
	FROM
		orders o
	WHERE
		e.employee_id = o.employee_id
	AND
		o.order_date > '1997-01-01'
	) DESC;

-- 3.
SELECT
	product_id,
	product_name,
	unit_price
FROM
	products
WHERE unit_price >
	(
	SELECT
		AVG(unit_price)
	FROM
		products
	)
ORDER BY
	unit_price DESC;