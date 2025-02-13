--
-- Aggregerade funktioner
--
use skolan;

-- Uppgifter MIN och MAX

--Hur mycket är den högsta lönen som en lärare har?
SELECT MAX(lon) FROM larare;

--Hur mycket är den lägsta lönen som en lärare har?
SELECT MIN(lon) FROM larare;

-- Group By
-- AVG kompetens per avdelning
SELECT
    avdelning,
    AVG(kompetens)
FROM larare
GROUP BY avdelning
;

-- SUM(lon) per avdelning och kompetens och Order By summa DESC
SELECT avdelning, kompetens, SUM(lon) as Summa
FROM larare
GROUP BY avdelning, kompetens
ORDER BY Summa DESC
;

-- Hur många lärare jobbar på de respektive avdelning?
SELECT COUNT(*) AS "antal larare", avdelning from larare GROUP BY avdelning;

-- Hur mycket betalar respektive avdelning ut i lön varje månad?
select SUM(lon) AS "total lön", avdelning from larare GROUP BY avdelning;

-- Hur mycket är medellönen för de olika avdelningarna?
SELECT AVG(lon) AS "medlelönen", avdelning from larare GROUP BY avdelning;

-- Hur mycket är medellönen för kvinnor kontra män?
-- SELECT AVG(lon) AS "medlelön_K" from larare WHERE kon = 'K';
-- SELECT AVG(lon) AS "medlelön_M" from larare WHERE kon = 'M';
SELECT avg(lon) as 'medellönen', kon FROM larare GROUP BY kon;


-- Rapport,snittet på kompetensen för alla avdelningar, sortera kompetens,visa högst kompetens sjunkande ordning.
SELECT AVG(kompetens) AS "komp_snitt", avdelning
from larare
GROUP BY avdelning
ORDER BY komp_snitt DESC
LIMIT 1;

-- avrunda snittlönen (ROUND()) grupperad per avdelning, per kompetens, sortera enligt avdelning och snittlön.
-- hur många som matchar i respektive gruppering.


SELECT  avdelning, kompetens, ROUND(avg(lon)) AS 'Snittlon',
COUNT(*) as 'Antal' from larare GROUP BY kompetens, avdelning ORDER BY avdelning, Snittlon;


-- om Having

SELECT
    avdelning,
    ROUND(AVG(lon)) AS Snittlon,
    COUNT(lon) AS Antal
FROM larare
GROUP BY
    avdelning
ORDER BY
    avdelning
;

-- SELECT
--     avdelning,
--     ROUND(AVG(lon)) AS Snittlon,
--     COUNT(lon) AS Antal
-- FROM larare
-- GROUP BY
--     avdelning
-- HAVING
--     Snittlon > 35000
-- ORDER BY
--     Snittlon DESC
-- ;

-- SELECT
--     avdelning,
--     ROUND(AVG(lon)) AS Snittlon,
--     COUNT(lon) AS Antal
-- FROM larare
-- WHERE
--     kompetens = 1
-- GROUP BY
--     avdelning
-- ORDER BY
--     avdelning
-- ;


-- SELECT
--     avdelning,
--     ROUND(AVG(lon)) AS Snittlon,
--     COUNT(lon) AS Antal
-- FROM larare
-- WHERE
--     kompetens = 1
-- GROUP BY
--     avdelning
-- HAVING
--     Snittlon < 30000
-- ORDER BY
--     avdelning



-- 1.Visa per avdelning hur många anställda det finns, gruppens snittlön, sortera per avdelning och snittlön

SELECT avdelning, round(avg(lon)) as 'Snittlon', count(fornamn) as 'Antal' from larare GROUP BY avdelning order by avdelning, Snittlon;

-- 2.Visa samma sak som i 1), men visa de kompetenser som finns. gruppera på avdelning, per kompetens, sortera per avdelning och per kompetens.
SELECT avdelning, kompetens, round(avg(lon)) as 'Snittlon', count(fornamn) as 'Antal' from larare GROUP BY avdelning, kompetens order by avdelning, kompetens DESC;

-- 3.Visa samma sak som i 2), men ignorera kompetenser som är större än 3.

SELECT avdelning, kompetens, round(avg(lon)) as 'Snittlon', count(fornamn) as 'Antal' from larare GROUP BY avdelning, kompetens HAVING kompetens <= 3 order by avdelning, kompetens DESC;

-- 4.Visa samma sak som i 3), men exkludera de grupper som har fler än 1 deltagare och inkludera de som har snittlön mellan 30 000 - 45 000. Sortera per snittlön.
SELECT avdelning, kompetens, round(avg(lon)) as 'Snittlon', count(fornamn) as 'Antal' from larare where GROUP BY avdelning, kompetens HAVING Antal <= 1 and Snittlon >= 30000 and Snittlon <= 45000 order by Snittlon DESC;