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

-- 5. List all employees whose first name is "Hercules" and last names begin with "B."
select *
from employees
where first_name = 'Hercules'
and last_name like 'B%';

-- 6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
create view sales_employees as
select emp_no, last_name, first_name
from employees
where emp_no in (
	select emp_no
	from dept_emp as d
	where dept_no in (
		select dept_no
		from departments
		where dept_name = 'Sales'
	)
);
select s.emp_no, last_name, first_name, dept_name
from sales_employees as s
join dept_emp as d
on s.emp_no = d.emp_no
join departments
on d.dept_no = departments.dept_no
where dept_name = 'Sales';

-- 7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
create view sales_develop as
select emp_no, last_name, first_name
from employees
where emp_no in (
	select emp_no
	from dept_emp as d
	where dept_no in (
		select dept_no
		from departments
		where dept_name = 'Sales'
		or dept_name = 'Development'
	)
);
select s.emp_no, last_name, first_name, dept_name
from sales_develop as s
join dept_emp as d
on s.emp_no = d.emp_no
join departments
on d.dept_no = departments.dept_no
where dept_name = 'Sales'
or dept_name = 'Development';

-- 8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
select last_name, count(last_name) as "Frequency Count"
from employees
group by last_name
order by "Frequency Count" desc;
