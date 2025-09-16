-- CTE practise
-- 1.
WITH o as
(
	SELECT
		order_id,
		order_date,
		customer_id
	FROM
		orders
	WHERE
		order_date > '1997-01-01'
	AND
		order_date < '1998-01-01'
)
SELECT
	o.order_id,
	o.order_date,
	o.customer_id
FROM
	customers c
INNER JOIN
	o ON c.customer_id = o.customer_id
WHERE
	c.country = 'USA'
ORDER BY
	o.order_date;

-- 2.
WITH o as
(
	SELECT
		COUNT(order_id) as orders_amount,
		employee_id
	FROM
		orders
	GROUP BY
		employee_id
)
SELECT
	e.employee_id,
	o.orders_amount
FROM
	employees e
INNER JOIN
	o ON o.employee_id = e.employee_id
WHERE
	o.orders_amount > 100
ORDER BY
	o.orders_amount DESC;

-- 3.
WITH p as
(
	SELECT
		unit_price,
		product_id,
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
		)
)
SELECT
	p.product_id,
	p.product_name,
	p.unit_price
FROM
	p
ORDER BY
	p.unit_price DESC;












