
SELECT * FROM products;

SELECT model, product_id FROM products;

SELECT first_name
FROM customers
WHERE state='AZ'
ORDER BY first_name;

SELECT model
FROM products
WHERE year=2014;

SELECT model
FROM products
WHERE year<2014;

SELECT model
FROM products
WHERE year=2014
AND base_msrp<=1000;

SELECT model
FROM products
WHERE year=2014
OR product_type = 'automobile';

SELECT *
FROM products
WHERE year>2016
AND year<2018
OR product_type = 'scooter';

SELECT *
FROM products
WHERE (year>2016 AND year<2018)
OR product_type = 'scooter';

SELECT model
FROM products
WHERE year IN (2014, 2016, 2019);

SELECT model
FROM products
WHERE product_type IN ('scooter', 'automobile');

SELECT model, year
FROM products
WHERE year NOT IN (2014, 2016, 2019);

SELECT model, production_start_date
FROM products
ORDER BY production_start_date ASC;

SELECT model, production_start_date
FROM products
ORDER BY production_start_date DESC;

SELECT product_id, model
FROM products
ORDER BY 1; 	-- index tabeli po poleceniu SELECT

SELECT *
FROM products
ORDER BY year DESC, base_msrp ASC;

SELECT model
FROM products
ORDER BY production_start_date
LIMIT 5; -- używaj zawsze gdy nie znasz rozmiaru tabeli by nie zużywać zasobów.

SELECT *
FROM products
WHERE production_end_date IS NULL;

SELECT *
FROM products
WHERE production_end_date IS NOT NULL;


























