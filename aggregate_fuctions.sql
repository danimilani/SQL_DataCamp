-- AGGREGATE FUNCTIONS

-- Summarizing Data
-- Aggregate functions: AVG(), SUM(), MIN(), MAX(), COUNT()
-- They come after SELECT function and operate on the field or column
-- AVG and SUM can only be used in numerical fields
-- COUNT, MIN and MAX in various data types

-- Practice with aggregate functions

-- Query the sum of film durations
SELECT SUM(duration) AS total_duration
FROM films;

-- Calculate the average duration of all films
SELECT AVG(duration) AS average_duration
FROM films;

-- Find the latest release_year
SELECT MAX(release_year) AS latest_year
FROM films;

-- Find the duration of the shortest film
SELECT MIN(duration) AS shortest_film
FROM films;

-----------------------------------

-- Summarizing subsets

-- Using WHERE with aggregate functions

SELECT AVG(budget) AS avg_budget
FROM films
WHERE release_year >= 2000;

SELECT SUM(budget) AS sum_budget
FROM films
WHERE release_year = 2000;

SELECT MIN(budget) AS min_budget
FROM films
WHERE release_year = 2000;

SELECT MAX(budget) AS max_budget
FROM films
WHERE release_year = 2000;

SELECT COUNT(budget) AS count_budget
FROM films
WHERE release_year = 2000;

-- Using ROUND()
-- To round a number to a specified decimal

SELECT ROUND(AVG(budget), 2) AS avg_budget
FROM films
WHERE release_year >= 2000;

-- To round a number to a Whole number

SELECT ROUND(AVG(budget)) AS avg_budget
FROM films
WHERE release_year >= 2000;

-- Using ROUND() with a negative parameter

SELECT ROUND(AVG(budget, -5)) AS avg_budget
FROM films
WHERE release_year >= 2000;

-- Combining aggregate functions with WHERE

-- Calculate the sum of gross from the year 2000 or later
SELECT SUM(gross) AS total_gross
FROM films
WHERE release_year >= 2000;

-- Calculate the average gross of films that start with A
SELECT AVG(gross) AS avg_gross_A
FROM films
WHERE title LIKE 'A%'

-- Calculate the lowest gross film in 1994
SELECT MIN(gross) AS lowest_gross
FROM films
WHERE release_year = 1994;

-- Calculate the highest gross film released between 2000-2012
SELECT MAX(gross) AS highest_gross
FROM films
WHERE release_year > 2000 AND release_year < 2012;

-- Using ROUND()

-- Round the average number of facebook_likes to one decimal place
SELECT ROUND(AVG(facebook_likes), 1) AS avg_facebook_likes
FROM reviews;

-- ROUND() with a negative parameter

-- Calculate the average budget rounded to the thousands
SELECT ROUND(AVG(budget), -3) AS avg_budget_thousands
FROM films;

-- Aliasing and arithmetic

-- Arithmetic: +,-,* and /
-- Arithmetic functions adds up the records horizontally

SELECT (gross - budget)
FROM films;

-- You always need to use an alias when calculating fields

SELECT (gross - budget) AS profit
FROM films;

-- Aliasing with functions

SELECT MAX(budget) AS max_budget,
       MAX(duration) AS max_duration
FROM films;

-- Order of execution
-- FROM, WHERE, SELECT, LIMIT

-- Aliasing with functions

-- Calculate the title and duration_hours from films
SELECT title, (duration/60.0) AS duration_hours
FROM films;

-- Calculate the percentage of people who are no longer alive
SELECT COUNT(deathdate) * 100.0 / COUNT(*) AS percentage_dead
FROM people;

-- Find the number of decades in the films table
SELECT (MAX(release_year) - MIN(release_year)) / 10.0 AS number_of_decades
FROM films;

-- Rounding results

-- Round duration_hours to two decimal places
SELECT title, ROUND((duration / 60.0), 2) AS duration_hours
FROM films;

-- Sorting results

-- Put the data on specific order


