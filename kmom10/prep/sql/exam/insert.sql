--
-- Insert into table
--
USE exam;

-- DELETE FROM kraftverk WHERE EXISTS (SELECT 1 FROM kraftverk LIMIT 1);


SET FOREIGN_KEY_CHECKS = 0;  -- Inaktivera referens
DELETE FROM kraftverk;
DELETE FROM konsument;
DELETE FROM typ;
DELETE FROM kraftverk2typ;
DELETE FROM konsument2kraftverk;
SET FOREIGN_KEY_CHECKS = 1; -- aktiv


--
-- Enable LOAD DATA LOCAL INFILE on the server.
--
SET GLOBAL local_infile = 1;
SHOW VARIABLES LIKE 'local_infile';

--
-- Insert into tabel.
--
LOAD DATA LOCAL INFILE 'kraftverk.csv'
INTO TABLE kraftverk
CHARSET utf8
FIELDS
    TERMINATED BY ','
    ENCLOSED BY '"'
LINES
    TERMINATED BY '\n'
IGNORE 1 LINES
(`id`,`namn`, `plats`, `kalla`, `effekt`, `nyttjandegrad`, `startad`, `stangd`, `url`);
SELECT * FROM kraftverk;


LOAD DATA LOCAL INFILE 'konsument.csv'
INTO TABLE konsument
CHARSET utf8
FIELDS
    TERMINATED BY ','
    ENCLOSED BY '"'
LINES
    TERMINATED BY '\n'
IGNORE 1 LINES
(`id`,`namn`, `ort`, `arsbehov`);

SELECT * FROM konsument;


LOAD DATA LOCAL INFILE 'typ.csv'
INTO TABLE typ
CHARSET utf8
FIELDS
    TERMINATED BY ','
    ENCLOSED BY '"'
LINES
    TERMINATED BY '\n'
IGNORE 1 LINES
(`id`,`namn`);

SELECT * FROM typ;



LOAD DATA LOCAL INFILE 'kraftverk2typ.csv'
INTO TABLE kraftverk2typ
CHARSET utf8
FIELDS
    TERMINATED BY ','
    ENCLOSED BY '"'
LINES
    TERMINATED BY '\n'
IGNORE 1 LINES
(`kraftverk_id`, `typ_id`);

SELECT * FROM kraftverk2typ;



LOAD DATA LOCAL INFILE 'konsument2kraftverk.csv'
INTO TABLE konsument2kraftverk
CHARSET utf8
FIELDS
    TERMINATED BY ','
    ENCLOSED BY '"'
LINES
    TERMINATED BY '\n'
IGNORE 1 LINES
(`konsument_id`, `kraftverk_kalla`);

SELECT * FROM konsument2kraftverk;
