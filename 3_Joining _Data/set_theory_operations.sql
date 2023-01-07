-- SET THEORY OPERATIONS
-- UNION, INTERSECT and EXCEPT

-- UNION AND UNION ALL

-- UNION 
-- Takes two tables as input and returns all records from both tables
-- If two records are identical, UNION returns them only once

SELECT *
FROM left_table
UNION
SELECT *
FROM right_table;

-- UNION ALL
-- Takes two tables and returns all records from both tables
-- Includes duplicates

SELECT *
FROM left_table
UNION ALL
SELECT *
FROM right_table;

-- They do not require a field to join ON
-- Rather then comparing and merging they stack fields on top of another
-- For that, the number of selected columns and respective data types must be identical

SELECT monarch AS leader, country
FROM monarchs
UNION
SELECT prime_minister, country
FROM prime_ministers
ORDER BY country, leader
LIMIT 10;

SELECT monarch AS leader, country
FROM monarchs
UNION ALL
SELECT prime_minister, country
FROM prime_ministers
ORDER BY country, leader
LIMIT 10;

-- EXERCISES

-- Comparing global economies

-- Select all fields from economies2015
SELECT * 
FROM economies2015    
-- Set operation
UNION
-- Select all fields from economies2019
SELECT *
FROM economies2019
ORDER BY code, year;

-- Comparing two set operations

-- Query that determines all pairs of code and year from economies and populations, without duplicates
SELECT code, year
FROM economies
UNION 
SELECT country_code, year
FROM populations
ORDER BY code, year;

-- with duplicates
SELECT code, year
FROM economies
-- Set theory clause
UNION ALL 
SELECT country_code, year
FROM populations
ORDER BY code, year;

-- INTERSECT
-- Takes two tables as input and returns only records that exists in both tables
-- Requires all fields to match and same numbers of columns to compare records

-- Syntax
SELECT id, val
FROM left_table
INTERSECT
SELECT id, val
FROM right_table;

SELECT country AS intersect_country
FROM prime_ministers
INTERSECT
SELECT country
FROM presidents;

-- INTERSECT on two fields
SELECT country, prime_minister AS leader
FROM prime_ministers
INTERSECT
SELECT country, president
FROM presidents;

-- EXERCISE

-- INTERSECT
-- Return all cities with the same name as a country
SELECT name
FROM cities
INTERSECT
SELECT name
FROM countries;

-- EXCEPT
-- Identify records present in one table but not the other
-- Retain records in the left table that are not present in the right table

-- Syntax
SELECT monarch, country
FROM monarchs
EXCEPT
SELECT prime_minister, country
FROM prime_ministers;

-- EXERCISES

-- Return all cities that do not have the same name as a country
SELECT name
FROM cities
EXCEPT
SELECT name
FROM countries
ORDER BY name;



