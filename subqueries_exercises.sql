# 1. Find all the current employees with the same hire date as employee 101010 using a sub-query.

select * 
from employees 
where hire_date in 
	(select hire_date 
	from employees
	where emp_no = '101010'
);
 
# 2. Find all the titles ever held by all current employees with the first name Aamod.

select title, count(*)
from titles 
where emp_no in
	(select emp_no 
	from employees 
	where first_name = 'Aamod'
	)
group by title;
