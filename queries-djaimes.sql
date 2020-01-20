-- 1. List the following details of each employee: employee number, last name, first name, gender, and salary.
select employees.emp_no, last_name, first_name, gender, salary
from employees
inner join salaries
on employees.emp_no = salaries.emp_no

-- 2. List employees who were hired in 1986.
select last_name, first_name, hire_date
from employees
where hire_date like '1986%'

-- 3. 
