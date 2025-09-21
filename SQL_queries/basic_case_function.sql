-- CASE FUNCTION
--
SELECT
	CASE
		WHEN postal_code = '33111' THEN 'Client VIP'
		WHEN postal_code = '33124' THEN 'Client Premium'
		ELSE 'Basic Client'
	END AS customer_type,
	*
FROM
	customers
ORDER BY
	customer_id;

-- Ex. 3.03
SELECT
	c.customer_id,
	CASE
		WHEN c.state IN
		(
			'MA', 'NH', 'VT', 'ME', 'CT', 'RI'
		)
		THEN 'New England'
		WHEN c.state IN
		(
			'GA', 'FL', 'MS', 'AL', 'LA', 'KY', 'VA',
			'NC', 'SC', 'TN', 'VI', 'WV', 'AR'
		)
		THEN 'South-East'
		ELSE 'Other'
		END as region
FROM
	customers c
ORDER BY
	1;
	