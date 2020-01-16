-- Create a table, `owners`
CREATE TABLE owners (
    id  INTEGER PRIMARY KEY,
    name TEXT
);
-- Create a related table, `bicycles`

CREATE TABLE bicycles (
    id  INTEGER PRIMARY KEY,
    model TEXT,
    owner_id INTEGER,
    FOREIGN KEY (owner_id) REFERENCES owners(id)
);

-- Create 3 bicycles and 2 owners

INSERT INTO owners(name)
VALUES (
    "Jeremy"
), (
    "Mike"
);

INSERT INTO bicycles(model, owner_id)
VALUES (
    "Rode", 1
), (
    "BMX", 2
), (
    "Hybrid", 2
);

-- Update the properties of one of the bicycles

UPDATE bicycles SET owner_id = 1 WHERE id = 2;

-- List all the bicycles

-- Turn on headers
.headers on
.mode column

-- SELECT * FROM owners;
SELECT * FROM bicycles;

-- List all the bicycles with their owners
SELECT bicycles.model, owners.name
FROM bicycles
INNER JOIN owners
ON bicycles.owner_id = owners.id
GROUP BY bicycles.model;

-- Delete one of the bicycles
DELETE FROM bicycles WHERE bicycles.id = 2