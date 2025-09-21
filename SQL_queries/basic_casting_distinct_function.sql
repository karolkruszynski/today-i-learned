-- CASTING
-- 
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

-- DISTINCT and DISTINCT ON
-- 
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
	1;

-- DISTINCT ON / alaways every row is unique by ex. first_name
--
SELECT
	DISTINCT ON (first_name)
	*
FROM
	salespeople
ORDER BY
	first_name, hire_date;
