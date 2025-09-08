-- insert new data into table
INSERT INTO products_2014 
(
product_id, model, year,
product_type, base_msrp,
production_start_date, production_end_date
)
VALUES 
(
13, 'Nimbus 5000', 2014, 'scooter',
500.00, '2014-03-03', '2020-03-03'
);

SELECT *
FROM products_2014;

-- we can insert data through using select
INSERT INTO products_2014
(
product_id, model, year,
product_type, base_msrp,
production_start_date, production_end_date
)
SELECT *
FROM products
WHERE year = 2016;