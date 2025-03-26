--
-- insert
--
-- \r\n (Windows, CRLF)
-- \n (Unix/Linux, Mac)
-- tänk på radbrytningar alá LF för alla csv filer!

USE exam;
-- INSERT INTO tabell_namn (kolumn1, kolumn2, kolumn3)
-- VALUES ('Värde', 123, '2025-03-27');



-- Om tabellen har minst en rad, raderas alla rader.
-- DELETE FROM tabell_namn WHERE EXISTS (SELECT 1 FROM tabell_namn LIMIT 1);

-- radera alla rader i tabeller
SET FOREIGN_KEY_CHECKS = 0;  -- Inaktivera referens
DELETE FROM tabell_namn;
DELETE FROM tabell_namn;
DELETE FROM tabell_namn;
DELETE FROM tabell_namn;
DELETE FROM tabell_namn;
SET FOREIGN_KEY_CHECKS = 1; -- aktiv


--
-- Enable LOAD DATA LOCAL INFILE on the server.
--

-- SET GLOBAL local_infile = 1;
-- SHOW VARIABLES LIKE 'local_infile';

--
-- Insert into tables.
--
LOAD DATA LOCAL INFILE 'tabell_namn.csv'
INTO TABLE tabell_namn
CHARSET utf8
FIELDS
    TERMINATED BY ','
    ENCLOSED BY '"'
LINES
    TERMINATED BY '\n'
IGNORE 1 LINES
(`kolumn_namn`, `kolumn_namn`, `kolumn_namn`, `kolumn_namn`, `kolumn_namn`, `kolumn_namn`);

SELECT * FROM tabell_namn;


LOAD DATA LOCAL INFILE 'tabell_namn.csv'
INTO TABLE tabell_namn
CHARSET utf8
FIELDS
    TERMINATED BY ','
    ENCLOSED BY '"'
LINES
    TERMINATED BY '\n'
IGNORE 1 LINES
(`kolumn_namn`, `kolumn_namn`, `kolumn_namn`, `kolumn_namn`, `kolumn_namn`, `kolumn_namn`);

SELECT * FROM tabell_namn;



LOAD DATA LOCAL INFILE 'tabell_namn.csv'
INTO TABLE tabell_namn
CHARSET utf8
FIELDS
    TERMINATED BY ','
    ENCLOSED BY '"'
LINES
    TERMINATED BY '\n'
IGNORE 1 LINES
(`kolumn_namn`, `kolumn_namn`, `kolumn_namn`);

SELECT * FROM tabell_namn;



LOAD DATA LOCAL INFILE 'tabell_namn.csv'
INTO TABLE tabell_namn
CHARSET utf8
FIELDS
    TERMINATED BY ','
    ENCLOSED BY '"'
LINES
    TERMINATED BY '\n'
IGNORE 1 LINES
(`kolumn_namn`, `kolumn_namn`, `kolumn_namn`);

SELECT * FROM tabell_namn;



LOAD DATA LOCAL INFILE 'tabell_namn.csv'
INTO TABLE tabell_namn
CHARSET utf8
FIELDS
    TERMINATED BY ','
    ENCLOSED BY '"'
LINES
    TERMINATED BY '\n'
IGNORE 1 LINES
(`kolumn_namn`, `kolumn_namn`, `kolumn_namn`);

SELECT * FROM tabell_namn;
