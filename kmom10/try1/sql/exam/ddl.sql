--
-- ddl.sql
--
-- USE exam;
--
-- Table structure for database `exam`
--

-- drop tables
DROP TABLE IF EXISTS mineral;
DROP TABLE IF EXISTS country;
DROP TABLE IF EXISTS mineral2country;
DROP TABLE IF EXISTS miner;
DROP TABLE IF EXISTS miner2mineral;


-- Skapa tabeller
CREATE TABLE mineral (
    id VARCHAR(50) PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    uses VARCHAR(255) NOT NULL,
    type VARCHAR(255) NOT NULL,
    url VARCHAR(255) NOT NULL
);



CREATE TABLE country (
    id VARCHAR(50) PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    url VARCHAR(255) NOT NULL
);



CREATE TABLE miner (
    id VARCHAR(50) PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

-- kopplingstabeller

CREATE TABLE mineral2country (
    mineral_id VARCHAR(50) NOT NULL,
    country_id VARCHAR(50) NOT NULL,
    PRIMARY KEY (mineral_id, country_id),
    FOREIGN KEY (mineral_id) REFERENCES mineral(id),
    FOREIGN KEY (country_id) REFERENCES country(id)
);

CREATE TABLE miner2mineral (
    miner_id VARCHAR(50) NOT NULL,
    mineral_id VARCHAR(50) NOT NULL,
    PRIMARY KEY (miner_id, mineral_id),
    FOREIGN KEY (miner_id) REFERENCES miner(id),
    FOREIGN KEY (mineral_id) REFERENCES mineral(id)
);

-- --  visar en rapport över databasens innehåll.
-- Visa samtliga detaljer om samtliga mineraler och vilka eventuella länder de finns i.
-- --  Försäkra dig om att samtliga mineraler visas i rapporten, även om koppling till land saknas.


-- procedure rapport
DROP PROCEDURE IF EXISTS p_rapport;
DELIMITER ;;
CREATE PROCEDURE p_rapport()
BEGIN
    SELECT m.id AS mineral_id,
           m.name AS mineral_name,
           m.uses AS mineral_uses,
           m.type AS mineral_type,
           m.url AS mineral_url,
           c.name AS country_name
    FROM mineral m
    LEFT JOIN mineral2country mc ON m.id = mc.mineral_id
    LEFT JOIN country c ON mc.country_id = c.id;
END;;
DELIMITER ;

CALL p_rapport();


DROP PROCEDURE IF EXISTS p_rapport_search;
DELIMITER ;;
CREATE PROCEDURE p_rapport_search(IN searchStr VARCHAR(255))
BEGIN
    SELECT m.id AS mineral_id,
           m.name AS mineral_name,
           m.uses AS mineral_uses,
           m.type AS mineral_type,
           m.url AS mineral_url,
           c.name AS country_name
    FROM mineral m
    LEFT JOIN mineral2country mc ON m.id = mc.mineral_id
    LEFT JOIN country c ON mc.country_id = c.id
    WHERE m.id LIKE CONCAT('%', searchStr, '%')
       OR m.name LIKE CONCAT('%', searchStr, '%')
       OR m.uses LIKE CONCAT('%', searchStr, '%')
       OR m.type LIKE CONCAT('%', searchStr, '%')
       OR c.id LIKE CONCAT('%', searchStr, '%')
       OR c.name LIKE CONCAT('%', searchStr, '%');
END;;
DELIMITER ;


DROP PROCEDURE IF EXISTS p_rapport_no_url;
DELIMITER ;;
CREATE PROCEDURE p_rapport_no_url()
BEGIN
    SELECT m.id AS mineral_id,
           m.name AS mineral_name,
           m.uses AS mineral_uses,
           m.type AS mineral_type,
           c.name AS country_name
    FROM mineral m
    LEFT JOIN mineral2country mc ON m.id = mc.mineral_id
    LEFT JOIN country c ON mc.country_id = c.id;
END;;
DELIMITER ;

CALL p_rapport_no_url();



DROP PROCEDURE IF EXISTS p_rapport3;
DELIMITER ;;
CREATE PROCEDURE p_rapport3()
BEGIN
    SELECT
        CONCAT(m.name, ' (', m.id, ')') AS Mineral,
        CONCAT(m.uses, 'NULL') AS Uses,
        CONCAT(' [', m.id, ']',miner.name ) AS Miner,
        CONCAT(SUM(mm.amount), 'NULL') AS Amount
    FROM mineral m
    LEFT JOIN miner2mineral mm ON m.id = mm.mineral_id
    LEFT JOIN miner miner ON mm.miner_id = miner.id
GROUP BY
    m.id, m.name, m.uses, miner.name;
END;;
DELIMITER ;
