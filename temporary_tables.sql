
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





