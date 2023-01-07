-- QUERYING DATABASES --

-- COUNT() FUNCTION
-- counts the number of records with a value in a field
SELECT COUNT(birthdate) AS count_birthdates
FROM people;

-- COUNT() multiple fields
SELECT COUNT(name) AS count_names, COUNT(birthdate) AS count_birthdates
FROM people;

-- Using * with COUNT()
-- * represents all fields
SELECT COUNT(*) AS total_records
FROM people;

-- DISTINCT
-- removes duplicates and returns unique values
SELECT DISTINCT language
FROM films;

-- COUNT() with DISTINCT
-- count the number of unique values 
SELECT COUNT(DISTINCT birthdate) AS count_distinct_birthdates
FROM people;

-- EXERCISES -- 

-- Practice with COUNT()

-- Count the number of records in the people table
SELECT COUNT(*) AS count_records
FROM people;

-- Count the number of birthdates in the people table
SELECT COUNT(birthdate) AS count_birthdate
FROM people;

-- Count the languages and countries represented in the films table
SELECT COUNT(language) AS count_languages, COUNT(country) AS count_countries
FROM films;

-- SELECT DISTINCT

-- Return the unique countries from the films table
SELECT DISTINCT country
FROM films;

-- Count the distinct countries from the films table
SELECT COUNT(DISTINCT country) AS count_distinct_countries
FROM films;

-- QUERY EXECUTION --
-- SQL is not processed in the order it is written

-- SQL STYLE --
-- Holywell's style guide for SQL - best practices
-- Write clear and readable code





