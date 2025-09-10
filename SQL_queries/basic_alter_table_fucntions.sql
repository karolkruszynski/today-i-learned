-- modify table / add new column
ALTER TABLE products_2014
ADD COLUMN weight INT;

SELECT *
FROM products_2014;

-- modify table / drop column
ALTER TABLE products_2014
DROP COLUMN weight;
