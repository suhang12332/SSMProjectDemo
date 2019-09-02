-- MySQL dump 10.13  Distrib 8.0.17, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: ssm
-- ------------------------------------------------------
-- Server version	8.0.17

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `log`
--

DROP TABLE IF EXISTS `log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `log` (
  `logId` int(11) NOT NULL AUTO_INCREMENT,
  `visitTime` timestamp NULL DEFAULT NULL,
  `userName` varchar(30) DEFAULT NULL,
  `ip` varchar(30) DEFAULT NULL,
  `url` varchar(30) DEFAULT NULL,
  `executionTime` int(11) DEFAULT NULL,
  `method` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`logId`),
  KEY `log_user_userName_fk` (`userName`),
  CONSTRAINT `log_user_userName_fk` FOREIGN KEY (`userName`) REFERENCES `user` (`userName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log`
--

LOCK TABLES `log` WRITE;
/*!40000 ALTER TABLE `log` DISABLE KEYS */;
/*!40000 ALTER TABLE `log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `memberid`
--

DROP TABLE IF EXISTS `memberid`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `memberid` (
  `memberidId` int(11) NOT NULL AUTO_INCREMENT,
  `memberidName` varchar(20) DEFAULT NULL,
  `nickName` varchar(20) DEFAULT NULL,
  `phoneNum` varchar(20) DEFAULT NULL,
  `email` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`memberidId`),
  UNIQUE KEY `memberid_nickName_uindex` (`nickName`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `memberid`
--

LOCK TABLES `memberid` WRITE;
/*!40000 ALTER TABLE `memberid` DISABLE KEYS */;
INSERT INTO `memberid` (`memberidId`, `memberidName`, `nickName`, `phoneNum`, `email`) VALUES (1,'张伟','飞翔的鱼','17795839287','1552899301@qq.com'),(2,'李明','草编的戒指','17795839277','1552899302@qq.com'),(3,'李强','奔跑的蜗牛','17795839286','1552899303@qq.com'),(5,'张敏','沧海为水','17795839285','1552899304@qq.com'),(6,'李伟','雄霸天下','17795839284','1552899305@qq.com');
/*!40000 ALTER TABLE `memberid` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `orderId` int(11) NOT NULL AUTO_INCREMENT,
  `orderTime` timestamp NULL DEFAULT NULL,
  `peopleCount` int(11) DEFAULT NULL,
  `orderDesc` varchar(500) DEFAULT NULL,
  `payType` int(11) DEFAULT NULL,
  `orderStatus` int(11) DEFAULT NULL,
  `productId` int(11) DEFAULT NULL,
  `memberidId` int(11) DEFAULT NULL,
  PRIMARY KEY (`orderId`),
  KEY `productId` (`productId`),
  KEY `memberidId` (`memberidId`),
  CONSTRAINT `memberidId` FOREIGN KEY (`memberidId`) REFERENCES `memberid` (`memberidId`),
  CONSTRAINT `productId` FOREIGN KEY (`productId`) REFERENCES `product` (`productId`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` (`orderId`, `orderTime`, `peopleCount`, `orderDesc`, `payType`, `orderStatus`, `productId`, `memberidId`) VALUES (49,'2019-08-25 02:57:17',20,'博物馆',0,0,130,1),(50,'2019-08-25 20:21:25',20,'大雁塔一日游',1,1,135,1);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders_tourist`
--

DROP TABLE IF EXISTS `orders_tourist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders_tourist` (
  `orderTouristId` int(11) NOT NULL AUTO_INCREMENT,
  `orderId` int(11) DEFAULT NULL,
  `touristId` int(11) DEFAULT NULL,
  PRIMARY KEY (`orderTouristId`),
  KEY `orderId` (`orderId`),
  KEY `touristId` (`touristId`),
  CONSTRAINT `orderId` FOREIGN KEY (`orderId`) REFERENCES `orders` (`orderId`),
  CONSTRAINT `touristId` FOREIGN KEY (`touristId`) REFERENCES `tourist` (`passengerId`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders_tourist`
--

LOCK TABLES `orders_tourist` WRITE;
/*!40000 ALTER TABLE `orders_tourist` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders_tourist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permissions` (
  `permissionsId` int(11) NOT NULL AUTO_INCREMENT,
  `permissionsName` varchar(30) DEFAULT NULL,
  `url` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`permissionsId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissions`
--

LOCK TABLES `permissions` WRITE;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `productId` int(11) NOT NULL AUTO_INCREMENT,
  `productName` varchar(50) DEFAULT NULL,
  `cityName` varchar(50) DEFAULT NULL,
  `departureTime` timestamp NULL DEFAULT NULL,
  `productPrice` double DEFAULT NULL,
  `productDesc` varchar(500) DEFAULT NULL,
  `productStatus` int(11) DEFAULT NULL,
  PRIMARY KEY (`productId`)
) ENGINE=InnoDB AUTO_INCREMENT=136 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` (`productId`, `productName`, `cityName`, `departureTime`, `productPrice`, `productDesc`, `productStatus`) VALUES (130,'陕西历史博物馆一日游','深圳','2019-08-21 19:31:21',1200,'陕西历史博物馆一日游',0),(135,'大雁塔一日游','深圳','2019-08-25 20:20:45',3600,'大雁塔',1);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role` (
  `roleId` int(11) NOT NULL AUTO_INCREMENT,
  `roleName` varchar(30) DEFAULT NULL,
  `roleDesc` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`roleId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` (`roleId`, `roleName`, `roleDesc`) VALUES (1,'管理员','管理系统'),(2,'普通用户','查看系统状态');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tourist`
--

DROP TABLE IF EXISTS `tourist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tourist` (
  `passengerId` int(11) NOT NULL AUTO_INCREMENT,
  `passengerName` varchar(30) DEFAULT NULL,
  `passengerSex` varchar(20) DEFAULT NULL,
  `passengerPhoneNumber` varchar(30) DEFAULT NULL,
  `credentialsType` int(11) DEFAULT NULL,
  `credentialsNum` varchar(50) DEFAULT NULL,
  `passengerType` int(11) DEFAULT NULL,
  PRIMARY KEY (`passengerId`),
  UNIQUE KEY `passenger_credentialsNum_uindex` (`credentialsNum`),
  UNIQUE KEY `tourist_passengerPhoneNumber_uindex` (`passengerPhoneNumber`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tourist`
--

LOCK TABLES `tourist` WRITE;
/*!40000 ALTER TABLE `tourist` DISABLE KEYS */;
INSERT INTO `tourist` (`passengerId`, `passengerName`, `passengerSex`, `passengerPhoneNumber`, `credentialsType`, `credentialsNum`, `passengerType`) VALUES (35,'黄忠','男','12345678908',0,'12345678908',0),(36,'王昭君','女','12345678909',2,'12345678909',0),(37,'赵云','男','12345678910',1,'12345678910',1),(39,'貂蝉','女','12345678901',1,'12345678901',0),(40,'张飞','男','12345678902',2,'12345678902',0),(41,'大乔','女','12345678904',0,'12345678904',0),(42,'马超','男','12345678905',2,'12345678905',0),(43,'秦始皇','男','12345678906',1,'12345678906',0),(44,'杨玉环','女','12345678907',0,'12345678907',0),(47,'小乔','女','12345678903',0,'12345678903',0),(48,'琳七奶奶','女','123456789010',0,'123456789010',1);
/*!40000 ALTER TABLE `tourist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `userId` int(11) NOT NULL AUTO_INCREMENT,
  `userEmail` varchar(30) DEFAULT NULL,
  `userName` varchar(30) DEFAULT NULL,
  `userPassword` varchar(30) DEFAULT NULL,
  `phoneNum` varchar(30) DEFAULT NULL,
  `userStatus` int(11) DEFAULT NULL,
  PRIMARY KEY (`userId`),
  UNIQUE KEY `user_userName_uindex` (`userName`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`userId`, `userEmail`, `userName`, `userPassword`, `phoneNum`, `userStatus`) VALUES (1,'1552899301@qq.com','苏航','123456789','12345678901',0),(2,'123456789@qq.com','琳七','123456','123456',0),(3,'123@qq.com','王旭1','12312','1234567890',0);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_role`
--

DROP TABLE IF EXISTS `user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_role` (
  `userRoleId` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) DEFAULT NULL,
  `roleId` int(11) DEFAULT NULL,
  PRIMARY KEY (`userRoleId`),
  KEY `roleId` (`roleId`),
  KEY `userId` (`userId`),
  CONSTRAINT `roleId` FOREIGN KEY (`roleId`) REFERENCES `role` (`roleId`),
  CONSTRAINT `userId` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_role`
--

LOCK TABLES `user_role` WRITE;
/*!40000 ALTER TABLE `user_role` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_role` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-09-02 10:24:28
