use employees;

#2-all current department managers
select d.dept_name as 'Department Name', concat(e.first_name, ' ', e.last_name) as 'Department Manager'
from departments as d
join dept_manager as dm
ON dm.dept_no = d.dept_no
join employees as e
on e.emp_no = dm.emp_no
where dm.to_date like '9999-%-%'
ORDER BY d.dept_name;

#3-female department managers
select d.dept_name, concat(e.first_name, ' ', e.last_name) as full_name
from departments as d
  join dept_manager as dm
    ON dm.dept_no = d.dept_no
  join employees as e
    on e.emp_no = dm.emp_no
where dm.to_date like '9999-%-%' and e.gender = 'F'
ORDER BY d.dept_name;

#4-titles and counts of employees currently working in customer service department
select t.title as Title, count(*) as Count
from titles as t
  join employees as e
  on e.emp_no = t.emp_no
  join dept_emp as de
  on de.emp_no = t.emp_no
  join departments as d
  on de.dept_no = d.dept_no
where t.to_date like '9999-01-01' and de.dept_no = 'd009' and de.to_date like '9999-01-01'
group by title;

#5-find current salary of all current managers
select d.dept_name as 'Department Name', concat(e.first_name, ' ', e.last_name) as 'Name', s.salary as 'Salary'
from departments as d
join dept_manager as dm
on dm.dept_no = d.dept_no
join employees as e
on e.emp_no = dm.emp_no
join salaries as s
on s.emp_no = e.emp_no
where s.to_date = '9999-01-01' and dm.to_date = '9999-01-01'
ORDER BY d.dept_name;

# BONUS
SELECT CONCAT(e.first_name, ' ', e.last_name) as 'Employee Name', d.dept_name as 'Department Name', concat(em.first_name, ' ', em.last_name) as 'Manager Name'
from employees as e
join dept_emp as de
on de.emp_no = e.emp_no
join departments as d
on d.dept_no = de.dept_no
join dept_manager as dm
  on dm.dept_no = d.dept_no
  join employees as em
  on em.emp_no = dm.emp_no
where de.to_date = '9999-01-01' and dm.to_date = '9999-01-01'
ORDER BY d.dept_name;

