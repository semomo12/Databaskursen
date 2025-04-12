--
-- procedurer
--

--lista procedurer
-- SELECT ROUTINE_NAME, ROUTINE_TYPE, CREATED, DEFINER
-- FROM information_schema.ROUTINES
-- WHERE ROUTINE_SCHEMA = 'eshop';

-- -- call
-- CALL p_procedure();

-- SET @result = 0;
-- CALL p_procedure(@result);
-- SELECT @result;


-- Visa produktens id, namn, pris och antal i lagret. Visa vilken kategori som produkten tillhör
DROP PROCEDURE IF EXISTS p_get_product_overview;
DELIMITER ;;
CREATE PROCEDURE p_get_product_overview()
BEGIN
    SELECT
        p.product_id,
        p.product_name,
        p.price,
        p.stock_quantity,
        GROUP_CONCAT(c.category_id ORDER BY c.category_id) AS categories
    FROM
        product p
    LEFT JOIN
        product_category pc ON p.product_id = pc.product_id
    LEFT JOIN
        category c ON pc.category_id = c.category_id
    GROUP BY
        p.product_id;
END ;;
DELIMITER ;


-- Create product
DROP PROCEDURE IF EXISTS p_add_product;
DELIMITER ;;
CREATE PROCEDURE p_add_product(
    IN productname VARCHAR(255),
    IN `description` TEXT,
    IN price DECIMAL(10,2),
    IN stockitem_count INT
)
BEGIN
    INSERT INTO product (product_name, `description`, price, stock_quantity)
    VALUES (productname, `description`, price, stockitem_count);
END;;
DELIMITER ;



-- Display all shelves
DROP PROCEDURE IF EXISTS p_show_shelves;
DELIMITER ;;
CREATE PROCEDURE p_show_shelves()
BEGIN
    SELECT * FROM stock;
END;;
DELIMITER ;


-- Display products on shelves
DROP PROCEDURE IF EXISTS p_show_products_shelves;
DELIMITER ;;
CREATE PROCEDURE p_show_products_shelves()
BEGIN
    SELECT p.product_name, s.shelf_location, s.stock_quantity
    FROM product p
    JOIN stock s ON p.product_id = s.product_id;
END;;
DELIMITER ;



-- Add product to shelf
DROP PROCEDURE IF EXISTS p_add_product_Shelf;
DELIMITER ;;
CREATE PROCEDURE p_add_product_Shelf(
    IN product_id INT,
    IN shelf_location VARCHAR(255),
    IN stock_quantity INT
)
BEGIN
    INSERT INTO stock (product_id, shelf_location, stock_quantity)
    VALUES (product_id, shelf_location, stock_quantity);
END;;
DELIMITER ;



-- Remove product from shelf
DROP PROCEDURE IF EXISTS p_remove_product_from_shelf;
DELIMITER ;;
CREATE PROCEDURE p_remove_product_from_shelf(
    IN product_id INT,
    IN shelf_location VARCHAR(255),
    IN item_count INT
)
BEGIN
    UPDATE stock
    SET stock_quantity = GREATEST(stock_quantity - item_count, 0)
    WHERE product_id = product_id AND shelf_location = shelf_location;
END;;
DELIMITER ;



-- Display event log
DROP PROCEDURE IF EXISTS p_show_log;
DELIMITER ;;
CREATE PROCEDURE p_show_log(
    in lognumber int
)
BEGIN
    SELECT * FROM event_log ORDER BY event_date DESC LIMIT logNumber;
END;;
DELIMITER ;


-- Display products
DROP PROCEDURE IF EXISTS p_display_products;
DELIMITER ;;
CREATE PROCEDURE p_display_products()
BEGIN
    SELECT product_id, product_name FROM product;
END;;
DELIMITER ;



-- Display shelf locations
DROP PROCEDURE IF EXISTS p_display_shelf_locations;
DELIMITER ;;
CREATE PROCEDURE p_display_shelf_locations()
BEGIN
    SELECT DISTINCT shelf_location FROM stock;
END;;
DELIMITER ;



-- Display stock
DROP PROCEDURE IF EXISTS p_display_inventory;
DELIMITER ;;
CREATE PROCEDURE p_display_inventory()
BEGIN
    SELECT p.product_id, p.product_name, s.shelf_location, s.stock_quantity
    FROM product p
    JOIN stock s ON p.product_id = s.product_id;
