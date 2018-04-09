use codeup_test_db;

create table if not exists users(
  id int unsigned AUTO_INCREMENT not null,
  email VARCHAR(100) unique not NULL ,
  password VARCHAR(50) not NULL,
  first_name VARCHAR(50) not null,
  last_name VARCHAR(50) not null,
  PRIMARY KEY (id)
);

create table if not EXISTS ads(
  id int unsigned AUTO_INCREMENT not null,
  title VARCHAR(50) not null,
  description text not null,
  user_id int UNSIGNED,
  PRIMARY KEY (id),
  foreign key (user_id) references users(id)
);

create table if not EXISTS categories(
  id int UNSIGNED AUTO_INCREMENT not null,
  name VARCHAR(50) not null,
  PRIMARY KEY (id)
);

create table if NOT EXISTS ad_category(
  ad_id INT UNSIGNED not NULL ,
  category_id INT UNSIGNED not null,
  foreign key (ad_id) references ads(id),
  FOREIGN KEY (category_id) references categories(id)
);

truncate users;
insert into users(email, password, first_name, last_name)
    VALUES ('Marcy@email.com', 'password', 'Marcy', 'Munter'),
          ('Mark@email.com', 'password', 'Mark', 'Munter'),
      ('Max@munter.com', 'password', 'Max', 'Munter'),
      ('Marcella@munter.com', 'password', 'Marcella', 'Munter');

truncate ads;
insert into ads(title, description, user_id)
    VALUES ('Title', 'This is a description', 1),
      ('Another Ad', 'I am selling something', 4),
      ('This is an ad', 'Something for sale, buy it now!', 2),
      ('Sale, sale , sale', 'Buy my stuff!  Hurry!!', 3),
      ('This is my other ad', 'Here is my description of the stuff.', 1);

TRUNCATE categories;
insert into categories(name)
    values('Help Wanted'),
      ('Giveaway'),
      ('Furniture'),
      ('Vehicle');

TRUNCATE ad_category;
insert into ad_category(ad_id, category_id)
    VALUES (1, 2), (2,3), (3,3), (4,1);

# For a given ad, what is the email address of the user that created it?
SELECT email FROM users WHERE id = (SELECT user_id FROM ads WHERE id = 3);
SELECT u.email FROM users u JOIN ads a ON a.user_id = u.id WHERE a.id = 3;

# For a given ad, what category, or categories, does it belong to?
SELECT name FROM categories WHERE id = (SELECT category_id FROM ad_category WHERE ad_id = 2);
SELECT name FROM categories c JOIN ad_category ac ON ac.category_id = c.id WHERE ac.ad_id = 2;

# For a given category, show all the ads that are in that category.
SELECT * FROM ads WHERE id in (SELECT ad_id FROM ad_category WHERE category_id = 3);
SELECT * FROM ads a JOIN ad_category ac ON a.id = ac.ad_id WHERE ac.category_id = 3;

# For a given user, show all the ads they have posted.
SELECT * FROM ads WHERE user_id = (SELECT id FROM users WHERE email = 'Marcy@email.com');
SELECT * FROM ads a JOIN users  u ON a.user_id = u.id WHERE u.email = 'Marcy@email.com';

drop table users;
drop table categories;
drop table ads;
drop table ad_category;