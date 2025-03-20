/*!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19  Distrib 10.6.18-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: semomo.local    Database: eshop
-- ------------------------------------------------------
-- Server version	11.6.2-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(255) NOT NULL,
  `created` datetime DEFAULT current_timestamp(),
  `updated` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted` datetime DEFAULT NULL,
  PRIMARY KEY (`category_id`),
  UNIQUE KEY `category_name` (`category_name`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'Is-te','2025-03-18 21:22:59','2025-03-18 21:22:59',NULL),(2,'Kaffe','2025-03-18 21:22:59','2025-03-18 21:22:59',NULL),(3,'Smoothies','2025-03-18 21:22:59','2025-03-18 21:22:59',NULL),(4,'Juice','2025-03-18 21:22:59','2025-03-18 21:22:59',NULL),(5,'Saft','2025-03-18 21:22:59','2025-03-18 21:22:59',NULL),(6,'Alkoholfria Drycker','2025-03-18 21:22:59','2025-03-18 21:22:59',NULL),(7,'Energidrycker','2025-03-18 21:22:59','2025-03-18 21:22:59',NULL),(8,'Läsk','2025-03-18 21:22:59','2025-03-18 21:22:59',NULL),(9,'Vatten','2025-03-18 21:22:59','2025-03-18 21:22:59',NULL),(10,'Proteindrycker','2025-03-18 21:22:59','2025-03-18 21:22:59',NULL);
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer` (
  `customer_id` int(11) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(100) NOT NULL,
  `lastname` varchar(100) NOT NULL,
  `email` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `phone_number` varchar(20) NOT NULL,
  `created` datetime DEFAULT current_timestamp(),
  `updated` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted` datetime DEFAULT NULL,
  PRIMARY KEY (`customer_id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `phone_number` (`phone_number`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,'Mikael','Roos','mikael.roos@email.com','Centrumgatan 1, 564 00 Bankeryd','070 42 42 42','2025-03-18 21:22:59','2025-03-18 21:22:59',NULL),(2,'John','Doe','john.doe@email.com','Skogen 1, 555 55 Landet','070 555 555','2025-03-18 21:22:59','2025-03-18 21:22:59',NULL),(3,'Jane','Doe','jane.doe@email.com','Skogen 1, 555 55 Landet','070 556 556','2025-03-18 21:22:59','2025-03-18 21:22:59',NULL),(4,'Max','Mumin','mumintrollet.mumin@email.com','Blå hus 1, 111 11 Mumindalen','070 111 111','2025-03-18 21:22:59','2025-03-18 21:22:59',NULL),(5,'Anna','Lund','anna.lund@email.com','Storgatan 10, 123 45 Ostersund','070 123 456','2025-03-18 21:22:59','2025-03-18 21:22:59',NULL),(6,'Oskar','Berg','oskar.berg@email.com','Granvägen 22, 111 22 Karlskrona','070 789 012','2025-03-18 21:22:59','2025-03-18 21:22:59',NULL);
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event_log`
--

DROP TABLE IF EXISTS `event_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event_log` (
  `log_id` int(11) NOT NULL AUTO_INCREMENT,
  `event_id` varchar(100) NOT NULL,
  `event_description` text DEFAULT NULL,
  `event_date` datetime NOT NULL DEFAULT current_timestamp(),
  `created` datetime DEFAULT current_timestamp(),
  `updated` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted` datetime DEFAULT NULL,
  PRIMARY KEY (`log_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_log`
--

LOCK TABLES `event_log` WRITE;
/*!40000 ALTER TABLE `event_log` DISABLE KEYS */;
INSERT INTO `event_log` VALUES (1,'abcd1234','Product added to inventory','2024-02-20 09:00:00','2024-02-20 09:00:00','2024-02-20 09:00:00',NULL),(2,'efgh5678','Product removed from inventory','2025-03-15 10:15:00','2025-03-15 10:15:00','2025-03-15 10:15:00',NULL),(3,'ijkl91011','Product stock updated','2025-03-15 11:00:00','2025-03-15 11:00:00','2025-03-15 11:00:00',NULL),(4,'mnop1213','Product price changed','2025-03-15 12:30:00','2025-03-15 12:30:00','2025-03-15 12:30:00',NULL),(5,'qrst1415','New product launched','2025-03-15 13:45:00','2025-03-15 13:45:00','2025-03-15 13:45:00',NULL),(6,'uvwx1617','Product stock updated','2025-03-15 14:00:00','2025-03-15 14:00:00','2025-03-15 14:00:00',NULL);
/*!40000 ALTER TABLE `event_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `order_date` datetime NOT NULL DEFAULT current_timestamp(),
  `total_price` decimal(10,2) NOT NULL DEFAULT 0.00,
  `order_status` varchar(50) NOT NULL DEFAULT 'väntar',
  `created` datetime DEFAULT current_timestamp(),
  `updated` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted` datetime DEFAULT NULL,
  `shipped` datetime DEFAULT NULL,
  PRIMARY KEY (`order_id`),
  KEY `customer_id` (`customer_id`),
  CONSTRAINT `order_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
INSERT INTO `order` VALUES (1,1,'2025-03-15 10:00:00',45.00,'väntar','2025-03-15 10:00:00','2025-03-15 10:00:00',NULL,'2025-03-16 10:00:00'),(2,2,'2025-03-15 10:05:00',30.00,'bearbetas','2025-03-15 10:05:00','2025-03-15 10:05:00',NULL,NULL),(3,3,'2025-03-15 10:10:00',25.50,'slutförd','2025-03-15 10:10:00','2025-03-15 10:10:00',NULL,'2025-03-15 12:00:00'),(4,4,'2025-03-15 10:15:00',50.00,'avbruten','2025-03-15 10:15:00','2025-03-15 10:15:00',NULL,NULL),(5,5,'2025-03-15 10:20:00',40.75,'väntar','2025-03-15 10:20:00','2025-03-15 10:20:00',NULL,'2025-03-16 14:00:00'),(6,6,'2025-03-15 10:25:00',48.99,'slutförd','2025-03-15 10:25:00','2025-03-15 10:25:00',NULL,'2025-03-15 13:00:00');
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_item`
--

DROP TABLE IF EXISTS `order_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_item` (
  `order_item_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `item_count` int(11) NOT NULL DEFAULT 1,
  `price` decimal(10,2) NOT NULL DEFAULT 0.00,
  `created` datetime DEFAULT current_timestamp(),
  `updated` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted` datetime DEFAULT NULL,
  PRIMARY KEY (`order_item_id`),
  KEY `order_id` (`order_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `order_item_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `order` (`order_id`),
  CONSTRAINT `order_item_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_item`
--

LOCK TABLES `order_item` WRITE;
/*!40000 ALTER TABLE `order_item` DISABLE KEYS */;
INSERT INTO `order_item` VALUES (4,3,3,5,19.99,'2025-03-15 15:30:00','2025-03-15 15:30:00',NULL),(5,3,4,3,10.99,'2025-03-15 15:31:00','2025-03-15 15:31:00',NULL),(6,4,1,4,21.98,'2025-03-15 15:32:00','2025-03-15 15:32:00',NULL),(7,4,5,2,18.50,'2025-03-15 15:33:00','2025-03-15 15:33:00',NULL),(8,5,2,3,20.99,'2025-03-15 15:34:00','2025-03-15 15:34:00',NULL),(9,5,3,1,19.99,'2025-03-15 15:35:00','2025-03-15 15:35:00',NULL);
/*!40000 ALTER TABLE `order_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product` (
  `product_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_name` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `stock_quantity` int(11) DEFAULT NULL,
  `created` datetime DEFAULT current_timestamp(),
  `updated` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted` datetime DEFAULT NULL,
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'Fuze Tea Persika','Persika smak av Is-te',20.00,100,'2025-03-18 21:22:59','2025-03-18 21:22:59',NULL),(2,'Lemon Iste','Fräsch Lemon Is-te',18.50,150,'2025-03-18 21:22:59','2025-03-18 21:22:59',NULL),(3,'Ice Tea Lemon','Is-te med smak av Lemon',21.00,120,'2025-03-18 21:22:59','2025-03-18 21:22:59',NULL),(4,'Ginger Lemon Tea','Ginger Lemon Is-te',22.00,80,'2025-03-18 21:22:59','2025-03-18 21:22:59',NULL),(5,'Cold Brew Coffee','Långsam bryggd kaffe, kall',25.00,200,'2025-03-18 21:22:59','2025-03-18 21:22:59',NULL),(6,'Nocco BCAA - Tropical','Nocco BCAA med tropisk smak',22.00,250,'2025-03-18 21:22:59','2025-03-18 21:22:59',NULL),(7,'Celsius - Peach','Celsius energidryck med persikosmak',25.00,250,'2025-03-18 21:22:59','2025-03-18 21:22:59',NULL),(8,'Espresso Iced Coffee','Kall espresso kaffe',23.00,130,'2025-03-18 21:22:59','2025-03-18 21:22:59',NULL),(9,'Cold Brew Lemonade','Lemonad med kallbryggt kaffe',24.00,70,'2025-03-18 21:22:59','2025-03-18 21:22:59',NULL),(10,'Ginger Ale','Kaffeliknande, ingefära och kolsyrad',19.00,50,'2025-03-18 21:22:59','2025-03-18 21:22:59',NULL),(11,'Nocco BCAA - Citrus','Nocco BCAA med frisk citrussmak',22.00,250,'2025-03-18 21:22:59','2025-03-18 21:22:59',NULL),(12,'Vatten - Ljus Citron','Friskt citronvatten utan tillsatt socker',18.00,300,'2025-03-18 21:22:59','2025-03-18 21:22:59',NULL),(13,'Mango-Passionsmoothie','Exotisk mango och passionssmoothie',30.00,150,'2025-03-18 21:22:59','2025-03-18 21:22:59',NULL),(14,'Blåbärssmoothie','Smoothie med blåbär',28.50,130,'2025-03-18 21:22:59','2025-03-18 21:22:59',NULL),(15,'Mango Smoothie','Mangosmoothie',27.00,110,'2025-03-18 21:22:59','2025-03-18 21:22:59',NULL),(16,'Strawberry Kiwi Smoothie','Jordgubb och kiwi smoothie',28.00,140,'2025-03-18 21:22:59','2025-03-18 21:22:59',NULL),(17,'Celsius - Tropical','Celsius energidryck med tropisk smak',25.00,250,'2025-03-18 21:22:59','2025-03-18 21:22:59',NULL),(18,'Acai Smoothie','Acai smoothie med bär',32.00,90,'2025-03-18 21:22:59','2025-03-18 21:22:59',NULL),(19,'Berry Blast','Bärsmoothie med olika bär',29.50,120,'2025-03-18 21:22:59','2025-03-18 21:22:59',NULL),(20,'Peach Smoothie','Persikosmoothie',25.00,150,'2025-03-18 21:22:59','2025-03-18 21:22:59',NULL),(21,'Tropical Smoothie','Tropisk smoothie med ananas och kokos',30.00,130,'2025-03-18 21:22:59','2025-03-18 21:22:59',NULL),(22,'Apelsinjuice','Fräsch apelsinjuice',15.50,180,'2025-03-18 21:22:59','2025-03-18 21:22:59',NULL),(23,'Äppeljuice','Fruktig äppeljuice',14.50,160,'2025-03-18 21:22:59','2025-03-18 21:22:59',NULL),(24,'Tropisk Juice','Exotisk tropisk juice',16.00,140,'2025-03-18 21:22:59','2025-03-18 21:22:59',NULL),(25,'Orange Juice','Färskpressad apelsinjuice',15.00,200,'2025-03-18 21:22:59','2025-03-18 21:22:59',NULL),(26,'Kokosvatten','Friskt kokosvatten',20.00,100,'2025-03-18 21:22:59','2025-03-18 21:22:59',NULL),(27,'Hallonsaft Light','Lätt Hallonsaft',18.00,150,'2025-03-18 21:22:59','2025-03-18 21:22:59',NULL),(28,'Fläderblomssaft','Fräsch Fläderblomssaft',19.50,120,'2025-03-18 21:22:59','2025-03-18 21:22:59',NULL),(29,'Körsbärssaft','Körsbärssaft med sockerfritt alternativ',17.00,110,'2025-03-18 21:22:59','2025-03-18 21:22:59',NULL),(30,'Protein Shake - Vanilla','Vaniljproteinshake',25.00,200,'2025-03-18 21:22:59','2025-03-18 21:22:59',NULL),(31,'Protein Shake - Chocolate','Chokladproteinshake',25.00,180,'2025-03-18 21:22:59','2025-03-18 21:22:59',NULL),(32,'Protein Shake - Strawberry','Jordgubbsproteinshake',25.00,200,'2025-03-18 21:22:59','2025-03-18 21:22:59',NULL);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_uca1400_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`dbadm`@`%`*/ /*!50003 TRIGGER product_insert_trigger
AFTER INSERT ON product
FOR EACH ROW
BEGIN
    INSERT INTO event_log (event_id, event_description)
    VALUES (UUID(), CONCAT('Ny produkt lades till med produktid "', NEW.product_id, '" och namn "', NEW.product_name, '".'));
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_uca1400_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`dbadm`@`%`*/ /*!50003 TRIGGER product_update_trigger
AFTER UPDATE ON product
FOR EACH ROW
BEGIN
    INSERT INTO event_log (event_id, event_description)
    VALUES (UUID(), CONCAT('Detaljer om produktid "', NEW.product_id, '" och namn "', NEW.product_name, '" uppdaterades.'));
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `product_category`
--

DROP TABLE IF EXISTS `product_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_category` (
  `product_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `created` datetime DEFAULT current_timestamp(),
  `updated` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted` datetime DEFAULT NULL,
  PRIMARY KEY (`product_id`,`category_id`),
  KEY `category_id` (`category_id`),
  CONSTRAINT `product_category_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`),
  CONSTRAINT `product_category_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_category`
--

LOCK TABLES `product_category` WRITE;
/*!40000 ALTER TABLE `product_category` DISABLE KEYS */;
INSERT INTO `product_category` VALUES (1,1,'2025-03-18 21:22:59','2025-03-18 21:22:59',NULL),(1,8,'2025-03-18 21:22:59','2025-03-18 21:22:59',NULL),(2,1,'2025-03-18 21:22:59','2025-03-18 21:22:59',NULL),(3,1,'2025-03-18 21:22:59','2025-03-18 21:22:59',NULL),(5,2,'2025-03-18 21:22:59','2025-03-18 21:22:59',NULL),(6,7,'2025-03-18 21:22:59','2025-03-18 21:22:59',NULL),(7,7,'2025-03-18 21:22:59','2025-03-18 21:22:59',NULL),(8,2,'2025-03-18 21:22:59','2025-03-18 21:22:59',NULL),(9,2,'2025-03-18 21:22:59','2025-03-18 21:22:59',NULL),(10,2,'2025-03-18 21:22:59','2025-03-18 21:22:59',NULL),(10,8,'2025-03-18 21:22:59','2025-03-18 21:22:59',NULL),(11,7,'2025-03-18 21:22:59','2025-03-18 21:22:59',NULL),(12,9,'2025-03-18 21:22:59','2025-03-18 21:22:59',NULL),(13,3,'2025-03-18 21:22:59','2025-03-18 21:22:59',NULL),(14,3,'2025-03-18 21:22:59','2025-03-18 21:22:59',NULL),(15,3,'2025-03-18 21:22:59','2025-03-18 21:22:59',NULL),(16,3,'2025-03-18 21:22:59','2025-03-18 21:22:59',NULL),(17,7,'2025-03-18 21:22:59','2025-03-18 21:22:59',NULL),(18,3,'2025-03-18 21:22:59','2025-03-18 21:22:59',NULL),(19,3,'2025-03-18 21:22:59','2025-03-18 21:22:59',NULL),(20,3,'2025-03-18 21:22:59','2025-03-18 21:22:59',NULL),(21,3,'2025-03-18 21:22:59','2025-03-18 21:22:59',NULL),(22,4,'2025-03-18 21:22:59','2025-03-18 21:22:59',NULL),(23,4,'2025-03-18 21:22:59','2025-03-18 21:22:59',NULL),(24,4,'2025-03-18 21:22:59','2025-03-18 21:22:59',NULL),(24,5,'2025-03-18 21:22:59','2025-03-18 21:22:59',NULL),(25,4,'2025-03-18 21:22:59','2025-03-18 21:22:59',NULL),(26,9,'2025-03-18 21:22:59','2025-03-18 21:22:59',NULL),(27,5,'2025-03-18 21:22:59','2025-03-18 21:22:59',NULL),(27,6,'2025-03-18 21:22:59','2025-03-18 21:22:59',NULL),(28,5,'2025-03-18 21:22:59','2025-03-18 21:22:59',NULL),(28,6,'2025-03-18 21:22:59','2025-03-18 21:22:59',NULL),(29,5,'2025-03-18 21:22:59','2025-03-18 21:22:59',NULL),(30,10,'2025-03-18 21:22:59','2025-03-18 21:22:59',NULL),(31,10,'2025-03-18 21:22:59','2025-03-18 21:22:59',NULL),(32,10,'2025-03-18 21:22:59','2025-03-18 21:22:59',NULL);
/*!40000 ALTER TABLE `product_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stock`
--

DROP TABLE IF EXISTS `stock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stock` (
  `product_id` int(11) NOT NULL,
  `shelf_location` varchar(100) NOT NULL,
  `stock_quantity` int(11) NOT NULL DEFAULT 0,
  `created` datetime DEFAULT current_timestamp(),
  `updated` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted` datetime DEFAULT NULL,
  PRIMARY KEY (`product_id`),
  CONSTRAINT `stock_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stock`
--

LOCK TABLES `stock` WRITE;
/*!40000 ALTER TABLE `stock` DISABLE KEYS */;
INSERT INTO `stock` VALUES (1,'50',0,'2025-03-18 21:22:59','2025-03-18 21:22:59',NULL),(2,'75',0,'2025-03-18 21:22:59','2025-03-18 21:22:59',NULL),(3,'100',0,'2025-03-18 21:22:59','2025-03-18 21:22:59',NULL),(4,'125',0,'2025-03-18 21:22:59','2025-03-18 21:22:59',NULL),(5,'150',0,'2025-03-18 21:22:59','2025-03-18 21:22:59',NULL),(6,'175',0,'2025-03-18 21:22:59','2025-03-18 21:22:59',NULL),(7,'200',0,'2025-03-18 21:22:59','2025-03-18 21:22:59',NULL),(8,'225',0,'2025-03-18 21:22:59','2025-03-18 21:22:59',NULL),(9,'250',0,'2025-03-18 21:22:59','2025-03-18 21:22:59',NULL),(10,'275',0,'2025-03-18 21:22:59','2025-03-18 21:22:59',NULL),(11,'300',0,'2025-03-18 21:22:59','2025-03-18 21:22:59',NULL),(12,'325',0,'2025-03-18 21:22:59','2025-03-18 21:22:59',NULL),(13,'350',0,'2025-03-18 21:22:59','2025-03-18 21:22:59',NULL),(14,'375',0,'2025-03-18 21:22:59','2025-03-18 21:22:59',NULL),(15,'400',0,'2025-03-18 21:22:59','2025-03-18 21:22:59',NULL),(16,'425',0,'2025-03-18 21:22:59','2025-03-18 21:22:59',NULL),(17,'450',0,'2025-03-18 21:22:59','2025-03-18 21:22:59',NULL),(18,'475',0,'2025-03-18 21:22:59','2025-03-18 21:22:59',NULL),(19,'500',0,'2025-03-18 21:22:59','2025-03-18 21:22:59',NULL),(20,'525',0,'2025-03-18 21:22:59','2025-03-18 21:22:59',NULL),(21,'550',0,'2025-03-18 21:22:59','2025-03-18 21:22:59',NULL),(22,'575',0,'2025-03-18 21:22:59','2025-03-18 21:22:59',NULL),(23,'600',0,'2025-03-18 21:22:59','2025-03-18 21:22:59',NULL),(24,'625',0,'2025-03-18 21:22:59','2025-03-18 21:22:59',NULL),(25,'650',0,'2025-03-18 21:22:59','2025-03-18 21:22:59',NULL),(26,'675',0,'2025-03-18 21:22:59','2025-03-18 21:22:59',NULL),(27,'700',0,'2025-03-18 21:22:59','2025-03-18 21:22:59',NULL),(28,'725',0,'2025-03-18 21:22:59','2025-03-18 21:22:59',NULL),(29,'750',0,'2025-03-18 21:22:59','2025-03-18 21:22:59',NULL),(30,'775',0,'2025-03-18 21:22:59','2025-03-18 21:22:59',NULL),(31,'800',0,'2025-03-18 21:22:59','2025-03-18 21:22:59',NULL),(32,'850',0,'2025-03-18 21:22:59','2025-03-18 21:22:59',NULL);
/*!40000 ALTER TABLE `stock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'eshop'
--
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP FUNCTION IF EXISTS `f_order_status` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_uca1400_ai_ci */ ;
DELIMITER ;;
CREATE DEFINER=`dbadm`@`%` FUNCTION `f_order_status`(created_at DATETIME,
    updated_at DATETIME,
    deleted_at DATETIME,
    ordered_at DATETIME,
    shipped_at DATETIME
) RETURNS varchar(20) CHARSET utf8mb4 COLLATE utf8mb4_uca1400_ai_ci
BEGIN
    DECLARE status VARCHAR(20);

    IF deleted_at IS NOT NULL THEN
        SET status = 'Deleted';
        RETURN status;
    END IF;

    IF shipped_at IS NOT NULL THEN
        SET status = 'Shipped';
        RETURN status;
    END IF;

    IF updated_at is not null   THEN
        SET status = 'Updated';
        RETURN status;
    END IF;

    IF ordered_at IS NOT NULL THEN
        SET status = 'Ordered';
        RETURN status;
    END IF;

    SET status = 'Created';
    RETURN status;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_add_log` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_uca1400_ai_ci */ ;
DELIMITER ;;
CREATE DEFINER=`dbadm`@`%` PROCEDURE `p_add_log`(
    in p_eventinstanceid varchar(100),
    in p_eventdescription varchar(255),
    in p_eventdate datetime
)
BEGIN
    INSERT INTO event_log (event_id, event_description, event_date)
    VALUES (p_eventinstanceid, p_eventdescription, p_eventdate);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_add_product` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_uca1400_ai_ci */ ;
