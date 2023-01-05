-- RELATIONAL DATABASES --

-- QUERYING tables

-- Return all titles from the books table
SELECT title FROM books;

-- Select title and author from the books table
SELECT title, author
FROM books;

-- Select all fields from the books table
SELECT *
FROM books;

-- ALIASING -  rename columns
SELECT name AS first_name, year_hired
FROM employees;

-- DISTINCT records - no repeated values
SELECT DISTINCT year_hired
FROM employees;

SELECT DISTINCT dept_id, year_hired
FROM employees;

-- VIEWS

-- Virtual table that is the result of a saved SQL SELECT statement
CREATE VIEW employee_hire_years AS
SELECT id, name, year_hired
FROM employees;

SELECT id, name
FROM employee_hire_years;

-- EXERCISES --

-- Making queries DISTINCT

-- Select unique authors from the books table
SELECT DISTINCT author
FROM books;

-- Select unique authors and genre combinations from the books table
SELECT DISTINCT author, genre
FROM books;

-- Aliasing

-- Alias author so that it becomes unique_author
SELECT DISTINCT author AS unique_author
FROM books;

-- VIEWing your query

-- Save the results of this query as a view called library_authors
CREATE VIEW library_authors AS
SELECT DISTINCT author AS unique_author
FROM books;

-- Select all columns from library_authors
SELECT * FROM library_authors;

-- SQL FLAVORS --

-- All used with relational databases and keywords shared between them, following universal standards

-- 1.PostgreSQL
-- free and open source relational database system
-- refers to both the system as its associated SQL flavor

-- 2.SQL Server
-- free and paid versions, created by Microsoft
-- T-SQL is the flavor


