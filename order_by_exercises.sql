### This is my SQL exercise on the "ORDER BY" clause

# Create a new file named order_by_exercises.sql and copy in the contents of your exercise from the previous lesson.

# Create a file named where_exercises.sql. Make sure to use the employees database.

USE employees;
DESCRIBE employees;

# Find all employees with first names 'Irena', 'Vidya', or 'Maya', and order your results returned by first name. In your comments, answer: What was the first and last name in the first row of the results? What was the first and last name of the last person in the table?
#R1.- The first and last name in the first row was "Irena Reutenauer"
#R2.- The first and last name in the last row was "Vidya Simmen"
SELECT *
FROM employees
WHERE first_name IN ("Irena", "Vidya", "Maya")
ORDER BY first_name;

# Find all employees with first names 'Irena', 'Vidya', or 'Maya', and order your results returned by first name and then last name. In your comments, answer: What was the first and last name in the first row of the results? What was the first and last name of the last person in the table?
#R1.- The first and last name in the first row was "Irena Acton"
#R2.- The first and last name in the last row was "Vidya Zweizig"
SELECT *
FROM employees
WHERE first_name LIKE "Irena"
    OR first_name LIKE "Vidya"
    OR first_name LIKE "Maya"
ORDER BY first_name, last_name;
    
# Write a query to to find all employees whose last name starts and ends with 'E'. Sort the results by their employee number. Enter a comment with the number of employees returned, the first employee number and their first and last name, and the last employee number with their first and last name.
# R1.- The query returned 899 results
# R2.- 10021, Ramzi Erde | 499648  Tadahiro Erde
SELECT *
FROM employees
WHERE last_name LIKE "e%"
    AND last_name LIKE "%e"
ORDER BY emp_no;

# Write a query to to find all employees whose last name starts and ends with 'E'. Sort the results by their hire date, so that the newest employees are listed first. Enter a comment with the number of employees returned, the name of the newest employee, and the name of the oldest emmployee.
# R1.- There wer a total of 899 results
# R2.- Teiji Eldridge | Sergi Erde
SELECT *
FROM employees
WHERE last_name LIKE "e%"
    AND last_name LIKE "%e"
ORDER BY hire_date DESC;

# Find all employees hired in the 90s and born on Christmas. Sort the results so that the oldest employee who was hired last is the first result. Enter a comment with the number of employees returned, the name of the oldest employee who was hired last, and the name of the youngest emmployee who was hired first.
# R1.- 362
# R2.- Khun Bernini | Alselm Cappello
SELECT *
FROM employees
WHERE hire_date LIKE "199%"
    AND birth_date LIKE "%12-25"
ORDER BY hire_date DESC, birth_date ASC;

