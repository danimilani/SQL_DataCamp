-- FILTERING RECORDS --

-- WHERE filtering clause

-- Comparison Operators

-- greater than or after
SELECT title
FROM films
WHERE release_year > 1960;

-- less than or before
SELECT title
FROM films
WHERE release_year < 1960;

-- greater than or equal to
SELECT title
FROM films
WHERE release_year >= 1960;

-- less than or equal to
SELECT title
FROM films
WHERE release_year <= 1960;

-- equal to
SELECT title
FROM films
WHERE release_year = 1960;

-- not equal to
SELECT title
FROM films
WHERE release_year <> 1960;

-- WHERE with strings
SELECT title
FROM films
WHERE country = 'Japan';

-- EXERCISES --

-- Using WHERE with numbers

-- Select film_ids and imdb_score with an imdb_score over 7.0
SELECT film_id, imdb_score
FROM reviews
WHERE imdb_score > 7.0;

-- Select film_ids and facebook_likes for ten records with less than 1000 likes 
SELECT film_id, facebook_likes
FROM reviews
WHERE facebook_likes < 1000
LIMIT 10;

-- Count the records with at least 100,000 votes
SELECT COUNT(*) AS films_over_100K_votes
FROM reviews
WHERE num_votes >= 100000;

-- Using WHERE with text

-- Count the Spanish-language films
SELECT COUNT(language) AS count_spanish
FROM films
WHERE language = 'Spanish';

-- MULTIPLE CRITERIA --
-- OR, AND, BETWEEN keywords

SELECT *
FROM coats
WHERE color = 'yellow' OR length = 'short';

SELECT *
FROM coats
WHERE color = 'yellow' AND length = 'short';

SELECT *
FROM coats
WHERE buttons BETWEEN 1 AND 5;

-- OR operator
-- when you need to satisfy at least one condition
-- combine OR with WHERE
SELECT title
FROM films
WHERE release_year = 1994 
      OR release_year = 2000;
      
-- AND operator
-- when need to satisfy all criteria
SELECT title
FROM films
WHERE release_year > 1994
    AND release_year < 2000;

-- AND, OR
-- enclose individual clauses in parenthesis to ensure the order
-- filter films released in 1994 or 1995 and certified PG or R
SELECT title
FROM films
WHERE (release_year = 1994 OR release_year = 1995)
    AND (certification = 'PG' OR certification = 'R');

-- BETWEEN, AND
-- BETWEEN clause is inclusive
SELECT title
FROM films
WHERE release_year >= 1994
  AND release_year <=2000;

SELECT title
FROM films
WHERE release_year
  BETWEEN 1994 AND 2000;

-- BETWEEN, AND, OR
SELECT title
FROM films
WHERE release_year
BETWEEN 1994 AND 2000 AND country ='UK';

-- EXERCISES --

-- Using AND

-- Select the title and release_year for all German-language films released before 2000
SELECT title, release_year
FROM films
WHERE release_year < 2000
    AND language = 'German';
    
-- Update the query to see all German-language films released after 2000
SELECT title, release_year
FROM films
WHERE release_year > 2000
	AND language = 'German';

-- Select all records for German-language films released after 2000 and before 2010
SELECT *
FROM films
WHERE release_year > 2000
	AND release_year < 2010
	AND language = 'German';

-- Using OR

-- Find the title and year of films from the 1990 or 1999
SELECT title, release_year
FROM films
WHERE release_year = 1990 
    OR release_year = 1999;

-- filter by language English or Spanish
SELECT title, release_year
FROM films
WHERE (release_year = 1990 OR release_year = 1999)
-- Add a filter to see only English or Spanish-language films
	AND (language = 'English' OR language = 'Spanish');

-- Restrict query to only return films worth more than 2 million gross
SELECT title, release_year
FROM films
WHERE (release_year = 1990 OR release_year = 1999)
	AND (language = 'English' OR language = 'Spanish')
