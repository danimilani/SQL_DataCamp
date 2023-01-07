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




