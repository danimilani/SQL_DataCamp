-- INNER JOIN
-- Key is a single our group column that uniquely identify a record in the table
-- INNER JOIN looks for records in both tables which match a given field
-- table.column_name format must be used to avoid errors

-- Inner join of presidents and prime ministers, joining on country
SELECT prime_ministers.country, prime_ministers.continent, prime_minister, president
FROM prime_ministers
INNER JOIN presidents
ON prime_ministers.country = presidents.country;

-- Inner join of presidents and prime ministers, joining on country with alias tables
SELECT p1.country, p1.continent, prime_minister, president
FROM prime_ministers AS p1
INNER JOIN presidents AS p2
ON p1.country = p2.country;

-- Use USING when the column names are equal
SELECT p1.country, p1.continent, prime_minister, president
FROM prime_ministers AS p1
INNER JOIN presidents AS p2
USING(country);

-- Your first join

-- Select all columns from cities
SELECT *
FROM cities;
-- Inner join to countries
INNER JOIN countries
-- Match on country codes
ON cities.country_code = countries.code;

-- Select name fields (with alias) and region 
SELECT cities.name AS city, countries.name AS country, countries.region
FROM cities
INNER JOIN countries
ON cities.country_code = countries.code;

-- Joining with aliased tables

-- Select fields with aliases
SELECT c.code AS country_code, c.name, e.year, e.inflation_rate
FROM countries AS c
-- Join to economies (alias e)
INNER JOIN economies AS e
-- Match on code field using table aliases
ON c.code =  e.code;

-- USING in action
SELECT c.name AS country, l.name AS language, official
FROM countries AS c
INNER JOIN languages AS l
-- Match using the code column
USING (code);

-- Defining relationships

-- One-to-many relationships
-- Most common type, one single entity is associated to several entities

-- One-to-one relationships
-- Unique pairings between entities, less common

-- Many-to-many relationships
-- i.e. languages and countries, many languages can be spoken in many countries

-- Inspecting a relationship

-- Select country and language names, aliased
SELECT c.name AS country, l.name AS language
-- From countries (aliased)
FROM countries AS c
-- Join to languages (aliased)
INNER JOIN languages AS l
-- Use code as the joining field with the USING keyword
USING (code);

-- Rearrange SELECT statement, keeping aliases
SELECT l.name AS language, c.name AS country
FROM countries AS c
INNER JOIN languages AS l
USING(code)
-- Order the results by language
ORDER BY language;

-- Multiple joins

-- Joins on Joins
SELECT *
FROM left_table
INNER JOIN right_table
ON left_table.id = right_table.id
INNER JOIN another_table
ON left_table.id = another_table.id;

-- Chaining Joins
SELECT
  p1.country,
  p1.continent,
  president,
  prime_minister,
  pm_start
FROM prime_ministers as p1
INNER JOIN presidents as p2
USING(country)
INNER JOIN prime_minister_terms as p3
USING(prime_minister);

-- Joining on multiple keys
SELECT *
FROM left_table
INNER JOIN right_table
ON left_table.id = right_table.id
  AND left_table.date = right_table.date;
  
-- EXERCISES

-- Joining multiple tables

-- Select relevant fields
SELECT name, year, fertility_rate
-- Inner join countries and populations, aliased, on code
FROM countries AS c
INNER JOIN populations AS p
ON c.code = p.country_code;

-- Select fields
SELECT name, e.year, fertility_rate, e.unemployment_rate
FROM countries AS c
INNER JOIN populations AS p
ON c.code = p.country_code
-- Join to economies (as e)
INNER JOIN economies AS e
-- Match on country code
ON p.country_code =  e.code;

-- Checking multi-table joins

SELECT name, e.year, fertility_rate, unemployment_rate
FROM countries AS c
INNER JOIN populations AS p
ON c.code = p.country_code
INNER JOIN economies AS e
ON c.code = e.code
-- Add an additional joining condition such that you are also joining on year
	AND p.year = e.year;
  
  


