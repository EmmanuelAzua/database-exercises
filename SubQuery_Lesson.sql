
USE chipotle;

SELECT *
FROM orders
LIMIT 5;

SELECT *
FROM orders
WHERE item_name IN(
SELECT item_name
FROM orders
WHERE item_name LIKE "%bowl"
);

SELECT *
FROM orders
WHERE item_name
LIKE "%bowl";

SELECT item_name, MAX(quantity)
FROM orders
GROUP BY item_name;

SELECT *
FROM orders
WHERE quantity = (
SELECT MAX(quantity)
FROM orders
);

USE employees;

SELECT first_name, last_name
FROM employees
WHERE emp_no IN(
SELECT emp_no
FROM dept_manager
WHERE to_date > NOW()
)
AND gender LIKE "F";