use employees;

select distinct title from titles;

select first_name, last_name
from employees where last_name like 'E%E'
GROUP BY first_name, last_name;

select last_name, count(*) from employees
where last_name like '%q%' AND
  last_name not like '%qu%'
GROUP BY last_name
order by count(*);

select count(gender), gender from employees where first_name in ('Irena', 'Vidya', 'Maya')
GROUP BY gender;