DELIMITER ;;
CREATE DEFINER=`dbadm`@`%` PROCEDURE `p_add_product`(
    IN productname VARCHAR(255),
    IN `description` TEXT,
    IN price DECIMAL(10,2),
    IN stockitem_count INT
)
BEGIN
    INSERT INTO product (product_name, `description`, price, stock_quantity)
    VALUES (productname, `description`, price, stockitem_count);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_add_product_Shelf` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_uca1400_ai_ci */ ;
DELIMITER ;;
CREATE DEFINER=`dbadm`@`%` PROCEDURE `p_add_product_Shelf`(
    IN product_id INT,
    IN shelf_location VARCHAR(255),
    IN stock_quantity INT
)
BEGIN
    INSERT INTO stock (product_id, shelf_location, stock_quantity)
    VALUES (product_id, shelf_location, stock_quantity);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_add_product_to_stock` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_uca1400_ai_ci */ ;
DELIMITER ;;
CREATE DEFINER=`dbadm`@`%` PROCEDURE `p_add_product_to_stock`(
    IN product_id INT,
    IN shelf VARCHAR(255),
    IN item_count INT
)
BEGIN
    INSERT INTO stock (product_id, shelf_location, stock_quantity)
    VALUES (product_id, shelf, item_count)
    ON DUPLICATE KEY UPDATE stock_quantity = stock_quantity + item_count;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_create_category` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_uca1400_ai_ci */ ;
DELIMITER ;;
CREATE DEFINER=`dbadm`@`%` PROCEDURE `p_create_category`(
    IN the_name VARCHAR(100)
)
BEGIN
    INSERT INTO category (category_name) VALUES (the_name);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_delete_category` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_uca1400_ai_ci */ ;
