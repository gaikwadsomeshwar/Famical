-- MySQL dump 10.13  Distrib 8.0.21, for macos10.15 (x86_64)
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
  CONSTRAINT `consults_ibfk_1` FOREIGN KEY (`pid`) REFERENCES `patient` (`userid`),
  CONSTRAINT `consults_ibfk_2` FOREIGN KEY (`docid`) REFERENCES `doctor` (`docid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `consults`
--

LOCK TABLES `consults` WRITE;
/*!40000 ALTER TABLE `consults` DISABLE KEYS */;
INSERT INTO `consults` VALUES ('614000','23257','2020-12-09','','',''),('615000','23257','2020-12-09','ORS','','Dehydration');
/*!40000 ALTER TABLE `consults` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `uppercase1` BEFORE INSERT ON `consults` FOR EACH ROW BEGIN
  SET NEW.pid = UPPER(NEW.pid);
  SET NEW.docid = UPPER(NEW.docid);
  SET NEW.prescriptions = UPPER(NEW.prescriptions);
  SET NEW.medtests = UPPER(NEW.medtests);
  SET NEW.diagnosis = UPPER(NEW.diagnosis);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

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
INSERT INTO `doctor` VALUES ('33256','23257','MBBS, MD','SAHYADRI ','ORTHOPAEDIC');
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
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
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
  CONSTRAINT `family_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `patient` (`userid`),
  CONSTRAINT `family_ibfk_2` FOREIGN KEY (`memberid`) REFERENCES `patient` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `family`
--

LOCK TABLES `family` WRITE;
/*!40000 ALTER TABLE `family` DISABLE KEYS */;
INSERT INTO `family` VALUES ('33256','614000','FATHER'),('33256','615000','MOTHER'),('614000','33256',''),('615000','33256','');
/*!40000 ALTER TABLE `family` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `uppercase5` BEFORE INSERT ON `family` FOR EACH ROW BEGIN
  SET NEW.userid = UPPER(NEW.userid);
  SET NEW.memberid = UPPER(NEW.memberid);
  SET NEW.type= UPPER(NEW.type);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `patient`
--

DROP TABLE IF EXISTS `patient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patient` (
  `userid` varchar(25) NOT NULL,
  `weight` float DEFAULT NULL,
  `height` float DEFAULT NULL,
  `bp` float DEFAULT NULL,
  `bldgrp` varchar(5) DEFAULT NULL,
  `allergies` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`userid`),
  CONSTRAINT `patient_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient`
--

LOCK TABLES `patient` WRITE;
/*!40000 ALTER TABLE `patient` DISABLE KEYS */;
INSERT INTO `patient` VALUES ('241919',NULL,NULL,NULL,NULL,NULL),('33256',NULL,NULL,NULL,NULL,NULL),('614000',NULL,NULL,NULL,NULL,NULL),('615000',NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `patient` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `uppercase3` BEFORE INSERT ON `patient` FOR EACH ROW BEGIN
  SET NEW.userid = UPPER(NEW.userid);
  SET NEW.bldgrp = UPPER(NEW.bldgrp);
  SET NEW.allergies = UPPER(NEW.allergies);
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `before_update_patient` BEFORE UPDATE ON `patient` FOR EACH ROW BEGIN

    IF new.weight = 0 THEN
        SET new.weight = old.weight;
    END IF;

    IF new.height = 0 THEN
        SET new.height = old.height;
    END IF;

    IF new.bp = 0 THEN
        SET new.bp = old.bp;
    END IF;

    IF new.allergies = '' THEN
        SET new.allergies = upper(old.allergies);
    ELSE
        SET new.allergies = upper(old.allergies+", "+new.allergies);
    END IF;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

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
INSERT INTO `personal_details` VALUES ('241919','KRISHNA','GAIKWAD',9158414000,'KRISHNAGAIKWAD10@GMAIL.COM','2000-04-09 00:00:00','402','HANUMAN NAGAR','PUNE','MAHARASHTRA',411036,'MALE'),('33256','SOMESHWAR','GAIKWAD',7775069747,'GAIKWADSOMESHWAR@GMAIL.COM','1999-12-15 00:00:00','94/A/3/1','MUNDHWA','PUNE','MAHARASHTRA',411036,'MALE'),('614000','KIRAN','GAIKWAD',9158614000,'KIRANGAIKWAD@GMAIL.COM','1973-01-11 00:00:00','94/A/3/1','MUNDHWA','PUNE','MAHARASHTRA',411036,'MALE'),('615000','DEEPIKA','GAIKWAD',9158615000,'2015NMJADHAV@GMAIL.COM','1980-02-24 00:00:00','94/A/3/1','MUNDHWA','PUNE','MAHARASHTRA',411036,'FEMALE');
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
INSERT INTO `users` VALUES ('241919','$2a$08$B0yVNtOVgBbJ5bNislEb/eM/r0mn2b9CalNDMYHd5Hpi6HlVeNNAG'),('33256','$2a$08$YJ6TkmdhGADo/V2FCzFeY.InlL4qtqcxE/mBFOOGgOlHeFnXp2blC'),('614000','$2a$08$DRGLlQtemy1dZU1KOnOedunVftxck3eTEZcay/4fUxHvk3zut1M3e'),('615000','$2a$08$V5VRpnkxH7q/t2iolw//WOIprYsURZaPf/zSNjgD5M075kL8/Kf3i');
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

-- Dump completed on 2020-12-07 10:35:40
