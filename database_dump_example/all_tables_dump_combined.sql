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
-- Table structure for table `vendors`
--

DROP TABLE IF EXISTS `vendors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vendors` (
  `restaurantID` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `paypalAccount` varchar(100) NOT NULL,
  `password` varchar(45) NOT NULL,
  PRIMARY KEY (`restaurantID`),
  UNIQUE KEY `vendorID_UNIQUE` (`restaurantID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendors`
--

LOCK TABLES `vendors` WRITE;
/*!40000 ALTER TABLE `vendors` DISABLE KEYS */;
INSERT INTO `vendors` VALUES (1,'Chick-Fil-A','QWERT1234','mypass123'),(2,'Taco Bell','ASDFGH123','mypass789'),(3,'Starbucks','GHJKL67844','mypass345');
/*!40000 ALTER TABLE `vendors` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-04-25 12:55:51
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
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `userID` int(11) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(25) NOT NULL,
  `lastname` varchar(25) NOT NULL,
  `phonenumber` varchar(10) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `photofilename` varchar(100) NOT NULL DEFAULT 'default.jpg',
  `vendorID` varchar(45) NOT NULL DEFAULT '0',
  PRIMARY KEY (`userID`),
  UNIQUE KEY `userID_UNIQUE` (`userID`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Joe','Bloggs','4047658976','joebloggs@gatech.edu','password','admin.jpg','0'),(5,'Samantha','Williams','4041235678','chickfila@gatech.edu','cfa','default.jpg','1'),(12,'Sahil','Gupta','3233630631','sahilgupta5@hotmail.com','126534','default.jpg','0'),(13,'Sarthak','Jaiswal','3230651047','sarthakjaiswal@gmail.com','klm123','default.jpg','3'),(14,'Shivani','Gupta','9452186396','sgupta6@yahoo.com','qwerty','default.jpg','0'),(15,'David','Park','4048696969','davidpark@gmail.com','qwerty','default.jpg','0'),(16,'Adam','Smith','6585025364','adamsmith@gmail.com','password123','default.jpg','0'),(17,'Adam','Cole','6789875123','adamcole@gmail.com','password1234','default.jpg',''),(18,'Brad','Pitt','8946781324','bradpitt@gmail.com','password1234','default.jpg',''),(19,'Bradley','Smith','3236759874','bradleysmith@gatech.edu','password','default.jpg','');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-04-25 12:55:51
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
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sessions` (
  `sessionID` varchar(20) NOT NULL,
  `userID` varchar(45) NOT NULL,
  `startTime` datetime NOT NULL,
  `lastActivityTime` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` VALUES ('5348c1631f18d','0','2014-04-12 00:30:27','2014-04-12 00:30:27'),('53490109dc452','1','2014-04-24 01:25:16','2014-04-24 01:25:16'),('535763b600c91','5','2014-04-24 10:59:05','2014-04-24 10:59:05'),('535940008e653','15','2014-04-24 12:46:56','2014-04-24 12:46:56'),('5359e62dbc423','16','2014-04-25 00:35:57','2014-04-25 00:35:57'),('5359ec8e9a2ce','17','2014-04-25 01:03:10','2014-04-25 01:03:10'),('5359ef730a37b','18','2014-04-25 01:15:31','2014-04-25 01:15:31'),('5359f15fcb9f5','19','2014-04-25 01:23:43','2014-04-25 01:23:43');
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-04-25 12:55:51
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
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `orderID` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(100) NOT NULL,
  `restaurantID` int(11) NOT NULL,
  `timeCreated` bigint(20) NOT NULL,
  `description` text NOT NULL,
  `timeClosed` bigint(20) DEFAULT NULL,
  `timeslot` int(11) DEFAULT NULL,
  PRIMARY KEY (`orderID`),
  UNIQUE KEY `orderID_UNIQUE` (`orderID`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (36,'joebloggs@gatech.edu',1,1398322245891,'{\"ItemsOrdered\":\"[\\\"Freshly-Squeezed Lemonade (Large) - Regular\\\\nPrice: 2.19$\\\",\\\"Soft Drinks (Medium)\\\\nPrice: 1.69$\\\"]\",\"TimeOrdered\":1398322245891,\"PaymentInfo\":\"Paid using PayPal Account:-365755876257120804\",\"Email\":\"joebloggs@gatech.edu\",\"TimeSlotOrdered\":41,\"UsersFirstAndLastName\":\"Joe Bloggs\"}',0,41),(37,'joebloggs@gatech.edu',1,1398322616810,'{\"ItemsOrdered\":\"[\\\"Freshly-Brewed Tea (Medium) - Unsweetened\\\\nPrice: 1.69$\\\",\\\"Freshly-Squeezed Lemonade (Large) - Regular\\\\nPrice: 2.19$\\\"]\",\"TimeOrdered\":1398322616810,\"PaymentInfo\":\"Paid using PayPal Account:-7711376084770386491\",\"Email\":\"joebloggs@gatech.edu\",\"TimeSlotOrdered\":41,\"UsersFirstAndLastName\":\"Joe Bloggs\"}',0,41),(38,'joebloggs@gatech.edu',1,1398322744324,'{\"ItemsOrdered\":\"[\\\"Freshly-Squeezed Lemonade (Large) - Regular\\\\nPrice: 2.19$\\\",\\\"Coffee (Medium) - Regular\\\\nPrice: 1.39$\\\"]\",\"TimeOrdered\":1398322744324,\"PaymentInfo\":\"Paid using PayPal Account:1540749874550357525\",\"Email\":\"joebloggs@gatech.edu\",\"TimeSlotOrdered\":36,\"UsersFirstAndLastName\":\"Joe Bloggs\"}',0,36),(39,'joebloggs@gatech.edu',1,1398322744324,'{\"ItemsOrdered\":\"[\\\"Freshly-Squeezed Lemonade (Large) - Regular\\\\nPrice: 2.19$\\\",\\\"Coffee (Medium) - Regular\\\\nPrice: 1.39$\\\"]\",\"TimeOrdered\":1398322744324,\"PaymentInfo\":\"Paid using PayPal Account:-2063515056779784306\",\"Email\":\"joebloggs@gatech.edu\",\"TimeSlotOrdered\":36,\"UsersFirstAndLastName\":\"Joe Bloggs\"}',0,36),(40,'joebloggs@gatech.edu',1,1398325392944,'{\"ItemsOrdered\":\"[\\\"Freshly-Brewed Team (Large) - Sweet\\\\nPrice: 1.89$\\\",\\\"Freshly-Squeezed Lemonade (Medium) - Regular\\\\nPrice: 1.79$\\\"]\",\"TimeOrdered\":1398325392944,\"PaymentInfo\":\"Paid using PayPal Account:4148167274073744275\",\"Email\":\"joebloggs@gatech.edu\",\"TimeSlotOrdered\":40,\"UsersFirstAndLastName\":\"Joe Bloggs\"}',0,40),(41,'joebloggs@gatech.edu',1,1398325464652,'{\"ItemsOrdered\":\"[\\\"Freshly-Brewed Tea (Large) - Unsweetened\\\\nPrice: 1.89$\\\",\\\"Freshly-Squeezed Lemonade (Large) - Regular\\\\nPrice: 2.19$\\\"]\",\"TimeOrdered\":1398325464652,\"PaymentInfo\":\"Paid using PayPal Account:4887953545834744533\",\"Email\":\"joebloggs@gatech.edu\",\"TimeSlotOrdered\":40,\"UsersFirstAndLastName\":\"Joe Bloggs\"}',0,40),(42,'joebloggs@gatech.edu',1,1398325718627,'{\"ItemsOrdered\":\"[\\\"Freshly-Brewed Tea (Medium) - Unsweetened\\\\nPrice: 1.69$\\\",\\\"Freshly-Squeezed Lemonade (Medium) - Regular\\\\nPrice: 1.79$\\\"]\",\"TimeOrdered\":1398325718627,\"PaymentInfo\":\"Paid using PayPal Account:2640222861617190653\",\"Email\":\"joebloggs@gatech.edu\",\"TimeSlotOrdered\":40,\"UsersFirstAndLastName\":\"Joe Bloggs\"}',0,40),(43,'joebloggs@gatech.edu',1,1398325840829,'{\"ItemsOrdered\":\"[\\\"Freshly-Squeezed Lemonade (Medium) - Regular\\\\nPrice: 1.79$\\\",\\\"Fruit Cup (Medium)\\\\nPrice: 2.55$\\\",\\\"Coffee (Large) - Regular\\\\nPrice: 1.89$\\\"]\",\"TimeOrdered\":1398325840829,\"PaymentInfo\":\"Paid using PayPal Account:-1668634962069005121\",\"Email\":\"joebloggs@gatech.edu\",\"TimeSlotOrdered\":41,\"UsersFirstAndLastName\":\"Joe Bloggs\"}',0,41),(44,'joebloggs@gatech.edu',1,1398325943359,'{\"ItemsOrdered\":\"[\\\"Freshly-Brewed Tea (Medium) - Unsweetened\\\\nPrice: 1.69$\\\",\\\"Freshly-Squeezed Lemonade (Large) - Regular\\\\nPrice: 2.19$\\\"]\",\"TimeOrdered\":1398325943359,\"PaymentInfo\":\"Paid using PayPal Account:-1836692287659276200\",\"Email\":\"joebloggs@gatech.edu\",\"TimeSlotOrdered\":41,\"UsersFirstAndLastName\":\"Joe Bloggs\"}',0,41),(45,'joebloggs@gatech.edu',1,1398326045116,'{\"ItemsOrdered\":\"[\\\"Freshly-Brewed Tea (Medium) - Unsweetened\\\\nPrice: 1.69$\\\",\\\"Freshly-Squeezed Lemonade (Medium) - Regular\\\\nPrice: 1.79$\\\",\\\"Bacon, Egg & Cheese Biscuit - Entree\\\\nPrice: 2.79$\\\"]\",\"TimeOrdered\":1398326045116,\"PaymentInfo\":\"Paid using PayPal Account:1394499107642515677\",\"Email\":\"joebloggs@gatech.edu\",\"TimeSlotOrdered\":41,\"UsersFirstAndLastName\":\"Joe Bloggs\"}',0,41),(46,'joebloggs@gatech.edu',1,1398326104955,'{\"ItemsOrdered\":\"[\\\"Fruit Cup (Medium)\\\\nPrice: 2.55$\\\"]\",\"TimeOrdered\":1398326104955,\"PaymentInfo\":\"Paid using PayPal Account:940613746978716672\",\"Email\":\"joebloggs@gatech.edu\",\"TimeSlotOrdered\":41,\"UsersFirstAndLastName\":\"Joe Bloggs\"}',0,41),(47,'joebloggs@gatech.edu',1,1398326211882,'{\"ItemsOrdered\":\"[\\\"Freshly-Brewed Tea (Large) - Unsweetened\\\\nPrice: 1.89$\\\",\\\"Freshly-Squeezed Lemonade (Medium) - Diet\\\\nPrice: 1.89$\\\",\\\"Fruit Cup (Medium)\\\\nPrice: 2.55$\\\"]\",\"TimeOrdered\":1398326211882,\"PaymentInfo\":\"Paid using PayPal Account:-5549772017374239283\",\"Email\":\"joebloggs@gatech.edu\",\"TimeSlotOrdered\":41,\"UsersFirstAndLastName\":\"Joe Bloggs\"}',0,41),(48,'joebloggs@gatech.edu',1,1398327015840,'{\"ItemsOrdered\":\"[\\\"Freshly-Brewed Tea (Medium) - Unsweetened\\\\nPrice: 1.69$\\\",\\\"Freshly-Squeezed Lemonade (Medium) - Diet\\\\nPrice: 1.89$\\\",\\\"Bacon, Egg & Cheese Biscuit - Entree\\\\nPrice: 2.79$\\\"]\",\"TimeOrdered\":1398327015840,\"PaymentInfo\":\"Paid using PayPal Account:1676989106317338382\",\"Email\":\"joebloggs@gatech.edu\",\"TimeSlotOrdered\":43,\"UsersFirstAndLastName\":\"Joe Bloggs\"}',0,43),(49,'joebloggs@gatech.edu',1,1398327181158,'{\"ItemsOrdered\":\"[\\\"Fruit Cup (Medium)\\\\nPrice: 2.55$\\\",\\\"Chick-fil-A Chicken Deluxe Sandwich - Meal\\\\nPrice: 8.25$\\\\nMeals include Medium Waffle Potato Fries and Medium Soft Drink\\\"]\",\"TimeOrdered\":1398327181158,\"PaymentInfo\":\"Paid using PayPal Account:6068442867493450939\",\"Email\":\"joebloggs@gatech.edu\",\"TimeSlotOrdered\":43,\"UsersFirstAndLastName\":\"Joe Bloggs\"}',0,43),(50,'joebloggs@gatech.edu',1,1398327926702,'{\"ItemsOrdered\":\"[\\\"Freshly-Brewed Tea (Large) - Unsweetened\\\\nPrice: 1.89$\\\",\\\"Freshly-Squeezed Lemonade (Medium) - Regular\\\\nPrice: 1.79$\\\",\\\"Bacon, Egg & Cheese Biscuit - Entree\\\\nPrice: 2.79$\\\"]\",\"TimeOrdered\":1398327926702,\"PaymentInfo\":\"Paid using PayPal Account:-4961734624606667202\",\"Email\":\"joebloggs@gatech.edu\",\"TimeSlotOrdered\":44,\"UsersFirstAndLastName\":\"Joe Bloggs\"}',0,44),(51,'joebloggs@gatech.edu',1,1398356051313,'{\"ItemsOrdered\":\"[\\\"Freshly-Brewed Tea (Medium) - Unsweetened\\\\nPrice: 1.69$\\\",\\\"Sausage, Egg & Cheese Biscuit - Meal\\\\nPrice: 4.89$\\\\nMeals include Hash Brown Medium Soft Drink\\\",\\\"Chick-fil-A Chicken Biscuit - Meal\\\\nPrice: 4.49$\\\"]\",\"TimeOrdered\":1398356051313,\"PaymentInfo\":\"Paid using PayPal Account:4016648897038620656\",\"Email\":\"joebloggs@gatech.edu\",\"TimeSlotOrdered\":31,\"UsersFirstAndLastName\":\"Joe Bloggs\"}',0,31),(52,'joebloggs@gatech.edu',1,1398356451465,'{\"ItemsOrdered\":\"[\\\"Freshly-Squeezed Lemonade (Medium) - Regular\\\\nPrice: 1.79$\\\",\\\"Sausage, Egg & Cheese Biscuit - Meal\\\\nPrice: 4.89$\\\\nMeals include Hash Brown Medium Soft Drink\\\"]\",\"TimeOrdered\":1398356451465,\"PaymentInfo\":\"Paid using PayPal Account:-5236875592076527053\",\"Email\":\"joebloggs@gatech.edu\",\"TimeSlotOrdered\":32,\"UsersFirstAndLastName\":\"Joe Bloggs\"}',0,32),(53,'joebloggs@gatech.edu',1,1398358107639,'{\"ItemsOrdered\":\"[\\\"Freshly-Squeezed Lemonade (Medium) - Diet\\\\nPrice: 1.89$\\\"]\",\"TimeOrdered\":1398358107639,\"PaymentInfo\":\"Paid using PayPal Account:-7430365825648263422\",\"Email\":\"joebloggs@gatech.edu\",\"TimeSlotOrdered\":34,\"UsersFirstAndLastName\":\"Joe Bloggs\"}',0,34),(54,'joebloggs@gatech.edu',1,1398360828604,'{\"ItemsOrdered\":\"[\\\"Freshly-Squeezed Lemonade (Medium) - Regular\\\\nPrice: 1.79$\\\",\\\"Sausage, Egg & Cheese Biscuit - Meal\\\\nPrice: 4.89$\\\\nMeals include Hash Brown Medium Soft Drink\\\"]\",\"TimeOrdered\":1398360828604,\"PaymentInfo\":\"Paid using PayPal Account:1647816543176271768\",\"Email\":\"joebloggs@gatech.edu\",\"TimeSlotOrdered\":39,\"UsersFirstAndLastName\":\"Joe Bloggs\"}',0,39),(55,'joebloggs@gatech.edu',1,1398361805954,'{\"ItemsOrdered\":\"[\\\"Sausage, Egg & Cheese Biscuit - Meal\\\\nPrice: 4.89$\\\\nMeals include Hash Brown Medium Soft Drink\\\",\\\"Freshly-Brewed Tea (Medium) - Unsweetened\\\\nPrice: 1.69$\\\"]\",\"TimeOrdered\":1398361805954,\"PaymentInfo\":\"Paid using PayPal Account:-3993890462745880372\",\"Email\":\"joebloggs@gatech.edu\",\"TimeSlotOrdered\":35,\"UsersFirstAndLastName\":\"Joe Bloggs\"}',0,35),(56,'adamsmith@gmail.com',1,1398400993672,'{\"ItemsOrdered\":\"[\\\"Sausage, Egg & Cheese Biscuit - Meal\\\\nPrice: 4.89$\\\\nMeals include Hash Brown Medium Soft Drink\\\",\\\"Fruit Cup (Medium)\\\\nPrice: 2.55$\\\",\\\"Soft Drinks (Medium)\\\\nPrice: 1.69$\\\"]\",\"TimeOrdered\":1398400993672,\"PaymentInfo\":\"Paid using PayPal Account:-5919091354272788925\",\"Email\":\"adamsmith@gmail.com\",\"TimeSlotOrdered\":21,\"UsersFirstAndLastName\":\"Adam Smith\"}',0,21),(57,'bradleysmith@gatech.edu',1,1398403575399,'{\"ItemsOrdered\":\"[\\\"Sausage, Egg & Cheese Biscuit - Meal\\\\nPrice: 4.89$\\\\nMeals include Hash Brown Medium Soft Drink\\\",\\\"Fruit Cup (Medium)\\\\nPrice: 2.55$\\\",\\\"Freshly-Squeezed Lemonade (Medium) - Regular\\\\nPrice: 1.79$\\\"]\",\"TimeOrdered\":1398403575399,\"PaymentInfo\":\"Paid using PayPal Account:-8601885601081718838\",\"Email\":\"bradleysmith@gatech.edu\",\"TimeSlotOrdered\":33,\"UsersFirstAndLastName\":\"Bradley Smith\"}',0,33);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
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
-- Table structure for table `menus`
--

DROP TABLE IF EXISTS `menus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menus` (
  `menuID` int(11) NOT NULL,
  `restaurantID` int(11) NOT NULL,
  `menuJSON` text NOT NULL,
  `name` varchar(10) NOT NULL,
  PRIMARY KEY (`menuID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menus`
--

LOCK TABLES `menus` WRITE;
/*!40000 ALTER TABLE `menus` DISABLE KEYS */;
INSERT INTO `menus` VALUES (1,1,'{\"menuitems\":[{\"item\":\"Fruit Cup (Medium)\",\"price\":\"2.55\",\"description\":\"\"},{\"item\":\"Freshly-Brewed Tea (Medium) - Sweet\",\"price\":\"1.69\",\"description\":\"\"},{\"item\":\"Freshly-Brewed Team (Large) - Sweet\",\"price\":\"1.89\",\"description\":\"\"},{\"item\":\"Freshly-Brewed Tea (Medium) - Unsweetened\",\"price\":\"1.69\",\"description\":\"\"},{\"item\":\"Freshly-Brewed Tea (Large) - Unsweetened\",\"price\":\"1.89\",\"description\":\"\"},{\"item\":\"Freshly-Squeezed Lemonade (Medium) - Regular\",\"price\":\"1.79\",\"description\":\"\"},{\"item\":\"Freshly-Squeezed Lemonade (Large) - Regular\",\"price\":\"2.19\",\"description\":\"\"},{\"item\":\"Freshly-Squeezed Lemonade (Medium) - Diet\",\"price\":\"1.89\",\"description\":\"\"},{\"item\":\"Freshly-Squeezed Lemonade (Large) - Diet\",\"price\":\"2.19\",\"description\":\"\"},{\"item\":\"Soft Drinks (Medium)\",\"price\":\"1.69\",\"description\":\"\"},{\"item\":\"Soft Drinks (Large)\",\"price\":\"1.89\",\"description\":\"\"},{\"item\":\"Coffee (Medium) - Regular\",\"price\":\"1.39\",\"description\":\"\"},{\"item\":\"Coffee (Large) - Regular\",\"price\":\"1.89\",\"description\":\"\"},{\"item\":\"Coffee (Medium) - Decaf\",\"price\":\"1.39\",\"description\":\"\"},{\"item\":\"Coffee (Large) - Decaf\",\"price\":\"1.89\",\"description\":\"\"},{\"item\":\"Bottled Water\",\"price\":\"1.69\",\"description\":\"\"},{\"item\":\"Orange Juice\",\"price\":\"2.39\",\"description\":\"\"},{\"item\":\"UpSize Fries & Drinks in the meal\",\"price\":\"0.44\",\"description\":\"\"},{\"item\":\"Chick-fil-A Chicken Biscuit\",\"price\":\"2.29\",\"description\":\"\"},{\"item\":\"Chick-fil-A Chicken Biscuit - Meal\",\"price\":\"4.49\",\"description\":\"\"},{\"item\":\"Hash Browns\",\"price\":\"1.09\",\"description\":\"\"},{\"item\":\"Sausage, Egg & Cheese Biscuit - Entree\",\"price\":\"2.79\",\"description\":\"\"},{\"item\":\"Bacon, Egg & Cheese Biscuit - Entree\",\"price\":\"2.79\",\"description\":\"\"},{\"item\":\"Sausage, Egg & Cheese Biscuit - Meal\",\"price\":\"4.89\",\"description\":\"Meals include Hash Brown Medium Soft Drink\"},{\"item\":\"Bacon, Egg & Cheese Biscuit - Meal\",\"price\":\"4.89\",\"description\":\"Meals include Hash Brown and Medium Soft Drink\"}]}','Breakfast'),(2,1,'{\"menuitems\":[{\"item\":\"Waffle Potato Fries (Medium)\",\"price\":\"1.79\",\"description\":\"\"},{\"item\":\"Waffle Potato Fries (Large)\",\"price\":\"1.99\",\"description\":\"\"},{\"item\":\"Cole Slaw\",\"price\":\"1.69\",\"description\":\"\"},{\"item\":\"Fruit Cup (Medium)\",\"price\":\"2.55\",\"description\":\"\"},{\"item\":\"Freshly-Brewed Team (Medium) - Sweet\",\"price\":\"1.69\",\"description\":\"\"},{\"item\":\"Freshly-Brewed Team (Large) - Sweet\",\"price\":\"1.89\",\"description\":\"\"},{\"item\":\"Freshly-Brewed Team (Large) - Sweet\",\"price\":\"1.89\",\"description\":\"\"},{\"item\":\"Freshly-Brewed Team (Medium) - Unsweetened\",\"price\":\"1.69\",\"description\":\"\"},{\"item\":\"Freshly-Brewed Team (Large) - Unsweetened\",\"price\":\"1.89\",\"description\":\"\"},{\"item\":\"Freshly-Squeezed Lemonade (Medium) - Regular\",\"price\":\"1.79\",\"description\":\"\"},{\"item\":\"Freshly-Squeezed Lemonade (Large) - Regular\",\"price\":\"2.19\",\"description\":\"\"},{\"item\":\"Freshly-Squeezed Lemonade (Medium) - Diet\",\"price\":\"1.89\",\"description\":\"\"},{\"item\":\"Freshly-Squeezed Lemonade (Large) - Diet\",\"price\":\"2.19\",\"description\":\"\"},{\"item\":\"Soft Drinks (Medium)\",\"price\":\"1.69\",\"description\":\"\"},{\"item\":\"Soft Drinks (Large)\",\"price\":\"1.89\",\"description\":\"\"},{\"item\":\"Bottled Water\",\"price\":\"1.69\",\"description\":\"\"},{\"item\":\"Orange Juice\",\"price\":\"2.39\",\"description\":\"\"},{\"item\":\"Hand-Spun Milkshake (Small) - Cookies & Cream\",\"price\":\"2.95\",\"description\":\"\"},{\"item\":\"Hand-Spun Milkshake (Large) - Cookies & Cream\",\"price\":\"3.39\",\"description\":\"\"},{\"item\":\"Hand-Spun Milkshake (Small) - Chocolate\",\"price\":\"2.95\",\"description\":\"\"},{\"item\":\"Hand-Spun Milkshake (Large) - Chocolate\",\"price\":\"3.39\",\"description\":\"\"},{\"item\":\"Hand-Spun Milkshake (Small) - Strawberry\",\"price\":\"2.95\",\"description\":\"\"},{\"item\":\"Hand-Spun Milkshake (Large) - Strawberry\",\"price\":\"3.39\",\"description\":\"\"},{\"item\":\"Hand-Spun Milkshake (Small) - Vanilla\",\"price\":\"2.95\",\"description\":\"\"},{\"item\":\"Hand-Spun Milkshake (Large) - Vanilla\",\"price\":\"3.39\",\"description\":\"\"},{\"item\":\"IceADream Cup\",\"price\":\"1.99\",\"description\":\"\"},{\"item\":\"Chargrilled Chicken Club Sandwich - Meal\",\"price\":\"8.25\",\"description\":\"Meals include Medium Waffle Potato Fries and Medium Soft Drink\"},{\"item\":\"Chick-fil-A Chicken Deluxe Sandwich - Meal\",\"price\":\"8.25\",\"description\":\"Meals include Medium Waffle Potato Fries and Medium Soft Drink\"},{\"item\":\"Chick-fil-A Nuggets (8-ct) - Meal\",\"price\":\"6.19\",\"description\":\"Meals include Medium Waffle Potato Fries and Medium Soft Drink\"},{\"item\":\"Chick-fil-A Nuggets (12-oct) - Meal\",\"price\":\"7.75\",\"description\":\"Meals include Medium Waffle Potato Fries and Medium Soft Drink\"},{\"item\":\"Chick-fil-A Chicken Sandwich - Entree\",\"price\":\"3.19\",\"description\":\"\"},{\"item\":\"Chick-fil-A Chicken Sandwich - Meal\",\"price\":\"6.19\",\"description\":\"Meals include Medium Waffle Potato Fries and Medium Soft Drink\"},{\"item\":\"Chargrilled Chicken Sandwich - Entree\",\"price\":\"3.99\",\"description\":\"\"},{\"item\":\"Chargrilled Chicken Sandwich - Meal\",\"price\":\"6.95\",\"description\":\"Meals include Medium Waffle Potato Fries and Medium Soft Drink\"},{\"item\":\"Chick-fil-A Nuggets (8-ct) - Entree\",\"price\":\"3.19\",\"description\":\"\"},{\"item\":\"Chcik-fil-A Nuggets (12-ct) - Entree\",\"price\":\"3.75\",\"description\":\"\"},{\"item\":\"Grilled Market Salad\",\"price\":\"7.49\",\"description\":\"\"},{\"item\":\"Side Salad\",\"price\":\"2.99\",\"description\":\"\"},{\"item\":\"Waffle Potato Fries (Medium) - Entree\",\"price\":\"1.79\",\"description\":\"\"},{\"item\":\"Waffle Potato Fries (Large) - Entree\",\"price\":\"1.99\",\"description\":\"\"},{\"item\":\"Spicy Chicken Sandwich - Entree\",\"price\":\"3.45\",\"description\":\"\"},{\"item\":\"Spicy Chicken Sandwich - Meal\",\"price\":\"6.45\",\"description\":\"Meals include Medium Waffle Potato Fries and Medium Soft Drink\"},{\"item\":\"UpSize Fries & Drinks in the meal\",\"price\":\"0.44\",\"description\":\"\"}]}','Lunch'),(3,3,'{\"menuitems\":[{\"item\":\"Old-Fashioned Glazed Doughnut\",\"price\":\"1.50\",\"description\":\"\"},{\"item\":\"Carrot Cake Muffins with Pecans\",\"price\":\"2.25\",\"description\":\"\"},{\"item\":\"Breakfast Sandwich - Classic - 500 cal\",\"price\":\"2.05\",\"description\":\"Sausage, Egg & Cheddar\"},{\"item\":\"Breakfast Sandwich - Artisan\",\"price\":\"3.45\",\"description\":\"Bacon, Egg & Gouda\"},{\"item\":\"Breakfast Sandwich - Artisan\",\"price\":\"3.45\",\"description\":\"Ham, Egg & Cheddar\"},{\"item\":\"Breakfast Sandwich - With Cage-Everything White(Reduced Fat)\",\"price\":\"3.25\",\"description\":\"Turkey, Bacon, White & Cheddar\"},{\"item\":\"Breakfast Sandwich - With Cage-Everything White(Reduced Fat)\",\"price\":\"3.25\",\"description\":\"Spinach, Egg White & Feta Wrap\"},{\"item\":\"Vanilla Macchiato (Tall)\",\"price\":\"3.55\",\"description\":\"Espresso - Signature\"},{\"item\":\"Vanilla Macchiato (Grande)\",\"price\":\"4.35\",\"description\":\"Espresso - Signature\"},{\"item\":\"Vanilla Macchiato (Venti)\",\"price\":\"4.65\",\"description\":\"Espresso - Signature\"},{\"item\":\"Iced Vanilla Macchiato (Tall)\",\"price\":\"3.55\",\"description\":\"Espresso - Signature\"},{\"item\":\"Iced Vanilla Macchiato (Grande)\",\"price\":\"4.35\",\"description\":\"Espresso - Signature\"},{\"item\":\"Iced Vanilla Macchiato (Venti)\",\"price\":\"4.75\",\"description\":\"Espresso - Signature\"},{\"item\":\"Caramel Macchiato (Tall)\",\"price\":\"3.55\",\"description\":\"Espresso - Signature\"},{\"item\":\"Caramel Macchiato (Grande)\",\"price\":\"4.35\",\"description\":\"Espresso - Signature\"},{\"item\":\"Caramel Macchiato (Venti)\",\"price\":\"4.65\",\"description\":\"Espresso - Signature\"},{\"item\":\"Iced Caramel Macchiato (Tall)\",\"price\":\"3.55\",\"description\":\"Espresso - Signature\"},{\"item\":\"Iced Caramel Macchiato (Grande)\",\"price\":\"4.35\",\"description\":\"Espresso - Signature\"},{\"item\":\"Iced Caramel Macchiato (Venti)\",\"price\":\"4.75\",\"description\":\"Espresso - Signature\"},{\"item\":\"Hazelnut Macchiato (Tall)\",\"price\":\"3.55\",\"description\":\"Espresso - Signature\"},{\"item\":\"Hazelnut Macchiato (Grande)\",\"price\":\"4.35\",\"description\":\"Espresso - Signature\"},{\"item\":\"Hazelnut Macchiato (Venti)\",\"price\":\"4.65\",\"description\":\"Espresso - Signature\"},{\"item\":\"Iced Hazelnut Macchiato (Tall)\",\"price\":\"3.55\",\"description\":\"Espresso - Signature\"},{\"item\":\"Iced Hazelnut Macchiato (Grande)\",\"price\":\"4.35\",\"description\":\"Espresso - Signature\"},{\"item\":\"Iced Hazelnut Macchiato (Venti)\",\"price\":\"4.75\",\"description\":\"Espresso - Signature\"},{\"item\":\"White Chocolate Mocha (Tall)\",\"price\":\"3.55\",\"description\":\"Espresso - Signature\"},{\"item\":\"White Chocolate Mocha (Grande)\",\"price\":\"4.35\",\"description\":\"Espresso - Signature\"},{\"item\":\"White Chocolate Mocha (Venti)\",\"price\":\"4.65\",\"description\":\"Espresso - Signature\"},{\"item\":\"Cinnamon Dolce Latte (Tall)\",\"price\":\"3.55\",\"description\":\"Espresso - Signature\"},{\"item\":\"Cinnamon Dolce Latte (Grande)\",\"price\":\"4.35\",\"description\":\"Espresso - Signature\"},{\"item\":\"Cinnamon Dolce Latte (Venti)\",\"price\":\"4.65\",\"description\":\"Espresso - Signature\"},{\"item\":\"Caffe Latte (Tall)\",\"price\":\"2.75\",\"description\":\"Espresso - Classics\"},{\"item\":\"Caffe Latte (Grande)\",\"price\":\"3.65\",\"description\":\"Espresso - Classics\"},{\"item\":\"Caffe Latte (Venti)\",\"price\":\"3.95\",\"description\":\"Espresso - Classics\"},{\"item\":\"Vanilla Latte (Tall)\",\"price\":\"3.25\",\"description\":\"Espresso - Classics\"},{\"item\":\"Vanilla Latte (Grande)\",\"price\":\"4.15\",\"description\":\"Espresso - Classics\"},{\"item\":\"Vanilla Latte (Venti)\",\"price\":\"4.45\",\"description\":\"Espresso - Classics\"},{\"item\":\"Caffe Mocha (Tall)\",\"price\":\"3.25\",\"description\":\"Espresso - Classics\"},{\"item\":\"Caffe Mocha (Grande)\",\"price\":\"4.15\",\"description\":\"Espresso - Classics\"},{\"item\":\"Caffe Mocha (Venti)\",\"price\":\"4.45\",\"description\":\"Espresso - Classics\"},{\"item\":\"Caffe Americano (Tall)\",\"price\":\"2.15\",\"description\":\"Espresso - Classics\"},{\"item\":\"Caffe Americano (Grande)\",\"price\":\"2.55\",\"description\":\"Espresso - Classics\"},{\"item\":\"Caffe Americano (Venti)\",\"price\":\"2.95\",\"description\":\"Espresso - Classics\"},{\"item\":\"Cappuccino (Tall)\",\"price\":\"2.75\",\"description\":\"Espresso - Classics\"},{\"item\":\"Cappuccino (Grande)\",\"price\":\"3.65\",\"description\":\"Espresso - Classics\"},{\"item\":\"Cappuccino (Venti)\",\"price\":\"3.95\",\"description\":\"Espresso - Classics\"},{\"item\":\"Flavor - Regular\",\"price\":\"0.50\",\"description\":\"\"},{\"item\":\"Flavor - Sugar Free\",\"price\":\"0.50\",\"description\":\"\"},{\"item\":\"Espresso Shot\",\"price\":\"0.75\",\"description\":\"\"},{\"item\":\"Extra Coffee\",\"price\":\"0.50\",\"description\":\"\"},{\"item\":\"Light - 1/3 Fewer Calories\",\"price\":\"0.00\",\"description\":\"\"},{\"item\":\"Caffee Vanilla Frappuccino (Tall)\",\"price\":\"2.95\",\"description\":\"Frappuccino - Coffee\"},{\"item\":\"Caffee Vanilla Frappuccino (Grande)\",\"price\":\"3.75\",\"description\":\"Frappuccino - Coffee\"},{\"item\":\"Caffee Vanilla Frappuccino (Venti)\",\"price\":\"4.45\",\"description\":\"Frappuccino - Coffee\"},{\"item\":\"Hazelnut Frappuccino (Tall)\",\"price\":\"3.75\",\"description\":\"Frappuccino - Coffee\"},{\"item\":\"Hazelnut Frappuccino (Grande)\",\"price\":\"4.45\",\"description\":\"Frappuccino - Coffee\"},{\"item\":\"Hazelnut Frappuccino (Venti)\",\"price\":\"4.95\",\"description\":\"Frappuccino - Coffee\"},{\"item\":\"Caramel Flan Frappuccino (Tall)\",\"price\":\"4.25\",\"description\":\"Frappuccino - Coffee\"},{\"item\":\"Caramel Flan Frappuccino (Grande)\",\"price\":\"4.75\",\"description\":\"Frappuccino - Coffee\"},{\"item\":\"Caramel Flan Frappuccino (Venti)\",\"price\":\"5.25\",\"description\":\"Frappuccino - Coffee\"},{\"item\":\"Caramel Frappuccino (Tall)\",\"price\":\"3.75\",\"description\":\"Frappuccino - Coffee\"},{\"item\":\"Caramel Frappuccino (Grande)\",\"price\":\"4.45\",\"description\":\"Frappuccino - Coffee\"},{\"item\":\"Caramel Frappuccino (Venti)\",\"price\":\"4.95\",\"description\":\"Frappuccino - Coffee\"},{\"item\":\"Mocha Frappuccino (Tall)\",\"price\":\"3.75\",\"description\":\"Frappuccino - Coffee\"},{\"item\":\"Mocha Frappuccino (Grande)\",\"price\":\"4.45\",\"description\":\"Frappuccino - Coffee\"},{\"item\":\"Mocha Frappuccino (Venti)\",\"price\":\"4.95\",\"description\":\"Frappuccino - Coffee\"},{\"item\":\"Java Chip Frappuccino (Tall)\",\"price\":\"3.75\",\"description\":\"Frappuccino - Coffee\"},{\"item\":\"Java Chip Frappuccino (Grande)\",\"price\":\"4.45\",\"description\":\"Frappuccino - Coffee\"},{\"item\":\"Java Chip Frappuccino (Venti)\",\"price\":\"4.95\",\"description\":\"Frappuccino - Coffee\"},{\"item\":\"Coffee Frappuccino (Tall)\",\"price\":\"2.95\",\"description\":\"Frappuccino - Coffee\"},{\"item\":\"Coffee Frappuccino (Grande)\",\"price\":\"3.75\",\"description\":\"Frappuccino - Coffee\"},{\"item\":\"Coffee Frappuccino (Venti)\",\"price\":\"4.45\",\"description\":\"Frappuccino - Coffee\"},{\"item\":\"Vanilla Bean Frappuccino (Tall)\",\"price\":\"2.95\",\"description\":\"Frappuccino - Creme (Coffee-Free)\"},{\"item\":\"Vanilla Bean Frappuccino (Grande)\",\"price\":\"3.75\",\"description\":\"Frappuccino - Creme (Coffee-Free)\"},{\"item\":\"Vanilla Bean Frappuccino (Venti)\",\"price\":\"4.45\",\"description\":\"Frappuccino - Creme (Coffee-Free)\"},{\"item\":\"Strawberries & Creme Frappuccino (Tall)\",\"price\":\"3.75\",\"description\":\"Frappuccino - Creme (Coffee-Free)\"},{\"item\":\"Strawberries & Creme Frappuccino (Grande)\",\"price\":\"4.45\",\"description\":\"Frappuccino - Creme (Coffee-Free)\"},{\"item\":\"Strawberries & Creme Frappuccino (Venti)\",\"price\":\"4.95\",\"description\":\"Frappuccino - Creme (Coffee-Free)\"},{\"item\":\"Doubly Chocolatey Chip Frappuccino (Tall)\",\"price\":\"3.75\",\"description\":\"Frappuccino - Creme (Coffee-Free)\"},{\"item\":\"Doubly Chocolatey Chip Frappuccino (Grande)\",\"price\":\"4.45\",\"description\":\"Frappuccino - Creme (Coffee-Free)\"},{\"item\":\"Doubly Chocolatey Chip Frappuccino (Venti)\",\"price\":\"4.95\",\"description\":\"Frappuccino - Creme (Coffee-Free)\"},{\"item\":\"Green Tea Frappuccino (Tall)\",\"price\":\"3.75\",\"description\":\"Frappuccino - Creme (Coffee-Free)\"},{\"item\":\"Green Tea Frappuccino (Grande)\",\"price\":\"4.45\",\"description\":\"Frappuccino - Creme (Coffee-Free)\"},{\"item\":\"Green Tea Frappuccino (Venti)\",\"price\":\"4.95\",\"description\":\"Frappuccino - Creme (Coffee-Free)\"},{\"item\":\"Smoothie - Strawberry\",\"price\":\"4.25\",\"description\":\"Blended with a whole banana & whey Protien\"},{\"item\":\"Smoothie - Orange Mango\",\"price\":\"4.25\",\"description\":\"Blended with a whole banana & whey Protien\"}]}','Full Day');
/*!40000 ALTER TABLE `menus` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-04-25 12:55:50
