# 1. Find all the current employees with the same hire date as employee 101010 using a sub-query.

select * 
from employees 
join salaries on salaries.emp_no = employees.emp_no 
	AND to_date > curdate() 
where hire_date in 
	(select hire_date 
	from employees
	where emp_no = '101010'
);

/*
55 observations
*/
 
# 2. Find all the titles ever held by all current employees with the first name Aamod.

select title
from titles 
where titles.emp_no in
	(select employees.emp_no 
	from employees 
	join salaries on salaries.emp_no = employees.emp_no 
	AND to_date > curdate() 
	where first_name = 'Aamod'
	)
group by title;

/*
Assistant Engineer
Engineer
Senior Engineer
Senior Staff
Staff
Technique Leader
*/

# 3. How many people in the employees table are no longer working for the company?

select COUNT(emp_no) as ex_employees
from employees 
where emp_no NOT IN
	(select emp_no
	from salaries
	where to_date > curdate());

/*
59900 ex_employees
*/

# 4. Find all the current department managers that are female.

select first_name,
		last_name
from employees
where gender = 'F'
	and emp_no IN
	(select emp_no
	from dept_manager
	where to_date > curdate()
);

/*
Isamu	Legleitner
Karsten	Sigstam
Leon	DasSarma
Hilary	Kambil
*/

# 5. Find all the employees who currently have a higher salary than the companies overall, historical average salary.

select first_name,
		last_name
from employees
join salaries on salaries.emp_no = employees.emp_no 
	and salaries.to_date > curdate()
where salary >
		(select AVG(salary)
		from salaries);

/* 
154543 observations
*/

# 6. How many current salaries are within 1 standard deviation of the current highest salary?

select count(emp_no)
from salaries
where to_date > curdate()
	and salary >
	(select max(salary) - stddev(salary)
	from salaries
	where to_date > curdate()
);

/*
83 observations
*/