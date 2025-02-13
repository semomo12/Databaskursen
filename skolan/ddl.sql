--
--DDL
--
use skolan;

-- ddl-larare.sql --
DROP TABLE IF EXISTS larare;

CREATE TABLE larare
(
    akronym CHAR(3),
    avdelning CHAR(4),
    fornamn VARCHAR(20),
    efternamn VARCHAR(20),
    kon CHAR(1),
    lon INT,
    fodd DATE,

    PRIMARY KEY (akronym)
);

-- ddl-alter
-- Add column to table
ALTER TABLE larare ADD COLUMN IF NOT EXISTS kompetens INT;

-- Ta bort samma kolumn
ALTER TABLE larare DROP COLUMN kompetens;

-- Lägg till samma kolumn igen med default-värdet 1 (DEFAULT)
ALTER TABLE larare ADD COLUMN kompetens INT DEFAULT 1 NOT NULL;



-- ddl-cpy
DROP TABLE IF EXISTS larare_pre;
CREATE TABLE larare_pre LIKE larare;
INSERT INTO larare_pre SELECT * FROM larare;


-- dml-view
DROP VIEW IF EXISTS v_all_with_age;

-- Skapa en vy “v_larare” som innehåller samtliga kolumner från tabellen Lärare inklusive en ny kolumn med lärarens ålder.
create view v_all_with_age as select *, TIMESTAMPDIFF(YEAR, fodd, CURDATE()) as 'Ålder' from larare;

-- Gör en SELECT-sats mot vyn som beräknar medelåldern på respektive avdelning. Visa avdelningens namn och medelålder sorterad på medelåldern.
select avdelning, avg(TIMESTAMPDIFF(YEAR, fodd, CURDATE())) as 'Snittalder' from v_all_with_age group by avdelning order by Snittalder desc;


-- dml-join
DROP view IF EXISTS v_lonerevision;
-- Create the view
CREATE View v_lonerevision AS
SELECT
    l.akronym,
    l.fornamn,
    l.efternamn,
    p.lon AS 'pre',
    l.lon AS 'nu',
    (l.lon - p.lon) AS 'diff',
    round(((l.lon - p.lon) / (p.lon / 100)),2) AS 'proc',
    p.kompetens as 'prekomp',
    l.kompetens as 'nukomp',
    (l.kompetens - p.kompetens) as 'diffkomp',
    CASE WHEN ((l.lon - p.lon) / (p.lon / 100)) > 3 THEN 'ok' ELSE 'nok' END AS 'mini'
FROM
    larare AS l
JOIN
    larare_pre AS p ON l.akronym = p.akronym;


SELECT
 akronym, fornamn, efternamn, pre, nu, diff, proc, mini
 FROM v_lonerevision
 ORDER BY proc DESC ;

SELECT akronym, fornamn, efternamn, prekomp, nukomp, diffkomp
 FROM v_lonerevision
 ORDER BY nukomp DESC, diffkomp DESC;
