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
			order_details od
		INNER JOIN
			orders o ON od.order_id = o.order_id
		WHERE
			c.customer_id = o.customer_id
	) > 10000
ORDER BY
	c.company_name;


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
			COUNT(*)
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
			COUNT(*)
		FROM
			orders o
		WHERE
			order_date > '1997-01-01'
		AND
			e.employee_id = o.employee_id
	) DESC;

-- 3.
SELECT
	p1.product_id,
	p1.product_name,
	p1.unit_price
FROM
	products p1
WHERE 
	p1.unit_price >
		(
			SELECT
				AVG(p2.unit_price)
			FROM
				products p2
		)
ORDER BY
	p1.unit_price DESC;

-- 4.
SELECT
	c.customer_id,
	c.company_name
FROM
	customers c
WHERE NOT EXISTS
	(
		SELECT
			o.order_id
		FROM
			orders o
		WHERE
			((order_date >= '1997-01-01'
		AND
			order_date <= '1997-12-31')
		AND
			c.customer_id = o.customer_id)
	)
ORDER BY
	c.customer_id, c.company_name;


-- 5.
SELECT
	p.product_id,
	p.product_name,
	AVG(od1.quantity) as AvgQuantity
FROM
	products p
INNER JOIN
	order_details od1 ON p.product_id = od1.product_id
GROUP BY 
	p.product_id,
	p.product_name
HAVING 
	AVG(od1.quantity) > 
	(
		SELECT
			AVG(od2.quantity)
		FROM
			order_details od2
	)

ORDER BY
	AvgQuantity DESC;
















	