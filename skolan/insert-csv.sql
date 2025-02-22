use skolan;

--
-- Delete tables, in order, depending on
-- foreign key constraints.
--
DELETE FROM kurstillfalle;
DELETE FROM kurs;

--
-- Insert into kurs
--
LOAD DATA LOCAL INFILE 'kurs.csv'
INTO TABLE kurs
CHARSET utf8
FIELDS
    TERMINATED BY ','
    ENCLOSED BY '"'
LINES
    TERMINATED BY '\n'
IGNORE 1 LINES
;

SELECT * FROM kurs;



--
-- Insert into kurstillfalle
--
LOAD DATA LOCAL INFILE 'kurstillfalle.csv'
INTO TABLE kurstillfalle
CHARSET utf8
FIELDS
    TERMINATED BY ','
    ENCLOSED BY '"'
LINES
    TERMINATED BY '\n'
IGNORE 1 LINES
(kurskod, kursansvarig, lasperiod)
;


select * from kurstillfalle;
