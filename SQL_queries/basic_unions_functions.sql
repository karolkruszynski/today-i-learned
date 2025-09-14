-- UNION
(
SELECT
	street_address,
	city,
	state,
	postal_code
FROM
	customers
WHERE
	street_address IS NOT NULL
)
UNION
(
SELECT
	street_address,
	city,
	state,
	postal_code
FROM
	dealerships
WHERe
	street_address IS NOT NULL
)
ORDER BY
	1;

-- UNION removes duplicates
-- UNION ALL keeps duplicates
-- UNION's work only in the same name and dtypes in columns