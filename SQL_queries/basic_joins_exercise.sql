-- Ex. 3.01
SELECT
	c.customer_id,
	c.first_name,
	c.last_name,
	c.phone
FROM
	customers c
INNER JOIN
	sales s ON c.customer_id = s.customer_id
INNER JOIN
	products p ON s.product_id = p.producT_id
WHERE
	p.product_type = 'automobile'
AND
	c.phone IS NOT NULL;
