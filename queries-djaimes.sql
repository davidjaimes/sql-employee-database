-- 1. List the following details of each employee: employee number, last name, first name, gender, and salary.
select employees.emp_no, last_name, first_name, gender, salary
from employees
inner join salaries
on employees.emp_no = salaries.emp_no;

-- 2. List employees who were hired in 1986.
select last_name, first_name, hire_date
from employees
where hire_date like '1986%';

-- 3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name, and start and end employment dates.
create view manager_list as
select dept_manager.dept_no, dept_name, dept_manager.emp_no, from_date, to_date
from dept_manager
inner join departments
on dept_manager.dept_no = departments.dept_no;
select manager_list.dept_no, dept_name, manager_list.emp_no, last_name, first_name, from_date, to_date
from manager_list
inner join employees
on manager_list.emp_no = employees.emp_no
-- Uncomment next line to get current manager in each department.
-- where to_date like '9999%';

-- 4. List the department of each employee with the following information: employee number, last name, first name, and department name.
create view employee_list as
select employees.emp_no, last_name, first_name, dept_no
from employees
inner join dept_emp
on employees.emp_no = dept_emp.emp_no;
select emp_no, last_name, first_name, dept_name
from employee_list
inner join departments
on employee_list.dept_no = departments.dept_no;
