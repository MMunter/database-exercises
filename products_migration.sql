use bonus_db;
create table if not exists products(
  id int unsigned not null auto_increment,
  name varchar(100) not null,
  price decimal(6,2) not null,
  isSold TINYINT(1) not null,
  PRIMARY key(id)
);