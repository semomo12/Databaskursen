--
-- ddl.sql
--

USE exam;

-- Create the tables

-- Skapa tabell för kraftverk
CREATE TABLE kraftverk (
    kraftverk_id VARCHAR(10) PRIMARY KEY,
    namn VARCHAR(100) NOT NULL,
    plats VARCHAR(100) NOT NULL,
    kalla VARCHAR(50) NOT NULL,
    effekt DECIMAL(10, 2) NOT NULL,
    nyttjandegrad DECIMAL(5, 2) NOT NULL,
    startad INT NOT NULL,
    stangd INT,
    url VARCHAR(255)
);





-- Skapa vy för att visa kraftverkens årsproduktion
CREATE VIEW kraftverk_arproduktion AS
SELECT
    k.kraftverk_id,
    k.namn,
    k.effekt,
    k.nyttjandegrad,
    k.effekt * 365 * k.nyttjandegrad / 100 AS arsproduktion_kWh
FROM kraftverk k;


--
-- Create procedure for select * from kraftverk
--
DROP PROCEDURE IF EXISTS show_kraftverk;
DELIMITER ;;
CREATE PROCEDURE show_kraftverk()
BEGIN
    SELECT * FROM kraftverk;
END
;;
DELIMITER ;

CALL show_kraftverk();
