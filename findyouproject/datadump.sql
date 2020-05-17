-- MySQL dump 10.13  Distrib 5.7.30, for Linux (x86_64)
--
-- Host: localhost    Database: findyou
-- ------------------------------------------------------
-- Server version	5.7.30-0ubuntu0.18.04.1

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
-- Table structure for table `Chat_chat`
--

DROP TABLE IF EXISTS `Chat_chat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Chat_chat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `added_on` datetime(6) NOT NULL,
  `updated_on` datetime(6) NOT NULL,
  `updated_by` varchar(100) DEFAULT NULL,
  `title` varchar(200) DEFAULT NULL,
  `contentid` bigint(20) DEFAULT NULL,
  `profile_pic` varchar(100) NOT NULL,
  `chattype` int(11) NOT NULL,
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Chat_chatcontent` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `added_on` datetime(6) NOT NULL,
  `updated_on` datetime(6) NOT NULL,
  `updated_by` varchar(100) DEFAULT NULL,
  `chat` bigint(20) NOT NULL,
  `text` longtext,
  `media` varchar(100) DEFAULT NULL,
  `seenstatus` int(11) NOT NULL,
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Content_advertisement` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `added_on` datetime(6) NOT NULL,
  `updated_on` datetime(6) NOT NULL,
  `updated_by` varchar(100) DEFAULT NULL,
  `user` bigint(20) NOT NULL,
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
-- Table structure for table `Content_comment`
--

DROP TABLE IF EXISTS `Content_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Content_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `added_on` datetime(6) NOT NULL,
  `updated_on` datetime(6) NOT NULL,
  `updated_by` varchar(100) DEFAULT NULL,
  `decription` longtext NOT NULL,
  `comment_by` bigint(20) NOT NULL,
  `like` bigint(20) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL,
  `adv_id` int(11) DEFAULT NULL,
  `content_id` int(11) DEFAULT NULL,
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Content_commentreply` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `added_on` datetime(6) NOT NULL,
  `updated_on` datetime(6) NOT NULL,
  `updated_by` varchar(100) DEFAULT NULL,
  `comment_by` bigint(20) NOT NULL,
  `decription` longtext NOT NULL,
  `like` bigint(20) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL,
  `comment_id` int(11) NOT NULL,
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Content_content` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `added_on` datetime(6) NOT NULL,
  `updated_on` datetime(6) NOT NULL,
  `updated_by` varchar(100) DEFAULT NULL,
  `user` bigint(20) NOT NULL,
  `description` longtext,
  `category` int(11) NOT NULL,
  `country` bigint(20) NOT NULL,
  `state` bigint(20) NOT NULL,
  `city` bigint(20) NOT NULL,
  `place` varchar(100) DEFAULT NULL,
  `contenttype` int(11) NOT NULL,
  `associate_media` varchar(100) NOT NULL,
  `fontfamilly` varchar(150) DEFAULT NULL,
  `media` varchar(100) NOT NULL,
  `medialist` longtext,
  `chatInvited` tinyint(1) NOT NULL,
  `commentinvited` tinyint(1) NOT NULL,
  `notappropriate` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Content_content`
--

LOCK TABLES `Content_content` WRITE;
/*!40000 ALTER TABLE `Content_content` DISABLE KEYS */;
/*!40000 ALTER TABLE `Content_content` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Content_cscdetails`
--

