use bonus_db;

select 'Sold products' as 'Info';
select * from products where isSold = true;

select 'Products over $100' as 'Info';
select * from products where price > 100;

select name, isSold from products where id = 7;

select 'Price for Dog' as 'Info';
select price from products where name = 'dog';

select 'Sold status for all products over 199' as 'Info';
select isSold from products where price > 199;

