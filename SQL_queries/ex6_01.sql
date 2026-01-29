WITH customers_data as (
	SELECT 
	    *
	FROM 
	    public_trans_data p
	JOIN
		customers c
		ON p.zip_code = c.postal_code::bigint
	JOIN
		sales s
		ON c.customer_id = s.customer_id 	
)
SELECT
	AVG(cd.sales_amount) as xd,
		(SELECT
		AVG(cd.sales_amount) as xx
	FROM
		customers_data cd
	WHERE
		cd.public_transportation_pct <= 10)
FROM
	customers_data cd
WHERE
	cd.public_transportation_pct > 10