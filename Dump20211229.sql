CREATE DATABASE  IF NOT EXISTS `library` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `library`;
-- MySQL dump 10.13  Distrib 8.0.27, for Win64 (x86_64)
--
-- Host: localhost    Database: library
-- ------------------------------------------------------
-- Server version	5.7.36-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `administrator`
--

DROP TABLE IF EXISTS `administrator`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `administrator` (
  `adminid` varchar(45) NOT NULL,
  `adminpwd` varchar(45) NOT NULL,
  `adminname` varchar(45) NOT NULL,
  PRIMARY KEY (`adminid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `administrator`
--

LOCK TABLES `administrator` WRITE;
/*!40000 ALTER TABLE `administrator` DISABLE KEYS */;
INSERT INTO `administrator` VALUES ('1001','e10adc3949ba59abbe56e057f20f883e','于淼');
/*!40000 ALTER TABLE `administrator` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `books`
--

DROP TABLE IF EXISTS `books`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `books` (
  `idbooks` varchar(45) NOT NULL,
  `bookname` varchar(45) NOT NULL,
  `author` varchar(45) NOT NULL,
  `price` float NOT NULL,
  `deposit` varchar(45) NOT NULL,
  `quantify` int(11) NOT NULL,
  `state` tinyint(4) NOT NULL,
  PRIMARY KEY (`bookname`,`idbooks`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `books`
--

LOCK TABLES `books` WRITE;
/*!40000 ALTER TABLE `books` DISABLE KEYS */;
INSERT INTO `books` VALUES ('1','暴风雨所诞生的','奥斯特洛夫斯基',31.9,'F3T100',1,0),('1','红楼梦','曹雪芹',40.9,'T5F301',1,0),('1','老人与海','海明威',31.9,'F2T102',2,0),('2','老人与海','海明威',31.9,'F2T103',2,0),('1001','西游记','吴承恩',39.9,'F2T160',1,0),('1','钢铁是怎样练成的','奥斯特洛夫斯基',29.9,'F1T208',2,1),('2','钢铁是怎样练成的','奥斯特洛夫斯基',29.9,'F1T209',2,0);
/*!40000 ALTER TABLE `books` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `booktable`
--

DROP TABLE IF EXISTS `booktable`;
/*!50001 DROP VIEW IF EXISTS `booktable`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `booktable` AS SELECT 
 1 AS `idbooks`,
 1 AS `bookname`,
 1 AS `author`,
 1 AS `price`,
 1 AS `deposit`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `userid` varchar(45) NOT NULL,
  `username` varchar(45) NOT NULL,
  `userpwd` varchar(45) NOT NULL,
  `userdate` datetime NOT NULL,
  `state` tinyint(4) NOT NULL,
  PRIMARY KEY (`userid`,`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('100','石森','123456','2021-12-25 16:35:06',0),('1000','root','e10adc3949ba59abbe56e057f20f883e','2021-12-28 22:35:03',1),('1001','石木','e10adc3949ba59abbe56e057f20f883e','2021-12-24 08:25:30',1),('1002','实木','e10adc3949ba59abbe56e057f20f883e','2021-12-25 16:37:49',0),('1002','石森','123456','2021-12-25 16:33:03',0),('1003','王五','81dc9bdb52d04dc20036dbd8313ed055','2021-12-25 16:45:12',1),('1004','石力','e10adc3949ba59abbe56e057f20f883e','2021-12-25 16:48:32',1),('1006','1321','e10adc3949ba59abbe56e057f20f883e','2021-12-28 19:51:49',0),('1006','李四','e10adc3949ba59abbe56e057f20f883e','2021-12-28 19:35:16',0);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_book_borrow`
--

DROP TABLE IF EXISTS `user_book_borrow`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_book_borrow` (
  `userid` varchar(45) NOT NULL,
  `username` varchar(45) NOT NULL,
  `bookname` varchar(45) NOT NULL,
  `bookid` varchar(45) NOT NULL,
  `borrowdate` datetime NOT NULL,
  `revertstate` tinyint(4) NOT NULL,
  `revertdate` datetime DEFAULT NULL,
  PRIMARY KEY (`userid`,`bookname`,`bookid`,`borrowdate`),
  KEY `bookname_idx` (`bookname`),
  CONSTRAINT `book` FOREIGN KEY (`bookname`) REFERENCES `books` (`bookname`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `user` FOREIGN KEY (`userid`) REFERENCES `user` (`userid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_book_borrow`
--

LOCK TABLES `user_book_borrow` WRITE;
/*!40000 ALTER TABLE `user_book_borrow` DISABLE KEYS */;
INSERT INTO `user_book_borrow` VALUES ('1001','石林','暴风雨所诞生的','1','2021-12-25 16:25:03',0,NULL),('1001','石林','红楼梦','1','2021-12-25 17:01:20',1,'2021-12-28 19:56:22'),('1001','石林','红楼梦','1','2021-12-28 20:02:50',0,NULL),('1001','石林','老人与海','1','2021-12-25 15:46:40',1,'2021-12-28 19:56:54'),('1001','石林','老人与海','1','2021-12-28 19:59:38',0,NULL),('1001','石林','老人与海','2','2021-12-28 19:55:36',0,NULL),('1001','石木','钢铁是怎样练成的','1','2021-12-28 22:40:22',1,'2021-12-28 22:46:44');
/*!40000 ALTER TABLE `user_book_borrow` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `booktable`
--

/*!50001 DROP VIEW IF EXISTS `booktable`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `booktable` AS select `books`.`idbooks` AS `idbooks`,`books`.`bookname` AS `bookname`,`books`.`author` AS `author`,`books`.`price` AS `price`,`books`.`deposit` AS `deposit` from `books` where (`books`.`state` = '1') */;
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

-- Dump completed on 2021-12-29 16:24:53
