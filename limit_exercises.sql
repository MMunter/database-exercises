use employees;

select DISTINCT last_name from employees
order by last_name DESC
LIMIT 10;

select * from employees where birth_date like '%-12-25' and hire_date BETWEEN '1990-01-01' and '1999-12-31'
order by birth_date ASC, hire_date desc
limit 5 offset 45;


