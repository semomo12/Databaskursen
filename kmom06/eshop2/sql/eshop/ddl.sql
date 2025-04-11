--
-- Table structure for database `eshop`
--

-- drop tables
DROP TABLE IF EXISTS event_log;
DROP TABLE IF EXISTS order_item;
DROP TABLE IF EXISTS `order`;
DROP TABLE IF EXISTS stock;
DROP TABLE IF EXISTS product_category;
DROP TABLE IF EXISTS category;
DROP TABLE IF EXISTS product;
DROP TABLE IF EXISTS customer;

-- Kundregister
CREATE TABLE customer (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    firstname VARCHAR(100) NOT NULL,
    lastname VARCHAR(100) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    `address` VARCHAR(255) NOT NULL,
    phone_number VARCHAR(20) NOT NULL UNIQUE,
    created datetime DEFAULT current_timestamp(),
    updated datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
    deleted datetime DEFAULT NULL
);


-- Produktregister
CREATE TABLE product (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(255) NOT NULL,
    `description` TEXT DEFAULT NULL,
    price DECIMAL(10,2) NOT NULL DEFAULT 0.00,
    stock_quantity INT DEFAULT 0,
    created datetime DEFAULT current_timestamp(),
    updated datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
    deleted datetime DEFAULT NULL
);


-- Kategori
CREATE TABLE category (
  category_id INT AUTO_INCREMENT PRIMARY KEY,
  category_name VARCHAR(255) NOT NULL UNIQUE,
  created datetime DEFAULT current_timestamp(),
  updated datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  deleted datetime DEFAULT NULL
);



-- Kopplingstabell mellan produkt och kategori
CREATE TABLE product_category (
    product_id INT NOT NULL,
    category_id INT NOT NULL,
    created DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    deleted DATETIME DEFAULT NULL,
    PRIMARY KEY (product_id, category_id),
    FOREIGN KEY (product_id) REFERENCES product(product_id),
    FOREIGN KEY (category_id) REFERENCES category(category_id)
);




--lagerregister
CREATE TABLE stock (
    product_id INT NOT NULL PRIMARY KEY,
    shelf_location VARCHAR(100) NOT NULL,
    stock_quantity INT NOT NULL DEFAULT 0,
    created datetime DEFAULT current_timestamp(),
    updated datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
    deleted datetime DEFAULT NULL,
    FOREIGN KEY (product_id) REFERENCES product(product_id)
);


-- Orderhantering
CREATE TABLE `order` (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    order_date DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    total_price DECIMAL(10,2) NOT NULL DEFAULT 0.00,
    order_status VARCHAR(50) DEFAULT NULL,
    created datetime DEFAULT current_timestamp(),
    updated datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
    deleted datetime DEFAULT NULL,
    shipped datetime DEFAULT NULL,

    FOREIGN KEY (customer_id) REFERENCES customer (customer_id)
);


CREATE TABLE order_item (
    order_item_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    item_count INT NOT NULL DEFAULT 1,
    price DECIMAL(10,2) NOT NULL DEFAULT 0.00,
    created datetime DEFAULT current_timestamp(),
    updated datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
    deleted datetime DEFAULT NULL,
    FOREIGN KEY (order_id) REFERENCES `Order`(order_id),
    FOREIGN KEY (product_id) REFERENCES product(product_id)
);


-- lagerhändelser
CREATE TABLE event_log (
    log_id INT AUTO_INCREMENT PRIMARY KEY,
    event_id varchar(100) NOT NULL,
    event_description TEXT DEFAULT NULL,
    event_date DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    created datetime DEFAULT current_timestamp(),
    updated datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
    deleted datetime DEFAULT NULL
);