DELIMITER ;;
CREATE DEFINER=`dbadm`@`%` PROCEDURE `p_delete_category`(
    IN id INT
)
BEGIN
    UPDATE category SET deleted = NOW() WHERE category_id = id AND deleted IS NULL;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_delete_product` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_uca1400_ai_ci */ ;
DELIMITER ;;
CREATE DEFINER=`dbadm`@`%` PROCEDURE `p_delete_product`(
    IN id INT
)
BEGIN
    UPDATE product SET deleted = NOW() WHERE product_id = id AND deleted IS NULL;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_display_inventory` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_uca1400_ai_ci */ ;
DELIMITER ;;
CREATE DEFINER=`dbadm`@`%` PROCEDURE `p_display_inventory`()
BEGIN
    SELECT p.product_id, p.product_name, s.shelf_location, s.stock_quantity
    FROM product p
    JOIN stock s ON p.product_id = s.product_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_display_log` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_uca1400_ai_ci */ ;
DELIMITER ;;
CREATE DEFINER=`dbadm`@`%` PROCEDURE `p_display_log`(
    in lognumber int
)
BEGIN
    SELECT * FROM event_log ORDER BY event_date DESC LIMIT logNumber;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_display_products` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_uca1400_ai_ci */ ;
DELIMITER ;;
CREATE DEFINER=`dbadm`@`%` PROCEDURE `p_display_products`()
BEGIN
    SELECT product_id, product_name FROM product;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_display_shelf_locations` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_uca1400_ai_ci */ ;
DELIMITER ;;
CREATE DEFINER=`dbadm`@`%` PROCEDURE `p_display_shelf_locations`()
BEGIN
    SELECT DISTINCT shelf_location FROM stock;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_display_shelves` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_uca1400_ai_ci */ ;
