use bonus_db;
truncate products;
insert into products(name, price, isSold)
VALUES ('bike', 250.00, true),
      ('cat', 100.00, FALSE),
      ('bat', 30.00, true),
      ('fish', 50.00, false),
      ('NES', 200.00, true),
      ('N64', 300.00, false),
      ('PS3', 400.00, true),
      ('dog', 75.00, false),
      ('drill', 60.00, false);