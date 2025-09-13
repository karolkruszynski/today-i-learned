-- INNER JOIN 
-- 1.
SELECT
	o.order_id,
	o.order_date,
	c.customer_id,
	c.company_name
FROM 
	orders o
INNER JOIN
	customers c ON o.customer_id = c.customer_id
WHERE
	o.order_date > '1997-01-01'
ORDER BY
	o.order_date ASC;

-- 2.
SELECT
	p.product_name,
	c.category_name
FROM
	products p
INNER JOIN
	categories c ON p.category_id = c.category_id
WHERE
	p.unit_price > 30
ORDER BY
	p.product_name ASC;

-- 3.
SELECT
	e.employee_id,
	e.first_name,
	e.last_name,
	r.region_description
FROM
	employees e
INNER JOIN
	employee_territories et ON e.employee_id = et.employee_id
INNER JOIN
	territories t ON et.territory_id = t.territory_id
INNER JOIN
	region r ON t.region_id = r.region_id
WHERE
	r.region_id IS NOT NULL
ORDER BY
	e.last_name ASC;



-- LEFT OUTER JOIN
-- 1.
SELECT
	c.customer_id,
	c.company_name,
	o.order_id,
	o.order_date
FROM
	customers c
LEFT JOIN
	orders o ON c.customer_id = o.customer_id
ORDER BY
	c.company_name ASC;

-- 2.
SELECT
	p.product_name,
	s.company_name,
	s.supplier_id
FROM
	products p
LEFT JOIN
	suppliers s ON p.supplier_id = s.supplier_id
ORDER BY
	p.product_name ASC;

-- 3.
SELECT
	e.employee_id,
	e.first_name,
	e.last_name,
	t.territory_description
FROM
	employees e
LEFT JOIN
	employee_territories et ON e.employee_id = et.employee_id
LEFT JOIN
	territories t ON et.territory_id = t.territory_id
ORDER BY
	e.last_name;


-- RIGHT OUTER JOIN
-- 1.
SELECT
	o.order_id,
	o.order_date,
	e.employee_id,
	e.last_name
FROM
	employees e
RIGHT JOIN
	orders o ON e.employee_id = o.employee_id
ORDER BY
	o.order_date DESC;

-- 2.
SELECT
	c.category_id,
	c.category_name,
	p.product_name
FROM
	products p
RIGHT JOIN
	categories c ON p.category_id = c.category_id
ORDER BY
	c.category_name;

-- 3.
SELECT
	t.territory_id,
	t.territory_description,
	e.employee_id,
	e.last_name
FROM
	employees e
RIGHT JOIN
	employee_territories et ON e.employee_id = et.employee_id
RIGHT JOIN
	territories t ON et.territory_id = t.territory_id
ORDER BY
	t.territory_description;


-- FULL OUTER JOIN
-- 1.
SELECT
	c.customer_id,
	c.company_name,
	o.order_id,
	o.order_date
FROM
	customers c
FULL OUTER JOIN
	orders o ON c.customer_id = o.customer_id
ORDER BY
	c.company_name ASC;

-- 2.
SELECT
	p.product_name,
	s.company_name
FROM
	products p
FULL OUTER JOIN
	suppliers s ON p.supplier_id = s.supplier_id
ORDER BY
	p.product_name;

-- 3.
SELECT
	e.employee_id,
	e.first_name,
	e.last_name,
	t.territory_description
FROM
	employees e
FULL OUTER JOIN
	employee_territories et ON e.employee_id = et.employee_id
FULL OUTER JOIN
	territories t ON et.territory_id = t.territory_id
ORDER BY
	e.last_name;