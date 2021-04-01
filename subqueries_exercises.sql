### These are my first MYSQL "SUBQUERY" exercises

## Create a file named subqueries_exercises.sql and craft queries to return the results for the following criteria:

USE employees;

# 1.- Find all the current employees with the same hire date as employee 101010 using a sub-query.

# PLANNING STAGE
# Step 1.- List all requirements: current employees, with same hire date, as employee 101010 | use SUBQUERY
# Step 2.- List all useful tables: employees
# Step 3.- Describe strategy/method: id employees' hire dates and compare them to employee with emp_no 101010/ list emloyee numbers, names and hire dates

SELECT employees.emp_no, last_name, first_name, hire_date
FROM employees
JOIN dept_emp ON dept_emp.emp_no = employees.emp_no
WHERE to_date LIKE "99%"
AND employees.emp_no IN(
SELECT employees.emp_no
WHERE hire_date LIKE "1990-10-22"
)
ORDER BY employees.emp_no ASC;

# 2.- Find all the titles ever held by all current employees with the first name Aamod
# PLANNING STAGE
# Step 1.- Requirements: all titles, ever held, by all current employees, with name Aamod
# Step 2.- Identify useful tables: employees, titles
# Step 3.- Strategy: use emp_no to link both tables and search for condition of Aamod as firt name, second condition is titles
USE employees;

SELECT first_name, last_name, title
FROM employees
JOIN titles ON titles.emp_no = employees.emp_no
WHERE first_name IN(
SELECT first_name
FROM employees
WHERE first_name LIKE "Aamod"
)
AND to_date LIKE "99%";

# 3.- How many people in the employees table are no longer working for the company? Give the answer in a comment in your code
# R.- 85,108
# PLANNING STAGES
# Step 1.- List all requirements: how many people, in employees table, are no longer working for the company
# Step 2.- List all useful tables: employees, dept_emp
# Step3.- Identify variables and strategy: use "emp_no" to link both tables, identify those who are current employees, use the COUNT function

SELECT
    COUNT(emp_no) AS "Total Number of Empoyees No Longer Working fot the Company"
FROM employees
WHERE emp_no IN(
SELECT emp_no
FROM dept_emp
WHERE to_date NOT LIKE "99%"
);

# 4.- Find all the current department managers that are female. List their names in a comment in your code
# R.- Isamu Legleiner, Karsten Sigstam, Leon DasSarma, Hilary Kambil
# PLANNING STAGE
# Step 1.- List requirements: current department managers, that are females | list their names in a comment
# Step 2.- Identify useful tables: dept_manager, employees
# Step 3.- Identify strategy and variables: use "emp_no" to link both tables, identify currrent managers, identify female managers

SELECT last_name, first_name
FROM employees
WHERE emp_no IN(
SELECT emp_no
FROM dept_manager
WHERE gender LIKE "F"
AND to_date LIKE "99%"
);

# 5.- Find all the employees who currently have a higher salary than the companies overall, historical average salary
# Step 1.- List requirements: all employees, current higher salary than overall historical average
# Step 2.- Useful tables: employees, salaries
# Step 3.- Identify variables and strategy: use "emp_no" to link both tables, estimate salary average, identify those with a higher than average salary

SELECT last_name, first_name, salary
FROM employees
JOIN salaries ON salaries.emp_no = employees.emp_no
WHERE salaries.to_date LIKE "99%"
AND(
SELECT AVG(salary)
FROM salaries
WHERE salaries.to_date LIKE "99%"
)
ORDER BY salary ASC;

SELECT AVG(salary)
FROM salaries;