DROP TABLE IF EXISTS `Content_cscdetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Content_cscdetails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `added_on` datetime(6) NOT NULL,
  `updated_on` datetime(6) NOT NULL,
  `updated_by` varchar(100) DEFAULT NULL,
  `label` varchar(50) DEFAULT NULL,
  `csc_type` int(11) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Content_cscdetails_parent_id_c2ce420d_fk_Content_cscdetails_id` (`parent_id`),
  CONSTRAINT `Content_cscdetails_parent_id_c2ce420d_fk_Content_cscdetails_id` FOREIGN KEY (`parent_id`) REFERENCES `Content_cscdetails` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Content_cscdetails`
--

LOCK TABLES `Content_cscdetails` WRITE;
/*!40000 ALTER TABLE `Content_cscdetails` DISABLE KEYS */;
/*!40000 ALTER TABLE `Content_cscdetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Content_like`
--

DROP TABLE IF EXISTS `Content_like`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Content_like` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `added_on` datetime(6) NOT NULL,
  `updated_on` datetime(6) NOT NULL,
  `updated_by` varchar(100) DEFAULT NULL,
  `liked_by` bigint(20) NOT NULL,
  `adv_id` int(11) DEFAULT NULL,
  `content_id` int(11) DEFAULT NULL,
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Content_spamreport` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `added_on` datetime(6) NOT NULL,
  `updated_on` datetime(6) NOT NULL,
  `updated_by` varchar(100) DEFAULT NULL,
  `reported_by` bigint(20) NOT NULL,
  `decription` longtext NOT NULL,
  `content_id` int(11) NOT NULL,
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Content_view` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `added_on` datetime(6) NOT NULL,
  `updated_on` datetime(6) NOT NULL,
  `updated_by` varchar(100) DEFAULT NULL,
  `adv_id` int(11) DEFAULT NULL,
  `content_id` int(11) DEFAULT NULL,
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Notification_chatnotification` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `added_on` datetime(6) NOT NULL,
  `updated_on` datetime(6) NOT NULL,
  `updated_by` varchar(100) DEFAULT NULL,
  `chat` bigint(20) NOT NULL,
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Notification_contentnotification` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `added_on` datetime(6) NOT NULL,
  `updated_on` datetime(6) NOT NULL,
  `updated_by` varchar(100) DEFAULT NULL,
  `content` bigint(20) NOT NULL,
  `description` varchar(150) NOT NULL,
  `contentstatement` longtext NOT NULL,
  PRIMARY KEY (`id`)
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
-- Table structure for table `Notification_usernotification`
--

