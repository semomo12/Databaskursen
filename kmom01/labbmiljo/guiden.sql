--
-- skapa användare maria
--

CREATE USER 'maria'@'localhost'
IDENTIFIED BY 'P@ssw0rd'
;

GRANT ALL PRIVILEGES
ON *.* TO 'maria'@'localhost'
WITH GRANT OPTION
;

FLUSH PRIVILEGES;




-- logga in i terminalklienten
mariadb -u maria

SELECT USER();

-- kolla vilka rättigheter användaren har
SHOW GRANTS;

--  kontrollera en specifik användare
SHOW GRANTS FOR 'dbadm'@'localhost';

-- ta bort användaren (droppa)

DROP USER IF EXISTS 'maria'@'localhost';

-- Kontrollera skriptet med kommandot:
mariadb < create-user.sql

-- växla användare
mariadb -udbadm
mariadb -umaria

-- visa användare som finns på datorn
SELECT User, Host FROM mysql.global_priv;


--
-- Check the status for users root, dbwebb and user.
--
SELECT
    User,
    Host,
    Grant_priv,
    Super_priv,
    Trigger_priv,
    plugin
FROM mysql.user
WHERE
    User IN ('root', 'dbadm', 'user')
ORDER BY User
;


--
-- Kontrollera versionen av MySQL
--

SHOW VARIABLES LIKE "%version%";


-- hämta ut varje variabel för sig

SELECT @@version;


-- lista användare som finns i databasen
SELECT user, host  FROM mysql.global_priv;


-- visa resultaten i tabellform

mariadb --table < filename.sql

