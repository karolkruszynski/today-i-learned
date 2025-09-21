-- CASE PRACTISE
-- 1.
SELECT
	product_id,
	product_name,
	unit_price,
	CASE
		WHEN unit_price < 20 THEN 'low'
		WHEN unit_price > 20 AND unit_price <= 50
		THEN 'medium'
		WHEN unit_price > 50 THEN 'high'
		END as price_category
FROM
	products
ORDER BY
	price_category, category_id, unit_price DESC;

-- 2.
SELECT
	order_id,
	freight,
	order_date,
	CASE
		WHEN freight < 50 THEN 'cheap'
		WHEN freight > 50 AND freight <= 100 THEN 'normal'
		ELSE 'expensive'
		END as freight_status
FROM
	orders
WHERE
	freight IS NOT NULL
ORDER BY
	freight_status, order_date ASC;

-- 3.
SELECT
	employee_id,
	first_name,
	last_name,
	title,
	CASE
		WHEN hire_date > '1994-01-01' THEN 'junior'
		ELSE 'senior'
		END as seniority
FROM
	employees
ORDER BY
	seniority, last_name;