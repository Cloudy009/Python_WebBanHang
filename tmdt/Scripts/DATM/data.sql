-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: webdownload
-- ------------------------------------------------------
-- Server version	8.0.34
SET PASSWORD FOR 'root'@'localhost' = '';

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-02-27  8:36:30
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: webdownload
-- ------------------------------------------------------
-- Server version	8.0.34

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
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-02-27  8:36:29
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: webdownload
-- ------------------------------------------------------
-- Server version	8.0.34

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
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add category',7,'add_category'),(26,'Can change category',7,'change_category'),(27,'Can delete category',7,'delete_category'),(28,'Can view category',7,'view_category'),(29,'Can add product',8,'add_product'),(30,'Can change product',8,'change_product'),(31,'Can delete product',8,'delete_product'),(32,'Can view product',8,'view_product'),(33,'Can add hoa don',9,'add_hoadon'),(34,'Can change hoa don',9,'change_hoadon'),(35,'Can delete hoa don',9,'delete_hoadon'),(36,'Can view hoa don',9,'view_hoadon'),(37,'Can add detail',10,'add_detail'),(38,'Can change detail',10,'change_detail'),(39,'Can delete detail',10,'delete_detail'),(40,'Can view detail',10,'view_detail'),(41,'Can add cart item',11,'add_cartitem'),(42,'Can change cart item',11,'change_cartitem'),(43,'Can delete cart item',11,'delete_cartitem'),(44,'Can view cart item',11,'view_cartitem'),(45,'Can add message',12,'add_message'),(46,'Can change message',12,'change_message'),(47,'Can delete message',12,'delete_message'),(48,'Can view message',12,'view_message'),(49,'Can add feedback',13,'add_feedback'),(50,'Can change feedback',13,'change_feedback'),(51,'Can delete feedback',13,'delete_feedback'),(52,'Can view feedback',13,'view_feedback'),(53,'Can add review',14,'add_review'),(54,'Can change review',14,'change_review'),(55,'Can delete review',14,'delete_review'),(56,'Can view review',14,'view_review');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-02-27  8:36:29
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: webdownload
-- ------------------------------------------------------
-- Server version	8.0.34

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
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$390000$enAJnyLwsMjeNz7AmdyHUK$qm+knqszNgm5a7zfExaWPiYQK8/iHCeOlD94lEOL/OE=','2024-02-27 01:20:09.258375',1,'admin','','','angia9510@gmail.com',1,1,'2024-01-19 17:43:40.765995'),(2,'pbkdf2_sha256$390000$2lFbJEjW8kHtzNTQd7t82t$YXxLSlfRkfy8nTfqKSU3Ljua638a0nlHMtJAy/HexRE=','2024-01-24 07:54:12.448144',0,'chivy','','','quanglongnp26516@gmail.com',0,1,'2024-01-19 17:44:24.453535');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-02-27  8:36:29
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: webdownload
-- ------------------------------------------------------
-- Server version	8.0.34

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
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-02-27  8:36:30
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: webdownload
-- ------------------------------------------------------
-- Server version	8.0.34

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
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-02-27  8:36:30
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: webdownload
-- ------------------------------------------------------
-- Server version	8.0.34

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
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=80 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2024-01-21 13:27:15.454840','79',' 79 - chivy',3,'',9,1),(2,'2024-01-21 13:27:15.454840','78',' 78 - chivy',3,'',9,1),(3,'2024-01-21 13:27:15.470325','77',' 77 - chivy',3,'',9,1),(4,'2024-01-21 13:27:15.473187','76',' 76 - chivy',3,'',9,1),(5,'2024-01-21 13:27:15.474933','75',' 75 - chivy',3,'',9,1),(6,'2024-01-21 13:27:15.476831','74',' 74 - chivy',3,'',9,1),(7,'2024-01-21 13:27:15.478950','73',' 73 - chivy',3,'',9,1),(8,'2024-01-21 13:27:15.480930','72',' 72 - chivy',3,'',9,1),(9,'2024-01-21 13:27:15.483832','71',' 71 - chivy',3,'',9,1),(10,'2024-01-21 13:27:15.486102','70',' 70 - chivy',3,'',9,1),(11,'2024-01-21 13:27:15.487296','69',' 69 - chivy',3,'',9,1),(12,'2024-01-21 13:27:15.487296','68',' 68 - chivy',3,'',9,1),(13,'2024-01-21 13:27:15.487296','67',' 67 - chivy',3,'',9,1),(14,'2024-01-21 13:27:15.487296','66',' 66 - chivy',3,'',9,1),(15,'2024-01-21 13:27:15.499361','65',' 65 - chivy',3,'',9,1),(16,'2024-01-21 13:27:15.501356','64',' 64 - chivy',3,'',9,1),(17,'2024-01-21 13:27:15.503363','63',' 63 - chivy',3,'',9,1),(18,'2024-01-21 13:27:15.506841','62',' 62 - chivy',3,'',9,1),(19,'2024-01-21 13:27:15.508860','61',' 61 - chivy',3,'',9,1),(20,'2024-01-21 13:27:15.511265','60',' 60 - chivy',3,'',9,1),(21,'2024-01-21 13:27:15.513270','59',' 59 - chivy',3,'',9,1),(22,'2024-01-21 13:27:15.517270','58',' 58 - chivy',3,'',9,1),(23,'2024-01-21 13:27:15.518275','57',' 57 - chivy',3,'',9,1),(24,'2024-01-21 13:27:15.521076','56',' 56 - chivy',3,'',9,1),(25,'2024-01-21 13:27:15.523113','55',' 55 - chivy',3,'',9,1),(26,'2024-01-21 13:27:15.525113','54',' 54 - chivy',3,'',9,1),(27,'2024-01-21 13:27:15.526387','53',' 53 - chivy',3,'',9,1),(28,'2024-01-21 13:27:15.528452','52',' 52 - chivy',3,'',9,1),(29,'2024-01-21 13:27:15.530452','51',' 51 - chivy',3,'',9,1),(30,'2024-01-21 13:27:15.532445','50',' 50 - chivy',3,'',9,1),(31,'2024-01-21 13:27:15.533453','49',' 49 - chivy',3,'',9,1),(32,'2024-01-21 13:27:15.535382','48',' 48 - chivy',3,'',9,1),(33,'2024-01-21 13:27:15.537353','47',' 47 - chivy',3,'',9,1),(34,'2024-01-21 13:27:15.540035','46',' 46 - chivy',3,'',9,1),(35,'2024-01-21 13:27:15.541574','45',' 45 - chivy',3,'',9,1),(36,'2024-01-21 13:27:15.542277','44',' 44 - chivy',3,'',9,1),(37,'2024-01-21 13:27:15.544336','43',' 43 - chivy',3,'',9,1),(38,'2024-01-21 13:27:15.545311','42',' 42 - chivy',3,'',9,1),(39,'2024-01-21 13:27:15.547335','41',' 41 - chivy',3,'',9,1),(40,'2024-01-21 13:27:15.548270','40',' 40 - chivy',3,'',9,1),(41,'2024-01-21 13:27:15.550323','39',' 39 - chivy',3,'',9,1),(42,'2024-01-21 13:27:15.551348','38',' 38 - chivy',3,'',9,1),(43,'2024-01-21 13:27:15.553325','37',' 37 - chivy',3,'',9,1),(44,'2024-01-21 13:27:15.554124','36',' 36 - chivy',3,'',9,1),(45,'2024-01-21 13:27:15.554124','35',' 35 - chivy',3,'',9,1),(46,'2024-01-21 13:27:15.554124','34',' 34 - chivy',3,'',9,1),(47,'2024-01-21 13:27:15.554124','33',' 33 - chivy',3,'',9,1),(48,'2024-01-21 13:27:15.554124','32',' 32 - chivy',3,'',9,1),(49,'2024-01-21 13:27:15.554124','31',' 31 - chivy',3,'',9,1),(50,'2024-01-21 13:27:15.554124','30',' 30 - chivy',3,'',9,1),(51,'2024-01-21 13:27:15.554124','29',' 29 - chivy',3,'',9,1),(52,'2024-01-21 13:27:15.568974','28',' 28 - chivy',3,'',9,1),(53,'2024-01-21 13:27:15.571635','27',' 27 - chivy',3,'',9,1),(54,'2024-01-21 13:27:15.574297','26',' 26 - chivy',3,'',9,1),(55,'2024-01-21 13:27:15.575300','25',' 25 - chivy',3,'',9,1),(56,'2024-01-21 13:27:15.579197','24',' 24 - chivy',3,'',9,1),(57,'2024-01-21 13:27:15.579197','23',' 23 - chivy',3,'',9,1),(58,'2024-01-21 13:27:15.579197','22',' 22 - chivy',3,'',9,1),(59,'2024-01-21 13:27:15.579197','21',' 21 - chivy',3,'',9,1),(60,'2024-01-21 13:27:15.586745','20',' 20 - chivy',3,'',9,1),(61,'2024-01-21 13:27:15.589421','19',' 19 - chivy',3,'',9,1),(62,'2024-01-21 13:27:15.591923','18',' 18 - chivy',3,'',9,1),(63,'2024-01-21 13:27:15.593929','17',' 17 - chivy',3,'',9,1),(64,'2024-01-21 13:27:15.594931','16',' 16 - chivy',3,'',9,1),(65,'2024-01-21 13:27:15.596929','15',' 15 - chivy',3,'',9,1),(66,'2024-01-21 13:27:15.598848','14',' 14 - chivy',3,'',9,1),(67,'2024-01-21 13:27:15.600347','13',' 13 - chivy',3,'',9,1),(68,'2024-01-21 13:27:15.601369','12',' 12 - chivy',3,'',9,1),(69,'2024-01-21 13:27:15.603360','11',' 11 - chivy',3,'',9,1),(70,'2024-01-21 13:27:15.606707','10',' 10 - chivy',3,'',9,1),(71,'2024-01-21 13:27:15.608690','9',' 9 - chivy',3,'',9,1),(72,'2024-01-21 13:27:15.610690','8',' 8 - chivy',3,'',9,1),(73,'2024-01-21 13:27:15.611689','7',' 7 - chivy',3,'',9,1),(74,'2024-01-21 13:27:15.613709','6',' 6 - chivy',3,'',9,1),(75,'2024-01-21 13:27:15.614714','5',' 5 - chivy',3,'',9,1),(76,'2024-01-21 13:27:15.616230','4',' 4 - chivy',3,'',9,1),(77,'2024-01-21 13:27:15.618234','3',' 3 - chivy',3,'',9,1),(78,'2024-01-21 13:27:15.619975','2',' 2 - chivy',3,'',9,1),(79,'2024-01-21 13:27:15.620747','1',' 1 - chivy',3,'',9,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-02-27  8:36:29
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: webdownload
-- ------------------------------------------------------
-- Server version	8.0.34

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
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(11,'home','cartitem'),(7,'home','category'),(10,'home','detail'),(13,'home','feedback'),(9,'home','hoadon'),(12,'home','message'),(8,'home','product'),(14,'home','review'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-02-27  8:36:30
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: webdownload
-- ------------------------------------------------------
-- Server version	8.0.34

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
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2024-01-19 17:43:21.017831'),(2,'auth','0001_initial','2024-01-19 17:43:21.379389'),(3,'admin','0001_initial','2024-01-19 17:43:21.491255'),(4,'admin','0002_logentry_remove_auto_add','2024-01-19 17:43:21.500160'),(5,'admin','0003_logentry_add_action_flag_choices','2024-01-19 17:43:21.507232'),(6,'contenttypes','0002_remove_content_type_name','2024-01-19 17:43:21.570067'),(7,'auth','0002_alter_permission_name_max_length','2024-01-19 17:43:21.623020'),(8,'auth','0003_alter_user_email_max_length','2024-01-19 17:43:21.636618'),(9,'auth','0004_alter_user_username_opts','2024-01-19 17:43:21.653881'),(10,'auth','0005_alter_user_last_login_null','2024-01-19 17:43:21.704048'),(11,'auth','0006_require_contenttypes_0002','2024-01-19 17:43:21.706985'),(12,'auth','0007_alter_validators_add_error_messages','2024-01-19 17:43:21.720397'),(13,'auth','0008_alter_user_username_max_length','2024-01-19 17:43:21.793068'),(14,'auth','0009_alter_user_last_name_max_length','2024-01-19 17:43:21.855808'),(15,'auth','0010_alter_group_name_max_length','2024-01-19 17:43:21.870135'),(16,'auth','0011_update_proxy_permissions','2024-01-19 17:43:21.870135'),(17,'auth','0012_alter_user_first_name_max_length','2024-01-19 17:43:21.934059'),(18,'home','0001_initial','2024-01-19 17:43:22.256975'),(19,'sessions','0001_initial','2024-01-19 17:43:22.293794'),(23,'home','0002_feedback','2024-01-21 17:00:04.122046'),(26,'home','0003_review','2024-01-22 04:38:30.022551');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-02-27  8:36:29
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: webdownload
-- ------------------------------------------------------
-- Server version	8.0.34

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('b3tudski762b11cr3zlypxc09m0mxgrl','.eJxVjDsOwjAQBe_iGln-xJuYkj5nsNa7axxAiZRPhbg7spQC2jcz760SHntNxyZrmlhdlVWX3y0jPWVugB843xdNy7yvU9ZN0Sfd9LiwvG6n-3dQcautluLjYDtLBgt4ROjFlJ5DNziOwYNDsB6osAFi6skSYxcNuxwFbFCfL-3yOC4:1rem8f:SAEdgOksanfC7VJQgGyO51KZtHOrXTxV3PU2u4EhUSM','2024-03-12 01:20:09.258375'),('ip6hnv2o2zbsexgf5qchnlg386yoj4s4','.eJxVjDsOwjAQBe_iGln2Gv8o6XMGa-3d4ABypDipEHeHSCmgfTPzXiLhtta0dV7SROIiQJx-t4zlwW0HdMd2m2WZ27pMWe6KPGiXw0z8vB7u30HFXr-1NlaH4sCAJwrWxBi8j4DF-Ow9sh3JBWaldMhWjWhVpjMb0CWAdo7E-wO7YTcc:1rR2fz:Y68MG5M0EMJBZRG-8Qt4ctvW9AZidgxVqyIlz5pbYDg','2024-02-03 04:09:47.220896'),('j67v0googegvu2nqflim1zzswo53g4ev','.eJxVjMEOwiAQRP-FsyFIym7x6N1vIAu7SNVAUtqT8d9tkx70MJd5b-atAq1LCWuXOUysLsqq028XKT2l7oAfVO9Np1aXeYp6V_RBu741ltf1cP8OCvWyrRNQBiuRXWaBBCLWC_rsjGOiOOIWyYyDEzOas-Xk2eHA4AAxiVWfLyX1ORA:1rSY5M:NjHETd8tx9B0w-yhLWQZrMkpe9fR_9s91Y5ODbr5PUM','2024-02-07 07:54:12.448144'),('qpylftpwq6b2r34oup8nk5zxcrdwwgjv','.eJxVjEsOwjAMBe-SNYrsEpqYJXvOUNmxSwsokfpZIe4OlbqA7ZuZ93Idr8vQrbNN3aju7NAdfjfh_LCyAb1zuVWfa1mmUfym-J3O_lrVnpfd_TsYeB6-taS2EQYyFMVsLRBFioxgghRPQIJBodUe0DBwn-NRQ1QKSUNKfePeH9-VN6k:1rZMy6:9zplL6XLtlZemS9M65ys3iQDcndCWjGCE0DZQrX6pQ0','2024-02-26 03:26:54.326403'),('v9jpegorh6a5u9753rtfba7cq1r58qyi','.eJxVjEEOwiAQRe_C2pCWQju4dO8ZyDAzSNVAUtqV8e7apAvd_vfef6mA25rD1mQJM6uzMur0u0Wkh5Qd8B3LrWqqZV3mqHdFH7Tpa2V5Xg737yBjy98acXCRKAkNQNQx9NDFaHrwCccJPIA3TuKI3oKYxIwDCFoLiJNjL-r9AQwQONs:1rREr6:Kit9tkK7Ci_1dkvc-TnWOSLKPROgq6ha7Aidatt8vDg','2024-02-03 17:10:04.699314');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-02-27  8:36:29
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: webdownload
-- ------------------------------------------------------
-- Server version	8.0.34

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
-- Table structure for table `home_cartitem`
--

DROP TABLE IF EXISTS `home_cartitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `home_cartitem` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `quantity` int unsigned NOT NULL,
  `product_id` int NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `home_cartitem_product_id_27161cd2_fk_home_product_pro_id` (`product_id`),
  KEY `home_cartitem_user_id_71301a85_fk_auth_user_id` (`user_id`),
  CONSTRAINT `home_cartitem_product_id_27161cd2_fk_home_product_pro_id` FOREIGN KEY (`product_id`) REFERENCES `home_product` (`pro_id`),
  CONSTRAINT `home_cartitem_user_id_71301a85_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `home_cartitem_chk_1` CHECK ((`quantity` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `home_cartitem`
--

LOCK TABLES `home_cartitem` WRITE;
/*!40000 ALTER TABLE `home_cartitem` DISABLE KEYS */;
INSERT INTO `home_cartitem` VALUES (36,1,9,2);
/*!40000 ALTER TABLE `home_cartitem` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-02-27  8:36:30
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: webdownload
-- ------------------------------------------------------
-- Server version	8.0.34

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
-- Table structure for table `home_category`
--

DROP TABLE IF EXISTS `home_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `home_category` (
  `cate_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `image_cat` varchar(200) NOT NULL,
  `detail` longtext,
  PRIMARY KEY (`cate_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `home_category`
--

LOCK TABLES `home_category` WRITE;
/*!40000 ALTER TABLE `home_category` DISABLE KEYS */;
INSERT INTO `home_category` VALUES (1,'Trà sữa','2020-01-01 00:00:00.000000','2023-11-07 08:07:44.000000','https://i.pinimg.com/564x/9d/79/f8/9d79f8a797bd65785a31f140d7dece95.jpg','Tận hưởng trải nghiệm ngọt ngào với trà sữa tại MILK TEA SHOP. Chúng tôi đảm bảo hương vị tuyệt vời, từng giọt trà sữa là một cảm xúc mới!'),(2,'Món ăn nhẹ','2020-01-01 00:00:00.000000','2023-07-22 16:07:29.000000','https://png.pngtree.com/png-vector/20230728/ourmid/pngtree-flan-clipart-cartoon-kawaii-cute-yellow-cake-with-cherries-and-carrots-vector-png-image_6810525.png','Nói chung là ngon'),(3,'Bánh mì','2020-01-01 00:00:00.000000','2023-07-22 16:12:25.000000','https://i.etsystatic.com/5872003/c/800/800/0/0/il/210001/5196202633/il_300x300.5196202633_pxiu.jpg','Quốc Hồn Quốc Túy của nhân loại nằm trọn trong tay'),(4,'Giải khát','2020-01-01 00:00:00.000000','2023-07-13 10:57:52.000000','https://i.pinimg.com/564x/d8/be/3a/d8be3a22404124e0902c6c1ff7da6a08.jpg','Bừng tỉnh với hương vị đọng lại');
/*!40000 ALTER TABLE `home_category` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-02-27  8:36:30
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: webdownload
-- ------------------------------------------------------
-- Server version	8.0.34

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
-- Table structure for table `home_detail`
--

DROP TABLE IF EXISTS `home_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `home_detail` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `quantity` int unsigned NOT NULL,
  `hoaDon_id` int NOT NULL,
  `product_id` int NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `home_detail_hoaDon_id_49615c78_fk_home_hoaDon_maHoaDon` (`hoaDon_id`),
  KEY `home_detail_product_id_c4b31836_fk_home_product_pro_id` (`product_id`),
  KEY `home_detail_user_id_84b3305b_fk_auth_user_id` (`user_id`),
  CONSTRAINT `home_detail_hoaDon_id_49615c78_fk_home_hoaDon_maHoaDon` FOREIGN KEY (`hoaDon_id`) REFERENCES `home_hoadon` (`maHoaDon`),
  CONSTRAINT `home_detail_product_id_c4b31836_fk_home_product_pro_id` FOREIGN KEY (`product_id`) REFERENCES `home_product` (`pro_id`),
  CONSTRAINT `home_detail_user_id_84b3305b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `home_detail_chk_1` CHECK ((`quantity` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `home_detail`
--

LOCK TABLES `home_detail` WRITE;
/*!40000 ALTER TABLE `home_detail` DISABLE KEYS */;
INSERT INTO `home_detail` VALUES (21,3,80,2,2),(22,4,80,4,2),(23,1,81,2,2),(24,1,83,3,2),(25,1,84,4,2),(26,1,86,6,2),(27,4,88,3,2),(28,1,89,2,2),(29,1,106,4,2),(30,1,109,4,2),(31,4,110,1,2),(32,4,110,5,2),(33,4,111,3,2),(34,3,111,6,2),(35,3,111,2,2),(36,3,112,3,1),(37,5,112,5,1),(38,5,113,2,1),(39,1,113,3,1),(40,9,114,14,1),(41,3,114,15,1);
/*!40000 ALTER TABLE `home_detail` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-02-27  8:36:29
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: webdownload
-- ------------------------------------------------------
-- Server version	8.0.34

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
-- Table structure for table `home_feedback`
--

DROP TABLE IF EXISTS `home_feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `home_feedback` (
  `mess_id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(50) DEFAULT NULL,
  `phone_number` int DEFAULT NULL,
  `message` longtext NOT NULL,
  `time` datetime(6) NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`mess_id`),
  KEY `home_feedback_user_id_56f97b5a_fk_auth_user_id` (`user_id`),
  CONSTRAINT `home_feedback_user_id_56f97b5a_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `home_feedback`
--

LOCK TABLES `home_feedback` WRITE;
/*!40000 ALTER TABLE `home_feedback` DISABLE KEYS */;
INSERT INTO `home_feedback` VALUES (1,'angia9510@gmail.com',329219457,'hello','2024-01-21 17:02:33.294625',2),(2,'angia9510@gmail.com',329219457,'htfffttftftftft','2024-01-21 17:02:49.402846',2),(3,'angia9510@gmail.com',329219457,'Tôi có một thắc mắc','2024-01-23 08:32:37.657100',2),(4,'angia9510@gmail.com',329219457,'order one milk tea cup for my children','2024-02-12 03:28:10.555583',1),(5,'angia9510@gmail.com',329219457,'Đồ quá dở','2024-02-27 01:16:13.240326',1);
/*!40000 ALTER TABLE `home_feedback` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-02-27  8:36:29
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: webdownload
-- ------------------------------------------------------
-- Server version	8.0.34

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
-- Table structure for table `home_hoadon`
--

DROP TABLE IF EXISTS `home_hoadon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `home_hoadon` (
  `maHoaDon` int NOT NULL AUTO_INCREMENT,
  `tongTien` int NOT NULL,
  `email` varchar(50) NOT NULL,
  `diaChi` varchar(100) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `loi` varchar(100) NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`maHoaDon`),
  KEY `home_hoaDon_user_id_3ee6273d_fk_auth_user_id` (`user_id`),
  CONSTRAINT `home_hoaDon_user_id_3ee6273d_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=115 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `home_hoadon`
--

LOCK TABLES `home_hoadon` WRITE;
/*!40000 ALTER TABLE `home_hoadon` DISABLE KEYS */;
INSERT INTO `home_hoadon` VALUES (80,205000,'quanglongnp26516@gmail.com','Latitude: 10.84578786895626, Longitude: 106.79798482955418','2024-01-22 03:35:20.234956','2024-01-22 03:35:20.234956',0,'',2),(81,35000,'angia9510@gmail.com','Latitude: 10.84578786895626, Longitude: 106.79798482955418','2024-01-22 10:18:59.786734','2024-01-22 10:18:59.786734',0,'',2),(82,35000,'angia9510@gmail.com','Latitude: 10.84578786895626, Longitude: 106.79798482955418','2024-01-22 10:19:36.636156','2024-01-22 10:19:36.636156',0,'',2),(83,45000,'angia9510@gmail.com','Latitude: 10.84578786895626, Longitude: 106.79798482955418','2024-01-22 10:21:15.112634','2024-01-22 10:21:15.112634',0,'',2),(84,25000,'angia9510@gmail.com','Latitude: 10.84578786895626, Longitude: 106.79798482955418','2024-01-22 10:26:58.106428','2024-01-22 10:26:58.106428',0,'',2),(85,25000,'angia9510@gmail.com','Latitude: 10.84578786895626, Longitude: 106.79798482955418','2024-01-22 10:27:56.743846','2024-01-22 10:27:56.743846',0,'',2),(86,35000,'quanglongnp26516@gmail.com','Latitude: 10.84578786895626, Longitude: 106.79798482955418','2024-01-22 10:28:31.707078','2024-01-22 10:28:31.707078',0,'',2),(87,35000,'quanglongnp26516@gmail.com','Latitude: 10.84578786895626, Longitude: 106.79798482955418','2024-01-22 10:29:00.514162','2024-01-22 10:29:00.514162',0,'',2),(88,180000,'quanglongnp26516@gmail.com','Latitude: 10.84578786895626, Longitude: 106.79798482955418','2024-01-22 10:29:21.968424','2024-01-22 10:29:21.968424',0,'',2),(89,35000,'angia3535@gmail.com','Ho Chi Minh','2024-01-22 10:30:39.059455','2024-01-22 10:30:39.059455',0,'',2),(90,35000,'angia3535@gmail.com','Ho Chi Minh','2024-01-22 10:31:04.364999','2024-01-22 10:31:04.364999',0,'',2),(91,35000,'angia3535@gmail.com','Ho Chi Minh','2024-01-22 10:31:21.781716','2024-01-22 10:31:21.781716',0,'',2),(92,35000,'angia3535@gmail.com','Ho Chi Minh','2024-01-22 10:32:05.698611','2024-01-22 10:32:05.698611',0,'',2),(93,35000,'angia3535@gmail.com','Ho Chi Minh','2024-01-22 10:32:21.154581','2024-01-22 10:32:21.154581',0,'',2),(94,35000,'angia3535@gmail.com','Ho Chi Minh','2024-01-22 10:32:35.193580','2024-01-22 10:32:35.193580',0,'',2),(95,35000,'angia3535@gmail.com','Ho Chi Minh','2024-01-22 10:32:44.118793','2024-01-22 10:32:44.118793',0,'',2),(96,35000,'angia3535@gmail.com','Ho Chi Minh','2024-01-22 10:33:12.677122','2024-01-22 10:33:12.678217',0,'',2),(97,35000,'angia3535@gmail.com','Ho Chi Minh','2024-01-22 10:33:32.820204','2024-01-22 10:33:32.820204',0,'',2),(98,35000,'angia3535@gmail.com','Ho Chi Minh','2024-01-22 10:33:46.740038','2024-01-22 10:33:46.740038',0,'',2),(99,35000,'angia3535@gmail.com','Ho Chi Minh','2024-01-22 10:34:15.239035','2024-01-22 10:34:15.239035',0,'',2),(100,35000,'angia3535@gmail.com','Ho Chi Minh','2024-01-22 10:34:30.704452','2024-01-22 10:34:30.704452',0,'',2),(101,35000,'angia3535@gmail.com','Ho Chi Minh','2024-01-22 10:34:40.841703','2024-01-22 10:34:40.841703',0,'',2),(102,35000,'angia3535@gmail.com','Ho Chi Minh','2024-01-22 10:35:20.630782','2024-01-22 10:35:20.630782',0,'',2),(103,35000,'angia3535@gmail.com','Ho Chi Minh','2024-01-22 10:35:40.384903','2024-01-22 10:35:40.384903',0,'',2),(104,35000,'angia3535@gmail.com','Ho Chi Minh','2024-01-22 10:35:45.942932','2024-01-22 10:35:45.942932',0,'',2),(105,35000,'angia3535@gmail.com','Ho Chi Minh','2024-01-22 10:36:02.693235','2024-01-22 10:36:02.693235',0,'',2),(106,25000,'quanglongnp26516@gmail.com','Latitude: 10.84578786895626, Longitude: 106.79798482955418','2024-01-22 10:37:55.682687','2024-01-22 10:37:55.682687',0,'',2),(107,25000,'quanglongnp26516@gmail.com','Latitude: 10.84578786895626, Longitude: 106.79798482955418','2024-01-22 10:38:24.173537','2024-01-22 10:38:24.173537',0,'',2),(108,25000,'quanglongnp26516@gmail.com','Latitude: 10.84578786895626, Longitude: 106.79798482955418','2024-01-22 10:38:28.868197','2024-01-22 10:38:28.868197',0,'',2),(109,25000,'quanglongnp26516@gmail.com','Latitude: 10.84578786895626, Longitude: 106.79798482955418','2024-01-22 10:38:46.334088','2024-01-22 10:38:46.334088',0,'',2),(110,240000,'angia3535@gmail.com','Ho Chi Minh','2024-01-22 15:10:26.491447','2024-01-22 15:10:26.491447',0,'',2),(111,390000,'angia3535@gmail.com','Ho Chi Minh','2024-01-22 15:31:40.112452','2024-01-22 15:31:40.112452',0,'',2),(112,310000,'quanglongnp26516@gmail.com','Latitude: 10.84578786895626, Longitude: 106.79798482955418','2024-01-23 08:37:35.012772','2024-01-23 08:37:35.012772',0,'',1),(113,220000,'angia9510@gmail.com','Latitude: 10.84578786895626, Longitude: 106.79798482955418','2024-02-27 01:06:55.663910','2024-02-27 01:06:55.663910',0,'',1),(114,423000,'quanglongnp26516@gmail.com','Latitude: 10.84578786895626, Longitude: 106.79798482955418','2024-02-27 01:23:59.685469','2024-02-27 01:23:59.685469',0,'',1);
/*!40000 ALTER TABLE `home_hoadon` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-02-27  8:36:29
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: webdownload
-- ------------------------------------------------------
-- Server version	8.0.34

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
-- Table structure for table `home_product`
--

DROP TABLE IF EXISTS `home_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `home_product` (
  `pro_id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL,
  `price` int NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `image_pro` varchar(200) NOT NULL,
  `category_id` int NOT NULL,
  PRIMARY KEY (`pro_id`),
  KEY `home_product_category_id_0dc673e8_fk_home_category_cate_id` (`category_id`),
  CONSTRAINT `home_product_category_id_0dc673e8_fk_home_category_cate_id` FOREIGN KEY (`category_id`) REFERENCES `home_category` (`cate_id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `home_product`
--

LOCK TABLES `home_product` WRITE;
/*!40000 ALTER TABLE `home_product` DISABLE KEYS */;
INSERT INTO `home_product` VALUES (1,'Bánh Chocolate',25000,'2020-01-01 00:00:00.000000','2021-08-15 16:41:50.000000','https://i.pinimg.com/564x/dd/82/85/dd82858de78a14be757f64888c6d2370.jpg',2),(2,'Trà Sen Vàng',35000,'2020-01-01 00:00:00.000000','2021-08-15 16:53:50.000000','https://i.pinimg.com/564x/95/d7/7b/95d77b09e864be2ac2166c8e87d65dc2.jpg',4),(3,'Trà Vải',45000,'2020-01-01 00:00:00.000000','2021-08-15 16:53:50.000000','https://bizweb.dktcdn.net/100/290/576/files/travai2.jpg?v=1615278850368',4),(4,'Bánh Mì Thịt Nướng',25000,'2020-01-01 00:00:00.000000','2021-08-15 16:12:51.000000','https://i.pinimg.com/564x/0d/96/53/0d9653f61c292e1836ceee24790e6872.jpg',3),(5,'Bánh Mousse  Đào',35000,'2020-01-01 00:00:00.000000','2021-08-15 16:24:51.000000','https://i.pinimg.com/564x/06/68/89/066889e9d961900c0fdc7c16490bee55.jpg',2),(6,'Trà Lài',35000,'2020-01-01 00:00:00.000000','2021-08-15 16:24:51.000000','https://i.pinimg.com/564x/ac/83/b8/ac83b80f568b6ffa0772c29a6f73a122.jpg',4),(7,'Trà Sen',35000,'2020-01-01 00:00:00.000000','2021-08-15 19:24:51.000000','https://i.pinimg.com/564x/2b/f3/e2/2bf3e2067b4c20b6aec6936aff3d3cfa.jpg',4),(8,'Trà sữa trân trâu đen',50000,'2020-01-01 00:00:00.000000','2021-08-15 16:44:51.000000','https://i.pinimg.com/564x/e9/79/bd/e979bd9e68299c29a6df1bd8c64e69b5.jpg',1),(9,'Trà sữa Matcha',25000,'2020-01-01 00:00:00.000000','2021-08-15 16:02:52.000000','https://i.pinimg.com/564x/97/84/40/978440fe09d65d3d1c461e614bd150d5.jpg',1),(10,'Cafe Phin Đen Nóng',50000,'2020-01-01 00:00:00.000000','2021-08-15 16:18:52.000000','https://i.pinimg.com/564x/95/a8/aa/95a8aa9c707f72fa24f67c3588a228f8.jpg',4),(11,'Trà Sữa Thượng Hạng',50000,'2020-01-01 00:00:00.000000','2021-08-15 16:16:12.000000','https://i.pinimg.com/564x/d1/32/9b/d1329b9e4ac21cd117082acb83831355.jpg',4),(12,'Bạc Xỉu Đá',30000,'2020-01-01 00:00:00.000000','2021-08-15 16:45:54.000000','https://i.pinimg.com/564x/de/70/e9/de70e97e57073ccc141876099df293ee.jpg',4),(13,'Bánh Chuối',19000,'2020-01-01 00:00:00.000000','2021-08-15 16:40:53.000000','https://i.pinimg.com/564x/3e/18/ec/3e18ec4a79acdf91a7e0f854faaa9693.jpg',2),(14,'Bánh Mousse Cacao',35000,'2020-01-01 00:00:00.000000','2021-08-15 16:00:55.000000','https://i.pinimg.com/564x/04/f7/98/04f798fa65f7900f4d37328fa2801984.jpg',2),(15,'Trà Sữa 3 Con Mèo',36000,'2020-01-01 00:00:00.000000','2021-08-15 16:30:55.000000','https://i.pinimg.com/564x/b1/0b/f9/b10bf9f746e5470aaa0d8231a0b03f09.jpg',1),(16,'Bánh Mì Xíu Mại',20000,'2020-01-01 00:00:00.000000','2021-08-15 16:17:55.000000','https://i.pinimg.com/564x/f4/24/66/f42466e76c7b6b8f379ffdca49ef2dcb.jpg',3),(17,'Bánh Caramel Phô Mai',35000,'2020-01-01 00:00:00.000000','2021-08-15 16:35:55.000000','https://i.pinimg.com/564x/1a/ef/77/1aef771b0fd4ddffce50e4afba048cac.jpg',2),(18,'Trà Thạch Đào',50000,'2020-01-01 00:00:00.000000','2021-08-15 16:48:55.000000','https://i.pinimg.com/564x/eb/6b/a9/eb6ba9252e14b12515434a2d8c96d1f0.jpg',4),(19,'Trà Thạch Vải',50000,'2020-01-01 00:00:00.000000','2021-08-15 16:03:56.000000','https://i.pinimg.com/564x/2a/f6/3f/2af63fb235f30c49422674ade7cf0b02.jpg',4),(20,'Trà Đào',50000,'2020-01-01 00:00:00.000000','2021-08-15 16:20:56.000000','https://i.pinimg.com/564x/ac/b3/4e/acb34e7aa86f8f448a4d011fcb873034.jpg',4),(21,'Cà Phê Đá',30000,'2020-01-01 00:00:00.000000','2021-08-15 16:42:56.000000','https://i.pinimg.com/564x/fd/f5/f8/fdf5f86970dceb814cee1d109aaa887b.jpg',4),(22,'Trà Sữa Trân Châu Đường Đen',30000,'2020-01-01 00:00:00.000000','2021-08-15 16:42:56.000000','https://i.pinimg.com/564x/b4/61/b6/b461b6b7821abae465fe5fba0eb52411.jpg',1),(23,'Trà Sữa Dâu',30000,'2020-01-01 00:00:00.000000','2021-08-15 16:10:56.000000','https://i.pinimg.com/564x/55/d8/e8/55d8e8a663e460bc6ae5ee700856b26a.jpg',1),(24,'Trà Trái Cây',32000,'2020-01-01 00:00:00.000000','2021-08-15 16:42:56.000000','https://i.pinimg.com/736x/b3/fb/3c/b3fb3c5d95c53b1ee4f61289d9708349.jpg',1),(25,'Cafe Phindi Hồng Trà',35000,'2020-01-01 00:00:00.000000','2021-08-15 17:03:01.000000','https://www.highlandscoffee.com.vn/vnt_upload/news/12_2020/OB12-KV-FINAL.jpg',4),(26,'Cafe Phindi Kem Sữa',35000,'2020-01-01 00:00:00.000000','2021-08-15 17:28:01.000000','https://www.highlandscoffee.com.vn/vnt_upload/news/09_2020/Screen_Shot_2020-09-12_at_12.12.36.png',4);
/*!40000 ALTER TABLE `home_product` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-02-27  8:36:30
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: webdownload
-- ------------------------------------------------------
-- Server version	8.0.34

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
-- Table structure for table `home_review`
--

DROP TABLE IF EXISTS `home_review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `home_review` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `rate` int NOT NULL,
  `content` longtext NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `detail_id` bigint NOT NULL,
  `hoadon_id` int NOT NULL,
  `product_id` int NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `home_review_detail_id_156b8c81_fk_home_detail_id` (`detail_id`),
  KEY `home_review_hoadon_id_d505e704_fk_home_hoaDon_maHoaDon` (`hoadon_id`),
  KEY `home_review_product_id_0233ae3c_fk_home_product_pro_id` (`product_id`),
  KEY `home_review_user_id_e328ce0b_fk_auth_user_id` (`user_id`),
  CONSTRAINT `home_review_detail_id_156b8c81_fk_home_detail_id` FOREIGN KEY (`detail_id`) REFERENCES `home_detail` (`id`),
  CONSTRAINT `home_review_hoadon_id_d505e704_fk_home_hoaDon_maHoaDon` FOREIGN KEY (`hoadon_id`) REFERENCES `home_hoadon` (`maHoaDon`),
  CONSTRAINT `home_review_product_id_0233ae3c_fk_home_product_pro_id` FOREIGN KEY (`product_id`) REFERENCES `home_product` (`pro_id`),
  CONSTRAINT `home_review_user_id_e328ce0b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `home_review`
--

LOCK TABLES `home_review` WRITE;
/*!40000 ALTER TABLE `home_review` DISABLE KEYS */;
INSERT INTO `home_review` VALUES (2,4,'hello','2024-01-22 10:10:15.951594',21,80,2,2),(3,4,'hello','2024-01-22 10:17:02.477814',22,80,4,2),(4,4,'Good','2024-01-22 14:35:31.769529',28,89,2,2),(5,4,'good','2024-01-22 15:06:48.583213',23,81,2,2),(6,4,'good','2024-01-22 15:07:10.991624',29,106,4,2),(7,4,'good','2024-01-22 15:07:35.101553',30,109,4,2),(8,4,'good','2024-01-22 15:07:51.327302',25,84,4,2),(9,4,'Oke','2024-01-22 15:08:06.574446',26,86,6,2),(10,3,'Oke','2024-01-22 15:08:33.295248',24,83,3,2),(11,5,'Okeeeeeee','2024-01-22 15:08:51.214083',27,88,3,2),(12,3,'Bánh quá ngọt, dở ặc ','2024-01-22 15:10:53.334589',31,110,1,2),(13,4,'Nói chung là ngon','2024-01-22 15:11:25.545804',32,110,5,2),(14,2,'Quá dỡ','2024-01-22 15:31:55.048265',35,111,2,2),(15,3,'Cũng được!!!!\r\n','2024-01-23 08:40:13.071513',36,112,3,1),(16,5,'Quá ngọt ngào!!!!!!!','2024-01-23 08:44:02.810235',37,112,5,1),(17,5,'Ngon','2024-02-27 01:07:07.666392',38,113,2,1),(18,4,'Hơi ngon\r\n','2024-02-27 01:08:42.249683',39,113,3,1);
/*!40000 ALTER TABLE `home_review` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-02-27  8:36:29
