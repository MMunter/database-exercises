use employees;

select * from employees where (first_name = 'Irena' or first_name = 'Vidya' OR  first_name = 'Maya') and gender = 'M';

select * from employees where last_name like '%E' or last_name like 'E%';

select * from employees where last_name like '%E' and last_name like 'E%';

select * from employees where hire_date BETWEEN '1990-01-01' and '1999-12-31';

select * from employees where birth_date like '%-12-25';

select * from employees where last_name like '%q%';

select * from employees where birth_date like '%-12-25' and hire_date BETWEEN '1990-01-01' and '1999-12-31';

select * from employees where last_name like '%q%' and last_name not like '%qu%';