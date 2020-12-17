# where_exercises.sql

#1. use the employees database
USE `employees`;

#2. Find all employees with first names 'Irena', 'Vidya', or 'Maya' using IN
SELECT *
FROM `employees`
WHERE first_name IN ('Irena', 'Vidya', 'Maya');
# 709 rows returned

#3. Find all employees with first names 'Irena', 'Vidya', or 'Maya', use OR
SELECT *
FROM `employees`
WHERE first_name = 'Irena'
	OR first_name = 'Vidya'
	OR first_name = 'Maya';
# 709 rows returned, as expected

#4. Find all employees with first names 'Irena', 'Vidya', or 'Maya', using OR, and who is male
SELECT *
FROM `employees`
WHERE (first_name = 'Irena'
	OR first_name = 'Vidya'
	OR first_name = 'Maya')
AND gender = 'M';
# 441 rows returned

#5. Find all current or previous employees whose last name starts with 'E'
SELECT *
FROM `employees`
WHERE `last_name` LIKE 'E%';
# 7330 rows returned

#6. Find all current or previous employees whose last name starts or ends with 'E'
SELECT *
FROM `employees`
WHERE `last_name` LIKE 'E%'
	OR last_name LIKE '%e';
# 30723 rows retuned
# 23393 rows returned when the last names starting with "E" were removed

#7. Find all employees whose last name starts and ends with 'E'.
SELECT *
FROM `employees`
WHERE `last_name` LIKE 'E%'
	AND last_name LIKE '%e';
# 899 rows returned
# 24292 rows returned when we searched for all last names ending with "e"

#8. Find all current or previous employees hired in the 90s.
SELECT * 
FROM employees
WHERE hire_date BETWEEN '1990-01-01' AND '1999-12-31';
# 135214 rows returned

#9. Find all current or previous employees born on Christmas.
SELECT * 
FROM employees
WHERE birth_date LIKE '%-12-25';
# 842 rows returned

#10. Find all current or previous employees hired in the 90s and born on Christmas
SELECT * 
FROM employees
WHERE hire_date BETWEEN '1990-01-01' AND '1999-12-31'
	AND birth_date LIKE '%-12-25';
# 362 rows returned

#11. Find all current or previous employees with a 'q' in their last name
SELECT *
FROM `employees`
WHERE last_name LIKE '%q%';
# 1873 rows returned

#12. Find all current or previous employees with a 'q' in their last name but not 'qu'.
SELECT *
FROM employees
WHERE last_name LIKE '%q%' 
AND last_name NOT LIKE '%qu%';
# 547 rows returned