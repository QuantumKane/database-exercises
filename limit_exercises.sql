#1. limit_exercises.sql

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

#3. Find all previous or current employees hired in the 90s and born on Christmas. Find the first 5 employees hired in the 90s by sorting by hire date and limiting your results to the first 5 records

ELECT first_name, last_name
FROM employees
WHERE hire_date BETWEEN '1990-01-01' AND '1999-12-31'
	AND birth_date LIKE '%-12-25'
ORDER BY hire_date
LIMIT 5;


# First 5 names:
--Alselm Cappello
--Utz Mandell
--Bouchung Schreiter
--Baocai Kushner
--Petter Stroustrup


#4. Update the query to find the tenth page of results

ELECT first_name, last_name
FROM employees
WHERE hire_date BETWEEN '1990-01-01' AND '1999-12-31'
	AND birth_date LIKE '%-12-25'
ORDER BY hire_date
LIMIT 5 OFFSET 50;

# 10th page of results:
--Christophe Baca
--Moie Birsak
--Chikako Ibel
--Shounak Jansen
--Zhigen Boissier
# To get to a specific page, you have to multiply your LIMIT (in this case, 5) by your desired page # (in this case, 10) to get the OFFSET