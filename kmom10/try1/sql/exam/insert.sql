--
-- insert
--
-- \r\n (Windows, CRLF)
-- \n (Unix/Linux, Mac)
-- tänk på radbrytningar alá LF för alla csv filer!

USE exam;


-- Om tabellen har minst en rad, raderas alla rader.
-- DELETE FROM tabell_namn WHERE EXISTS (SELECT 1 FROM tabell_namn LIMIT 1);

-- radera alla rader i tabeller
SET FOREIGN_KEY_CHECKS = 0;  -- Inaktivera referens
DELETE FROM mineral;
DELETE FROM country;
DELETE FROM mineral2country;
DELETE FROM miner;
DELETE FROM miner2mineral;
SET FOREIGN_KEY_CHECKS = 1; -- aktiv


--
-- Enable LOAD DATA LOCAL INFILE on the server.
--

SET GLOBAL local_infile = 1;
SHOW VARIABLES LIKE 'local_infile';

--
-- Insert into tables.
--
LOAD DATA LOCAL INFILE 'mineral.csv'
INTO TABLE mineral
CHARSET utf8
FIELDS
    TERMINATED BY ','
    ENCLOSED BY '"'
LINES
    TERMINATED BY '\n'
IGNORE 1 LINES
(`id`, `name`, `uses`, `type`, `url`);

SELECT * FROM mineral;


LOAD DATA LOCAL INFILE 'country.csv'
INTO TABLE country
CHARSET utf8
FIELDS
    TERMINATED BY ','
    ENCLOSED BY '"'
LINES
    TERMINATED BY '\n'
IGNORE 1 LINES
(`id`, `name`, `url`);

SELECT * FROM country;



LOAD DATA LOCAL INFILE 'miner.csv'
INTO TABLE miner
CHARSET utf8
FIELDS
    TERMINATED BY ','
    ENCLOSED BY '"'
LINES
    TERMINATED BY '\n'
IGNORE 1 LINES
(`id`, `name`);

SELECT * FROM miner;



LOAD DATA LOCAL INFILE 'mineral2country.csv'
INTO TABLE mineral2country
CHARSET utf8
FIELDS
    TERMINATED BY ','
    ENCLOSED BY '"'
LINES
    TERMINATED BY '\n'
IGNORE 1 LINES
(`mineral_id`, `country_id`);

SELECT * FROM mineral2country;



LOAD DATA LOCAL INFILE 'miner2mineral.csv'
INTO TABLE miner2mineral
CHARSET utf8
FIELDS
    TERMINATED BY ','
    ENCLOSED BY '"'
LINES
    TERMINATED BY '\n'
IGNORE 1 LINES
(`miner_id`, `mineral_id`);

SELECT * FROM miner2mineral;
