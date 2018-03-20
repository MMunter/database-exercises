use bonus_db;

update products
set price = 0
where id < 3;

update products
set name = 'ps4', price = 500.00, isSold = FALSE
where id = '7';

update products
set isSold = false;

UPDATE products
SET isSold = TRUE
WHERE price > 200.00;