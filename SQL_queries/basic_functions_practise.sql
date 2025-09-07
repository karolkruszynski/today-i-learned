

-- Ex. 2.02
-- 1.
SELECT first_name, last_name, hire_date
FROM salespeople
WHERE dealership_id = 17
ORDER BY hire_date ASC
LIMIT 10;

-- 2.
SELECT first_name, last_name
FROM salespeople
WHERE hire_date > '2021-01-01' 
AND termination_date IS NULL
ORDER BY hire_date DESC;

-- 3.
SELECT first_name, last_name, hire_date
FROM salespeople
WHERE first_name LIKE 'Nic%'
AND hire_date BETWEEN '2021-01-01' AND '2021-12-31';


-- Task 2.01

-- 1.
SELECT email
FROM customers
WHERE state = 'FL';

-- 2.
SELECT first_name, last_name, email
FROM customers
WHERE state = 'NY'
AND city = 'New York City'
ORDER BY 2 ASC, 1 ASC;

SELECT first_name, last_name, phone
FROM customers
ORDER BY date_added ASC;






















