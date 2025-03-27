/*!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19  Distrib 10.6.18-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: semomo.local    Database: exam
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
-- Table structure for table `country`
--

DROP TABLE IF EXISTS `country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `country` (
  `id` varchar(50) NOT NULL,
  `name` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `country`
--

LOCK TABLES `country` WRITE;
/*!40000 ALTER TABLE `country` DISABLE KEYS */;
INSERT INTO `country` VALUES ('AUS','Australia','https://en.wikipedia.org/wiki/Australia'),('BOL','Bolivia','https://en.wikipedia.org/wiki/Bolivia'),('CHN','China','https://en.wikipedia.org/wiki/China'),('MCO','Monaco','https://en.wikipedia.org/wiki/Monaco'),('RUS','Russia','https://en.wikipedia.org/wiki/Russia');
/*!40000 ALTER TABLE `country` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `miner`
--

DROP TABLE IF EXISTS `miner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `miner` (
  `id` varchar(50) NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `miner`
--

LOCK TABLES `miner` WRITE;
/*!40000 ALTER TABLE `miner` DISABLE KEYS */;
INSERT INTO `miner` VALUES ('GOLD','Gold digger association'),('JDOE','John and Jane Doe Family of Miners'),('NONE','No miners global environment'),('PLTN','Paltin exploratory group of miners'),('TRMP','Tramp mining cooperation');
/*!40000 ALTER TABLE `miner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `miner2mineral`
--

DROP TABLE IF EXISTS `miner2mineral`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `miner2mineral` (
  `miner_id` varchar(50) NOT NULL,
  `mineral_id` varchar(50) NOT NULL,
  PRIMARY KEY (`miner_id`,`mineral_id`),
  KEY `mineral_id` (`mineral_id`),
  CONSTRAINT `miner2mineral_ibfk_1` FOREIGN KEY (`miner_id`) REFERENCES `miner` (`id`),
  CONSTRAINT `miner2mineral_ibfk_2` FOREIGN KEY (`mineral_id`) REFERENCES `mineral` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `miner2mineral`
--

LOCK TABLES `miner2mineral` WRITE;
/*!40000 ALTER TABLE `miner2mineral` DISABLE KEYS */;
INSERT INTO `miner2mineral` VALUES ('JDOE','C'),('PLTN','Co'),('GOLD','GRA'),('TRMP','Li'),('JDOE','Ni');
/*!40000 ALTER TABLE `miner2mineral` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mineral`
--

DROP TABLE IF EXISTS `mineral`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mineral` (
  `id` varchar(50) NOT NULL,
  `name` varchar(255) NOT NULL,
  `uses` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mineral`
--

LOCK TABLES `mineral` WRITE;
/*!40000 ALTER TABLE `mineral` DISABLE KEYS */;
INSERT INTO `mineral` VALUES ('C','Graphite','Battery anodes, lubricants','Non-metal','https://en.wikipedia.org/wiki/Graphite'),('Co','Cobalt','EV batteries, high-strength alloys','Metal','https://en.wikipedia.org/wiki/Cobalt'),('GRA','Gravel','Construction and landscape','Rock','https://en.wikipedia.org/wiki/Gravel'),('Li','Lithium','EV batteries, energy storage','Metal','https://en.wikipedia.org/wiki/Lithium'),('Ni','Nickel','Stainless steel, batteries','Metal','https://en.wikipedia.org/wiki/Nickel'),('REE','Rare Earth Elements','Magnets, electronics','Rare Earth','https://en.wikipedia.org/wiki/Rare-earth_element');
/*!40000 ALTER TABLE `mineral` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mineral2country`
--

DROP TABLE IF EXISTS `mineral2country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mineral2country` (
  `mineral_id` varchar(50) NOT NULL,
  `country_id` varchar(50) NOT NULL,
  PRIMARY KEY (`mineral_id`,`country_id`),
  KEY `country_id` (`country_id`),
  CONSTRAINT `mineral2country_ibfk_1` FOREIGN KEY (`mineral_id`) REFERENCES `mineral` (`id`),
  CONSTRAINT `mineral2country_ibfk_2` FOREIGN KEY (`country_id`) REFERENCES `country` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mineral2country`
--

LOCK TABLES `mineral2country` WRITE;
/*!40000 ALTER TABLE `mineral2country` DISABLE KEYS */;
INSERT INTO `mineral2country` VALUES ('Co','AUS'),('Li','AUS'),('Ni','AUS'),('REE','AUS'),('Li','BOL'),('C','CHN'),('REE','CHN'),('Co','RUS'),('Ni','RUS');
/*!40000 ALTER TABLE `mineral2country` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'exam'
--
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_rapport` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_uca1400_ai_ci */ ;
DELIMITER ;;
CREATE DEFINER=`dbadm`@`%` PROCEDURE `p_rapport`()
BEGIN
    SELECT m.id AS mineral_id,
           m.name AS mineral_name,
           m.uses AS mineral_uses,
           m.type AS mineral_type,
           m.url AS mineral_url,
           c.name AS country_name
    FROM mineral m
    LEFT JOIN mineral2country mc ON m.id = mc.mineral_id
    LEFT JOIN country c ON mc.country_id = c.id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_rapport3` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_uca1400_ai_ci */ ;
DELIMITER ;;
CREATE DEFINER=`dbadm`@`%` PROCEDURE `p_rapport3`()
BEGIN
    SELECT
        CONCAT(m.name, ' (', m.id, ')') AS Mineral,
        CONCAT(m.uses, 'NULL') AS Uses,
        CONCAT(' [', m.id, ']',miner.name ) AS Miner,
        CONCAT(SUM(mm.amount), 'NULL') AS Amount
    FROM mineral m
    LEFT JOIN miner2mineral mm ON m.id = mm.mineral_id
    LEFT JOIN miner miner ON mm.miner_id = miner.id
GROUP BY
    m.id, m.name, m.uses, miner.name;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_rapport_no_url` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_uca1400_ai_ci */ ;
DELIMITER ;;
CREATE DEFINER=`dbadm`@`%` PROCEDURE `p_rapport_no_url`()
BEGIN
    SELECT m.id AS mineral_id,
           m.name AS mineral_name,
           m.uses AS mineral_uses,
           m.type AS mineral_type,
           c.name AS country_name
    FROM mineral m
    LEFT JOIN mineral2country mc ON m.id = mc.mineral_id
    LEFT JOIN country c ON mc.country_id = c.id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_rapport_search` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_uca1400_ai_ci */ ;
DELIMITER ;;
CREATE DEFINER=`dbadm`@`%` PROCEDURE `p_rapport_search`(IN searchStr VARCHAR(255))
BEGIN
    SELECT m.id AS mineral_id,
           m.name AS mineral_name,
           m.uses AS mineral_uses,
           m.type AS mineral_type,
           m.url AS mineral_url,
           c.name AS country_name
    FROM mineral m
    LEFT JOIN mineral2country mc ON m.id = mc.mineral_id
    LEFT JOIN country c ON mc.country_id = c.id
    WHERE m.id LIKE CONCAT('%', searchStr, '%')
       OR m.name LIKE CONCAT('%', searchStr, '%')
       OR m.uses LIKE CONCAT('%', searchStr, '%')
       OR m.type LIKE CONCAT('%', searchStr, '%')
       OR c.id LIKE CONCAT('%', searchStr, '%')
       OR c.name LIKE CONCAT('%', searchStr, '%');
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

-- Dump completed on 2025-03-27 14:00:20
