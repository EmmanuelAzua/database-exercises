#This is my SQL DB exercise for the "WHERE" clause

# Create a file named where_exercises.sql. Make sure to use the employees database.

USE employees;
DESCRIBE employees;

# Find all current or previous employees with first names 'Irena', 'Vidya', or 'Maya' using IN. Enter a comment with the number of records returned.              R.- Results show 709 records
SELECT *
FROM employees
WHERE first_name IN ("Irena", "Vidya", "Maya");

# Find all current or previous employees with first names 'Irena', 'Vidya', or 'Maya', as in Q2, but use OR instead of IN. Enter a comment with the number of records returned. Does it match number of rows from Q2?        R.- The result shows 709 records, which matches the exact result from the method we used in Q2
SELECT *
FROM employees
WHERE first_name LIKE "Irena"
    OR first_name LIKE "Vidya"
    OR first_name LIKE "Maya";
    
# Find all current or previous employees with first names 'Irena', 'Vidya', or 'Maya', using OR, and who is male. Enter a comment with the number of records returned.         R.- The query returned 441 records as a result
SELECT *
FROM employees
WHERE (first_name LIKE "Irena"
    OR first_name LIKE "Vidya"
    OR first_name LIKE "Maya")
    AND gender = "M";
    
# Find all current or previous employees whose last name starts with 'E'. Enter a comment with the number of employees whose last name starts with E.          R.- The query returned 7330 rows

SELECT *
FROM employees
WHERE last_name LIKE "e%";

# Find all current or previous employees whose last name starts or ends with 'E'. Enter a comment with the number of employees whose last name starts or ends with E. How many employees have a last name that ends with E, but does not start with E?R.- there are 30,723 employees whose last names start or end with the letter "E"; however, the results indicate that there are 23, 393 employees whose name ends with the letter "E", but does not start with the letter "E".
SELECT *
FROM employees
WHERE last_name LIKE "e%"
    OR last_name LIKE "%e";
    
SELECT *
FROM employees
WHERE last_name LIKE "%e"
    AND last_name NOT LIKE "e%";
    
# Find all current or previous employees employees whose last name starts and ends with 'E'. Enter a comment with the number of employees whose last name starts and ends with E. How many employees' last names end with E, regardless of whether they start with E?           R.- There are 899 employees whose last name starts and ends with the letter "E". the query also returned 24,292 employees whose last names end with the letter "E", regardless of the first letter in their last names.
SELECT *
FROM employees
WHERE last_name LIKE "e%"
    AND last_name LIKE "%e";
    
SELECT *
FROM employees
WHERE last_name LIKE "%e";

# Find all current or previous employees hired in the 90s. Enter a comment with the number of employees returned.        R.- The query returned 135,214 results
SELECT *
FROM employees
WHERE hire_date LIKE "199%";

# Find all current or previous employees born on Christmas. Enter a comment with the number of employees returned.       R.- The number of employees brought by Santa Clauss was 842
SELECT *
FROM employees
WHERE birth_date LIKE "%12-25";

# Find all current or previous employees hired in the 90s and born on Christmas. Enter a comment with the number of employees returned.         R.- There were 362 who receive their birth day presents and Christmas presents on the same day and were hired in the 1990s
SELECT *
FROM employees
WHERE hire_date LIKE "199%"
    AND birth_date LIKE "%12-25";
    
# Find all current or previous employees with a 'q' in their last name. Enter a comment with the number of records returned.        R.- The query returned 1,873 results
SELECT *
FROM employees
WHERE last_name LIKE "%q%";

# Find all current or previous employees with a 'q' in their last name but not 'qu'. How many employees are found?             R.- The query returned 547 results
SELECT *
FROM employees
WHERE last_name LIKE "%q%"
    AND last_name NOT LIKE "%qu%";
    
##### Lesson on the ORDER BY clause = 25 March 2021

USE chipotle;

#
SELECT item_name
FROM orders
ORDER BY item_name;

#
SELECT item_name
FROM orders
ORDER BY item_name DESC;

#
SELECT
    item_name AS item,
    quantity AS number
    FROM orders
ORDER BY item DESC;

#
SELECT
    item_name AS item,
    quantity AS number
FROM orders
ORDER BY number, item;

#
SELECT
    item_name AS item,
    quantity AS number
FROM orders
ORDER BY number DESC, item;

#
SELECT
    item_name AS item,
    quantity AS number
FROM orders
ORDER BY number DESC, item ASC;
