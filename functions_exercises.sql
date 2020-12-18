#1. functions_exercises.sql

#2. Write a query to to find all current employees whose last name starts and ends with 'E'. Use concat() to combine their first and last name together as a single column named full_name.

SELECT CONCAT (first_name, " ", last_name) AS full_name
FROM employees
WHERE last_name LIKE 'e%e';

#3. Convert the names produced in your last query to all uppercase

SELECT UPPER (CONCAT (first_name, " ", last_name)) AS full_name
FROM employees
WHERE last_name LIKE 'e%e';

#4. Find all previous employees hired in the 90s and born on Christmas. Use datediff() function to find how many days they have been working at the company

SELECT first_name, last_name, (datediff(curdate(), hire_date)) AS days_worked
FROM employees
WHERE hire_date LIKE '199%'
	AND birth_date LIKE '%-12-25';

#5. Find the smallest and largest current salary from the salaries table.

SELECT min(salary), max(salary)
FROM salaries
WHERE to_date > curdate();

#6. Use your knowledge of built-in SQL functions to generate a username for all of the current and previous employees

SELECT LOWER(CONCAT(
			SUBSTR(first_name, 1, 1), 
			SUBSTR(last_name, 1, 4),
			'_', 
			SUBSTR(birth_date, 6, 2), 
			SUBSTR(birth_date, 3, 2) 	
			)) as userName, first_name, last_name, birth_date
FROM employees;

