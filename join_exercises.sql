PART ONE:
# 1. Use the join_example_db. Select all the records from both the users and roles tables.

use join_example_db;

select *
from users;

select *
from roles;

# 2. Use join, left join, and right join to combine results from the users and roles tables

SELECT *
from users
join roles on users.role_id = roles.id;

SELECT *
from users
left join roles on users.role_id = roles.id;

SELECT *
from users
right join roles on users.role_id = roles.id;

# 3. Use count and the appropriate join type to get a list of roles along with the number of users that has the role

# does not work. moving on...
SELECT roles.name, count(role_id)
from users
right join roles on users.role_id = roles.id;
group by roles.name;

PART TWO:
# 1. Use the employees database

USE employees;

# 2. write a query that shows each department along with the name of the current manager for that department.

SELECT d.dept_name as 'Department Name', 
    CONCAT(e.first_name, ' ', e.last_name) AS 'Department Manager'
FROM employees AS e
JOIN dept_manager as dm
  ON dm.emp_no = e.emp_no
JOIN departments AS d
  ON d.dept_no = dm.dept_no 
WHERE dm.to_date > curdate()
ORDER BY d.dept_name;

# 3. Find the name of all departments currently managed by women

SELECT d.dept_name as 'Department Name', CONCAT(e.first_name, ' ', e.last_name) AS 'Department Manager'
FROM employees AS e
JOIN dept_manager as dm
  ON dm.emp_no = e.emp_no
JOIN departments AS d
  ON d.dept_no = dm.dept_no 
WHERE dm.to_date > curdate() AND e.gender = 'F'
ORDER BY d.dept_name;

# 4. Find the current titles of employees currently working in the Customer Service department

SELECT t.title AS 'Title', COUNT(*) AS Count
FROM dept_emp AS de
JOIN titles AS t 
	ON t.emp_no = de.emp_no
WHERE t.to_date > curdate()
	AND de.dept_no = 'd009'
GROUP BY t.title;

# 5. Find the current salary of all current managers.

SELECT d.dept_name AS 'Department Name', 
	CONCAT(e.first_name, ' ', e.last_name) AS 'Name',
	s.salary AS 'Salary'
FROM employees AS e
JOIN dept_manager AS dm
  ON dm.emp_no = e.emp_no
JOIN departments AS d
  ON d.dept_no = dm.dept_no
JOIN salaries AS s
  ON s.emp_no = e.emp_no
WHERE dm.to_date > curdate()
	AND s.to_date > curdate()
ORDER BY d.dept_name;

# 6. Find the number of current employees in each department.

SELECT d.dept_no, d.dept_name, COUNT(de.emp_no) AS 'num_employees'
FROM departments AS d
	JOIN dept_emp AS de ON de.dept_no = d.dept_no
WHERE de.to_date > curdate()
GROUP BY d.dept_no, d.dept_name;

# 7. Which department has the highest average salary? 


