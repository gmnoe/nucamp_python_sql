CREATE TABLE divisions (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL UNIQUE
);

CREATE TABLE teams (
    id SERIAL PRIMARY KEY,
    city TEXT NOT NULL,
    name TEXT NOT NULL UNIQUE,
    home_color TEXT NOT NULL,
    away_color TEXT,
    divion_id INT
);

ALTER TABLE teams   
ADD CONSTRAINT fk_division
FOREIGN KEY (divion_id)
REFERENCES divions(id)
ON DELETE SET NULL;

INSERT INTO divions (name)
VALUES ('Atlantic'), ('Metropolitan'), ('Pacific'), ('Central');

VALUES INSERT INTO teams (city, name, home_color, away_color, division_id) VALUES 
('New York', 'Islanders', 'Royal blue', 'White', 2),
('Seattle', 'Kraken', 'Deep sea blue', 'White', 3);

UPDATE divisions set name = 'Cosmopolitan' 
WHERE name = 'Metropolitan';

DELETE FROM divisions WHERE name = 'Cosmopolitan';
