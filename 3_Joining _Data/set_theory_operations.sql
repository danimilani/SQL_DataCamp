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


