-- MySQL dump 10.13  Distrib 8.0.21, for Win64 (x86_64)
--
-- Host: localhost    Database: ecommerce
-- ------------------------------------------------------
-- Server version	8.0.21

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
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `category_id` int NOT NULL,
  `category_name` varchar(450) NOT NULL,
  `creation_date_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `category_sequence` int NOT NULL,
  PRIMARY KEY (`category_id`),
  UNIQUE KEY `category_name_UNIQUE` (`category_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1001,'Electronics','2020-09-22 00:19:37',1),(1002,'Men\'s Fashion','2020-09-22 00:22:37',2),(1003,'Women\'s Fashion','2020-09-22 00:22:37',3),(1004,'Arts and Supplies','2020-09-22 00:22:37',4),(1005,'Pets and Supplies','2020-10-04 10:09:39',5),(1006,'Home Decor','2020-10-04 10:10:00',6),(1007,'Baby and Toddler','2020-10-04 10:10:29',7);
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_laptop`
--

DROP TABLE IF EXISTS `product_laptop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_laptop` (
  `id` int NOT NULL AUTO_INCREMENT,
  `brandid` int NOT NULL,
  `brandname` varchar(45) NOT NULL,
  `model` varchar(50) NOT NULL,
  `description` varchar(500) DEFAULT NULL,
  `price` int NOT NULL,
  `review` varchar(500) DEFAULT NULL,
  `sequence` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `brand_fk_idx` (`brandid`),
  CONSTRAINT `brand_fk_redmi` FOREIGN KEY (`brandid`) REFERENCES `sub_categories` (`sub_category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4003 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_laptop`
--

LOCK TABLES `product_laptop` WRITE;
/*!40000 ALTER TABLE `product_laptop` DISABLE KEYS */;
INSERT INTO `product_laptop` VALUES (4002,2003,'Hp','XPS 13','16GB Ram, Intel i7 10th Generation',50000,'Best Laptop in indian market, Should buy',1);
/*!40000 ALTER TABLE `product_laptop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_mobile`
--

DROP TABLE IF EXISTS `product_mobile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_mobile` (
  `id` int NOT NULL AUTO_INCREMENT,
  `brandid` int NOT NULL,
  `brandname` varchar(45) NOT NULL,
  `model` varchar(45) NOT NULL,
  `description` varchar(500) DEFAULT NULL,
  `price` int NOT NULL,
  `review` varchar(500) DEFAULT NULL,
  `sequence` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `brand_fk_idx` (`brandid`),
  CONSTRAINT `brand_fk` FOREIGN KEY (`brandid`) REFERENCES `sub_categories` (`sub_category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4004 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_mobile`
--

LOCK TABLES `product_mobile` WRITE;
/*!40000 ALTER TABLE `product_mobile` DISABLE KEYS */;
INSERT INTO `product_mobile` VALUES (3001,2001,'oneplus','oneplus5T','Snapdragon 835, dual camera,dash charge,amoled display',33,'Good smartphone, Best buy',1),(4002,2001,'oneplus','oneplus6','Snapdragon 845,\n Dual camera,fast charge,Amoled display',38,'Best smartphone in the market, must buy',2),(4003,2001,'redmi','redmi note 9','Snapdragon 845,\n Dual camera,fast charge,Amoled display',38,'Best smartphone in the market, must buy',3);
/*!40000 ALTER TABLE `product_mobile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sub_categories`
--

DROP TABLE IF EXISTS `sub_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sub_categories` (
  `sub_category_id` int NOT NULL AUTO_INCREMENT,
  `category_id` int NOT NULL,
  `creation_date_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `sub_category_name` varchar(45) NOT NULL,
  `sub_category_sequence` int NOT NULL,
  PRIMARY KEY (`sub_category_id`),
  KEY `category_fk_idx` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2017 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sub_categories`
--

LOCK TABLES `sub_categories` WRITE;
/*!40000 ALTER TABLE `sub_categories` DISABLE KEYS */;
INSERT INTO `sub_categories` VALUES (2001,1001,'2020-09-22 00:22:19','Mobile',1),(2002,1001,'2020-09-22 00:22:40','Laptop',2),(2003,1001,'2020-09-22 00:22:40','Fridge',3),(2004,1001,'2020-10-04 10:13:21','Washing Machine',4),(2005,1001,'2020-10-04 10:15:08','TV',5),(2006,1001,'2020-10-04 10:15:08','Camera',6),(2007,1001,'2020-10-04 10:15:08','Accessories',7),(2008,1001,'2020-10-04 10:15:08','Vaccum Cleaner',8),(2009,1002,'2020-10-04 10:18:06','Shirts',9),(2010,1002,'2020-10-04 10:18:06','Trousers',10),(2011,1002,'2020-10-04 10:18:06','T-shirts',11),(2012,1002,'2020-10-04 10:18:06','Suits',12),(2013,1002,'2020-10-04 10:18:06','Joggers',13),(2014,1002,'2020-10-04 10:18:06','Shoes',14);
/*!40000 ALTER TABLE `sub_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userdetail`
--

DROP TABLE IF EXISTS `userdetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userdetail` (
  `id` int NOT NULL AUTO_INCREMENT,
  `firstname` varchar(45) NOT NULL,
  `lastname` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `createddate` datetime DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userdetail`
