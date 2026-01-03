-- 5
SELECT
	c.customer_id,
	c.company_name,
	MAX(o.order_date)
FROM
	customers c
LEFT JOIN
	orders o ON c.customer_id = o.customer_id
GROUP BY
	c.customer_id
ORDER BY
	c.company_name;

-- 6
SELECT
	product_name,
	unit_price
FROM
	products
WHERE
	unit_price > (SELECT AVG(unit_price) FROM products)
ORDER BY
	unit_price DESC;

-- 7.
SELECT
	customer_id,
	company_name
FROM
	customers
WHERE
	customer_id IN (SELECT customer_id  FROM orders GROUP BY customer_id HAVING COUNT(order_id) > 5)

-- 8.
WITH test as (
	SELECT
		order_id,
		SUM(unit_price*quantity)
	FROM
		order_details
	GROUP BY
		order_id
	HAVING
		SUM(unit_price*quantity) > 1000
)
SELECT
	t.order_id,
	o.customer_id,
	o.order_date
FROM
	test t
INNER JOIN
	orders o ON t.order_id = o.order_id
WHERE
	o.order_date > '01-01-1997'
	AND
	o.order_date <= '31-12-1997'


-- 9.
SELECT
	first_name,
	last_name,
	hire_date,
	CASE
		WHEN hire_date < '1994-01-01' THEN 'Senior'
		ELSE 'Junior'
	END as status
FROM
	employees;


-- 10.
SELECT
	o.employee_id,
	COUNT(o.order_id) as order_count
FROM
	employees e
INNER JOIN
	orders o ON e.employee_id = o.employee_id
GROUP BY
	o.employee_id
HAVING
	COUNT(o.order_id) > 50;


-- 11.
SELECT
	c.category_name,
	SUM(od.quantity) as total_quantity
FROM
	order_details od
INNER JOIN
	products p ON od.product_id = p.product_id
LEFT JOIN
	categories c ON p.category_id = c.category_id
GROUP BY
	c.category_name
ORDER BY
	total_quantity DESC;

-- 12.
SELECT
	COALESCE(country, 'TOTAL') AS country,
	COUNT(*) as customers_count
FROM
	customers
GROUP BY
	GROUPING SETS
	(
		(country),
		()
	)
ORDER BY
  CASE WHEN COALESCE(Country, 'TOTAL') = 'TOTAL' THEN 1 ELSE 0 END,
  customers_count DESC,
  Country









	