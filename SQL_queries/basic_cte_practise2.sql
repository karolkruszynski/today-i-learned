-- 1.
WITH p AS
(
	SELECT
		unit_price,
		product_id,
		product_name
	FROM
		products
	WHERE
		unit_price > 30
)
SELECT
	p.product_id,
	p.product_name,
	p.unit_price
FROM
	p
ORDER BY
	p.product_name;

-- 2.
WITH o AS
(
	SELECT
		COUNT(*) as orders_count,
		customer_id
	FROM
		orders
	GROUP BY
		customer_id
)
SELECT
	o.orders_count,
	o.customer_id,
	c.company_name
FROM
	customers c
INNER JOIN
	o ON o.customer_id = c.customer_id
ORDER BY
	o.orders_count DESC;

-- 3.
