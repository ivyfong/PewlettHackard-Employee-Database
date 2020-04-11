-- Drop tables if they exist;
DROP TABLE IF EXISTS departments;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS titles;
DROP TABLE IF EXISTS dept_manager;
DROP TABLE IF EXISTS salaries;
DROP TABLE IF EXISTS dept_employees;

-- Create table departments
CREATE TABLE departments (
	dept_no VARCHAR,
	dept_name VARCHAR,
	PRIMARY KEY (dept_no)
);

-- Create table employees
CREATE TABLE employees (
	emp_no INT,
	birth_date DATE,	
	first_name VARCHAR,	
	last_name VARCHAR,	
	gender VARCHAR,	
	hire_date DATE,
	PRIMARY KEY (emp_no)
);

-- Create table titles
CREATE TABLE  titles (
	emp_no INT,
	title VARCHAR,
	from_date DATE,	
	to_date DATE,
	PRIMARY KEY (emp_no, title, from_date),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

-- Create table dept_manager
CREATE TABLE  dept_manager (
	dept_no VARCHAR,  
	emp_no INT, 
	from_date DATE,	
	to_date DATE,
	PRIMARY KEY (dept_no, emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

-- Create table salaries
CREATE TABLE salaries (
	emp_no INT,	
	salary INT,
	from_date DATE,	
	to_date DATE,
	PRIMARY KEY (emp_no, salary),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

-- Create table dept_employees
CREATE TABLE dept_employees (
	emp_no INT, 	
	dept_no VARCHAR,
	from_date DATE,	
	to_date DATE,
	PRIMARY KEY (emp_no, dept_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);