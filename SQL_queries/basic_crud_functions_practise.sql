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