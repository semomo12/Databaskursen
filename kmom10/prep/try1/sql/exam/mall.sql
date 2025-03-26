
-- Skapa en tabell
CREATE TABLE tabell_namn (
    id INT PRIMARY KEY AUTO_INCREMENT,  -- Primärnyckel
    kolumn1 VARCHAR(255) NOT NULL,      -- Ej null-värde, textkolumn
    kolumn2 INT DEFAULT 0,              -- Standardvärde
    kolumn3 DATE,                       -- Datumkolumn
    skapad TIMESTAMP DEFAULT CURRENT_TIMESTAMP,  -- Standardvärde för skapande tid
    CONSTRAINT fk_relations_namn FOREIGN KEY (kolumn2) REFERENCES annan_tabell(id) -- Foreign Key-relation
);


-- Skapa en tabell
CREATE TABLE tabell_namn (
    id INT PRIMARY KEY AUTO_INCREMENT,
    kolumn1 VARCHAR(255),
    kolumn2 INT,
    kolumn3 DATE,
    skapad TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


-- Kopplingstabell
CREATE TABLE tabell_namn (
    kolumn_id INT NOT NULL,
    kolumn_id2 INT NOT NULL,
    -- created DATETIME DEFAULT CURRENT_TIMESTAMP,
    -- updated DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    -- deleted DATETIME DEFAULT NULL,
    PRIMARY KEY (kolumn_id, kolumn_id2),
    FOREIGN KEY (kolumn_id) REFERENCES tabellnamn(kolumn_id),
    FOREIGN KEY (kolumn_id2) REFERENCES tabellnamn(kolumn_id2)
);



-- Skapa en vy
CREATE VIEW vy_namn AS
SELECT kolumn1, kolumn2 FROM tabell_namn WHERE kolumn3 >= '2025-01-01';

-- Skapa vy för att visa kraftverkens årsproduktion
CREATE VIEW table_name AS
SELECT
    t.kolumn_namn,
    t.kolumn_namn,
    t.kolumn_namn,
    t.kolumn_namn,
    t.kolumn_namn * 365 * t.kolumn_namn / 100 AS titel_namn
FROM table_name t;




-- Uppdatera data
UPDATE tabell_namn
SET kolumn1 = 'NyttVärde', kolumn2 = 456
WHERE id = 1;

-- Ta bort data
DELETE FROM tabell_namn WHERE id = 1;

-- Hämta data med SELECT
SELECT * FROM tabell_namn;
SELECT kolumn1, kolumn2 FROM tabell_namn WHERE kolumn2 > 100;


-- UNION mellan två SELECT-frågor,  tar bort dubbletter och returnerar en sammanställd lista.
SELECT kolumn1 FROM tabell_namn
UNION
SELECT kolumn1 FROM annan_tabell;




-- Använd JOIN mellan två tabeller
SELECT a.kolumn1, b.kolumn2
FROM tabell_namn a
JOIN annan_tabell b ON a.id = b.fk_id;

--  kombinera alla rader från två tabeller baserat på en gemensam kolumn.
SELECT * FROM table1 t1
JOIN table2 t2 ON t1.common_column = t2.common_column;





-- INNER JOIN: Hämtar bara de rader där det finns en matchning
SELECT
    tabell1.kolumn1,
    tabell1.kolumn2,
    tabell2.kolumn3
FROM
    tabell1
INNER JOIN
    tabell2
ON
    tabell1.kolumn_id = tabell2.kolumn_id;


-- LEFT JOIN: Hämtar alla rader från vänster tabell och matchande från höger tabell. ingen matchning->kolumnerna från den högra tabellen kommer vara NULL.
SELECT
    tabell1.kolumn1,
    tabell1.kolumn2,
    tabell2.kolumn3
FROM
    tabell1 --vänster
LEFT JOIN
    tabell2 -- höger
ON
    tabell1.kolumn_id = tabell2.kolumn_id;


-- RIGHT JOIN: Hämtar alla rader från höger tabell och matchande från vänster tabell.ingen matchning->kolumnerna från den vänstra tabellen kommer vara NULL.
SELECT
    tabell1.kolumn1,
    tabell1.kolumn2,
    tabell2.kolumn3
FROM
    tabell1  --vänster
RIGHT JOIN
    tabell2 -- höger
ON
    tabell1.kolumn_id = tabell2.kolumn_id;



-- procedurer
DROP PROCEDURE IF EXISTS proc_namn;
DELIMITER ;;
CREATE PROCEDURE proc_namn (IN param1 DATATYPE, IN param2 DATATYPE)
BEGIN
    -- SQL-kommandon här
    SELECT * FROM tabell_namn WHERE kolumn1 = param1 AND kolumn2 = param2;
    -- Fler SQL-kommandon kan läggas till här
END;;
DELIMITER ;

CALL proc_namn(1,2);






-- triggers

DELIMITER ;;
DROP TRIGGER IF EXISTS trigger_namn;
CREATE TRIGGER trigger_namn
BEFORE INSERT ON tabell_namn
FOR EACH ROW
BEGIN
    -- Triggerlogik här
    -- Exempel: Sätt en kolumn till nuvarande tidpunkt
    SET NEW.kolumn_namn = NOW();
END;;

DELIMITER ;



DELIMITER ;;
DROP TRIGGER IF EXISTS trigger_namn;
CREATE TRIGGER trigger_namn
AFTER UPDATE ON tabell_namn
FOR EACH ROW
BEGIN
    IF OLD.kolumn_namn != NEW.kolumn_namn THEN
        INSERT INTO tabell-namn (kolumn_namn, kolumn_namn)
        VALUES (NEW.kolumn_namn, OLD.kolumn_namn, NEW.kolumn_namn, NOW());
    END IF;
END;;

DELIMITER ;




SELECT
    -- De kolumner som du vill gruppera efter
    column1,

    -- Du kan använda funktioner som t.ex. COUNT(), SUM(), AVG() här för att sammanfatta data
    COUNT(*) AS total_records,  -- Exempel på att räkna antalet rader per grupp

    -- Använd GROUP_CONCAT för att sammanfoga (concatenera) värden från en kolumn för varje grupp
    GROUP_CONCAT(column2 ORDER BY column3 DESC SEPARATOR ', ') AS concatenated_values,  -- Här använder vi GROUP_CONCAT

    -- Använd CONCAT för att kombinera två eller fler kolumner
    CONCAT(column1, ' - ', column2) AS combined_column -- Här använder vi CONCAT

FROM
    your_table_name  -- Tabellnamn

-- Använd GROUP BY för att gruppera efter specifika kolumner
GROUP BY
    column1

-- Använd ORDER BY för att sortera resultaten (kan vara inom GROUP_CONCAT eller resultatet av själva frågan)
ORDER BY
    column1 ASC,  -- Sortera resultatet på kolumn1 i stigande ordning
    total_records DESC;  -- Sortera på det sammanställda resultatet i fallande ordning


-- CONCAT
-- När du behöver slå ihop kolumner eller värden i en rad.
-- GROUP_CONCAT
-- När du behöver slå ihop värden från flera rader i en grupp.