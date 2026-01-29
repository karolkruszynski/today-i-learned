SELECT
	t.city,
	t.number_of_customers,
	SUM(s.sales_amount)
FROM
	sales s
JOIN
	customers c
	ON s.customer_id = c.customer_id
JOIN
	top_cities_data t
	ON c.city = t.city
GROUP BY
	1, 2
ORDER BY
	2 DESC;