limit_exercises.sql

#2. List the first 10 distinct last name sorted in descending order

SELECT DISTINCT last_name 
FROM employees
ORDER BY last_name DESC;

# First 10 names: 
--Zykh
--Zyda
--Zwicker
--Zweizig
--Zumaque
--Zultner
--Zucker
--Zuberek
--Zschoche
--Zongker

#3. Find all previous or current employees hired in the 90s and born on Christmas. Find the first 5 employees hired in the 90's by sorting by hire date and limiting your results to the first 5 records'
