use codeup_test_db;
select 'These are the albums released after 1991' as 'Info';
delete from albums where release_date > 1991;

select 'Disco Albums:' as 'Info';
delete from albums where genre = "disco";

select 'Albums by Alanis Morrissette' as 'Info';
delete from albums where artist = "Alanis Morrisette";
