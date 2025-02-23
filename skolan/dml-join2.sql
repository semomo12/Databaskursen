use skolan;


--
-- Join using JOIN..ON
--
SELECT *
FROM kurs AS k
    JOIN kurstillfalle AS kt
        ON k.kod = kt.kurskod;
--
-- Join three tables and save it as a view
--
-- skapa en vy som innehåller information om kurs, kurstillfälle och lärare.
CREATE OR REPLACE View v_planering AS
SELECT *
FROM kurs AS k
    JOIN kurstillfalle AS kt
        ON k.kod = kt.kurskod
    JOIN larare AS l
        ON l.akronym = kt.kursansvarig;



-- En rapport som listar läraren med antalet kurstillfällen de ansvarar för,.
select akronym as Akronym, concat(fornamn, " ", efternamn) as Namn, count(id) as 'Tillfallen' from v_planering GROUP BY akronym ORDER BY Tillfallen DESC, Akronym ;


-- En rapport som listar de tre äldsta lärarna.
select akronym, fornamn, efternamn, fodd, TIMESTAMPDIFF(YEAR, fodd, CURDATE()) as 'Ålder' from larare GROUP BY akronym ORDER BY Ålder DESC LIMIT 3;


-- en vy som visar de tre äldsta lärarna som är kursansvariga, tillsammans med deras akronym och ålder. Resultaten är sorterade efter ålder i fallande ordning, limimterat till tre.
create or replace view v_aldsta_3_larare as select l.akronym, TIMESTAMPDIFF(YEAR, l.fodd, CURDATE()) as 'Ålder'
from
larare as l
join
v_planering as vp
on vp.kursansvarig = l.akronym
GROUP BY akronym
ORDER BY Ålder DESC
LIMIT 3;


-- raporten
select
concat(vp.namn, " (", vp.kod, ")") as Kursnamn,
concat(vp.fornamn, " ", vp.efternamn) as "Larare",
TIMESTAMPDIFF(YEAR, vp.fodd, CURDATE()) as 'Ålder'
from v_planering as vp
join v_aldsta_3_larare as l on vp.akronym = l.akronym
ORDER BY Ålder desc, kursnamn;
