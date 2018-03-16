USE codeup_test_db;
drop table if exists albums;
create table if not exists albums(
  id int unsigned not null auto_increment,
  artist VARCHAR(100),
  name VARCHAR (100),
  release_date INT(11),
  sales DECIMAL (6,2),
  genre VARCHAR (100),
  PRIMARY KEY (id)
);