DELIMITER ;;
CREATE DEFINER=`dbadm`@`%` PROCEDURE `p_display_shelves`()
BEGIN
    SELECT * FROM stock;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_edit_category` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_uca1400_ai_ci */ ;
DELIMITER ;;
CREATE DEFINER=`dbadm`@`%` PROCEDURE `p_edit_category`(
    IN id INT,
    IN the_name VARCHAR(100)
)
BEGIN
    IF the_name IS NULL THEN
        SET the_name = '';
    END IF;
    UPDATE category SET category_name = the_name WHERE category_id = id AND deleted IS NULL;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_edit_product` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_uca1400_ai_ci */ ;
DELIMITER ;;
CREATE DEFINER=`dbadm`@`%` PROCEDURE `p_edit_product`(
    IN id INT,
    IN name VARCHAR(100),
    IN `description` TEXT,
    IN price DECIMAL(10,2),
    IN stock_quantity  INT
)
BEGIN
    IF stock_quantity  IS NULL OR stock_quantity  = '' THEN
        SET stock_quantity  = 0;
    END IF;
    IF price IS NULL OR price = '' OR price <= 0 THEN
        SET price = 0.0;
    END IF;
    UPDATE product SET product_name = name, `description` = description, price = price, stock_quantity = stock_quantity  WHERE product_id = id AND deleted IS NULL;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_filter_stock` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_uca1400_ai_ci */ ;
DELIMITER ;;
CREATE DEFINER=`dbadm`@`%` PROCEDURE `p_filter_stock`(
    in filterstring varchar(255)
)
BEGIN
    SELECT p.product_id, p.product_name, s.shelf_location, s.stock_quantity
    FROM product p
    JOIN stock s ON p.product_id = s.product_id
    WHERE p.product_id LIKE CONCAT('%', filterstring, '%')
    OR p.product_name LIKE CONCAT('%', filterstring, '%')
    OR s.shelf_location LIKE CONCAT('%', filterstring, '%');
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_get_categories` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_uca1400_ai_ci */ ;
DELIMITER ;;
CREATE DEFINER=`dbadm`@`%` PROCEDURE `p_get_categories`()
BEGIN
    SELECT * FROM category WHERE deleted IS NULL;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_get_category` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_uca1400_ai_ci */ ;
DELIMITER ;;
CREATE DEFINER=`dbadm`@`%` PROCEDURE `p_get_category`(
    IN id INT
)
BEGIN
    SELECT * FROM category WHERE category_id = id AND deleted IS NULL;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_get_order_status` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_uca1400_ai_ci */ ;
