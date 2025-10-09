-- AGGREGATING FUNCTION
SELECT
	COUNT(*)
FROM
	customers
WHERE
	state = 'CA';

SELECT
	COUNT(*)/2
FROM
	customers;

SELECT
	SUM(base_msrp)/COUNT(*) AS avg_base_msrp
FROM
	products;

SELECT
	COUNT(customer_id)
FROM
	customers;

SELECT
	COUNT(*)
FROM
	customers;

SELECT
	COUNT(DISTINCT state)
FROM
	customers;

SELECT
	COUNT(customer_id)::numeric / COUNT(DISTINCT state)
FROM
	customers;
-- we need to convert int to numeric to get the precision number

SELECT
	COUNT(customer_id) / COUNT(DISTINCT state)
FROM
	customers;

-- or we can multiply by 1.0
SELECT
	COUNT(customer_id) * 1.0 / COUNT(DISTINCT state)
FROM
	customers;








































	