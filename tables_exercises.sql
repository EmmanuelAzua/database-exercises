show databases;
use zillow;
select database();
show databases;
use world;
select database();

#My first Table Exercise

use employees;
show tables;
# current_dept_emp, departments, dept_emp, dept_emp_latest_date, dept_manager, employees, salaries, titles

describe employees;
# Data types: INT, DATE, VARCHAR, ENUM
# Tables with a numeric column: current_dept_emp, dept_emp_latest_date, employees, salaries
# Tables with string cloumns: departments, dept_manager, employees, titles
# Tables with a date type column: dept_emp_latest_date, employees, salaries, titles

describe departments;
describe employees;
# Relationship between the employees and departments tables: none of those two tables list variables accepting NULL values; additionally, none of the variables in both tables have NULL default values


show create table dept_manager;
# CREATE TABLE `dept_manager` (
# `emp_no` int(11) NOT NULL,
# `dept_no` char(4) NOT NULL,
# `from_date` date NOT NULL,
# `to_date` date NOT NULL,
# PRIMARY KEY (`emp_no`,`dept_no`),
# KEY `dept_no` (`dept_no`),
# CONSTRAINT `dept_manager_ibfk_1` FOREIGN KEY (`emp_no`) REFERENCES `employees` (`emp_no`) ON DELETE CASCADE,
# CONSTRAINT `dept_manager_ibfk_2` FOREIGN KEY (`dept_no`) REFERENCES `departments` (`dept_no`) ON DELETE CASCADE
# ) ENGINE=InnoDB DEFAULT CHARSET=latin1


