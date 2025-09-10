-- 1.
DROP TABLE IF EXISTS recentorders;
CREATE TABLE recentorders AS
SELECT *
FROM orders
WHERE order_date <= '1998-12-31'
AND order_date >= '1997-01-01';

SELECT *
FROM recentorders;

-- 2.
ALTER TABLE customers
ADD COLUMN customer_type TEXT;

SELECT customer_type
FROM customers;

-- 3.

INSERT INTO categories
(category_id, category_name, description)
VALUES
(9, 'Organic Food',
'Natural and organic consumables');

SELECT * FROM categories;

-- 4.
ALTER TABLE products
ADD COLUMN is_discontinued boolean;

UPDATE products SET
is_discontinued = True
WHERE units_in_stock = 0;

SELECT *
FROM products;

-- 5.
DELETE FROM employees
WHERE employee_id = 8;

DROP TABLE recentorders;


-- 6.
CREATE TABLE top_suppliers AS
SELECT *
FROM suppliers
WHERE country = 'USA';

-- 7.
ALTER TABLE orders
ADD COLUMN is_express boolean;

SELECT *
FROM orders;

UPDATE orders SET
is_express = True;

-- 8.
DELETE FROM orders
WHERE order_date < '1996-01-01';

-- 9.
SELECT customer_id, company_name, city
FROM customers
WHERE fax IS NOT NULL
ORDER BY city ASC;

-- 10.
SELECT product_name, unit_price, units_in_stock
FROM products
WHERE units_in_stock > 0
AND unit_price > 20
ORDER BY unit_price DESC;

-- 11.
SELECT order_id, customer_id, order_date, shipped_date
FROM orders
WHERE shipped_date IS NULL
AND order_date < '1999-01-01'
ORDER BY order_date ASC;
