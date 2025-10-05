-- DATA TRANSFORMATION

-- CASTING
SELECT
	product_id,
	model,
	year::TEXT,
	product_type,
	base_msrp,
	production_start_date,
	production_end_date
FROM
	products;

-- DISTINCT
SELECT
	DISTINCT year
FROM
	products
ORDER BY
	1;

SELECT
	DISTINCT year, product_type
FROM	
	products
ORDER BY
	1, 2;

-- DISTINCT ON
SELECT
	DISTINCT ON (first_name)
	*
FROM
	salespeople
ORDER BY
	first_name, hire_date;