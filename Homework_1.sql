
Select product_name, manufacturer, price
From new_table
Where product_count > 2;

SELECT * FROM new_table
Where manufacturer = 'Samsung';

SELECT * FROM new_table
WHERE product_name LIKE '%iphone%';

SELECT * FROM new_table
WHERE manufacturer LIKE '%Samsung%';

SELECT * FROM new_table
WHERE product_name REGEXP '[0-9]';

SELECT * FROM new_table
WHERE product_name REGEXP '[8]';