END;;
DELIMITER ;




-- Filter stock
DROP PROCEDURE IF EXISTS p_filter_stock;
DELIMITER ;;
CREATE PROCEDURE p_filter_stock(
    in filterstring varchar(255)
)
BEGIN
    SELECT p.product_id, p.product_name, s.shelf_location, s.stock_quantity
    FROM product p
    JOIN stock s ON p.product_id = s.product_id
    WHERE p.product_id LIKE CONCAT('%', filterstring, '%')
    OR p.product_name LIKE CONCAT('%', filterstring, '%')
    OR s.shelf_location LIKE CONCAT('%', filterstring, '%');
END;;
DELIMITER ;




-- Add product to stock
DROP PROCEDURE IF EXISTS p_add_product_to_stock;
DELIMITER ;;
CREATE PROCEDURE p_add_product_to_stock(
    IN product_id INT,
    IN shelf VARCHAR(255),
    IN item_count INT
)
BEGIN
    INSERT INTO stock (product_id, shelf_location, stock_quantity)
    VALUES (product_id, shelf, item_count)
    ON DUPLICATE KEY UPDATE stock_quantity = stock_quantity + item_count;
END;;
DELIMITER ;



-- Remove product from stock
DROP PROCEDURE IF EXISTS p_remove_product_stock;
DELIMITER ;;
CREATE PROCEDURE p_remove_product_stock(
    IN product_id INT,
    IN shelf VARCHAR(255),
    IN item_count INT
)
BEGIN
    UPDATE stock
    SET stock_quantity = GREATEST(stock_quantity - item_count, 0)
    WHERE product_id = product_id AND shelf_location = shelf;
END;;
DELIMITER ;



-- Add event log
DROP PROCEDURE IF EXISTS p_add_log;
DELIMITER ;;
CREATE PROCEDURE p_add_log(
    in p_eventinstanceid varchar(100),
    in p_eventdescription varchar(255),
    in p_eventdate datetime
)
BEGIN
    INSERT INTO event_log (event_id, event_description, event_date)
    VALUES (p_eventinstanceid, p_eventdescription, p_eventdate);
END;;
DELIMITER ;


-- Show customer by ID
DROP PROCEDURE IF EXISTS p_show_customer;
DELIMITER ;;
CREATE PROCEDURE p_show_customer(IN p_customer_id INT)
BEGIN
    SELECT * FROM customer WHERE customer_id = p_customer_id;
END;;
DELIMITER ;



-- Create category
DROP PROCEDURE IF EXISTS p_create_category;
DELIMITER ;;
CREATE PROCEDURE p_create_category(
    IN the_name VARCHAR(100)
)
BEGIN
    INSERT INTO category (category_name) VALUES (the_name);
END;;
DELIMITER ;



-- Get all categories
DROP PROCEDURE IF EXISTS p_get_categories;
DELIMITER ;;
CREATE PROCEDURE p_get_categories()
BEGIN
    SELECT * FROM category WHERE deleted IS NULL;
END;;
DELIMITER ;



-- Get category by ID
DROP PROCEDURE IF EXISTS p_get_category;
DELIMITER ;;
CREATE PROCEDURE p_get_category(
    IN id INT
)
BEGIN
    SELECT * FROM category WHERE category_id = id AND deleted IS NULL;
END;;
DELIMITER ;



-- Edit category
DROP PROCEDURE IF EXISTS p_edit_category;
DELIMITER ;;
CREATE PROCEDURE p_edit_category(
    IN id INT,
    IN the_name VARCHAR(100)
)
BEGIN
    UPDATE category SET category_name = the_name WHERE category_id = id AND deleted IS NULL;
END;;
DELIMITER ;


-- Delete category (soft delete)
DROP PROCEDURE IF EXISTS p_delete_category;
DELIMITER ;;
CREATE PROCEDURE p_delete_category(
    IN id INT
)
BEGIN
    UPDATE category SET deleted = NOW() WHERE category_id = id AND deleted IS NULL;
END;;
DELIMITER ;



-- Get all products
DROP PROCEDURE IF EXISTS p_get_products;
DELIMITER ;;
CREATE PROCEDURE p_get_products()
BEGIN
    SELECT * FROM product WHERE deleted IS NULL;
END;;
DELIMITER ;



