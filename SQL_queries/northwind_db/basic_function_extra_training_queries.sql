-- 1.
SELECT customer_id, company_name, city, country
FROM customers
WHERE (city LIKE 'A%'
OR city LIKE 'B%')
AND country IN ('Germany', 'France')
ORDER BY company_name ASC
LIMIT 25;

-- 2.
SELECT product_id, product_name, unit_price,
units_in_stock
FROM products
WHERE (unit_price >= 20 
AND unit_price <= 50)
AND units_in_stock > 0
ORDER BY 3 DESC, 2 ASC;

-- 3.
SELECT product_id, product_name, discontinued,
units_in_stock
FROM products
WHERE discontinued = 1
OR units_in_stock = 0
ORDER BY discontinued DESC, product_name ASC;

-- 4.
SELECT order_id, customer_id, order_date,
shipped_date
FROM orders
WHERE shipped_date IS NULL
ORDER BY order_date DESC
LIMIT 20;


-- 5.
SELECT order_id, ship_country, freight,
shipped_date
FROM orders
WHERE ship_country IN ('USA','UK','Brazil')
AND freight > 100
ORDER BY freight DESC
LIMIT 15;


-- 6.
SELECT supplier_id, company_name, region, fax
FROM suppliers
WHERE fax IS NULL
OR region IS NULL
ORDER BY company_name ASC;

-- 7.
SELECT employee_id, last_name, first_name,
title, city, reports_to
FROM employees
WHERE (title LIKE '%Sales%'
AND city IN ('London','Seattle'))
OR reports_to IS NULL
ORDER BY last_name ASC, first_name ASC;

-- 8.
SELECT category_id, category_name, description
FROM categories
WHERE description LIKE '%beverage%'
OR description LIKE '%sweet%'
ORDER BY category_name ASC;

-- 9.
SELECT shipper_id, company_name, phone
FROM shippers
WHERE phone LIKE '(503)%'
OR phone LIKE '%555%'
ORDER BY company_name
LIMIT 10;

-- 10.
SELECT order_id, product_id, unit_price,
quantity, discount
FROM order_details
WHERE (discount > 0
AND unit_price > 30)
OR quantity >= 60
ORDER BY discount DESC, quantity DESC;



























