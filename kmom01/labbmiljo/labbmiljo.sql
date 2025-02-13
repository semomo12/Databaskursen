--
--installera labbmiljön
--

SELECT USER();
SELECT VERSION();
SELECT NOW() AS 'The local time is';
SHOW DATABASES;

--skapa en ny användare
CREATE USER 'dbadm'@'localhost'
IDENTIFIED BY 'P@ssw0rd'
;

--ge användaren rättigheter
GRANT ALL PRIVILEGES
ON *.* TO 'dbadm'@'localhost'
WITH GRANT OPTION
;

--ta bort användaren
DROP USER IF EXISTS 'dbadm'@'localhost';

--kommandon för logga in
mariadb -udbadm -pP@ssw0rd


--Installera terminalklienten
sudo apt update
sudo apt install mariadb-clien



--Skapa ny användare i databasen

-- Create the user
CREATE USER 'dbadm'@'%'
IDENTIFIED BY 'P@ssw0rd'
;

-- Grant it privileges
GRANT ALL PRIVILEGES
ON *.* TO 'dbadm'@'%'
WITH GRANT OPTION
;

-- Flush the settings so it can be used directly
FLUSH PRIVILEGES;



--Starta terminalklienten
# Prova denna först
mariadb -udbadm -pP@ssw0rd -h127.0.0.1

# Prova sedan denna om ovan inte fungerar
# (du kan få ett felmeddelande om "host")
mariadb -udbadm -pP@ssw0rd -h$( hostname ).local

--dubbelkolla att användaren kan logga in med terminalklienten med dbadm.
mariadb -udbadm -p

--Testa MySQL WorkBench
SELECT USER();

SELECT VERSION();

SELECT NOW() AS 'The local time is';

SHOW DATABASES;


-- .my.cnf filen
# Template config file for databas-v2

[client]
user=dbadm
password=P@ssw0rd

# host for cygwin och äldre WSL
#host=127.0.0.1

# host for WSL2 bash, change <hostname> to its real value
#host=<hostname>.local

#port=3306
#protocol=tcp

[mysql]
# To allow for using LOAD DATA INFILE
loose-local-infile = 1

--kör kommandot i wsl
mariadb --help

-- kontrollera filen ligger i rätt plats
ls -l $HOME/.my.cnf
cat $HOME/.my.cnf

-- ändra rättigheter
chmod 600 $HOME/.my.cnf

--Testa om konfigurationsfilen används
$ mariadb --print-defaults
mariadb would have been started with the following arguments:
--user=dbadm --password=P@ssw0rd!