-- Get product by ID
DROP PROCEDURE IF EXISTS p_get_product;
DELIMITER ;;
CREATE PROCEDURE p_get_product(
    IN id INT
)
BEGIN
    SELECT * FROM product WHERE product_id = id AND deleted IS NULL;
END;;
DELIMITER ;



-- Edit product
DROP PROCEDURE IF EXISTS p_edit_product;
DELIMITER ;;
CREATE PROCEDURE p_edit_product(
    IN id INT,
    IN name VARCHAR(100),
    IN `description` TEXT,
    IN price DECIMAL(10,2),
    IN stock INT
)
BEGIN
    UPDATE product SET product_name = name, `description` = description, price = price, stock_quantity = stock WHERE product_id = id AND deleted IS NULL;
END;;
DELIMITER ;



-- Delete product (soft delete)
DROP PROCEDURE IF EXISTS p_delete_product;
DELIMITER ;;
CREATE PROCEDURE p_delete_product(
    IN id INT
)
BEGIN
    UPDATE product SET deleted = NOW() WHERE product_id = id AND deleted IS NULL;
END;;
DELIMITER ;



-- Get products by category
DROP PROCEDURE IF EXISTS p_get_products_by_category;
DELIMITER ;;
CREATE PROCEDURE p_get_products_by_category(
    IN category_id INT
)
BEGIN
    SELECT p.product_name, p.price, p.stock_quantity, p.description
    FROM product p
    JOIN product_category pc ON p.product_id = pc.product_id
    WHERE pc.category_id = category_id;
END;;
DELIMITER ;


DROP PROCEDURE IF EXISTS p_display_shelves;
DELIMITER ;;
CREATE PROCEDURE p_display_shelves()
BEGIN
    SELECT * FROM stock;
END;;
DELIMITER ;


DROP PROCEDURE IF EXISTS p_display_log;
DELIMITER ;;
CREATE PROCEDURE p_display_log(
    in lognumber int
)
BEGIN
    SELECT * FROM event_log ORDER BY event_date DESC LIMIT logNumber;
END;;
DELIMITER ;


DROP PROCEDURE IF EXISTS p_show_order_with_totals_custom;
DELIMITER ;;
CREATE PROCEDURE p_show_order_with_totals_custom(IN order_id INT)
BEGIN
    SELECT
        o.order_id,
        o.order_date,
        o.customer_id,
        o.order_status,
        COALESCE(SUM(oi.item_count), 0) AS total_products,
        COALESCE(SUM(oi.price * oi.item_count), 0) AS total_combined_price
    FROM
        `order` o
    LEFT JOIN
        `order_item` oi ON o.order_id = oi.order_id
    WHERE
        o.order_id = order_id
    GROUP BY
        o.order_id;
END;;
DELIMITER ;


DROP PROCEDURE IF EXISTS p_show_order_with_totals;
DELIMITER ;;
CREATE PROCEDURE p_show_order_with_totals()
BEGIN
    SELECT
        o.order_id,
        o.order_date,
        o.customer_id,
        o.order_status,
        COALESCE(SUM(oi.item_count), 0) AS total_products,
        COALESCE(SUM(oi.price * oi.item_count), 0) AS total_combined_price
    FROM
        `order` o
    LEFT JOIN
        `order_item` oi ON o.order_id = oi.order_id
    GROUP BY
        o.order_id;
END;;
DELIMITER ;





DROP PROCEDURE IF EXISTS p_remove_product_from_stock;
DELIMITER ;;
CREATE PROCEDURE p_remove_product_from_stock(
    in productid int,
    in shelf varchar(255),
    in item_count int
)
begin
    update stock
    set stock_quantity = greatest(stock_quantity - item_count, 0)
    where product_id = productid and shelf_location = shelf;
END;;
DELIMITER ;


DROP PROCEDURE IF EXISTS p_update_order_status_to_shipped;
DELIMITER ;;
CREATE PROCEDURE p_update_order_status_to_shipped(IN orderid INT)
BEGIN
    UPDATE `order`
    SET `order_status` = 'Shipped', `shipped` = NOW()
    WHERE `order_id` = orderid;
    SELECT CONCAT('Updated order status to shipped for order with ID ', orderid) AS message;
END;;
DELIMITER ;


