-- MySQL dump 10.13  Distrib 8.0.30, for macos12 (x86_64)
--
-- Host: localhost    Database: portfolio
-- ------------------------------------------------------
-- Server version	8.0.29

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
-- Table structure for table `experience`
--

DROP TABLE IF EXISTS `experience`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `experience` (
  `id` int NOT NULL,
  `institution_exp` varchar(45) DEFAULT NULL,
  `title_exp` varchar(45) DEFAULT NULL,
  `isActualJob_exp` tinyint DEFAULT NULL,
  `startDate_exp` date DEFAULT NULL,
  `endDate_exp` date DEFAULT NULL,
  `description_exp` varchar(255) DEFAULT NULL,
  `img_url_exp` varchar(255) DEFAULT NULL,
  `persona_id` int NOT NULL,
  `persona_DNI_persona` int NOT NULL,
  PRIMARY KEY (`id`,`persona_id`,`persona_DNI_persona`),
  KEY `fk_experiencia_laboral_persona_idx` (`persona_id`,`persona_DNI_persona`),
  CONSTRAINT `fk_experiencia_laboral_persona` FOREIGN KEY (`persona_id`, `persona_DNI_persona`) REFERENCES `persona` (`id`, `DNI_persona`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `experience`
--

LOCK TABLES `experience` WRITE;
/*!40000 ALTER TABLE `experience` DISABLE KEYS */;
/*!40000 ALTER TABLE `experience` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login`
--

DROP TABLE IF EXISTS `login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `login` (
  `id` int NOT NULL,
  `username` varchar(80) DEFAULT NULL,
  `password` varchar(80) DEFAULT NULL,
  `persona_id` int NOT NULL,
  `persona_DNI_persona` int NOT NULL,
  PRIMARY KEY (`id`,`persona_id`,`persona_DNI_persona`),
  KEY `fk_login_persona1_idx` (`persona_id`,`persona_DNI_persona`),
  CONSTRAINT `fk_login_persona1` FOREIGN KEY (`persona_id`, `persona_DNI_persona`) REFERENCES `persona` (`id`, `DNI_persona`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login`
--

LOCK TABLES `login` WRITE;
/*!40000 ALTER TABLE `login` DISABLE KEYS */;
/*!40000 ALTER TABLE `login` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `persona`
--

DROP TABLE IF EXISTS `persona`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `persona` (
  `id` int NOT NULL,
  `name_persona` varchar(45) NOT NULL,
  `surname_persona` varchar(45) NOT NULL,
  `DNI_persona` int NOT NULL,
  `dateOfBirth_persona` date DEFAULT NULL,
  `telefone_persona` varchar(45) DEFAULT NULL,
  `photo_url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`,`DNI_persona`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `persona`
--

LOCK TABLES `persona` WRITE;
/*!40000 ALTER TABLE `persona` DISABLE KEYS */;
/*!40000 ALTER TABLE `persona` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proyect_photos`
--

DROP TABLE IF EXISTS `proyect_photos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proyect_photos` (
  `id` int NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `proyect_photo_url` varchar(255) DEFAULT NULL,
  `proyects_id` int NOT NULL,
  `proyects_persona_id` int NOT NULL,
  `proyects_persona_DNI_persona` int NOT NULL,
  PRIMARY KEY (`id`,`proyects_id`,`proyects_persona_id`,`proyects_persona_DNI_persona`),
  KEY `fk_proyect_photos_proyects1_idx` (`proyects_id`,`proyects_persona_id`,`proyects_persona_DNI_persona`),
  CONSTRAINT `fk_proyect_photos_proyects1` FOREIGN KEY (`proyects_id`, `proyects_persona_id`, `proyects_persona_DNI_persona`) REFERENCES `proyects` (`id`, `persona_id`, `persona_DNI_persona`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proyect_photos`
--

LOCK TABLES `proyect_photos` WRITE;
/*!40000 ALTER TABLE `proyect_photos` DISABLE KEYS */;
/*!40000 ALTER TABLE `proyect_photos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proyects`
--

DROP TABLE IF EXISTS `proyects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proyects` (
  `id` int NOT NULL,
  `title_pro` varchar(45) DEFAULT NULL,
  `tecnologies_pro` varchar(80) DEFAULT NULL,
  `description_pro` varchar(255) DEFAULT NULL,
  `deployLink_pro` varchar(80) DEFAULT NULL,
  `githubLink_pro` varchar(80) DEFAULT NULL,
  `persona_id` int NOT NULL,
  `persona_DNI_persona` int NOT NULL,
  PRIMARY KEY (`id`,`persona_id`,`persona_DNI_persona`),
  KEY `fk_proyectos_persona1_idx` (`persona_id`,`persona_DNI_persona`),
  CONSTRAINT `fk_proyectos_persona1` FOREIGN KEY (`persona_id`, `persona_DNI_persona`) REFERENCES `persona` (`id`, `DNI_persona`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proyects`
--

LOCK TABLES `proyects` WRITE;
/*!40000 ALTER TABLE `proyects` DISABLE KEYS */;
/*!40000 ALTER TABLE `proyects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `skils`
--

DROP TABLE IF EXISTS `skils`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `skils` (
  `id` int NOT NULL,
  `type` varchar(45) NOT NULL,
  `img_url_skill` varchar(255) DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  `persona_id` int NOT NULL,
  `persona_DNI_persona` int NOT NULL,
  PRIMARY KEY (`id`,`persona_id`,`persona_DNI_persona`),
  KEY `fk_skils_persona1_idx` (`persona_id`,`persona_DNI_persona`),
  CONSTRAINT `fk_skils_persona1` FOREIGN KEY (`persona_id`, `persona_DNI_persona`) REFERENCES `persona` (`id`, `DNI_persona`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `skils`
--

LOCK TABLES `skils` WRITE;
/*!40000 ALTER TABLE `skils` DISABLE KEYS */;
/*!40000 ALTER TABLE `skils` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `social_networks`
--

DROP TABLE IF EXISTS `social_networks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `social_networks` (
  `id` int NOT NULL,
  `instagram` varchar(45) DEFAULT NULL,
  `facebook` varchar(45) DEFAULT NULL,
  `linkedin` varchar(45) DEFAULT NULL,
  `github` varchar(45) DEFAULT NULL,
  `e-mail` varchar(45) DEFAULT NULL,
  `persona_id` int NOT NULL,
  `persona_DNI_persona` int NOT NULL,
  PRIMARY KEY (`id`,`persona_id`,`persona_DNI_persona`),
  KEY `fk_redes_sociales_persona1_idx` (`persona_id`,`persona_DNI_persona`),
  CONSTRAINT `fk_redes_sociales_persona1` FOREIGN KEY (`persona_id`, `persona_DNI_persona`) REFERENCES `persona` (`id`, `DNI_persona`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `social_networks`
--

LOCK TABLES `social_networks` WRITE;
/*!40000 ALTER TABLE `social_networks` DISABLE KEYS */;
/*!40000 ALTER TABLE `social_networks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `studies`
--

DROP TABLE IF EXISTS `studies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `studies` (
  `id` int NOT NULL,
  `institution_est` varchar(45) DEFAULT NULL,
  `title_est` varchar(45) DEFAULT NULL,
  `startDate_est` date DEFAULT NULL,
  `endDate_est` date DEFAULT NULL,
  `description_est` varchar(255) DEFAULT NULL,
  `img_url_est` varchar(255) DEFAULT NULL,
  `persona_id` int NOT NULL,
  `persona_DNI_persona` int NOT NULL,
  PRIMARY KEY (`id`,`persona_id`,`persona_DNI_persona`),
  KEY `fk_estudios_persona1_idx` (`persona_id`,`persona_DNI_persona`),
  CONSTRAINT `fk_estudios_persona1` FOREIGN KEY (`persona_id`, `persona_DNI_persona`) REFERENCES `persona` (`id`, `DNI_persona`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `studies`
--

LOCK TABLES `studies` WRITE;
/*!40000 ALTER TABLE `studies` DISABLE KEYS */;
/*!40000 ALTER TABLE `studies` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-10-27 23:05:30
