--
-- skapa användare dbadm (local och %) med fulla rättigheter.
--

DROP USER IF EXISTS 'dbadm'@'localhost';
DROP USER IF EXISTS 'dbadm'@'%';

CREATE USER 'dbadm'@'localhost'
IDENTIFIED BY 'P@ssw0rd'
;

GRANT ALL PRIVILEGES
ON *.* TO 'dbadm'@'localhost'
WITH GRANT OPTION
;


CREATE USER 'dbadm'@'%'
IDENTIFIED BY 'P@ssw0rd'
;

GRANT ALL PRIVILEGES
ON *.* TO 'dbadm'@'%'
WITH GRANT OPTION
;


FLUSH PRIVILEGES;

SELECT USER();

SHOW GRANTS;

SELECT User, Host FROM mysql.global_priv;