DELIMITER ;;
CREATE DEFINER=`dbadm`@`%` PROCEDURE `p_get_order_status`(IN p_order_id INT)
BEGIN
    SELECT
        order_id,
        order_date,
        customer_id,
        created,
        updated,
        deleted,
        shipped,
        f_order_status(created, updated, deleted, order_date, shipped) AS calculated_status
    FROM
        `order`
    WHERE
        order_id = p_order_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_get_product` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_uca1400_ai_ci */ ;
DELIMITER ;;
CREATE DEFINER=`dbadm`@`%` PROCEDURE `p_get_product`(
    IN id INT
)
BEGIN
    SELECT * FROM product WHERE product_id = id AND deleted IS NULL;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_get_products` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_uca1400_ai_ci */ ;
DELIMITER ;;
CREATE DEFINER=`dbadm`@`%` PROCEDURE `p_get_products`()
BEGIN
    SELECT * FROM product WHERE deleted IS NULL;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_get_products_by_category` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_uca1400_ai_ci */ ;
DELIMITER ;;
CREATE DEFINER=`dbadm`@`%` PROCEDURE `p_get_products_by_category`(
    IN category_id INT
)
BEGIN
    SELECT p.product_name, p.price, p.stock_quantity, p.description
    FROM product p
    JOIN product_category pc ON p.product_id = pc.product_id
    WHERE pc.category_id = category_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_get_product_overview` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_uca1400_ai_ci */ ;
