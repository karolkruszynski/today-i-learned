-- Task 2.02
-- create table cusotmers_nyc get data from
-- customers table where client live in 
-- New York City and NY state
-- Delete from new table rows where clients
-- postal_code is 10014
-- Add new column Event
-- Set new column values for all client to Party


CREATE TABLE customers_nyc AS
(
SELECT *
FROM customers
WHERE city = 'New York City'
AND state = 'NY'
);

SELECT *
FROM customers_nyc;

DELETE FROM customers_nyc
WHERE postal_code = '10014';

ALTER TABLE customers_nyc
ADD COLUMN event TEXT;

UPDATE customers_nyc
SET event = 'Party';