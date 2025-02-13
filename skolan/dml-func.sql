-- Strängfunktioner
use skolan;
-- Skriv en SELECT-sats som skriver ut förnamn + efternamn + avdelning i samma kolumn enligt följande struktur: förnamn efternamn (avdelning)
select concat(fornamn, " ", efternamn, " (", avdelning, ")" ) as NamnAvdelning from larare;

-- Gör om samma sak men skriv ut avdelningens namn med små bokstäver och begränsa utskriften till 3 rader.
select concat(fornamn, " ", efternamn, " (", lower(avdelning), ")" ) as NamnAvdelning from larare limit 3;



-- Datum och tid

-- Skriv en SELECT-sats som endast visar dagens datum.
select fornamn, fodd, DATE_FORMAT(NOW(),"%Y-%m-%d") as 'Dagens datum' from larare;

-- Gör en SELECT-sats som visar samtliga lärare, deras födelseår samt dagens datum och klockslag.
select fornamn, fodd, DATE_FORMAT(NOW(),"%Y-%m-%d") as "Dagens datum", DATE_FORMAT(NOW(),"%H:%i:%s") as "Klockslag" from larare;



-- Beräkna ålder

-- Skriv en SELECT-sats som beräknar lärarens ålder, sortera rapporten för att visa vem som är äldst och yngst.
select fornamn, fodd, TIMESTAMPDIFF(YEAR, fodd, CURDATE()) as 'Ålder' from larare order by Ålder desc;


SELECT fornamn,fodd, MONTHNAME(fodd) AS 'Månad' FROM larare;


-- Visa de lärare som är födda på 40-talet.
select fornamn, fodd, TIMESTAMPDIFF(YEAR, fodd, CURDATE()) as 'Ålder' from larare where YEAR(fodd) between 1940 and 1950 order by Ålder desc;

SELECT
fornamn,
fodd,
MONTHNAME(fodd) AS 'Månad'
FROM larare
WHERE MONTH(fodd) = 5;

-- SELECT
--         akronym,
--         fornamn,
--         efternamn,
--         avdelning,
--         lon,
--         kompetens,
--         DATE_FORMAT(fodd,"%Y-%m-%d") as fodd
--       FROM larare
--       WHERE
--           kompetens BETWEEN 0 AND 20000000
--           OR lon BETWEEN 0 AND 20000000
--       ORDER BY akronym;
