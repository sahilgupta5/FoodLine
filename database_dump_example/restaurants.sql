CREATE DATABASE  IF NOT EXISTS `FoodLineDB` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `FoodLineDB`;
-- MySQL dump 10.13  Distrib 5.6.13, for Win32 (x86)
--
-- Host: localhost    Database: mydb
-- ------------------------------------------------------
-- Server version	5.6.17

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `restaurants`
--

DROP TABLE IF EXISTS `restaurants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `restaurants` (
  `restaurantID` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `address` varchar(250) NOT NULL,
  `gps_lat` double NOT NULL,
  `gps_lon` double NOT NULL,
  `description` text NOT NULL,
  `timeslots` int(11) NOT NULL,
  `limits` int(11) NOT NULL,
  `openTime` bigint(20) NOT NULL,
  `closeTime` bigint(20) NOT NULL,
  PRIMARY KEY (`restaurantID`),
  UNIQUE KEY `restaurantID_UNIQUE` (`restaurantID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `restaurants`
--

LOCK TABLES `restaurants` WRITE;
/*!40000 ALTER TABLE `restaurants` DISABLE KEYS */;
INSERT INTO `restaurants` VALUES (1,'Chick-Fil-A','120 North Avenue NW, Altanta, GA - 30332',88.5,65.78,'Chick-fil-A is an American fast food restaurant chain headquartered in the Atlanta suburb of College Park, Georgia, specializing in chicken sandwiches.',78,15,32400000,79200000),(2,'Taco Bell','10 Student Center Place, Altanta, GA - 30332',88.9,67,'Taco Bell is an American chain of fast-food restaurants that serve a variety of Tex-Mex foods including tacos, burritos, quesadillas, nachos, other specialty items, and a variety of Value menu items.',54,12,36000000,68400000),(3,'Starbucks','3 Robert Drive, CULC, Atlanta, GA - 30332',88.9,67.5,'Starbucks Corporation is an American global coffee company and coffeehouse chain based in Seattle, Washington. Starbucks locations serve hot and cold beverages, whole-bean coffee, microground instant coffee, full-leaf teas, pastries, and snacks. Most stores also sell pre-packaged food items, hot and cold sandwiches, and items such as mugs and tumblers.',120,20,10800000,82800000);
/*!40000 ALTER TABLE `restaurants` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-04-25 12:55:52
