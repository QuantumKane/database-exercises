tables_exercises.sql

# using the employees db
USE employees;

# listing all of the tables
SHOW tables;

# exploring the types of data in employees
describe employees;
# types of data in employees: int, date, varchar, enum

# tables containing numeric: departments, dept_emp, dept_manager, employees, employees_with_departments, salaries, titles

# tables containing strings: departments, employees, employees_with_departments, titles

# tables containing date: dept_emp, dept_manager, employees, salaries, titles

# The relationship between employees and departments: none at this time

# showing the SQL that created the dept_manager table
SHOW CREATE TABLE dept_manager;