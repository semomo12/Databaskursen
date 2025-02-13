--
-- Skapa rapporter från tabellen larare.
--

--WHERE

-- Visa alla rader i tabellen där avdelningen är DIDD.
SELECT * FROM larare WHERE avdelning = 'DIDD';

-- Visa de rader som har en akronym som börjar med bokstaven ‘h’
SELECT * FROM larare WHERE akronym LIKE '%H%';

-- Visa de rader vars lärares förnamn innehåller bokstaven ‘o’.
SELECT * FROM larare WHERE fornamn LIKE '%o%';

-- Visa de rader där lärarna tjänar mellan 30 000 - 50 000.
SELECT * FROM larare WHERE lon BETWEEN 30000 AND 50000;

-- Visa de rader där lärarens kompetens är mindre än 7 och lönen är större än 40 000.
SELECT * FROM larare WHERE kompetens < 7 AND lon > 40000;

-- Visa rader som innehåller lärarna sna, dum, min.
SELECT * FROM larare WHERE akronym IN ('SNA', 'DUM', 'MIN');

-- lärare som har lön > 80 000, lärare som har kompetens om 2 och jobbar på avdelningen ADM.
SELECT * FROM larare WHERE lon > 80000 OR (kompetens = 2 AND avdelning = 'ADM');

-- ORDER BY

-- Skriv endast ut namnen på alla lärare och vad de tjänar.
SELECT fornamn, lon FROM larare ORDER BY lon;

-- Sortera listan på efternamnet, både i stigande och sjunkande ordning.
SELECT * FROM larare ORDER BY efternamn ASC;
SELECT * FROM larare ORDER BY efternamn DESC;

-- Sortera listan på lönen, både i stigande och sjunkande ordning.
SELECT * FROM larare ORDER BY lon ASC;
SELECT * FROM larare ORDER BY lon DESC;

-- de tre som tjänar mest.
SELECT * FROM larare ORDER BY lon DESC LIMIT 3;

-- Lägg till kolumnen avdelning AS “Avdelning”.
SELECT avdelning AS 'Avdelning' FROM larare;
