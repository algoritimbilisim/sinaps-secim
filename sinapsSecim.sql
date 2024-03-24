-- MySQL dump 10.13  Distrib 8.0.36, for Linux (x86_64)
--
-- Host: localhost    Database: sinapsSecim
-- ------------------------------------------------------
-- Server version	8.0.36-0ubuntu0.22.04.1

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
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int unsigned DEFAULT NULL,
  `order` int NOT NULL DEFAULT '1',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `categories_slug_unique` (`slug`),
  KEY `categories_parent_id_foreign` (`parent_id`),
  CONSTRAINT `categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,NULL,1,'Category 1','category-1','2024-03-21 09:34:05','2024-03-21 09:34:05'),(2,NULL,1,'Category 2','category-2','2024-03-21 09:34:05','2024-03-21 09:34:05');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `data_rows`
--

DROP TABLE IF EXISTS `data_rows`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `data_rows` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `data_type_id` int unsigned NOT NULL,
  `field` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `browse` tinyint(1) NOT NULL DEFAULT '1',
  `read` tinyint(1) NOT NULL DEFAULT '1',
  `edit` tinyint(1) NOT NULL DEFAULT '1',
  `add` tinyint(1) NOT NULL DEFAULT '1',
  `delete` tinyint(1) NOT NULL DEFAULT '1',
  `details` text COLLATE utf8mb4_unicode_ci,
  `order` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `data_rows_data_type_id_foreign` (`data_type_id`),
  CONSTRAINT `data_rows_data_type_id_foreign` FOREIGN KEY (`data_type_id`) REFERENCES `data_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_rows`
--

LOCK TABLES `data_rows` WRITE;
/*!40000 ALTER TABLE `data_rows` DISABLE KEYS */;
INSERT INTO `data_rows` VALUES (1,1,'id','number','ID',1,0,0,0,0,0,NULL,1),(2,1,'name','text','İsim',1,1,1,1,1,1,NULL,2),(3,1,'email','text','E-posta',1,1,1,1,1,1,NULL,3),(4,1,'password','password','Parola',1,0,0,1,1,0,NULL,4),(5,1,'remember_token','text','Token\'ı Hatırla',0,0,0,0,0,0,NULL,5),(6,1,'created_at','timestamp','Oluşturulma Zamanı',0,1,1,0,0,0,NULL,6),(7,1,'updated_at','timestamp','Güncelleme Zamanı',0,0,0,0,0,0,NULL,7),(8,1,'avatar','image','Avatar',0,1,1,1,1,1,NULL,8),(9,1,'user_belongsto_role_relationship','relationship','Rol',0,1,1,1,1,0,'{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsTo\",\"column\":\"role_id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"roles\",\"pivot\":0}',10),(10,1,'user_belongstomany_role_relationship','relationship','Roller',0,1,1,1,1,0,'{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"user_roles\",\"pivot\":\"1\",\"taggable\":\"0\"}',11),(11,1,'settings','hidden','Settings',0,0,0,0,0,0,NULL,12),(12,2,'id','number','ID',1,0,0,0,0,0,NULL,1),(13,2,'name','text','İsim',1,1,1,1,1,1,NULL,2),(14,2,'created_at','timestamp','Oluşturulma Zamanı',0,0,0,0,0,0,NULL,3),(15,2,'updated_at','timestamp','Güncelleme Zamanı',0,0,0,0,0,0,NULL,4),(16,3,'id','number','ID',1,0,0,0,0,0,NULL,1),(17,3,'name','text','İsim',1,1,1,1,1,1,NULL,2),(18,3,'created_at','timestamp','Oluşturulma Zamanı',0,0,0,0,0,0,NULL,3),(19,3,'updated_at','timestamp','Güncelleme Zamanı',0,0,0,0,0,0,NULL,4),(20,3,'display_name','text','Görünen İsim',1,1,1,1,1,1,NULL,5),(21,1,'role_id','text','Rol',1,1,1,1,1,1,NULL,9),(22,4,'id','number','ID',1,0,0,0,0,0,NULL,1),(23,4,'parent_id','select_dropdown','Üst',0,0,1,1,1,1,'{\"default\":\"\",\"null\":\"\",\"options\":{\"\":\"-- None --\"},\"relationship\":{\"key\":\"id\",\"label\":\"name\"}}',2),(24,4,'order','text','Sıra',1,1,1,1,1,1,'{\"default\":1}',3),(25,4,'name','text','İsim',1,1,1,1,1,1,NULL,4),(26,4,'slug','text','Kısa ad (URL)',1,1,1,1,1,1,'{\"slugify\":{\"origin\":\"name\"}}',5),(27,4,'created_at','timestamp','Oluşturulma Zamanı',0,0,1,0,0,0,NULL,6),(28,4,'updated_at','timestamp','Güncelleme Zamanı',0,0,0,0,0,0,NULL,7),(29,5,'id','number','ID',1,0,0,0,0,0,NULL,1),(30,5,'author_id','text','Yazar',1,0,1,1,0,1,NULL,2),(31,5,'category_id','text','Kategori',1,0,1,1,1,0,NULL,3),(32,5,'title','text','Başlık',1,1,1,1,1,1,NULL,4),(33,5,'excerpt','text_area','Özet',1,0,1,1,1,1,NULL,5),(34,5,'body','rich_text_box','Gövde',1,0,1,1,1,1,NULL,6),(35,5,'image','image','Yazı Görseli',0,1,1,1,1,1,'{\"resize\":{\"width\":\"1000\",\"height\":\"null\"},\"quality\":\"70%\",\"upsize\":true,\"thumbnails\":[{\"name\":\"medium\",\"scale\":\"50%\"},{\"name\":\"small\",\"scale\":\"25%\"},{\"name\":\"cropped\",\"crop\":{\"width\":\"300\",\"height\":\"250\"}}]}',7),(36,5,'slug','text','Kısa ad (URL)',1,0,1,1,1,1,'{\"slugify\":{\"origin\":\"title\",\"forceUpdate\":true},\"validation\":{\"rule\":\"unique:posts,slug\"}}',8),(37,5,'meta_description','text_area','Meta Açıklama',1,0,1,1,1,1,NULL,9),(38,5,'meta_keywords','text_area','Meta Anahtar Kelime',1,0,1,1,1,1,NULL,10),(39,5,'status','select_dropdown','Durum',1,1,1,1,1,1,'{\"default\":\"DRAFT\",\"options\":{\"PUBLISHED\":\"published\",\"DRAFT\":\"draft\",\"PENDING\":\"pending\"}}',11),(40,5,'created_at','timestamp','Oluşturulma Zamanı',0,1,1,0,0,0,NULL,12),(41,5,'updated_at','timestamp','Güncelleme Zamanı',0,0,0,0,0,0,NULL,13),(42,5,'seo_title','text','SEO Başlığı',0,1,1,1,1,1,NULL,14),(43,5,'featured','checkbox','Öne Çıkarılmış',1,1,1,1,1,1,NULL,15),(44,6,'id','number','ID',1,0,0,0,0,0,NULL,1),(45,6,'author_id','text','Yazar',1,0,0,0,0,0,NULL,2),(46,6,'title','text','Başlık',1,1,1,1,1,1,NULL,3),(47,6,'excerpt','text_area','Özet',1,0,1,1,1,1,NULL,4),(48,6,'body','rich_text_box','Gövde',1,0,1,1,1,1,NULL,5),(49,6,'slug','text','Kısa ad (URL)',1,0,1,1,1,1,'{\"slugify\":{\"origin\":\"title\"},\"validation\":{\"rule\":\"unique:pages,slug\"}}',6),(50,6,'meta_description','text','Meta Açıklama',1,0,1,1,1,1,NULL,7),(51,6,'meta_keywords','text','Meta Anahtar Kelime',1,0,1,1,1,1,NULL,8),(52,6,'status','select_dropdown','Durum',1,1,1,1,1,1,'{\"default\":\"INACTIVE\",\"options\":{\"INACTIVE\":\"INACTIVE\",\"ACTIVE\":\"ACTIVE\"}}',9),(53,6,'created_at','timestamp','Oluşturulma Zamanı',1,1,1,0,0,0,NULL,10),(54,6,'updated_at','timestamp','Güncelleme Zamanı',1,0,0,0,0,0,NULL,11),(55,6,'image','image','Sayfa Görseli',0,1,1,1,1,1,NULL,12),(56,8,'id','text','Id',1,0,0,0,0,0,'{}',1),(57,8,'name','text','Parti Adı',0,1,1,1,1,1,'{}',2),(58,8,'candidate_name','text','Aday Adı',0,1,1,1,1,1,'{}',3),(59,8,'logo_url','media_picker','Logo',0,1,1,1,1,1,'{}',4),(60,8,'created_at','timestamp','Created At',0,0,0,0,0,0,'{}',5),(61,8,'updated_at','timestamp','Updated At',0,0,0,0,0,0,'{}',6),(62,12,'id','text','Id',1,0,0,0,0,0,'{}',1),(63,12,'case_no','text','Sandık No',0,1,1,1,1,1,'{}',2),(64,12,'created_at','timestamp','Created At',0,1,1,1,0,1,'{}',3),(65,12,'updated_at','timestamp','Updated At',0,0,0,0,0,0,'{}',4);
/*!40000 ALTER TABLE `data_rows` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `data_types`
--

DROP TABLE IF EXISTS `data_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `data_types` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_singular` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_plural` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `policy_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `controller` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `generate_permissions` tinyint(1) NOT NULL DEFAULT '0',
  `server_side` tinyint NOT NULL DEFAULT '0',
  `details` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `data_types_name_unique` (`name`),
  UNIQUE KEY `data_types_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_types`
--

LOCK TABLES `data_types` WRITE;
/*!40000 ALTER TABLE `data_types` DISABLE KEYS */;
INSERT INTO `data_types` VALUES (1,'users','users','Kullanıcı','Kullanıcılar','voyager-person','TCG\\Voyager\\Models\\User','TCG\\Voyager\\Policies\\UserPolicy','TCG\\Voyager\\Http\\Controllers\\VoyagerUserController','',1,0,NULL,'2024-03-21 09:34:04','2024-03-21 09:34:04'),(2,'menus','menus','Menü','Menüler','voyager-list','TCG\\Voyager\\Models\\Menu',NULL,'','',1,0,NULL,'2024-03-21 09:34:04','2024-03-21 09:34:04'),(3,'roles','roles','Rol','Roller','voyager-lock','TCG\\Voyager\\Models\\Role',NULL,'TCG\\Voyager\\Http\\Controllers\\VoyagerRoleController','',1,0,NULL,'2024-03-21 09:34:04','2024-03-21 09:34:04'),(4,'categories','categories','Kategori','Kategoriler','voyager-categories','TCG\\Voyager\\Models\\Category',NULL,'','',1,0,NULL,'2024-03-21 09:34:05','2024-03-21 09:34:05'),(5,'posts','posts','Yazı','Yazılar','voyager-news','TCG\\Voyager\\Models\\Post','TCG\\Voyager\\Policies\\PostPolicy','','',1,0,NULL,'2024-03-21 09:34:05','2024-03-21 09:34:05'),(6,'pages','pages','Sayfa','Sayfalar','voyager-file-text','TCG\\Voyager\\Models\\Page',NULL,'','',1,0,NULL,'2024-03-21 09:34:05','2024-03-21 09:34:05'),(7,'party','party','Parti','Partiler','voyager-medal-rank-star','App\\Party',NULL,NULL,NULL,1,0,'{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}','2024-03-21 10:18:48','2024-03-21 10:18:48'),(8,'parties','parties','Parti','Partiler','voyager-medal-rank-star','App\\Party',NULL,NULL,NULL,1,0,'{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}','2024-03-21 10:20:57','2024-03-21 10:20:57'),(12,'vote_cases','vote_cases','Sandık','Sandıklar','voyager-treasure-open','App\\VoteCase',NULL,NULL,NULL,1,0,'{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}','2024-03-21 10:37:32','2024-03-21 10:45:26');
/*!40000 ALTER TABLE `data_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu_items`
--

DROP TABLE IF EXISTS `menu_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu_items` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `menu_id` int unsigned DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `target` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '_self',
  `icon_class` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int DEFAULT NULL,
  `order` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `route` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parameters` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `menu_items_menu_id_foreign` (`menu_id`),
  CONSTRAINT `menu_items_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_items`
