-- LEAST and GREATEST
--
SELECT
	product_id,
	model,
	year,
	product_type,
	LEAST(600.00, base_msrp) as base_msrp,
	production_start_date,
	production_end_date
FROM
	products
WHERE
	product_type = 'scooter'
ORDER BY
	1;

SELECT
	product_id,
	model,
	year,
	product_type,
	GREATEST(600.00, base_msrp) as base_msrp
FROM
	products
WHERE
	product_type = 'scooter'
ORDER BY
	1;