
# 1. Write a query that returns all employees (emp_no), their department number, their start date, their end date, and a new column 'is_current_employee' that is a 1 if the employee is still with the company and 0 if not.

USE employees;

SELECT
    dept_emp.emp_no,
    dept_no,
    to_date,
    from_date,
    hire_date,
    IF(to_date = '9999-01-01', 1, 0) AS is_current_employee
FROM dept_emp
JOIN (SELECT 
        emp_no,
        MAX(to_date) AS max_date
    FROM dept_emp
    GROUP BY emp_no) AS last_dept
ON dept_emp.emp_no = last_dept.emp_no
    AND dept_emp.to_date = last_dept.max_date
JOIN employees ON employees>dept_no = dempt_emp.emp_no;


# 2. Write a query that returns all employee names (previous and current), and a new column 'alpha_group' that returns 'A-H', 'I-Q', or 'R-Z' depending on the first letter of their last name.

SELECT first_name, last_name, 
	CASE 
		WHEN LEFT(last_name, 1) IN ('A', 'B', 'C', 'D', 'E', 'F', 'G', 'H') THEN 'A-H'
		WHEN LEFT(last_name, 1) IN ('I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q') THEN 'I-Q'
		ELSE 'R-Z'
		END AS alpha_group
FROM employees;	


# 3. How many employees (current or previous) were born in each decade?

SELECT birth_date,
	CASE 
        WHEN birth_date BETWEEN '1950-01-01' AND '1959-12-31' THEN 'Born in the 50s'
        WHEN birth_date BETWEEN '1960-01-01' AND '1969-12-31' THEN 'Born in the 60s'
        ELSE birth_date
        END AS by_decade
        COUNT(*) AS total
	FROM employees
GROUP BY by_decade;


# Bonus: What is the current average salary for each of the following department groups: R&D, Sales & Marketing, Prod & QM, Finance & HR, Customer Service?

SELECT
        CASE 
            WHEN dept_name IN ('research', 'development') THEN 'R&D'
            WHEN dept_name IN ('sales', 'marketing') THEN 'Sales & Marketing' 
            WHEN dept_name IN ('Production', 'Quality Management') THEN 'Prod & QM'
            WHEN dept_name IN ('Finance', 'Human Resources') THEN "Finance & HR"
            ELSE dept_name
            END AS dept_group,
        ROUND(AVG(salary)) AS avg_salary
FROM salaries 
JOIN dept_emp USING(emp_no)
JOIN departments USING(dept_no)
WHERE salaries.to_date > curdate() 
	AND dept_emp.to_date > curdate()
GROUP BY dept_group;