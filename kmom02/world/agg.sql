--
-- Aggregerande och inbyggda funktioner
--
SELECT
    `Region`,
    `Continent`,
    LPAD(FORMAT(SUM(`Population`), 0), 12) AS 'Population',
    ROUND(AVG(`LifeExpectancy`), 1) AS 'Life expectancy',
    COUNT(`Code`) AS 'Num of countries'
FROM `country`
GROUP BY `Region`
ORDER BY
    SUM(`Population`) DESC,
    COUNT(`Code`) DESC,
    AVG(`LifeExpectancy`)
LIMIT 7
;


LPAD(FORMAT(SUM(`Population`), 0), 12) AS 'Population',
    ROUND(AVG(`LifeExpectancy`), 1) AS 'Life expectancy',
    COUNT(`Code`) AS 'Num of countries'