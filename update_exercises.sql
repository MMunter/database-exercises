use codeup_test_db;

-- select 'These are all the albums' as 'Info';
-- select * from albums;
-- UPDATE albums
-- SET sales = sales * 10;

-- select 'These albums were released before 1980' as 'Info';
-- select * from albums where release_date < 1980;
-- UPDATE albums
-- SET release_date = release_date - 100
-- WHERE release_date < 1980;


select 'These are the albums by Michael Jackson' as 'Info';
select * from albums where artist = 'Michael Jackson';
UPDATE albums
SET artist = 'Peter Jackson'
WHERE artist = 'Michael Jackson';