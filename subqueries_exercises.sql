use employees;

#1-Find all employees with same hire_date as emp_no 101010
select first_name, last_name, hire_date
from employees
where hire_date in(select hire_date
                   from employees
                   where emp_no = '101010');

#2-Find all titles held by employees with first name Aamod
select title
from titles
where emp_no in(select emp_no
                    from employees
                    where first_name = 'Aamod');

#3-Find all current female department managers
select first_name, last_name
from employees
where emp_no in(select emp_no
                from dept_manager
                where gender = 'F' and to_date > curdate());

# BONUS - #1
SELECT dept_name
from departments
where dept_no in (select dept_no
                  from dept_manager
                  join employees as e
                  on e.emp_no = dept_manager.emp_no
                  where e.gender = 'F' and dept_manager.to_date > curdate());

# BONUS - #2
select first_name, last_name
from employees
join salaries as s
on s.emp_no = employees.emp_no
where salary in (select max(salary) from salaries);


