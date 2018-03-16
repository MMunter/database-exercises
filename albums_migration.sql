USE codeup_test_db;
drop table if exists albums;
create table if not exists albums(
  id int unsigned auto_increment,
  artist VARCHAR(100),
  name VARCHAR (100),
  release_date int,
  sales FLOAT,
  genre VARCHAR (50),
  PRIMARY KEY (id)
);
