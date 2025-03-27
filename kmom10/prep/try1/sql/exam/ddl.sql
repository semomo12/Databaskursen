--
-- ddl.sql
--
-- USE exam;
--
-- Table structure for database `exam`
--

-- drop tables
DROP TABLE IF EXISTS table_name;
DROP TABLE IF EXISTS table_name;
DROP TABLE IF EXISTS table_name;
DROP TABLE IF EXISTS table_name;
DROP TABLE IF EXISTS table_name;
DROP TABLE IF EXISTS table_name;


-- Skapa tabell för table_name
CREATE TABLE table_name (
    id VARCHAR(50) PRIMARY KEY,      -- Unikt ID för varje...
    kolumn_namn VARCHAR(255) NOT NULL,      -- text
    kolumn_namn VARCHAR(255) NOT NULL,
    kolumn_namn VARCHAR(50) NOT NULL,
    kolumn_namn INT NOT NULL,              -- integer
    kolumn_namn INT NOT NULL,
    kolumn_namn INT NOT NULL,
    kolumn_namn INT,                      --    kan vara NULL (kan vara öppet)
    kolumn_namn VARCHAR(255) NOT NULL        -- URL för...
);



CREATE TABLE table_name (
    id VARCHAR(50) PRIMARY KEY,  -- ID är unik och används för att identifiera...
    kolumn_namn VARCHAR(255) NOT NULL,
    kolumn_namn VARCHAR(255) NOT NULL,
    kolumn_namn INT NOT NULL
);



CREATE TABLE table_name (
    id VARCHAR(50) PRIMARY KEY,  -- Unikt ID för varje..
    kolumn_namn VARCHAR(50) NOT NULL
);

-- kopplingstabeller

CREATE TABLE table_name (
    kolumn_namnid1 VARCHAR(50) NOT NULL,
    kolumn_namnid2 VARCHAR(50) NOT NULL,
    PRIMARY KEY (kolumn_namnid1, kolumn_namnid2),
    FOREIGN KEY (kolumn_namnid1) REFERENCES tabellnamn1(id),
    FOREIGN KEY (kolumn_namnid2) REFERENCES tabellnamn2(id)
);

CREATE TABLE table_name (
    kolumn_namnid1 VARCHAR(50) NOT NULL,   -- Kraftverkets ID, kan inte vara NULL
    kolumn_namnid2 VARCHAR(50) NOT NULL,         -- Typens ID, kan inte vara NULL
    PRIMARY KEY (kolumn_namnid1, kolumn_namnid2),  -- Säkerställer att varje kraftverk har en unik typ
    FOREIGN KEY (kolumn_namnid1) REFERENCES tabellnamn1(id),
    FOREIGN KEY (kolumn_namnid2) REFERENCES tabellnamn2(id)
);



-- procedure rapport1
DROP PROCEDURE IF EXISTS p_rapport1;
DELIMITER ;;
CREATE PROCEDURE p_rapport1()
BEGIN
    SELECT k.kolumn_namn AS tabellnamn_kolumnnamn,
           k.kolumn_namn AS tabellnamn_kolumnnamn,
           k.kolumn_namn AS tabellnamn_kolumnnamn,
           k.kolumn_namn AS tabellnamn_kolumnnamn,
           k.kolumn_namn AS tabellnamn_kolumnnamn,
           k.kolumn_namn AS tabellnamn_kolumnnamn,
           k.kolumn_namn AS tabellnamn_kolumnnamn,
           k.kolumn_namn AS tabellnamn_kolumnnamn,
           k.kolumn_namn AS tabellnamn_kolumnnamn,
           k.kolumn_namn AS tabellnamn_kolumnnamn
    FROM tabell_namn t
    JOIN kopplingstabell kt ON k.id = kt.kolumn_namnid1
    JOIN tabell_namn t ON kt.kolumn_namnid2 = t.id;
END;;
DELIMITER ;

CALL p_rapport1();





-- procedurer

DROP PROCEDURE IF EXISTS p_procedure_namn;
DELIMITER ;;
CREATE PROCEDURE p_procedure_namn()
BEGIN
    SELECT k.kolumn_namn, k.kolumn_namn, k.kolumn_namn
    FROM table_name t
    JOIN table_name t ON k.kolumn_namn = k.kolumn_namn;
END;;
DELIMITER ;







--
-- Create procedure for select * from tabell
--
DROP PROCEDURE IF EXISTS p_show_tabellnamn;
DELIMITER ;;
CREATE PROCEDURE p_show_tabellnamn()
BEGIN
    SELECT * FROM table_name;
END;;
DELIMITER ;

CALL p_show_tabellnamn();


DROP PROCEDURE IF EXISTS p_show_tabellnamn;
DELIMITER ;;
CREATE PROCEDURE p_show_tabellnamn()
BEGIN
    SELECT * FROM table_name;
END;;
DELIMITER ;

CALL p_show_tabellnamn();


DROP PROCEDURE IF EXISTS p_show_tabellnamn;
DELIMITER ;;
CREATE PROCEDURE p_show_tabellnamn()
BEGIN
    SELECT * FROM table_name;
END;;
DELIMITER ;

CALL p_show_tabellnamn();


DROP PROCEDURE IF EXISTS p_show_tabellnamn;
DELIMITER ;;
CREATE PROCEDURE p_show_tabellnamn()
BEGIN
    SELECT * FROM table_name;
END;;
DELIMITER ;

CALL p_show_tabellnamn();


DROP PROCEDURE IF EXISTS p_show_tabellnamn;
DELIMITER ;;
CREATE PROCEDURE p_show_tabellnamn()
BEGIN
    SELECT * FROM table_name;
END;;
DELIMITER ;

CALL p_show_tabellnamn();
