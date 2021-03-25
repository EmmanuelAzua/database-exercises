#This is my first exercise for MYSQL and its basic statements

# Create a new file called select_exercises.sql. Store your code for this exercise in that file. You should be testing your code in Sequel Pro as you go.
# Use the albums_db database.

# Explore the structure of the albums table.
DESCRIBE albums;

# b. How many unique artist names are in the albums table? R.- 23
SELECT DISTINCT `artist`
FROM albums;

# c. What is the primary key for the albums table? R.- id

# d. What is the oldest release date for any album in the albums table? What is the most recent release date? R.- 1967 and 2011, respectively
SELECT *
FROM albums
order by release_date;

# Write queries to find the following information:
# a. The name of all albums by Pink Floyd R.- The Dark Side of The Moon, and The Wall
SELECT *
FROM albums
WHERE artist = "Pink Floyd";

# b. The year Sgt. Pepper's Lonely Hearts Club Band was released R.- 1967
SELECT *
FROM albums
WHERE name = "Sgt. Pepper's Lonely Hearts Club Band";

# c. The genre for the album Nevermind R.- Grunge, Alternative Rock
SELECT *
FROM albums
WHERE name = "Nevermind";

# d. Which albums were released in the 1990s R.- (run code and see below, there were 11 albums)
SELECT *
FROM albums
WHERE release_date BETWEEN 1990 AND 1999;

# e. Which albums had less than 20 million certified sales R.- (run code and see below, there were 13 albums)
SELECT *
FROM albums
WHERE sales < 20;

# f. All the albums with a genre of "Rock". Why do these query results not include albums with a genre of "Hard rock" or "Progressive rock"? R.- Five albums. The return does not show other variants of the Rock genre because the code is instructing the client to only look for a specific string. In this case, the specific string is "Rock".
SELECT *
FROM albums
WHERE genre = "Rock";

select max(release_date)
from albums;

select min(release_date)
from albums;


# Thursday, 25 March 2021

USE albums_db;
#
SELECT *
FROM albums;
#
SELECT DISTINCT artist
FROM albums;
#
SELECT name
FROM albums
WHERE release_date = 1990;
#
SELECT genre
FROM albums
WHERE genre LIKE "%rock%";

#
SELECT name
FROM albums
WHERE name LIKE "%at%";

#
SELECT name
FROM albums
WHERE name LIKE "%the%";

#
SELECT name
FROM albums
WHERE name LIKE "%a";

#
SELECT name
FROM albums
WHERE name LIKE "a%";

#
SELECT *
FROM albums
WHERE release_date BETWEEN 1990 AND 1999;

#
select *
FROM albums
WHERE release_date LIKE "199%";

#
SELECT
    artist,
    name,
    sales
FROM albums
WHERE sales BETWEEN 10 AND 20;

#
USE chipotle;

#
SELECT *
FROM orders;

#
SELECT DISTINCT ITEM_NAME
FROM orders;

#
SELECT DISTINCT item_name
FROM orders
WHERE item_name LIKE "%chicken%";

#
select *
from ORDERS
where ITEM_NAME in ("veggie soft tacos", "crispy tacos", "steak bowl");

#
SELECT *
FROM orders
WHERE order_id IN (1, 7, 10);

#
USE chipotle;

#
SELECT *
FROM orders
WHERE item_name = "Veggie Soft Tacos" OR item_name = "Crispy Tacos" OR item_name = "Steak Bowl";

#
SELECT *
FROM orders
WHERE order_id = 1 OR order_id = 7 OR ORDER_ID = 10;

#
SELECT *
FROM orders
WHERE item_name LIKE "%chicken%"
    OR order_id = 10;
    
#
SELECT *
FROM orders
WHERE ITEM_NAME LIKE "%chicken%"
    AND order_id = 10;
    
#
SELECT *
FROM orders
WHERE item_name LIKE "Veggie Soft Tacos"
    AND order_id IN (304, 322);
    
#
SELECT *
FROM orders
WHERE item_name LIKE "Veggie Soft Tacos"
    AND order_id IN (304, 322)
    OR item_name = "Crispy Tacos";
    
#
SELECT item_name
FROM orders
WHERE item_name = "Crispy Tacos"

#
SELECT *
FROM orders
WHERE order_id IN (304, 322)
    OR item_name = "Crispy Tacos";

SELECT *
FROM orders
WHERE item_name LIKE "Veggie Soft Tacos"
    AND (
    order_id IN (304, 322)
    OR item_name = "Crispy Tacos"
    );


#
SELECT *
FROM orders
WHERE choice_description LIKE "%red%";

#
SELECT *
FROM orders
WHERE choice_description LIKE "%red%"
    AND item_name LIKE "%tacos%";
    
#
SELECT *
FROM orders
WHERE choice_description LIKE "%red%"
    AND item_name LIKE "%tacos%"
    OR item_name LIKE "%soft%";
    
#
