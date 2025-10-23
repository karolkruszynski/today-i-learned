-- HAVING
SELECT
	state,
	COUNT(*)
FROM
	customers
WHERE
	COUNT(*)>=1000
GROUP BY
	state
ORDER BY
	state;

-- Ex. 4.03
SELECT
	state,
	COUNT(*)
FROM
	customers
GROUP BY
	state
HAVING
	COUNT(*)>= 1000
ORDER BY
	state;

