use employees;

#2, 3, & 4
select * from employees where first_name in ('Irena', 'Vidya', 'Maya')
order by last_name, first_name ASC;

select * from employees where (first_name = 'Irena' or first_name = 'Vidya' OR  first_name = 'Maya') and gender = 'M';

# last name starts with E
select * from employees where last_name like 'E%'
order by emp_no DESC ;

# last name starts with E or ends with E
select * from employees where last_name like '%E' or last_name like 'E%'
order by emp_no DESC ;

# last name starts with E AND ends with E
select * from employees where last_name like '%E' and last_name like 'E%'
# can also use last_name like 'E%E'
order by emp_no DESC ;

select * from employees where hire_date BETWEEN '1990-01-01' and '1999-12-31';
# can also use hire_date like '199%'

select * from employees where birth_date like '%-12-25';

select * from employees where last_name like '%q%';

select * from employees where birth_date like '%-12-25' and hire_date BETWEEN '1990-01-01' and '1999-12-31'
order by birth_date ASC, hire_date desc;

select * from employees where last_name like '%q%' and last_name not like '%qu%';