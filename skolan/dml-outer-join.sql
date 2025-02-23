use skolan;

-- vilka lärare som ansvarar för minst ett kurstillfälle
SELECT DISTINCT akronym AS Akronym, CONCAT(fornamn, " ", efternamn) AS Namn FROM v_planering ORDER BY akronym;

--
-- Outer join, inkludera lärare utan undervisning
--
SELECT DISTINCT
    l.akronym AS Akronym,
    CONCAT(l.fornamn, " ", l.efternamn) AS Namn,
    l.avdelning AS Avdelning,
    kt.kurskod AS Kurskod
FROM larare AS l
    LEFT OUTER JOIN kurstillfalle AS kt
        ON l.akronym = kt.kursansvarig
;

-- right outer join
SELECT DISTINCT
    l.akronym AS Akronym,
    CONCAT(l.fornamn, " ", l.efternamn) AS Namn,
    l.avdelning AS Avdelning,
    kt.kurskod AS Kurskod
FROM larare AS l
    RIGHT OUTER JOIN kurstillfalle AS kt
        ON l.akronym = kt.kursansvarig
;

-- Kan vi då göra samma sak för kurser och visa vilka kurser som inte har kurstillfällen?
-- Gör på egen hand som i föregående exempel och visa enbart de kurser som inte har kurstillfällen.

-- Left outer join
SELECT DISTINCT
    k.kod AS Kurskod,
    k.namn AS Kursnamn,
    kt.lasperiod AS Läsperiod
FROM kurs AS k
LEFT OUTER JOIN kurstillfalle AS kt
    ON k.kod = kt.kurskod
WHERE kt.kurskod IS NULL;
