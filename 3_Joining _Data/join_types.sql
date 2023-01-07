-- LEFT and RIGHT JOINs

-- LEFT JOIN
-- LEFT JOIN will return all records in the left table and those records in the
-- right table that match on the joining field provided
-- LEFT JOIN can also be written as LEFT OUTER JOIN

SELECT p1.country, prime_minister, president
FROM prime_ministers AS p1
LEFT JOIN presidents AS p2
USING(country);

-- RIGHT JOIN 
-- Less common than left join
-- RIGHT JOIN does the reverse of LEFT JOIN
-- RIGHT JOIN can also be written as RIGHT OUTER JOIN

SELECT *
FROM left_table
RIGHT JOIN right_table
ON left_table.id - right_table.id;

SELECT p1.country, prime_minister, president
FROM prime_ministers AS p1
RIGHT JOIN presidents AS p2
USING(country);

-- EXERCISES

-- This is a LEFT JOIN, right?

SELECT 
    c1.name AS city,
    code,
    c2.name AS country,
    region,
    city_proper_pop
FROM cities AS c1
-- Perform an inner join with cities as c1 and countries as c2 on country code
INNER JOIN countries AS c2
ON c1.country_code = c2.code
ORDER BY code DESC;

-- Change the code to perform a LEFT JOIN instead of an INNER JOIN

SELECT 
	c1.name AS city, 
    code, 
    c2.name AS country,
    region, 
    city_proper_pop
FROM cities AS c1
-- Join right table (with alias)
LEFT JOIN countries AS c2
ON c1.country_code = c2.code
ORDER BY code DESC;

-- Building on your LEFT JOIN

SELECT name, region, gdp_percapita
FROM countries AS c
LEFT JOIN economies AS e
-- Match on code fields
USING(code) 
-- Filter for the year 2010
WHERE year = 2010;

-- Select region, and average gdp_percapita as avg_gdp
SELECT region, AVG(gdp_percapita) AS avg_gdp
FROM countries AS c
LEFT JOIN economies AS e
USING(code)
WHERE year = 2010
-- Group by region
GROUP BY region;

SELECT region, AVG(gdp_percapita) AS avg_gdp
FROM countries AS c
LEFT JOIN economies AS e
USING(code)
WHERE year = 2010
GROUP BY region
-- Order by descending avg_gdp
ORDER BY avg_gdp DESC
-- Return only first 10 records
LIMIT 10;


-- Is this RIGHT?
-- Modify this query to use RIGHT JOIN instead of LEFT JOIN
SELECT countries.name AS country, languages.name AS language, percent
FROM languages
RIGHT JOIN countries
USING(code)
ORDER BY language;

-- FULL JOINs
-- Last of 3 types of OUTER join
-- Combines a LEFT and RIGHT join, returns all ids

-- Syntax
SELECT left_table.id AS l_id,
	right_table.id AS r_id,
	left_table.val AS l_val,
	right_table.vak AS r_val
FROM left_table
FULL JOIN right_table
USING (id);

-- Example using leaders database
SELECT p1.country AS country, prime_minister, president
FROM prime_ministers AS p1
FULL JOIN presidents AS p2
ON p1.country = p2.country
LIMIT 10;

-- EXERCISES

-- Comparing joins

-- FULL JOIN
SELECT name AS country, code, region, basic_unit
FROM countries
-- Join to currencies
FULL JOIN currencies 
USING (code)
-- Where region is North America or name is null
WHERE region = 'North America' OR name IS NULL
ORDER BY region;

-- LEFT JOIN
SELECT name AS country, code, region, basic_unit
FROM countries
-- Join to currencies
LEFT JOIN currencies 
USING (code)
WHERE region = 'North America' 
	OR name IS NULL
ORDER BY region;

-- INNER JOIN
SELECT name AS country, code, region, basic_unit
FROM countries
-- Join to currencies
INNER JOIN currencies 
USING (code)
WHERE region = 'North America' 
	OR name IS NULL
ORDER BY region;


-- Chaining FULL JOINs
SELECT 
	c1.name AS country, 
    region, 
    l.name AS language,
	basic_unit, 
    frac_unit
FROM countries as c1 
-- Full join with languages (alias as l)
FULL JOIN languages AS l 
USING (code) 
-- Full join with currencies (alias as c2)
FULL JOIN currencies AS c2 
USING(code)
WHERE region LIKE 'M%esia';

-- CROSS JOIN
-- Creates all possible combinations of two tables (ids of table 1 with ids of table 2)

-- Syntax
SELECT id1, id2
FROM table1
CROSS JOIN table2;

-- Pairing prime ministers with presidents
SELECT prime_minister, president
FROM prime_ministers AS p1
CROSS JOIN presidents AS p2
WHERE p1.continent IN ('Asia')
	AND p2.continent IN ('South America');

-- EXERCISES

-- Histories and languages

SELECT c.name AS country, l.name AS language
-- Inner join countries as c with languages as l on code
FROM countries AS c
INNER JOIN languages AS l
USING (code)
WHERE c.code IN ('PAK','IND')
	AND l.code in ('PAK','IND');
	
SELECT c.name AS country, l.name AS language
FROM countries AS c        
-- Perform a cross join to languages (alias as l)
CROSS JOIN languages AS l
WHERE c.code in ('PAK','IND')
	AND l.code in ('PAK','IND');
	
-- Choosing your join

SELECT 
	c.name AS country,
    region,
    life_expectancy AS life_exp
FROM countries AS c
-- Join to populations (alias as p) using an appropriate join
LEFT JOIN populations as p 
ON c.code = p.country_code
-- Filter for only results in the year 2010
WHERE p.year = 2010
-- Sort by life_exp
ORDER BY life_exp
-- Limit to five records
LIMIT 5;


-- SELF JOINS
-- Table is joined with itself to compare values from part of table with other values
-- within the same table
-- Dont have dedicated syntax
-- Aliasing is required for a self-join

SELECT
	p1.country AS country1,
	p2.country AS country2,
	p1.continent
FROM prime_ministers AS p1
INNER JOIN prime_ministers AS p2
ON p1.continent = p2.continent
-- exclude records where the two country fields are the same
	AND p1.country <> p2.country;

-- EXERCISES

-- Comparing a country to itself
-- Select aliased fields from populations as p1
SELECT 
	p1.country_code, 
    p1.size AS size2010, 
    p2.size AS size2015
-- Join populations as p1 to itself, alias as p2, on country code
FROM populations AS p1
INNER JOIN populations AS p2
USING(country_code);

SELECT 
	p1.country_code, 
    p1.size AS size2010, 
    p2.size AS size2015
FROM populations AS p1
INNER JOIN populations AS p2
ON p1.country_code = p2.country_code
WHERE p1.year = 2010
-- Filter such that p1.year is always five years before p2.year
    AND p1.year = (p2.year - 5);
    











