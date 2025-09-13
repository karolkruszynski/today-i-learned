-- LEFT OUTER JOIN
SELECT *
FROM customers c
LEFT OUTER JOIN
emails e ON e.customer_id = c.customer_id
ORDER BY c.customer_id
LIMIT 1000;

SELECT
	c.customer_id,
	c.title,
	c.first_name,
	c.last_name,
	c.suffix,
	c.email,
	e.email_id,
	e.email_subject,
	e.opened,
	e.clicked,
	e.bounced,
	e.sent_date,
	e.opened_date,
	e.clicked_date
FROM
	customers c
LEFT OUTER JOIN
	emails e ON c.customer_id = e.customer_id
WHERE
	e.customer_id IS NULL
ORDER BY
	c.customer_id
LIMIT
	1000;


-- RIGHT OUTER JOIN

SELECT
	c.customer_id,
	c.title,
	c.first_name,
	c.last_name,
	c.suffix,
	c.email,
	e.email_id,
	e.email_subject,
	e.opened,
	e.clicked,
	e.bounced,
	e.sent_date,
	e.opened_date,
	e.clicked_date
FROM
	emails e
RIGHT OUTER JOIN
	customers c ON c.customer_id = e.customer_id
WHERE
	e.customer_id IS NULL
ORDER BY 
	c.customer_id
LIMIT
	1000;


-- FULL OUTER JOIN
SELECT
	*
FROM
	emails e
FULL OUTER JOIN
	customers c ON e.customer_id = c.customer_id
LIMIT
	1000;