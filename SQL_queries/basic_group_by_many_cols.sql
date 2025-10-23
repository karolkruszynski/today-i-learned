-- GROUP BY for many columns
SELECT
	state,
	gender,
	COUNT(*)
FROM
	customers
GROUP BY
	state, gender
ORDER BY
	state, gender;

-- Ex 4.02
SELECT
	product_type,
	MAX(base_msrp),
	MIN(base_msrp),
	AVG(base_msrp),
	STDDEV(base_msrp)
FROM
	products
GROUP BY
	product_type
ORDER BY
	product_type;