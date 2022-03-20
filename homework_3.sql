-- 1. Заполнить таблицы 10-20 записями 

USE vk;
-- MariaDB dump 10.19  Distrib 10.5.12-MariaDB, for Linux (x86_64)
--
-- Host: mysql.hostinger.ro    Database: u574849695_25
-- ------------------------------------------------------
-- Server version	10.5.12-MariaDB-cll-lve

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `communities`
--

DROP TABLE IF EXISTS `communities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `communities` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `admin_user_id` bigint(20) unsigned NOT NULL,
  UNIQUE KEY `id` (`id`),
  KEY `communities_name_idx` (`name`),
  KEY `admin_user_id` (`admin_user_id`),
  CONSTRAINT `communities_ibfk_1` FOREIGN KEY (`admin_user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `communities`
--

LOCK TABLES `communities` WRITE;
/*!40000 ALTER TABLE `communities` DISABLE KEYS */;
INSERT INTO `communities` VALUES (1,'illo',1),(2,'dolor',2),(3,'nulla',3),(4,'sint',4),(5,'ut',5),(6,'omnis',6),(7,'harum',7),(8,'provident',8),(9,'ut',9),(10,'officia',10),(11,'repudiandae',11);
/*!40000 ALTER TABLE `communities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `friend_requests`
--

DROP TABLE IF EXISTS `friend_requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `friend_requests` (
  `initiator_user_id` bigint(20) unsigned NOT NULL,
  `target_user_id` bigint(20) unsigned NOT NULL,
  `status` enum('requested','approved','declined','unfriended') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `requested_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  PRIMARY KEY (`initiator_user_id`,`target_user_id`),
  KEY `target_user_id` (`target_user_id`),
  CONSTRAINT `friend_requests_ibfk_1` FOREIGN KEY (`initiator_user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `friend_requests_ibfk_2` FOREIGN KEY (`target_user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `friend_requests`
--

LOCK TABLES `friend_requests` WRITE;
/*!40000 ALTER TABLE `friend_requests` DISABLE KEYS */;
INSERT INTO `friend_requests` VALUES (1,1,'approved','2008-07-21 08:05:31','2010-01-28 04:20:24'),(2,2,'requested','1983-02-07 18:39:36','1974-04-01 14:00:11'),(3,3,'declined','2014-09-01 15:24:46','1985-04-14 13:51:08'),(4,4,'unfriended','1980-05-11 02:50:22','1987-02-01 11:37:29'),(5,5,'requested','1978-09-15 00:32:21','2002-07-22 10:51:47'),(6,6,'unfriended','1993-03-02 06:46:53','1990-10-22 04:07:39'),(7,7,'requested','2011-12-20 11:34:40','2010-04-27 09:43:23'),(8,8,'requested','1974-01-13 13:25:02','2019-03-21 06:25:35'),(9,9,'unfriended','1979-05-10 21:27:05','2021-07-27 23:45:00'),(10,10,'requested','1979-07-27 09:42:50','1972-09-06 09:39:18'),(11,11,'declined','2004-06-18 13:34:41','1970-03-15 20:43:20'),(12,12,'declined','2006-05-18 09:56:19','2005-09-28 07:40:25'),(13,13,'unfriended','2005-12-26 04:33:14','2013-09-11 02:54:52'),(14,14,'unfriended','1992-10-11 04:26:46','1985-09-28 22:52:11'),(15,15,'unfriended','1987-06-25 16:32:47','1977-04-13 01:32:03'),(16,16,'unfriended','2021-05-23 17:37:43','2005-05-11 02:14:47');
/*!40000 ALTER TABLE `friend_requests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `likes`
--

DROP TABLE IF EXISTS `likes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `likes` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `media_id` bigint(20) unsigned NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `likes`
--

LOCK TABLES `likes` WRITE;
/*!40000 ALTER TABLE `likes` DISABLE KEYS */;
INSERT INTO `likes` VALUES (1,1,1,'2015-08-07 21:49:54'),(2,2,2,'1993-05-15 02:23:43'),(3,3,3,'2002-01-21 04:53:08'),(4,4,4,'2014-07-08 06:50:37'),(5,5,5,'1997-10-29 12:23:04'),(6,6,6,'1974-10-06 00:04:11'),(7,7,7,'2011-01-26 11:51:07'),(8,8,8,'1984-07-09 07:37:02'),(9,9,9,'2019-03-29 08:46:00'),(10,10,10,'1989-01-01 07:20:38'),(11,11,11,'1998-10-10 22:15:41'),(12,12,12,'1975-09-24 22:47:49'),(13,13,1,'1983-08-03 22:53:24'),(14,14,2,'1990-01-28 17:44:28'),(15,15,3,'1986-03-09 14:24:07'),(16,16,4,'1993-10-22 13:22:10'),(17,1,5,'1998-09-11 10:06:10');
/*!40000 ALTER TABLE `likes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media`
--

DROP TABLE IF EXISTS `media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `media` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `media_type_id` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `filename` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `size` int(11) DEFAULT NULL,
  `metadata` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`metadata`)),
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  UNIQUE KEY `id` (`id`),
  KEY `user_id` (`user_id`),
  KEY `media_type_id` (`media_type_id`),
  CONSTRAINT `media_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `media_ibfk_2` FOREIGN KEY (`media_type_id`) REFERENCES `media_types` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media`
--

LOCK TABLES `media` WRITE;
/*!40000 ALTER TABLE `media` DISABLE KEYS */;
INSERT INTO `media` VALUES (1,1,1,'Magnam est magnam officiis deserunt. Maxime recusandae architecto vero consequatur qui dicta eum. Enim distinctio eum ad.','porro',1728331,NULL,'1971-04-17 07:39:37','1989-10-29 22:20:58'),(2,2,2,'Animi et itaque mollitia ipsam. Debitis ea et est consequatur et ut. Sunt cum ullam repellendus inventore. Cum assumenda sint quia tempora ut officiis.','beatae',5819367,NULL,'1989-10-14 12:47:15','2006-08-27 10:32:17'),(3,3,3,'Saepe excepturi quibusdam omnis expedita. Quo voluptatem similique consequuntur ratione dolor quaerat tenetur. Et nam et illum sed magni.','consectetur',622,NULL,'1973-07-08 09:06:13','2010-02-05 05:26:02'),(4,4,4,'Eaque laborum nihil aut est tenetur illo. Deleniti voluptate et recusandae voluptas et odio voluptas. Voluptatem iure distinctio eos adipisci a quos. Laborum dignissimos vel sequi quae voluptas esse.','quo',55160738,NULL,'1978-06-11 21:20:12','1996-10-05 05:10:52'),(5,1,5,'Iusto enim voluptate voluptatem hic quia. Culpa nam provident aut quis. Nihil qui itaque sequi explicabo voluptates. Quibusdam repellendus sapiente vel cum repellendus. Hic aut dolorem ratione enim quam sunt incidunt nemo.','dolores',384,NULL,'1982-03-11 17:54:22','1999-03-21 08:51:36'),(6,2,6,'Voluptatem non aut rerum accusantium. Ipsam esse exercitationem et eum. Molestias consequatur aliquam aspernatur officiis nam ratione culpa velit. Et aliquam dolorem unde.','veritatis',8,NULL,'2007-04-09 22:39:20','2017-10-16 16:24:52'),(7,3,7,'Ducimus provident aut neque deleniti ullam. Labore dolorum aspernatur in. Unde qui dolor sunt. A debitis minus necessitatibus velit.','aut',44970,NULL,'1994-12-01 15:26:01','1971-08-04 01:23:27'),(8,4,8,'Asperiores aliquid perferendis repellendus quos. Iure deserunt debitis reprehenderit sed amet voluptatem quia labore. In voluptatum dicta sed vero voluptate. Omnis non consequatur excepturi quisquam consectetur voluptatem.','error',165020,NULL,'1994-06-20 08:35:49','2014-08-13 07:17:35'),(9,1,9,'Quam voluptatem vitae provident ut quo fugiat odio. Alias nesciunt cumque rerum dolor expedita expedita saepe. Ut repellat aut ipsum quae quaerat veniam. Iusto et deleniti beatae corrupti.','temporibus',387452,NULL,'1998-07-25 22:53:14','1978-08-16 14:01:15'),(10,2,10,'Aut quaerat optio sint sunt non voluptate similique. Quisquam aut architecto quidem est sed. Adipisci in sed magni delectus voluptas. Aliquam accusamus ut incidunt quis consequatur minima. Architecto nulla voluptatibus natus atque eaque maiores.','velit',0,NULL,'1972-05-08 11:28:48','1996-10-21 06:02:27'),(11,3,11,'Et optio autem dignissimos. Et fugit aut qui voluptas aut aut. Nihil excepturi animi quae. Assumenda voluptatem vero dolores nihil ut in. Et voluptates officiis aut qui qui dolor saepe.','et',875,NULL,'1995-09-16 22:48:07','1983-07-06 21:06:39'),(12,4,12,'Fugiat magni est blanditiis omnis est et. Laudantium nulla consequatur aut aut optio. Voluptatem beatae sunt sed dolor. Veniam officiis a voluptas qui.','sit',68133,NULL,'2010-01-08 22:51:12','1995-12-17 12:08:38');
/*!40000 ALTER TABLE `media` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media_types`
--

DROP TABLE IF EXISTS `media_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `media_types` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media_types`
--

LOCK TABLES `media_types` WRITE;
/*!40000 ALTER TABLE `media_types` DISABLE KEYS */;
INSERT INTO `media_types` VALUES (1,'illum','2013-09-07 05:08:55','2012-10-04 05:48:48'),(2,'non','2005-08-16 09:24:30','1972-11-28 11:45:03'),(3,'exercitationem','1977-11-29 07:38:32','1986-08-26 10:14:36'),(4,'in','2013-12-28 16:06:16','2007-04-01 20:28:53');
/*!40000 ALTER TABLE `media_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS `messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `messages` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `from_user_id` bigint(20) unsigned NOT NULL,
  `to_user_id` bigint(20) unsigned NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  UNIQUE KEY `id` (`id`),
  KEY `from_user_id` (`from_user_id`),
  KEY `to_user_id` (`to_user_id`),
  CONSTRAINT `messages_ibfk_1` FOREIGN KEY (`from_user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `messages_ibfk_2` FOREIGN KEY (`to_user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messages`
--

LOCK TABLES `messages` WRITE;
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
INSERT INTO `messages` VALUES (23,4,11,'Deleniti sapiente porro beatae eius dolor. Blanditiis veritatis velit dolores voluptatibus nam et. Culpa quia provident ipsam dolores eum quam omnis. Quae dolor maxime et occaecati quia harum dolor quasi.','2000-05-17 15:25:02'),(26,6,14,'Ut aut cupiditate aspernatur molestiae ipsam deserunt sed corrupti. Aut eum sunt iste nulla earum qui dolorum cum. Natus voluptatem facilis sequi accusantium itaque voluptas. Voluptas veritatis expedita placeat alias.','2010-03-24 06:58:06'),(28,4,14,'Atque earum est totam impedit repudiandae. Quam fuga odio et ex sint. Minus eos repellendus ut et velit quia saepe qui. Qui repudiandae neque voluptatem.','1992-12-02 08:03:12'),(31,4,10,'Nisi facere aut aliquid enim. Est molestiae laudantium officia inventore. Dignissimos eos dolorem quisquam et aut eveniet ipsa.','1978-06-07 20:32:26'),(32,8,11,'Repellendus fuga sit aperiam in quia. Neque nihil dolorem et molestiae exercitationem.','2010-12-10 18:31:06'),(34,8,15,'Quibusdam alias accusantium nesciunt. Perferendis sit quis cum rerum et odio. Enim qui doloremque occaecati a delectus nesciunt facilis.','2013-01-26 11:06:47'),(35,8,11,'Cum sed et veniam expedita. Molestiae tempore magni porro. Fuga accusantium officia voluptatem est iusto voluptates nihil.','2014-10-02 19:53:12'),(36,6,12,'Accusantium porro ipsam voluptas voluptatibus. At dolorum possimus ducimus qui ea fugiat. Et distinctio blanditiis consequatur fugiat vel nobis eos. Rerum dicta non repellendus eum tempora et tempore.','1988-03-11 11:59:22'),(37,4,13,'Molestiae repellat animi facere totam omnis voluptatem iure. Quo harum hic laborum numquam quae. Placeat cum eos earum qui et.','1990-07-22 07:15:53'),(38,6,11,'Odio ad rem enim et non voluptas. Sunt quam quis quia exercitationem fugiat voluptas.','2007-12-05 17:36:16'),(39,7,12,'Debitis sunt itaque nam. Labore ratione omnis ad aut molestiae est. Sequi recusandae dolor sit odio aut exercitationem ut.','1973-12-25 00:10:30'),(40,5,13,'Laborum architecto maxime possimus eligendi quis accusantium quos. Exercitationem beatae a eveniet dolores voluptates adipisci. Ipsa ad at hic tenetur pariatur autem iste. Omnis et voluptatem fugiat perspiciatis.','2013-09-25 01:41:34');
/*!40000 ALTER TABLE `messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `photo_albums`
--

DROP TABLE IF EXISTS `photo_albums`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `photo_albums` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `photo_albums_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `photo_albums`
--

LOCK TABLES `photo_albums` WRITE;
/*!40000 ALTER TABLE `photo_albums` DISABLE KEYS */;
INSERT INTO `photo_albums` VALUES (1,'error',1),(2,'laboriosam',2),(3,'earum',3),(4,'ea',4),(5,'laboriosam',5),(6,'animi',6),(7,'laborum',7),(8,'dolorem',8),(9,'optio',9),(10,'quo',10),(11,'et',11),(12,'impedit',12),(13,'at',13),(14,'recusandae',14),(15,'molestiae',15);
/*!40000 ALTER TABLE `photo_albums` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `photos`
--

DROP TABLE IF EXISTS `photos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `photos` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `album_id` bigint(20) unsigned DEFAULT NULL,
  `media_id` bigint(20) unsigned NOT NULL,
  UNIQUE KEY `id` (`id`),
  KEY `album_id` (`album_id`),
  KEY `media_id` (`media_id`),
  CONSTRAINT `photos_ibfk_1` FOREIGN KEY (`album_id`) REFERENCES `photo_albums` (`id`),
  CONSTRAINT `photos_ibfk_2` FOREIGN KEY (`media_id`) REFERENCES `media` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `photos`
--

LOCK TABLES `photos` WRITE;
/*!40000 ALTER TABLE `photos` DISABLE KEYS */;
INSERT INTO `photos` VALUES (17,1,1),(18,2,2),(19,3,3),(20,4,4),(21,5,5),(22,6,6),(23,7,7),(24,8,8),(25,9,9),(26,10,10),(27,11,11),(28,12,12),(29,13,1),(30,14,2),(31,15,3);
/*!40000 ALTER TABLE `photos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profiles`
--

DROP TABLE IF EXISTS `profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `profiles` (
  `user_id` bigint(20) unsigned NOT NULL,
  `gender` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `photo_id` bigint(20) unsigned DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `hometown` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profiles`
--

LOCK TABLES `profiles` WRITE;
/*!40000 ALTER TABLE `profiles` DISABLE KEYS */;
INSERT INTO `profiles` VALUES (1,NULL,'2010-10-24',17,'1981-05-11 15:48:44',NULL),(2,NULL,'1997-02-22',18,'1994-09-17 23:17:50',NULL),(3,NULL,'2009-12-08',19,'2005-03-19 05:21:19',NULL),(4,NULL,'1973-06-15',20,'2021-06-20 06:56:26',NULL),(5,NULL,'1976-08-22',21,'1981-09-09 22:21:02',NULL),(6,NULL,'1980-05-28',22,'1990-03-04 12:22:04',NULL),(7,NULL,'2017-03-12',23,'2019-06-07 08:04:36',NULL),(8,NULL,'2021-03-27',24,'1974-10-21 14:33:46',NULL),(9,NULL,'1970-03-07',25,'2018-12-23 15:55:04',NULL),(10,NULL,'2014-09-01',26,'1989-01-07 18:20:50',NULL),(11,NULL,'2017-11-05',27,'1986-02-27 12:57:02',NULL),(12,NULL,'2017-07-18',28,'2016-03-15 14:25:02',NULL),(13,NULL,'1988-01-11',29,'2014-12-31 10:34:23',NULL),(14,NULL,'2014-10-01',30,'1986-07-25 00:52:03',NULL),(15,NULL,'1977-09-21',31,'2009-11-23 08:50:50',NULL),(16,NULL,'2022-02-07',17,'1985-09-03 08:51:19',NULL);
/*!40000 ALTER TABLE `profiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `firstname` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lastname` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Фамиль',
  `email` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password_hash` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `phone` (`phone`),
  KEY `users_firstname_lastname_idx` (`firstname`,`lastname`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='юзеры';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Alford','Abshire','mstoltenberg@example.org','6c9a3f8784efeb3d3d10a4f0b119d0ac10ec3d43',89012830705),(2,'Kailyn','Green','ogreen@example.com','6180a46be0eb6f258b87e6dbeb4a88f1ab6ae875',89162524193),(3,'Mia','Casper','kwehner@example.net','c3172e6ede2d03cf0b9e80122cd0f5e8f0db53b8',89746970070),(4,'Gertrude','Gleichner','hettinger.thad@example.com','7971d827105518e3288e481a75466d9758293d3d',89350723796),(5,'Estelle','Aufderhar','abner.windler@example.net','73037bcfa39fb2a6bf49025df9d0287d30a04b62',89050445371),(6,'Linwood','Predovic','pgibson@example.org','53cff46230d9f789647d2ed325908549ecd286ad',89984377689),(7,'Sandra','Schoen','xpagac@example.com','f3fd61ed2abf1c2f36aabb56964085956b122662',89554006288),(8,'Lloyd','Cruickshank','schaefer.alek@example.org','f7d2a43cbdc7732515e5e8d992e9b8bc21a7bfe3',89932342126),(9,'Opal','Lockman','reta.ward@example.net','5a53111a936d5db21a76dfd9589509070b75ae42',89590472597),(10,'Royal','Lockman','valentina07@example.com','a0b894c96b47c84953f1abbab6cb2f5157dd3c6d',89576564225),(11,'Anastasia','Wiegand','lbailey@example.com','6787e26a2444de4a8d8bd43055254d8233f06a54',89428056686),(12,'Retha','Sipes','shields.devon@example.com','a437b521d27f09ca735957797aea22e0efbc0727',89789454292),(13,'Darien','Huel','anjali68@example.org','47889b1ac498d5e1cbcca7dba4308cd5bf11ef4d',89952621276),(14,'Emmanuelle','Collier','d\'amore.oscar@example.net','ce025bd67774e5019f14852ecf82e8caca8f4019',89893308854),(15,'Kaia','Denesik','maggio.ocie@example.com','d4cb5a6ee5ac61d3f1bf650d1a8642aa79341887',89062579034),(16,'Logan','Mohr','vlittel@example.org','5cde8d5abb23228972a9b9155d292d1aaa5dc8e0',89658374569);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_communities`
--

DROP TABLE IF EXISTS `users_communities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_communities` (
  `user_id` bigint(20) unsigned NOT NULL,
  `community_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`user_id`,`community_id`),
  KEY `community_id` (`community_id`),
  CONSTRAINT `users_communities_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `users_communities_ibfk_2` FOREIGN KEY (`community_id`) REFERENCES `communities` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_communities`
--

LOCK TABLES `users_communities` WRITE;
/*!40000 ALTER TABLE `users_communities` DISABLE KEYS */;
INSERT INTO `users_communities` VALUES (1,1),(2,2),(3,3),(4,4),(5,5),(6,6),(7,7),(8,8),(9,9),(10,10),(11,11),(12,1),(13,2),(14,3),(15,4);
/*!40000 ALTER TABLE `users_communities` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-03-10 10:00:32


-- 2.  Написать скрипт, возвращающий список имен (только firstname) пользователей без повторений в алфавитном порядке

SELECT DISTINCT firstname
FROM users
;


-- 3 Написать скрипт, отмечающий несовершеннолетних пользователей как неактивных (поле is_active = false). Предварительно добавить такое поле в таблицу profiles со значением по умолчанию = true (или 1)


ALTER TABLE profiles ADD is_active BIT DEFAULT false NULL;

UPDATE profiles
SET is_active = 1
WHERE YEAR(CURRENT_TIMESTAMP) - YEAR(birthday) - (RIGHT(CURRENT_TIMESTAMP, 5) < RIGHT(birthday, 5)) < 18;

ALTER TABLE profiles ADD age bigint(5);

UPDATE profiles
SET age = YEAR(CURRENT_TIMESTAMP) - YEAR(birthday) - (RIGHT(CURRENT_TIMESTAMP, 5) < RIGHT(birthday, 5));


-- 4. Написать скрипт, удаляющий сообщения «из будущего» (дата позже сегодняшней)

UPDATE messages
	SET created_at='2023-09-14 08:00:16'
	WHERE id = 7;

DELETE FROM messages
WHERE created_at > now();
