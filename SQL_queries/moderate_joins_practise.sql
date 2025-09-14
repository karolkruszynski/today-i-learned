-- 1.
SELECT
	o.order_id,
	o.order_date,
	c.company_name,
	c.country,
	o.ship_country
FROM
	customers c
INNER JOIN
	orders o ON c.customer_id = o.customer_id
WHERE
(
	(o.order_date >= '1998-01-01'
	AND
	o.order_date <= '1998-12-31')
	OR
	c.country = 'Germany'
)
AND
	o.ship_country != 'USA'
ORDER BY
	o.order_date DESC;

-- 2.
SELECT
	p.product_name,
	c.category_name,
	p.units_in_stock,
	p.unit_price
FROM
	products p
INNER JOIN
	categories c ON p.category_id = c.category_id
WHERE
(
	(p.units_in_stock > 10
	AND
	p.unit_price > 50)
	OR
	c.category_name = 'Beverages'
)
ORDER BY
	c.category_name ASC, p.units_in_stock DESC;


-- 3.
SELECT
	e.employee_id,
	e.first_name,
	e.last_name,
	o.order_id,
	e.country,
	e.region
FROM
	employees e
INNER JOIN
	orders o ON e.employee_id = o.employee_id
WHERE
(
	(e.region IS NULL
	OR
	e.country = 'France')
	AND
	o.order_date > '1997-01-01'
)
ORDER BY
	e.last_name ASC, o.order_id DESC;
	