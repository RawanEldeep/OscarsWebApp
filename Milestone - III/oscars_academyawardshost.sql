-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: localhost    Database: oscars
-- ------------------------------------------------------
-- Server version	9.2.0

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
-- Table structure for table `academyawardshost`
--

DROP TABLE IF EXISTS `academyawardshost`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `academyawardshost` (
  `IterationNo` int NOT NULL,
  `Year` int NOT NULL,
  `Host` varchar(150) NOT NULL,
  PRIMARY KEY (`IterationNo`,`Year`,`Host`),
  CONSTRAINT `academyawardshost_ibfk_1` FOREIGN KEY (`IterationNo`, `Year`) REFERENCES `academyawards` (`IterationNo`, `Year`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `academyawardshost`
--

LOCK TABLES `academyawardshost` WRITE;
/*!40000 ALTER TABLE `academyawardshost` DISABLE KEYS */;
INSERT INTO `academyawardshost` VALUES (1,1929,'Douglas Fairbanks'),(2,1930,'William C. deMille'),(3,1930,'Conrad Nagel'),(4,1931,'Lawrence Grant'),(5,1932,'Conrad Nagel'),(6,1934,'Will Rogers'),(7,1935,'Irvin S. Cobb'),(8,1936,'Frank Capra'),(9,1937,'George Jessel'),(10,1938,'Bob Burns'),(11,1939,'Frank Capra'),(12,1940,'Bob Hope'),(13,1941,'Bob Hope'),(14,1942,'Bob Hope'),(15,1943,'Bob Hope'),(16,1944,'Jack Benny'),(17,1945,'Bob Hope'),(17,1945,'John Cromwell'),(18,1946,'Bob Hope'),(18,1946,'James Stewart'),(19,1947,'Jack Benny'),(20,1948,'Agnes Moorehead'),(20,1948,'Dick Powell'),(21,1949,'Robert Montgomery'),(22,1950,'Paul Douglas'),(23,1951,'Fred Astaire'),(24,1952,'Danny Kaye'),(25,1953,'Bob Hope'),(25,1953,'Conrad Nagel'),(25,1953,'emcee'),(25,1953,'Fredric March'),(26,1954,'Donald O\'Connor'),(26,1954,'Fredric March'),(27,1955,'Bob Hope'),(27,1955,'Thelma Ritter'),(28,1956,'Claudette Colbert'),(28,1956,'Jerry Lewis'),(28,1956,'Joseph L. Mankiewicz'),(29,1957,'Celeste Holm'),(29,1957,'Jerry Lewis'),(30,1958,'Bob Hope'),(30,1958,'Clarence Nash'),(30,1958,'David Niven'),(30,1958,'Donald Duck'),(30,1958,'Jack Lemmon'),(30,1958,'James Stewart'),(30,1958,'Rosalind Russell'),(31,1959,'Bob Hope'),(31,1959,'David Niven'),(31,1959,'Jerry Lewis'),(31,1959,'Laurence Olivier'),(31,1959,'Mort Sahl'),(31,1959,'Tony Randall'),(32,1960,'Bob Hope'),(33,1961,'Bob Hope'),(34,1962,'Bob Hope'),(35,1963,'Frank Sinatra'),(36,1964,'Jack Lemmon'),(37,1965,'Bob Hope'),(38,1966,'Bob Hope'),(39,1967,'Bob Hope'),(40,1968,'Bob Hope'),(44,1972,'Alan King'),(44,1972,'Helen Hayes'),(44,1972,'Jack Lemmon'),(44,1972,'Sammy Davis Jr.'),(45,1973,'Carol Burnett'),(45,1973,'Charlton Heston'),(45,1973,'Michael Caine'),(45,1973,'Rock Hudson'),(46,1974,'Burt Reynolds'),(46,1974,'David Niven'),(46,1974,'Diana Ross'),(46,1974,'John Huston'),(47,1975,'Bob Hope'),(47,1975,'Frank Sinatra'),(47,1975,'Sammy Davis Jr.'),(47,1975,'Shirley MacLaine'),(48,1976,'Gene Kelly'),(48,1976,'George Segal'),(48,1976,'Goldie Hawn'),(48,1976,'Robert Shaw'),(48,1976,'Walter Matthau'),(49,1977,'Ellen Burstyn'),(49,1977,'Jane Fonda'),(49,1977,'Richard Pryor'),(49,1977,'Warren Beatty'),(50,1978,'Bob Hope'),(51,1979,'Johnny Carson'),(52,1980,'Johnny Carson'),(53,1981,'Johnny Carson'),(54,1982,'Johnny Carson'),(55,1983,'Dudley Moore'),(55,1983,'Liza Minnelli'),(55,1983,'Richard Pryor'),(55,1983,'Walter Matthau'),(56,1984,'Johnny Carson'),(57,1985,'Jack Lemmon'),(58,1986,'Alan Alda'),(58,1986,'Jane Fonda'),(58,1986,'Robin Williams'),(59,1987,'Chevy Chase'),(59,1987,'Goldie Hawn'),(59,1987,'Paul Hogan'),(60,1988,'Chevy Chase'),(62,1990,'Billy Crystal'),(63,1991,'Billy Crystal'),(64,1992,'Billy Crystal'),(65,1993,'Billy Crystal'),(66,1994,'Whoopi Goldberg'),(67,1995,'David Letterman'),(68,1996,'Whoopi Goldberg'),(69,1997,'Billy Crystal'),(70,1998,'Billy Crystal'),(71,1999,'Whoopi Goldberg'),(72,2000,'Billy Crystal'),(73,2001,'Steve Martin'),(74,2002,'Whoopi Goldberg'),(75,2003,'Steve Martin'),(76,2004,'Billy Crystal'),(77,2005,'Chris Rock'),(78,2006,'Jon Stewart'),(79,2007,'Ellen DeGeneres'),(80,2008,'Jon Stewart'),(81,2009,'Hugh Jackman'),(82,2010,'Alec Baldwin'),(82,2010,'Steve Martin'),(83,2011,'Anne Hathaway'),(83,2011,'James Franco'),(84,2012,'Billy Crystal'),(85,2013,'Seth MacFarlane'),(86,2014,'Ellen DeGeneres'),(87,2015,'Neil Patrick Harris'),(88,2016,'Chris Rock'),(89,2017,'Jimmy Kimmel'),(90,2018,'Jimmy Kimmel'),(94,2022,'Amy Schumer'),(94,2022,'Regina Hall'),(94,2022,'Wanda Sykes'),(95,2023,'Jimmy Kimmel'),(96,2024,'Jimmy Kimmel');
/*!40000 ALTER TABLE `academyawardshost` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-04-25  6:21:19