DELIMITER ;;
CREATE DEFINER=`dbadm`@`%` PROCEDURE `p_get_product_overview`()
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
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_plocklist` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_uca1400_ai_ci */ ;
DELIMITER ;;
CREATE DEFINER=`dbadm`@`%` PROCEDURE `p_plocklist`(IN p_order_id INT)
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
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_remove_product_from_shelf` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_uca1400_ai_ci */ ;
DELIMITER ;;
CREATE DEFINER=`dbadm`@`%` PROCEDURE `p_remove_product_from_shelf`(
    IN product_id INT,
    IN shelf_location VARCHAR(255),
    IN item_count INT
)
BEGIN
    UPDATE stock
    SET stock_quantity = GREATEST(stock_quantity - item_count, 0)
    WHERE product_id = product_id AND shelf_location = shelf_location;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_remove_product_from_stock` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_uca1400_ai_ci */ ;
DELIMITER ;;
CREATE DEFINER=`dbadm`@`%` PROCEDURE `p_remove_product_from_stock`(
    in productid int,
    in shelf varchar(255),
    in item_count int
)
begin
    update stock
    set stock_quantity = greatest(stock_quantity - item_count, 0)
    where product_id = productid and shelf_location = shelf;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_remove_product_stock` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_uca1400_ai_ci */ ;