DROP TABLE IF EXISTS `Notification_usernotification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Notification_usernotification` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `added_on` datetime(6) NOT NULL,
  `updated_on` datetime(6) NOT NULL,
  `updated_by` varchar(100) DEFAULT NULL,
  `chat` bigint(20) NOT NULL,
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=109 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add content type',4,'add_contenttype'),(14,'Can change content type',4,'change_contenttype'),(15,'Can delete content type',4,'delete_contenttype'),(16,'Can view content type',4,'view_contenttype'),(17,'Can add session',5,'add_session'),(18,'Can change session',5,'change_session'),(19,'Can delete session',5,'delete_session'),(20,'Can view session',5,'view_session'),(21,'Can add Token',6,'add_token'),(22,'Can change Token',6,'change_token'),(23,'Can delete Token',6,'delete_token'),(24,'Can view Token',6,'view_token'),(25,'Can add user',7,'add_user'),(26,'Can change user',7,'change_user'),(27,'Can delete user',7,'delete_user'),(28,'Can view user',7,'view_user'),(29,'Can add advertise partner',8,'add_advertisepartner'),(30,'Can change advertise partner',8,'change_advertisepartner'),(31,'Can delete advertise partner',8,'delete_advertisepartner'),(32,'Can view advertise partner',8,'view_advertisepartner'),(33,'Can add csc details',9,'add_cscdetails'),(34,'Can change csc details',9,'change_cscdetails'),(35,'Can delete csc details',9,'delete_cscdetails'),(36,'Can view csc details',9,'view_cscdetails'),(37,'Can add invalid login',10,'add_invalidlogin'),(38,'Can change invalid login',10,'change_invalidlogin'),(39,'Can delete invalid login',10,'delete_invalidlogin'),(40,'Can view invalid login',10,'view_invalidlogin'),(41,'Can add user otp',11,'add_userotp'),(42,'Can change user otp',11,'change_userotp'),(43,'Can delete user otp',11,'delete_userotp'),(44,'Can view user otp',11,'view_userotp'),(45,'Can add findyou user',12,'add_findyouuser'),(46,'Can change findyou user',12,'change_findyouuser'),(47,'Can delete findyou user',12,'delete_findyouuser'),(48,'Can view findyou user',12,'view_findyouuser'),(49,'Can add division',13,'add_division'),(50,'Can change division',13,'change_division'),(51,'Can delete division',13,'delete_division'),(52,'Can view division',13,'view_division'),(53,'Can add content monitor admin',14,'add_contentmonitoradmin'),(54,'Can change content monitor admin',14,'change_contentmonitoradmin'),(55,'Can delete content monitor admin',14,'delete_contentmonitoradmin'),(56,'Can view content monitor admin',14,'view_contentmonitoradmin'),(57,'Can add chat notification',15,'add_chatnotification'),(58,'Can change chat notification',15,'change_chatnotification'),(59,'Can delete chat notification',15,'delete_chatnotification'),(60,'Can view chat notification',15,'view_chatnotification'),(61,'Can add content notification',16,'add_contentnotification'),(62,'Can change content notification',16,'change_contentnotification'),(63,'Can delete content notification',16,'delete_contentnotification'),(64,'Can view content notification',16,'view_contentnotification'),(65,'Can add user notification',17,'add_usernotification'),(66,'Can change user notification',17,'change_usernotification'),(67,'Can delete user notification',17,'delete_usernotification'),(68,'Can view user notification',17,'view_usernotification'),(69,'Can add chat',18,'add_chat'),(70,'Can change chat',18,'change_chat'),(71,'Can delete chat',18,'delete_chat'),(72,'Can view chat',18,'view_chat'),(73,'Can add chat content',19,'add_chatcontent'),(74,'Can change chat content',19,'change_chatcontent'),(75,'Can delete chat content',19,'delete_chatcontent'),(76,'Can view chat content',19,'view_chatcontent'),(77,'Can add advertisement',20,'add_advertisement'),(78,'Can change advertisement',20,'change_advertisement'),(79,'Can delete advertisement',20,'delete_advertisement'),(80,'Can view advertisement',20,'view_advertisement'),(81,'Can add comment',21,'add_comment'),(82,'Can change comment',21,'change_comment'),(83,'Can delete comment',21,'delete_comment'),(84,'Can view comment',21,'view_comment'),(85,'Can add content',22,'add_content'),(86,'Can change content',22,'change_content'),(87,'Can delete content',22,'delete_content'),(88,'Can view content',22,'view_content'),(89,'Can add view',23,'add_view'),(90,'Can change view',23,'change_view'),(91,'Can delete view',23,'delete_view'),(92,'Can view view',23,'view_view'),(93,'Can add spam report',24,'add_spamreport'),(94,'Can change spam report',24,'change_spamreport'),(95,'Can delete spam report',24,'delete_spamreport'),(96,'Can view spam report',24,'view_spamreport'),(97,'Can add like',25,'add_like'),(98,'Can change like',25,'change_like'),(99,'Can delete like',25,'delete_like'),(100,'Can view like',25,'view_like'),(101,'Can add csc details',26,'add_cscdetails'),(102,'Can change csc details',26,'change_cscdetails'),(103,'Can delete csc details',26,'delete_cscdetails'),(104,'Can view csc details',26,'view_cscdetails'),(105,'Can add comment reply',27,'add_commentreply'),(106,'Can change comment reply',27,'change_commentreply'),(107,'Can delete comment reply',27,'delete_commentreply'),(108,'Can view comment reply',27,'view_commentreply');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authtoken_token`
--

