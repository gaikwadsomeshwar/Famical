-- MySQL dump 10.13  Distrib 8.0.23, for osx10.16 (x86_64)
--
-- Host: localhost    Database: famical
-- ------------------------------------------------------
-- Server version	8.0.21

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
-- Table structure for table `consults`
--

DROP TABLE IF EXISTS `consults`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `consults` (
  `pid` varchar(25) NOT NULL,
  `docid` varchar(10) NOT NULL,
  `cdate` date NOT NULL,
  `prescriptions` varchar(100) DEFAULT NULL,
  `medtests` varchar(100) DEFAULT NULL,
  `diagnosis` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`docid`,`pid`,`cdate`),
  KEY `pid` (`pid`),
  CONSTRAINT `consults_ibfk_1` FOREIGN KEY (`pid`) REFERENCES `users` (`userid`),
  CONSTRAINT `consults_ibfk_2` FOREIGN KEY (`docid`) REFERENCES `doctor` (`docid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `consults`
--

LOCK TABLES `consults` WRITE;
/*!40000 ALTER TABLE `consults` DISABLE KEYS */;
INSERT INTO `consults` VALUES ('33255','23257','2021-05-10','Calpol','High Temperature','False Covid Alarm');
/*!40000 ALTER TABLE `consults` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctor`
--

DROP TABLE IF EXISTS `doctor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doctor` (
  `userid` varchar(25) NOT NULL,
  `docid` varchar(10) NOT NULL,
  `qualification` varchar(100) NOT NULL,
  `hospital` varchar(50) DEFAULT NULL,
  `department` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`docid`),
  KEY `userid` (`userid`),
  CONSTRAINT `doctor_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctor`
--

LOCK TABLES `doctor` WRITE;
/*!40000 ALTER TABLE `doctor` DISABLE KEYS */;
INSERT INTO `doctor` VALUES ('33255','23256','MBBS, MD, Mphil','Sahyadri Hospital, Yerwada','ORTHOPAEDICS'),('33256','23257','MBBS','INLAKS & BUDHRANI HOSPITAL, KOREGAON PARK','GENERAL MEDICINE'),('33257','23258','MMBS, MD','CITY HOSPITAL','CARDIOLOGY'),('33264','23265','MBBS','OLD CITY HOSPITAL','PAEDIATRICS');
/*!40000 ALTER TABLE `doctor` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `uppercase2` BEFORE INSERT ON `doctor` FOR EACH ROW BEGIN
  SET NEW.userid = UPPER(NEW.userid);
  SET NEW.docid = UPPER(NEW.docid);
  SET NEW.qualification = UPPER(NEW.qualification);
  SET NEW.hospital = UPPER(NEW.hospital);
  SET NEW.department = UPPER(NEW.department);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `before_update_doctor` BEFORE UPDATE ON `doctor` FOR EACH ROW BEGIN

    IF new.qualification = '' THEN
        SET new.qualification = upper(old.qualification);
    ELSE
        SET new.qualification = upper(concat(old.qualification,", ",new.qualification));
    END IF;

    IF new.hospital = '' THEN
        SET new.hospital = upper(old.hospital);
    ELSE
        SET new.hospital = upper(new.hospital);
    END IF;

    IF new.department = '' THEN
        SET new.department = upper(old.department);
    ELSE
        SET new.department = upper(new.department);
    END IF;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `family`
--

DROP TABLE IF EXISTS `family`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `family` (
  `userid` varchar(25) NOT NULL,
  `memberid` varchar(25) NOT NULL,
  `type` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`userid`,`memberid`),
  KEY `memberid` (`memberid`),
  CONSTRAINT `family_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`),
  CONSTRAINT `family_ibfk_2` FOREIGN KEY (`memberid`) REFERENCES `users` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `family`
--

LOCK TABLES `family` WRITE;
/*!40000 ALTER TABLE `family` DISABLE KEYS */;
INSERT INTO `family` VALUES ('33256','614000','father'),('614000','33256','child');
/*!40000 ALTER TABLE `family` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patient`
--

DROP TABLE IF EXISTS `patient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patient` (
  `userid` varchar(25) NOT NULL,
  `weight` int DEFAULT NULL,
  `height` int DEFAULT NULL,
  `bldgrp` varchar(5) DEFAULT NULL,
  `allergies` varchar(100) DEFAULT NULL,
  `bp` double DEFAULT NULL,
  PRIMARY KEY (`userid`),
  CONSTRAINT `patient_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient`
--

LOCK TABLES `patient` WRITE;
/*!40000 ALTER TABLE `patient` DISABLE KEYS */;
INSERT INTO `patient` VALUES ('33255',NULL,NULL,'B+',NULL,NULL),('33256',83,176,'O+','None',180),('33257',NULL,NULL,'O+',NULL,NULL),('33264',NULL,NULL,'B+',NULL,NULL),('614000',NULL,NULL,'O+',NULL,NULL);
/*!40000 ALTER TABLE `patient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_details`
--

DROP TABLE IF EXISTS `personal_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal_details` (
  `userid` varchar(25) NOT NULL,
  `fname` varchar(30) NOT NULL,
  `lname` varchar(30) NOT NULL,
  `phno` bigint NOT NULL,
  `email` varchar(50) NOT NULL,
  `dob` datetime DEFAULT NULL,
  `stno` varchar(10) DEFAULT NULL,
  `stname` varchar(20) DEFAULT NULL,
  `city` varchar(30) DEFAULT NULL,
  `state` varchar(50) DEFAULT NULL,
  `zipcode` int NOT NULL,
  `gender` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`userid`),
  UNIQUE KEY `phno` (`phno`),
  UNIQUE KEY `email` (`email`),
  CONSTRAINT `personal_details_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_details`
--

LOCK TABLES `personal_details` WRITE;
/*!40000 ALTER TABLE `personal_details` DISABLE KEYS */;
INSERT INTO `personal_details` VALUES ('33255','SHREYAS','KALRAO',9511268012,'SHREYASKALRAO2001@GMAIL.COM','2001-01-16 00:00:00','23','SAHKARNAGAR','PUNE','MAHARASHTRA',411009,'MALE'),('33256','SOMESHWAR','GAIKWAD',7775069747,'GAIKWADSOMESHWAR6@GMAIL.COM','1999-12-15 00:00:00','94/A/3/1','MUNDHWA','PUNE','MAHARASHTRA',411036,'MALE'),('33257','SUSHANT','SONTAKKE',7057019322,'SMSONTAKKE111@GMAIL.COM','2000-05-16 00:00:00','10','RICH STREET','ICHALKARANJI','MAHARASHTRA',416515,'MALE'),('33264','YASH','RATHI',7385305000,'YASHRATHI878@GMAIL.COM','2000-06-12 00:00:00','43','POOR STREET','SANGLI','MAHARASHTRA',416406,'MALE'),('614000','KIRAN','GAIKWAD',9158614000,'KIRANGAIKWAD@GMAI.COM','1973-01-11 00:00:00','94/A/3/1','MUNDHWA','PUNE','MAHARASHTRA',411036,'MALE');
/*!40000 ALTER TABLE `personal_details` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `uppercase4` BEFORE INSERT ON `personal_details` FOR EACH ROW BEGIN
  SET NEW.userid = UPPER(NEW.userid);
  SET NEW.fname = UPPER(NEW.fname);
  SET NEW.lname = UPPER(NEW.lname);
  SET NEW.email = UPPER(NEW.email);
  SET NEW.stname = UPPER(NEW.stname);
  SET NEW.city = UPPER(NEW.city);
  SET NEW.state = UPPER(NEW.state);
  SET NEW.gender = UPPER(NEW.gender);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `before_update1` BEFORE UPDATE ON `personal_details` FOR EACH ROW BEGIN
                        
    IF new.email = '' THEN
        SET new.email = upper(old.email);
    ELSE
        SET new.email = upper(new.email);
    END IF;
    
    IF new.phno = 0 THEN 
		SET new.phno = old.phno;
	END IF;
    
	IF new.stname = '' THEN
		SET new.stname = upper(old.stname);
    ELSE
        SET new.stname = upper(new.stname);
    END IF;
    
    IF new.stno = 0 THEN 
		SET new.stno = old.stno;
	END IF;    
    
	IF new.city = '' THEN
		SET new.city = upper(old.city);
    ELSE
        SET new.city = upper(new.city);
    END IF;
    
	IF new.state = '' THEN
		SET new.state = upper(old.state);
    ELSE
        SET new.state = upper(new.state);
    END IF;    
    
    IF new.zipcode = 0 THEN 
		SET new.zipcode = old.zipcode;
	END IF; 

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `userid` varchar(25) NOT NULL,
  `password` varchar(65) DEFAULT NULL,
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('33255','$2a$08$Pna9lhKeUCY7rr4QGWpEb.8XMO4CZXAWmjjmeBQFLdibTQJagZo9S'),('33256','$2a$08$sbnZ8ZfSElSE9ft/hoPKwOafOPOPxJN//QBYZRCTwVZHXP7NpRPl6'),('33257','$2a$08$cP2CprfK7uGvYDNp2QcVQeWIJxsXNQgqugxdLAqIduC9HRar7FoAC'),('33264','$2a$08$uaGZLaYn3Yn.J3.L8kbACugkAFvpTBp0Q4rDQHwbo6.LhC.8kXoJq'),('614000','$2a$08$6KGCdlVJHwIafwqwzjdS3uovtZ2VfqVbZnjsuZnuTy2oSz29FryS6');
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

-- Dump completed on 2021-05-02 13:25:16
