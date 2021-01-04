
#1. group_by_exercises.sql

#2. In your script, use DISTINCT to find the unique titles in the titles table. How many unique titles have there ever been?

SELECT DISTINCT title
FROM titles;

# The query returned 7 observations

#3. Write a query to to find a list of all unique last names of all employees that start and end with 'E' using GROUP BY.

SELECT DISTINCT last_name
FROM `employees`
WHERE `last_name` LIKE 'e%e'
GROUP BY last_name;

# The query returned 5 observations

#4. Write a query to to find all unique combinations of first and last names of all employees whose last names start and end with 'E'

SELECT DISTINCT (CONCAT (first_name, " ", last_name)) AS full_name
FROM `employees`
WHERE `last_name` LIKE 'e%e'
GROUP BY full_name;

# The query returned 846 observations

#5. Write a query to find the unique last names with a 'q' but not 'qu'. Include those names in a comment in your sql code.

SELECT DISTINCT last_name
FROM employees
WHERE last_name LIKE '%q%' 
	AND last_name NOT LIKE '%qu%';
    
/*
Chleq
Lindqvist
Qiwen
*/

#6. Add a COUNT() to your results (the query above) and use ORDER BY to make it easier to find employees whose unusual name is shared with others

SELECT DISTINCT COUNT(last_name)
FROM employees
WHERE last_name LIKE '%q%' 
	AND last_name NOT LIKE '%qu%'
ORDER BY last_name;

# The query returned 547 observations

SELECT COUNT(last_name)
FROM employees
WHERE last_name LIKE '%q%' 
	AND last_name NOT LIKE '%qu%'
GROUP BY last_name
ORDER BY last_name;

# An alternate query

#7. Find all all employees with first names 'Irena', 'Vidya', or 'Maya'. Use COUNT(*) and GROUP BY to find the number of employees for each gender with those names.

SELECT gender, COUNT(*) as number
FROM employees
WHERE (first_name = 'Irena'
	OR first_name = 'Vidya'
	OR first_name = 'Maya')
GROUP BY gender;

/*
M	441
F	268
*/

#8. Using your query that generates a username for all of the employees, generate a count employees for each unique username. Are there any duplicate usernames?

SELECT LOWER(
			CONCAT(
				SUBSTR(first_name, 1, 1), 
				SUBSTR(last_name, 1, 4),
				'_', 
				SUBSTR(birth_date, 6, 2), 
				SUBSTR(birth_date, 3, 2) 	
				)) AS userName, COUNT(*) AS duplicates
FROM employees
GROUP BY userName
ORDER BY COUNT(*) DESC;

# Query returned 285872 results