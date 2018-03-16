use codeup_test_db;
drop table if exists pizza_order;
create table if not exists pizza_order(
  name varchar(50),
  phone_number int(10),
  email varchar(100),
  address VARCHAR(50),
  pizza_size VARCHAR(10),
  total_cost decimal(3,2),
  description varchar(100),
  isDelivered TINYINT(1),
  created_at DATETIME DEFAULT now(),
  updated_at DATETIME DEFAULT now()
);
