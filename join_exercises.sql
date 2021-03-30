### This is my first "JOIN" exercises file

# 1.- Use the join_example_db. Select all the records from both the users and roles tables.
USE join_example_db;

# 2.- Use join, left join, and right join to combine results from the users and roles tables as we did in the lesson. Before you run each query, guess the expected number of results.

SELECT *
FROM roles
JOIN users ON roles.id = users.role_id;

SELECT *
FROM users
JOIN roles ON users.name = roles.id;

SELECT *
FROM users
LEFT JOIN roles ON users.id = roles.id;

SELECT *
FROM users
LEFT JOIN roles ON users.name = roles.name;

SELECT *
FROM users
RIGHT JOIN roles ON users.email = roles.id;

SELECT *
FROM roles
RIGHT JOIN users ON roles.name = users.id;

# 3. Although not explicitly covered in the lesson, aggregate functions like count can be used with join queries. Use count and the appropriate join type to get a list of roles along with the number of users that has the role. Hint: You will also need to use group by in the query.

SELECT
    COUNT(*) AS USERS_WITH_THIS_ROLE
FROM roles
JOIN users ON roles.id = users.role_id;

# 1.- Use the employees database.

USE employees;

# 2.- Using the example in the Associative Table Joins section as a guide, write a query that shows each department along with the name of the current manager for that department.

SELECT dept_name AS "Department Name", CONCAT(last_name, ", ", first_name) AS "Department Manager"
FROM departments
JOIN dept_manager ON departments.dept_no = dept_manager.dept_no
JOIN employees ON employees.emp_no = dept_manager.emp_no
WHERE dept_manager.to_date > curdate()
ORDER BY dept_name ASC;

# 3.- Find the name of all departments currently managed by women.
# PLANNING PHASE
# STEP 1. List all useful tables
# employees, departments, dept_manager
# STEP 2. Find table commonalities, commo keys
# employees[emp_no]dept_manager[dept_no]departments

SELECT
    departments.dept_name AS "Department",
    CONCAT(last_name, ", ", first_name) AS "Department Manager",
    gender AS "Gender"
FROM employees
JOIN dept_manager ON dept_manager.emp_no = employees.emp_no
JOIN departments ON departments.dept_no = dept_manager.dept_no
WHERE gender LIKE "F"
    AND dept_manager.to_date LIKE "99%"
ORDER BY dept_name ASC;
 
# 4.- Find the current titles of employees currently working in the Customer Service department.
# PLANNING STAGE
# Step 1.- List all elements required in question: current titles, employees currently working, in customer service department
# Step 2.- List all useful tables: employees, departments, titles
# Step 3.- Identify touchpoints between tables: titles[emp_no]employees[emp_no]dept_emp[dept_no]departments

SELECT
    title AS "Position",
    COUNT(titles.emp_no) AS "Number of Employees"
FROM titles
JOIN dept_emp ON dept_emp.emp_no = titles.emp_no
JOIN departments ON departments.dept_no = dept_emp.dept_no
WHERE
    departments.dept_name LIKE "Customer Service"
    AND titles.to_date LIKE "9%"
GROUP BY title
ORDER BY COUNT(titles.emp_no) ASC;

# 5.- Find the current salary of all current managers.
# PLANNING STAGE
# Step 1.- Current salary, all current managers
# Step 2.- List all useful tables: departments[dept_no]dept_manager[emp_no]salaries[emp_no]titles
# Step 3.- Identify touchpoints

SELECT
    dept_name AS "Department",
    CONCAT(last_name, ", ", first_name) AS "Current Department Manager",
    salary AS "Current Salary"
FROM departments
JOIN dept_manager ON dept_manager.dept_no = departments.dept_no
JOIN salaries ON salaries.emp_no = dept_manager.emp_no
JOIN employees ON employees.emp_no = dept_manager.emp_no
WHERE dept_manager.to_date LIKE "99%"
    AND salaries.to_date LIKE "99%"
ORDER BY dept_name ASC;

# 6.- Find the number of current employees in each department.
# PLANNIG STAGE
# Step 1.- Elements to find: number of, current employees, in each department
# Step 2.- List useful tables: employees, dept_emp, departments
# Step 3.- [emp_no], [dept_no]

SELECT
    departments.dept_no AS "Department Code",
    departments.dept_name AS "Department",
    COUNT(dept_emp.emp_no) AS "Number of Current Employees"
FROM departments
JOIN dept_emp ON dept_emp.dept_no = departments.dept_no
JOIN employees ON employees.emp_no = dept_emp.emp_no
WHERE dept_emp.to_date LIKE "99%"
GROUP BY dept_name
ORDER BY departments.dept_no ASC;

# 7.- Which department has the highest average salary? Hint: Use current not historic information.
# Step 1.- Elements to find: department with, highest average salary (current info)
# Step 2.- List useful tables: departments, dept_emp, salary
# Step 3.- [dept_no], [emp_no]

SELECT
    dept_name AS "Department",
    AVG(salaries.salary) AS "Highest Average Salary"
FROM departments
JOIN dept_emp ON dept_emp.dept_no = departments.dept_no
JOIN salaries ON salaries.emp_no = dept_emp.emp_no
WHERE salaries.to_date LIKE "99%"
GROUP BY dept_name
ORDER BY (AVG(salaries.salary)) DESC LIMIT 1;
    
    
    
    