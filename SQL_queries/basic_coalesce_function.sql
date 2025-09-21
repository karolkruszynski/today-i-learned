-- COALESCE
--
SELECT
	first_name,
	last_name,
	COALESCE(phone, 'MISSING NUMBER') as phone
FROM
	customers
ORDER BY
	1;

SELECT
	last_name,
	COALESCE(title, 'missing') as title
FROM
	salespeople
