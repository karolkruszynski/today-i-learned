-- NULLIF
--
SELECT
	customer_id,
	NULLIF(title, 'Honorable') as title,
	first_name,
	last_name,
	suffix,
	email,
	gender,
	phone,
	street_address,
	city,
	state,
	postal_code
FROM
	customers
ORDER BY
	1;

-- 
SELECT
	salesperson_id,
	NULLIF(suffix, 'Jr') as suffix
FROM
	salespeople;
