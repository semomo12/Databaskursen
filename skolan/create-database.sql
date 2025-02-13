--
-- skapar databasen skolan
--


--DROP DATABASE skolan;

--CREATE DATABASE skolan;

-- tar bort databasen skolan om den finns
DROP DATABASE IF EXISTS skolan;

-- skapar databasen skolan om den inte finns
CREATE DATABASE IF NOT EXISTS skolan;

-- USE skolan;

-- visa mina databaser
--SHOW DATABASES;

-- visa databasen som innehåller skolan
SHOW DATABASES LIKE "%skolan%";