--

LOCK TABLES `userdetail` WRITE;
/*!40000 ALTER TABLE `userdetail` DISABLE KEYS */;
INSERT INTO `userdetail` VALUES (1,'tanay','makin','tanay@gmail.com','Tanay123','2020-09-09 18:30:37','2020-09-09 18:30:37'),(2,'tanuj','makin','tanuj@gmail.com','Tanuj123','2020-09-17 16:25:12','2020-09-17 16:25:12'),(3,'sarang','sapre','sarang@gmail.com','Sarang123','2020-09-13 16:15:15','2020-09-13 16:15:15'),(4,'mayank','verma','mayank@gmail.com','Mayank123','2020-09-07 16:15:19','2020-09-07 16:15:19'),(5,'ankit','solanki','ankit@gmail.com','Ankit123','2020-09-12 12:20:28','2020-09-12 12:20:28'),(6,'anuj','anaj','anuj@gmail.com','tatata','2020-09-12 13:04:30','2020-09-12 13:04:30');
/*!40000 ALTER TABLE `userdetail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'ecommerce'
--
/*!50003 DROP PROCEDURE IF EXISTS `SignUpProc` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SignUpProc`(In in_firstname varchar(255),IN in_lastname varchar(255),In in_email varchar(255), In in_pass varchar(255))
BEGIN
If((Select count(*) from userdetail where in_email = email)>0)
then
select 'User already exist';
else
Insert into userdetail(id,firstname,lastname,email,password,createdDate,modifieddate) values(default,in_firstname,in_lastname,in_email,in_pass,utc_timestamp(),utc_timestamp());
End if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_showdetails_procedure` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_showdetails_procedure`(In in_category varchar(255),In in_brandname varchar(255),In in_model varchar(255))
BEGIN
IF(in_category = 'mobile') then
Select  brandname,model,description,price,review 
from ecommerce.product_mobile where model = in_model and brandname =in_brandname order by sequence asc;
End if;
IF(in_category = 'laptop') then
Select  brandname,model,description,price,review 
from ecommerce.product_laptop where model = in_model and brandname =in_brandname order by sequence asc;
End if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_show_category` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_show_category`()
BEGIN

SELECT * from ecommerce.categories order by category_sequence asc;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_show_subcategory` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_show_subcategory`(In in_category_id int)
BEGIN
select * from ecommerce.sub_categories where category_id = in_category_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_validate_user` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_validate_user`(IN in_username VARCHAR(255),IN in_pass VARCHAR(255))
BEGIN
IF ((select COUNT(*) FROM ecommerce.userdetail WHERE email = in_username and `password` = in_pass) !=0)THEN
  SELECT 'Login Successful' as msg,1 as `status`,firstname as `firstname` from ecommerce.userdetail where email = in_username and `password` = in_pass ;
  ELSE
 SELECT 'Invalid username Or Password' as msg, 0 as `status`;
 End IF ;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ValidationProc` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ValidationProc`(In in_email varchar(255), IN in_password varchar(255))
BEGIN
If((in_email IN(select email from userdetail) AND in_password =(select binary password from userdetail where email = in_email)))
then
Select 'Successful';
Else
Select 'Failure';
End If;
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

-- Dump completed on 2020-10-11  9:23:50
