use employees;

# concat max salaries of first two employees
select max(salary) as Salary
from salaries as s
join employees as e
on e.emp_no = s.emp_no
where s.emp_no in (select em.emp_no
                   from employees as em
                    where em.emp_no = '100001' OR em.emp_no = '100002')
group by s.emp_no;

# get current Sales Dept manager
select concat(e.first_name, ' ', e.last_name) as 'Sales Dept. Manager'
from employees as e
where emp_no in (select emp_no
                from dept_manager
                where dept_no = 'd007' and to_date > curdate());

# get all senior engineers in Customer Service Dept
select concat(e.first_name, ' ', e.last_name) as 'Employee Name'
from employees as e
join dept_emp as de
on de.emp_no = e.emp_no
join titles as t
on t.emp_no = e.emp_no
WHERE de.dept_no = 'd009' and t.title = 'Senior Engineer';

# get all first and last names of current Sales Dept employees
select concat(e.first_name, ' ', e.last_name) as 'Employee Name'
from employees as e
join dept_emp as de
on de.emp_no = e.emp_no
where de.dept_no = 'd007' and de.to_date > curdate();

# get the name of the employee with the highest salary
select concat(e.first_name, ' ', e.last_name)
from employees as e
join salaries as s
on s.emp_no = e.emp_no
where salary in (select max(salary)
                  from salaries);

# Most common birthday
select birth_date as DOB, count(birth_date) as Occurence
from employees
GROUP BY birth_date
ORDER BY Occurence DESC
limit 1;

# least common birthday
select birth_date as DOB, count(birth_date) as Occurence
from employees
GROUP BY birth_date
ORDER BY Occurence
limit 1;

# Average salary of managers by department
select d.dept_name as 'Department Name', avg(s.salary) as 'Average Manager Salary'
from salaries as s
join dept_manager as dm
on dm.emp_no = s.emp_no
join departments as d
on d.dept_no = dm.dept_no
GROUP BY d.dept_name;

# How many employees currently work in each department?
select d.dept_name as 'Department Name', count(*)
from departments as d
join dept_emp as de
on de.dept_no = d.dept_no
where de.to_date > curdate()
GROUP BY d.dept_name;

# Average salary for each department
select d.dept_name as 'Department Name', avg(s.salary) as 'Average Salary'
from salaries as s
join dept_emp as de
on de.emp_no = s.emp_no
join departments as d
on d.dept_no = de.dept_no
GROUP BY d.dept_name;

# Average salary in the 80s
select avg(s.salary) as 'Average Salary in the 1980s'
from salaries as s
where s.to_date like '198%';

# Average Salary in the 80s by department
select d.dept_name as 'Department Name', avg(s.salary) as 'Average Salary in the 1980s'
from departments as d
join dept_emp as de
on de.dept_no = d.dept_no
join salaries as s
on s.emp_no = de.emp_no
where s.to_date like '198%'
GROUP BY d.dept_name;

# How many times (on average) do employees switch titles?
select avg(CountOfTitles)
from (select COUNT(*) as CountOfTitles
      from titles as t
      join employees as e
      on e.emp_no = t.emp_no GROUP BY t.emp_no) as Average;

# How many times (on average) do employees get a raise?
select avg(CountofRaises)
from (select count(*) as CountofRaises
      from salaries as s
      join employees as e
      on e.emp_no = s.emp_no GROUP BY s.emp_no) as Average;

# What is the highest paying job title historically for women and men?
select t.title as 'Job Title'
from titles as t
join salaries as s
on s.emp_no = t.emp_no
where salary in (select max(salary) from salaries);

# Highest paying job for women?
select t.title as 'Job Title'
from titles as t
join salaries as s
on s.emp_no = t.emp_no
where salary in (select max(salary) from salaries
                  join employees as e
                  on e.emp_no = salaries.emp_no
                  where gender = 'F');

# Highest paying job for men
select t.title as 'Job Title'
from titles as t
join salaries as s
on s.emp_no = t.emp_no
where salary = (select max(salary) from salaries
                  join employees e
                  on e.emp_no = salaries.emp_no
                  where gender = 'M') LIMIT 1;

# Does the older half of current employees make more or less the younger half?
select max(salary) from salaries
join employees e ON salaries.emp_no = e.emp_no
where s.to_date > curdate();
#avg(unix_timestamp)-only for dates after 1/1/1970
SELECT avg(substr(e.birth_date, 1, 4)) from employees as e
#salary of employees from 1958+
select avg(salary) from salaries as s
join employees e ON s.emp_no = e.emp_no
where s.to_date > curdate() && e.birth_date >= '1958-01-01';

select avg(salary) from salaries as s
  join employees e ON s.emp_no = e.emp_no
where s.to_date > curdate() && e.birth_date < '1958-01-01';



