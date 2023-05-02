CREATE DATABASE  IF NOT EXISTS `runeterradb` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `runeterradb`;
-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: localhost    Database: runeterradb
-- ------------------------------------------------------
-- Server version	8.0.33

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
-- Table structure for table `champion`
--

DROP TABLE IF EXISTS `champion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `champion` (
  `idChampion` int NOT NULL,
  `name` varchar(16) NOT NULL,
  `gender` varchar(16) NOT NULL,
  `roles` varchar(16) NOT NULL,
  `species` varchar(16) NOT NULL,
  `resType` varchar(16) NOT NULL,
  `attackerType` varchar(16) NOT NULL,
  `region` varchar(16) NOT NULL,
  PRIMARY KEY (`idChampion`),
  KEY `FK_champion_region_idx` (`region`),
  CONSTRAINT `FK_champion_region` FOREIGN KEY (`region`) REFERENCES `region` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `champion`
--

LOCK TABLES `champion` WRITE;
/*!40000 ALTER TABLE `champion` DISABLE KEYS */;
/*!40000 ALTER TABLE `champion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `complete`
--

DROP TABLE IF EXISTS `complete`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `complete` (
  `isComplete` tinyint(1) DEFAULT '0',
  `username` varchar(16) NOT NULL,
  `idMission` int NOT NULL,
  KEY `FK_complete_summoner_idx` (`username`),
  KEY `FK_complete_mission_idx` (`idMission`),
  CONSTRAINT `FK_complete_mission` FOREIGN KEY (`idMission`) REFERENCES `mission` (`idMission`),
  CONSTRAINT `FK_complete_summoner` FOREIGN KEY (`username`) REFERENCES `summoner` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `complete`
--

LOCK TABLES `complete` WRITE;
/*!40000 ALTER TABLE `complete` DISABLE KEYS */;
/*!40000 ALTER TABLE `complete` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lore`
--

DROP TABLE IF EXISTS `lore`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lore` (
  `idChampion` int NOT NULL,
  `description` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`idChampion`),
  CONSTRAINT `FK_lore_champion` FOREIGN KEY (`idChampion`) REFERENCES `champion` (`idChampion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lore`
--

LOCK TABLES `lore` WRITE;
/*!40000 ALTER TABLE `lore` DISABLE KEYS */;
/*!40000 ALTER TABLE `lore` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mission`
--

DROP TABLE IF EXISTS `mission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mission` (
  `idMission` int NOT NULL AUTO_INCREMENT,
  `description` varchar(1000) NOT NULL,
  `level` int NOT NULL,
  `goal` int NOT NULL,
  PRIMARY KEY (`idMission`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='	';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mission`
--

LOCK TABLES `mission` WRITE;
/*!40000 ALTER TABLE `mission` DISABLE KEYS */;
/*!40000 ALTER TABLE `mission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `region`
--

DROP TABLE IF EXISTS `region`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `region` (
  `name` varchar(16) NOT NULL,
  `story` varchar(1000) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `region`
--

LOCK TABLES `region` WRITE;
/*!40000 ALTER TABLE `region` DISABLE KEYS */;
/*!40000 ALTER TABLE `region` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stats`
--

DROP TABLE IF EXISTS `stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stats` (
  `idChampion` int NOT NULL,
  `healthPoint` int NOT NULL,
  `mana` int NOT NULL,
  `attackDamage` int NOT NULL,
  `abilityPower` int NOT NULL,
  `armor` int NOT NULL,
  `magicResistance` int NOT NULL,
  `attackSpeed` int NOT NULL,
  `movementSpeed` int NOT NULL,
  PRIMARY KEY (`idChampion`),
  CONSTRAINT `FK_stats_champion` FOREIGN KEY (`idChampion`) REFERENCES `champion` (`idChampion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stats`
--

LOCK TABLES `stats` WRITE;
/*!40000 ALTER TABLE `stats` DISABLE KEYS */;
/*!40000 ALTER TABLE `stats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `summoner`
--

DROP TABLE IF EXISTS `summoner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `summoner` (
  `username` varchar(16) NOT NULL,
  `summonerName` varchar(16) NOT NULL,
  `score` int NOT NULL,
  `championsGuessed` int NOT NULL,
  `imagesGuessed` int NOT NULL,
  `nameTeam` varchar(16) NOT NULL,
  PRIMARY KEY (`username`),
  KEY `FK_summoner_team_idx` (`nameTeam`),
  CONSTRAINT `FK_summoner_team` FOREIGN KEY (`nameTeam`) REFERENCES `team` (`nameTeam`),
  CONSTRAINT `FK_summoner_user` FOREIGN KEY (`username`) REFERENCES `user` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `summoner`
--

LOCK TABLES `summoner` WRITE;
/*!40000 ALTER TABLE `summoner` DISABLE KEYS */;
/*!40000 ALTER TABLE `summoner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `team`
--

DROP TABLE IF EXISTS `team`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `team` (
  `nameTeam` varchar(16) NOT NULL,
  `scoreTeam` int NOT NULL,
  PRIMARY KEY (`nameTeam`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `team`
--

LOCK TABLES `team` WRITE;
/*!40000 ALTER TABLE `team` DISABLE KEYS */;
/*!40000 ALTER TABLE `team` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `username` varchar(16) NOT NULL,
  `password` varchar(32) NOT NULL,
  `isAdmin` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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

-- Dump completed on 2023-05-02 14:51:00