DROP TABLE IF EXISTS `authtoken_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `authtoken_token` (
  `key` varchar(40) NOT NULL,
  `created` datetime(6) NOT NULL,
  `user_id` int(11) NOT NULL,
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
INSERT INTO `authtoken_token` VALUES ('1fbd3d590c5c28e45d4a96dabf15772f5f59a7d6','2020-05-16 12:52:33.260551',2);
/*!40000 ALTER TABLE `authtoken_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_users_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_users_user_id` FOREIGN KEY (`user_id`) REFERENCES `users_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(6,'authtoken','token'),(18,'Chat','chat'),(19,'Chat','chatcontent'),(20,'Content','advertisement'),(21,'Content','comment'),(27,'Content','commentreply'),(22,'Content','content'),(26,'Content','cscdetails'),(25,'Content','like'),(24,'Content','spamreport'),(23,'Content','view'),(4,'contenttypes','contenttype'),(15,'Notification','chatnotification'),(16,'Notification','contentnotification'),(17,'Notification','usernotification'),(5,'sessions','session'),(8,'users','advertisepartner'),(14,'users','contentmonitoradmin'),(9,'users','cscdetails'),(13,'users','division'),(12,'users','findyouuser'),(10,'users','invalidlogin'),(7,'users','user'),(11,'users','userotp');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'Chat','0001_initial','2020-05-16 12:46:47.862327'),(2,'Content','0001_initial','2020-05-16 12:46:50.719298'),(3,'Notification','0001_initial','2020-05-16 12:46:58.294516'),(4,'contenttypes','0001_initial','2020-05-16 12:46:58.889621'),(5,'contenttypes','0002_remove_content_type_name','2020-05-16 12:46:59.953894'),(6,'auth','0001_initial','2020-05-16 12:47:00.910008'),(7,'auth','0002_alter_permission_name_max_length','2020-05-16 12:47:03.735068'),(8,'auth','0003_alter_user_email_max_length','2020-05-16 12:47:03.773324'),(9,'auth','0004_alter_user_username_opts','2020-05-16 12:47:03.822155'),(10,'auth','0005_alter_user_last_login_null','2020-05-16 12:47:03.863638'),(11,'auth','0006_require_contenttypes_0002','2020-05-16 12:47:03.908402'),(12,'auth','0007_alter_validators_add_error_messages','2020-05-16 12:47:03.947388'),(13,'auth','0008_alter_user_username_max_length','2020-05-16 12:47:03.988748'),(14,'auth','0009_alter_user_last_name_max_length','2020-05-16 12:47:04.025314'),(15,'auth','0010_alter_group_name_max_length','2020-05-16 12:47:04.134845'),(16,'auth','0011_update_proxy_permissions','2020-05-16 12:47:04.204023'),(17,'users','0001_initial','2020-05-16 12:47:07.266454'),(18,'admin','0001_initial','2020-05-16 12:47:19.925343'),(19,'admin','0002_logentry_remove_auto_add','2020-05-16 12:47:21.423356'),(20,'admin','0003_logentry_add_action_flag_choices','2020-05-16 12:47:21.477664'),(21,'authtoken','0001_initial','2020-05-16 12:47:21.873992'),(22,'authtoken','0002_auto_20160226_1747','2020-05-16 12:47:23.359353'),(23,'sessions','0001_initial','2020-05-16 12:47:23.666526');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
INSERT INTO `django_session` VALUES ('2powcu7fhxqnxxltva4kdsn82bk9bb6f','YTYwZTFhYmQ3NDdmMGJlY2YwNjNhNmM0NjI3MTIyYTNhZjUxNzE4MDp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJlOWFlNDE1ZDg3NWUwYWM4ZjNkMmJkNjRiOGU2ZjYzNWQ4YTdhNDIzIn0=','2020-05-30 12:54:12.508904');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_advertisepartner`
--

DROP TABLE IF EXISTS `users_advertisepartner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_advertisepartner` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `added_on` datetime(6) NOT NULL,
  `updated_on` datetime(6) NOT NULL,
  `updated_by` varchar(100) DEFAULT NULL,
  `name` varchar(200) NOT NULL,
  `email` varchar(255) NOT NULL,
  `mobile` bigint(20) NOT NULL,
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_contentmonitoradmin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `added_on` datetime(6) NOT NULL,
  `updated_on` datetime(6) NOT NULL,
  `updated_by` varchar(100) DEFAULT NULL,
  `content_type` int(11) NOT NULL,
  `region_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_cscdetails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `added_on` datetime(6) NOT NULL,
  `updated_on` datetime(6) NOT NULL,
  `updated_by` varchar(100) DEFAULT NULL,
  `label` varchar(50) DEFAULT NULL,
  `csc_type` int(11) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `users_cscdetails_parent_id_f5ec93cf_fk_users_cscdetails_id` (`parent_id`),
  CONSTRAINT `users_cscdetails_parent_id_f5ec93cf_fk_users_cscdetails_id` FOREIGN KEY (`parent_id`) REFERENCES `users_cscdetails` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_cscdetails`
--

LOCK TABLES `users_cscdetails` WRITE;
/*!40000 ALTER TABLE `users_cscdetails` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_cscdetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_division`
--

