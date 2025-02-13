--
-- Make copy of table
--

source ddl-larare.sql
source insert-larare.sql
source ddl-alter.sql
source dml-update.sql
SELECT SUM(lon) AS 'Lönesumma', SUM(kompetens) AS Kompetens FROM larare;

DROP TABLE IF EXISTS larare_pre;
CREATE TABLE larare_pre LIKE larare;
INSERT INTO larare_pre SELECT * FROM larare;

-- Check the content of the tables, for sanity checking
SELECT SUM(lon) AS 'Lönesumma', SUM(kompetens) AS Kompetens FROM larare;
SELECT SUM(lon) AS 'Lönesumma', SUM(kompetens) AS Kompetens FROM larare_pre;

source dml-update-lonerevision.sql



-- source ddl-larare.sql
-- source insert-larare.sql
-- source ddl-alter.sql
-- source dml-update.sql
-- source ddl-copy.sql
-- source dml-update-lonerevision.sql
-- source dml-view.sql
