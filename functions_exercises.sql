### This are my first SQL "FUNCTION" exercises

# Create a new file named functions_exercises.sql

# Make sure to use the employees database.

USE employees;
DESCRIBE employees;

# 2.- Write a query to to find all employees whose last name starts and ends with 'E'. Use concat() to combine their first and last name together as a single column named full_name.
SELECT
    CONCAT(first_name, " ", last_name)
    AS "full_name",
    first_name, last_name
FROM employees
WHERE last_name LIKE "e%e";
    

# 3.- Convert the names produced in your last query to all uppercase.
SELECT *,
    CONCAT(UPPER(first_name), " ", UPPER(last_name))
    AS "full_name",
    first_name, last_name
FROM employees
WHERE last_name LIKE "e%e";

    
# 4.- Find all employees hired in the 90s and born on Christmas. Use datediff() function to find how many days they have been working at the company (Hint: You will also need to use NOW() or CURDATE()),
SELECT *,
    last_name, first_name, hire_date, birth_date,
    datediff(CURDATE(), hire_date)
    AS "days_at_the_company"
FROM employees
WHERE hire_date LIKE "199%"
    AND birth_date LIKE "%12-25"
ORDER BY days_at_the_company
LIMIT 10;
    
# 5.- Find the smallest and largest current salary from the salaries table.
#R.- 158,220
#R.- 38,623

SELECT 
    MAX(salary),
    MIN(salary)
FROM salaries;

    
# Use your knowledge of built in SQL functions to generate a username for all of the employees. A username should be all lowercase, and consist of the first character of the employees first name, the first 4 characters of the employees last name, an underscore, the month the employee was born, and the last two digits of the year that they were born. Below is an example of what the first 10 rows will look like:

SELECT *,
    CONCAT(LOWER(SUBSTR(first_name, 1, 1)), LOWER(SUBSTR(last_name, 1, 4)), "_", SUBSTR(birth_date, 6, 2), SUBSTR(birth_date, 3, 2))
    AS "Username"
FROM employees
LIMIT 10;