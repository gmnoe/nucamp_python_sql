-- Assume table has 100,000,000 rows
CREATE TABLE people (
    id SERIAL PRIMARY KEY,
    full_name TEXT NOT NULL,
    birthdate DATE DEFAULT now()
);

-- Searching birthdate without index, will scan 3x 300,000,000 rows
SELECT full_name FROM people WHERE birthdate = '1912-06-23'
SELECT full_name FROM people WHERE birthdate = '1903-12-28'
SELECT full_name FROM people WHERE birthdate = '1916-04-30'

-- Index syntax
CREATE INDEX index_name ON table_name (column_name);

CREATE INDEX people_birthdate_index ON people (birthdate);