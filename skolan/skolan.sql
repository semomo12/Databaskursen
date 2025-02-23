/*!999999\- enable the sandbox mode */
-- MariaDB dump 10.19  Distrib 10.6.18-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: semomo.local    Database: skolan
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
-- Table structure for table `kurs`
--

DROP TABLE IF EXISTS `kurs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kurs` (
  `kod` char(6) NOT NULL,
  `namn` varchar(40) DEFAULT NULL,
  `poang` float DEFAULT NULL,
  `niva` char(3) DEFAULT NULL,
  PRIMARY KEY (`kod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kurs`
--

LOCK TABLES `kurs` WRITE;
/*!40000 ALTER TABLE `kurs` DISABLE KEYS */;
INSERT INTO `kurs` VALUES ('AST101','Astronomi',5,'G1N'),
('DJU101','Skötsel och vård av magiska djur',4,'G1F'),
('DRY101','Trolldryckslära',6,'G1N'),
('DRY102','Trolldryckslära',6,'G1F'),
('KVA101','Kvastflygning',4,'G1N'),
('MUG101','Mugglarstudier',6,'G1F'),
('SVT101','Försvar mot svartkonster',8,'G1N'),
('SVT201','Försvar mot svartkonster',6,'G1F'),
('SVT202','Försvar mot svartkonster',6,'G1F'),
('SVT401','Försvar mot svartkonster',6,'G2F'),
('VAN101','Förvandlingskonst',5,'G1F');
/*!40000 ALTER TABLE `kurs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kurstillfalle`
--

DROP TABLE IF EXISTS `kurstillfalle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kurstillfalle` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `kurskod` char(6) NOT NULL,
  `kursansvarig` char(3) NOT NULL,
  `lasperiod` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `kurskod` (`kurskod`),
  KEY `kursansvarig` (`kursansvarig`),
  CONSTRAINT `kurstillfalle_ibfk_1` FOREIGN KEY (`kurskod`) REFERENCES `kurs` (`kod`),
  CONSTRAINT `kurstillfalle_ibfk_2` FOREIGN KEY (`kursansvarig`) REFERENCES `larare` (`akronym`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kurstillfalle`
--

LOCK TABLES `kurstillfalle` WRITE;
/*!40000 ALTER TABLE `kurstillfalle` DISABLE KEYS */;
INSERT INTO `kurstillfalle` VALUES
(1,'SVT101','gyl',1),
(2,'SVT101','gyl',3),
(3,'SVT201','ala',1),
(4,'SVT202','ala',2),
(5,'SVT401','sna',1),
(6,'KVA101','hoc',1),
(7,'DJU101','hag',3),
(8,'DRY101','sna',2),
(9,'DRY102','sna',3),
(10,'MUG101','min',4);
/*!40000 ALTER TABLE `kurstillfalle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `larare`
--

DROP TABLE IF EXISTS `larare`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `larare` (
  `akronym` char(3) NOT NULL,
  `avdelning` char(4) DEFAULT NULL,
  `fornamn` varchar(20) DEFAULT NULL,
  `efternamn` varchar(20) DEFAULT NULL,
  `kon` char(1) DEFAULT NULL,
  `lon` int(11) DEFAULT NULL,
  `fodd` date DEFAULT NULL,
  `kompetens` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`akronym`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `larare`
--

LOCK TABLES `larare` WRITE;
/*!40000 ALTER TABLE `larare` DISABLE KEYS */;
INSERT INTO `larare` VALUES ('ala','DIPT','Alastor','Moody','M',27594,'1943-04-03',1),
('dum','ADM','Albus','Dumbledore','M',85000,'1941-04-01',7),
('fil','ADM','Argus','Filch','M',27594,'1946-04-06',3),
('gyl','DIPT','Gyllenroy','Lockman','M',27594,'1952-05-02',1),
('hag','ADM','Hagrid','Rubeus','M',30000,'1956-05-06',2),
('hoc','DIDD','Madam','Hooch','K',37580,'1948-04-08',1),
('min','DIDD','Minerva','McGonagall','K',49880,'1955-05-05',2),
('sna','DIPT','Severus','Snape','M',45000,'1951-05-01',2);
/*!40000 ALTER TABLE `larare` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `larare_pre`
--

DROP TABLE IF EXISTS `larare_pre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `larare_pre` (
  `akronym` char(3) NOT NULL,
  `avdelning` char(4) DEFAULT NULL,
  `fornamn` varchar(20) DEFAULT NULL,
  `efternamn` varchar(20) DEFAULT NULL,
  `kon` char(1) DEFAULT NULL,
  `lon` int(11) DEFAULT NULL,
  `fodd` date DEFAULT NULL,
  `kompetens` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`akronym`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `larare_pre`
--

LOCK TABLES `larare_pre` WRITE;
/*!40000 ALTER TABLE `larare_pre` DISABLE KEYS */;
INSERT INTO `larare_pre` VALUES
('ala','DIPT','Alastor','Moody','M',30000,'1943-04-03',1),
('dum','ADM','Albus','Dumbledore','M',80000,'1941-04-01',1),
('fil','ADM','Argus','Filch','M',25000,'1946-04-06',1),
('gyl','DIPT','Gyllenroy','Lockman','M',30000,'1952-05-02',1),
('hag','ADM','Hagrid','Rubeus','M',25000,'1956-05-06',1),
('hoc','DIDD','Madam','Hooch','K',35000,'1948-04-08',1),
('min','DIDD','Minerva','McGonagall','K',40000,'1955-05-05',1),
('sna','DIPT','Severus','Snape','M',40000,'1951-05-01',1);
/*!40000 ALTER TABLE `larare_pre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `v_aldsta_3_larare`
--

DROP TABLE IF EXISTS `v_aldsta_3_larare`;
/*!50001 DROP VIEW IF EXISTS `v_aldsta_3_larare`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `v_aldsta_3_larare` AS SELECT
 1 AS `akronym`,
  1 AS `Ålder` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `v_all_with_age`
--

DROP TABLE IF EXISTS `v_all_with_age`;
/*!50001 DROP VIEW IF EXISTS `v_all_with_age`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `v_all_with_age` AS SELECT
 1 AS `akronym`,
  1 AS `avdelning`,
  1 AS `fornamn`,
  1 AS `efternamn`,
  1 AS `kon`,
  1 AS `lon`,
  1 AS `fodd`,
  1 AS `kompetens`,
  1 AS `Ålder` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `v_lonerevision`
--

DROP TABLE IF EXISTS `v_lonerevision`;
/*!50001 DROP VIEW IF EXISTS `v_lonerevision`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `v_lonerevision` AS SELECT
 1 AS `akronym`,
  1 AS `fornamn`,
  1 AS `efternamn`,
  1 AS `pre`,
  1 AS `nu`,
  1 AS `diff`,
  1 AS `proc`,
  1 AS `prekomp`,
  1 AS `nukomp`,
  1 AS `diffkomp`,
  1 AS `mini` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `v_planering`
--

DROP TABLE IF EXISTS `v_planering`;
/*!50001 DROP VIEW IF EXISTS `v_planering`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `v_planering` AS SELECT
 1 AS `kod`,
  1 AS `namn`,
  1 AS `poang`,
  1 AS `niva`,
  1 AS `id`,
  1 AS `kurskod`,
  1 AS `kursansvarig`,
  1 AS `lasperiod`,
  1 AS `akronym`,
  1 AS `avdelning`,
  1 AS `fornamn`,
  1 AS `efternamn`,
  1 AS `kon`,
  1 AS `lon`,
  1 AS `fodd`,
  1 AS `kompetens` */;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `v_aldsta_3_larare`
--

/*!50001 DROP VIEW IF EXISTS `v_aldsta_3_larare`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb3 */;
/*!50001 SET character_set_results     = utf8mb3 */;
/*!50001 SET collation_connection      = utf8mb3_uca1400_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`dbadm`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `v_aldsta_3_larare` AS select `l`.`akronym` AS `akronym`,timestampdiff(YEAR,`l`.`fodd`,curdate()) AS `Ålder` from (`larare` `l` join `v_planering` `vp` on(`vp`.`kursansvarig` = `l`.`akronym`)) group by `l`.`akronym` order by timestampdiff(YEAR,`l`.`fodd`,curdate()) desc limit 3 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_all_with_age`
--

/*!50001 DROP VIEW IF EXISTS `v_all_with_age`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb3 */;
/*!50001 SET character_set_results     = utf8mb3 */;
/*!50001 SET collation_connection      = utf8mb3_uca1400_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`dbadm`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `v_all_with_age` AS select `larare`.`akronym` AS `akronym`,`larare`.`avdelning` AS `avdelning`,`larare`.`fornamn` AS `fornamn`,`larare`.`efternamn` AS `efternamn`,`larare`.`kon` AS `kon`,`larare`.`lon` AS `lon`,`larare`.`fodd` AS `fodd`,`larare`.`kompetens` AS `kompetens`,timestampdiff(YEAR,`larare`.`fodd`,curdate()) AS `Ålder` from `larare` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_lonerevision`
--

/*!50001 DROP VIEW IF EXISTS `v_lonerevision`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb3 */;
/*!50001 SET character_set_results     = utf8mb3 */;
/*!50001 SET collation_connection      = utf8mb3_uca1400_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`dbadm`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `v_lonerevision` AS select `l`.`akronym` AS `akronym`,`l`.`fornamn` AS `fornamn`,`l`.`efternamn` AS `efternamn`,`p`.`lon` AS `pre`,`l`.`lon` AS `nu`,`l`.`lon` - `p`.`lon` AS `diff`,round((`l`.`lon` - `p`.`lon`) / (`p`.`lon` / 100),2) AS `proc`,`p`.`kompetens` AS `prekomp`,`l`.`kompetens` AS `nukomp`,`l`.`kompetens` - `p`.`kompetens` AS `diffkomp`,case when (`l`.`lon` - `p`.`lon`) / (`p`.`lon` / 100) > 3 then 'ok' else 'nok' end AS `mini` from (`larare` `l` join `larare_pre` `p` on(`l`.`akronym` = `p`.`akronym`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_planering`
--

/*!50001 DROP VIEW IF EXISTS `v_planering`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb3 */;
/*!50001 SET character_set_results     = utf8mb3 */;
/*!50001 SET collation_connection      = utf8mb3_uca1400_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`dbadm`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `v_planering` AS select `k`.`kod` AS `kod`,`k`.`namn` AS `namn`,`k`.`poang` AS `poang`,`k`.`niva` AS `niva`,`kt`.`id` AS `id`,`kt`.`kurskod` AS `kurskod`,`kt`.`kursansvarig` AS `kursansvarig`,`kt`.`lasperiod` AS `lasperiod`,`l`.`akronym` AS `akronym`,`l`.`avdelning` AS `avdelning`,`l`.`fornamn` AS `fornamn`,`l`.`efternamn` AS `efternamn`,`l`.`kon` AS `kon`,`l`.`lon` AS `lon`,`l`.`fodd` AS `fodd`,`l`.`kompetens` AS `kompetens` from ((`kurs` `k` join `kurstillfalle` `kt` on(`k`.`kod` = `kt`.`kurskod`)) join `larare` `l` on(`l`.`akronym` = `kt`.`kursansvarig`)) */;
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

-- Dump completed on 2025-02-22 18:39:34
