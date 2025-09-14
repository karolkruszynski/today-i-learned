-- CROSS JOIN
SELECT
	p1.product_id, p1.model,
	p2.producT_id, p2.model
FROM
	products p1
CROSS JOIN
	products p2;