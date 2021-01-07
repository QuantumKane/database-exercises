
# 1. Using the example from the lesson, re-create the employees_with_departments table.

CREATE TEMPORARY TABLE emps_w_depts AS (
SELECT *
FROM employees.employees_with_departments
);

SELECT *
FROM emps_w_depts;

# a) Add a column named full_name to this table. It should be a VARCHAR whose length is the sum of the lengths of the first name and last name columns

ALTER TABLE emps_w_depts
	 add full_name varchar(40);
	
SELECT *
FROM emps_w_depts;

# b) Update the table so that full name column contains the correct data

UPDATE emps_w_depts
SET full_name = concat(first_name, " ", last_name);
	
SELECT *
FROM emps_w_depts;

# c) Remove the first_name and last_name columns from the table.

alter table emps_w_depts 
drop column first_name,
drop column last_name;	
	
SELECT *
FROM emps_w_depts;

# d) What is another way you could have ended up with this same table?

CREATE temporary TABLE emps_w_depts (
    SELECT emp_no, 
            dept_no, 
            dept_name, 
            concat(first_name,' ',last_name) AS full_name
    FROM employees.employees_with_departments
);

# 2. Create a temporary table based on the payment table from the sakila database.
     Write the SQL necessary to transform the amount column such that it is stored as an      integer representing the number of cents of the payment. 
     
CREATE TEMPORARY TABLE amt AS (
SELECT * 
FROM sakila.payment
);

ALTER TABLE amt
ADD cents int;

UPDATE amt
SET cents = (amount * 100);

SELECT * 
FROM amt;

# 3. Find out how the current average pay in each department compares to the overall, historical average pay. In order to make the comparison easier, you should use the Z-score for salaries. In terms of salary, what is the best department right now to work for? The worst?

CREATE TEMPORARY TABLE hist_avg_salary 
		(
		SELECT AVG(salary) 
		FROM employees.salaries);

SELECT *
FROM hist_avg_salary;

CREATE TEMPORARY TABLE dept_avg_salary (
	SELECT dept_name, 	
		AVG(salary) as avg_salary
	FROM employees.salaries
	JOIN employees.dept_emp USING(emp_no)
	JOIN employees.departments USING(dept_no)
	WHERE employees.salaries.to_date > curdate()
	GROUP BY dept_name
	ORDER BY avg_salary DESC
 );

# z_score formula: z=(x-u)/stddev
SELECT *
FROM dept_avg_salary;

SELECT *, round((avg_salary - (SELECT * from hist_avg_salary))
		/
	(SELECT stddev(salary) 	
	FROM employees.salaries), 3) AS z_score
FROM dept_avg_salary;

/*
dept_name           avg_salary          z_score
Sales	            88842.1590	        1.481
Marketing	        80014.6861	        0.959
Finance	            78644.9069	        0.878
Research	        67932.7147	        0.244
Production	        67841.9487	        0.238
Development	        67665.6241	        0.228
Customer Service	66971.3536	        0.187
Quality Management	65382.0637	        0.093
Human Resources	    63795.0217	       -0.001
*/