--

LOCK TABLES `menu_items` WRITE;
/*!40000 ALTER TABLE `menu_items` DISABLE KEYS */;
INSERT INTO `menu_items` VALUES (1,1,'Yönetim Paneli','','_self','voyager-boat',NULL,NULL,1,'2024-03-21 09:34:04','2024-03-21 09:34:04','voyager.dashboard',NULL),(2,1,'Medya','','_self','voyager-images',NULL,NULL,5,'2024-03-21 09:34:04','2024-03-21 09:34:04','voyager.media.index',NULL),(3,1,'Kullanıcılar','','_self','voyager-person',NULL,NULL,3,'2024-03-21 09:34:04','2024-03-21 09:34:04','voyager.users.index',NULL),(4,1,'Roller','','_self','voyager-lock',NULL,NULL,2,'2024-03-21 09:34:04','2024-03-21 09:34:04','voyager.roles.index',NULL),(5,1,'Araçlar','','_self','voyager-tools',NULL,NULL,9,'2024-03-21 09:34:04','2024-03-21 09:34:04',NULL,NULL),(6,1,'Menü Oluşturucu','','_self','voyager-list',NULL,5,10,'2024-03-21 09:34:04','2024-03-21 09:34:04','voyager.menus.index',NULL),(7,1,'Veritabanı','','_self','voyager-data',NULL,5,11,'2024-03-21 09:34:04','2024-03-21 09:34:04','voyager.database.index',NULL),(8,1,'Pusula','','_self','voyager-compass',NULL,5,12,'2024-03-21 09:34:04','2024-03-21 09:34:04','voyager.compass.index',NULL),(9,1,'BREAD','','_self','voyager-bread',NULL,5,13,'2024-03-21 09:34:04','2024-03-21 09:34:04','voyager.bread.index',NULL),(10,1,'Ayarlar','','_self','voyager-settings',NULL,NULL,14,'2024-03-21 09:34:04','2024-03-21 09:34:04','voyager.settings.index',NULL),(11,1,'Kategoriler','','_self','voyager-categories',NULL,NULL,8,'2024-03-21 09:34:05','2024-03-21 09:34:05','voyager.categories.index',NULL),(12,1,'Yazılar','','_self','voyager-news',NULL,NULL,6,'2024-03-21 09:34:05','2024-03-21 09:34:05','voyager.posts.index',NULL),(13,1,'Sayfalar','','_self','voyager-file-text',NULL,NULL,7,'2024-03-21 09:34:05','2024-03-21 09:34:05','voyager.pages.index',NULL),(15,1,'Partiler','','_self','voyager-medal-rank-star',NULL,NULL,15,'2024-03-21 10:20:57','2024-03-21 10:20:57','voyager.parties.index',NULL),(17,1,'Sandıklar','','_self','voyager-treasure-open','#000000',NULL,16,'2024-03-21 10:43:41','2024-03-21 10:45:03','voyager.vote_cases.index','null'),(18,1,'Oy Kayıt','/admin/oy-kayit','_self','voyager-mail','#2ec27e',NULL,17,'2024-03-21 18:43:52','2024-03-21 18:43:52',NULL,'');
/*!40000 ALTER TABLE `menu_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menus`
--

DROP TABLE IF EXISTS `menus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menus` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `menus_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menus`
--

LOCK TABLES `menus` WRITE;
/*!40000 ALTER TABLE `menus` DISABLE KEYS */;
INSERT INTO `menus` VALUES (1,'admin','2024-03-21 09:34:04','2024-03-21 09:34:04');
/*!40000 ALTER TABLE `menus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_resets_table',1),(3,'2016_01_01_000000_add_voyager_user_fields',1),(4,'2016_01_01_000000_create_data_types_table',1),(5,'2016_01_01_000000_create_pages_table',1),(6,'2016_01_01_000000_create_posts_table',1),(7,'2016_02_15_204651_create_categories_table',1),(8,'2016_05_19_173453_create_menu_table',1),(9,'2016_10_21_190000_create_roles_table',1),(10,'2016_10_21_190000_create_settings_table',1),(11,'2016_11_30_135954_create_permission_table',1),(12,'2016_11_30_141208_create_permission_role_table',1),(13,'2016_12_26_201236_data_types__add__server_side',1),(14,'2017_01_13_000000_add_route_to_menu_items_table',1),(15,'2017_01_14_005015_create_translations_table',1),(16,'2017_01_15_000000_make_table_name_nullable_in_permissions_table',1),(17,'2017_03_06_000000_add_controller_to_data_types_table',1),(18,'2017_04_11_000000_alter_post_nullable_fields_table',1),(19,'2017_04_21_000000_add_order_to_data_rows_table',1),(20,'2017_07_05_210000_add_policyname_to_data_types_table',1),(21,'2017_08_05_000000_add_group_to_settings_table',1),(22,'2017_11_26_013050_add_user_role_relationship',1),(23,'2017_11_26_015000_create_user_roles_table',1),(24,'2018_03_11_000000_add_user_settings',1),(25,'2018_03_14_000000_add_details_to_data_types_table',1),(26,'2018_03_16_000000_make_settings_value_nullable',1),(27,'2019_08_19_000000_create_failed_jobs_table',1),(28,'2019_12_14_000001_create_personal_access_tokens_table',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pages`
--

DROP TABLE IF EXISTS `pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pages` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `author_id` int NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `excerpt` text COLLATE utf8mb4_unicode_ci,
  `body` text COLLATE utf8mb4_unicode_ci,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` text COLLATE utf8mb4_unicode_ci,
  `meta_keywords` text COLLATE utf8mb4_unicode_ci,
  `status` enum('ACTIVE','INACTIVE') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'INACTIVE',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pages_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pages`
--

LOCK TABLES `pages` WRITE;
/*!40000 ALTER TABLE `pages` DISABLE KEYS */;
INSERT INTO `pages` VALUES (1,0,'Hello World','Hang the jib grog grog blossom grapple dance the hempen jig gangway pressgang bilge rat to go on account lugger. Nelsons folly gabion line draught scallywag fire ship gaff fluke fathom case shot. Sea Legs bilge rat sloop matey gabion long clothes run a shot across the bow Gold Road cog league.','<p>Hello World. Scallywag grog swab Cat o\'nine tails scuttle rigging hardtack cable nipper Yellow Jack. Handsomely spirits knave lad killick landlubber or just lubber deadlights chantey pinnace crack Jennys tea cup. Provost long clothes black spot Yellow Jack bilged on her anchor league lateen sail case shot lee tackle.</p>\n<p>Ballast spirits fluke topmast me quarterdeck schooner landlubber or just lubber gabion belaying pin. Pinnace stern galleon starboard warp carouser to go on account dance the hempen jig jolly boat measured fer yer chains. Man-of-war fire in the hole nipperkin handsomely doubloon barkadeer Brethren of the Coast gibbet driver squiffy.</p>','pages/page1.jpg','hello-world','Yar Meta Description','Keyword1, Keyword2','ACTIVE','2024-03-21 09:34:05','2024-03-21 09:34:05');
/*!40000 ALTER TABLE `pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `parties`
--

DROP TABLE IF EXISTS `parties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `parties` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `candidate_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `logo_url` tinytext COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `parties`
--

LOCK TABLES `parties` WRITE;
/*!40000 ALTER TABLE `parties` DISABLE KEYS */;
INSERT INTO `parties` VALUES (1,'Demokrat Parti','Abdulkadir Çat','parties/Demokrat Parti.svg','2024-03-21 10:23:18','2024-03-21 10:23:18'),(2,'Adalet ve Kalkınma Partisi','Abdulmuttalip Demirel','parties/AK_PARTI_Logo.svg','2024-03-21 18:07:29','2024-03-22 16:14:31'),(3,'Cumhuriyet Halk Partisi','Hasan Ustaoğlu','parties/CHP_logo_(2024,_vertical_red).svg','2024-03-22 16:14:10','2024-03-22 16:14:10'),(4,'İYİ Parti','Mehmet Yılmaz Dönderici','parties/iyi_parti.svg','2024-03-22 20:24:36','2024-03-22 20:29:34');
/*!40000 ALTER TABLE `parties` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permission_role`
--

DROP TABLE IF EXISTS `permission_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permission_role` (
  `permission_id` bigint unsigned NOT NULL,
  `role_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `permission_role_permission_id_index` (`permission_id`),
  KEY `permission_role_role_id_index` (`role_id`),
  CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permission_role`
--

LOCK TABLES `permission_role` WRITE;
/*!40000 ALTER TABLE `permission_role` DISABLE KEYS */;
INSERT INTO `permission_role` VALUES (1,1),(2,1),(3,1),(4,1),(5,1),(6,1),(7,1),(8,1),(9,1),(10,1),(11,1),(12,1),(13,1),(14,1),(15,1),(16,1),(17,1),(18,1),(19,1),(20,1),(21,1),(22,1),(23,1),(24,1),(25,1),(26,1),(27,1),(28,1),(29,1),(30,1),(31,1),(32,1),(33,1),(34,1),(35,1),(36,1),(37,1),(38,1),(39,1),(40,1),(41,1),(42,1),(43,1),(44,1),(45,1),(46,1),(47,1),(48,1),(49,1),(50,1),(56,1),(57,1),(58,1),(59,1),(60,1);
/*!40000 ALTER TABLE `permission_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permissions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `table_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `permissions_key_index` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissions`
--

LOCK TABLES `permissions` WRITE;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
INSERT INTO `permissions` VALUES (1,'browse_admin',NULL,'2024-03-21 09:34:04','2024-03-21 09:34:04'),(2,'browse_bread',NULL,'2024-03-21 09:34:04','2024-03-21 09:34:04'),(3,'browse_database',NULL,'2024-03-21 09:34:04','2024-03-21 09:34:04'),(4,'browse_media',NULL,'2024-03-21 09:34:04','2024-03-21 09:34:04'),(5,'browse_compass',NULL,'2024-03-21 09:34:04','2024-03-21 09:34:04'),(6,'browse_menus','menus','2024-03-21 09:34:04','2024-03-21 09:34:04'),(7,'read_menus','menus','2024-03-21 09:34:04','2024-03-21 09:34:04'),(8,'edit_menus','menus','2024-03-21 09:34:04','2024-03-21 09:34:04'),(9,'add_menus','menus','2024-03-21 09:34:04','2024-03-21 09:34:04'),(10,'delete_menus','menus','2024-03-21 09:34:04','2024-03-21 09:34:04'),(11,'browse_roles','roles','2024-03-21 09:34:04','2024-03-21 09:34:04'),(12,'read_roles','roles','2024-03-21 09:34:04','2024-03-21 09:34:04'),(13,'edit_roles','roles','2024-03-21 09:34:05','2024-03-21 09:34:05'),(14,'add_roles','roles','2024-03-21 09:34:05','2024-03-21 09:34:05'),(15,'delete_roles','roles','2024-03-21 09:34:05','2024-03-21 09:34:05'),(16,'browse_users','users','2024-03-21 09:34:05','2024-03-21 09:34:05'),(17,'read_users','users','2024-03-21 09:34:05','2024-03-21 09:34:05'),(18,'edit_users','users','2024-03-21 09:34:05','2024-03-21 09:34:05'),(19,'add_users','users','2024-03-21 09:34:05','2024-03-21 09:34:05'),(20,'delete_users','users','2024-03-21 09:34:05','2024-03-21 09:34:05'),(21,'browse_settings','settings','2024-03-21 09:34:05','2024-03-21 09:34:05'),(22,'read_settings','settings','2024-03-21 09:34:05','2024-03-21 09:34:05'),(23,'edit_settings','settings','2024-03-21 09:34:05','2024-03-21 09:34:05'),(24,'add_settings','settings','2024-03-21 09:34:05','2024-03-21 09:34:05'),(25,'delete_settings','settings','2024-03-21 09:34:05','2024-03-21 09:34:05'),(26,'browse_categories','categories','2024-03-21 09:34:05','2024-03-21 09:34:05'),(27,'read_categories','categories','2024-03-21 09:34:05','2024-03-21 09:34:05'),(28,'edit_categories','categories','2024-03-21 09:34:05','2024-03-21 09:34:05'),(29,'add_categories','categories','2024-03-21 09:34:05','2024-03-21 09:34:05'),(30,'delete_categories','categories','2024-03-21 09:34:05','2024-03-21 09:34:05'),(31,'browse_posts','posts','2024-03-21 09:34:05','2024-03-21 09:34:05'),(32,'read_posts','posts','2024-03-21 09:34:05','2024-03-21 09:34:05'),(33,'edit_posts','posts','2024-03-21 09:34:05','2024-03-21 09:34:05'),(34,'add_posts','posts','2024-03-21 09:34:05','2024-03-21 09:34:05'),(35,'delete_posts','posts','2024-03-21 09:34:05','2024-03-21 09:34:05'),(36,'browse_pages','pages','2024-03-21 09:34:05','2024-03-21 09:34:05'),(37,'read_pages','pages','2024-03-21 09:34:05','2024-03-21 09:34:05'),(38,'edit_pages','pages','2024-03-21 09:34:05','2024-03-21 09:34:05'),(39,'add_pages','pages','2024-03-21 09:34:05','2024-03-21 09:34:05'),(40,'delete_pages','pages','2024-03-21 09:34:05','2024-03-21 09:34:05'),(41,'browse_party','party','2024-03-21 10:18:48','2024-03-21 10:18:48'),(42,'read_party','party','2024-03-21 10:18:48','2024-03-21 10:18:48'),(43,'edit_party','party','2024-03-21 10:18:48','2024-03-21 10:18:48'),(44,'add_party','party','2024-03-21 10:18:48','2024-03-21 10:18:48'),(45,'delete_party','party','2024-03-21 10:18:48','2024-03-21 10:18:48'),(46,'browse_parties','parties','2024-03-21 10:20:57','2024-03-21 10:20:57'),(47,'read_parties','parties','2024-03-21 10:20:57','2024-03-21 10:20:57'),(48,'edit_parties','parties','2024-03-21 10:20:57','2024-03-21 10:20:57'),(49,'add_parties','parties','2024-03-21 10:20:57','2024-03-21 10:20:57'),(50,'delete_parties','parties','2024-03-21 10:20:57','2024-03-21 10:20:57'),(56,'browse_vote_cases','vote_cases','2024-03-21 10:39:16','2024-03-21 10:39:16'),(57,'read_vote_cases','vote_cases','2024-03-21 10:39:16','2024-03-21 10:39:16'),(58,'edit_vote_cases','vote_cases','2024-03-21 10:39:16','2024-03-21 10:39:16'),(59,'add_vote_cases','vote_cases','2024-03-21 10:39:16','2024-03-21 10:39:16'),(60,'delete_vote_cases','vote_cases','2024-03-21 10:39:16','2024-03-21 10:39:16');
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `posts` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `author_id` int NOT NULL,
  `category_id` int DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `seo_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `excerpt` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `meta_keywords` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `status` enum('PUBLISHED','DRAFT','PENDING') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'DRAFT',
  `featured` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `posts_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` VALUES (1,0,NULL,'Lorem Ipsum Post',NULL,'This is the excerpt for the Lorem Ipsum Post','<p>This is the body of the lorem ipsum post</p>','posts/post1.jpg','lorem-ipsum-post','This is the meta description','keyword1, keyword2, keyword3','PUBLISHED',0,'2024-03-21 09:34:05','2024-03-21 09:34:05'),(2,0,NULL,'My Sample Post',NULL,'This is the excerpt for the sample Post','<p>This is the body for the sample post, which includes the body.</p>\n                <h2>We can use all kinds of format!</h2>\n                <p>And include a bunch of other stuff.</p>','posts/post2.jpg','my-sample-post','Meta Description for sample post','keyword1, keyword2, keyword3','PUBLISHED',0,'2024-03-21 09:34:05','2024-03-21 09:34:05'),(3,0,NULL,'Latest Post',NULL,'This is the excerpt for the latest post','<p>This is the body for the latest post</p>','posts/post3.jpg','latest-post','This is the meta description','keyword1, keyword2, keyword3','PUBLISHED',0,'2024-03-21 09:34:05','2024-03-21 09:34:05'),(4,0,NULL,'Yarr Post',NULL,'Reef sails nipperkin bring a spring upon her cable coffer jury mast spike marooned Pieces of Eight poop deck pillage. Clipper driver coxswain galleon hempen halter come about pressgang gangplank boatswain swing the lead. Nipperkin yard skysail swab lanyard Blimey bilge water ho quarter Buccaneer.','<p>Swab deadlights Buccaneer fire ship square-rigged dance the hempen jig weigh anchor cackle fruit grog furl. Crack Jennys tea cup chase guns pressgang hearties spirits hogshead Gold Road six pounders fathom measured fer yer chains. Main sheet provost come about trysail barkadeer crimp scuttle mizzenmast brig plunder.</p>\n<p>Mizzen league keelhaul galleon tender cog chase Barbary Coast doubloon crack Jennys tea cup. Blow the man down lugsail fire ship pinnace cackle fruit line warp Admiral of the Black strike colors doubloon. Tackle Jack Ketch come about crimp rum draft scuppers run a shot across the bow haul wind maroon.</p>\n<p>Interloper heave down list driver pressgang holystone scuppers tackle scallywag bilged on her anchor. Jack Tar interloper draught grapple mizzenmast hulk knave cable transom hogshead. Gaff pillage to go on account grog aft chase guns piracy yardarm knave clap of thunder.</p>','posts/post4.jpg','yarr-post','this be a meta descript','keyword1, keyword2, keyword3','PUBLISHED',0,'2024-03-21 09:34:05','2024-03-21 09:34:05');
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'admin','Yönetici','2024-03-21 09:34:04','2024-03-21 09:34:04'),(2,'user','Normal Kullanıcı','2024-03-21 09:34:04','2024-03-21 09:34:04');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `settings` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `details` text COLLATE utf8mb4_unicode_ci,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int NOT NULL DEFAULT '1',
  `group` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `settings_key_unique` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings`
--

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
INSERT INTO `settings` VALUES (1,'site.title','Site Başlığı','Site Başlığı','','text',1,'Site'),(2,'site.description','Site Açıklaması','Site Açıklaması','','text',2,'Site'),(3,'site.logo','Site Logosu','','','image',3,'Site'),(4,'site.google_analytics_tracking_id','Google Analytics Takip Kimliği (Tracking ID)','','','text',4,'Site'),(5,'admin.bg_image','Yönetim Paneli Arkaplan Görseli','','','image',5,'Admin'),(6,'admin.title','Yönetim Paneli Başlığı','Voyager','','text',1,'Admin'),(7,'admin.description','Yönetim Paneli Açıklaması','Voyager\'e hoş geldiniz. Laravel\'in Aranan Yönetim Paneli','','text',2,'Admin'),(8,'admin.loader','Yönetim Paneli Yükleniyor İkonu','','','image',3,'Admin'),(9,'admin.icon_image','Yönetim Paneli İkon Görseli','','','image',4,'Admin'),(10,'admin.google_analytics_client_id','Google Analytics İstemci Kimliği (Client ID) (Yönetim Paneli için kullanılacak)','','','text',1,'Admin');
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `translations`
--

DROP TABLE IF EXISTS `translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `translations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `table_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `column_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `foreign_key` int unsigned NOT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `translations_table_name_column_name_foreign_key_locale_unique` (`table_name`,`column_name`,`foreign_key`,`locale`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `translations`
--

LOCK TABLES `translations` WRITE;
/*!40000 ALTER TABLE `translations` DISABLE KEYS */;
INSERT INTO `translations` VALUES (1,'data_types','display_name_singular',5,'pt','Post','2024-03-21 09:34:05','2024-03-21 09:34:05'),(2,'data_types','display_name_singular',6,'pt','Página','2024-03-21 09:34:05','2024-03-21 09:34:05'),(3,'data_types','display_name_singular',1,'pt','Utilizador','2024-03-21 09:34:05','2024-03-21 09:34:05'),(4,'data_types','display_name_singular',4,'pt','Categoria','2024-03-21 09:34:05','2024-03-21 09:34:05'),(5,'data_types','display_name_singular',2,'pt','Menu','2024-03-21 09:34:05','2024-03-21 09:34:05'),(6,'data_types','display_name_singular',3,'pt','Função','2024-03-21 09:34:05','2024-03-21 09:34:05'),(7,'data_types','display_name_plural',5,'pt','Posts','2024-03-21 09:34:05','2024-03-21 09:34:05'),(8,'data_types','display_name_plural',6,'pt','Páginas','2024-03-21 09:34:05','2024-03-21 09:34:05'),(9,'data_types','display_name_plural',1,'pt','Utilizadores','2024-03-21 09:34:05','2024-03-21 09:34:05'),(10,'data_types','display_name_plural',4,'pt','Categorias','2024-03-21 09:34:05','2024-03-21 09:34:05'),(11,'data_types','display_name_plural',2,'pt','Menus','2024-03-21 09:34:05','2024-03-21 09:34:05'),(12,'data_types','display_name_plural',3,'pt','Funções','2024-03-21 09:34:05','2024-03-21 09:34:05'),(13,'categories','slug',1,'pt','categoria-1','2024-03-21 09:34:05','2024-03-21 09:34:05'),(14,'categories','name',1,'pt','Categoria 1','2024-03-21 09:34:05','2024-03-21 09:34:05'),(15,'categories','slug',2,'pt','categoria-2','2024-03-21 09:34:05','2024-03-21 09:34:05'),(16,'categories','name',2,'pt','Categoria 2','2024-03-21 09:34:05','2024-03-21 09:34:05'),(17,'pages','title',1,'pt','Olá Mundo','2024-03-21 09:34:05','2024-03-21 09:34:05'),(18,'pages','slug',1,'pt','ola-mundo','2024-03-21 09:34:05','2024-03-21 09:34:05'),(19,'pages','body',1,'pt','<p>Olá Mundo. Scallywag grog swab Cat o\'nine tails scuttle rigging hardtack cable nipper Yellow Jack. Handsomely spirits knave lad killick landlubber or just lubber deadlights chantey pinnace crack Jennys tea cup. Provost long clothes black spot Yellow Jack bilged on her anchor league lateen sail case shot lee tackle.</p>\r\n<p>Ballast spirits fluke topmast me quarterdeck schooner landlubber or just lubber gabion belaying pin. Pinnace stern galleon starboard warp carouser to go on account dance the hempen jig jolly boat measured fer yer chains. Man-of-war fire in the hole nipperkin handsomely doubloon barkadeer Brethren of the Coast gibbet driver squiffy.</p>','2024-03-21 09:34:05','2024-03-21 09:34:05'),(20,'menu_items','title',1,'pt','Painel de Controle','2024-03-21 09:34:05','2024-03-21 09:34:05'),(21,'menu_items','title',2,'pt','Media','2024-03-21 09:34:05','2024-03-21 09:34:05'),(22,'menu_items','title',12,'pt','Publicações','2024-03-21 09:34:05','2024-03-21 09:34:05'),(23,'menu_items','title',3,'pt','Utilizadores','2024-03-21 09:34:05','2024-03-21 09:34:05'),(24,'menu_items','title',11,'pt','Categorias','2024-03-21 09:34:05','2024-03-21 09:34:05'),(25,'menu_items','title',13,'pt','Páginas','2024-03-21 09:34:05','2024-03-21 09:34:05'),(26,'menu_items','title',4,'pt','Funções','2024-03-21 09:34:05','2024-03-21 09:34:05'),(27,'menu_items','title',5,'pt','Ferramentas','2024-03-21 09:34:05','2024-03-21 09:34:05'),(28,'menu_items','title',6,'pt','Menus','2024-03-21 09:34:05','2024-03-21 09:34:05'),(29,'menu_items','title',7,'pt','Base de dados','2024-03-21 09:34:05','2024-03-21 09:34:05'),(30,'menu_items','title',10,'pt','Configurações','2024-03-21 09:34:05','2024-03-21 09:34:05'),(31,'data_types','display_name_singular',12,'en','Sandık','2024-03-21 10:39:16','2024-03-21 10:39:16'),(32,'data_types','display_name_plural',12,'en','Sandıklar','2024-03-21 10:39:16','2024-03-21 10:39:16'),(33,'menu_items','title',16,'en','Sandıklar','2024-03-21 10:39:37','2024-03-21 10:39:37'),(34,'menu_items','title',17,'en','Sandıklar','2024-03-21 10:43:53','2024-03-21 10:43:53'),(35,'data_rows','display_name',62,'en','Id','2024-03-21 10:45:26','2024-03-21 10:45:26'),(36,'data_rows','display_name',63,'en','Case No','2024-03-21 10:45:26','2024-03-21 10:45:26'),(37,'data_rows','display_name',64,'en','Created At','2024-03-21 10:45:26','2024-03-21 10:45:26'),(38,'data_rows','display_name',65,'en','Updated At','2024-03-21 10:45:26','2024-03-21 10:45:26');
/*!40000 ALTER TABLE `translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_roles`
--

DROP TABLE IF EXISTS `user_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_roles` (
  `user_id` bigint unsigned NOT NULL,
  `role_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `user_roles_user_id_index` (`user_id`),
  KEY `user_roles_role_id_index` (`role_id`),
  CONSTRAINT `user_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  CONSTRAINT `user_roles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_roles`
--

LOCK TABLES `user_roles` WRITE;
/*!40000 ALTER TABLE `user_roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `role_id` bigint unsigned DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'users/default.png',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `settings` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  KEY `users_role_id_foreign` (`role_id`),
  CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,1,'Admin','admin@admin.com','users/default.png',NULL,'$2y$10$RPRh.8E5tcB0wZT0mElI3u.tfDIqa2Iklt5KED7qiMixoqKJ.VGCm','3bJGH04xsTGb8aR2UhMeTgp3WofDjQ9yQSrnFyIpR1Wt4XlMdipNimQ014Q7',NULL,'2024-03-21 09:34:05','2024-03-21 09:34:05');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vote_cases`
--

DROP TABLE IF EXISTS `vote_cases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vote_cases` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `case_no` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vote_cases`
--

LOCK TABLES `vote_cases` WRITE;
/*!40000 ALTER TABLE `vote_cases` DISABLE KEYS */;
INSERT INTO `vote_cases` VALUES (1,1001,'2024-03-21 10:45:12','2024-03-21 10:45:12'),(2,1002,'2024-03-21 10:45:33','2024-03-21 10:45:33'),(3,1003,'2024-03-21 10:45:37','2024-03-21 10:45:37'),(4,1004,'2024-03-21 18:40:58','2024-03-21 18:40:58'),(5,1005,'2024-03-22 16:12:04','2024-03-22 16:12:04'),(6,1006,'2024-03-22 20:48:55','2024-03-22 20:48:55'),(7,1007,'2024-03-22 20:49:05','2024-03-22 20:49:05');
/*!40000 ALTER TABLE `vote_cases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `votes`
--

DROP TABLE IF EXISTS `votes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `votes` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `case_no` int DEFAULT NULL,
  `party_id` int DEFAULT NULL,
  `vote_count` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `votes`
--

LOCK TABLES `votes` WRITE;
/*!40000 ALTER TABLE `votes` DISABLE KEYS */;
INSERT INTO `votes` VALUES (16,1001,0,100,'2024-03-22 16:04:15','2024-03-22 16:04:15'),(17,1001,1,1000,'2024-03-22 16:04:15','2024-03-22 20:22:19'),(18,1001,2,1500,'2024-03-22 16:04:15','2024-03-22 20:21:51'),(19,1002,0,20,'2024-03-22 16:05:05','2024-03-22 16:05:05'),(20,1002,1,2,'2024-03-22 16:05:05','2024-03-22 16:05:05'),(21,1002,2,1,'2024-03-22 16:05:05','2024-03-22 16:05:05'),(22,1001,3,500,'2024-03-22 16:28:24','2024-03-22 21:12:44'),(23,1003,0,10,'2024-03-22 20:04:57','2024-03-22 20:04:57'),(24,1003,1,750,'2024-03-22 20:04:57','2024-03-22 20:23:01'),(25,1003,2,200,'2024-03-22 20:04:57','2024-03-22 20:04:57'),(26,1003,3,350,'2024-03-22 20:04:57','2024-03-22 20:04:57'),(27,1001,4,1000,'2024-03-22 20:25:00','2024-03-22 20:36:27'),(28,1002,3,500,'2024-03-22 21:12:58','2024-03-22 21:12:58'),(29,1002,4,NULL,'2024-03-22 21:12:58','2024-03-22 21:12:58');
/*!40000 ALTER TABLE `votes` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-03-24 18:29:48
