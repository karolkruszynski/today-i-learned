-- 1.
SELECT
	country,
	COUNT(*)
FROM
	customers
GROUP BY
	country;


-- 2.
SELECT
	o.customer_id,
	ROUND(SUM(od.quantity*od.unit_price)) as sum_value_of_orders
FROM
	orders o
INNER JOIN
	order_details od ON o.order_id = od.order_id
GROUP BY
	o.customer_id
ORDER BY
	sum_value_of_orders DESC;


-- 3.
SELECT
	product_id,
	SUM(quantity)
FROM
	order_details
GROUP BY
	product_id
ORDER BY
	2 DESC;


-- 4.
SELECT
	od.product_id,
	c.country,
	ROUND(SUM(od.quantity*od.unit_price)) as total_orders_value
FROM
	order_details od
INNER JOIN
	orders o ON od.order_id = o.order_id
INNER JOIN
	customers c ON o.customer_id = c.customer_id
GROUP BY
	c.country, od.product_id
ORDER BY
	1, 3 DESC;


-- 5.
SELECT
	EXTRACT(YEAR FROM order_date) AS order_year,
	EXTRACT(MONTH FROM order_date) AS order_month,
	CoUNT(*)
FROM
	orders
GROUP BY GROUPING SETS
(
	(EXTRACT(YEAR FROM order_date)),
	(EXTRACT(YEAR FROM order_date), EXTRACT(MONTH FROM order_date))
)
ORDER BY
	1, 2;


-- 6.
SELECT
	employee_id,
	customer_id,
	COUNT(*) as orders_count
FROM
	orders
GROUP BY GROUPING SETS
(
	(employee_id),
	(customer_id),
	() -- empty set count everything
)
ORDER BY
	1, 2;

	
-- 7.
WITH ordervalues as
(
	SELECT
		o.employee_id,
		o.order_id,
		SUM(od.quantity*od.unit_price) as order_value
	FROM
		order_details od
	INNER JOIN
		orders o ON od.order_id = o.order_id
	GROUP BY
		o.employee_id,
		o.order_id
	ORDER BY
		1, 2
)
SELECT
	employee_id,
	AVG(order_value) as avg_order_value,
	COUNT(order_id) as orders_count
FROM
	ordervalues
GROUP BY
	employee_id
HAVING
	COUNT(order_id) >= 10
ORDER BY
	2 DESC;



























