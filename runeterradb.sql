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
  `name` varchar(32) NOT NULL,
  `gender` varchar(32) NOT NULL,
  `roles` varchar(32) NOT NULL,
  `species` varchar(64) NOT NULL,
  `resType` varchar(32) NOT NULL,
  `attackerType` varchar(32) NOT NULL,
  `region` varchar(32) NOT NULL,
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
INSERT INTO `champion` VALUES (0,'Aatrox','Male','Top','Darkin','Manaless','Melee','Runeterra'),(1,'Ahri','Female','Middle','Vastayan','Mana','Ranged','Ionia'),(2,'Akali','Female','Top,Middle','Human','Energy','Melee','Ionia'),(3,'Akshan','Male','Top,Middle','Human','Mana','Ranged','Shurima'),(4,'Alistar','Male','Support','Minotaur','Mana','Melee','Runeterra'),(5,'Amumu','Male','Jungle,Support','Undead,Yordle','Mana','Melee','Shurima'),(6,'Anivia','Female','Middle','Spirit,God','Mana','Ranged','Freljord'),(7,'Annie','Female','Middle','Human,Magicborn','Mana','Ranged','Noxus'),(8,'Aphelios','Male','Bottom','Human,Spiritualist','Mana','Ranged','Targon'),(9,'Ashe','Female','Bottom,Support','Human,Iceborn','Mana','Ranged','Freljord'),(10,'Aurelion Sol','Male','Middle','Celestial,Dragon','Mana','Ranged','Runeterra'),(11,'Azir','Male','Middle','God-Warrior','Mana','Ranged','Shurima'),(12,'Bard','Male','Support','Celestial','Mana','Ranged','Runeterra'),(13,'Bel Veth','Female','Jungle','Void-Being','Manaless','Melee','Void'),(14,'Blitzcrank','Other','Support','Golem','Mana','Melee','Zaun'),(15,'Brand','Male','Support','Human,Magically Altered','Mana','Ranged','Freljord'),(16,'Braum','Male','Support','Human,Iceborn','Mana','Melee','Freljord'),(17,'Caitlyn','Female','Bottom','Human','Mana','Ranged','Piltover'),(18,'Camille','Female','Top','Human,Cyborg','Mana','Melee','Piltover'),(19,'Cassiopeia','Female','Middle','Human,Magically Altered','Mana','Ranged','Noxus'),(20,'Cho Gath','Male','Top','Void-Being','Mana','Melee','Void'),(21,'Corki','Male','Middle','Yordle','Mana','Ranged','Bandle City'),(22,'Darius','Male','Top','Human','Mana','Melee','Noxus'),(23,'Diana','Female','Jungle,Middle','Human,Aspect','Mana','Melee','Targon'),(24,'Dr. Mundo','Male','Top','Human,Chemically Altered','Health costs','Melee','Zaun'),(25,'Draven','Male','Bottom','Human','Mana','Ranged','Noxus'),(26,'Ekko','Male','Jungle,Middle','Human','Mana','Melee','Zaun'),(27,'Elise','Female','Jungle','Human,Magically Altered','Mana','Melee,Ranged','Shadow Isles'),(28,'Evelynn','Female','Jungle','Demon,Spirit','Mana','Melee','Runeterra'),(29,'Ezreal','Male','Bottom','Human,Magicborn','Mana','Ranged','Piltover'),(30,'Fiddlesticks','Other','Jungle','Demon,Spirit','Mana','Ranged','Runeterra'),(31,'Fiora','Female','Top','Human','Mana','Melee','Demacia'),(32,'Fizz','Male','Middle','Yordle','Mana','Melee','Bilgewater'),(33,'Galio','Male','Middle,Support','Golem','Mana','Melee','Demacia'),(34,'Gangplank','Male','Top','Human','Mana','Melee','Bilgewater'),(35,'Garen','Male','Top','Human','Manaless','Melee','Demacia'),(36,'Gnar','Male','Top','Yordle','Rage','Melee,Ranged','Freljord'),(37,'Gragas','Male','Top,Jungle','Human','Mana','Melee','Freljord'),(38,'Graves','Male','Jungle','Human','Mana','Ranged','Bilgewater'),(39,'Gwen','Female','Top','Human,Magically Altered','Mana','Melee','Shadow Isles'),(40,'Hecarim','Male','Jungle','Undead','Mana','Melee','Shadow Isles'),(41,'Heimerdinger','Male','Middle,Support','Yordle','Mana','Ranged','Piltover'),(42,'Illaoi','Female','Top','Human,Spiritualist','Mana','Melee','Bilgewater'),(43,'Irelia','Female','Top,Middle','Human,Spiritualist','Mana','Melee','Ionia'),(44,'Ivern','Male','Jungle','Human,Magically Altered','Mana','Ranged','Ionia'),(45,'Janna','Female','Support','Spirit,God','Mana','Ranged','Zaun'),(46,'Jarvan IV','Male','Jungle','Human','Mana','Melee','Demacia'),(47,'Jax','Male','Jungle,Top','Unknown','Mana','Melee','Runeterra'),(48,'Jayce','Male','Middle,Top','Human','Mana','Melee,Ranged','Piltover'),(49,'Jhin','Male','Bottom','Human,Spiritualist','Mana','Ranged','Ionia'),(50,'Jinx','Female','Bottom','Human,Chemically Altered','Mana','Ranged','Zaun'),(51,'K Sante','Male','Top','Human','Mana','Melee','Shurima'),(52,'Kai Sa','Female','Bottom','Human,Void-Being','Mana','Ranged','Shurima'),(53,'Kalista','Female','Bottom','Undead','Mana','Ranged','Shadow Isles'),(54,'Karma','Female','Support','Human,Spiritualist','Mana','Ranged','Ionia'),(55,'Karthus','Male','Jungle','Undead','Mana','Ranged','Shadow Isles'),(56,'Kassadin','Male','Middle','Human,Void-Being','Mana','Melee','Shurima'),(57,'Katarina','Female','Middle','Human','Manaless','Melee','Noxus'),(58,'Kayle','Female','Top','Human,Magically Altered,Aspect','Mana','Melee,Ranged','Demacia'),(59,'Kayn','Male','Jungle','Darkin,Human,Magically Altered','Mana','Melee','Ionia'),(60,'Kennen','Male','Top','Yordle','Energy','Ranged','Ionia'),(61,'Kha Zix','Male','Jungle','Void-Being','Mana','Melee','Void'),(62,'Kindred','Other','Jungle','Spirit,God','Mana','Ranged','Runeterra'),(63,'Kled','Male','Top','Yordle','Courage','Melee','Noxus'),(64,'Kog Maw','Male','Bottom','Void-Being','Mana','Ranged','Void'),(65,'LeBlanc','Female','Middle','Human,Magically Altered','Mana','Ranged','Noxus'),(66,'Lee Sin','Male','Jungle','Human,Spiritualist','Energy','Melee','Ionia'),(67,'Leona','Female','Support','Human,Aspect','Mana','Melee','Targon'),(68,'Lillia','Female','Top,Jungle','Spirit','Mana','Melee','Ionia'),(69,'Lissandra','Female','Middle','Human,Iceborn','Mana','Ranged','Freljord'),(70,'Lucian','Male','Bottom','Human','Mana','Ranged','Demacia'),(71,'Lulu','Female','Support','Yordle','Mana','Ranged','Bandle City'),(72,'Lux','Female','Middle,Support','Human,Magicborn','Mana','Ranged','Demacia'),(73,'Malphite','Male','Top','Golem','Mana','Melee','Ixtal'),(74,'Malzahar','Male','Middle','Human,Void-Being','Mana','Ranged','Shurima'),(75,'Maokai','Male','Jungle,Support','Spirit','Mana','Melee','Shadow Isles'),(76,'Master Yi','Male','Jungle','Human,Spiritualist','Mana','Melee','Ionia'),(77,'Milio','Male','Support','Human','Mana','Ranged','Ixtal'),(78,'Miss Fortune','Female','Bottom','Human','Mana','Ranged','Bilgewater'),(79,'Mordekaiser','Male','Top','Revenant','Shield','Melee','Noxus'),(80,'Morgana','Female','Support','Human,Magically Altered,Aspect','Mana','Ranged','Demacia'),(81,'Nami','Female','Support','Vastayan','Mana','Ranged','Runeterra'),(82,'Nasus','Male','Top','God-Warrior','Mana','Melee','Shurima'),(83,'Nautilus','Male','Support','Revenant','Mana','Melee','Bilgewater'),(84,'Neeko','Female','Middle,Support','Vastayan','Mana','Ranged','Ixtal'),(85,'Nidalee','Female','Jungle','Human,Spiritualist','Mana','Melee,Ranged','Ixtal'),(86,'Nilah','Female','Bottom','Human,Magically Altered','Mana','Melee','Bilgewater'),(87,'Nocturne','Male','Jungle','Demon,Spirit','Mana','Melee','Runeterra'),(88,'Nunu & Willump','Male','Jungle','Human,Yeti','Mana','Melee','Freljord'),(89,'Olaf','Male','Top,Jungle','Human,Iceborn','Mana','Melee','Freljord'),(90,'Orianna','Female','Middle','Golem','Mana','Ranged','Piltover'),(91,'Ornn','Male','Top','Spirit,God','Mana','Melee','Freljord'),(92,'Pantheon','Male','Jungle,Middle,Support','Human,Aspect','Mana','Melee','Targon'),(93,'Poppy','Female','Top,Jungle','Yordle','Mana','Melee','Demacia'),(94,'Pyke','Male','Support','Revenant','Mana','Melee','Bilgewater'),(95,'Qiyana','Female','Jungle,Middle','Human,Magicborn','Mana','Melee','Ixtal'),(96,'Quinn','Female','Top','Human','Mana','Ranged','Demacia'),(97,'Rakan','Male','Support','Vastayan','Mana','Melee','Ionia'),(98,'Rammus','Male','Jungle','God-Warrior','Mana','Melee','Shurima'),(99,'Rek Sai','Female','Jungle','Void-Being','Rage','Melee','Shurima'),(100,'Rell','Female','Support','Human,Magicborn,Magically Altered','Mana','Melee','Noxus'),(101,'Renata Glasc','Female','Support','Human,Chemically Altered','Mana','Ranged','Zaun'),(102,'Renekton','Male','Top','God-Warrior','Fury','Melee','Shurima'),(103,'Rengar','Male','Top,Jungle','Vastayan','Ferocity','Melee','Ixtal'),(104,'Riven','Female','Top','Human','Manaless','Melee','Ionia'),(105,'Rumble','Male','Top,Middle','Yordle','Heat','Melee','Bandle City'),(106,'Ryze','Male','Top,Middle','Human,Magically Altered','Mana','Ranged','Runeterra'),(107,'Samira','Female','Bottom','Human','Mana','Ranged','Shurima'),(108,'Sejuani','Female','Jungle','Human,Iceborn','Mana','Melee','Freljord'),(109,'Senna','Female','Support','Human,Undead','Mana','Ranged','Shadow Isles'),(110,'Seraphine','Female','Support','Human,Magicborn','Mana','Ranged','Piltover'),(111,'Sett','Male','Top','Human,Vastayan','Grit','Melee','Ionia'),(112,'Shaco','Male','Jungle','Spirit','Mana','Melee','Runeterra'),(113,'Shen','Male','Top','Human,Spiritualist','Energy','Melee','Ionia'),(114,'Shyvana','Female','Jungle','Dragon,Magically Altered','Fury','Melee','Demacia'),(115,'Singed','Male','Top','Human,Chemically Altered','Mana','Melee','Zaun'),(116,'Sion','Male','Top','Revenant','Mana','Melee','Noxus'),(117,'Sivir','Female','Bottom','Human','Mana','Ranged','Shurima'),(118,'Skarner','Male','Jungle','Brackern','Mana','Melee','Shurima'),(119,'Sona','Female','Support','Human,Magicborn','Mana','Ranged','Demacia'),(120,'Soraka','Female','Support','Celestial','Mana','Ranged','Targon'),(121,'Swain','Male','Middle,Support','Human,Magically Altered','Mana','Ranged','Noxus'),(122,'Sylas','Male','Middle','Human,Magicborn','Mana','Melee','Demacia'),(123,'Syndra','Female','Middle','Human,Magicborn','Mana','Ranged','Ionia'),(124,'Tahm Kench','Male','Top,Support','Demon,Spirit','Mana','Melee','Bilgewater'),(125,'Taliyah','Female','Jungle,Middle','Human,Magicborn','Mana','Ranged','Shurima'),(126,'Talon','Male','Jungle,Middle','Human','Mana','Melee','Noxus'),(127,'Taric','Male','Support','Human,Aspect','Mana','Melee','Targon'),(128,'Teemo','Male','Top','Yordle','Mana','Ranged','Bandle City'),(129,'Thresh','Male','Support','Undead','Mana','Ranged','Shadow Isles'),(130,'Tristana','Female','Bottom','Yordle','Mana','Ranged','Bandle City'),(131,'Trundle','Male','Top,Jungle','Troll,Iceborn','Mana','Melee','Freljord'),(132,'Tryndamere','Male','Top','Human,Magically Altered','Fury','Melee','Freljord'),(133,'Twisted Fate','Male','Middle','Human,Magicborn','Mana','Ranged','Bilgewater'),(134,'Twitch','Male','Bottom','Rat,Chemically Altered','Mana','Ranged','Zaun'),(135,'Udyr','Male','Jungle,Top','Human,Spiritualist','Mana','Melee','Freljord'),(136,'Urgot','Male','Top','Human,Chemically Altered,Cyborg','Mana','Ranged','Noxus'),(137,'Varus','Male','Bottom,Middle','Darkin,Human','Mana','Ranged','Ionia'),(138,'Vayne','Female','Top,Bottom','Human','Mana','Ranged','Demacia'),(139,'Veigar','Male','Middle','Yordle','Mana','Ranged','Runeterra'),(140,'Vel Koz','Male','Middle,Support','Void-Being','Mana','Ranged','Void'),(141,'Vex','Female','Middle','Yordle','Mana','Ranged','Shadow Isles'),(142,'Vi','Female','Jungle','Human','Mana','Melee','Piltover'),(143,'Viego','Male','Jungle','Undead','Manaless','Melee','Shadow Isles'),(144,'Viktor','Male','Middle','Human,Cyborg','Mana','Ranged','Piltover'),(145,'Vladimir','Male','Middle','Human,Magically Altered','Bloodthirst','Ranged','Noxus'),(146,'Volibear','Male','Top,Jungle','Spirit,God','Mana','Melee','Freljord'),(147,'Warwick','Male','Jungle,Top','Human,Chemically Altered,Cyborg','Mana','Melee','Zaun'),(148,'Wukong','Male','Top,Jungle','Vastayan','Mana','Melee','Ionia'),(149,'Xayah','Female','Bottom','Vastayan','Mana','Ranged','Ionia'),(150,'Xerath','Male','Middle,Support','God-Warrior','Mana','Ranged','Shurima'),(151,'Xin Zhao','Male','Jungle','Human','Mana','Melee','Demacia'),(152,'Yasuo','Male','Middle','Human,Magicborn','Flow','Melee','Ionia'),(153,'Yone','Male','Top,Middle','Human,Magically Altered','Manaless','Melee','Ionia'),(154,'Yorick','Male','Top','Human,Magically Altered','Mana','Melee','Shadow Isles'),(155,'Yuumi','Female','Support','Cat,Magically Altered','Mana','Ranged','Bandle City'),(156,'Zac','Male','Jungle','Golem','Health costs','Melee','Zaun'),(157,'Zed','Male','Middle','Human,Magically Altered','Energy','Melee','Ionia'),(158,'Zeri','Female','Bottom','Human,Magicborn','Mana','Ranged','Zaun'),(159,'Ziggs','Male','Middle,Bottom','Yordle','Mana','Ranged','Zaun'),(160,'Zilean','Male','Support','Human,Magicborn','Mana','Ranged','Runeterra'),(161,'Zoe','Female','Middle','Human,Aspect','Mana','Ranged','Targon'),(162,'Zyra','Female','Support','Unknown','Mana','Ranged','Ixtal');
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
  `name` varchar(32) NOT NULL,
  `story` varchar(1000) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `region`
--

LOCK TABLES `region` WRITE;
/*!40000 ALTER TABLE `region` DISABLE KEYS */;
INSERT INTO `region` VALUES ('Bandle City','This is bandle city'),('Bilgewater','This is bilgewater'),('Demacia','This is Demaciaaaa'),('Freljord','This is the freljord'),('Ionia','This is ionia'),('Ixtal','This is ixtal'),('Noxus','This is noxus'),('Piltover','This is piltover'),('Runeterra','This is runeterra'),('Shadow isles','These are the shadow isles'),('Shurima','This is shurima'),('Targon','This is targon'),('Void','This is the void'),('Zaun','This is zaun');
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

-- Dump completed on 2023-05-02 23:04:23
