
# 1. Write a query that returns all employees (emp_no), their department number, their start date, their end date, and a new column 'is_current_employee' that is a 1 if the employee is still with the company and 0 if not.

USE employees;

SELECT
    dept_emp.emp_no,
    dept_no,
    to_date,
    from_date,
    IF(to_date = '9999-01-01', 1, 0) AS is_current_employee
FROM dept_emp
JOIN (SELECT 
        emp_no,
        MAX(to_date) AS max_date
    FROM dept_emp
    GROUP BY emp_no) AS last_dept
ON dept_emp.emp_no = last_dept.emp_no
    AND dept_emp.to_date = last_dept.max_date;


# 2. Write a query that returns all employee names (previous and current), and a new column 'alpha_group' that returns 'A-H', 'I-Q', or 'R-Z' depending on the first letter of their last name.



# 3. How many employees (current or previous) were born in each decade?