DELIMITER ;;
CREATE DEFINER=`dbadm`@`%` PROCEDURE `p_remove_product_stock`(
    IN product_id INT,
    IN shelf VARCHAR(255),
    IN item_count INT
)
BEGIN
    UPDATE stock
    SET stock_quantity = GREATEST(stock_quantity - item_count, 0)
    WHERE product_id = product_id AND shelf_location = shelf;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_show_customer` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_uca1400_ai_ci */ ;
DELIMITER ;;
CREATE DEFINER=`dbadm`@`%` PROCEDURE `p_show_customer`(IN p_customer_id INT)
BEGIN
    SELECT * FROM customer WHERE customer_id = p_customer_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_show_log` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_uca1400_ai_ci */ ;
DELIMITER ;;
CREATE DEFINER=`dbadm`@`%` PROCEDURE `p_show_log`(
    in lognumber int
)
BEGIN
    SELECT * FROM event_log ORDER BY event_date DESC LIMIT logNumber;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_show_order_with_totals` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_uca1400_ai_ci */ ;
DELIMITER ;;
CREATE DEFINER=`dbadm`@`%` PROCEDURE `p_show_order_with_totals`()
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
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_show_order_with_totals_custom` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_uca1400_ai_ci */ ;
DELIMITER ;;
CREATE DEFINER=`dbadm`@`%` PROCEDURE `p_show_order_with_totals_custom`(IN order_id INT)
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
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_show_products_shelves` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_uca1400_ai_ci */ ;
DELIMITER ;;
CREATE DEFINER=`dbadm`@`%` PROCEDURE `p_show_products_shelves`()
BEGIN
    SELECT p.product_name, s.shelf_location, s.stock_quantity
    FROM product p
    JOIN stock s ON p.product_id = s.product_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_show_shelves` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_uca1400_ai_ci */ ;
DELIMITER ;;
CREATE DEFINER=`dbadm`@`%` PROCEDURE `p_show_shelves`()
BEGIN
    SELECT * FROM stock;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_update_order_status_to_shipped` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_uca1400_ai_ci */ ;
DELIMITER ;;
CREATE DEFINER=`dbadm`@`%` PROCEDURE `p_update_order_status_to_shipped`(IN orderid INT)
BEGIN
    UPDATE `order`
    SET `order_status` = 'Shipped', `shipped` = NOW()
    WHERE `order_id` = orderid;
    SELECT CONCAT('Updated order status to shipped for order with ID ', orderid) AS message;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-03-18 21:24:30
