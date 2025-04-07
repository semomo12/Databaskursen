--
-- skapa triggers som loggar INSERT och UPDATE-operationer på product-tabellen i event_log.
--
use  eshop;


DELIMITER ;;

DROP TRIGGER IF EXISTS product_insert_trigger;

CREATE TRIGGER product_insert_trigger
AFTER INSERT ON product
FOR EACH ROW
BEGIN
    INSERT INTO event_log (event_id, event_description)
    VALUES (UUID(), CONCAT('Ny produkt lades till med produktid "', NEW.product_id, '" och namn "', NEW.product_name, '".'));
END ;;

DELIMITER ;



DELIMITER ;;

DROP TRIGGER IF EXISTS product_update_trigger;

CREATE TRIGGER product_update_trigger
AFTER UPDATE ON product
FOR EACH ROW
BEGIN
    INSERT INTO event_log (event_id, event_description)
    VALUES (UUID(), CONCAT('Detaljer om produktid "', NEW.product_id, '" och namn "', NEW.product_name, '" uppdaterades.'));
END ;;

DELIMITER ;



DROP TRIGGER IF EXISTS delete_product_trigger;
DELIMITER ;;
CREATE TRIGGER delete_product_trigger
BEFORE DELETE ON product
FOR EACH ROW
BEGIN
    UPDATE product_category SET deleted = NOW() WHERE product_id = OLD.product_id;
    UPDATE order_item SET deleted = NOW() WHERE product_id = OLD.product_id;
    UPDATE warehouse SET deleted = NOW() WHERE product_id = OLD.product_id;
END;;
DELIMITER ;