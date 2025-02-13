--
--practice with the world database
--

--
--Check what the tables contain
--
SHOW TABLES;


--
--Inspect the schema of the tables
--
SHOW CREATE TABLE City \G
SELECT * FROM City LIMIT 5;



SHOW CREATE TABLE Country \G
SELECT Code, Name, Population FROM  Country LIMIT 5;


SELECT Code, Name FROM  Country WHERE name = 'Sweden';
SELECT Code, Name FROM  Country WHERE code = 'SWE';

SELECT
    `Code`,
    `Name`,
   -- LocalName ,
   -- Continent ,
   -- Region ,
   -- Population ,
    `LifeExpectancy`,
FROM `Country` WHERE `Continent` = `Europe`
ORDER BY `LifeExpectancy` DESC
LIMIT 10
;


--
--Find details about Sweden - countrylanguage
--
SELECT * FROM countrylanguage, WHERE CountryCode = 'SWE';
SELECT * FROM countrylanguage, WHERE CountryCode = 'SWE' ORDER BY Percentage DESC LIMIT;

