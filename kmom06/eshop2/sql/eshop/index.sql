-- Drop index if exists and then add index to order table on customer_id
use  eshop;
ALTER TABLE `order` DROP INDEX IF EXISTS idx_order_customer_id;
ALTER TABLE `order` ADD INDEX idx_order_customer_id (`customer_id`);



-- Drop index if exists and then add index to order table on status
ALTER TABLE `order` DROP INDEX IF EXISTS idx_order_status;
ALTER TABLE `order` ADD INDEX idx_order_status (`status`);

-- Drop index if exists and then add index to product_category table on product_id
ALTER TABLE `product_category` DROP INDEX IF EXISTS idx_product_category_product_id;
ALTER TABLE `product_category` ADD INDEX idx_product_category_product_id (`product_id`);

-- Drop index if exists and then add index to product_category table on category_id
ALTER TABLE `product_category` DROP INDEX IF EXISTS idx_product_category_category_id;
ALTER TABLE `product_category` ADD INDEX idx_product_category_category_id (`category_id`);
