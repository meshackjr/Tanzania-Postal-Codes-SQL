-- MySQL dump 10.13  Distrib 5.7.27, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: tz
-- ------------------------------------------------------
-- Server version	5.7.27-0ubuntu0.19.04.1

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
-- Table structure for table `regions`
--

DROP TABLE IF EXISTS `regions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `regions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `postcode` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `regions`
--

LOCK TABLES `regions` WRITE;
/*!40000 ALTER TABLE `regions` DISABLE KEYS */;
INSERT INTO `regions` VALUES (1,'Dar es Salaam',11,'2019-09-08 14:20:26','2019-09-08 14:20:26');
/*!40000 ALTER TABLE `regions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `streets`
--

DROP TABLE IF EXISTS `streets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `streets` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `region_id` int(10) unsigned NOT NULL,
  `district_id` int(10) unsigned NOT NULL,
  `ward_id` int(10) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `postcode` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `streets_region_id_foreign` (`region_id`),
  KEY `streets_district_id_foreign` (`district_id`),
  KEY `streets_ward_id_foreign` (`ward_id`),
  CONSTRAINT `streets_district_id_foreign` FOREIGN KEY (`district_id`) REFERENCES `districts` (`id`),
  CONSTRAINT `streets_region_id_foreign` FOREIGN KEY (`region_id`) REFERENCES `regions` (`id`),
  CONSTRAINT `streets_ward_id_foreign` FOREIGN KEY (`ward_id`) REFERENCES `wards` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `streets`
--

LOCK TABLES `streets` WRITE;
/*!40000 ALTER TABLE `streets` DISABLE KEYS */;
/*!40000 ALTER TABLE `streets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `districts`
--

DROP TABLE IF EXISTS `districts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `districts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `region_id` int(10) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `postcode` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `districts_region_id_foreign` (`region_id`),
  CONSTRAINT `districts_region_id_foreign` FOREIGN KEY (`region_id`) REFERENCES `regions` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `districts`
--

LOCK TABLES `districts` WRITE;
/*!40000 ALTER TABLE `districts` DISABLE KEYS */;
INSERT INTO `districts` VALUES (1,1,'Ilala CBD',111,'2019-09-08 14:20:26','2019-09-08 14:20:26');
INSERT INTO `districts` VALUES (2,1,'Ilala',121,'2019-09-08 14:20:27','2019-09-08 14:20:27');
INSERT INTO `districts` VALUES (3,1,'Kinondoni',141,'2019-09-08 14:20:29','2019-09-08 14:20:29');
INSERT INTO `districts` VALUES (4,1,'Temeke',151,'2019-09-08 14:20:30','2019-09-08 14:20:30');
INSERT INTO `districts` VALUES (5,1,'Ubungo',161,'2019-09-08 14:20:31','2019-09-08 14:20:31');
INSERT INTO `districts` VALUES (6,1,'Kigamboni',171,'2019-09-08 14:20:32','2019-09-08 14:20:32');
/*!40000 ALTER TABLE `districts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wards`
--

DROP TABLE IF EXISTS `wards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wards` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `region_id` int(10) unsigned NOT NULL,
  `district_id` int(10) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `postcode` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `wards_region_id_foreign` (`region_id`),
  KEY `wards_district_id_foreign` (`district_id`),
  CONSTRAINT `wards_district_id_foreign` FOREIGN KEY (`district_id`) REFERENCES `districts` (`id`),
  CONSTRAINT `wards_region_id_foreign` FOREIGN KEY (`region_id`) REFERENCES `regions` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=103 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wards`
--

LOCK TABLES `wards` WRITE;
/*!40000 ALTER TABLE `wards` DISABLE KEYS */;
INSERT INTO `wards` VALUES (1,1,1,'Kivukoni',11101,'2019-09-08 14:20:26','2019-09-08 14:20:26');
INSERT INTO `wards` VALUES (2,1,1,'Upanga Mashariki',11102,'2019-09-08 14:20:27','2019-09-08 14:20:27');
INSERT INTO `wards` VALUES (3,1,1,'Upanga Magharibi',11103,'2019-09-08 14:20:27','2019-09-08 14:20:27');
INSERT INTO `wards` VALUES (4,1,1,'Kisutu',11104,'2019-09-08 14:20:27','2019-09-08 14:20:27');
INSERT INTO `wards` VALUES (5,1,1,'Mchafukoge',11105,'2019-09-08 14:20:27','2019-09-08 14:20:27');
INSERT INTO `wards` VALUES (6,1,1,'Kariakoo',11106,'2019-09-08 14:20:27','2019-09-08 14:20:27');
INSERT INTO `wards` VALUES (7,1,1,'Gerezani',11107,'2019-09-08 14:20:27','2019-09-08 14:20:27');
INSERT INTO `wards` VALUES (8,1,1,'Jangwani',11108,'2019-09-08 14:20:27','2019-09-08 14:20:27');
INSERT INTO `wards` VALUES (9,1,1,'Mchikichini',11109,'2019-09-08 14:20:27','2019-09-08 14:20:27');
INSERT INTO `wards` VALUES (10,1,2,'Ilala',12101,'2019-09-08 14:20:27','2019-09-08 14:20:27');
INSERT INTO `wards` VALUES (11,1,2,'Buguruni',12102,'2019-09-08 14:20:27','2019-09-08 14:20:27');
INSERT INTO `wards` VALUES (12,1,2,'Tabata',12103,'2019-09-08 14:20:27','2019-09-08 14:20:27');
INSERT INTO `wards` VALUES (13,1,2,'Kimanga',12104,'2019-09-08 14:20:27','2019-09-08 14:20:27');
INSERT INTO `wards` VALUES (14,1,2,'Segerea',12105,'2019-09-08 14:20:27','2019-09-08 14:20:27');
INSERT INTO `wards` VALUES (15,1,2,'Kipawa',12106,'2019-09-08 14:20:27','2019-09-08 14:20:27');
INSERT INTO `wards` VALUES (16,1,2,'Ukonga',12107,'2019-09-08 14:20:27','2019-09-08 14:20:27');
INSERT INTO `wards` VALUES (17,1,2,'Kiwalani',12108,'2019-09-08 14:20:27','2019-09-08 14:20:27');
INSERT INTO `wards` VALUES (18,1,2,'Vingunguti',12109,'2019-09-08 14:20:28','2019-09-08 14:20:28');
INSERT INTO `wards` VALUES (19,1,2,'Gongo la mboto',12110,'2019-09-08 14:20:28','2019-09-08 14:20:28');
INSERT INTO `wards` VALUES (20,1,2,'Kitunda',12111,'2019-09-08 14:20:28','2019-09-08 14:20:28');
INSERT INTO `wards` VALUES (21,1,2,'Pugu',12112,'2019-09-08 14:20:28','2019-09-08 14:20:28');
INSERT INTO `wards` VALUES (22,1,2,'Majohe',12113,'2019-09-08 14:20:28','2019-09-08 14:20:28');
INSERT INTO `wards` VALUES (23,1,2,'Msongola',12114,'2019-09-08 14:20:28','2019-09-08 14:20:28');
INSERT INTO `wards` VALUES (24,1,2,'Chanika',12115,'2019-09-08 14:20:28','2019-09-08 14:20:28');
INSERT INTO `wards` VALUES (25,1,2,'Kinyerezi',12116,'2019-09-08 14:20:28','2019-09-08 14:20:28');
INSERT INTO `wards` VALUES (26,1,2,'Kivule',12117,'2019-09-08 14:20:28','2019-09-08 14:20:28');
INSERT INTO `wards` VALUES (27,1,2,'Mnyamani',12118,'2019-09-08 14:20:28','2019-09-08 14:20:28');
INSERT INTO `wards` VALUES (28,1,2,'Liwiti',12119,'2019-09-08 14:20:28','2019-09-08 14:20:28');
INSERT INTO `wards` VALUES (29,1,2,'Bonyokwa',12120,'2019-09-08 14:20:28','2019-09-08 14:20:28');
INSERT INTO `wards` VALUES (30,1,2,'Kipunguni',12121,'2019-09-08 14:20:28','2019-09-08 14:20:28');
INSERT INTO `wards` VALUES (31,1,2,'Kisukulu',12122,'2019-09-08 14:20:28','2019-09-08 14:20:28');
INSERT INTO `wards` VALUES (32,1,2,'Minazi miref',12123,'2019-09-08 14:20:28','2019-09-08 14:20:28');
INSERT INTO `wards` VALUES (33,1,2,'Buyuni',12124,'2019-09-08 14:20:28','2019-09-08 14:20:28');
INSERT INTO `wards` VALUES (34,1,2,'Zingiziwa',12125,'2019-09-08 14:20:28','2019-09-08 14:20:28');
INSERT INTO `wards` VALUES (35,1,2,'Mzinga',12126,'2019-09-08 14:20:29','2019-09-08 14:20:29');
INSERT INTO `wards` VALUES (36,1,2,'Pugu station',12127,'2019-09-08 14:20:29','2019-09-08 14:20:29');
INSERT INTO `wards` VALUES (37,1,3,'Magomeni',14101,'2019-09-08 14:20:29','2019-09-08 14:20:29');
INSERT INTO `wards` VALUES (38,1,3,'Mzimuni',14102,'2019-09-08 14:20:29','2019-09-08 14:20:29');
INSERT INTO `wards` VALUES (39,1,3,'Ndugumbi',14104,'2019-09-08 14:20:29','2019-09-08 14:20:29');
INSERT INTO `wards` VALUES (40,1,3,'Tandale',14106,'2019-09-08 14:20:29','2019-09-08 14:20:29');
INSERT INTO `wards` VALUES (41,1,3,'Makumbusho',14107,'2019-09-08 14:20:29','2019-09-08 14:20:29');
INSERT INTO `wards` VALUES (42,1,3,'Mwananyamala',14108,'2019-09-08 14:20:29','2019-09-08 14:20:29');
INSERT INTO `wards` VALUES (43,1,3,'Hananasif',14109,'2019-09-08 14:20:29','2019-09-08 14:20:29');
INSERT INTO `wards` VALUES (44,1,3,'Kinondoni',14110,'2019-09-08 14:20:29','2019-09-08 14:20:29');
INSERT INTO `wards` VALUES (45,1,3,'Msasani',14111,'2019-09-08 14:20:29','2019-09-08 14:20:29');
INSERT INTO `wards` VALUES (46,1,3,'Mikocheni',14112,'2019-09-08 14:20:29','2019-09-08 14:20:29');
INSERT INTO `wards` VALUES (47,1,3,'Kijitonyama',14113,'2019-09-08 14:20:29','2019-09-08 14:20:29');
INSERT INTO `wards` VALUES (48,1,3,'Kigogo',14118,'2019-09-08 14:20:29','2019-09-08 14:20:29');
INSERT INTO `wards` VALUES (49,1,3,'Kawe',14121,'2019-09-08 14:20:29','2019-09-08 14:20:29');
INSERT INTO `wards` VALUES (50,1,3,'Kunduchi',14122,'2019-09-08 14:20:29','2019-09-08 14:20:29');
INSERT INTO `wards` VALUES (51,1,3,'Bunju',14125,'2019-09-08 14:20:29','2019-09-08 14:20:29');
INSERT INTO `wards` VALUES (52,1,3,'Mbweni',14126,'2019-09-08 14:20:29','2019-09-08 14:20:29');
INSERT INTO `wards` VALUES (53,1,3,'Mbezi Juu',14128,'2019-09-08 14:20:29','2019-09-08 14:20:29');
INSERT INTO `wards` VALUES (54,1,3,'Makongo',14129,'2019-09-08 14:20:29','2019-09-08 14:20:29');
INSERT INTO `wards` VALUES (55,1,3,'Wazo',14130,'2019-09-08 14:20:30','2019-09-08 14:20:30');
INSERT INTO `wards` VALUES (56,1,3,'Mabwepande',14134,'2019-09-08 14:20:30','2019-09-08 14:20:30');
INSERT INTO `wards` VALUES (57,1,4,'TEMEKE',15101,'2019-09-08 14:20:30','2019-09-08 14:20:30');
INSERT INTO `wards` VALUES (58,1,4,'SANDALI',15102,'2019-09-08 14:20:30','2019-09-08 14:20:30');
INSERT INTO `wards` VALUES (59,1,4,'CHANG’OMBE',15103,'2019-09-08 14:20:30','2019-09-08 14:20:30');
INSERT INTO `wards` VALUES (60,1,4,'KEKO',15104,'2019-09-08 14:20:30','2019-09-08 14:20:30');
INSERT INTO `wards` VALUES (61,1,4,'MIBURANI',15105,'2019-09-08 14:20:30','2019-09-08 14:20:30');
INSERT INTO `wards` VALUES (62,1,4,'AZIMIO',15106,'2019-09-08 14:20:30','2019-09-08 14:20:30');
INSERT INTO `wards` VALUES (63,1,4,'TANDIKA',15107,'2019-09-08 14:20:30','2019-09-08 14:20:30');
INSERT INTO `wards` VALUES (64,1,4,'MTONI',15108,'2019-09-08 14:20:30','2019-09-08 14:20:30');
INSERT INTO `wards` VALUES (65,1,4,'KURASINI',15109,'2019-09-08 14:20:30','2019-09-08 14:20:30');
INSERT INTO `wards` VALUES (66,1,4,'MBAGALA KUU',15112,'2019-09-08 14:20:30','2019-09-08 14:20:30');
INSERT INTO `wards` VALUES (67,1,4,'MBAGALA',15113,'2019-09-08 14:20:30','2019-09-08 14:20:30');
INSERT INTO `wards` VALUES (68,1,4,'MAKANGARAWE',15114,'2019-09-08 14:20:30','2019-09-08 14:20:30');
INSERT INTO `wards` VALUES (69,1,4,'YOMBO VITUKA',15115,'2019-09-08 14:20:30','2019-09-08 14:20:30');
INSERT INTO `wards` VALUES (70,1,4,'CHAMAZI',15116,'2019-09-08 14:20:30','2019-09-08 14:20:30');
INSERT INTO `wards` VALUES (71,1,4,'CHARAMBE',15117,'2019-09-08 14:20:30','2019-09-08 14:20:30');
INSERT INTO `wards` VALUES (72,1,4,'TOANGOMA',15118,'2019-09-08 14:20:30','2019-09-08 14:20:30');
INSERT INTO `wards` VALUES (73,1,4,'BUZA',15125,'2019-09-08 14:20:31','2019-09-08 14:20:31');
INSERT INTO `wards` VALUES (74,1,4,'KILAKALA',15127,'2019-09-08 14:20:31','2019-09-08 14:20:31');
INSERT INTO `wards` VALUES (75,1,4,'KIBURUGWA',15128,'2019-09-08 14:20:31','2019-09-08 14:20:31');
INSERT INTO `wards` VALUES (76,1,4,'KIJICHI',15129,'2019-09-08 14:20:31','2019-09-08 14:20:31');
INSERT INTO `wards` VALUES (77,1,4,'MIANZINI',15130,'2019-09-08 14:20:31','2019-09-08 14:20:31');
INSERT INTO `wards` VALUES (78,1,4,'Kibondemaji',15131,'2019-09-08 14:20:31','2019-09-08 14:20:31');
INSERT INTO `wards` VALUES (79,1,4,'Kilungule',15132,'2019-09-08 14:20:31','2019-09-08 14:20:31');
INSERT INTO `wards` VALUES (80,1,5,'Mburahati',16101,'2019-09-08 14:20:31','2019-09-08 14:20:31');
INSERT INTO `wards` VALUES (81,1,5,'Sinza',16102,'2019-09-08 14:20:31','2019-09-08 14:20:31');
INSERT INTO `wards` VALUES (82,1,5,'Ubungo',16103,'2019-09-08 14:20:31','2019-09-08 14:20:31');
INSERT INTO `wards` VALUES (83,1,5,'Kimara',16104,'2019-09-08 14:20:31','2019-09-08 14:20:31');
INSERT INTO `wards` VALUES (84,1,5,'Saranga',16105,'2019-09-08 14:20:31','2019-09-08 14:20:31');
INSERT INTO `wards` VALUES (85,1,5,'Makuburi',16106,'2019-09-08 14:20:31','2019-09-08 14:20:31');
INSERT INTO `wards` VALUES (86,1,5,'Makurumla',16107,'2019-09-08 14:20:31','2019-09-08 14:20:31');
INSERT INTO `wards` VALUES (87,1,5,'Manzese',16108,'2019-09-08 14:20:31','2019-09-08 14:20:31');
INSERT INTO `wards` VALUES (88,1,5,'Mabibo',16109,'2019-09-08 14:20:31','2019-09-08 14:20:31');
INSERT INTO `wards` VALUES (89,1,5,'Kibamba',16110,'2019-09-08 14:20:31','2019-09-08 14:20:31');
INSERT INTO `wards` VALUES (90,1,5,'Kwembe',16111,'2019-09-08 14:20:31','2019-09-08 14:20:31');
INSERT INTO `wards` VALUES (91,1,5,'Goba',16112,'2019-09-08 14:20:32','2019-09-08 14:20:32');
INSERT INTO `wards` VALUES (92,1,5,'Mbezi',16113,'2019-09-08 14:20:32','2019-09-08 14:20:32');
INSERT INTO `wards` VALUES (93,1,5,'Msigani',16114,'2019-09-08 14:20:32','2019-09-08 14:20:32');
INSERT INTO `wards` VALUES (94,1,6,'Kimbiji',17101,'2019-09-08 14:20:32','2019-09-08 14:20:32');
INSERT INTO `wards` VALUES (95,1,6,'Somangila',17102,'2019-09-08 14:20:32','2019-09-08 14:20:32');
INSERT INTO `wards` VALUES (96,1,6,'Tungi',17103,'2019-09-08 14:20:32','2019-09-08 14:20:32');
INSERT INTO `wards` VALUES (97,1,6,'Kisarawe II',17104,'2019-09-08 14:20:32','2019-09-08 14:20:32');
INSERT INTO `wards` VALUES (98,1,6,'Pembamnazi',17105,'2019-09-08 14:20:32','2019-09-08 14:20:32');
INSERT INTO `wards` VALUES (99,1,6,'Mjimwema',17106,'2019-09-08 14:20:32','2019-09-08 14:20:32');
INSERT INTO `wards` VALUES (100,1,6,'Kigamboni',17107,'2019-09-08 14:20:32','2019-09-08 14:20:32');
INSERT INTO `wards` VALUES (101,1,6,'Vijibweni',17108,'2019-09-08 14:20:32','2019-09-08 14:20:32');
INSERT INTO `wards` VALUES (102,1,6,'Kibada',17109,'2019-09-08 14:20:32','2019-09-08 14:20:32');
/*!40000 ALTER TABLE `wards` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-09-08 20:34:43
