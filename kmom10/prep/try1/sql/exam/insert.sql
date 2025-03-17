--
--insert
--


--
-- Delete tables, in order, depending on
-- foreign key constraints.
--
DELETE FROM kraftverk WHERE EXISTS (SELECT 1 FROM kraftverk LIMIT 1);


--
-- Enable LOAD DATA LOCAL INFILE on the server.
--
SET GLOBAL local_infile = 1;
SHOW VARIABLES LIKE 'local_infile';

--
-- Insert into kurs.
--
LOAD DATA LOCAL INFILE 'kraftverk.csv'
INTO TABLE kraftverk
CHARSET utf8
FIELDS
    TERMINATED BY ','
    ENCLOSED BY '"'
LINES
    TERMINATED BY '\r\n'
IGNORE 1 LINES
;

SELECT * FROM kraftverk;


