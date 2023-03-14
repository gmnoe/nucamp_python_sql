-- Getting a count of frames of each specific size

WITH frames AS (
    SELECT
    CEIL(width) + 2 AS frame_width,
    CEIL(height) + 4 AS frame_height
    FROM moma_works
    WHERE classification = 'Photograph' AND width > 0 AND height > 0
)
SELECT
COUNT(*),
frame_width,
frame_height,
frame_width * frame_height AS frame_area
FROM frames
GROUP BY frame_width, frame_height, frame_area;

-- Using the jsonb_pretty() to format information
SELECT jsonb_pretty(info) AS formatted_info
FROM moma_artists LIMIT 50;

-- Selecting properties from the JSONB field
SELECT
info -> 'display_name' AS name,
info -> 'nationality' as nationality
FROM moma_artists
ORDER BY id
LIMIT 50;

-- We can't directly compare a JSONB value to a string.
-- First need to convert the JSONB value to string using the accessor operator with the double arrow head. 
SELECT
info -> 'display_name' AS name,
info -> 'nationality' AS nationality
FROM moma_artists
WHERE info ->> 'nationality' = 'American'
ORDER BY id
LIMIT 50;

-- json_object() to insert data
INSERT INTO moma_artists (info) VALUES (
    json_object('{display_name, nationality}', '{Ablade Glover, Ghanaian}')
);

-- Get number of redundant artist values
SELECT COUNT(artist) - COUNT(DISTINCT artist)
FROM moma_works;

-- Find artist with the most redundant values
SELECT COUNT(*), artist
FROM moma_works
GROUP BY artist
ORDER BY count DESC;

-- Indexes in moma db
SELECT * FROM pg_indexes;

CREATE INDEX moma_works_btree_index ON moma_works(artist);

SELECT tablename, indexname, indexdef FROM pg_indexes WHERE tablename NOT LIKE 'pg_%';
SELECT title FROM moma_works WHERE artist = 'Frank Lloyd Wright';

DROP INDEX moma_works_btree_index;
CREATE INDEX moma_works_hash_index ON moma_works USING HASH (artist);

-- Postgres Query Planner, only works in pgAdmin
EXPLAIN SELECT date_acquired FROM moma_works 
WHERE date_acquired BETWEEN '1950-01-01' AND '1959-12-31';

EXPLAIN ANALYZE SELECT date_acquired FROM moma_works 
WHERE date_acquired BETWEEN '1950-01-01' AND '1959-12-31';