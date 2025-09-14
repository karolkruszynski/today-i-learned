-- Ex 3.02
(
SELECT
	first_name,
	last_name,
	'Customer' as guest_type
FROM
	customers
WHERE
	city = 'Los Angeles'
AND
	state = 'CA'
)
UNION
(
SELECT
	first_name,
	last_name,
	'Salesman' as guest_type
FROM
	salespeople s
INNER JOIN
	dealerships d ON s.dealership_id = d.dealership_id
WHERE
	d.city = 'Los Angeles'
AND
	d.state = 'CA'
)