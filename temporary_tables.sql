### This is my "TEMPORARY TABLES" lesson

USE florence09;

SELECT first_name, last_name, salary
FROM salaries
JOIN employees using(emp_no)
WHERE to_date > curdate();

CREATE TEMPORARY TABLE current_salary AS (
	SELECT employees.employees.first_name,
	employees.employees.last_name,
	employees.salaries.salary
	FROM employees.salaries
	JOIN employees.employees USING(emp_no)
	WHERE to_date > curdate()
);

# If we do 5% for all current employees, what is the sum of all those salaries?
# UPDATE my_numbers SET n = n + 1 (where clause, if needed)

UPDATE current_salary SET salary = salary + salary * .05;

SELECT sum(salary) FROM current_salary;

SELECT sum(salary) FROM employees.salaries;

SELECT (SELECT sum(salary) FROM employees);



### This is the exercise portion

# Create a file named temporary_tables.sql to do your work for this exercise.
# 1. Using the example from the lesson, re-create the employees_with_departments table
# Add a column named full_name to this table. It should be a VARCHAR whose length is the sum of the lengths of the first name and last name columns
# Update the table so that full name column contains the correct data
# Remove the first_name and last_name columns from the table.

USE florence09;

CREATE TABLE employees_with_departments(
	full_name VARCHAR(50) NOT NULL
);

SELECT *
FROM employees_with_departments;

UPDATE employees_with_departments SET full_name = CONCAT(
	employees.employees.first_name,
	employees.employees.last_name
);

drop table if exists employees_with_departments;


CREATE TABLE employees_with_departments AS
SELECT emp_no, first_name, last_name, dept_no, dept_name
FROM employees.employees
JOIN employees.dept_emp USING(emp_no)
JOIN employees.departments USING(dept_no)
LIMIT 100;

SELECT *
FROM employees_with_departments;

ALTER TABLE employees_with_departments ADD full_name VARCHAR(50);

UPDATE `employees_with_departments`
SET full_name = CONCAT(first_name, " ", last_name);

SELECT full_name
FROM `employees_with_departments`;

ALTER TABLE employees_with_departments
	DROP COLUMN first_name;
	
ALTER TABLE employees_with_departments
	DROP COLUMN last_name;


# What is another way you could have ended up with this same table?
#
# CREATE TABLE employees_with_departments AS
# SELECT emp_no, dept_no, dept_name
# FROM employees.employees
#	ADD full_name VARCHAR(50)
#	WHERE full_name IN (
#		SELECT
#			CONCAT(first_name, " ", last_name)
#		FROM employees.employees
#		)
# JOIN employees.dept_emp USING(emp_no)
# JOIN employees.departments USING(dept_no)
# LIMIT 100;

# 2. Create a temporary table based on the payment table from the sakila database.
# 	Write the SQL necessary to transform the amount column such that it is stored as an integer representing the number of cents of the payment. For example, 1.99 should become 199.




USE sakila;
SHOW CREATE TABLE payment;

USE florence09;

DROP TABLE IF EXISTS payments;

CREATE TEMPORARY TABLE PAYMENTS AS (
	SELECT payment_id, customer_id, staff_id, staff_id, rental_id, amount * 100 AS amount_in_pennies, payment_date, last_update
FROM sakila.payment
);

DESCRIBE PAYMENTS;

# What is a Z score?
# ZSCORE MEASURES HOW MANY stddev a given observation is from the population mean
# (x - population_mean) / stdev(x)

SELECT AVG(salary)
FROM employees.salaries;
#63810.7448

SELECT salary - 63810.7448
FROM employees.salaries;

SELECT std(salary)
FROM employees.salaries;

SELECT AVG(salary) AS 



