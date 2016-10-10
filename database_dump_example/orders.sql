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
