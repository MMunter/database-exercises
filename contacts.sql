use codeup_test_db;
create table if not exists contacts(
  id int(10),
  contact_name VARCHAR(50),
  phone_number int(10),
  email varchar(100),
  created_at datetime DEFAULT now(),
  updated_at datetime DEFAULT now()
  );