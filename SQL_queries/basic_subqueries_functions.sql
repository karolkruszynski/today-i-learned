-- SUBQUERIES
SELECT
	*
FROM
	salespeople
INNER JOIN 
(
	SELECT
		*
	FROM
		dealerships
	WHERE
		dealerships.state = 'CA'
) d
ON d.dealership_id = salespeople.dealership_id
ORDER BY
	1;


-- IN operator with single column query result
SELECT
	*
FROM
	salespeople
WHERE
	dealership_id IN
(
	SELECT dealership_id
	FROM dealerships
	WHERE dealerships.state = 'CA'
)
ORDER BY
	1;