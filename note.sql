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

-- * means select everything from table_name
SELECT * FROM note;



