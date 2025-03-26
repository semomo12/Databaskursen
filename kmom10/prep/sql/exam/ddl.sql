--
-- ddl.sql
--

USE exam;

-- drop tables
DROP TABLE IF EXISTS kraftverk;
DROP TABLE IF EXISTS konsument;
DROP TABLE IF EXISTS typ;
DROP TABLE IF EXISTS kraftverk2typ;
DROP TABLE IF EXISTS konsument2kraftverk;


-- Create the tables
CREATE TABLE kraftverk (
    id VARCHAR(50) PRIMARY KEY,     -- Unikt ID för varje kraftverk
    namn VARCHAR(255) NOT NULL,      -- Namn kan inte vara NULL
    plats VARCHAR(255) NOT NULL,     -- Plats kan inte vara NULL
    kalla VARCHAR(50) NOT NULL,      -- Kallan kan inte vara NULL
    effekt INT NOT NULL,             -- Effekt kan inte vara NULL
    nyttjandegrad INT NOT NULL,      -- Nyttjandegrad kan inte vara NULL
    startad INT NOT NULL,            -- Startår kan inte vara NULL
    stangd INT,                      -- Stängningsår kan vara NULL (kan vara öppet)
    url VARCHAR(255) NOT NULL       -- URL för kraftverket
);
CREATE INDEX kalla_idx ON kraftverk(kalla ASC) VISIBLE;
-- CREATE INDEX idx_kalla ON kraftverk(kalla);


CREATE TABLE konsument (
    id VARCHAR(50) PRIMARY KEY,  -- ID är unik och används för att identifiera konsumenten
    namn VARCHAR(255) NOT NULL,  -- Namn kan inte vara NULL
    ort VARCHAR(255) NOT NULL,   -- Ort kan inte vara NULL
    arsbehov INT NOT NULL        -- Årsbehov kan inte vara NULL
);



CREATE TABLE typ (
    id VARCHAR(50) PRIMARY KEY,  -- Unikt ID för varje typ
    namn VARCHAR(50) NOT NULL    -- Typens namn kan inte vara NULL
);


CREATE TABLE konsument2kraftverk (
    konsument_id VARCHAR(50) NOT NULL,   -- Konsument ID, kan inte vara NULL
    kraftverk_kalla VARCHAR(50) NOT NULL, -- Kraftverks kalla, kan inte vara NULL
    PRIMARY KEY (konsument_id, kraftverk_kalla),  -- Säkerställer att en konsument inte kopplas till samma kraftverk flera gånger
    CONSTRAINT fk_konsument FOREIGN KEY (konsument_id) REFERENCES konsument(id), -- Referens till konsumenttabellens id
    CONSTRAINT fk_kraftverk FOREIGN KEY (kraftverk_kalla) REFERENCES kraftverk(kalla) -- Referens till kraftverkets kalla
);

 -- FOREIGN KEY (konsument_id) REFERENCES konsument(id) ON DELETE CASCADE ON UPDATE CASCADE

CREATE TABLE kraftverk2typ (
    kraftverk_id VARCHAR(50) NOT NULL,   -- Kraftverkets ID, kan inte vara NULL
    typ_id VARCHAR(50) NOT NULL,         -- Typens ID, kan inte vara NULL
    PRIMARY KEY (kraftverk_id, typ_id),  -- Säkerställer att varje kraftverk har en unik typ
    FOREIGN KEY (kraftverk_id) REFERENCES kraftverk(id),
    FOREIGN KEY (typ_id) REFERENCES typ(id)
)ENGINE = InnoDB;


-- procedur rapport 1
DROP PROCEDURE IF EXISTS p_rapport1;
DELIMITER ;;
CREATE PROCEDURE p_rapport1()
BEGIN
    SELECT k.id AS kraftverk_id,
           k.namn AS kraftverk_namn,
           k.plats AS kraftverk_plats,
           k.kalla AS kraftverk_kalla,
           k.effekt AS kraftverk_effekt,
           k.nyttjandegrad AS kraftverk_nyttjandegrad,
           k.startad AS kraftverk_startad,
           k.stangd AS kraftverk_stangd,
           k.url AS kraftverk_url,
           t.namn AS energikalla_typ
    FROM kraftverk k
    JOIN kraftverk2typ k2t ON k.id = k2t.kraftverk_id
    JOIN typ t ON k2t.typ_id = t.id;
END;;
DELIMITER ;

CALL p_rapport1();



