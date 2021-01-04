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



