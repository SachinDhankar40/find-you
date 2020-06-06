-- MySQL dump 10.13  Distrib 8.0.20, for Linux (x86_64)
--
-- Host: localhost    Database: findyou
-- ------------------------------------------------------
-- Server version	8.0.20-0ubuntu0.20.04.1

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
-- Table structure for table `Chat_chat`
--

DROP TABLE IF EXISTS `Chat_chat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Chat_chat` (
  `id` int NOT NULL AUTO_INCREMENT,
  `added_on` datetime(6) NOT NULL,
  `updated_on` datetime(6) NOT NULL,
  `updated_by` varchar(100) DEFAULT NULL,
  `object_status` smallint NOT NULL,
  `title` varchar(200) DEFAULT NULL,
  `contentid` bigint DEFAULT NULL,
  `profile_pic` varchar(100) NOT NULL,
  `chattype` int NOT NULL,
  `user` longtext NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Chat_chat`
--

LOCK TABLES `Chat_chat` WRITE;
/*!40000 ALTER TABLE `Chat_chat` DISABLE KEYS */;
/*!40000 ALTER TABLE `Chat_chat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Chat_chatcontent`
--

DROP TABLE IF EXISTS `Chat_chatcontent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Chat_chatcontent` (
  `id` int NOT NULL AUTO_INCREMENT,
  `added_on` datetime(6) NOT NULL,
  `updated_on` datetime(6) NOT NULL,
  `updated_by` varchar(100) DEFAULT NULL,
  `object_status` smallint NOT NULL,
  `chat` bigint NOT NULL,
  `text` longtext,
  `media` varchar(100) DEFAULT NULL,
  `seenstatus` int NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Chat_chatcontent`
--

LOCK TABLES `Chat_chatcontent` WRITE;
/*!40000 ALTER TABLE `Chat_chatcontent` DISABLE KEYS */;
/*!40000 ALTER TABLE `Chat_chatcontent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Content_advertisement`
--

DROP TABLE IF EXISTS `Content_advertisement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Content_advertisement` (
  `id` int NOT NULL AUTO_INCREMENT,
  `added_on` datetime(6) NOT NULL,
  `updated_on` datetime(6) NOT NULL,
  `updated_by` varchar(100) DEFAULT NULL,
  `object_status` smallint NOT NULL,
  `user` bigint NOT NULL,
  `media` varchar(100) NOT NULL,
  `mediahref` longtext NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Content_advertisement`
--

LOCK TABLES `Content_advertisement` WRITE;
/*!40000 ALTER TABLE `Content_advertisement` DISABLE KEYS */;
/*!40000 ALTER TABLE `Content_advertisement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Content_advertisementcategorymapping`
--

DROP TABLE IF EXISTS `Content_advertisementcategorymapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Content_advertisementcategorymapping` (
  `id` int NOT NULL AUTO_INCREMENT,
  `added_on` datetime(6) NOT NULL,
  `updated_on` datetime(6) NOT NULL,
  `updated_by` varchar(100) DEFAULT NULL,
  `object_status` smallint NOT NULL,
  `category` int NOT NULL,
  `content_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Content_contentadver_content_id_1e93c58e_fk_Content_a` (`content_id`),
  CONSTRAINT `Content_contentadver_content_id_1e93c58e_fk_Content_a` FOREIGN KEY (`content_id`) REFERENCES `Content_advertisement` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Content_advertisementcategorymapping`
--

LOCK TABLES `Content_advertisementcategorymapping` WRITE;
/*!40000 ALTER TABLE `Content_advertisementcategorymapping` DISABLE KEYS */;
/*!40000 ALTER TABLE `Content_advertisementcategorymapping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Content_comment`
--

DROP TABLE IF EXISTS `Content_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Content_comment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `added_on` datetime(6) NOT NULL,
  `updated_on` datetime(6) NOT NULL,
  `updated_by` varchar(100) DEFAULT NULL,
  `object_status` smallint NOT NULL,
  `decription` longtext NOT NULL,
  `comment_by` bigint NOT NULL,
  `like` bigint DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL,
  `adv_id` int DEFAULT NULL,
  `content_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Content_comment_content_id_63325e4e_fk_Content_content_id` (`content_id`),
  KEY `Content_comment_adv_id_489c7475_fk_Content_advertisement_id` (`adv_id`),
  CONSTRAINT `Content_comment_adv_id_489c7475_fk_Content_advertisement_id` FOREIGN KEY (`adv_id`) REFERENCES `Content_advertisement` (`id`),
  CONSTRAINT `Content_comment_content_id_63325e4e_fk_Content_content_id` FOREIGN KEY (`content_id`) REFERENCES `Content_content` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Content_comment`
--

LOCK TABLES `Content_comment` WRITE;
/*!40000 ALTER TABLE `Content_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `Content_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Content_commentreply`
--

DROP TABLE IF EXISTS `Content_commentreply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Content_commentreply` (
  `id` int NOT NULL AUTO_INCREMENT,
  `added_on` datetime(6) NOT NULL,
  `updated_on` datetime(6) NOT NULL,
  `updated_by` varchar(100) DEFAULT NULL,
  `object_status` smallint NOT NULL,
  `comment_by` bigint NOT NULL,
  `decription` longtext NOT NULL,
  `like` bigint DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL,
  `comment_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Content_commentreply_comment_id_24f2d591_fk_Content_comment_id` (`comment_id`),
  CONSTRAINT `Content_commentreply_comment_id_24f2d591_fk_Content_comment_id` FOREIGN KEY (`comment_id`) REFERENCES `Content_comment` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Content_commentreply`
--

LOCK TABLES `Content_commentreply` WRITE;
/*!40000 ALTER TABLE `Content_commentreply` DISABLE KEYS */;
/*!40000 ALTER TABLE `Content_commentreply` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Content_content`
--

DROP TABLE IF EXISTS `Content_content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Content_content` (
  `id` int NOT NULL AUTO_INCREMENT,
  `added_on` datetime(6) NOT NULL,
  `updated_on` datetime(6) NOT NULL,
  `updated_by` varchar(100) DEFAULT NULL,
  `object_status` smallint NOT NULL,
  `description` longtext,
  `place` varchar(100) DEFAULT NULL,
  `contenttype` int NOT NULL,
  `associate_media` varchar(100) DEFAULT NULL,
  `fontfamilly` varchar(150) DEFAULT NULL,
  `media` varchar(100) NOT NULL,
  `medialist` longtext,
  `chatInvited` tinyint(1) NOT NULL,
  `commentinvited` tinyint(1) NOT NULL,
  `notappropriate` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Content_content_user_id_623248c7_fk_Content_contentuser_id` (`user_id`),
  CONSTRAINT `Content_content_user_id_623248c7_fk_Content_contentuser_id` FOREIGN KEY (`user_id`) REFERENCES `Content_contentuser` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Content_content`
--

LOCK TABLES `Content_content` WRITE;
/*!40000 ALTER TABLE `Content_content` DISABLE KEYS */;
INSERT INTO `Content_content` VALUES (1,'2020-05-22 02:17:51.084067','2020-05-22 02:18:51.134332',NULL,0,'Ajinkya baby dog',NULL,2,'',NULL,'content/media/ajinkyababydog.jpg','',1,1,0,1,1),(2,'2020-05-22 02:19:24.031259','2020-05-22 02:19:24.031300',NULL,0,'Ajinkya dog and parrot',NULL,2,'',NULL,'content/media/ajinkyadogandparrort.jpg','',0,1,0,1,1),(5,'2020-05-22 02:24:31.224650','2020-05-22 02:24:31.224690',NULL,0,'andrew baby dog',NULL,2,'',NULL,'content/media/andrewbabydog.jpg','',0,1,0,1,2),(6,'2020-05-22 02:26:08.450726','2020-05-22 02:26:08.450793',NULL,0,'andrew baby lab',NULL,2,'',NULL,'content/media/andrewbabylab.jpg','',0,1,0,1,2),(9,'2020-05-22 02:28:07.425921','2020-05-22 02:28:07.425966',NULL,0,'Axar baby dog 1',NULL,2,'',NULL,'content/media/axarbabydog1.jpeg','',0,1,0,1,3),(12,'2020-05-22 02:29:47.327427','2020-05-22 02:29:47.327492',NULL,0,'axar sleeping dog',NULL,2,'',NULL,'content/media/axarsleepingdog.jpg','',0,1,0,1,3),(15,'2020-05-22 02:31:15.668128','2020-05-22 02:31:15.668169',NULL,0,'Ben three lab',NULL,2,'',NULL,'content/media/benthreelab.jpeg','',0,1,0,1,4),(16,'2020-05-22 02:31:53.073071','2020-05-22 02:31:53.073126',NULL,0,'Ben two rabbit',NULL,2,'',NULL,'content/media/bentworabbit.webp','',0,1,0,1,4),(17,'2020-06-03 13:40:29.225397','2020-06-04 15:08:40.805107',NULL,0,'Ajinkya sample earth video','earth',1,'',NULL,'content/media/samplevideoearth.mp4','',0,1,0,1,1),(21,'2020-06-06 02:17:44.868727','2020-06-06 02:17:44.868780',NULL,0,'Ajinkya 5 mb video',NULL,1,'',NULL,'content/media/SampleVideo_1280x720_5mb.mp4','',0,1,0,1,1),(22,'2020-06-06 02:18:26.993235','2020-06-06 02:18:26.993264',NULL,0,'ajinkya 10 mb video',NULL,1,'',NULL,'content/media/SampleVideo_1280x720_10mb.mp4','',0,1,0,1,1),(23,'2020-06-06 02:19:06.929759','2020-06-06 02:19:06.929790',NULL,0,'ajinkya 20 mb video',NULL,1,'',NULL,'content/media/SampleVideo_1280x720_20mb.mp4','',0,1,0,1,1),(24,'2020-06-06 16:06:01.704610','2020-06-06 16:06:01.704700',NULL,0,'Bengemin asal mein',NULL,3,'textpost/media/asal.jpg',NULL,'content/media/Asal_Mein_-_Darshan_Raval.mp3','',0,1,0,1,4),(25,'2020-06-06 16:06:47.938169','2020-06-06 16:06:47.938219',NULL,0,'Axar phir na mile kabhi',NULL,3,'textpost/media/phir_na_mile.jpg',NULL,'content/media/Phir_Na_Milen_Kabhi_Reprise_-_Accoustics.mp3','',0,1,0,1,3),(26,'2020-06-06 16:08:20.514200','2020-06-06 16:08:20.514237',NULL,0,'andrew viah na karien',NULL,3,'textpost/media/viah_na_karun.jpg',NULL,'content/media/Viah_Nai_Karauna_-_Asees_Kaur.mp3','',0,1,0,1,2);
/*!40000 ALTER TABLE `Content_content` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Content_contentcategorymapping`
--

DROP TABLE IF EXISTS `Content_contentcategorymapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Content_contentcategorymapping` (
  `id` int NOT NULL AUTO_INCREMENT,
  `added_on` datetime(6) NOT NULL,
  `updated_on` datetime(6) NOT NULL,
  `updated_by` varchar(100) DEFAULT NULL,
  `object_status` smallint NOT NULL,
  `category` int NOT NULL,
  `content_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Content_contentcateg_content_id_61c36b21_fk_Content_c` (`content_id`),
  CONSTRAINT `Content_contentcateg_content_id_61c36b21_fk_Content_c` FOREIGN KEY (`content_id`) REFERENCES `Content_content` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Content_contentcategorymapping`
--

LOCK TABLES `Content_contentcategorymapping` WRITE;
/*!40000 ALTER TABLE `Content_contentcategorymapping` DISABLE KEYS */;
/*!40000 ALTER TABLE `Content_contentcategorymapping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Content_contentuser`
--

DROP TABLE IF EXISTS `Content_contentuser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Content_contentuser` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` bigint NOT NULL,
  `profile_picture` longtext,
  `name` varchar(255) DEFAULT NULL,
  `Interest` longtext,
  `country` bigint DEFAULT NULL,
  `state` bigint DEFAULT NULL,
  `city` bigint DEFAULT NULL,
  `BlockList` longtext,
  `object_status` smallint NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Content_contentuser`
--

LOCK TABLES `Content_contentuser` WRITE;
/*!40000 ALTER TABLE `Content_contentuser` DISABLE KEYS */;
INSERT INTO `Content_contentuser` VALUES (1,2,'/media/ajinkyadelhi.png','Ajinkya ',NULL,1,2,3,NULL,0),(2,3,'/media/andrewrajasthan.png','Andrew ',NULL,1,2,3,NULL,0),(3,4,'/media/axardelhi.png','Axar ',NULL,1,2,3,NULL,0),(4,5,'/media/benrajasthan.png','Bengemin ',NULL,1,2,3,NULL,0);
/*!40000 ALTER TABLE `Content_contentuser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Content_like`
--

DROP TABLE IF EXISTS `Content_like`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Content_like` (
  `id` int NOT NULL AUTO_INCREMENT,
  `added_on` datetime(6) NOT NULL,
  `updated_on` datetime(6) NOT NULL,
  `updated_by` varchar(100) DEFAULT NULL,
  `object_status` smallint NOT NULL,
  `liked_by` bigint NOT NULL,
  `adv_id` int DEFAULT NULL,
  `content_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Content_like_adv_id_08667689_fk_Content_advertisement_id` (`adv_id`),
  KEY `Content_like_content_id_3e82e5ef_fk_Content_content_id` (`content_id`),
  CONSTRAINT `Content_like_adv_id_08667689_fk_Content_advertisement_id` FOREIGN KEY (`adv_id`) REFERENCES `Content_advertisement` (`id`),
  CONSTRAINT `Content_like_content_id_3e82e5ef_fk_Content_content_id` FOREIGN KEY (`content_id`) REFERENCES `Content_content` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Content_like`
--

LOCK TABLES `Content_like` WRITE;
/*!40000 ALTER TABLE `Content_like` DISABLE KEYS */;
/*!40000 ALTER TABLE `Content_like` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Content_spamreport`
--

DROP TABLE IF EXISTS `Content_spamreport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Content_spamreport` (
  `id` int NOT NULL AUTO_INCREMENT,
  `added_on` datetime(6) NOT NULL,
  `updated_on` datetime(6) NOT NULL,
  `updated_by` varchar(100) DEFAULT NULL,
  `object_status` smallint NOT NULL,
  `reported_by` bigint NOT NULL,
  `decription` longtext NOT NULL,
  `content_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Content_spamreport_content_id_77bc1fc1_fk_Content_content_id` (`content_id`),
  CONSTRAINT `Content_spamreport_content_id_77bc1fc1_fk_Content_content_id` FOREIGN KEY (`content_id`) REFERENCES `Content_content` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Content_spamreport`
--

LOCK TABLES `Content_spamreport` WRITE;
/*!40000 ALTER TABLE `Content_spamreport` DISABLE KEYS */;
/*!40000 ALTER TABLE `Content_spamreport` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Content_view`
--

DROP TABLE IF EXISTS `Content_view`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Content_view` (
  `id` int NOT NULL AUTO_INCREMENT,
  `added_on` datetime(6) NOT NULL,
  `updated_on` datetime(6) NOT NULL,
  `updated_by` varchar(100) DEFAULT NULL,
  `object_status` smallint NOT NULL,
  `adv_id` int DEFAULT NULL,
  `content_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Content_view_adv_id_063b0650_fk_Content_advertisement_id` (`adv_id`),
  KEY `Content_view_content_id_d6f8a817_fk_Content_content_id` (`content_id`),
  CONSTRAINT `Content_view_adv_id_063b0650_fk_Content_advertisement_id` FOREIGN KEY (`adv_id`) REFERENCES `Content_advertisement` (`id`),
  CONSTRAINT `Content_view_content_id_d6f8a817_fk_Content_content_id` FOREIGN KEY (`content_id`) REFERENCES `Content_content` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Content_view`
--

LOCK TABLES `Content_view` WRITE;
/*!40000 ALTER TABLE `Content_view` DISABLE KEYS */;
/*!40000 ALTER TABLE `Content_view` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Notification_chatnotification`
--

DROP TABLE IF EXISTS `Notification_chatnotification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Notification_chatnotification` (
  `id` int NOT NULL AUTO_INCREMENT,
  `added_on` datetime(6) NOT NULL,
  `updated_on` datetime(6) NOT NULL,
  `updated_by` varchar(100) DEFAULT NULL,
  `object_status` smallint NOT NULL,
  `chat` bigint NOT NULL,
  `description` varchar(150) NOT NULL,
  `contentstatement` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Notification_chatnotification`
--

LOCK TABLES `Notification_chatnotification` WRITE;
/*!40000 ALTER TABLE `Notification_chatnotification` DISABLE KEYS */;
/*!40000 ALTER TABLE `Notification_chatnotification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Notification_contentnotification`
--

DROP TABLE IF EXISTS `Notification_contentnotification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Notification_contentnotification` (
  `id` int NOT NULL AUTO_INCREMENT,
  `added_on` datetime(6) NOT NULL,
  `updated_on` datetime(6) NOT NULL,
  `updated_by` varchar(100) DEFAULT NULL,
  `object_status` smallint NOT NULL,
  `description` varchar(150) NOT NULL,
  `contentstatement` longtext NOT NULL,
  `content_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Notification_content_content_id_6b746bd1_fk_Notificat` (`content_id`),
  CONSTRAINT `Notification_content_content_id_6b746bd1_fk_Notificat` FOREIGN KEY (`content_id`) REFERENCES `Notification_notificationcontent` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Notification_contentnotification`
--

LOCK TABLES `Notification_contentnotification` WRITE;
/*!40000 ALTER TABLE `Notification_contentnotification` DISABLE KEYS */;
/*!40000 ALTER TABLE `Notification_contentnotification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Notification_notificationcontent`
--

DROP TABLE IF EXISTS `Notification_notificationcontent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Notification_notificationcontent` (
  `id` int NOT NULL AUTO_INCREMENT,
  `contentId` bigint NOT NULL,
  `contentthumbnail` longtext,
  `object_status` smallint NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Notification_notificationcontent`
--

LOCK TABLES `Notification_notificationcontent` WRITE;
/*!40000 ALTER TABLE `Notification_notificationcontent` DISABLE KEYS */;
/*!40000 ALTER TABLE `Notification_notificationcontent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Notification_usernotification`
--

DROP TABLE IF EXISTS `Notification_usernotification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Notification_usernotification` (
  `id` int NOT NULL AUTO_INCREMENT,
  `added_on` datetime(6) NOT NULL,
  `updated_on` datetime(6) NOT NULL,
  `updated_by` varchar(100) DEFAULT NULL,
  `object_status` smallint NOT NULL,
  `user` bigint NOT NULL,
  `description` varchar(150) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Notification_usernotification`
--

LOCK TABLES `Notification_usernotification` WRITE;
/*!40000 ALTER TABLE `Notification_usernotification` DISABLE KEYS */;
/*!40000 ALTER TABLE `Notification_usernotification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=125 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add content type',4,'add_contenttype'),(14,'Can change content type',4,'change_contenttype'),(15,'Can delete content type',4,'delete_contenttype'),(16,'Can view content type',4,'view_contenttype'),(17,'Can add session',5,'add_session'),(18,'Can change session',5,'change_session'),(19,'Can delete session',5,'delete_session'),(20,'Can view session',5,'view_session'),(21,'Can add Token',6,'add_token'),(22,'Can change Token',6,'change_token'),(23,'Can delete Token',6,'delete_token'),(24,'Can view Token',6,'view_token'),(25,'Can add user',7,'add_user'),(26,'Can change user',7,'change_user'),(27,'Can delete user',7,'delete_user'),(28,'Can view user',7,'view_user'),(29,'Can add advertise partner',8,'add_advertisepartner'),(30,'Can change advertise partner',8,'change_advertisepartner'),(31,'Can delete advertise partner',8,'delete_advertisepartner'),(32,'Can view advertise partner',8,'view_advertisepartner'),(33,'Can add csc details',9,'add_cscdetails'),(34,'Can change csc details',9,'change_cscdetails'),(35,'Can delete csc details',9,'delete_cscdetails'),(36,'Can view csc details',9,'view_cscdetails'),(37,'Can add invalid login',10,'add_invalidlogin'),(38,'Can change invalid login',10,'change_invalidlogin'),(39,'Can delete invalid login',10,'delete_invalidlogin'),(40,'Can view invalid login',10,'view_invalidlogin'),(41,'Can add user otp',11,'add_userotp'),(42,'Can change user otp',11,'change_userotp'),(43,'Can delete user otp',11,'delete_userotp'),(44,'Can view user otp',11,'view_userotp'),(45,'Can add findyou user',12,'add_findyouuser'),(46,'Can change findyou user',12,'change_findyouuser'),(47,'Can delete findyou user',12,'delete_findyouuser'),(48,'Can view findyou user',12,'view_findyouuser'),(49,'Can add division',13,'add_division'),(50,'Can change division',13,'change_division'),(51,'Can delete division',13,'delete_division'),(52,'Can view division',13,'view_division'),(53,'Can add content monitor admin',14,'add_contentmonitoradmin'),(54,'Can change content monitor admin',14,'change_contentmonitoradmin'),(55,'Can delete content monitor admin',14,'delete_contentmonitoradmin'),(56,'Can view content monitor admin',14,'view_contentmonitoradmin'),(57,'Can add chat notification',15,'add_chatnotification'),(58,'Can change chat notification',15,'change_chatnotification'),(59,'Can delete chat notification',15,'delete_chatnotification'),(60,'Can view chat notification',15,'view_chatnotification'),(61,'Can add notification content',16,'add_notificationcontent'),(62,'Can change notification content',16,'change_notificationcontent'),(63,'Can delete notification content',16,'delete_notificationcontent'),(64,'Can view notification content',16,'view_notificationcontent'),(65,'Can add user notification',17,'add_usernotification'),(66,'Can change user notification',17,'change_usernotification'),(67,'Can delete user notification',17,'delete_usernotification'),(68,'Can view user notification',17,'view_usernotification'),(69,'Can add content notification',18,'add_contentnotification'),(70,'Can change content notification',18,'change_contentnotification'),(71,'Can delete content notification',18,'delete_contentnotification'),(72,'Can view content notification',18,'view_contentnotification'),(73,'Can add chat',19,'add_chat'),(74,'Can change chat',19,'change_chat'),(75,'Can delete chat',19,'delete_chat'),(76,'Can view chat',19,'view_chat'),(77,'Can add chat content',20,'add_chatcontent'),(78,'Can change chat content',20,'change_chatcontent'),(79,'Can delete chat content',20,'delete_chatcontent'),(80,'Can view chat content',20,'view_chatcontent'),(81,'Can add advertisement',21,'add_advertisement'),(82,'Can change advertisement',21,'change_advertisement'),(83,'Can delete advertisement',21,'delete_advertisement'),(84,'Can view advertisement',21,'view_advertisement'),(85,'Can add comment',22,'add_comment'),(86,'Can change comment',22,'change_comment'),(87,'Can delete comment',22,'delete_comment'),(88,'Can view comment',22,'view_comment'),(89,'Can add content',23,'add_content'),(90,'Can change content',23,'change_content'),(91,'Can delete content',23,'delete_content'),(92,'Can view content',23,'view_content'),(93,'Can add content user',24,'add_contentuser'),(94,'Can change content user',24,'change_contentuser'),(95,'Can delete content user',24,'delete_contentuser'),(96,'Can view content user',24,'view_contentuser'),(97,'Can add view',25,'add_view'),(98,'Can change view',25,'change_view'),(99,'Can delete view',25,'delete_view'),(100,'Can view view',25,'view_view'),(101,'Can add spam report',26,'add_spamreport'),(102,'Can change spam report',26,'change_spamreport'),(103,'Can delete spam report',26,'delete_spamreport'),(104,'Can view spam report',26,'view_spamreport'),(105,'Can add like',27,'add_like'),(106,'Can change like',27,'change_like'),(107,'Can delete like',27,'delete_like'),(108,'Can view like',27,'view_like'),(109,'Can add comment reply',28,'add_commentreply'),(110,'Can change comment reply',28,'change_commentreply'),(111,'Can delete comment reply',28,'delete_commentreply'),(112,'Can view comment reply',28,'view_commentreply'),(113,'Can add content category mapping',29,'add_contentcategorymapping'),(114,'Can change content category mapping',29,'change_contentcategorymapping'),(115,'Can delete content category mapping',29,'delete_contentcategorymapping'),(116,'Can view content category mapping',29,'view_contentcategorymapping'),(117,'Can add content advertisement mapping',30,'add_contentadvertisementmapping'),(118,'Can change content advertisement mapping',30,'change_contentadvertisementmapping'),(119,'Can delete content advertisement mapping',30,'delete_contentadvertisementmapping'),(120,'Can view content advertisement mapping',30,'view_contentadvertisementmapping'),(121,'Can add advertisement category mapping',30,'add_advertisementcategorymapping'),(122,'Can change advertisement category mapping',30,'change_advertisementcategorymapping'),(123,'Can delete advertisement category mapping',30,'delete_advertisementcategorymapping'),(124,'Can view advertisement category mapping',30,'view_advertisementcategorymapping');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authtoken_token`
--

DROP TABLE IF EXISTS `authtoken_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `authtoken_token` (
  `key` varchar(40) NOT NULL,
  `created` datetime(6) NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`key`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `authtoken_token_user_id_35299eff_fk_users_user_id` FOREIGN KEY (`user_id`) REFERENCES `users_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authtoken_token`
--

LOCK TABLES `authtoken_token` WRITE;
/*!40000 ALTER TABLE `authtoken_token` DISABLE KEYS */;
INSERT INTO `authtoken_token` VALUES ('2562313642f8a5f95ab03b52f40d20b5b3acebfd','2020-05-21 12:01:53.160939',5),('733d71dc994cd0e89f3932ea39fe0e9a6d6cdde8','2020-05-21 11:57:51.212174',3),('8a5e648d121382eff7028e75b8f0c89ee4e2b70b','2020-05-21 11:40:37.754518',1),('c34a4341803a749593eb9c4ae1568948900d645e','2020-05-21 11:47:05.149183',2),('de18c967928ad72fbe9a941fe07d5f9f030c572d','2020-05-21 12:00:04.515494',4);
/*!40000 ALTER TABLE `authtoken_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_users_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_users_user_id` FOREIGN KEY (`user_id`) REFERENCES `users_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2020-05-21 11:45:53.468885','1','India 1',1,'[{\"added\": {}}]',9,1),(2,'2020-05-21 11:46:08.036427','2','Haryana 2',1,'[{\"added\": {}}]',9,1),(3,'2020-05-21 11:46:21.705312','3','Faridabad 3',1,'[{\"added\": {}}]',9,1),(4,'2020-05-22 02:17:51.089317','1','Content object (1)',1,'[{\"added\": {}}]',23,1),(5,'2020-05-22 02:18:39.474474','1','Ajinkya ',2,'[{\"changed\": {\"fields\": [\"User\"]}}]',23,1),(6,'2020-05-22 02:18:51.135864','1','Ajinkya ',2,'[]',23,1),(7,'2020-05-22 02:19:24.174014','2','Ajinkya ',1,'[{\"added\": {}}]',23,1),(8,'2020-05-22 02:20:11.793346','3','Ajinkya ',1,'[{\"added\": {}}]',23,1),(9,'2020-05-22 02:20:45.926035','4','Ajinkya ',1,'[{\"added\": {}}]',23,1),(10,'2020-05-22 02:24:31.227215','5','Andrew ',1,'[{\"added\": {}}]',23,1),(11,'2020-05-22 02:26:08.455463','6','Andrew ',1,'[{\"added\": {}}]',23,1),(12,'2020-05-22 02:26:39.279889','7','Andrew ',1,'[{\"added\": {}}]',23,1),(13,'2020-05-22 02:27:13.324602','8','Andrew ',1,'[{\"added\": {}}]',23,1),(14,'2020-05-22 02:28:07.430925','9','Axar ',1,'[{\"added\": {}}]',23,1),(15,'2020-05-22 02:28:40.075073','10','Axar ',1,'[{\"added\": {}}]',23,1),(16,'2020-05-22 02:29:20.665857','11','Axar ',1,'[{\"added\": {}}]',23,1),(17,'2020-05-22 02:29:47.333784','12','Axar ',1,'[{\"added\": {}}]',23,1),(18,'2020-05-22 02:30:20.688504','13','Bengemin ',1,'[{\"added\": {}}]',23,1),(19,'2020-05-22 02:30:51.999795','14','Bengemin ',1,'[{\"added\": {}}]',23,1),(20,'2020-05-22 02:31:15.670268','15','Bengemin ',1,'[{\"added\": {}}]',23,1),(21,'2020-05-22 02:31:53.075038','16','Bengemin ',1,'[{\"added\": {}}]',23,1),(22,'2020-06-03 13:40:29.227716','17','Ajinkya ',1,'[{\"added\": {}}]',23,1),(23,'2020-06-03 13:41:34.454491','18','Ajinkya ',1,'[{\"added\": {}}]',23,1),(24,'2020-06-03 13:42:06.661617','19','Ajinkya ',1,'[{\"added\": {}}]',23,1),(25,'2020-06-03 13:42:49.226778','20','Ajinkya ',1,'[{\"added\": {}}]',23,1),(26,'2020-06-04 15:08:40.806981','17','Ajinkya ',2,'[{\"changed\": {\"fields\": [\"media\"]}}]',23,1),(27,'2020-06-04 15:09:33.220064','18','Ajinkya ',2,'[{\"changed\": {\"fields\": [\"media\"]}}]',23,1),(28,'2020-06-04 15:09:54.735302','19','Ajinkya ',2,'[{\"changed\": {\"fields\": [\"media\"]}}]',23,1),(29,'2020-06-04 15:10:13.833682','20','Ajinkya ',2,'[{\"changed\": {\"fields\": [\"media\"]}}]',23,1),(30,'2020-06-06 02:08:19.364093','14','Bengemin ',3,'',23,1),(31,'2020-06-06 02:08:19.820429','13','Bengemin ',3,'',23,1),(32,'2020-06-06 02:08:20.019037','11','Axar ',3,'',23,1),(33,'2020-06-06 02:08:20.311446','10','Axar ',3,'',23,1),(34,'2020-06-06 02:08:20.742015','8','Andrew ',3,'',23,1),(35,'2020-06-06 02:08:20.951071','7','Andrew ',3,'',23,1),(36,'2020-06-06 02:08:21.343416','4','Ajinkya ',3,'',23,1),(37,'2020-06-06 02:08:22.105870','3','Ajinkya ',3,'',23,1),(38,'2020-06-06 02:08:30.465271','20','Ajinkya ',3,'',23,1),(39,'2020-06-06 02:08:37.233051','19','Ajinkya ',3,'',23,1),(40,'2020-06-06 02:08:53.810344','18','Ajinkya ',3,'',23,1),(41,'2020-06-06 02:17:44.966570','21','Ajinkya ',1,'[{\"added\": {}}]',23,1),(42,'2020-06-06 02:18:26.994002','22','Ajinkya ',1,'[{\"added\": {}}]',23,1),(43,'2020-06-06 02:19:06.930564','23','Ajinkya ',1,'[{\"added\": {}}]',23,1),(44,'2020-06-06 16:06:01.721580','24','Bengemin ',1,'[{\"added\": {}}]',23,1),(45,'2020-06-06 16:06:47.939619','25','Axar ',1,'[{\"added\": {}}]',23,1),(46,'2020-06-06 16:08:20.515350','26','Andrew ',1,'[{\"added\": {}}]',23,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(6,'authtoken','token'),(19,'Chat','chat'),(20,'Chat','chatcontent'),(21,'Content','advertisement'),(30,'Content','advertisementcategorymapping'),(22,'Content','comment'),(28,'Content','commentreply'),(23,'Content','content'),(29,'Content','contentcategorymapping'),(24,'Content','contentuser'),(27,'Content','like'),(26,'Content','spamreport'),(25,'Content','view'),(4,'contenttypes','contenttype'),(15,'Notification','chatnotification'),(18,'Notification','contentnotification'),(16,'Notification','notificationcontent'),(17,'Notification','usernotification'),(5,'sessions','session'),(8,'users','advertisepartner'),(14,'users','contentmonitoradmin'),(9,'users','cscdetails'),(13,'users','division'),(12,'users','findyouuser'),(10,'users','invalidlogin'),(7,'users','user'),(11,'users','userotp');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'Chat','0001_initial','2020-05-21 11:39:37.478594'),(2,'Content','0001_initial','2020-05-21 11:39:41.269374'),(3,'Notification','0001_initial','2020-05-21 11:39:46.833813'),(4,'contenttypes','0001_initial','2020-05-21 11:39:47.965237'),(5,'contenttypes','0002_remove_content_type_name','2020-05-21 11:39:52.556869'),(6,'auth','0001_initial','2020-05-21 11:39:54.737750'),(7,'auth','0002_alter_permission_name_max_length','2020-05-21 11:39:57.267985'),(8,'auth','0003_alter_user_email_max_length','2020-05-21 11:39:57.313540'),(9,'auth','0004_alter_user_username_opts','2020-05-21 11:39:57.354557'),(10,'auth','0005_alter_user_last_login_null','2020-05-21 11:39:57.388412'),(11,'auth','0006_require_contenttypes_0002','2020-05-21 11:39:57.424637'),(12,'auth','0007_alter_validators_add_error_messages','2020-05-21 11:39:57.465279'),(13,'auth','0008_alter_user_username_max_length','2020-05-21 11:39:57.507009'),(14,'auth','0009_alter_user_last_name_max_length','2020-05-21 11:39:57.547749'),(15,'auth','0010_alter_group_name_max_length','2020-05-21 11:39:57.653803'),(16,'auth','0011_update_proxy_permissions','2020-05-21 11:39:57.709719'),(17,'users','0001_initial','2020-05-21 11:40:02.792664'),(18,'admin','0001_initial','2020-05-21 11:40:10.283007'),(19,'admin','0002_logentry_remove_auto_add','2020-05-21 11:40:11.703966'),(20,'admin','0003_logentry_add_action_flag_choices','2020-05-21 11:40:11.762961'),(21,'authtoken','0001_initial','2020-05-21 11:40:12.121222'),(22,'authtoken','0002_auto_20160226_1747','2020-05-21 11:40:13.656776'),(23,'sessions','0001_initial','2020-05-21 11:40:13.974307'),(24,'Content','0002_auto_20200522_0711','2020-05-22 01:41:57.514679'),(25,'Content','0003_auto_20200522_0740','2020-05-22 02:10:14.679483'),(26,'Content','0004_auto_20200522_0746','2020-05-22 02:16:39.164456');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('1w3ngt1bbh8xqmrt9j9w8tl96q8htm3w','OGVjNTk5YWM1YWY5Mjc2NDQyNzU2MjFiNTUxZWQwNjQ1NDBjNWNhZDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJkZTMwNTM5MDJjYjNmZjRlMWRmNjEyZWFmOWI5MmZiMmIwNjhiYjI0In0=','2020-06-20 02:07:43.735002'),('muj50r4y3mixf86yyurlyk3zv3c9fdh7','OGVjNTk5YWM1YWY5Mjc2NDQyNzU2MjFiNTUxZWQwNjQ1NDBjNWNhZDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJkZTMwNTM5MDJjYjNmZjRlMWRmNjEyZWFmOWI5MmZiMmIwNjhiYjI0In0=','2020-06-20 16:04:38.288987'),('q6csji330iu0n039yg5zt8xf4ws0j6ig','NTU2NmNkMTEyMzkzMjc5NGQzODk2OTNiYTIyNmU4OGRmMTEyN2RiYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJkMTEyYjM4MzBmZDM1NGYzM2QyZmNmMWJiN2ZlNjlmNTBjNjhmOWI2In0=','2020-06-17 13:39:47.744449'),('w27y1f14yjw2cmla7xxuh88f9q3xeyun','NTU2NmNkMTEyMzkzMjc5NGQzODk2OTNiYTIyNmU4OGRmMTEyN2RiYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJkMTEyYjM4MzBmZDM1NGYzM2QyZmNmMWJiN2ZlNjlmNTBjNjhmOWI2In0=','2020-06-04 11:41:01.540552'),('zzhfzccr85jg7rv3opcddjdvjabc96t1','OGVjNTk5YWM1YWY5Mjc2NDQyNzU2MjFiNTUxZWQwNjQ1NDBjNWNhZDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJkZTMwNTM5MDJjYjNmZjRlMWRmNjEyZWFmOWI5MmZiMmIwNjhiYjI0In0=','2020-06-18 15:08:02.734596');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_advertisepartner`
--

DROP TABLE IF EXISTS `users_advertisepartner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_advertisepartner` (
  `id` int NOT NULL AUTO_INCREMENT,
  `added_on` datetime(6) NOT NULL,
  `updated_on` datetime(6) NOT NULL,
  `updated_by` varchar(100) DEFAULT NULL,
  `object_status` smallint NOT NULL,
  `name` varchar(200) NOT NULL,
  `email` varchar(255) NOT NULL,
  `mobile` bigint NOT NULL,
  `companyname` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_advertisepartner`
--

LOCK TABLES `users_advertisepartner` WRITE;
/*!40000 ALTER TABLE `users_advertisepartner` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_advertisepartner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_contentmonitoradmin`
--

DROP TABLE IF EXISTS `users_contentmonitoradmin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_contentmonitoradmin` (
  `id` int NOT NULL AUTO_INCREMENT,
  `added_on` datetime(6) NOT NULL,
  `updated_on` datetime(6) NOT NULL,
  `updated_by` varchar(100) DEFAULT NULL,
  `object_status` smallint NOT NULL,
  `content_type` int NOT NULL,
  `region_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  KEY `users_contentmonitor_region_id_7af2aa93_fk_users_div` (`region_id`),
  CONSTRAINT `users_contentmonitor_region_id_7af2aa93_fk_users_div` FOREIGN KEY (`region_id`) REFERENCES `users_division` (`id`),
  CONSTRAINT `users_contentmonitoradmin_user_id_8dd69c56_fk_users_user_id` FOREIGN KEY (`user_id`) REFERENCES `users_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_contentmonitoradmin`
--

LOCK TABLES `users_contentmonitoradmin` WRITE;
/*!40000 ALTER TABLE `users_contentmonitoradmin` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_contentmonitoradmin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_cscdetails`
--

DROP TABLE IF EXISTS `users_cscdetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_cscdetails` (
  `id` int NOT NULL AUTO_INCREMENT,
  `added_on` datetime(6) NOT NULL,
  `updated_on` datetime(6) NOT NULL,
  `updated_by` varchar(100) DEFAULT NULL,
  `object_status` smallint NOT NULL,
  `label` varchar(50) DEFAULT NULL,
  `csc_type` int DEFAULT NULL,
  `parent_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `users_cscdetails_parent_id_f5ec93cf_fk_users_cscdetails_id` (`parent_id`),
  CONSTRAINT `users_cscdetails_parent_id_f5ec93cf_fk_users_cscdetails_id` FOREIGN KEY (`parent_id`) REFERENCES `users_cscdetails` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_cscdetails`
--

LOCK TABLES `users_cscdetails` WRITE;
/*!40000 ALTER TABLE `users_cscdetails` DISABLE KEYS */;
INSERT INTO `users_cscdetails` VALUES (1,'2020-05-21 11:45:53.467729','2020-05-21 11:45:53.467786',NULL,0,'India',1,NULL),(2,'2020-05-21 11:46:08.035704','2020-05-21 11:46:08.035742',NULL,0,'Haryana',2,1),(3,'2020-05-21 11:46:21.704414','2020-05-21 11:46:21.704466',NULL,0,'Faridabad',3,2);
/*!40000 ALTER TABLE `users_cscdetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_division`
--

DROP TABLE IF EXISTS `users_division`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_division` (
  `id` int NOT NULL AUTO_INCREMENT,
  `added_on` datetime(6) NOT NULL,
  `updated_on` datetime(6) NOT NULL,
  `updated_by` varchar(100) DEFAULT NULL,
  `object_status` smallint NOT NULL,
  `label` varchar(150) NOT NULL,
  `csc_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `users_division_csc_id_08ebe0bf_fk_users_cscdetails_id` (`csc_id`),
  CONSTRAINT `users_division_csc_id_08ebe0bf_fk_users_cscdetails_id` FOREIGN KEY (`csc_id`) REFERENCES `users_cscdetails` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_division`
--

LOCK TABLES `users_division` WRITE;
/*!40000 ALTER TABLE `users_division` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_division` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_findyouuser`
--

DROP TABLE IF EXISTS `users_findyouuser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_findyouuser` (
  `id` int NOT NULL AUTO_INCREMENT,
  `added_on` datetime(6) NOT NULL,
  `updated_on` datetime(6) NOT NULL,
  `updated_by` varchar(100) DEFAULT NULL,
  `object_status` smallint NOT NULL,
  `coverpic` varchar(100) DEFAULT NULL,
  `description` longtext,
  `primecreater` tinyint(1) NOT NULL,
  `Interest` longtext,
  `BlockList` longtext,
  `contentViewpercent` double DEFAULT NULL,
  `post` bigint DEFAULT NULL,
  `subscriber` bigint DEFAULT NULL,
  `subscriberUser` longtext,
  `subscribing` bigint DEFAULT NULL,
  `subscribingUser` longtext,
  `saved_content` longtext,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `users_findyouuser_user_id_53319659_fk_users_user_id` FOREIGN KEY (`user_id`) REFERENCES `users_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_findyouuser`
--

LOCK TABLES `users_findyouuser` WRITE;
/*!40000 ALTER TABLE `users_findyouuser` DISABLE KEYS */;
INSERT INTO `users_findyouuser` VALUES (1,'2020-05-21 11:47:05.488482','2020-05-21 11:47:05.488584',NULL,0,'',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2),(2,'2020-05-21 11:57:51.560204','2020-05-21 11:57:51.560260',NULL,0,'',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3),(3,'2020-05-21 12:00:04.831499','2020-05-21 12:00:04.831620',NULL,0,'',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4),(4,'2020-05-21 12:01:53.429173','2020-05-21 12:01:53.429220',NULL,0,'',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5);
/*!40000 ALTER TABLE `users_findyouuser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_invalidlogin`
--

DROP TABLE IF EXISTS `users_invalidlogin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_invalidlogin` (
  `id` int NOT NULL AUTO_INCREMENT,
  `added_on` datetime(6) NOT NULL,
  `updated_on` datetime(6) NOT NULL,
  `updated_by` varchar(100) DEFAULT NULL,
  `object_status` smallint NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `message` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_invalidlogin`
--

LOCK TABLES `users_invalidlogin` WRITE;
/*!40000 ALTER TABLE `users_invalidlogin` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_invalidlogin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_user`
--

DROP TABLE IF EXISTS `users_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(60) NOT NULL,
  `firstName` varchar(255) DEFAULT NULL,
  `lastName` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `mobile` varchar(50) NOT NULL,
  `profile_picture` varchar(100) NOT NULL,
  `gender` smallint unsigned DEFAULT NULL,
  `role` smallint unsigned NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `city_id` int DEFAULT NULL,
  `country_id` int DEFAULT NULL,
  `state_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  KEY `users_user_city_id_c42179af_fk_users_cscdetails_id` (`city_id`),
  KEY `users_user_country_id_8d012484_fk_users_cscdetails_id` (`country_id`),
  KEY `users_user_state_id_cfdd9817_fk_users_cscdetails_id` (`state_id`),
  CONSTRAINT `users_user_city_id_c42179af_fk_users_cscdetails_id` FOREIGN KEY (`city_id`) REFERENCES `users_cscdetails` (`id`),
  CONSTRAINT `users_user_country_id_8d012484_fk_users_cscdetails_id` FOREIGN KEY (`country_id`) REFERENCES `users_cscdetails` (`id`),
  CONSTRAINT `users_user_state_id_cfdd9817_fk_users_cscdetails_id` FOREIGN KEY (`state_id`) REFERENCES `users_cscdetails` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_user`
--

LOCK TABLES `users_user` WRITE;
/*!40000 ALTER TABLE `users_user` DISABLE KEYS */;
INSERT INTO `users_user` VALUES (1,'pbkdf2_sha256$150000$d7uyqm9WxtAc$3VHR69ZQ7rRHsfxBx/YIOA6oNOmkND2EEEkJqgTFA94=','2020-06-06 16:04:37.737209',1,'admin','Ajinkya','','admin@gmail.com','9540042889','',NULL,2,1,1,3,1,2),(2,'pbkdf2_sha256$180000$jKVsjqaaCvrP$DWi4RXhQw2x7wMBDWnlUJEQxZFHnqIyaZH1Kj8zER64=',NULL,0,'9540042880','Ajinkya','','ajinkya@gmail.com','9540042880','ajinkyadelhi.png',NULL,2,1,0,3,1,2),(3,'pbkdf2_sha256$180000$Jj9MB4QqGUPl$VeIlwcnbjx/d0+goDUP4EVaP8QcupCmnYVDzFiATQd8=',NULL,0,'9540042881','Andrew','','andrew@gmail.com','9540042881','andrewrajasthan.png',NULL,2,1,0,3,1,2),(4,'pbkdf2_sha256$180000$WzlnyYx6yQIQ$rP3z5d9uVtSfmW2fbHx5OwI601ka6IOE4a5mOJDii0E=',NULL,0,'9540042882','Axar','','axar@gmail.com','9540042882','axardelhi.png',NULL,2,1,0,3,1,2),(5,'pbkdf2_sha256$180000$E17kghWCiocs$pVrwZsD+XIxmp9DXSrLhg2DsLTnXwqdXrLxtxjCVMvk=',NULL,0,'9540042883','Bengemin','','ben@gmail.com','9540042883','benrajasthan.png',NULL,2,1,0,3,1,2);
/*!40000 ALTER TABLE `users_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_user_groups`
--

DROP TABLE IF EXISTS `users_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_user_groups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_user_groups_user_id_group_id_b88eab82_uniq` (`user_id`,`group_id`),
  KEY `users_user_groups_group_id_9afc8d0e_fk_auth_group_id` (`group_id`),
  CONSTRAINT `users_user_groups_group_id_9afc8d0e_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `users_user_groups_user_id_5f6f5a90_fk_users_user_id` FOREIGN KEY (`user_id`) REFERENCES `users_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_user_groups`
--

LOCK TABLES `users_user_groups` WRITE;
/*!40000 ALTER TABLE `users_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_user_user_permissions`
--

DROP TABLE IF EXISTS `users_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_user_user_permissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_user_user_permissions_user_id_permission_id_43338c45_uniq` (`user_id`,`permission_id`),
  KEY `users_user_user_perm_permission_id_0b93982e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `users_user_user_perm_permission_id_0b93982e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `users_user_user_permissions_user_id_20aca447_fk_users_user_id` FOREIGN KEY (`user_id`) REFERENCES `users_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_user_user_permissions`
--

LOCK TABLES `users_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `users_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_userotp`
--

DROP TABLE IF EXISTS `users_userotp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_userotp` (
  `id` int NOT NULL AUTO_INCREMENT,
  `added_on` datetime(6) NOT NULL,
  `updated_on` datetime(6) NOT NULL,
  `updated_by` varchar(100) DEFAULT NULL,
  `object_status` smallint NOT NULL,
  `otp` varchar(6) NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `users_userotp_user_id_7b41e28a_fk_users_user_id` (`user_id`),
  CONSTRAINT `users_userotp_user_id_7b41e28a_fk_users_user_id` FOREIGN KEY (`user_id`) REFERENCES `users_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_userotp`
--

LOCK TABLES `users_userotp` WRITE;
/*!40000 ALTER TABLE `users_userotp` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_userotp` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-06-06 21:39:47
