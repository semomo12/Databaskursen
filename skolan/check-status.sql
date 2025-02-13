--
--Kontrollera versionen av MySQL
--

SHOW VARIABLES LIKE "%version%";

--hämta ut varje variabel för sig

SELECT @@version;


--lista användare som finns i databasen
SELECT user, host  FROM mysql.global_priv;

