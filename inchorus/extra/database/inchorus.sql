-- MySQL dump 10.13  Distrib 5.7.17, for Linux (x86_64)
--
-- Host: localhost    Database: inchorus
-- ------------------------------------------------------
-- Server version	5.7.17

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
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `CategoryName` varchar(30) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event`
--

DROP TABLE IF EXISTS `event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `Title` varchar(30) DEFAULT NULL,
  `Location` varchar(30) DEFAULT NULL,
  `Content` varchar(30) DEFAULT NULL,
  `CreationDate` date DEFAULT NULL,
  `StatusID` int(10) DEFAULT NULL,
  `EventDate` datetime NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `StatusID` (`StatusID`),
  CONSTRAINT `event_ibfk_1` FOREIGN KEY (`StatusID`) REFERENCES `event_status` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event`
--

LOCK TABLES `event` WRITE;
/*!40000 ALTER TABLE `event` DISABLE KEYS */;
INSERT INTO `event` VALUES (1,'Inchorus Event','Shiekh Zayed','New Event Celebration',NULL,NULL,'2017-08-06 01:51:43');
/*!40000 ALTER TABLE `event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event_category`
--

DROP TABLE IF EXISTS `event_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event_category` (
  `EventID` int(10) NOT NULL,
  `CategoryID` int(10) NOT NULL,
  PRIMARY KEY (`EventID`,`CategoryID`),
  KEY `CategoryID` (`CategoryID`),
  CONSTRAINT `event_category_ibfk_1` FOREIGN KEY (`EventID`) REFERENCES `event` (`ID`),
  CONSTRAINT `event_category_ibfk_2` FOREIGN KEY (`CategoryID`) REFERENCES `category` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_category`
--

LOCK TABLES `event_category` WRITE;
/*!40000 ALTER TABLE `event_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `event_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event_role`
--

DROP TABLE IF EXISTS `event_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event_role` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `Role` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_role`
--

LOCK TABLES `event_role` WRITE;
/*!40000 ALTER TABLE `event_role` DISABLE KEYS */;
/*!40000 ALTER TABLE `event_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event_status`
--

DROP TABLE IF EXISTS `event_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event_status` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `Status` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_status`
--

LOCK TABLES `event_status` WRITE;
/*!40000 ALTER TABLE `event_status` DISABLE KEYS */;
/*!40000 ALTER TABLE `event_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event_user`
--

DROP TABLE IF EXISTS `event_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event_user` (
  `UserID` int(10) NOT NULL,
  `EventID` int(10) NOT NULL,
  `RoleID` int(10) DEFAULT NULL,
  PRIMARY KEY (`UserID`,`EventID`),
  KEY `EventID` (`EventID`),
  KEY `RoleID` (`RoleID`),
  CONSTRAINT `event_user_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `event` (`ID`),
  CONSTRAINT `event_user_ibfk_2` FOREIGN KEY (`EventID`) REFERENCES `event` (`ID`),
  CONSTRAINT `event_user_ibfk_3` FOREIGN KEY (`RoleID`) REFERENCES `event_role` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_user`
--

LOCK TABLES `event_user` WRITE;
/*!40000 ALTER TABLE `event_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `event_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project`
--

DROP TABLE IF EXISTS `project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `title` varchar(30) NOT NULL,
  `content` varchar(4096) NOT NULL,
  `Creation_Time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Start_Date` date DEFAULT NULL,
  `End_Date` date DEFAULT NULL,
  `StatusID` int(10) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `StatusID` (`StatusID`),
  CONSTRAINT `project_ibfk_1` FOREIGN KEY (`StatusID`) REFERENCES `project_status` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project`
--

LOCK TABLES `project` WRITE;
/*!40000 ALTER TABLE `project` DISABLE KEYS */;
/*!40000 ALTER TABLE `project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_category`
--

DROP TABLE IF EXISTS `project_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project_category` (
  `ProjectID` int(10) NOT NULL,
  `CategoryID` int(10) NOT NULL,
  PRIMARY KEY (`ProjectID`,`CategoryID`),
  KEY `CategoryID` (`CategoryID`),
  CONSTRAINT `project_category_ibfk_1` FOREIGN KEY (`ProjectID`) REFERENCES `project` (`ID`),
  CONSTRAINT `project_category_ibfk_2` FOREIGN KEY (`CategoryID`) REFERENCES `category` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_category`
--

LOCK TABLES `project_category` WRITE;
/*!40000 ALTER TABLE `project_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `project_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_event`
--

DROP TABLE IF EXISTS `project_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project_event` (
  `EventID` int(10) NOT NULL,
  `ProjectID` int(10) NOT NULL,
  PRIMARY KEY (`EventID`,`ProjectID`),
  KEY `ProjectID` (`ProjectID`),
  CONSTRAINT `project_event_ibfk_1` FOREIGN KEY (`EventID`) REFERENCES `event` (`ID`),
  CONSTRAINT `project_event_ibfk_2` FOREIGN KEY (`ProjectID`) REFERENCES `project` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_event`
--

LOCK TABLES `project_event` WRITE;
/*!40000 ALTER TABLE `project_event` DISABLE KEYS */;
/*!40000 ALTER TABLE `project_event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_role`
--

DROP TABLE IF EXISTS `project_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project_role` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `Role` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_role`
--

LOCK TABLES `project_role` WRITE;
/*!40000 ALTER TABLE `project_role` DISABLE KEYS */;
/*!40000 ALTER TABLE `project_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_status`
--

DROP TABLE IF EXISTS `project_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project_status` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `Status` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_status`
--

LOCK TABLES `project_status` WRITE;
/*!40000 ALTER TABLE `project_status` DISABLE KEYS */;
/*!40000 ALTER TABLE `project_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_user`
--

DROP TABLE IF EXISTS `project_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project_user` (
  `UserID` int(10) NOT NULL,
  `ProjectID` int(10) NOT NULL,
  `RoleID` int(10) DEFAULT NULL,
  PRIMARY KEY (`UserID`,`ProjectID`),
  KEY `ProjectID` (`ProjectID`),
  KEY `RoleID` (`RoleID`),
  CONSTRAINT `project_user_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `event` (`ID`),
  CONSTRAINT `project_user_ibfk_2` FOREIGN KEY (`ProjectID`) REFERENCES `project` (`ID`),
  CONSTRAINT `project_user_ibfk_3` FOREIGN KEY (`RoleID`) REFERENCES `project_role` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_user`
--

LOCK TABLES `project_user` WRITE;
/*!40000 ALTER TABLE `project_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `project_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `UserName` varchar(3) NOT NULL,
  `Address` varchar(30) DEFAULT NULL,
  `Gender` varchar(30) DEFAULT NULL,
  `DateOfBirth` date DEFAULT NULL,
  `UserStatus` varchar(30) DEFAULT NULL,
  `UserPorfile` varchar(50) DEFAULT NULL,
  `Email` varchar(30) DEFAULT NULL,
  `CreationDate` date DEFAULT NULL,
  `Photo` longblob,
  `Password` varchar(30) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-08-07 23:11:16
