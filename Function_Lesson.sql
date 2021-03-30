SELECT CONCAT("Good morning,", " Florence");
USE sakila;

USE chipotle;

SHOW TABLES;

SELECT *
FROM orders;

SELECT CONCAT(item_name, ": ", choice_description)
    AS "item_plus_choice_desc"
    FROM orders;

SELECT item_name
FROM orders
WHERE item_name
NOT LIKE "%b%";

# SUBSTRINGS: SUBSTR

SELECT SUBSTR("When I see the sun always shines on TV", 12, 7);
SELECT SUBSTR("When I see the sun always shines on TV", 12);
SELECT SUBSTR("When I see the sun always shines on TV", 2, 5);

# REPLACE

SELECT REPLACE("This is a string", "STRING", "not a string I am lying");

SELECT REPLACE(item_name, "Bowl", "Unburrito")
FROM orders;

SELECT REPLACE(item_name, "S", "XXXXXXX")
FROM orders;

# UPPER / LOWER

SELECT UPPER("yelling");

SELECT LOWER("BAKUBDSDBCKAJSD");

SELECT UPPER(choice_description)
FROM orders;

SELECT UPPER(
    CONCAT(item_name, ": ", choice_description))
    AS "column_name_custom"
    FROM orders;
    
# TIME FUNCTIONS

SELECT NOW();

SELECT CURTIME();

SELECT CURDATE();

SELECT UNIX_TIMESTAMP();

SELECT UNIX_TIMESTAMP("2021-03-29 15:07:15");

SELECT CONCAT("Data Science Instructor at Codeup For ", UNIX_TIMESTAMP() - UNIX_TIMESTAMP("2021-01-11 09:00:00"), " seconds");

# MATH FUNCTIONS

SELECT *
FROM orders;

SELECT MAX(quantity)
FROM orders;

SELECT MIN(quantity)
FROM orders;

SELECT AVG(quantity)
FROM orders;

# CASTING

SELECT CONCAT(1, " ham sandwich");

SELECT 
    CAST(12345  AS CHAR(1))
    CAST("99" AS UNSIGNED);
    
    
### GROUP BY LESSON, 29 March 2021

USE titanic_db;

SELECT *
FROM passengers;

SELECT *
FROM passengers
LIMIT 10;

SELECT
    COUNT(*) AS "number_of_passengers"
FROM passengers;

SELECT
    DISTINCT class
FROM passengers;

SELECT
    class
FROM passengers
GROUP BY class desc;

SELECT
    DISTINCT sex
FROM passengers;

SELECT
    sex,
    class
FROM passengers
GROUP BY sex, class;

SELECT
    sex,
    COUNT(*) AS number_of_passengers
FROM passengers
GROUP BY sex;

SELECT
    deck,
    COUNT(deck) AS "non-null-values",
    COUNT(*) AS "all_rows"
FROM passengers
GROUP BY sex, class;

SELECT
    sex,
    class,
    COUNT(*) AS number_of_passenger
FROM passengers
GROUP BY sex, class;

SELECT
    sex,
    ROUND(AVG(fare), 2) AS average_fare_paid,
    MIN(fare) AS minimum_fare_paid,
    ROUND(MAX(fare), 2) AS maximun_fare_paid,
    ROUND(STDDEEV(fare), 2) AS standard_deviation_in_fare
FROM passengers
GROUP BY sex;