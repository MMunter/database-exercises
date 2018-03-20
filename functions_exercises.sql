use employees;

# last name starts with E AND ends with E
select concat(first_name,  ' ', last_name) from employees where last_name like '%E' and last_name like 'E%';
# can also use last_name like 'E%E'
# order by emp_no DESC

select concat(first_name, ' ', last_name, ' has worked here for ', datediff(now(), hire_date), ' days.')
from employees
where birth_date
      like '%-12-25' and hire_date BETWEEN '1990-01-01' and '1999-12-31'
order by birth_date ASC, hire_date desc;



