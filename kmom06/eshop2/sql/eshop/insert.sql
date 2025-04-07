--
-- Insert into customer table
--
USE eshop;

SET FOREIGN_KEY_CHECKS = 0;  -- Inaktivera referens
DELETE FROM event_log;
DELETE FROM order_item;
DELETE FROM `order`;
DELETE FROM stock;
DELETE FROM product_category;
DELETE FROM category;
DELETE FROM product;
DELETE FROM customer;
SET FOREIGN_KEY_CHECKS = 1; -- aktiv

-- insert to table from csv

LOAD DATA LOCAL INFILE 'customer.csv'
INTO TABLE customer
CHARSET utf8
FIELDS
    TERMINATED BY ','
    ENCLOSED BY '"'
LINES
    TERMINATED BY '\n'
IGNORE 1 LINES
(`customer_id`, `firstname`, `lastname`, `email`, `address`, `phone_number`);

--
-- Insert into product table
--
LOAD DATA LOCAL INFILE 'product.csv'
INTO TABLE product
CHARSET utf8
FIELDS
    TERMINATED BY ','
    ENCLOSED BY '"'
LINES
    TERMINATED BY '\n'
IGNORE 1 LINES
(`product_id`, `product_name`,`description`, `price`, `stock_quantity`);

--
-- Insert into category table
--
LOAD DATA LOCAL INFILE 'category.csv'
INTO TABLE category
CHARSET utf8
FIELDS
    TERMINATED BY ','
    ENCLOSED BY '"'
LINES
    TERMINATED BY '\n'
IGNORE 1 LINES
(`category_id`, `category_name`);

--
-- Insert into product_category table
--
LOAD DATA LOCAL INFILE 'product_category.csv'
INTO TABLE product_category
CHARSET utf8
FIELDS
    TERMINATED BY ','
    ENCLOSED BY '"'
LINES
    TERMINATED BY '\n'
IGNORE 1 LINES
(`product_id`, `category_id`);

--
-- Insert into warehouse table
--
LOAD DATA LOCAL INFILE 'stock.csv'
INTO TABLE stock
CHARSET utf8
FIELDS
    TERMINATED BY ','
    ENCLOSED BY '"'
LINES
    TERMINATED BY '\n'
IGNORE 1 LINES
(`product_id`,`stock_quantity`, `shelf_location`);

LOAD DATA LOCAL INFILE 'order.csv'
INTO TABLE `order`
CHARACTER SET utf8
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(`order_id`, `customer_id`,`order_date`, `total_price`, `order_status`, `created`, `updated`, `deleted`, `shipped`);

LOAD DATA LOCAL INFILE 'order_item.csv'
INTO TABLE order_item
CHARACTER SET utf8
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(`order_item_id`, `order_id`, `product_id`, `item_count`, `price`, `created`, `updated`, `deleted`);

LOAD DATA LOCAL INFILE 'event_log.csv'
INTO TABLE event_log
CHARACTER SET utf8
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(`log_id`, `event_id`, `event_description`, `event_date`, `created`, `updated`, `deleted`);