-- Generate picklist
DROP PROCEDURE IF EXISTS p_plocklist;
DELIMITER ;;
CREATE PROCEDURE p_plocklist (IN p_order_id INT)
BEGIN
    SELECT
        oi.order_id,
        oi.product_id,
        p.product_name,
        oi.item_count AS order_item_count,
        (oi.price * oi.item_count) AS order_price,
        s.shelf_location,
        s.stock_quantity,
        (s.stock_quantity - oi.item_count) AS item_count_difference
    FROM
        `order_item` oi
    JOIN
        `product` p ON oi.product_id = p.product_id
    LEFT JOIN
        `stock` s ON oi.product_id = s.product_id
    WHERE
        oi.order_id = p_order_id;
END;;
DELIMITER ;


-- -- Show order status
DROP PROCEDURE IF EXISTS p_get_order_status;
DELIMITER ;;
CREATE PROCEDURE p_get_order_status (IN p_order_id INT)
BEGIN
    SELECT
        order_id,
        order_date,
        customer_id,
        created,
        updated,
        deleted,
        shipped,
        f_order_status(created, updated, deleted, order_date, shipped) AS order_status
    FROM
        `order`
    WHERE
        order_id = p_order_id;
END;;
DELIMITER ;



DROP PROCEDURE IF EXISTS p_show_all_customers;
DELIMITER ;;

CREATE PROCEDURE p_show_all_customers()
BEGIN
    SELECT * FROM `customer`;
END ;;
DELIMITER ;


DROP PROCEDURE IF EXISTS p_show_orders_with_totals;
DELIMITER ;;
CREATE PROCEDURE p_show_orders_with_totals()
BEGIN
    SELECT
        o.order_id,
        o.order_date,
        o.customer_id,
        o.order_status,
        COALESCE(SUM(oi.item_count), 0) AS total_products,
        COALESCE(SUM(oi.price * oi.item_count), 0) AS total_combined_price
    FROM
        `order` o
    LEFT JOIN
        `order_item` oi ON o.order_id = oi.order_id
    GROUP BY
        o.order_id;
END ;;
DELIMITER ;



DROP PROCEDURE IF EXISTS p_show_customer_by_id;
DELIMITER ;;
CREATE PROCEDURE p_show_customer_by_id(IN p_customer_id INT)
BEGIN
    SELECT * FROM `customer` WHERE `customer_id` = p_customer_id;
END;;
DELIMITER ;



DROP PROCEDURE IF EXISTS p_insert_order;
DELIMITER ;;
CREATE PROCEDURE p_insert_order(
    IN p_order_date DATETIME,
    IN p_total_price DECIMAL(10,2),
    IN p_customer_id INT,
    IN p_status VARCHAR(20)
)
BEGIN
    INSERT INTO `order` (order_date, total_price, customer_id, order_status, created, updated)
    VALUES (p_order_date, p_total_price, p_customer_id, p_status, NOW(), NOW());
END ;;
DELIMITER ;



DROP PROCEDURE IF EXISTS p_show_order_details;
DELIMITER ;;
CREATE PROCEDURE p_show_order_details(IN p_order_id INT)
BEGIN
    SELECT oi.order_id, oi.product_id, p.product_name,
           oi.item_count AS total_product, oi.price AS total_combined_price
    FROM `order_item` oi
    JOIN `product` p ON oi.product_id = p.product_id
    WHERE oi.order_id = p_order_id;
END ;;
DELIMITER ;


DROP PROCEDURE IF EXISTS p_change_order_status;
DELIMITER ;;
CREATE PROCEDURE p_change_order_status(in orderid int)
BEGIN
    UPDATE `order`
    SET `order_status` = 'Ordered'
    WHERE `order_id` = orderid;
END ;;
DELIMITER ;


DROP PROCEDURE IF EXISTS p_soft_delete_order;
DELIMITER ;;
CREATE PROCEDURE p_soft_delete_order(IN p_order_id INT)
BEGIN
    UPDATE `order`
    SET `order_status` = 'Deleted', `Deleted` = NOW()
    WHERE `order_id` = p_order_id;
END ;;
DELIMITER ;


DROP PROCEDURE IF EXISTS p_get_products_by_category;
DELIMITER ;;
CREATE PROCEDURE p_get_products_by_category(
    IN category_id INT
)
BEGIN
    SELECT p.product_name, p.price, p.stock_quantity, p.description
    FROM product p
    JOIN product_category pc ON p.product_id = pc.product_id
    WHERE pc.category_id = category_id;
END ;;
DELIMITER ;
