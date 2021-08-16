--1. List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT em.emp_no, 
em.last_name,
em.first_name,
em.sex,
sa.salary
FROM employees em
LEFT JOIN salaries sa
ON em.emp_no = sa.emp_no
ORDER BY emp_no

--2. List first name, last name, and hire date for employees who were hired in 1986.
SELECT * FROM employees
WHERE DATE_PART('year',hire_date) = 1986
ORDER BY emp_no;

--3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
SELECT dm.dept_no, de.dept_name, dm.emp_no, em.last_name, em.first_name
FROM dept_manager dm
JOIN departments de
ON dm.dept_no = de.dept_no
JOIN employees em
ON dm.emp_no = em.emp_no
ORDER BY dept_no

--4. List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT em.emp_no, em.last_name, em.first_name,  de.dept_name
FROM employees em
JOIN dept_emp
ON em.emp_no = dept_emp.emp_no
JOIN departments de
ON de.dept_no = dept_emp.dept_no
ORDER BY emp_no

--5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules' AND last_name like 'B%'
ORDER BY emp_no

--6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT departments.dept_name, employees.emp_no, employees.last_name, employees.first_name
FROM departments
Inner JOIN dept_emp
ON departments.dept_no = dept_emp.dept_no
JOIN employees
ON dept_emp.emp_no = employees.emp_no
WHERE dept_name='Sales'
ORDER BY emp_no

--7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT departments.dept_name, employees.emp_no, employees.last_name, employees.first_name
FROM departments
Inner JOIN dept_emp
ON departments.dept_no = dept_emp.dept_no
JOIN employees
ON dept_emp.emp_no = employees.emp_no
--WHERE dept_name='Sales' or dept_name='Development'
WHERE departments.dept_name in ('Sales', 'Development')
ORDER BY dept_name

--8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT last_name, COUNT(*) AS freq_count
FROM employees
GROUP BY last_name
ORDER BY freq_count DESC;


