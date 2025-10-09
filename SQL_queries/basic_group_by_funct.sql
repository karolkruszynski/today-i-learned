-- GROUP BY
SELECT
	DISTINCT state
FROM
	customers;

-- very slow option
SELECT
	COUNT(*)
FROM
	customers
WHERE
	state = '{state}';
-- ex. state = 'CA' and so on

--
SELECT
	state,
	COUNT(*)
FROM
	customers
GROUP BY
	state;

-- key is result of function
SELECT
	TO_CHAR(date_added, 'YYYY'),
	COUNT(*)
FROM
	customers
GROUP BY
	TO_CHAR(date_added, 'YYYY')
ORDER BY
	1;

-- we can use number of column as a key
SELECT
	state,
	COUNT(*)
FROM
	customers
GROUP BY
	1;

--
SELECT
	state,
	COUNT(*)
FROM
	customers
GROUP BY
	state
ORDER BY
	state;

SELECT
	state,
	COUNT(*)
FROM
	customers
GROUP BY
	1
ORDER BY
	1;

SELECT
	state,
	COUNT(*)
FROM
	customers
GROUP BY
	1
ORDER BY
	2;

-- COUNT SUB GROUP
SELECT
	state,
	COUNT(*)
FROM
	customers
WHERE
	gender = 'M'
GROUP BY
	state
ORDER BY
	state;




































	

















































	