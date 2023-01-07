-- SUBQUERIES

-- Subquerying with semi joins and anti joins

-- SEMI JOIN
-- Chooses records in the 1st table where a condition is met in the 2nd table
-- Returns all values from left_table where values of col1 are in col2 in the right table

SELECT president, country, continent
FROM presidents
WHERE country IN
  (SELECT country
  FROM states
  WHERE indep_year < 1800);


-- ANTI JOIN
-- Chooses records in the 1st table where col1 does not find a match in col2
-- Returns all values from left_table where values of col1 are NOT in col2 in the right table

SELECT country, president
FROM presidents
WHERE continent LIKE '%America'
  AND country NOT IN
  (SELECT country
  FROM states
  WHERE indep_year < 1800);

-- EXERCISES

-- Semi join

-- Select country code for countries in the Middle East
SELECT code
FROM countries
WHERE region = 'Middle East';

-- Select unique language names
SELECT DISTINCT name
FROM languages
-- Order by the name of the language
ORDER BY name ASC;

-- Create semi join with two queries above
SELECT DISTINCT name
FROM languages
-- Add syntax to use bracketed subquery below as a filter
WHERE code IN
    (SELECT code
    FROM countries
    WHERE region = 'Middle East')
ORDER BY name;

-- Diagnosing problems using anti join

-- Select code and name of countries from Oceania
SELECT code, name
FROM countries
WHERE continent = 'Oceania';

-- Create ANTI JOIN
SELECT code, name
FROM countries
WHERE continent = 'Oceania'
-- Filter for countries not included in the bracketed subquery
  AND code NOT IN
    (SELECT code
    FROM currencies);
    
    
-- SUBQUERIES inside WHERE and SELECT

-- Syntax for subqueries inside WHERE
-- All semi joins and anti joins included a subquery in WHERE
-- WHERE is the most common place for subqueries

SELECT *
FROM some_table
WHERE some_numeric_field IN (4,8,12);

-- Syntax for subqueries inside WHERE
SELECT *
FROM some_table
WHERE some_field IN
  (SELECT some_numeric_field
  FROM another_table
  WHERE field2 = some_condition);

-- Subqueries inside SELECT
-- Subqueries inside a SELECT statement requires an alias

SELECT DISTINCT continent,
  (SELECT COUNT(*)
  FROM monarchs
  WHERE states.continent = monarch.continent) AS monarch_count
FROM states;

-- EXERCISES

-- Subquery inside WHERE

-- Select average life_expectancy from the populations table
SELECT AVG(life_expectancy) 
FROM populations
-- Filter for the year 2015
WHERE year = 2015;

SELECT *
FROM populations
-- Filter for only those populations where life expectancy is 1.15 times higher than average
WHERE life_expectancy > 1.15 * 
  (SELECT AVG(life_expectancy)
   FROM populations
   WHERE year = 2015) 
    AND year = 2015;

-- WHERE do people live?

-- Select relevant fields from cities table
SELECT name, country_code, urbanarea_pop
FROM cities
-- Filter using a subquery on the countries table
WHERE name IN (SELECT capital FROM countries)
ORDER BY urbanarea_pop DESC;

-- Subquery inside SELECT

-- Find top nine countries with the most cities
SELECT countries.name AS country, COUNT(*) AS cities_num
FROM countries
LEFT JOIN cities
ON countries.code = cities.country_code
GROUP BY country
-- Order by count of cities as cities_num
ORDER BY cities_num DESC, country
LIMIT 9;

SELECT countries.name AS country,
-- Subquery that provides the count of cities   
  (SELECT COUNT(*)
   FROM cities
   WHERE countries.code = cities.country_code) AS cities_num
FROM countries
ORDER BY cities_num DESC, country
LIMIT 9;

-- Subqueries inside FROM
-- We can include multiple tables in a FROM clause by adding a comma between them

SELECT left_table.id, left_val
FROM left_table, right_table
WHERE left_table.id = right_table.id

-- We can drop duplicates using DISTINCT

SELECT DISTINCT left_table.id, left_val
FROM left_table, right_table
WHERE left_table.id = right_table.id

-- Query to return continents with monatchs and the year the most recent country gained independence

SELECT DISTINCT monarchs.continent, sub.most_recent
FROM monarchs,
  (SELECT continent, MAX(indep_year) AS most_recent
  FROM states
  GROUP BY continent) AS sub
WHERE monarchs.continent = sub.continent
ORDER BY continent;


-- EXERCISES

-- Subquery inside FROM

-- Select code, and language count as lang_num
SELECT code, COUNT(*) AS lang_num
FROM languages
GROUP BY code;

-- Select local_name and lang_num from appropriate tables
SELECT local_name, sub.lang_num
FROM countries,
    (SELECT code, COUNT(*) AS lang_num
     FROM languages
     GROUP BY code) AS sub
-- Where codes match    
WHERE countries.code = sub.code
ORDER BY lang_num DESC;

-- Subquery challenge

-- Select relevant fields
SELECT code, inflation_rate, unemployment_rate
FROM economies
WHERE year = 2015 
  AND code NOT IN
-- Subquery returning country codes filtered on gov_form
    (SELECT code
     FROM countries
     WHERE (gov_form LIKE '%Monarchy%' OR gov_form LIKE '%Republic%'))
ORDER BY inflation_rate;


-- Final Challenge

-- Select fields from cities
SELECT name, country_code, city_proper_pop, metroarea_pop, (city_proper_pop / metroarea_pop * 100) AS city_perc
FROM cities
-- Use subquery to filter city name
WHERE name IN
    (SELECT capital
    FROM countries
    WHERE (continent = 'Europe' OR continent LIKE '%America'))
-- Add filter condition such that metroarea_pop does not have null values
AND metroarea_pop IS NOT NULL
-- Sort and limit the result
ORDER BY city_perc DESC
LIMIT 10;











