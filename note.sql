CREATE TABLE note(
    -- SERIAL is the auto increment
    -- PRIMARY KEY is the unique key for every row
    -- doesn't have to provide information for this row while inserting
    id SERIAL PRIMARY KEY,
    -- NOT NULL is a CONSTRAINT for the property, while adding new thing, it is required to provide this information 
    name TEXT NOT NULL,
    -- DATE is a date type that belongs to TEXT in the form "year-month-date"
    calendar DATE 

);
-- add constraint to the row "name", no duplicates are allowed for this property 
ALTER TABLE note
ADD CONSTRAINT unique_name UNIQUE (name);

-- insert things into the table
INSERT INTO note (name, calendar)
VALUES ("testing", "0000-00-00");

INSERT INTO note (name, calendar)
VALUES ("Roy", "2001-05-16");

-- modify the table, add one more column
ALTER TABLE note
ADD COLUMN email TEXT;

-- modify the data in table
UPDATE note
SET email = "960289@gmail.com"
-- can have more than one conditional statement
WHERE id = 2;

-- deleting things from table
DELETE FROM note
WHERE id = 1;

-- * means select everything (column) from table_name
SELECT * FROM note;

-- select some specific properties from table, using comma to seperate them
SELECT name, email
FROM note;

-- select a column and temperory rename that with new name
-- the actual property in the table is still the same
SELECT name AS "newName"
FROm note;

-- modify the table name, comment out this line for easy coding 
--ALTER TABLE note
--RENAME TO new_note;

-- "select distinct" filters out all duplicate values in the specified column
SELECT DISTINCT id
FROM note;

-- select things with specific condition
SELECT * FROM note
WHERE id < 10;

-- "LIKE" command, '_' is a wildcard character, which can substitute any individual character here without breaking the pattern
-- "LIKE" is not case sensitive
SELECT * FROM note
-- such as "R3y", "Rdy", "Roy" is fitting the condition
WHERE name LIKE 'R_y';

-- '%' is also a wildcard character, which can replace an enitre missing string or character
SELECT * FROM movies
-- "123man456", "man__ 25", "Man_123" all can fit
WHERE name LIKE '%man%';

-- to statement for NULL >> "IS" or "IS NOT"
SELECT * FROM note
WHERE email IS NOT NULL;

-- "BETWEEN ___ AND ___" both properties are included, for instance, BETWEEN 100 AND 200, is the range from 100 - 200
-- this is a case sensetive statement
SELECT * FROM note
-- However, for this condition, only the things with exact 'R' will fit the statement, 'Ra' or anything like this are excluded.
-- my own thought, this is according to the lexiogical order
WHERE name BETWEEN 'A' AND 'R';

-- AND operator
-- OR is the same
SELECT * FROM note
WHERE id < 1985
    AND email LIKE '%@gmail.com';

-- ORDER BY 
SELECT * FROM note
WHERE id < 10
-- DESC means order by the descending order, ASC means the asscending order (default)
ORDER BY name DESC;

-- Limit
SELECT * FROM note
ORDER BY id DESC
LIMIT 3;

-- "CASE", usually use in SELECT statement, can think like if else statement
SELECT name,
    CASE
        -- if id == 1
        WHEN id = 1 THEN 'cool'
        -- else if 
        WHEN id = 2 THEN 'not so cool'
        ELSE 'So bad'
    -- output a new column with this "New property"
    -- 'cool', 'not so cool'... etc will be in here
    END AS "New property"
FROM note;

-- the result will be the number of the selected rows with non-empty values
SELECT COUNT(*) FROM note;

-- SUM() is a function that takes the name of a column as an argument and returns the sum of all the values in that column.
SELECT SUM(id) FROM note;

-- The MAX() and MIN() functions return the highest and lowest values in a column, respectively.
SELECT MAX(id) FROM note;

-- AVG() function to quickly calculate the average value of a particular column.
SELECT AVG(id) FROM note;

-- ROUND(value, Integer) rounds the values in the column to the number of decimal places specified by the integer.
SELECT name, ROUND(id, 0)
FROM note;
-- or this will output the avg of price and round it to 0.00
SELECT ROUND(AVG(price), 2)
FROM note;

-- GROUP BY, this command will put the same category together inorder
SELECT id, name, calendar
FROM note
GROUP BY name;
-- can have more than one GROUP like
SELECT id, name, calendar
FROM note
-- 1 is the first column for SELECT, in here id, 2 is name...
GROUP BY 1, 2
ORDER BY 1 DESC;

-- HAVING is pretty similar with WHERE but HAVING are more often used with GROUP BY, and before ORDER BY and LIMIT
SELECT id, name, COUNT(*)
FROM note
GROUP BY name
HAVING COUNT(*) > 5;
