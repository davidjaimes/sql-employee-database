DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS departments;
DROP TABLE IF EXISTS dept_emp;
DROP TABLE IF EXISTS dept_manager;
DROP TABLE IF EXISTS salaries;
DROP TABLE IF EXISTS titles;
CREATE TABLE employees (
    emp_no int NOT NULL,
    birth_date varchar(10) NOT NULL,
    first_name varchar(30) NOT NULL,
    last_name varchar(30) NOT NULL,
    gender varchar(1) NOT NULL,
    hire_date varchar(10) NOT NULL
);
CREATE TABLE departments (
    dept_no varchar(4) NOT NULL,
    dept_name varchar(30) NOT NULL
);
CREATE TABLE dept_emp (
    emp_no int NOT NULL,
    dept_no varchar(4) NOT NULL,
    from_date varchar(10) NOT NULL,
    to_date varchar(10) NOT NULL
);
CREATE TABLE dept_manager (
    dept_no varchar(4) NOT NULL,
    emp_no int NOT NULL,
    from_date varchar(10) NOT NULL,
    to_date varchar(10) NOT NULL
);
CREATE TABLE salaries (
    emp_no int NOT NULL,
    salary int NOT NULL,
    from_date varchar(10) NOT NULL,
    to_date varchar(10) NOT NULL
);
CREATE TABLE titles (
    emp_no int NOT NULL,
    title varchar(30) NOT NULL,
    from_date varchar(10) NOT NULL,
    to_date varchar(10) NOT NULL
);
COPY public."departments" FROM '/tmp/departments.csv' DELIMITER ',' CSV HEADER;
COPY public."dept_manager" FROM '/tmp/dept_manager.csv' DELIMITER ',' CSV HEADER;
COPY public."salaries" FROM '/tmp/salaries.csv' DELIMITER ',' CSV HEADER;
COPY public."dept_emp" FROM '/tmp/dept_emp.csv' DELIMITER ',' CSV HEADER;
COPY public."employees" FROM '/tmp/employees.csv' DELIMITER ',' CSV HEADER;
COPY public."titles" FROM '/tmp/titles.csv' DELIMITER ',' CSV HEADER;
