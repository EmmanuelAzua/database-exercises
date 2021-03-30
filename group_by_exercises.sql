### These are my first SQL "GROUP BY" exercises

# 1.- Create a new file named group_by_exercises.sql
USE employees;

# 2.- In your script, use DISTINCT to find the unique titles in the titles table. How many unique titles have there ever been? Answer that in a comment in your SQL file.
#R.- 7
SELECT
    COUNT(DISTINCT title) AS number_of_unique_titles
FROM titles;

# 3.- Write a query to to find a list of all unique last names of all employees that start and end with 'E' using GROUP BY.
SELECT DISTINCT last_name,
    COUNT(*) AS number_of_employees_wit_last_name
FROM employees
WHERE last_name LIKE "e%e"
GROUP BY last_name;

# 4.- Write a query to to find all unique combinations of first and last names of all employees whose last names start and end with 'E'.
SELECT last_name, first_name,
    COUNT(*) AS number_of_employees
FROM employees
WHERE last_name LIKE "e%e"
GROUP BY last_name, first_name
HAVING number_of_employees > 1;

# 5.- Write a query to find the unique last names with a 'q' but not 'qu'. Include those names in a comment in your sql code.
#R.- Chleq, Lindqvist, and Qiwen
SELECT last_name
FROM employees
WHERE last_name LIKE "%q%"
    AND last_name NOT LIKE "%qu%"
GROUP BY last_name;

# 6.- Add a COUNT() to your results (the query above) and use ORDER BY to make it easier to find employees whose unusual name is shared with others.
SELECT last_name,
    COUNT(*)
FROM employees
WHERE last_name LIKE "%q%"
    AND last_name NOT LIKE "%qu%"
GROUP BY last_name
ORDER BY last_name;

# 7.- Find all all employees with first names 'Irena', 'Vidya', or 'Maya'. Use COUNT(*) and GROUP BY to find the number of employees for each gender with those names.

SELECT
    first_name,
    gender,
    COUNT(first_name) AS number_of_employees
FROM employees
WHERE first_name IN ("Irena", "Vidya", "Maya")
GROUP BY gender, first_name;

# 8.- Using your query that generates a username for all of the employees, generate a count employees for each unique username. Are there any duplicate usernames? BONUS: How many duplicate usernames are there?
#R1.- The original count was 300,024
#R2.- Yes, there are 13,251 usernames with two or more duplicates; 793 with 3 or more duplicates; 88 with 4 or more duplicates; 16 with 5 or more duplicates; and 4 with 6 duplicates.
SELECT
    CONCAT(LOWER(SUBSTR(first_name, 1, 1)), LOWER(SUBSTR(last_name, 1, 4)), "_", SUBSTR(birth_date, 6, 2), SUBSTR(birth_date, 3, 2)) AS "Username",
    COUNT(CONCAT(LOWER(SUBSTR(first_name, 1, 1)), LOWER(SUBSTR(last_name, 1, 4)), "_", SUBSTR(birth_date, 6, 2), SUBSTR(birth_date, 3, 2))) AS "Count"
FROM employees
GROUP BY (CONCAT(LOWER(SUBSTR(first_name, 1, 1)), LOWER(SUBSTR(last_name, 1, 4)), "_", SUBSTR(birth_date, 6, 2), SUBSTR(birth_date, 3, 2)))
HAVING COUNT(COUNT) > 1;



SELECT
    LOWER(
        CONCAT(
            SUBSTR(first_name, 1, 1),
            SUBSTR(LAST_NAME, 1, 4),
            "_",
            SUBSTR(birth_date, 6, 2),
            SUBSTR(birth_date, 3, 2)
           )
         ) AS Username,
    COUNT(*) AS number_of_duplicates
FROM employees
GROUP BY Username
HAVING number_of_duplicates > 1;