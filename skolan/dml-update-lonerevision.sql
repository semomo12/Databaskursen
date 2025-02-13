--
-- uppdatera löner för alla lärare
--


-- räknar hur mycket pengar som ligger i lönepotten (med 6.4%)

SELECT SUM(lon) AS Lönesumma, SUM(lon) * 0.064 AS Lonepott FROM larare;

-- Albus kompetens är nu 7 och lönen har ökat till 85 000.
UPDATE larare SET kompetens = 7, lon = 85000 WHERE fornamn = 'ALBUS';

-- Minervas lön har ökat med 4 000.
UPDATE larare SET lon = lon + 4000 WHERE fornamn = 'MINERVA';

-- Argus har fått ett risktillägg om 2 000 och kompetensen är satt till 3.
UPDATE larare SET lon = lon + 2000, kompetens = 3 WHERE fornamn = 'ARGUS';

-- Gyllenroy och Alastor har hög frånvaro och har fått ett löneavdrag med 3 000.
UPDATE larare SET lon = lon - 3000 WHERE fornamn = 'GYLLENROY' OR fornamn = 'ALASTOR';

-- Alla lärare på avdelningen DIDD fick en extra lönebonus om 2%.
UPDATE larare SET lon = lon * 1.02 WHERE avdelning = 'DIDD';

--Alla låglönade kvinnliga lärare, de som tjänar färre än 40 000, fick en lönejustering om extra 3%.
UPDATE larare SET lon = lon * 1.03 WHERE lon < 40000 AND kon = 'K';

-- Severus, Minerva och Hagrid får extra lönetillägg om 5 000 och öka deras kompetens med +1.
UPDATE larare SET lon = lon + 5000, kompetens = kompetens + 1
WHERE fornamn IN ('SEVERUS', 'MINERVA', 'HAGRID');

-- alla lärare får ökning om 2.2% utom Albus, Severus, Minerva och Hagrid.
UPDATE larare SET lon = lon * 1.022 WHERE fornamn NOT IN ('ALBUS', 'SEVERUS', 'MINERVA', 'HAGRID');



-- --kontrollera
-- SELECT akronym, avdelning, fornamn, kon, lon, kompetens
-- FROM larare
-- ORDER BY lon DESC
-- ;

-- kontrollera lönesumma och kompetenssumma
SELECT
SUM(lon) AS Lönesumma, SUM(kompetens) AS Kompetens FROM larare;

--lönesumma ökning %
SELECT ((SUM(lon) - 305000) / 305000 )* 100 AS 'Lönesumma ökning %' FROM larare;
