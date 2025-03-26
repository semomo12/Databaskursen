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
-- Table structure for table `konsument`
--

DROP TABLE IF EXISTS `konsument`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `konsument` (
  `id` varchar(50) NOT NULL,
  `namn` varchar(255) NOT NULL,
  `ort` varchar(255) NOT NULL,
  `arsbehov` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `konsument`
--

LOCK TABLES `konsument` WRITE;
/*!40000 ALTER TABLE `konsument` DISABLE KEYS */;
INSERT INTO `konsument` VALUES ('DÅ','Inges elkonsument','Djupekås',0),('JE','Elsas sammanslutning','Jerle',300),('RU','Kooperativa elförbrukarna','Runtuna',200),('SO','Mega Kraftbolaget','Solberga',100);
/*!40000 ALTER TABLE `konsument` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `konsument2kraftverk`
--

DROP TABLE IF EXISTS `konsument2kraftverk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `konsument2kraftverk` (
  `konsument_id` varchar(50) NOT NULL,
  `kraftverk_kalla` varchar(50) NOT NULL,
  PRIMARY KEY (`konsument_id`,`kraftverk_kalla`),
  KEY `fk_kraftverk` (`kraftverk_kalla`),
  CONSTRAINT `fk_konsument` FOREIGN KEY (`konsument_id`) REFERENCES `konsument` (`id`),
  CONSTRAINT `fk_kraftverk` FOREIGN KEY (`kraftverk_kalla`) REFERENCES `kraftverk` (`kalla`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `konsument2kraftverk`
--

LOCK TABLES `konsument2kraftverk` WRITE;
/*!40000 ALTER TABLE `konsument2kraftverk` DISABLE KEYS */;
INSERT INTO `konsument2kraftverk` VALUES ('SO','kärnkraft'),('SO','olja'),('JE','vatten'),('RU','vind');
/*!40000 ALTER TABLE `konsument2kraftverk` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kraftverk`
--

DROP TABLE IF EXISTS `kraftverk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kraftverk` (
  `id` varchar(50) NOT NULL,
  `namn` varchar(255) NOT NULL,
  `plats` varchar(255) NOT NULL,
  `kalla` varchar(50) NOT NULL,
  `effekt` int(11) NOT NULL,
  `nyttjandegrad` int(11) NOT NULL,
  `startad` int(11) NOT NULL,
  `stangd` int(11) DEFAULT NULL,
  `url` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `kalla_idx` (`kalla`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kraftverk`
--

LOCK TABLES `kraftverk` WRITE;
/*!40000 ALTER TABLE `kraftverk` DISABLE KEYS */;
INSERT INTO `kraftverk` VALUES ('HAR','Harsprånget','Luleälven','vatten',818,25,1951,0,'https://sv.wikipedia.org/wiki/Harspr%C3%A5nget'),('KAR','Karlshamnsverket','Karlshamn','olja',335,11,1969,0,'https://sv.wikipedia.org/wiki/Karlshamnsverket'),('LED','Lilla Edet','Göta älv','vatten',39,64,1926,0,'https://sv.wikipedia.org/wiki/Lilla_Edets_kraftverk'),('LIL','Lillgrund vindkraftpark','Öresund','vind',110,34,2007,0,'https://sv.wikipedia.org/wiki/Lillgrunds_vindkraftpark'),('MUN','Munkflohöjden','Jämtland','vind',49,37,2019,0,'https://www.gem.wiki/Munkfloh%C3%B6gen_wind_farm'),('OSK','Oskarshamn 3','Simpevarp','kärnkraft',1400,93,1985,0,'https://sv.wikipedia.org/wiki/Oskarshamns_k%C3%A4rnkraftverk'),('RIN','Ringhals 1','Väröhalvön','kärnkraft',881,87,1976,2020,'https://sv.wikipedia.org/wiki/Ringhals_k%C3%A4rnkraftverk');
/*!40000 ALTER TABLE `kraftverk` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kraftverk2typ`
--

DROP TABLE IF EXISTS `kraftverk2typ`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kraftverk2typ` (
  `kraftverk_id` varchar(50) NOT NULL,
  `typ_id` varchar(50) NOT NULL,
  PRIMARY KEY (`kraftverk_id`,`typ_id`),
  KEY `typ_id` (`typ_id`),
  CONSTRAINT `kraftverk2typ_ibfk_1` FOREIGN KEY (`kraftverk_id`) REFERENCES `kraftverk` (`id`),
  CONSTRAINT `kraftverk2typ_ibfk_2` FOREIGN KEY (`typ_id`) REFERENCES `typ` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kraftverk2typ`
--

LOCK TABLES `kraftverk2typ` WRITE;
/*!40000 ALTER TABLE `kraftverk2typ` DISABLE KEYS */;
INSERT INTO `kraftverk2typ` VALUES ('HAR','FF'),('LED','FF'),('LIL','FF'),('MUN','FF'),('OSK','FF'),('RIN','FF'),('HAR','FN'),('LED','FN'),('LIL','FN'),('MUN','FN');
/*!40000 ALTER TABLE `kraftverk2typ` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `kraftverk_arproduktion`
--

DROP TABLE IF EXISTS `kraftverk_arproduktion`;
/*!50001 DROP VIEW IF EXISTS `kraftverk_arproduktion`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `kraftverk_arproduktion` AS SELECT
 1 AS `id`,
  1 AS `namn`,
  1 AS `effekt`,
  1 AS `nyttjandegrad`,
  1 AS `arsproduktion_kWh` */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `typ`
--

DROP TABLE IF EXISTS `typ`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `typ` (
  `id` varchar(50) NOT NULL,
  `namn` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `typ`
--

LOCK TABLES `typ` WRITE;
/*!40000 ALTER TABLE `typ` DISABLE KEYS */;
INSERT INTO `typ` VALUES ('FF','fossilfri'),('FN','förnybar');
/*!40000 ALTER TABLE `typ` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'exam'
--
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_kraftverk_arproduktion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_uca1400_ai_ci */ ;
DELIMITER ;;
CREATE DEFINER=`dbadm`@`%` PROCEDURE `p_kraftverk_arproduktion`()
BEGIN
    SELECT
        k.id AS kraftverk_id,  
        k.namn,                
        k.effekt,              
        k.nyttjandegrad,       
        k.effekt * 365 * k.nyttjandegrad / 100 AS arsproduktion_kWh 
    FROM kraftverk k;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_rapport1` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_uca1400_ai_ci */ ;
DELIMITER ;;
CREATE DEFINER=`dbadm`@`%` PROCEDURE `p_rapport1`()
BEGIN
    SELECT k.id AS kraftverk_id,
           k.namn AS kraftverk_namn,
           k.plats AS kraftverk_plats,
           k.kalla AS kraftverk_kalla,
           k.effekt AS kraftverk_effekt,
           k.nyttjandegrad AS kraftverk_nyttjandegrad,
           k.startad AS kraftverk_startad,
           k.stangd AS kraftverk_stangd,
           k.url AS kraftverk_url,
           t.namn AS energikalla_typ
    FROM kraftverk k
    JOIN kraftverk2typ k2t ON k.id = k2t.kraftverk_id
    JOIN typ t ON k2t.typ_id = t.id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_rapport1_no_url` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_uca1400_ai_ci */ ;
DELIMITER ;;
CREATE DEFINER=`dbadm`@`%` PROCEDURE `p_rapport1_no_url`()
BEGIN
    SELECT k.id AS kraftverk_id,
           k.namn AS kraftverk_namn,
           k.plats AS kraftverk_plats,
           k.kalla AS kraftverk_kalla,
           k.effekt AS kraftverk_effekt,
           k.nyttjandegrad AS kraftverk_nyttjandegrad,
           k.startad AS kraftverk_startad,
           k.stangd AS kraftverk_stangd,
           t.namn AS energikalla_typ
    FROM kraftverk k
    JOIN kraftverk2typ k2t ON k.id = k2t.kraftverk_id
    JOIN typ t ON k2t.typ_id = t.id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_rapport2` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_uca1400_ai_ci */ ;
DELIMITER ;;
CREATE DEFINER=`dbadm`@`%` PROCEDURE `p_rapport2`()
BEGIN
    SELECT c.id AS konsument_id,
           c.namn AS konsument_namn,
           c.ort AS konsument_ort,
           c.arsbehov AS konsument_arsbehov,
           k.kalla AS konsument_kraftverk_kalla,
        GROUP_CONCAT(DISTINCT t.namn ORDER BY t.namn SEPARATOR ', ') AS energikalla_typ
    FROM konsument c
    JOIN konsument2kraftverk c2k ON c.id = c2k.konsument_id
    JOIN kraftverk k ON c2k.kraftverk_kalla = k.kalla
    JOIN kraftverk2typ k2t ON k.id = k2t.kraftverk_id
    JOIN typ t ON k2t.typ_id = t.id
    GROUP BY c.id, c.namn, c.ort, c.arsbehov, k.kalla;
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
        CONCAT(c.id, ': ', c.namn, ' (', c.ort, ')') AS Konsument,
        ROUND(c.arsbehov / 12, 0) AS Månadsbehov,
        GROUP_CONCAT(DISTINCT t.namn ORDER BY t.namn SEPARATOR ' + ') AS Källa,
        GROUP_CONCAT(DISTINCT CONCAT(k.namn, ' (', k.effekt, ')') ORDER BY k.effekt DESC SEPARATOR ', ') AS `Kraftverk med produktion per tidsenhet`
    FROM konsument c
    LEFT JOIN konsument2kraftverk c2k ON c.id = c2k.konsument_id
    LEFT JOIN kraftverk k ON c2k.kraftverk_kalla = k.kalla
    LEFT JOIN kraftverk2typ k2t ON k.id = k2t.kraftverk_id
    LEFT JOIN typ t ON k2t.typ_id = t.id
    GROUP BY c.id, c.namn, c.ort, c.arsbehov;
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
    SELECT k.id AS kraftverk_id,
           k.namn AS kraftverk_namn,
           k.plats AS kraftverk_plats,
           k.kalla AS kraftverk_kalla,
           k.effekt AS kraftverk_effekt,
           k.nyttjandegrad AS kraftverk_nyttjandegrad,
           k.startad AS kraftverk_startad,
           k.stangd AS kraftverk_stangd,
           k.url AS kraftverk_url,
           t.namn AS energikalla_typ
    FROM kraftverk k
    JOIN kraftverk2typ k2t ON k.id = k2t.kraftverk_id
    JOIN typ t ON k2t.typ_id = t.id
    WHERE k.namn LIKE CONCAT('%', searchStr, '%')
       OR k.plats LIKE CONCAT('%', searchStr, '%')
       OR t.namn LIKE CONCAT('%', searchStr, '%');
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `show_kraftverk` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_uca1400_ai_ci */ ;
DELIMITER ;;
CREATE DEFINER=`dbadm`@`%` PROCEDURE `show_kraftverk`()
BEGIN
    SELECT * FROM kraftverk;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `kraftverk_arproduktion`
--

/*!50001 DROP VIEW IF EXISTS `kraftverk_arproduktion`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb3 */;
/*!50001 SET character_set_results     = utf8mb3 */;
/*!50001 SET collation_connection      = utf8mb3_uca1400_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`dbadm`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `kraftverk_arproduktion` AS select `k`.`id` AS `id`,`k`.`namn` AS `namn`,`k`.`effekt` AS `effekt`,`k`.`nyttjandegrad` AS `nyttjandegrad`,`k`.`effekt` * 365 * `k`.`nyttjandegrad` / 100 AS `arsproduktion_kWh` from `kraftverk` `k` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-03-27  0:15:38
