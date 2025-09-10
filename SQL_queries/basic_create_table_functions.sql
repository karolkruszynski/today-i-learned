CREATE TABLE state_populations (
state VARCHAR(2) PRIMARY KEY,
population NUMERIC
);

-- Ex 2.03
DROP TABLE IF EXISTS countires;

CREATE TABLE countires (
key INT PRIMARY KEY,
name TEXT UNIQUE,
founding_year INT,
capital TEXT
);


CREATE TABLE products_2014 AS
(
SELECT *
FROM products
WHERE year = 2014
);

DROP TABLE IF EXISTS products_2014;

-- short version of creating table from existing data
SELECT *
INTO products_2014
FROM products
WHERE year = 2014;

-- how to verify data type from tables
SELECT COLUMN_NAME, DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'products_2014';


