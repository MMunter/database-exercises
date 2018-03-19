use codeup_test_db;

select 'These are all the albums by Pink Floyd' as 'Info';
select name from albums where artist = 'Pink Floyd';

select 'This is the year Sgt. Pepper''s Lonely Hearts Club Band was released' as 'Info';
select release_date from albums where name = 'Sgt. Pepper''s Lonely Hearts Club Band';

select 'The album Nevermind is classified as:' as 'Info';
select genre from albums where name = 'Nevermind';

select 'These albums were released in the 1990s:' as 'Info';
select * from albums where release_date BETWEEN 1990 AND 1999;

select 'These albums have less than 20 million certified sales' as 'Info';
select * from albums where sales < 20;

select 'These are the Rock albums:' as 'Info';
select * from albums where genre like '%Rock%';

