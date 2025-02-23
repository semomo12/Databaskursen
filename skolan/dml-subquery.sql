use skolan;

--subquery
SELECT (SELECT 'moped') AS 'Fordon';

-- Visa alla lärare som undervisar i DIDD.
SELECT
    akronym
FROM larare
WHERE
    avdelning = 'DIDD'
;

-- alla kurstillfällen.
SELECT
    *
FROM kurstillfalle
;

-- Nu slår vi samman dessa satser till en, där den ena blir en subquery som används i WHERE-villkoret
SELECT
    *
FROM kurstillfalle
WHERE
    kursansvarig IN (
        SELECT
            akronym
        FROM larare
        WHERE
            avdelning = 'DIDD'
    )
;

-- UNION på två olika resultset.
(
    SELECT akronym, avdelning FROM larare WHERE avdelning = 'DIDD'
)
UNION
(
    SELECT akronym, avdelning FROM larare WHERE avdelning = 'DIPT'
)
;



-- Visa detaljer om den lärare som är äldst. Ta fram max ålder med en subquery och använd dess resultat i WHERE-satsen.

SELECT
    akronym,
    fornamn,
    efternamn,
    TIMESTAMPDIFF(YEAR, fodd, CURDATE()) as 'alder'
FROM larare
WHERE
    TIMESTAMPDIFF(YEAR, fodd, CURDATE()) = (
    select
		max(TIMESTAMPDIFF(YEAR, fodd, CURDATE())) as 'alder'
	FROM larare
    );
