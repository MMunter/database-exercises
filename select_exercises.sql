use codeup_test_db;

select 'These are all the albums by Pink Floyd' as 'Info';
select * from albums where artist = 'Pink Floyd';

select 'This is the year Sgt. Pepper''s Lonely Hearts Club Band was released' as 'Info';
select release_date from albums where name = 'Sgt. Pepper''s Lonely Hearts Club Band';

select 'The album Nevermind is classified as:' as 'Info';
select genre from albums where name = 'Nevermind';

select 'These albums were released in the 1990s:' as 'Info';
select * from albums where release_date BETWEEN 1990 and 1999;

select 'These are the Rock albums:' as 'Info';
select * from albums where genre = 'Rock';