-- procedur rapport 2
DROP PROCEDURE IF EXISTS p_rapport2;
DELIMITER ;;
CREATE PROCEDURE p_rapport2()
BEGIN
    SELECT c.id AS konsument_id,
           c.namn AS konsument_namn,
           c.ort AS konsument_ort,
           c.arsbehov AS konsument_arsbehov,
           k.kalla AS konsument_kraftverk_kalla,
        GROUP_CONCAT(DISTINCT t.namn ORDER BY t.namn SEPARATOR ', ') AS energikalla_typ
    FROM konsument c
    JOIN konsument2kraftverk c2k ON c.id = c2k.konsument_id
    JOIN kraftverk k ON c2k.kraftverk_kalla = k.kalla
    JOIN kraftverk2typ k2t ON k.id = k2t.kraftverk_id
    JOIN typ t ON k2t.typ_id = t.id
    GROUP BY c.id, c.namn, c.ort, c.arsbehov, k.kalla;
END;;
DELIMITER ;

CALL p_rapport2();



DROP PROCEDURE IF EXISTS p_rapport_search;
DELIMITER ;;
CREATE PROCEDURE p_rapport_search(IN searchStr VARCHAR(255))
BEGIN
    SELECT k.id AS kraftverk_id,
           k.namn AS kraftverk_namn,
           k.plats AS kraftverk_plats,
           k.kalla AS kraftverk_kalla,
           k.effekt AS kraftverk_effekt,
           k.nyttjandegrad AS kraftverk_nyttjandegrad,
           k.startad AS kraftverk_startad,
           k.stangd AS kraftverk_stangd,
           k.url AS kraftverk_url,
           t.namn AS energikalla_typ
    FROM kraftverk k
    JOIN kraftverk2typ k2t ON k.id = k2t.kraftverk_id
    JOIN typ t ON k2t.typ_id = t.id
    WHERE k.namn LIKE CONCAT('%', searchStr, '%')
       OR k.plats LIKE CONCAT('%', searchStr, '%')
       OR t.namn LIKE CONCAT('%', searchStr, '%');
END;;
DELIMITER ;


DROP PROCEDURE IF EXISTS p_rapport1_no_url;
DELIMITER ;;
CREATE PROCEDURE p_rapport1_no_url()
BEGIN
    SELECT k.id AS kraftverk_id,
           k.namn AS kraftverk_namn,
           k.plats AS kraftverk_plats,
           k.kalla AS kraftverk_kalla,
           k.effekt AS kraftverk_effekt,
           k.nyttjandegrad AS kraftverk_nyttjandegrad,
           k.startad AS kraftverk_startad,
           k.stangd AS kraftverk_stangd,
           t.namn AS energikalla_typ
    FROM kraftverk k
    JOIN kraftverk2typ k2t ON k.id = k2t.kraftverk_id
    JOIN typ t ON k2t.typ_id = t.id;
END;;
DELIMITER ;
CALL p_rapport1_no_url();




DROP PROCEDURE IF EXISTS p_rapport3;
DELIMITER ;;
CREATE PROCEDURE p_rapport3()
BEGIN
    SELECT
        CONCAT(c.id, ': ', c.namn, ' (', c.ort, ')') AS Konsument,
        ROUND(c.arsbehov / 12, 0) AS Månadsbehov,
        GROUP_CONCAT(DISTINCT t.namn ORDER BY t.namn SEPARATOR ' + ') AS Källa,
        GROUP_CONCAT(DISTINCT CONCAT(k.namn, ' (', k.effekt, ')') ORDER BY k.effekt DESC SEPARATOR ', ') AS `Kraftverk med produktion per tidsenhet`
    FROM konsument c
    LEFT JOIN konsument2kraftverk c2k ON c.id = c2k.konsument_id
    LEFT JOIN kraftverk k ON c2k.kraftverk_kalla = k.kalla
    LEFT JOIN kraftverk2typ k2t ON k.id = k2t.kraftverk_id
    LEFT JOIN typ t ON k2t.typ_id = t.id
    GROUP BY c.id, c.namn, c.ort, c.arsbehov;
END;;
DELIMITER ;
CALL p_rapport3();












-- procedur årsproduktion
DROP PROCEDURE IF EXISTS p_kraftverk_arproduktion;
DELIMITER ;;
CREATE PROCEDURE p_kraftverk_arproduktion()
BEGIN
    SELECT
        k.id AS kraftverk_id,  -- Kraftverkets ID
        k.namn,                -- Kraftverkets namn
        k.effekt,              -- Effekt i MW eller annan enhet
        k.nyttjandegrad,       -- Nyttjandegrad i %
        k.effekt * 365 * k.nyttjandegrad / 100 AS arsproduktion_kWh -- Årsproduktion i kWh
    FROM kraftverk k;
END;;
DELIMITER ;

CALL p_kraftverk_arproduktion();


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







-- Skapa vy för att visa kraftverkens årsproduktion
DROP VIEW IF EXISTS kraftverk_arproduktion;
CREATE VIEW kraftverk_arproduktion AS
SELECT
    k.id,
    k.namn,
    k.effekt,
    k.nyttjandegrad,
    k.effekt * 365 * k.nyttjandegrad / 100 AS arsproduktion_kWh
FROM kraftverk k;


