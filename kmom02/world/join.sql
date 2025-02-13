SELECT
    co.`Code`,
    co.`Name` AS 'Country',
    ca.`Name` AS 'Capital',
    GROUP_CONCAT(la.`Language`) AS 'Language',
    co.`Region`,
    co.`Continent`,
    co.`LifeExpectancy`
FROM `country` AS co
    JOIN `city` AS ca
        ON ca.`ID` = co.`Capital`
    JOIN `countrylanguage` AS la
        ON co.`Code` = la.`CountryCode`
WHERE
    la.`IsOfficial` = 'T'
    AND co.`LifeExpectancy` IS NOT NULL
    -- AND co.`Region` LIKE 'Nordic%'
    -- AND co.`Continent` = 'Europe'
GROUP BY
    co.`code`
ORDER BY
    co.`LifeExpectancy` DESC
LIMIT 10
;

-- countrylanguage tabellen
SELECT
    la.`CountryCode`,
    la. 'Language',
FROM `countrylanguage` AS la
WHERE
    la.`IsOfficial` = 'T'
LIMIT 10;






-- city tabellen

select
    ci.`ID`,
    ci.`Name`,
    ci.`CountryCode`
FROM `city` AS ci
LIMIT 10;

-- country tabellen
select
    co.`Code`,
    co.`Name` AS 'Country',
    co.`Capital`,
    co.`Region`,
    co.`Continent`,
    co.`LifeExpectancy`
from
    `country` as co
LIMIT 10;



-- Joina tre tabeller
SELECT
    co.`Code`,
    co.`Name` AS 'Country',
    ci.`Name` AS 'Capital',
    GROUP_CONCAT(la.`Language`) AS 'Language',
    co.`LifeExpectancy`
FROM `country` AS co
    INNER JOIN `city` AS ci
        ON ci.`ID` = co.`Capital`
    INNER JOIN `countrylanguage` AS la
        ON co.`Code` = la.`CountryCode`
WHERE
    la.`IsOfficial` = 'T'
GROUP BY
    la.`CountryCode`
LIMIT 10
;