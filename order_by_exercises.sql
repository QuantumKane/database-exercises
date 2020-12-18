order_by_exercises.sql


#2. Find all employees with first names 'Irena', 'Vidya', or 'Maya', and order your results returned by first name
SELECT *
FROM `employees`
WHERE first_name IN ('Irena', 'Vidya', 'Maya')
ORDER BY first_name;

# First record: Irena Reutenauer
# Last record: Vidya Simmen

#3. Find all employees with first names 'Irena', 'Vidya', or 'Maya', and order your results returned by first name and then last name
SELECT *
FROM `employees`
WHERE first_name IN ('Irena', 'Vidya', 'Maya')
ORDER BY first_name, last_name;

# First record: Irena Acton
# Last record: Vidya Zweizig


#4. Find all employees with first names 'Irena', 'Vidya', or 'Maya', and order your results returned by last name and then first name.
SELECT *
FROM `employees`
WHERE first_name IN ('Irena', 'Vidya', 'Maya')
ORDER BY last_name, first_name;

# First record: Irena Acton
# Last record: Maya Zyda

#5. Write a query to to find all employees whose last name starts and ends with 'E'. Sort the results by their employee number
SELECT *
FROM `employees`
WHERE `last_name` LIKE 'E%'
	AND last_name LIKE '%e'
ORDER BY emp_no;

# Number of records: 899
# First record: 10021 Ramzi Erde
# Last record: 499648 Tadahiro Erde

#6. Write a query to to find all employees whose last name starts and ends with 'E'. Sort the results by their hire date, so that the newest employees are listed first
SELECT *
FROM `employees`
WHERE `last_name` LIKE 'E%'
	AND last_name LIKE '%e'
ORDER BY hire_date DESC;

# Number of records: 899
# Newest employee: Teiji Eldridge
# Oldest employee: Sergi Erde


#7. Find all employees hired in the 90s and born on Christmas. Sort the results so that the oldest employee who was hired last is the first result.
SELECT * 
FROM employees
WHERE hire_date BETWEEN '1990-01-01' AND '1999-12-31'
	AND birth_date LIKE '%-12-25'
ORDER BY hire_date;

# Number of records returned: 362
# Oldest employee who was hired last: Khun Bernini
# Youngest emmployee who was hired first: Douadi Pettis