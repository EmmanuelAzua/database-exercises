### "Case statements" lesson


# Exercise Goals: Use CASE statements or IF() function to explore information in the employees database

# Create a file named case_exercises.sql and craft queries to return the results for the following criteria:

# 1.- Write a query that returns all employees (emp_no), their department number, their start date, their end date, and a new column 'is_current_employee' that is a 1 if the employee is still with the company and 0 if not.

USE employees;
SELECT
	dept_emp.emp_no,
	dept_no,
	hire_date AS "Start Date",
	dept_emp.from_date AS "Started at Latest Position",
	to_date AS "End Date",
	CASE
		WHEN dept_emp.to_date LIKE "99%" THEN TRUE
		ELSE FALSE
		END AS is_current_employee
FROM employees
JOIN dept_emp ON dept_emp.emp_no = employees.emp_no
ORDER BY dept_emp.emp_no;

# 2.- Write a query that returns all employee names (previous and current), and a new column 'alpha_group' that returns 'A-H', 'I-Q', or 'R-Z' depending on the first letter of their last name

SELECT
	last_name,
	first_name,
	CASE
		WHEN last_name >= "A%"
			AND last_name < "I%" THEN "A-H"
		WHEN last_name >= "I%"
			AND last_name < "R%" THEN "I-Q"
		ELSE "R-Z"
		END AS alpha_group
FROM employees
ORDER BY last_name ASC;

# 3.- How many employees (current or previous) were born in each decade?

SELECT
	COUNT(*),
	CASE
		WHEN birth_date > "1939%" AND birth_date < "1950%" THEN "Born in the 40s"
		WHEN birth_date > "1949%" AND birth_date < "1960%" THEN "Born in the 50s"
		WHEN birth_date > "1959%" AND birth_date < "1970%" THEN "Born in the 60s"
		WHEN birth_date > "1969%" AND birth_date < "1980%" THEN "Born in the 70s"
		WHEN birth_date > "1979%" AND birth_date < "1990%" THEN "Born in the 80s"
		WHEN birth_date > "1989%" AND birth_date < "2000%" THEN "Born in the 90s"
		ELSE "Beyond Millennial at this Point"
		END AS Decade_of_Birth
FROM employees
GROUP BY Decade_of_Birth
ORDER BY Decade_of_Birth;

# BONUS: What is the current average salary for each of the following department groups: R&D, Sales & Marketing, Prod & QM, Finance & HR, Customer Service?

		

USE employees;


