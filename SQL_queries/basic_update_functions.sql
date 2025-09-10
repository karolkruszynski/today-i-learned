-- update data 
UPDATE products_2014
SET base_msrp = 299.99
WHERE product_type = 'scooter'
AND year < 2018;

SELECT *
FROM products_2014;

-- Ex. 2.04
CREATE TABLE products_2022 AS
(
SELECT *
FROM products
WHERE year = 2022
);

UPDATE products_2022 
SET base_msrp = base_msrp*1.10
WHERE model = 'Model Chi'
AND year = 2022;

SELECT *
FROM products_2022
WHERE model = 'Model Chi'
AND year = 2022;