-- Filter films with more than $2,000,000 gross
	AND (gross > 2000000);

-- Using BETWEEN

-- Select the title and release_year for films released between 1990 and 2000
SELECT title, release_year
FROM films
WHERE release_year BETWEEN 1990 AND 2000;

-- Select only films with a budget over $100 million
SELECT title, release_year
FROM films
WHERE release_year BETWEEN 1990 AND 2000
-- Narrow down your query to films with budgets > $100 million
	AND (budget > 100000000);

-- Restrict query to only return spanish language films
SELECT title, release_year
FROM films
WHERE release_year BETWEEN 1990 AND 2000
	AND budget > 100000000
-- Restrict the query to only Spanish-language films
	AND language = 'Spanish';

-- Amend query to include all Spanish language or French language films
SELECT title, release_year
FROM films
WHERE release_year BETWEEN 1990 AND 2000
	AND budget > 100000000
-- Amend the query to include Spanish or French-language films
	AND (language = 'Spanish' OR language='French');


-- FILTERING TEXT --
-- search for patterns rather than specific text
-- LIKE, NOT LIKE, IN

-- LIKE
-- search for a pattern in a field

-- wildcard % match zero, one or many characters in the text
SELECT name
FROM people
WHERE name LIKE 'Ade%';

-- wildcard _ match a single character
SELECT name
FROM people
WHERE name LIKE 'Ev_';

-- NOT LIKE
-- find records that dont match a pattern
-- this is case sensitive
SELECT name
FROM people
WHERE name NOT LIKE 'A.%';

-- IN operator
-- allows us to specify multiple values in a WHERE clause
SELECT title
FROM films
WHERE release_year IN (1920, 1930, 1940);

SELECT title
FROM films
WHERE country IN ('Germany', 'France');

-- EXERCISES --

-- LIKE and NOT LIKE --

-- Select the names that start with B
SELECT name
FROM people
WHERE name LIKE 'B%';

-- Select the names of people whose names have r as second letter
SELECT name
FROM people
-- Select the names that have r as the second letter
WHERE name LIKE '_r%';

-- Select names of people whose names doesnt start with 'A'
SELECT name
FROM people
-- Select names that don't start with A
WHERE name NOT LIKE 'A%';

-- WHERE IN --

-- Find the title and release_year for all films over two hours in length released in 1990 and 2000
SELECT title, release_year
FROM films
WHERE release_year IN (1990,2000)
    AND duration > 120;

-- Find the title and language of all films in English, Spanish, and French
SELECT title, language
FROM films
WHERE language IN ('English', 'Spanish', 'French');

-- Find the title, certification, and language all films certified NC-17 or R that are in English, Italian, or Greek
SELECT title, certification, language
FROM films
WHERE certification IN ('NC-17', 'R')
    AND language IN ('English', 'Italian', 'Greek');

-- Combining filtering and selecting --

-- Count the unique titles
SELECT COUNT(DISTINCT title) AS nineties_english_films_for_teens
FROM films
-- Filter to release_years to between 1990 and 1999
WHERE release_year BETWEEN 1990 AND 1999
-- Filter to English-language films
	AND language = 'English'
-- Narrow it down to G, PG, and PG-13 certifications
	AND certification IN ('G', 'PG', 'PG-13');

-- NULL VALUES --
-- NULL represents a missing or unknown values

-- IS NULL
SELECT name
FROM people
WHERE birthdate IS NULL;

-- IS NOT NULL
SELECT COUNT(*) AS count_birthdates
FROM people
WHERE birthdate IS NOT NULL;

-- EXERCISES --

-- Practice with NULLs

-- List all film titles with missing budgets
SELECT title AS no_budget_info
FROM films
WHERE budget IS NULL;

-- Count the number of films we have language data for
SELECT COUNT(title) AS count_language_known
FROM films
WHERE language IS NOT NULL;