DROP TABLE IF EXISTS `users_division`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_division` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `added_on` datetime(6) NOT NULL,
  `updated_on` datetime(6) NOT NULL,
  `updated_by` varchar(100) DEFAULT NULL,
  `label` varchar(150) NOT NULL,
  `csc_id` int(11) DEFAULT NULL,
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_findyouuser` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `added_on` datetime(6) NOT NULL,
  `updated_on` datetime(6) NOT NULL,
  `updated_by` varchar(100) DEFAULT NULL,
  `coverpic` varchar(100) NOT NULL,
  `Description` longtext,
  `primecreater` tinyint(1) NOT NULL,
  `Interest` longtext,
  `BlockList` longtext,
  `contentViewpercent` double DEFAULT NULL,
  `post` bigint(20) DEFAULT NULL,
  `subscriber` bigint(20) DEFAULT NULL,
  `subscriberUser` longtext,
  `subscribing` bigint(20) DEFAULT NULL,
  `subscribingUser` longtext,
  `saved_content` longtext,
  `city_id` int(11) DEFAULT NULL,
  `country_id` int(11) DEFAULT NULL,
  `state_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  KEY `users_findyouuser_city_id_c0924bb4_fk_users_cscdetails_id` (`city_id`),
  KEY `users_findyouuser_country_id_27271a78_fk_users_cscdetails_id` (`country_id`),
  KEY `users_findyouuser_state_id_1e5273f7_fk_users_cscdetails_id` (`state_id`),
  CONSTRAINT `users_findyouuser_city_id_c0924bb4_fk_users_cscdetails_id` FOREIGN KEY (`city_id`) REFERENCES `users_cscdetails` (`id`),
  CONSTRAINT `users_findyouuser_country_id_27271a78_fk_users_cscdetails_id` FOREIGN KEY (`country_id`) REFERENCES `users_cscdetails` (`id`),
  CONSTRAINT `users_findyouuser_state_id_1e5273f7_fk_users_cscdetails_id` FOREIGN KEY (`state_id`) REFERENCES `users_cscdetails` (`id`),
  CONSTRAINT `users_findyouuser_user_id_53319659_fk_users_user_id` FOREIGN KEY (`user_id`) REFERENCES `users_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_findyouuser`
--

LOCK TABLES `users_findyouuser` WRITE;
/*!40000 ALTER TABLE `users_findyouuser` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_findyouuser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_invalidlogin`
--

DROP TABLE IF EXISTS `users_invalidlogin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_invalidlogin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `added_on` datetime(6) NOT NULL,
  `updated_on` datetime(6) NOT NULL,
  `updated_by` varchar(100) DEFAULT NULL,
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(60) NOT NULL,
  `firstName` varchar(255) DEFAULT NULL,
  `lastName` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `mobile` bigint(20) DEFAULT NULL,
  `profile_picture` varchar(100) NOT NULL,
  `gender` smallint(5) unsigned DEFAULT NULL,
  `role` smallint(5) unsigned NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_user`
--

LOCK TABLES `users_user` WRITE;
/*!40000 ALTER TABLE `users_user` DISABLE KEYS */;
INSERT INTO `users_user` VALUES (2,'pbkdf2_sha256$180000$02SICOT5Igvs$/GRAwa9HhvvDqFXhf2TEbzp6rDpFCQQBFI21kmSfddE=','2020-05-16 12:54:12.461239',1,'admin',NULL,NULL,'admin@gmail.com',9540042889,'',NULL,2,1,1);
/*!40000 ALTER TABLE `users_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_user_groups`
--

DROP TABLE IF EXISTS `users_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_userotp` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `added_on` datetime(6) NOT NULL,
  `updated_on` datetime(6) NOT NULL,
  `updated_by` varchar(100) DEFAULT NULL,
  `otp` varchar(6) NOT NULL,
  `user_id` int(11) NOT NULL,
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

-- Dump completed on 2020-05-16 18:42:48
