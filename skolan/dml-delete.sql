--
-- Delete from database skolan.
--
use skolan;
--
-- Delete rows from table
--

-- Radera Hagrid
DELETE FROM larare WHERE fornamn = 'Hagrid';

-- Radera alla som jobbar på avdelningen DIPT
DELETE FROM larare WHERE avdelning = 'DIPT';


--Radera alla som har en lön,men begränsa till 2 rader
DELETE FROM larare WHERE lon limit 2;

-- Radera samtliga återstående rader
DELETE FROM larare;





SELECT * FROM larare;
