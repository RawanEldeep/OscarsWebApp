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
-- Table structure for table `academyawards`
--

DROP TABLE IF EXISTS `academyawards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `academyawards` (
  `IterationNo` int NOT NULL,
  `Year` int NOT NULL,
  `Site` varchar(150) NOT NULL DEFAULT 'N/A',
  PRIMARY KEY (`IterationNo`,`Year`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `academyawards`
--

LOCK TABLES `academyawards` WRITE;
/*!40000 ALTER TABLE `academyawards` DISABLE KEYS */;
INSERT INTO `academyawards` VALUES (1,1929,'Hollywood Roosevelt HotelHollywood, Los Angeles, California, U.S.'),(2,1930,'Ambassador Hotel,Los Angeles, California'),(3,1930,'The Ambassador HotelLos Angeles, California'),(4,1931,'Biltmore HotelLos Angeles, California'),(5,1932,'Ambassador HotelLos Angeles, California'),(6,1934,'The Ambassador Hotel'),(7,1935,'Biltmore Hotel in Los Angeles, California'),(8,1936,'Biltmore Hotel'),(9,1937,'Biltmore Hotel'),(10,1938,'Biltmore Hotel'),(11,1939,'Biltmore Hotel'),(12,1940,'Coconut Grove, The Ambassador Hotel, Los Angeles'),(13,1941,'Biltmore Bowl, Biltmore HotelLos Angeles, California'),(14,1942,'Biltmore Bowl, Biltmore Hotel, Los Angeles, California, USA'),(15,1943,'Cocoanut Grove, The Ambassador Hotel, Los Angeles, California, USA'),(16,1944,'Grauman\'s Chinese TheatreHollywood, Los Angeles, California'),(17,1945,'Grauman\'s Chinese Theatre, Hollywood, California'),(18,1946,'Grauman\'s Chinese Theatre, Hollywood, California, USA'),(19,1947,'Shrine Auditorium, Los Angeles, California, USA'),(20,1948,'Shrine Auditorium, Los Angeles, United States'),(21,1949,'Academy Awards Theatre, West Hollywood, California, USA'),(22,1950,'RKO Pantages Theatre, Hollywood, California'),(23,1951,'RKO Pantages Theatre, Hollywood, California'),(24,1952,'RKO Pantages Theatre, Hollywood, California'),(25,1953,'RKO Pantages TheatreHollywood, California NBC International TheatreNew York City, New York'),(26,1954,'RKO Pantages TheatreHollywood, California NBC Center TheatreNew York City, New York'),(27,1955,'RKO Pantages TheatreHollywood, California and NBC Century TheatreNew York City, New York'),(28,1956,'RKO Pantages Theatre, Hollywood, California, NBC Century TheatreNew York City, New York'),(29,1957,'RKO Pantages TheatreHollywood, CaliforniaNBC Century TheatreNew York City, New York'),(30,1958,'RKO Pantages Theatre, Hollywood, California, United States'),(31,1959,'Pantages Theatre, Hollywood, California, USA'),(32,1960,'RKO Pantages Theatre, (Hollywood, California)'),(33,1961,'Santa Monica Civic Auditorium, Santa Monica, California'),(34,1962,'Santa Monica Civic Auditorium, Santa Monica, California'),(35,1963,'Santa Monica Civic Auditorium'),(36,1964,'Santa Monica Civic AuditoriumSanta Monica, California, U.S.'),(37,1965,'Santa Monica Civic Auditorium in Santa Monica, California'),(38,1966,'Santa Monica Civic Auditorium in Santa Monica, California'),(39,1967,'Santa Monica Civic Auditorium, Santa Monica, California'),(40,1968,'Santa Monica Civic Auditorium, Santa Monica, California'),(41,1969,'Dorothy Chandler Pavilion, Los Angeles'),(42,1970,'Dorothy Chandler Pavilion, Los Angeles'),(43,1971,'Dorothy Chandler Pavilion, Los Angeles, California'),(44,1972,'Dorothy Chandler Pavilion, Los Angeles, California'),(45,1973,'Dorothy Chandler PavilionLos Angeles, California'),(46,1974,'Dorothy Chandler PavilionLos Angeles, California'),(47,1975,'Dorothy Chandler Pavilion, Los Angeles, California'),(48,1976,'Dorothy Chandler Pavilion, Los Angeles, California, U.S.'),(49,1977,'Dorothy Chandler PavilionLos Angeles, California, U.S.'),(50,1978,'Dorothy Chandler Pavilion, Los Angeles, California, U.S.'),(51,1979,'Dorothy Chandler PavilionLos Angeles, California, U.S.'),(52,1980,'Dorothy Chandler PavilionLos Angeles, California, U.S.'),(53,1981,'Dorothy Chandler PavilionLos Angeles, California, U.S.'),(54,1982,'Dorothy Chandler PavilionLos Angeles, California, U.S.'),(55,1983,'Dorothy Chandler PavilionLos Angeles, California, U.S.'),(56,1984,'Dorothy Chandler PavilionLos Angeles, California, U.S.'),(57,1985,'Dorothy Chandler PavilionLos Angeles, California, U.S.'),(58,1986,'Dorothy Chandler PavilionLos Angeles, California, U.S.'),(59,1987,'Dorothy Chandler PavilionLos Angeles, California, U.S.'),(60,1988,'Shrine AuditoriumLos Angeles, California'),(61,1989,'Shrine AuditoriumLos Angeles, California, U.S.'),(62,1990,'Dorothy Chandler PavilionLos Angeles, California, U.S.'),(63,1991,'Shrine AuditoriumLos Angeles, California, U.S.'),(64,1992,'Dorothy Chandler PavilionLos Angeles, California, U.S.'),(65,1993,'Dorothy Chandler PavilionLos Angeles, California, U.S.'),(66,1994,'Dorothy Chandler PavilionLos Angeles, California, U.S.'),(67,1995,'Shrine AuditoriumLos Angeles, California, U.S.'),(68,1996,'Dorothy Chandler Pavilion, Los Angeles, California, U.S.'),(69,1997,'Shrine Auditorium, Los Angeles, California, U.S.'),(70,1998,'Shrine AuditoriumLos Angeles, California, U.S.'),(71,1999,'Dorothy Chandler PavilionLos Angeles, California, U.S.'),(72,2000,'Shrine AuditoriumLos Angeles, California, U.S.'),(73,2001,'Shrine Auditorium Los Angeles, California, U.S.'),(74,2002,'Kodak TheatreHollywood, Los Angeles, California, U.S.'),(75,2003,'Kodak TheatreHollywood, Los Angeles, California, U.S.'),(76,2004,'Kodak TheatreHollywood, Los Angeles, California, U.S.'),(77,2005,'Kodak TheatreHollywood, Los Angeles, California, U.S.'),(78,2006,'Kodak TheatreHollywood, Los Angeles, California, U.S.'),(79,2007,'Kodak TheatreHollywood, Los Angeles, California, U.S.'),(80,2008,'\nKodak Theatre\nHollywood, Los Angeles, California, U.S.\n'),(81,2009,'Kodak TheatreHollywood, Los Angeles, California, United States'),(82,2010,'Kodak TheatreHollywood, Los Angeles, California, U.S.'),(83,2011,'Kodak TheatreHollywood, Los Angeles, California, U.S.'),(84,2012,'Hollywood and Highland Center TheatreHollywood, Los Angeles, California, U.S.'),(85,2013,'Dolby TheatreHollywood, Los Angeles, United States'),(86,2014,'Dolby TheatreHollywood, Los Angeles, California, U.S.'),(87,2015,'Dolby TheatreHollywood, Los Angeles, California, U.S.'),(88,2016,'Dolby TheatreHollywood, Los Angeles, California, U.S.'),(89,2017,'Dolby TheatreHollywood, Los Angeles, California, U.S.'),(90,2018,'Dolby TheatreHollywood, Los Angeles, California, U.S.'),(91,2019,'Dolby TheatreHollywood, Los Angeles, California, U.S.'),(92,2020,'Dolby TheatreLos Angeles, California, U.S.'),(93,2021,'Union StationLos Angeles, California, U.S.'),(94,2022,'Dolby TheatreHollywood, Los Angeles, California, U.S.'),(95,2023,'Dolby TheatreHollywood, Los Angeles, California, U.S.'),(96,2024,'Dolby TheatreHollywood, Los Angeles, California, U.S.');
/*!40000 ALTER TABLE `academyawards` ENABLE KEYS */;
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
