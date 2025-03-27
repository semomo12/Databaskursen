
-- -- söka i backupfilen
-- grep "SÖKORD" backup.sql

-- -- lista alla csv filer
--  ls -l -- *.csv


SHOW DATABASES;
SHOW TABLES;

-- -- checka rätt data i tabell
-- CONSTRAINT check_kolumnnaman CHECK (kolumnnaman >= testkonstroll)


-- visa allt från tabellerna
SELECT * FROM mineral;

SELECT type FROM mineral;



-- unika värden
SELECT DISTINCT id FROM mineral;


-- Visar alla tabeller och deras kolumner i databasen
SELECT TABLE_NAME, COLUMN_NAME, DATA_TYPE, COLUMN_TYPE, IS_NULLABLE, COLUMN_KEY
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = 'exam';


-- Visar relationer mellan tabeller genom primär- och främmande nycklar.
SELECT TABLE_NAME, COLUMN_NAME, CONSTRAINT_NAME, REFERENCED_TABLE_NAME, REFERENCED_COLUMN_NAME
FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE
WHERE TABLE_SCHEMA = 'exam';


-- Visar en lista över alla procedurer i databasen
SHOW PROCEDURE STATUS WHERE Db = 'exam';
-- eller
SELECT ROUTINE_NAME, ROUTINE_TYPE, CREATED, DEFINER
FROM information_schema.ROUTINES
WHERE ROUTINE_SCHEMA = 'exam';

-- Visar SQL-koden för den proceduren.
SHOW CREATE PROCEDURE p_rapport;
