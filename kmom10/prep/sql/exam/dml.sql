--
-- dml.sql
--


--lista alla csv filer
 ls -l -- *.csv


SHOW DATABASES;
SHOW TABLES;


-- visa allt från tabellerna
SELECT * FROM kraftverk;






-- Visa kolumner i en specifik tabell
DESCRIBE kraftverk;


-- Visar alla tabeller och deras kolumner i databasen
SELECT TABLE_NAME, COLUMN_NAME, DATA_TYPE, COLUMN_TYPE, IS_NULLABLE, COLUMN_KEY
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = 'exam';


-- Visar relationer mellan tabeller genom primär- och främmande nycklar.
SELECT TABLE_NAME, COLUMN_NAME, CONSTRAINT_NAME, REFERENCED_TABLE_NAME, REFERENCED_COLUMN_NAME
FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE
WHERE TABLE_SCHEMA = 'exam';


-- Visar en lista över alla vyer i databasen.
SHOW FULL TABLES WHERE TABLE_TYPE = 'VIEW';


-- Visar en lista över alla procedurer i databasen
SHOW PROCEDURE STATUS WHERE Db = 'exam';

-- Visar SQL-koden för den proceduren.
SHOW CREATE PROCEDURE p_rapport1;
SHOW CREATE PROCEDURE p_rapport2;


-- lista över alla triggers
SHOW TRIGGERS FROM exam;

-- SQL-koden för den triggern
SHOW CREATE TRIGGER trigger_namn;
