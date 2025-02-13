
--
-- JOIN
--
-- SELECT
--     l.akronym,
--     l.lon,
--     l.kompetens,
--     p.lon AS "pre-lon",
--     p.kompetens AS "pre-kompetens"
-- FROM larare AS l
--     JOIN larare_pre AS p
--         ON l.akronym = p.akronym
-- ORDER BY akronym
-- ;



-- Visa de lärare som inte har fått en löneökning om minst 3%.
SELECT
    l.akronym,
    l.fornamn,
    l.efternamn,
    p.lon AS 'pre',
    l.lon AS 'nu',
    round(((l.lon - p.lon) / (p.lon / 100)),2) AS 'proc'
FROM
    larare AS l
JOIN
    larare_pre AS p ON l.akronym = p.akronym
WHERE
    ((l.lon - p.lon) / (p.lon / 100)) <= 3;

-- Gör en rapport som visar hur många % respektive lärare fick i löneökning.
SELECT
    l.akronym,
    l.fornamn,
    l.efternamn,
    p.lon AS 'pre',
    l.lon AS 'nu',
    round(((l.lon - p.lon) / (p.lon / 100)),2) AS 'proc'
FROM
    larare AS l
JOIN
    larare_pre AS p ON l.akronym = p.akronym;



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
