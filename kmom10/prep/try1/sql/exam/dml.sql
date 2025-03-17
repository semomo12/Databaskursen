
--terminalen:
--köra fil(under rätt katalog)
mariadb --table < dml.sql

--köra sqlkod
mariadb exam --table -e "SHOW TABLES;"


-- söka i backupfilen
grep "SÖKORD" backup.sql

--lista alla csv filer
 ls -l -- *.csv


SHOW DATABASES;
SHOW TABLES;

-- visa allt från tabellerna
SELECT * FROM tabelnamn;

SELECT column1 FROM table_name;
SELECT * FROM table_name LIMIT 5;
SELECT * FROM table_name WHERE column_name LIKE '%sökord%';

SELECT * FROM table_name WHERE condition;
SELECT * FROM table_name WHERE condition1 AND condition2;
SELECT * FROM table_name WHERE condition1 OR condition2;

SELECT * FROM table_name ORDER BY column_name ASC;  -- Ascendent (stigande)
SELECT * FROM table_name ORDER BY column_name DESC; -- Desendent (fallande)

--samla rader från en kolumn, (COUNT(), SUM(), AVG())
SELECT column_name, COUNT(*) FROM table_name GROUP BY column_name;

SELECT column_name, COUNT(*) FROM table_name GROUP BY column_name HAVING COUNT(*) > 10;

--union
SELECT column_name FROM table1
UNION
SELECT column_name FROM table2;

-- join
SELECT * FROM table1 t1
JOIN table2 t2 ON t1.common_column = t2.common_column;

-- unika värden
SELECT DISTINCT column_name FROM table_name;


-- Visa kolumner i en specifik tabell
DESCRIBE kolumnnamn;


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
-- eller
SELECT ROUTINE_NAME, ROUTINE_TYPE, CREATED, DEFINER
FROM information_schema.ROUTINES
WHERE ROUTINE_SCHEMA = 'exam';

-- Visar SQL-koden för den proceduren.
SHOW CREATE PROCEDURE procedure_namn;


-- CALL p_procedure();
-- SET @result = 0;
-- CALL p_procedure(@result);
-- SELECT @result;



-- lista över alla triggers
SHOW TRIGGERS FROM exam;

-- SQL-koden för den triggern
SHOW CREATE TRIGGER trigger_namn;
