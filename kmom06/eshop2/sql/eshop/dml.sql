--rapport

-- -- Kontrollera att alla produkter har minst en kategori
-- SELECT product_id, COUNT(*) AS antal_kategorier
-- FROM product_category
-- GROUP BY product_id
-- HAVING antal_kategorier < 1;

-- -- Kontrollera att minst tre produkter har fler än en kategori
-- SELECT product_id, COUNT(*) AS antal_kategorier
-- FROM product_category
-- GROUP BY product_id
-- HAVING antal_kategorier >= 2;
