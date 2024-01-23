--1. write a SQL query to find Employees who have the biggest salary in their Department
SELECT dept_id,MAX(salary) AS max_salary
FROM employee
GROUP BY dept_id;

--2. write a SQL query to find Departments that have less than 3 people in it
SELECT COUNT(*) AS no_of_emp, d.dept_name
FROM employee e
JOIN department d ON e.dept_id = d.dept_id
GROUP BY d.dept_name
HAVING COUNT(*)<=3;

--3.  write a SQL query to find All Department along with the number of people there
SELECT COUNT(*) AS no_of_emp, d.dept_name
FROM employee e
JOIN department d ON e.dept_id = d.dept_id
GROUP BY d.dept_name;

--4. write a SQL query to find All Department along with the total salary there
SELECT SUM(e.salary) AS total_salary, d.dept_name
FROM employee e
JOIN department d ON e.dept_id = d.dept_id
GROUP BY d.dept_name;