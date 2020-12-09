-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: myproject
-- ------------------------------------------------------
-- Server version	8.0.19

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
-- Table structure for table `bookingstatus`
--

DROP TABLE IF EXISTS `bookingstatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bookingstatus` (
  `cat` varchar(50) NOT NULL,
  `space_id` varchar(20) NOT NULL,
  `bookingstatus` varchar(45) NOT NULL DEFAULT 'Available',
  `Floor` varchar(15) NOT NULL,
  `from` date DEFAULT NULL,
  `to` date DEFAULT NULL,
  PRIMARY KEY (`space_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookingstatus`
--

LOCK TABLES `bookingstatus` WRITE;
/*!40000 ALTER TABLE `bookingstatus` DISABLE KEYS */;
INSERT INTO `bookingstatus` VALUES ('Party Hall','0001','Available','3rd Floor',NULL,NULL),('Party Hall','0002','Available','3rd Floor',NULL,NULL),('Party Hall','0003','Available','3rd Floor',NULL,NULL),('Atrium-South','001','Available','Ground Floor',NULL,NULL),('Atrium-North and West','006','Available','Ground Floor',NULL,NULL),('SHOP-Small','100','Available','1st Floor',NULL,NULL),('SHOP-Large','100068','Booked','1st Floor','2020-09-04','2020-10-21'),('SHOP-Small','101','Available','1st Floor',NULL,NULL),('SHOP-Small','105','Available','1st Floor',NULL,NULL),('SHOP-Medium','109','Available','1st Floor',NULL,NULL),('Cinema Theater','1101','Booked','4th Floor','2020-09-05','2020-09-20'),('Cinema Theater','1106','Booked','4th Floor','2020-09-06','2020-09-30'),('SHOP-Medium','112','Booked','1st Floor','2020-09-01','2020-10-01'),('SHOP-Medium','118','Available','1st Floor',NULL,NULL),('SHOP-Large','124','Booked','1st Floor','2020-09-05','2020-10-10'),('SHOP-Large','126','Available','1st Floor',NULL,NULL),('SHOP-Small','204','Available','2nd Floor',NULL,NULL),('SHOP-Small','206','Available','2nd Floor',NULL,NULL),('SHOP-Medium','210','Available','2nd Floor',NULL,NULL),('SHOP-Medium','212','Available','2nd Floor',NULL,NULL),('SHOP-Large','220','Available','2nd Floor',NULL,NULL),('Marketing Banners','22101','Available','Ground Floor',NULL,NULL),('Marketing Banners','22102','Available','Ground Floor',NULL,NULL),('Marketing Banners','22103','Available','Parking',NULL,NULL),('Marketing Banners','22104','Available','Mall Front',NULL,NULL),('SHOP-Large','222','Available','2nd Floor',NULL,NULL),('Swimming Pool','301','Available','Ground Floor',NULL,NULL),('Swimming Pool','305','Available','Ground Floor',NULL,NULL);
/*!40000 ALTER TABLE `bookingstatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login`
--

DROP TABLE IF EXISTS `login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `login` (
  `uname` varchar(50) NOT NULL,
  `pass` varchar(45) NOT NULL,
  PRIMARY KEY (`uname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login`
--

LOCK TABLES `login` WRITE;
/*!40000 ALTER TABLE `login` DISABLE KEYS */;
INSERT INTO `login` VALUES ('abhi','1234'),('adi','7894'),('jeet','1234'),('lucifer','1234');
/*!40000 ALTER TABLE `login` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payments` (
  `uname` varchar(45) NOT NULL,
  `space_id` varchar(20) NOT NULL,
  `payment` int NOT NULL,
  PRIMARY KEY (`space_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payments`
--

LOCK TABLES `payments` WRITE;
/*!40000 ALTER TABLE `payments` DISABLE KEYS */;
INSERT INTO `payments` VALUES ('abhi','100068',470000),('abhi','1101',300000),('abhi','1106',400000),('abhi','112',90000),('abhi','124',350000);
/*!40000 ALTER TABLE `payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `space`
--

DROP TABLE IF EXISTS `space`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `space` (
  `space_type` varchar(45) NOT NULL,
  `Area` varchar(45) NOT NULL,
  `duration` varchar(45) NOT NULL,
  `rent_type` varchar(45) NOT NULL,
  `cost` int NOT NULL,
  PRIMARY KEY (`space_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `space`
--

LOCK TABLES `space` WRITE;
/*!40000 ALTER TABLE `space` DISABLE KEYS */;
INSERT INTO `space` VALUES ('Atrium- North and West','3000 sqft','All Days','Day Wise',5000),('Atrium-South','2850 sqft','All Days','Day Wise',4500),('Cinema Theater','15000 sqft','All Days','Weekly Wise',100000),('Marketing Banners','100 sqft','All Days','Weekly Wise',2500),('Party Hall','7000 sqft','All Days','Day Wise',15000),('SHOP-Large','1050 sqft','All Days','Day Wise',10000),('SHOP-Medium','700 sqft','All Days','Day Wise',3000),('SHOP-Small','450 sqft','All Days','Day Wise',1000),('Swimming Pool','1000 sqft','All Days','Day Wise',10000);
/*!40000 ALTER TABLE `space` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userdetails`
--

DROP TABLE IF EXISTS `userdetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userdetails` (
  `uname` varchar(40) NOT NULL,
  `name` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `tel` varchar(45) NOT NULL,
  `adress` varchar(100) NOT NULL,
  `prof` varchar(45) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `dob` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`uname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userdetails`
--

LOCK TABLES `userdetails` WRITE;
/*!40000 ALTER TABLE `userdetails` DISABLE KEYS */;
INSERT INTO `userdetails` VALUES ('abhi','Abhishek @Rathore','abhi121rathore@gmail.com','8448678660','Cantt Area Jhansi UP','Student','male','07/28/1974'),('adi','Adarsh','adi123@gmail.com','7618825259','Main Road BHEL Jhansi','Teacher','male','01/15/1969'),('jeet','Jeetu','jeet@gmail.com','9414601554','Sadar Bazar Jhansi UP','Business Man','male','12/01/1990');
/*!40000 ALTER TABLE `userdetails` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-12-08 13:44:09
