-- Task 3.01
--

SELECT 
	c.*, 
	p.*, 
	COALESCE(s.dealership_id, -1) as sales_dealership,
	CASE WHEN sales_amount < (base_msrp - 500) THEN 1
	ELSE 0 
	END as high_savings
FROM 
	sales s 
LEFT JOIN 
	dealerships d ON s.dealership_id = d.dealership_id
INNER JOIN 
	customers c ON c.customer_id = s.customer_id 
INNER JOIN 
	products p ON s.product_id = p.product_id