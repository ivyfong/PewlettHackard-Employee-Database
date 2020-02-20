SELECT * FROM departments;
SELECT * FROM dept_employees;
SELECT * FROM dept_manager;
SELECT * FROM employees;
SELECT * FROM salaries;
SELECT * FROM titles;

-- 1. List the following details of each employee: employee number, last name, 
	-- first name, gender, and salary.
SELECT e.emp_no, e.last_name, e.first_name, e.gender, s.salary
FROM employees as e
INNER JOIN salaries as s
ON e.emp_no = s.emp_no;

-- 2. List employees who were hired in 1986.
SELECT emp_no, last_name, first_name, hire_date
FROM employees
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31';

-- 3. List the manager of each department with the following information: 
	-- department number, department name, the manager's employee number, 
	-- last name, first name, and start and end employment dates.
SELECT dm.dept_no, d.dept_name, dm.emp_no, e.last_name, e.first_name, dm.from_date, dm.to_date
FROM dept_manager as dm
INNER JOIN departments as d
	ON dm.dept_no = d.dept_no
INNER JOIN employees as e
	ON dm.emp_no = e.emp_no;

-- 4. List the department of each employee with the following information: 
	-- employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM dept_employees as de
INNER JOIN departments as d
	ON de.dept_no = d.dept_no
INNER JOIN employees as e
	ON de.emp_no = e.emp_no;

-- 5. List all employees whose first name is "Hercules" and last names begin 
	-- with "B."
SELECT emp_no, last_name, first_name
FROM employees
WHERE first_name='Hercules' AND last_name LIKE 'B%';

-- 6. List all employees in the Sales department, including their employee number, 
	-- last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM dept_employees as de
INNER JOIN departments as d
	ON de.dept_no = d.dept_no
INNER JOIN employees as e
	ON de.emp_no = e.emp_no
WHERE d.dept_name='Sales';

-- 7. List all employees in the Sales and Development departments, including 
	-- their employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM dept_employees as de
INNER JOIN departments as d
	ON de.dept_no = d.dept_no
INNER JOIN employees as e
	ON de.emp_no = e.emp_no
WHERE d.dept_name='Sales' OR d.dept_name='Development';

-- 8. In descending order, list the frequency count of employee last names, 
	-- i.e., how many employees share each last name.
SELECT last_name, COUNT(last_name) AS "Frequency Count"
FROM employees
GROUP BY last_name
ORDER BY COUNT(last_name) DESC;