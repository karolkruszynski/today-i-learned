-- deleting value from row
UPDATE customers SET
email = NULL
WHERE customer_id = 3;

-- deleting rows from table
DELETE FROM products_2014
WHERE product_type = 'scooter';

-- erase all data from table
DELETE FROM products_2014;
-- or
TRUNCATE TABLE products_2014;

-- Delete table
DROP TABLE products_2014;

-- Ex. 2.05
DROP TABLE state_populations;

SELECT *
FROM state_populations;

DROP TABLE products_2022;
