--
-- uppdatera befintlig tabellstruktur med kommandot ALTER TABLE.
--
use skolan;

-- Add column to table
ALTER TABLE larare ADD COLUMN IF NOT EXISTS kompetens INT;

-- Ta bort samma kolumn
ALTER TABLE larare DROP COLUMN kompetens;

-- Lägg till samma kolumn igen med default-värdet 1 (DEFAULT)
ALTER TABLE larare ADD COLUMN kompetens INT DEFAULT 1 NOT NULL;


-- visa tabellens kolumner
--SHOW COLUMNS FROM larare;

-- Visa alla rader i tabellen
--SELECT * FROM larare;