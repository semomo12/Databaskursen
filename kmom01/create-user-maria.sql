--
-- skapa användare maria(local och %) med fulla rättigheter.
--

DROP USER IF EXISTS 'maria'@'localhost';
DROP USER IF EXISTS 'maria'@'%';

CREATE USER 'maria'@'localhost'
IDENTIFIED BY 'P@ssw0rd'
;

GRANT ALL PRIVILEGES
ON *.* TO 'maria'@'localhost'
WITH GRANT OPTION
;

CREATE USER 'maria'@'%'
IDENTIFIED BY 'P@ssw0rd'
;

GRANT ALL PRIVILEGES
ON *.* TO 'maria'@'%'
WITH GRANT OPTION
;

FLUSH PRIVILEGES;

SELECT USER();

SHOW GRANTS;

SELECT User, Host FROM mysql.global_priv;