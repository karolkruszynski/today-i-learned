-- GROUPING SETS
(
SELECT
	state,
	NULL as gender,
	COUNT(*)
FROM
	customers
GROUP BY
	1, 2
ORDER BY 
	1, 2
)
UNION ALL
(
SELECT
	state,
	gender,
	COUNT(*)
FROM
	customers
GROUP BY
	1, 2
ORDER BY
	1, 2
)
ORDER BY
	1, 2

-- RIGHT WAY
SELECT
	state,
	gender,
	COUNT(*)
FROM
	customers
GROUP BY GROUPING SETS
(
	(state),
	(state, gender)
)
ORDER BY
	1, 2;

-- percenticl funct
SELECT
	PERCENTILE_CONT(0.5)
	WITHIN GROUP (ORDER BY base_msrp)
	AS median
FROM
	products;

































