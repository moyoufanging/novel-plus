-- MySQL dump 10.13  Distrib 8.0.29, for Linux (x86_64)
--
-- Host: localhost    Database: novel
-- ------------------------------------------------------
-- Server version	8.0.29

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
-- Table structure for table `author`
--

DROP TABLE IF EXISTS `author`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `author` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint DEFAULT NULL COMMENT '用户ID',
  `invite_code` varchar(20) DEFAULT NULL COMMENT '邀请码',
  `pen_name` varchar(20) DEFAULT NULL COMMENT '笔名',
  `tel_phone` varchar(20) DEFAULT NULL COMMENT '手机号码',
  `chat_account` varchar(50) DEFAULT NULL COMMENT 'QQ或微信账号',
  `email` varchar(50) DEFAULT NULL COMMENT '电子邮箱',
  `work_direction` tinyint DEFAULT NULL COMMENT '作品方向，0：男频，1：女频',
  `status` tinyint DEFAULT '0' COMMENT '0：正常，1：封禁',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `alipayid` varchar(50) DEFAULT NULL COMMENT '支付宝id',
  `bankname` varchar(50) DEFAULT NULL COMMENT '银行名',
  `bankcardnumber` varchar(50) DEFAULT NULL COMMENT '银行卡号',
  `subbranchname` varchar(50) DEFAULT NULL COMMENT '支行名称',
  `username` varchar(50) DEFAULT NULL COMMENT '用户名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='作者表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `author`
--

LOCK TABLES `author` WRITE;
/*!40000 ALTER TABLE `author` DISABLE KEYS */;
INSERT INTO `author` VALUES (6,1551834843753619456,'方法','一只马','17754889839','17754889839','17754889839@qq.com',0,0,'2022-08-18 14:59:41',NULL,NULL,NULL,NULL,NULL),(17,1564500007003082752,'eeee','干宝','','','',0,0,'2022-08-30 14:27:45',NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `author` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `author_code`
--

DROP TABLE IF EXISTS `author_code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `author_code` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `invite_code` varchar(100) DEFAULT NULL COMMENT '邀请码',
  `validity_time` datetime DEFAULT NULL COMMENT '有效时间',
  `is_use` tinyint(1) DEFAULT '0' COMMENT '是否使用过，0：未使用，1:使用过',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_user_id` bigint DEFAULT NULL COMMENT '创建人ID',
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_code` (`invite_code`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='作家邀请码表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `author_code`
--

LOCK TABLES `author_code` WRITE;
/*!40000 ALTER TABLE `author_code` DISABLE KEYS */;
INSERT INTO `author_code` VALUES (3,'reerer','2020-05-27 22:43:45',1,'2020-05-13 11:40:56',1),(4,'123456','2020-05-28 00:00:00',0,'2020-05-13 14:09:55',1),(5,'ww34343','2020-05-21 00:00:00',0,'2020-05-13 14:18:58',1),(6,'eerd','2022-06-23 08:00:00',1,'2022-06-22 15:48:37',1);
/*!40000 ALTER TABLE `author_code` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `author_income`
--

DROP TABLE IF EXISTS `author_income`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `author_income` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `author_id` bigint NOT NULL COMMENT '作家ID',
  `book_id` bigint NOT NULL COMMENT '作品ID',
  `income_month` date NOT NULL COMMENT '收入月份',
  `pre_tax_income` bigint NOT NULL DEFAULT '0' COMMENT '税前收入（分）',
  `after_tax_income` bigint NOT NULL DEFAULT '0' COMMENT '税后收入（分）',
  `pay_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '支付状态，0：待支付，1：已支付',
  `confirm_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '稿费确认状态，0：待确认，1：已确认',
  `detail` varchar(255) DEFAULT NULL COMMENT '详情',
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='稿费收入统计表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `author_income`
--

LOCK TABLES `author_income` WRITE;
/*!40000 ALTER TABLE `author_income` DISABLE KEYS */;
INSERT INTO `author_income` VALUES (2,1548290516624515072,5,0,'2022-06-30',50400,45360,0,0,'','2022-07-26 21:13:00');
/*!40000 ALTER TABLE `author_income` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `author_income_detail`
--

DROP TABLE IF EXISTS `author_income_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `author_income_detail` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `author_id` bigint NOT NULL COMMENT '作家ID',
  `book_id` bigint NOT NULL DEFAULT '0' COMMENT '作品ID,0表示全部作品',
  `income_date` date NOT NULL COMMENT '收入日期',
  `income_account` int NOT NULL DEFAULT '0' COMMENT '订阅总额',
  `income_count` int NOT NULL DEFAULT '0' COMMENT '订阅次数',
  `income_number` int NOT NULL DEFAULT '0' COMMENT '订阅人数',
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=263 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='稿费收入明细统计表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `author_income_detail`
--

LOCK TABLES `author_income_detail` WRITE;
/*!40000 ALTER TABLE `author_income_detail` DISABLE KEYS */;
INSERT INTO `author_income_detail` VALUES (41,1548290516624515072,5,0,'2022-06-23',9000,10,1,'2022-06-23 00:00:00'),(42,1548290516624515072,5,4,'2022-06-23',9000,10,1,'2022-06-23 00:00:00'),(43,1548290516624515072,5,4,'2022-06-23',9000,10,1,'2022-06-23 00:00:00'),(44,1548290516624515072,5,4,'2022-06-23',9000,10,1,'2022-06-23 00:00:00'),(45,1548290516624515072,5,4,'2022-06-23',9000,10,1,'2022-06-23 00:00:00'),(46,1548290516624515072,5,4,'2022-06-23',9000,10,1,'2022-06-23 00:00:00'),(47,1548290516624515072,5,4,'2022-06-23',9000,10,1,'2022-06-23 00:00:00'),(48,1548290516624515072,5,4,'2022-06-23',9000,10,1,'2022-06-23 00:00:00'),(49,1548290516624515072,5,4,'2022-06-23',9000,10,1,'2022-06-23 00:00:00'),(50,1548290516624515072,5,4,'2022-07-30',0,0,0,'2022-07-31 00:00:00'),(51,1548290516624515072,5,5,'2022-07-30',0,0,0,'2022-07-31 00:00:00'),(52,1548290516624515072,5,0,'2022-07-30',0,0,0,'2022-07-31 00:00:00'),(53,1546715035601108992,4,2,'2022-07-30',0,0,0,'2022-07-31 00:00:00'),(54,1546715035601108992,4,3,'2022-07-30',0,0,0,'2022-07-31 00:00:00'),(55,1546715035601108992,4,0,'2022-07-30',0,0,0,'2022-07-31 00:00:00'),(56,1539515167128186880,3,1,'2022-07-30',0,0,0,'2022-07-31 00:00:00'),(57,1539515167128186880,3,0,'2022-07-30',0,0,0,'2022-07-31 00:00:00'),(58,1255060328322027520,2,0,'2022-07-30',0,0,0,'2022-07-31 00:00:00'),(59,1548290516624515072,5,4,'2022-07-31',0,0,0,'2022-08-01 00:00:00'),(60,1548290516624515072,5,5,'2022-07-31',0,0,0,'2022-08-01 00:00:00'),(61,1548290516624515072,5,0,'2022-07-31',0,0,0,'2022-08-01 00:00:00'),(62,1546715035601108992,4,2,'2022-07-31',0,0,0,'2022-08-01 00:00:00'),(63,1546715035601108992,4,3,'2022-07-31',0,0,0,'2022-08-01 00:00:00'),(64,1546715035601108992,4,0,'2022-07-31',0,0,0,'2022-08-01 00:00:00'),(65,1539515167128186880,3,1,'2022-07-31',0,0,0,'2022-08-01 00:00:00'),(66,1539515167128186880,3,0,'2022-07-31',0,0,0,'2022-08-01 00:00:00'),(67,1255060328322027520,2,0,'2022-07-31',0,0,0,'2022-08-01 00:00:00'),(68,1548290516624515072,5,4,'2022-08-01',0,0,0,'2022-08-02 00:00:00'),(69,1548290516624515072,5,5,'2022-08-01',0,0,0,'2022-08-02 00:00:00'),(70,1548290516624515072,5,0,'2022-08-01',0,0,0,'2022-08-02 00:00:00'),(71,1546715035601108992,4,2,'2022-08-01',0,0,0,'2022-08-02 00:00:00'),(72,1546715035601108992,4,3,'2022-08-01',0,0,0,'2022-08-02 00:00:00'),(73,1546715035601108992,4,0,'2022-08-01',0,0,0,'2022-08-02 00:00:00'),(74,1539515167128186880,3,1,'2022-08-01',0,0,0,'2022-08-02 00:00:00'),(75,1539515167128186880,3,0,'2022-08-01',0,0,0,'2022-08-02 00:00:00'),(76,1255060328322027520,2,0,'2022-08-01',0,0,0,'2022-08-02 00:00:00'),(77,1548290516624515072,5,4,'2022-08-03',0,0,0,'2022-08-04 00:00:00'),(78,1548290516624515072,5,5,'2022-08-03',0,0,0,'2022-08-04 00:00:00'),(79,1548290516624515072,5,0,'2022-08-03',0,0,0,'2022-08-04 00:00:00'),(80,1546715035601108992,4,2,'2022-08-03',0,0,0,'2022-08-04 00:00:00'),(81,1546715035601108992,4,3,'2022-08-03',0,0,0,'2022-08-04 00:00:00'),(82,1546715035601108992,4,0,'2022-08-03',0,0,0,'2022-08-04 00:00:00'),(83,1539515167128186880,3,1,'2022-08-03',0,0,0,'2022-08-04 00:00:00'),(84,1539515167128186880,3,0,'2022-08-03',0,0,0,'2022-08-04 00:00:00'),(85,1255060328322027520,2,0,'2022-08-03',0,0,0,'2022-08-04 00:00:00'),(86,1548290516624515072,5,4,'2022-08-14',0,0,0,'2022-08-15 09:45:45'),(87,1548290516624515072,5,5,'2022-08-14',0,0,0,'2022-08-15 09:45:47'),(88,1548290516624515072,5,6,'2022-08-14',0,0,0,'2022-08-15 09:45:47'),(89,1548290516624515072,5,7,'2022-08-14',0,0,0,'2022-08-15 09:45:47'),(90,1548290516624515072,5,8,'2022-08-14',0,0,0,'2022-08-15 09:45:47'),(91,1548290516624515072,5,9,'2022-08-14',0,0,0,'2022-08-15 09:45:47'),(92,1548290516624515072,5,10,'2022-08-14',0,0,0,'2022-08-15 09:45:48'),(93,1548290516624515072,5,11,'2022-08-14',0,0,0,'2022-08-15 09:45:48'),(94,1548290516624515072,5,0,'2022-08-14',0,0,0,'2022-08-15 09:45:48'),(95,1546715035601108992,4,2,'2022-08-14',0,0,0,'2022-08-15 09:45:48'),(96,1546715035601108992,4,3,'2022-08-14',0,0,0,'2022-08-15 09:45:48'),(97,1546715035601108992,4,0,'2022-08-14',0,0,0,'2022-08-15 09:45:48'),(98,1539515167128186880,3,1,'2022-08-14',0,0,0,'2022-08-15 09:45:49'),(99,1539515167128186880,3,0,'2022-08-14',0,0,0,'2022-08-15 09:45:49'),(100,1255060328322027520,2,0,'2022-08-14',0,0,0,'2022-08-15 09:45:49'),(101,1548290516624515072,5,4,'2022-08-16',0,0,0,'2022-08-17 00:00:00'),(102,1548290516624515072,5,5,'2022-08-16',0,0,0,'2022-08-17 00:00:00'),(103,1548290516624515072,5,6,'2022-08-16',0,0,0,'2022-08-17 00:00:00'),(104,1548290516624515072,5,7,'2022-08-16',0,0,0,'2022-08-17 00:00:00'),(105,1548290516624515072,5,8,'2022-08-16',0,0,0,'2022-08-17 00:00:00'),(106,1548290516624515072,5,9,'2022-08-16',0,0,0,'2022-08-17 00:00:00'),(107,1548290516624515072,5,10,'2022-08-16',0,0,0,'2022-08-17 00:00:00'),(108,1548290516624515072,5,11,'2022-08-16',0,0,0,'2022-08-17 00:00:00'),(109,1548290516624515072,5,0,'2022-08-16',0,0,0,'2022-08-17 00:00:00'),(110,1546715035601108992,4,2,'2022-08-16',0,0,0,'2022-08-17 00:00:00'),(111,1546715035601108992,4,3,'2022-08-16',0,0,0,'2022-08-17 00:00:00'),(112,1546715035601108992,4,0,'2022-08-16',0,0,0,'2022-08-17 00:00:00'),(113,1539515167128186880,3,1,'2022-08-16',0,0,0,'2022-08-17 00:00:00'),(114,1539515167128186880,3,0,'2022-08-16',0,0,0,'2022-08-17 00:00:00'),(115,1255060328322027520,2,0,'2022-08-16',0,0,0,'2022-08-17 00:00:00'),(116,1551834843753619456,6,12,'2022-08-19',0,0,0,'2022-08-20 00:00:00'),(117,1551834843753619456,6,13,'2022-08-19',0,0,0,'2022-08-20 00:00:00'),(118,1551834843753619456,6,14,'2022-08-19',0,0,0,'2022-08-20 00:00:00'),(119,1551834843753619456,6,15,'2022-08-19',0,0,0,'2022-08-20 00:00:00'),(120,1551834843753619456,6,0,'2022-08-19',0,0,0,'2022-08-20 00:00:00'),(121,1548290516624515072,5,4,'2022-08-19',0,0,0,'2022-08-20 00:00:00'),(122,1548290516624515072,5,5,'2022-08-19',0,0,0,'2022-08-20 00:00:00'),(123,1548290516624515072,5,6,'2022-08-19',0,0,0,'2022-08-20 00:00:00'),(124,1548290516624515072,5,7,'2022-08-19',0,0,0,'2022-08-20 00:00:00'),(125,1548290516624515072,5,8,'2022-08-19',0,0,0,'2022-08-20 00:00:00'),(126,1548290516624515072,5,9,'2022-08-19',0,0,0,'2022-08-20 00:00:00'),(127,1548290516624515072,5,10,'2022-08-19',0,0,0,'2022-08-20 00:00:00'),(128,1548290516624515072,5,11,'2022-08-19',0,0,0,'2022-08-20 00:00:00'),(129,1548290516624515072,5,0,'2022-08-19',0,0,0,'2022-08-20 00:00:00'),(130,1546715035601108992,4,2,'2022-08-19',0,0,0,'2022-08-20 00:00:00'),(131,1546715035601108992,4,3,'2022-08-19',0,0,0,'2022-08-20 00:00:00'),(132,1546715035601108992,4,0,'2022-08-19',0,0,0,'2022-08-20 00:00:00'),(133,1539515167128186880,3,1,'2022-08-19',0,0,0,'2022-08-20 00:00:01'),(134,1539515167128186880,3,0,'2022-08-19',0,0,0,'2022-08-20 00:00:01'),(135,1255060328322027520,2,0,'2022-08-19',0,0,0,'2022-08-20 00:00:01'),(136,1551834843753619456,6,12,'2022-08-20',0,0,0,'2022-08-21 00:00:00'),(137,1551834843753619456,6,13,'2022-08-20',0,0,0,'2022-08-21 00:00:01'),(138,1551834843753619456,6,14,'2022-08-20',0,0,0,'2022-08-21 00:00:01'),(139,1551834843753619456,6,15,'2022-08-20',0,0,0,'2022-08-21 00:00:01'),(140,1551834843753619456,6,0,'2022-08-20',0,0,0,'2022-08-21 00:00:01'),(141,1548290516624515072,5,4,'2022-08-20',0,0,0,'2022-08-21 00:00:01'),(142,1548290516624515072,5,5,'2022-08-20',0,0,0,'2022-08-21 00:00:01'),(143,1548290516624515072,5,6,'2022-08-20',0,0,0,'2022-08-21 00:00:01'),(144,1548290516624515072,5,7,'2022-08-20',0,0,0,'2022-08-21 00:00:01'),(145,1548290516624515072,5,8,'2022-08-20',0,0,0,'2022-08-21 00:00:01'),(146,1548290516624515072,5,9,'2022-08-20',0,0,0,'2022-08-21 00:00:01'),(147,1548290516624515072,5,10,'2022-08-20',0,0,0,'2022-08-21 00:00:01'),(148,1548290516624515072,5,11,'2022-08-20',0,0,0,'2022-08-21 00:00:01'),(149,1548290516624515072,5,0,'2022-08-20',0,0,0,'2022-08-21 00:00:01'),(150,1546715035601108992,4,2,'2022-08-20',0,0,0,'2022-08-21 00:00:01'),(151,1546715035601108992,4,3,'2022-08-20',0,0,0,'2022-08-21 00:00:01'),(152,1546715035601108992,4,0,'2022-08-20',0,0,0,'2022-08-21 00:00:01'),(153,1539515167128186880,3,1,'2022-08-20',0,0,0,'2022-08-21 00:00:01'),(154,1539515167128186880,3,0,'2022-08-20',0,0,0,'2022-08-21 00:00:01'),(155,1255060328322027520,2,0,'2022-08-20',0,0,0,'2022-08-21 00:00:01'),(156,1551834843753619456,6,12,'2022-08-22',0,0,0,'2022-08-23 00:00:00'),(157,1551834843753619456,6,13,'2022-08-22',0,0,0,'2022-08-23 00:00:00'),(158,1551834843753619456,6,14,'2022-08-22',0,0,0,'2022-08-23 00:00:00'),(159,1551834843753619456,6,15,'2022-08-22',0,0,0,'2022-08-23 00:00:00'),(160,1551834843753619456,6,0,'2022-08-22',0,0,0,'2022-08-23 00:00:00'),(161,1548290516624515072,5,4,'2022-08-22',0,0,0,'2022-08-23 00:00:00'),(162,1548290516624515072,5,5,'2022-08-22',0,0,0,'2022-08-23 00:00:00'),(163,1548290516624515072,5,6,'2022-08-22',0,0,0,'2022-08-23 00:00:00'),(164,1548290516624515072,5,7,'2022-08-22',0,0,0,'2022-08-23 00:00:00'),(165,1548290516624515072,5,8,'2022-08-22',0,0,0,'2022-08-23 00:00:00'),(166,1548290516624515072,5,9,'2022-08-22',0,0,0,'2022-08-23 00:00:00'),(167,1548290516624515072,5,10,'2022-08-22',0,0,0,'2022-08-23 00:00:01'),(168,1548290516624515072,5,11,'2022-08-22',0,0,0,'2022-08-23 00:00:01'),(169,1548290516624515072,5,0,'2022-08-22',0,0,0,'2022-08-23 00:00:01'),(170,1546715035601108992,4,2,'2022-08-22',0,0,0,'2022-08-23 00:00:01'),(171,1546715035601108992,4,3,'2022-08-22',0,0,0,'2022-08-23 00:00:01'),(172,1546715035601108992,4,0,'2022-08-22',0,0,0,'2022-08-23 00:00:01'),(173,1539515167128186880,3,1,'2022-08-22',0,0,0,'2022-08-23 00:00:01'),(174,1539515167128186880,3,0,'2022-08-22',0,0,0,'2022-08-23 00:00:01'),(175,1255060328322027520,2,0,'2022-08-22',0,0,0,'2022-08-23 00:00:01'),(176,1551836812819992576,7,0,'2022-08-23',0,0,0,'2022-08-24 00:00:00'),(177,1551834843753619456,6,12,'2022-08-23',0,0,0,'2022-08-24 00:00:00'),(178,1551834843753619456,6,13,'2022-08-23',0,0,0,'2022-08-24 00:00:00'),(179,1551834843753619456,6,14,'2022-08-23',0,0,0,'2022-08-24 00:00:00'),(180,1551834843753619456,6,15,'2022-08-23',0,0,0,'2022-08-24 00:00:00'),(181,1551834843753619456,6,0,'2022-08-23',0,0,0,'2022-08-24 00:00:00'),(182,1548290516624515072,5,4,'2022-08-23',0,0,0,'2022-08-24 00:00:00'),(183,1548290516624515072,5,5,'2022-08-23',0,0,0,'2022-08-24 00:00:01'),(184,1548290516624515072,5,6,'2022-08-23',0,0,0,'2022-08-24 00:00:01'),(185,1548290516624515072,5,7,'2022-08-23',0,0,0,'2022-08-24 00:00:01'),(186,1548290516624515072,5,8,'2022-08-23',0,0,0,'2022-08-24 00:00:01'),(187,1548290516624515072,5,9,'2022-08-23',0,0,0,'2022-08-24 00:00:01'),(188,1548290516624515072,5,10,'2022-08-23',0,0,0,'2022-08-24 00:00:01'),(189,1548290516624515072,5,11,'2022-08-23',0,0,0,'2022-08-24 00:00:01'),(190,1548290516624515072,5,0,'2022-08-23',0,0,0,'2022-08-24 00:00:01'),(191,1546715035601108992,4,2,'2022-08-23',0,0,0,'2022-08-24 00:00:01'),(192,1546715035601108992,4,3,'2022-08-23',0,0,0,'2022-08-24 00:00:01'),(193,1546715035601108992,4,0,'2022-08-23',0,0,0,'2022-08-24 00:00:01'),(194,1539515167128186880,3,1,'2022-08-23',0,0,0,'2022-08-24 00:00:01'),(195,1539515167128186880,3,0,'2022-08-23',0,0,0,'2022-08-24 00:00:01'),(196,1255060328322027520,2,0,'2022-08-23',0,0,0,'2022-08-24 00:00:01'),(197,1563418122722193408,8,17,'2022-08-28',0,0,0,'2022-08-29 00:00:00'),(198,1563418122722193408,8,18,'2022-08-28',0,0,0,'2022-08-29 00:00:00'),(199,1563418122722193408,8,19,'2022-08-28',0,0,0,'2022-08-29 00:00:00'),(200,1563418122722193408,8,20,'2022-08-28',0,0,0,'2022-08-29 00:00:00'),(201,1563418122722193408,8,21,'2022-08-28',0,0,0,'2022-08-29 00:00:00'),(202,1563418122722193408,8,0,'2022-08-28',0,0,0,'2022-08-29 00:00:00'),(203,1551836812819992576,7,0,'2022-08-28',0,0,0,'2022-08-29 00:00:00'),(204,1551834843753619456,6,12,'2022-08-28',0,0,0,'2022-08-29 00:00:00'),(205,1551834843753619456,6,13,'2022-08-28',0,0,0,'2022-08-29 00:00:00'),(206,1551834843753619456,6,14,'2022-08-28',0,0,0,'2022-08-29 00:00:00'),(207,1551834843753619456,6,15,'2022-08-28',0,0,0,'2022-08-29 00:00:00'),(208,1551834843753619456,6,16,'2022-08-28',0,0,0,'2022-08-29 00:00:00'),(209,1551834843753619456,6,0,'2022-08-28',0,0,0,'2022-08-29 00:00:00'),(210,1548290516624515072,5,4,'2022-08-28',0,0,0,'2022-08-29 00:00:00'),(211,1548290516624515072,5,5,'2022-08-28',0,0,0,'2022-08-29 00:00:00'),(212,1548290516624515072,5,6,'2022-08-28',0,0,0,'2022-08-29 00:00:00'),(213,1548290516624515072,5,7,'2022-08-28',0,0,0,'2022-08-29 00:00:00'),(214,1548290516624515072,5,8,'2022-08-28',0,0,0,'2022-08-29 00:00:00'),(215,1548290516624515072,5,9,'2022-08-28',0,0,0,'2022-08-29 00:00:00'),(216,1548290516624515072,5,10,'2022-08-28',0,0,0,'2022-08-29 00:00:01'),(217,1548290516624515072,5,11,'2022-08-28',0,0,0,'2022-08-29 00:00:01'),(218,1548290516624515072,5,0,'2022-08-28',0,0,0,'2022-08-29 00:00:01'),(219,1546715035601108992,4,2,'2022-08-28',0,0,0,'2022-08-29 00:00:01'),(220,1546715035601108992,4,3,'2022-08-28',0,0,0,'2022-08-29 00:00:01'),(221,1546715035601108992,4,0,'2022-08-28',0,0,0,'2022-08-29 00:00:01'),(222,1539515167128186880,3,1,'2022-08-28',0,0,0,'2022-08-29 00:00:01'),(223,1539515167128186880,3,0,'2022-08-28',0,0,0,'2022-08-29 00:00:01'),(224,1255060328322027520,2,0,'2022-08-28',0,0,0,'2022-08-29 00:00:01'),(225,1564500007003082752,17,31,'2022-08-30',0,0,0,'2022-08-31 00:00:00'),(226,1564500007003082752,17,0,'2022-08-30',0,0,0,'2022-08-31 00:00:00'),(227,1564254970935660544,16,30,'2022-08-30',0,0,0,'2022-08-31 00:00:00'),(228,1564254970935660544,16,0,'2022-08-30',0,0,0,'2022-08-31 00:00:00'),(229,1564250653516341248,15,29,'2022-08-30',0,0,0,'2022-08-31 00:00:00'),(230,1564250653516341248,15,0,'2022-08-30',0,0,0,'2022-08-31 00:00:00'),(231,1564200099133939712,14,28,'2022-08-30',0,0,0,'2022-08-31 00:00:00'),(232,1564200099133939712,14,0,'2022-08-30',0,0,0,'2022-08-31 00:00:00'),(233,1564189495946010624,13,27,'2022-08-30',0,0,0,'2022-08-31 00:00:01'),(234,1564189495946010624,13,0,'2022-08-30',0,0,0,'2022-08-31 00:00:01'),(235,1564152438620086272,12,26,'2022-08-30',0,0,0,'2022-08-31 00:00:01'),(236,1564152438620086272,12,0,'2022-08-30',0,0,0,'2022-08-31 00:00:01'),(237,1564147259887800320,11,25,'2022-08-30',0,0,0,'2022-08-31 00:00:01'),(238,1564147259887800320,11,0,'2022-08-30',0,0,0,'2022-08-31 00:00:01'),(239,1564143073913704448,10,24,'2022-08-30',0,0,0,'2022-08-31 00:00:01'),(240,1564143073913704448,10,0,'2022-08-30',0,0,0,'2022-08-31 00:00:01'),(241,1564116447956025344,9,23,'2022-08-30',0,0,0,'2022-08-31 00:00:01'),(242,1564116447956025344,9,0,'2022-08-30',0,0,0,'2022-08-31 00:00:01'),(243,1563418122722193408,8,0,'2022-08-30',0,0,0,'2022-08-31 00:00:01'),(244,1564500007003082752,17,31,'2022-09-22',0,0,0,'2022-09-23 00:00:00'),(245,1564500007003082752,17,0,'2022-09-22',0,0,0,'2022-09-23 00:00:00'),(246,1564254970935660544,16,30,'2022-09-22',0,0,0,'2022-09-23 00:00:00'),(247,1564254970935660544,16,0,'2022-09-22',0,0,0,'2022-09-23 00:00:00'),(248,1564250653516341248,15,29,'2022-09-22',0,0,0,'2022-09-23 00:00:00'),(249,1564250653516341248,15,0,'2022-09-22',0,0,0,'2022-09-23 00:00:00'),(250,1564200099133939712,14,28,'2022-09-22',0,0,0,'2022-09-23 00:00:00'),(251,1564200099133939712,14,0,'2022-09-22',0,0,0,'2022-09-23 00:00:00'),(252,1564189495946010624,13,27,'2022-09-22',0,0,0,'2022-09-23 00:00:00'),(253,1564189495946010624,13,0,'2022-09-22',0,0,0,'2022-09-23 00:00:00'),(254,1564152438620086272,12,26,'2022-09-22',0,0,0,'2022-09-23 00:00:00'),(255,1564152438620086272,12,0,'2022-09-22',0,0,0,'2022-09-23 00:00:00'),(256,1564147259887800320,11,25,'2022-09-22',0,0,0,'2022-09-23 00:00:01'),(257,1564147259887800320,11,0,'2022-09-22',0,0,0,'2022-09-23 00:00:01'),(258,1564143073913704448,10,24,'2022-09-22',0,0,0,'2022-09-23 00:00:01'),(259,1564143073913704448,10,0,'2022-09-22',0,0,0,'2022-09-23 00:00:01'),(260,1564116447956025344,9,23,'2022-09-22',0,0,0,'2022-09-23 00:00:01'),(261,1564116447956025344,9,0,'2022-09-22',0,0,0,'2022-09-23 00:00:01'),(262,1563418122722193408,8,0,'2022-09-22',0,0,0,'2022-09-23 00:00:01');
/*!40000 ALTER TABLE `author_income_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `author_info`
--

DROP TABLE IF EXISTS `author_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `author_info` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint unsigned NOT NULL COMMENT '用户ID',
  `invite_code` varchar(20) NOT NULL COMMENT '邀请码',
  `pen_name` varchar(20) NOT NULL COMMENT '笔名',
  `tel_phone` varchar(20) DEFAULT NULL COMMENT '手机号码',
  `chat_account` varchar(50) DEFAULT NULL COMMENT 'QQ或微信账号',
  `email` varchar(50) DEFAULT NULL COMMENT '电子邮箱',
  `work_direction` tinyint unsigned DEFAULT NULL COMMENT '作品方向;0-男频 1-女频',
  `status` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '0：正常;1-封禁',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_userId` (`user_id`),
  UNIQUE KEY `pk_id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='作者信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `author_info`
--

LOCK TABLES `author_info` WRITE;
/*!40000 ALTER TABLE `author_info` DISABLE KEYS */;
INSERT INTO `author_info` VALUES (1,1,'0','李马克','17754889839','17754889839','17754889839@qq.com',0,0,'2022-07-04 23:16:14','2022-07-04 23:16:14');
/*!40000 ALTER TABLE `author_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `book`
--

DROP TABLE IF EXISTS `book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `book` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `work_direction` tinyint(1) DEFAULT NULL COMMENT '作品方向，0：男频，1：女频''',
  `cat_id` int DEFAULT NULL COMMENT '分类ID',
  `cat_name` varchar(50) DEFAULT NULL COMMENT '分类名',
  `pic_url` varchar(200) NOT NULL COMMENT '小说封面',
  `book_name` varchar(50) NOT NULL COMMENT '小说名',
  `author_id` bigint DEFAULT NULL COMMENT '作者id',
  `author_name` varchar(50) NOT NULL COMMENT '作者名',
  `book_desc` varchar(2000) NOT NULL COMMENT '书籍描述',
  `score` float NOT NULL COMMENT '评分，预留字段',
  `book_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '书籍状态，0：连载中，1：已完结',
  `visit_count` bigint DEFAULT '103' COMMENT '点击量',
  `word_count` int DEFAULT NULL COMMENT '总字数',
  `comment_count` int DEFAULT '0' COMMENT '评论数',
  `yesterday_buy` int DEFAULT '0' COMMENT '昨日订阅数',
  `last_index_id` bigint DEFAULT NULL COMMENT '最新目录ID',
  `last_index_name` varchar(50) DEFAULT NULL COMMENT '最新目录名',
  `last_index_update_time` datetime DEFAULT NULL COMMENT '最新目录更新时间',
  `is_vip` tinyint(1) DEFAULT '0' COMMENT '是否收费，1：收费，0：免费',
  `status` tinyint(1) DEFAULT '0' COMMENT '状态，0：入库，1：上架',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `crawl_source_id` int DEFAULT NULL COMMENT '爬虫源站ID',
  `crawl_book_id` varchar(32) DEFAULT NULL COMMENT '抓取的源站小说ID',
  `crawl_last_time` datetime DEFAULT NULL COMMENT '最后一次的抓取时间',
  `crawl_is_stop` tinyint(1) DEFAULT '0' COMMENT '是否已停止更新，0：未停止，1：已停止',
  `is_alone_possess` tinyint(1) DEFAULT '0' COMMENT '授权状态：1，本站首发；2，他站首发',
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_uq_bookName_authorName` (`book_name`,`author_name`) USING BTREE,
  KEY `key_lastIndexUpdateTime` (`last_index_update_time`) USING BTREE,
  KEY `key_createTime` (`create_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='小说表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book`
--

LOCK TABLES `book` WRITE;
/*!40000 ALTER TABLE `book` DISABLE KEYS */;
INSERT INTO `book` VALUES (42,0,9,'其他','/images/default.png','测试小说',6,'一只马','这本小说是用来测试的,没有任何正式内容.',6.5,0,314,4832,0,0,1566680840233271296,'第一回  西王母瑶池开宴　天狼星月殿求姻','2022-09-05 14:53:14',0,0,'2022-09-05 14:52:28','2022-09-05 14:52:28',NULL,NULL,NULL,0,1),(43,0,9,'其他','/images/default.png','测试小说2',6,'一只马','第二本小说内容的测试',6.5,0,0,0,0,0,NULL,'',NULL,0,0,'2022-09-19 19:57:37','2022-09-19 19:57:37',NULL,NULL,NULL,0,1),(44,0,9,'其他','/images/default.png','测试小说3',6,'一只马','第三本小说内容的测试',6.5,0,1,0,0,0,NULL,'',NULL,0,0,'2022-09-19 19:58:24','2022-09-19 19:58:24',NULL,NULL,NULL,0,1);
/*!40000 ALTER TABLE `book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `book_author`
--

DROP TABLE IF EXISTS `book_author`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `book_author` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `invite_code` varchar(20) DEFAULT NULL COMMENT '邀请码',
  `pen_name` varchar(20) DEFAULT NULL COMMENT '笔名',
  `tel_phone` varchar(20) DEFAULT NULL COMMENT '手机号码',
  `chat_account` varchar(50) DEFAULT NULL COMMENT 'QQ或微信账号',
  `email` varchar(50) DEFAULT NULL COMMENT '电子邮箱',
  `work_direction` tinyint DEFAULT NULL COMMENT '作品方向，0：男频，1：女频',
  `status` tinyint DEFAULT NULL COMMENT '0：待审核，1：审核通过，正常，2：审核不通过',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_user_id` bigint DEFAULT NULL COMMENT '申请人ID',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `update_user_id` bigint DEFAULT NULL COMMENT '更新人ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='作者表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book_author`
--

LOCK TABLES `book_author` WRITE;
/*!40000 ALTER TABLE `book_author` DISABLE KEYS */;
/*!40000 ALTER TABLE `book_author` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `book_category`
--

DROP TABLE IF EXISTS `book_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `book_category` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `work_direction` tinyint(1) DEFAULT NULL COMMENT '作品方向，0：男频，1：女频''',
  `name` varchar(20) NOT NULL COMMENT '分类名',
  `sort` tinyint NOT NULL DEFAULT '10' COMMENT '排序',
  `create_user_id` bigint DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_user_id` bigint DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='小说类别表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book_category`
--

LOCK TABLES `book_category` WRITE;
/*!40000 ALTER TABLE `book_category` DISABLE KEYS */;
INSERT INTO `book_category` VALUES (1,0,'玄幻奇幻',10,NULL,NULL,NULL,NULL),(2,0,'武侠仙侠',11,NULL,NULL,NULL,NULL),(3,0,'都市言情',12,NULL,NULL,NULL,NULL),(4,0,'历史军事',13,NULL,NULL,NULL,NULL),(5,0,'科幻灵异',14,NULL,NULL,NULL,NULL),(6,0,'网游竞技',15,NULL,NULL,NULL,NULL),(7,1,'女生频道',16,NULL,NULL,NULL,NULL),(8,0,'文学',17,NULL,NULL,NULL,NULL),(9,0,'其他',18,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `book_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `book_chapter`
--

DROP TABLE IF EXISTS `book_chapter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `book_chapter` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `book_id` bigint unsigned NOT NULL COMMENT '小说ID',
  `chapter_num` smallint unsigned NOT NULL COMMENT '章节号',
  `chapter_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '章节名',
  `word_count` int unsigned NOT NULL COMMENT '章节字数',
  `is_vip` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否收费;1-收费 0-免费',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_bookId_chapterNum` (`book_id`,`chapter_num`) USING BTREE,
  UNIQUE KEY `pk_id` (`id`) USING BTREE,
  KEY `idx_bookId` (`book_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1445988184596992001 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='小说章节';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book_chapter`
--

LOCK TABLES `book_chapter` WRITE;
/*!40000 ALTER TABLE `book_chapter` DISABLE KEYS */;
/*!40000 ALTER TABLE `book_chapter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `book_comment`
--

DROP TABLE IF EXISTS `book_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `book_comment` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `book_id` bigint DEFAULT NULL COMMENT '小说ID',
  `comment_content` varchar(512) DEFAULT NULL COMMENT '评价内容',
  `reply_count` int DEFAULT '0' COMMENT '回复数量',
  `audit_status` tinyint(1) DEFAULT '0' COMMENT '审核状态，0：待审核，1：审核通过，2：审核不通过',
  `create_time` datetime DEFAULT NULL COMMENT '评价时间',
  `create_user_id` bigint DEFAULT NULL COMMENT '评价人',
  `support_count` int DEFAULT '0' COMMENT '支持数量',
  `opposition_count` int DEFAULT '0' COMMENT '反对数量',
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_uq_bookid_userid` (`book_id`,`create_user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='小说评论表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book_comment`
--

LOCK TABLES `book_comment` WRITE;
/*!40000 ALTER TABLE `book_comment` DISABLE KEYS */;
INSERT INTO `book_comment` VALUES (11,1254678892443795456,'好书呀，值得一看',0,0,'2020-04-28 17:04:56',1255060328322027520,0,0),(12,1254954626689150976,'ffgfgfffffffffff',0,0,'2020-04-30 08:35:53',1255060328322027520,0,0),(13,1,'评论内容必须大于5个字',0,0,'2022-06-22 15:52:02',1539515167128186880,0,0),(14,4,'我的第一条评论',0,0,'2022-07-16 20:58:24',1548290516624515072,0,0),(15,15,'小斯,你放肆.',0,0,'2022-08-19 21:31:32',1551834843753619456,0,0),(18,4,'第二条评论',0,0,'2022-08-25 21:44:18',1551834843753619456,0,0);
/*!40000 ALTER TABLE `book_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `book_comment_copy1`
--

DROP TABLE IF EXISTS `book_comment_copy1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `book_comment_copy1` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `book_id` bigint unsigned NOT NULL COMMENT '评论小说ID',
  `user_id` bigint unsigned NOT NULL COMMENT '评论用户ID',
  `comment_content` varchar(512) NOT NULL COMMENT '评价内容',
  `reply_count` int unsigned NOT NULL DEFAULT '0' COMMENT '回复数量',
  `audit_status` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '审核状态;0-待审核 1-审核通过 2-审核不通过',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_bookId_userId` (`book_id`,`user_id`),
  UNIQUE KEY `pk_id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='小说评论';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book_comment_copy1`
--

LOCK TABLES `book_comment_copy1` WRITE;
/*!40000 ALTER TABLE `book_comment_copy1` DISABLE KEYS */;
/*!40000 ALTER TABLE `book_comment_copy1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `book_comment_reply`
--

DROP TABLE IF EXISTS `book_comment_reply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `book_comment_reply` (
  `id` bigint NOT NULL COMMENT '主键',
  `comment_id` bigint DEFAULT NULL COMMENT '评论ID',
  `reply_content` varchar(512) DEFAULT NULL COMMENT '回复内容',
  `audit_status` tinyint(1) DEFAULT '0' COMMENT '审核状态，0：待审核，1：审核通过，2：审核不通过',
  `create_time` datetime DEFAULT NULL COMMENT '回复用户ID',
  `create_user_id` bigint DEFAULT NULL COMMENT '回复时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='小说评论回复表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book_comment_reply`
--

LOCK TABLES `book_comment_reply` WRITE;
/*!40000 ALTER TABLE `book_comment_reply` DISABLE KEYS */;
/*!40000 ALTER TABLE `book_comment_reply` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `book_content`
--

DROP TABLE IF EXISTS `book_content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `book_content` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `index_id` bigint DEFAULT NULL COMMENT '目录ID',
  `content` mediumtext COMMENT '小说章节内容',
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_uq_indexId` (`index_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='小说内容表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book_content`
--

LOCK TABLES `book_content` WRITE;
/*!40000 ALTER TABLE `book_content` DISABLE KEYS */;
/*!40000 ALTER TABLE `book_content` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `book_content0`
--

DROP TABLE IF EXISTS `book_content0`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `book_content0` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `index_id` bigint DEFAULT NULL COMMENT '目录ID',
  `content` mediumtext COMMENT '小说章节内容',
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_uq_indexId` (`index_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=779802807136944129 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='小说内容表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book_content0`
--

LOCK TABLES `book_content0` WRITE;
/*!40000 ALTER TABLE `book_content0` DISABLE KEYS */;
/*!40000 ALTER TABLE `book_content0` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `book_content1`
--

DROP TABLE IF EXISTS `book_content1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `book_content1` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `index_id` bigint DEFAULT NULL COMMENT '目录ID',
  `content` mediumtext COMMENT '小说章节内容',
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_uq_indexId` (`index_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='小说内容表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book_content1`
--

LOCK TABLES `book_content1` WRITE;
/*!40000 ALTER TABLE `book_content1` DISABLE KEYS */;
/*!40000 ALTER TABLE `book_content1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `book_content2`
--

DROP TABLE IF EXISTS `book_content2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `book_content2` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `index_id` bigint DEFAULT NULL COMMENT '目录ID',
  `content` mediumtext COMMENT '小说章节内容',
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_uq_indexId` (`index_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=779802807006920705 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='小说内容表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book_content2`
--

LOCK TABLES `book_content2` WRITE;
/*!40000 ALTER TABLE `book_content2` DISABLE KEYS */;
/*!40000 ALTER TABLE `book_content2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `book_content3`
--

DROP TABLE IF EXISTS `book_content3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `book_content3` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `index_id` bigint DEFAULT NULL COMMENT '目录ID',
  `content` mediumtext COMMENT '小说章节内容',
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_uq_indexId` (`index_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='小说内容表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book_content3`
--

LOCK TABLES `book_content3` WRITE;
/*!40000 ALTER TABLE `book_content3` DISABLE KEYS */;
/*!40000 ALTER TABLE `book_content3` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `book_content4`
--

DROP TABLE IF EXISTS `book_content4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `book_content4` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `index_id` bigint DEFAULT NULL COMMENT '目录ID',
  `content` mediumtext COMMENT '小说章节内容',
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_uq_indexId` (`index_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=779802805182398465 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='小说内容表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book_content4`
--

LOCK TABLES `book_content4` WRITE;
/*!40000 ALTER TABLE `book_content4` DISABLE KEYS */;
/*!40000 ALTER TABLE `book_content4` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `book_content5`
--

DROP TABLE IF EXISTS `book_content5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `book_content5` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `index_id` bigint DEFAULT NULL COMMENT '目录ID',
  `content` mediumtext COMMENT '小说章节内容',
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_uq_indexId` (`index_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='小说内容表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book_content5`
--

LOCK TABLES `book_content5` WRITE;
/*!40000 ALTER TABLE `book_content5` DISABLE KEYS */;
/*!40000 ALTER TABLE `book_content5` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `book_content6`
--

DROP TABLE IF EXISTS `book_content6`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `book_content6` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `index_id` bigint DEFAULT NULL COMMENT '目录ID',
  `content` mediumtext COMMENT '小说章节内容',
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_uq_indexId` (`index_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=779802806868508673 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='小说内容表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book_content6`
--

LOCK TABLES `book_content6` WRITE;
/*!40000 ALTER TABLE `book_content6` DISABLE KEYS */;
INSERT INTO `book_content6` VALUES (773560496954540032,1566680840233271296,'<br>　　女仙，唐赛儿也，说是月殿嫦娥降世。当燕王兵下南都之日，赛儿起义勤王，尊奉建文皇帝位号二十余年。而今叙他的事，有关于正史，故曰《女仙外史》。请问：安见得赛儿是嫦娥降世？劈头这句话，似乎太悬虚了。看书者不信，待老夫先说个极有考据的引子起来。<br>　　宋朝真宗皇帝，因艰于嗣胤，建造昭灵宫祈子。诚格上天。玉帝问仙真列宿：“谁肯下界为大宋太平天子？”两班中绝无应者，止有赤脚大仙微笑。上帝曰：“笑者未免有情。”遂命大仙降世。诞生之后，号哭不止，御医无方可疗。忽宫门有一老道人，自言能治太子啼哭，真宗召令看视。道人抚摩太子之顶曰：“莫叫莫叫，何似当年莫笑。文有文曲，武有武曲，休哭休哭。”太子就不啼哭。是为仁宗皇帝。此道人乃是长庚星，说的文曲是文彦博，武曲是狄青，皆辅佐仁宗致治之将相。要知成仙成佛者，总属无情。赤脚大仙一笑，便是情缘，少不得要下界去的。然而此情又种种不同。或因乎喜，或因乎忿，或因乎恩爱仇怨，各随其所因，便要做出许多事来。试看古来英雄豪杰、忠臣烈士，如伍员之兴吴覆楚，子房之为韩报仇，关神武之讨贼伐曹，张睢阳之起兵拒寇，郭汾阳之再造唐室，岳少保之誓迎二帝，文丞相之建义勤王，没而为神圣者，史册所载，不可枚举。即就建文逊国之后，诸臣殉难，有佥都御史景清，假为曲从，衣藏利刃，欲刺永乐。钦天监奏文曲星犯帝座甚急，其色赤，而景公适着绯衣，岂非明验？东坡先生云：“其生也有自来，其死也有所为。故申吕自岳降，傅说为箕尾。”<br>　　此理之常，无足怪者。至于女子，亦有同然。如柴绍之妻，统娘子军而起义；朱序之母，筑夫人城而拒敌；李毅之女，自领宁州印而大破苓夷。至若高凉之洗夫人为女前星，辽之萧太后是婺宿，唐之则天皇帝是大罗天女，亦皆传记所载，夫岂诞妄者哉？<br>　　而今话归正传。按道书云：天上有一位万劫不坏的金仙，圣号称做王母，居于瑶池。池在东天之西偏，亦名曰西池，王母亦名曰西母。天上各有境界，东天是道祖三清及群仙所居，西天是如来佛祖及诸菩萨、阿罗汉所止，北天是玄武大帝暨众神将治焉。吴天上帝之宫阙，则在中央而统辖南天。<br>　　南天虽有南极老人与南斗星官，要皆在上帝统辖之内。上帝好生，敢居中而治南，有长养万物之义。玄帝统雷霆神将，以肃杀为主，故居于北。佛宗寂灭无生，故以西方为极乐。道家以一炁长生为主，是以占于东方，取气始生之义。王母所居珠楼贝阙，在瑶池之畔。此池非下界之水，乃是融成玉之精髓，溶溶漾漾，竟如酒浆一般。说话的错了，美玉入火则愈坚，次则如石之成灰矣，怎么融化得水来？噫，盍亦反其本而思之！美玉原是石髓所结，是以璞在石中。髓可结成玉，玉不可化为髓乎？蚌珠见月而化为津。凡物皆有相感之处，非寻常所能测识者。即如仙家之酒，名曰琼浆玉液，要皆琼瑶所化之髓，难道也是凡间曲米酿成的么？<br>　　那瑶池之北，有三座大殿。中间一座名碧桃殿，东名青鸾，西名石麟。三殿皆因物命名。其碧桃树在西池之南，高八十寻有咫，俗所云蟠桃，万年一结子者，正对中间大殿。玲珑盘郁，势若虬龙，不但下界所无，即佛家之娑罗、广寒之丹桂与夫三岛之珠林琼树，亦迥乎不同。这是何故？只为他有瑶水浸润：故其枝叶花葩皆带玉之精华，在仙树为独冠。所结蟠桃，食一枚寿与天齐，若是三枚，能超万劫。西母于桃熟之日开宴，止请佛菩萨、道祖天尊与上帝及诸大仙真。其余一切仙官仙吏、海岛洞府散仙、斗牛宫二十八宿，总不得与。是以岁星东方朔，每至窃食。今此一度，碧桃繁盛，倍于从前，凡散仙列宿，亦多邀请，为万劫以来第一盛会。其时佛祖、仙真，次第咸集，唯上帝后至。遥见銮驾雍容，御的是绿琼辇，张的是紫云盖，星幢前导，羽葆后拥，众仙皆俯伏远迎。<br>　　上帝先与如来、诸佛祖、三清道祖稽首而言曰：“元运告终，民生应罹兵劫三回。已命娄金宿下界，勘平祸乱，今又命天狼星下界。计民生应遭杀戮者五百余万。朕检阅册籍，凡人有一事一念之善者，悉与特宥。”如来合掌云；“善哉善哉，帝德之好生也。”西王母遂请入座。向南正中释迦如来，左是过去诸佛，右是未来诸佛，前是三清道祖，东西向皆诸大菩萨。东间上帝南向；左坐昭位，第一玄武大帝，以下皆诸天尊；右坐穆位，青华帝君第一，以下皆诸大真人。西间南向独坐是南海大士；北向两座，左为斗姥天尊，右为九天玄女。东向首座鬼母天尊，西向首座天孙织女，余为太微左夫人、九华安妃、昭灵夫人、观香夫人、月殿嫦娥、魏元君、许飞琼、段安香、何仙姑、麻姑、樊夫人、王太真、阮灵华、周琼英、鲍道姑、吴彩鸾、云英等女仙真。西王母陪席。其蟠桃每人一颗，上帝、三清、佛祖各两颗，唯释迦如来是三。佐以交梨火枣，雪藕冰桃。酒则琼浆玉液，丹则绛雪玄霜。如来手举蟠桃而设偈曰：<br>　　桃有万年子，人无百岁春。<br>　　可怜虚宝筏，若个渡迷津？<br>　　然后剖食。迦叶在侧垂涎，阿难睨而笑之，如来即以一桃与迦叶，一桃与阿难。道祖老君亦以一枚与金银二童子分食。时南极老人跨来之鹤，舒翼旋舞，延颈徐鸣，如中音节。而鹿亦跳跃呦呦，俯首伏地，若乞怜状。南极笑曰：“你这两个畜生，也想要吃这样的好东西。”因以指爪各掐一片与之。大士见善财童子在旁注视，亦授以一枚。善财曰：“菩萨想是年老健忘了。我在西天路上做大王要吃唐僧，那时菩萨抛下个箍儿，将我两手合住，再不得开，如何来接桃子？”大士向着众女仙道：“这个孩子虽是牛种，到也聪明。只是他学好之心却还未定，是以至今箍住他双手。”众女仙皆各称善，大士将手一指，善财两手分开，接去桃子。吃毕，仍旧合拢了。有嫦娥左右二仙女，一名素英，一句寒簧，是最亲近的。嫦娥以蟠桃分作三分，以二小分与二仙女，一大分自尝。王母见了，便问侍女董双成、谢长珠：“还剩下蟠桃多少？”<br>　　董仙女就知要与嫦娥，因答云：“往年结得少，到剩二十余枚；今岁结得多，反剩得十一颗。”王母云：“这丫鬟悭吝！可取一个来，余十枚留与你们分吃罢。”董仙女因检一枚送到，王母随递与嫦娥道：“嫦娥，今将远别，分外申敬一枚。”嫦娥不知所谓，只道是筵散分别的话，欠身谢道：“佛祖、道祖止有二颗，小仙何德敢承？”坚辞不受。斗战胜佛大言曰：“谁谓仙家无情？以我看来，比凡人还胜。请看王母剩下蟠桃，独与嫦娥，若说不是有情，因何不多送我一颗？”如来曰：“王母送与嫦娥，礼也，非情也。犹如下界饯行一般。悟空你已成佛，何犹似旧日粗鲁？”老君云：“前次蟠桃会，他一人偷食许多，今止一个，岂能遂意？怪不得他要争了。”斗战胜佛笑曰：“我这个成佛，犹之乎盗贼做了官，今日撞着了对头。”合座皆笑。王母与众仙亦各微笑。只有嫦娥，又闻如来饯行之言，与王母远别二字，适相吻合，心下十分疑惑，全无笑容。大士曰：“这颗蟠桃，王母是该送的，嫦娥是该受的，不须推辞。”嫦娥只得勉强受了，便稽首大士前曰：“小仙常愿皈依如来，因自爱其发，不肯遽剃，深以为惭。今愿皈依大士，恳救指示未来。”<br>　　大士曰：“要知未来，先明既往，你自省之。”嫦娥愈不能知其故，复又稽首恳请，大士乃微露其端曰：“嫦娥不记得奔月时乎？那时王母娘以丹药赐与有穷国君后羿。尔时为国妃，窃晱其丹，因得飞身入月。独是后羿情缘未尽，恐将来数到，不能不为了局。”嫦娥默然半晌曰：“我闻缘从情发，情亦从缘发，若一心不动，情缘两灭。小仙在月宫清修数千年，情缘亦已扫除，不知从何而发？”大士曰：“缘有二种：好缘曰情，恶缘曰孽。情缘，如铁与磁石遇则必合，不但人不能强之不合，即天亦不能使之不合也。孽缘，如铁之与火石，遇则必有激而合者，孽之谓也。是则凡人多溺于其内，而仙则能超乎其外者也。嫦娥请记斯言，后当有验。”如来曰：“善哉，大土之论姻缘也！”遂向王母合掌谢宴。<br>　　诸菩萨、众仙真各随如来谢毕，先送道祖、佛祖、上帝起行，然后次第稽首而散。唯嫦娥犹向西母依依不舍，再叩未来之事。西母因示之曰：“未来须似现在，慎勿忘却今日之会。”嫦娥载拜祗受，方骖素鸾，驾彩云，引二仙女冉冉归向广寒阙下。猛见侧首突出一人，径来抢抱嫦娥。那素鸾是神鸟，知道有人行凶，从刺斜里侧翅飞退。此人却与二仙女撞个满怀，好汉仗也！但见他：<br>　　头戴星冠，灿烂晃瑶台明月；身披鹤氅，飘飘动绛阙香风。两道剑眉浓似墨，斜飞插鬓；一双鹘眼明于电，直射侵人。膀阔腰细，浑身有千百斤膂力；疐尾跋胡，行动有三四回顾盼。原来是斗牛宫赫赫天狼星，不分做大明国岩岩新帝主。只因好色爱嫦娥，故此潜身来月殿。<br>　　嫦娥远远望去，认是天狼星，知道他心怀不良。又恐他竟行鲁莽起来，抵敌不住，要用个礼来服他。时二仙女吃了惊，已飞身到素鸾之侧。嫦娥授之以意，二仙女乃款款向前，敛素袂、启朱唇道：“太阴宫仙主拜上星官：适从蟠桃会上，闻星官奉敕为大明太平天子，尚未称贺，已抱惶悚。今驾枉临，又失祗迎，谅星官圣德渊深，不加呵责。倘有明谕，当于翌晨拥帚候驾。天令森严，不宜静夜交接，伏惟见谅。”天狼见说到理路，不便用强，遂向二仙女深深作揖道：“我奉上帝敕旨，令午刻下界。今已迟了四个时辰，岂能延至明日？烦仙女上达嫦娥：我应做三十四年太平天子，少个称心的皇后。我今夜就要与嫦娥成亲，一齐下界，二位仙娥，也做个东西二宫，岂不快活？何苦在广寒宫冷冰冰的所在守寡呢！”嫦娥听见，不觉大怒，骂道：“泼怪物！上帝洪恩，敕你下界做天子，乃敢潜入月宫，调谑金仙，有干天律！我即奏明上帝，决斩尔首，悬之阙下。”天狼星又陪笑道：“嫦娥，你当时为有穷国后，不过诸侯之妃。我今是大一统天子，请你为后，也不辱没了。就同去见上帝，婚姻大礼，有何行不得呢？”嫦娥愈加恼怒，厉声毒骂。天狼料道善求不来，便推开二仙女，飞步来抢嫦娥。嫦娥心慌，遂弃了素鸾，化道金光，飞入织女宫中。那织女是天帝之孙女，天狼星如何敢去？恐他启奏金阙，弄出事来，即掣身竟出南天门。守门神将，已是知道奉敕的，放他下界，到洪武宫中投胎去了。<br>　　且说织女正在水殿上凭栏静坐，看这银河，似波非波，似浪非浪，一派晶莹滉漾，乃是西天素金之气，流注东南，或隐或现，随斗星而旋转，但能沉物，不能浮物的。《汉书》上所云张骞乘槎犯斗牛，又海上老人乘槎至天河，织女与支机石而返，岂不是荒唐之语？闲话休题。其时织女方欲回宫，见正东上一道金光，直向水殿飞来。起身看时，那金光敛聚，却是嫦娥，玉容含着微微的恚意。织女知有缘故，便请坐定，从容而问。嫦娥备述一遍。织女曰：“这厮直恁无礼！若赶到这边来，我教神将拿住，现其原形，拴在苑树上，与嫦娥消气。”嫦娥道：“他怎敢到这里？只怕下界去了。我如今劾他一疏，教他做这大明天子不成。”织女道：“事到其间，若不劾奏，嫦娥倒有不是，这是势不容已的。但据我看来，尔顶上三炁，动了嗔怒，已杂烟焰，免不得也要下界去走一遭。”嫦娥道：“这不是我过犯，怎样谪下？”织女道：“不是谪下，大约有个数在那里。”嫦娥道：“噫！我若下界，如何能再到月宫？还求天孙为我主持。”织女道：“我不能使尔不下界，或者下界之后，我烦个女仙真来指示迷途，仍返瑶台，便亦无妨。”嫦娥悲咽道：“不期西池上佛祖、大士、王母之言，应在顷刻！”<br>　　说话之间，素鸾与二仙女皆至。嫦娥随谢别了织女，回到蟾宫。问侍女辈：“天狼星来，可曾进我宫内？”有好些素女齐声回言道：“怎不进宫？还来调戏我等！直教玉兔儿将玉杵打出去，不知他还躲在阙下。”嫦娥道：“直恁无礼，怎饶得过？”随命素英草奏，片刻成就。嫦娥看毕，竟诣紫虚阙下，恭候早朝。有顷，上帝御通明殿，见嫦娥持表，随班晋至丹陛，已知其故，令葛仙翁接上表文。略曰：<br>　　太阴广寒府三羔金仙臣妾唐姮，昧死顿首顿首，具奏玉皇大天尊玄穹高上帝陛下：窃惟天律森严，首戒贪淫，仙府清虚，尤期贞静。臣姮昨随御驾西池宴归，不意天狼星从广寒飞出，竟抢妾身。幸藉素鸾倒退，得脱毒手；寒簧抵住，扣问来因。天狼星大言，敕赐人间帝子，要取月里嫦娥。凶威凛凛，竟要逼赴阳台；煞气棱棱，辄欲拐奔尘世。而且于臣姮未归之先，直入蟾宫，闺闼遭其蹂躏；横行桂殿，侍女受其狼藉。此等劣恶星官，似难膺享帝福，必至杀害忠良，茶毒黎庶。即其已奉天书，尚敢故违钦限。藐天法于弁髦，狎仙规如儿戏。丧德败检，旷劫希闻。伏望陛下赐遣神将追还，按律处治，肃仙府之威仪，免人间之劫数。不独臣姮蒙不朽之恩，下民亦荷无疆之福矣。姮冒死谨具奏以闻。<br>　　帝命嫦娥至前，谕之曰：“汝奏请追还天狼，乃是常人之见，非仙真之语也。天狼之帝福，是他自己所积，非朕之所与。下民劫数，亦是众生自己造来，非朕所罚。朕乃是顺运数以行赏罚，非以赏罚而为运数也。天狼星即位之后，还有一大劫数，应汝掌主，并完夙生未了之事。若天狼星之应当受罚，自然在后，今还早着。”遂令传旨与送生仙女，于明日送嫦娥下界。<br>　　嫦娥大惊，含泪奏道：“帝旨敢不钦遵？独是一涉尘世情缘，便有孽债缠缚，迷乱心神，安能再返清真？臣姮哀恳圣恩，将上界最苦的差罚臣去做。即使历劫之久，亦所甘心。”俯伏不起。上帝曰：“汝不记大士之言乎？数在，朕不能拗也。但汝有此苦衷，足见清修道力。若向前途，还能不昧灵根，去来自如矣。”时二十四诸天中，闪出鬼子母天尊，启奏道：“嫦娥此番下界，看来为天狼星所害。臣心深为不平，愿去维持嫦娥也。”上帝道：“既动此念，便是数中有名人物。但时尚未至，不可轻言。”嫦娥到此地位，心已了了，遂前跽奏道：“臣妾谪下，已知数定。但掌生民劫运，易造杀孽。凡有应行事宜，恳求圣慈明诲，俾臣妾得遵奉而行，庶免堕落。”帝乃敕诫曰：“汝去，有几件至正至大的事，是你所应做的。如天伦崩坏，汝须扶植；人心悖乱，汝须戡正，褒显忠节，诛殛叛佞。彰瘅均得其宜，便是有功无过。谨记朕言。”<br>　　嫦娥叩首谢恩而退。随向绛河阙下谒见织女，具述帝旨。织女道：“帝意极好，但将来功行，总在尔的方寸，须牢记着。瑶池会上的女仙真，少不得有个来指导的。”嫦娥就将鬼母天尊愿去的话说了。织女道：“非也，他不过暂助神通尔。有一位葛仙卿的夫人鲍道姑，誓愿弘深，最肯度世。他在西池驾下。我当启奏金母，烦他下界来，始终教育，以成大道，不愁不返瑶台也。”嫦娥再拜，谢了织女。回到月殿，与素女辈泣别。寒簧、素英皆愿随去，送生仙女止住道：“私去不得，要奉敕旨的。”二仙女牵衣痛哭，嫦娥亦不肯舍，乃作书一函，令去求天孙娘娘。又作两笺，启达西池王母、南海大士，不过敬谢教诲，并恳救度之意。方随送生仙女，下界投胎。正是天上神仙降，定在人间将相家。且看下回分说。');
/*!40000 ALTER TABLE `book_content6` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `book_content7`
--

DROP TABLE IF EXISTS `book_content7`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `book_content7` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `index_id` bigint DEFAULT NULL COMMENT '目录ID',
  `content` mediumtext COMMENT '小说章节内容',
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_uq_indexId` (`index_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='小说内容表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book_content7`
--

LOCK TABLES `book_content7` WRITE;
/*!40000 ALTER TABLE `book_content7` DISABLE KEYS */;
/*!40000 ALTER TABLE `book_content7` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `book_content8`
--

DROP TABLE IF EXISTS `book_content8`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `book_content8` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `index_id` bigint DEFAULT NULL COMMENT '目录ID',
  `content` mediumtext COMMENT '小说章节内容',
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_uq_indexId` (`index_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=779802807401185281 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='小说内容表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book_content8`
--

LOCK TABLES `book_content8` WRITE;
/*!40000 ALTER TABLE `book_content8` DISABLE KEYS */;
/*!40000 ALTER TABLE `book_content8` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `book_content9`
--

DROP TABLE IF EXISTS `book_content9`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `book_content9` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `index_id` bigint DEFAULT NULL COMMENT '目录ID',
  `content` mediumtext COMMENT '小说章节内容',
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_uq_indexId` (`index_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='小说内容表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book_content9`
--

LOCK TABLES `book_content9` WRITE;
/*!40000 ALTER TABLE `book_content9` DISABLE KEYS */;
/*!40000 ALTER TABLE `book_content9` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `book_index`
--

DROP TABLE IF EXISTS `book_index`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `book_index` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `book_id` bigint NOT NULL COMMENT '小说ID',
  `index_num` int NOT NULL COMMENT '目录号',
  `index_name` varchar(100) DEFAULT NULL COMMENT '目录名',
  `word_count` int DEFAULT NULL COMMENT '字数',
  `is_vip` tinyint DEFAULT '0' COMMENT '是否收费，1：收费，0：免费',
  `book_price` int DEFAULT '0' COMMENT '章节费用（屋币）',
  `storage_type` varchar(10) NOT NULL DEFAULT 'db' COMMENT '存储方式',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_uq_bookId_indexNum` (`book_id`,`index_num`) USING BTREE,
  KEY `key_bookId` (`book_id`) USING BTREE,
  KEY `key_indexNum` (`index_num`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1572923150793105409 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='小说目录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book_index`
--

LOCK TABLES `book_index` WRITE;
/*!40000 ALTER TABLE `book_index` DISABLE KEYS */;
INSERT INTO `book_index` VALUES (1566680840233271296,42,0,'第一回  西王母瑶池开宴　天狼星月殿求姻',4832,0,24,'db','2022-09-05 14:53:14','2022-09-05 14:53:14');
/*!40000 ALTER TABLE `book_index` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `book_info`
--

DROP TABLE IF EXISTS `book_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `book_info` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `work_direction` tinyint unsigned DEFAULT NULL COMMENT '作品方向;0-男频 1-女频',
  `category_id` bigint unsigned DEFAULT NULL COMMENT '类别ID',
  `category_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '类别名',
  `pic_url` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '小说封面地址',
  `book_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '小说名',
  `author_id` bigint unsigned NOT NULL COMMENT '作家id',
  `author_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '作家名',
  `book_desc` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '书籍描述',
  `score` tinyint unsigned NOT NULL COMMENT '评分;总分:10 ，真实评分 = score/10',
  `book_status` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '书籍状态;0-连载中 1-已完结',
  `visit_count` bigint unsigned NOT NULL DEFAULT '103' COMMENT '点击量',
  `word_count` int unsigned NOT NULL DEFAULT '0' COMMENT '总字数',
  `comment_count` int unsigned NOT NULL DEFAULT '0' COMMENT '评论数',
  `last_chapter_id` bigint unsigned DEFAULT NULL COMMENT '最新章节ID',
  `last_chapter_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '最新章节名',
  `last_chapter_update_time` datetime DEFAULT NULL COMMENT '最新章节更新时间',
  `is_vip` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否收费;1-收费 0-免费',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_bookName_authorName` (`book_name`,`author_name`) USING BTREE,
  UNIQUE KEY `pk_id` (`id`) USING BTREE,
  KEY `idx_createTime` (`create_time`) USING BTREE,
  KEY `idx_lastChapterUpdateTime` (`last_chapter_update_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1431630596354977793 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='小说信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book_info`
--

LOCK TABLES `book_info` WRITE;
/*!40000 ALTER TABLE `book_info` DISABLE KEYS */;
INSERT INTO `book_info` VALUES (1334318182169681920,0,4,'历史军事','/localPic/2020/12/03/d307192479a34d79adae6a1f7521aefa.jpg','我给战神王爷寄刀片',0,'汐娴阳光','&nbsp;&nbsp;&nbsp;&nbsp;她是冉府的嫡长女确被迫从小离开冉府，他是纪国的战神，更是纪国女子心中的男神。<br/><br/>&nbsp;&nbsp;&nbsp;&nbsp;多年后，她学得一身本事再回冉府为母报仇，成了冉府的一抹黑月光，一场巧遇，这抹黑月光成了战神王爷的心尖宝，看黑月光和战神王爷碰撞的爱情火花是闪瞎你的眼还是甜进你的心？<br/><br/>&nbsp;&nbsp;&nbsp;&nbsp;有喜欢阳光的小可......爱们，可以加阳光的qq群哟：807833254【展开】【收起】',6,0,1395,251754,0,1334318251233091584,'第49章  散去','2020-12-03 10:07:00',0,NULL,NULL),(1334318497132552192,0,6,'网游竞技','/localPic/2020/12/03/c734eb38ee9d4968988642d0665d7e22.jpg','我有家诸天最强当铺',0,'白袍小飞','&nbsp;&nbsp;&nbsp;&nbsp;诸天万界最强当铺，本店物资丰富、价格公道、童叟无欺，只有您想不到的，没有本店没有的。<br/><br/>&nbsp;&nbsp;&nbsp;&nbsp;只要您能拿出有价值的东西来典当，本店保证，什么神仙皇帝，在您面前都得靠边站。<br/><br/>&nbsp;&nbsp;&nbsp;&nbsp;本店营业地址不定，联系方式暂无，如需交易，请在心中默念：第一当铺，诸天最强，我要交易，快快现身。<br/><br/>&nbsp;&nbsp;&nbsp;&nbsp;第一当铺掌柜楚河的私密日记第一页：经营当铺？小意思，不就是做奸商吗，没有人比我更懂做奸商。<br/><br/>&nbsp;&nbsp;&nbsp;&nbsp;第一当铺掌柜楚河的私密日记第二页：我从没想过赚穷人的钱，干翻那些大人物，他们的钱就是我的了。',6,0,500,418946,4,1338409103948558336,'第八十六章 小冰是最好的超智能机器人','2020-12-14 17:02:51',0,NULL,NULL),(1334318818323963904,0,6,'网游竞技','/localPic/2020/12/03/78c9dcfe5b5d4b70a04b34df4659fc59.jpg','名侦探修炼手册',0,'肥瓜','&nbsp;&nbsp;&nbsp;&nbsp;请谨记，永远不要去挖掘那些未被解开的谜题。<br/><br/>&nbsp;&nbsp;&nbsp;&nbsp;因为你永远不会知道，当时的人们为了将其掩盖，付出了多大的代价。<br/><br/>&nbsp;&nbsp;&nbsp;&nbsp;虚假平静的表面之下，大多数的真相都是残酷的......<br/><br/>&nbsp;&nbsp;&nbsp;&nbsp;好吧，我说的再明白点。<br/><br/>&nbsp;&nbsp;&nbsp;&nbsp;如果有一天，你在下班的路上看到一本书掉在地上，拴住你的好奇心，千万不要去碰它。<br/><br/>&nbsp;&nbsp;&nbsp;&nbsp;......<br/><br/>&nbsp;&nbsp;&nbsp;&nbsp;很遗憾，最初的周言并没有认识到这一点。<br/><br/>&nbsp;&nbsp;&nbsp;&nbsp;所以他将那本书捡了起来。<br/><br/>&nbsp;&nbsp;&nbsp;&nbsp;那书有个很别扭的名字———《名侦探修炼手册》<br/><br/>&nbsp;&nbsp;&nbsp;&nbsp;至于作者......叫肥瓜。',6,0,836,365516,1,1338324338831630336,'第七十章 完美犯罪','2020-12-14 11:26:02',0,NULL,NULL),(1334328310788882432,0,4,'历史军事','/localPic/2020/12/03/775d5845493d4be8b3254a29cfd9e05e.jpg','北国谍影',0,'寻青藤','　　一九三九春，中共地下党员，军统情报站特工许诚言，奉命前往太原锄奸，眼见日寇的残暴，为抗击日寇决定深入敌后，化身蝰蛇，刺杀敌酋，清除汉奸，潜伏敌营，收集情报，在这片北国大地上，续写谍战传奇！北国谍影官方1群：833528943北国谍影官方2群：879936725',6,0,529,392546,0,1338427337871503360,'第七十二章 采访任务','2020-12-14 18:15:19',0,NULL,NULL),(1334334734843609088,0,6,'网游竞技','/localPic/2020/12/03/850e3ee448324e66942c46014db0a0c8.jpg','家里来了个野原琳',0,'冰镇菠萝吹雪','&nbsp;&nbsp;&nbsp;&nbsp;“你愿意获得强大的力量吗?”<br/><br/>&nbsp;&nbsp;&nbsp;&nbsp;“我愿意。”<br/><br/>&nbsp;&nbsp;&nbsp;&nbsp;“你愿意和一个小美女同居吗?”<br/><br/>&nbsp;&nbsp;&nbsp;&nbsp;“我愿意。”<br/><br/>&nbsp;&nbsp;&nbsp;&nbsp;“你愿意时不时来一场其它位面双人游吗?”<br/><br/>&nbsp;&nbsp;&nbsp;&nbsp;“我都......愿意，可你能给我吗?问这么多。”<br/><br/>&nbsp;&nbsp;&nbsp;&nbsp;“契约达成，力量、美女、系统马上发放。”<br/><br/>&nbsp;&nbsp;&nbsp;&nbsp;呃……于是乎，主角苏白开局成为十尾人柱力，开启轮回眼仙人体，同时拥有了十二符咒的力量，还有了一个名叫野原琳的同居女友，瞬间这辈子走上了人生巅峰。<br/><br/>&nbsp;&nbsp;&nbsp;&nbsp;只是为啥大部分都处于封印中？这要是遇上了带土那个偏执狂怎么办？【展开】【收起】',6,0,1482,278681,6,1338305773902602240,'五十一章，重生者，杭慕诗','2020-12-14 10:12:16',0,NULL,NULL),(1334335471568912384,0,2,'武侠仙侠','/localPic/2020/12/03/108fcc33987b4ab8a205c8cfc7c7dc30.jpg','我辈的江湖',0,'钟无涯','&nbsp;&nbsp;&nbsp;&nbsp;下载客户端，查看完整作品简介。',6,0,224,449886,0,1337951028426887168,'第七十九章 青山遮不住，毕竟东流去 药王谷之战12','2020-12-13 10:42:38',0,NULL,NULL),(1337759637059973121,0,4,'历史军事','/images/default.gif','檀香刑',0,'莫言','　　《檀香刑》是莫言潜心五年完成的一部长篇力作。在这部神品妙构的小说中，莫言以1900年德国人在山东修建胶济铁路、袁世凯镇压山东义和团运动、八国联军攻陷北京、慈禧仓皇出逃为历史背景，用摇曳多姿的笔触，大悲大喜的激情，高瞻深睿的思想，活龙活现的讲述了发生在\"高密东北乡\"的一场可歌可泣的兵荒马乱的运动，一桩骇人听闻的酷刑，一段惊心动魄的爱情。',6,0,122,315410,0,1337868907575373824,'第一章 眉娘浪语','2020-12-12 21:33:11',0,NULL,NULL),(1337759773395824640,0,4,'历史军事','/localPic/2020/12/12/484c1a4d03094614a02742a154cbd8f3.jpg','从今天开始做藩王',0,'背着家的蜗牛','　　一闭眼，一睁眼。赵煦发现自己成了一名皇子。美人妖娆，封地很远，国家很乱。而他只想守着自己的封土逍遥自在。只是若有敌人敢来犯，只让他有来无回，心胆寒……',6,0,490,388176,1,1338427613051400192,'第一百二十二章 狐狸尾巴','2020-12-14 18:16:24',0,NULL,NULL),(1337762752513486849,0,4,'历史军事','/images/default.gif','明朝那些事儿7:　大结局',0,'当年明月','　　《明朝那些事儿7:大结局》是对这样一段历史进行了分析梳理，引人思索：明朝最后一位皇帝，自来有许多传说。关于崇祯究竟是一个昏庸无能的皇帝，还是一个力图奋起的人，一直众说纷纭。不管怎么说，这是一个残酷的时代，也是一个精彩的时代。在这一时期，北方的后金势力崛起，经过努尔哈赤的经营，势力急剧壮大。努尔哈赤死后，皇太极即位。袁崇焕就在这一时期迈上了历史的舞台。本文作者告诉我们，袁崇焕这个民族英雄，在历史上不过是个二流角色。',6,0,163,256585,0,1337762876304175104,'后记','2020-12-12 21:26:56',0,NULL,NULL),(1337872061003993088,0,4,'历史军事','/images/default.gif','酒楼',0,'许春樵','　　天德酒楼传到了齐家三兄弟一代，却被老大一人独占。老三齐立言不愿接受兄长的施舍，也不堪老大的精神虐待，在造汽车的白日梦幻灭后，从最底层做起，历经穷困潦倒和各种打击，终于创办了自己的酒楼，吞并了老大的酒楼。成功后的齐立言却变了，由诚笃奋发的创业者变成了狡诈贪心的资本野心家……',6,0,197,268359,0,1337872219389300736,'第63章 第二十三章 2','2020-12-13 05:27:43',0,NULL,NULL),(1337872316667793408,0,4,'历史军事','/images/default.gif','大唐太子李建成',0,'龙耳东','　　小说根据宋朝范祖禹、明末清初王夫之，近代章太炎、陈寅恪、郭沫若以及当今世界知名史学家牛致功、胡戟、胡如雷等人的历史研究成果，拨开历史迷雾，还原历史真相。通过李建成短暂而悲剧的人生，告诉您一个波澜壮阔的时代发生的一些惊心动魄的事件，无不令您感慨万千，气荡回肠，掩卷深思，受益良多……',6,0,224,383470,0,1337872480266620928,'第86章 野火烧不尽 3','2020-12-13 04:49:45',0,NULL,NULL),(1337872488235798528,0,4,'历史军事','/images/default.gif','我的唐山',0,'林那北','　　本书是第一部史诗性再现唐山过台湾历史的长篇巨作。宏大的视野，观照恢弘历史中的纵横捭阖，细致的笔触，抚摸往昔岁月里的爱恨情仇。小说通过一对貌合神离的兄弟和两个性情迥异的女子之间爱恨情仇、波澜起伏的人生悲欢展现整个唐山过台湾斑驳、丰饶而跌宕的历史画卷……',6,0,190,271529,0,1337872594418798592,'第54章 后记:蚯蚓般穿过那段历史','2020-12-13 04:24:43',0,NULL,NULL),(1337872597996539904,0,4,'历史军事','/images/default.gif','火蓝刀锋',0,'冯骥','　　一次危险的水下救援，将爱吹牛的草根渔民蒋小鱼阴差阳错地进了以残酷训练而著称的“兽营”，在这里，他遇到了一批绝世天才：能在丛林中徒手搏狼的野孩子张冲，全国大学生游泳冠军鲁炎，打遍兽营无敌手的“兽王”巴郎，在海盗窝里艰辛成长的“战神”向羽，草原上的神枪女猎人乌云格日乐等人。',6,0,145,338816,0,1337872735779426304,'第112章','2020-12-13 04:12:06',0,NULL,NULL),(1337872898115768320,0,4,'历史军事','/images/default.gif','出手',0,'陈建波','　　民国时期，陈仓城，随着陈仓守将党玉昆的覆灭，缙绅名流孙伯啸突然成为各方势力关注的焦点——相传党玉昆曾交他保管一大批藏宝。孙府周围频频上演各种明争暗斗的好戏，共产党、国民党、土匪、日本人、美国人等多方势力互相交错。迷雾重重之中，各方势力一一出手，鹿死谁手？谁能得手？',6,0,170,325229,0,1337873015937961984,'第63章 最后一搏 7','2020-12-13 02:25:50',0,NULL,NULL),(1337873148071120896,0,5,'科幻灵异','/images/default.gif','污点',0,'武和平','　　小说作者既是行动者，又是书写者，还是思想者。他一手用枪，一手用笔，集战士与诗人于一身。他把经验的亲历与人性的剖析结合在一起。他的长篇小说充满正义的激情、直观社会的勇气和法的尊严。小说讲述了一个文物失窃案如何历尽千辛终被破获的故事。其中有动人的爱情故事和感人至深的亲情……',6,0,151,305586,0,1337873261300551680,'第70章 后记','2020-12-13 05:14:58',0,NULL,NULL),(1337874646456864768,0,5,'科幻灵异','/images/default.gif','黑白道3：渗透',0,'朱维坚','　　洪水中接连出现一男一女两具尸体，李斌良和战友们经缜密侦查，确认二人都是本市应届高中毕业生。为查明真相，他的足迹随着作家的笔迹奔走于各个校园之间，由此他涉足到一个从未涉及过的领域——教育……',6,0,163,316340,0,1337874760709705728,'第63章 尾声','2020-12-13 04:37:12',0,NULL,NULL),(1337874812798767104,0,5,'科幻灵异','/images/default.gif','噬魂',0,'通吃小墨墨','　　这个世界绝对没有绝对的事情，也没有不可能的事。一把充满灵性的枪，一个有着特殊异能的警察，一个能走在人间和冥界的IT人士。一件件无法用现代科学去解释的事件。是世间的恶灵，还是人的心魔？凶手是谁？说不定，他就在看着你……',6,0,131,268278,0,1337874916918169600,'第58章 第四十六章 大结局 3','2020-12-13 03:59:22',0,NULL,NULL),(1337874951365988352,0,4,'历史军事','/images/default.gif','远征·流在缅北的血',0,'金满','　　远征军第一次入缅作战大溃败，狙击手岳昆仑为追寻大部队孤身进入野人山。在地狱般的野人山中岳昆仑历经生死，与一群战友结下生死情谊。在印度兰姆伽基地整训后岳昆仑跟随部队踏上反攻缅甸的征程，与为兄报仇的天才狙击手藤原冷野不期而遇。',6,0,151,287517,0,1337875097357127680,'第70章 2','2020-12-13 02:13:12',0,NULL,NULL),(1337875255574663168,0,1,'玄幻奇幻','/images/default.gif','洪荒修圣',0,'轩影九变','　　在他第一次练功的时候，产生的能量波动和天地灵气达到了共振，产生了一个黑洞，将云谣一下子吸了进去。而到的哪个时候，竟然是盘古还没有开天的洪荒时代。那时机遇不断，危险不断的时代。且看现代人云谣怎样玩转圣人，玩转洪荒……',6,0,219,346840,0,1337875445828292608,'第一百一十二章 云谣得道 元神合一','2020-12-13 04:43:30',0,NULL,NULL),(1337876581629038592,0,5,'科幻灵异','/localPic/2020/12/13/cb57c519e71b4e1b9cbc5eb7e4cbfcf0.jpg','诸天之我是沙悟净',0,'目自翕张','　　骆天明本是个农民工，穿越后的身份也和农民工类似，成了挑担子的沙悟净。好在天无绝人之路，他还有个穿越者的标配——系统。只是这个系统也是平民版的，简陋的让人无法直视。骆天明就依靠这个系统，穿越各个位面，见识各种各样的人和事，不断的炼心炼体，一步步走上巅峰！',6,0,161,428829,0,1338431355700162560,'162 ?落入陷阱','2020-12-14 18:31:16',0,NULL,NULL),(1337879143543476224,0,5,'科幻灵异','/images/default.gif','最后一个道士3',0,'夏忆','　　查文斌，凌正阳二十七代传人，茅山天正道掌门，一个因救人触犯了天罚的道士，一个源自生活的人物原型。将带领我们走进一个未知的全新的道家世界，重新打开属于传说中的真实腹地。青衣人，忘川渡人，棺中人，为何都与他有着一致的面孔？师傅、父母、儿女为何一个个都会离他而去？卓雄和大山的身世，血色的纹身究竟象征着什么？一切之前的所有谜团将会在《最后一个道士3》全部揭晓！',6,0,130,287111,0,1337879204755148800,'第二十章 灭差','2020-12-13 02:00:42',0,NULL,NULL),(1337879206630002688,0,5,'科幻灵异','/images/default.gif','最后一个道士2',0,'夏忆','　　查文斌——茅山派祖印持有者，正天道最后一代掌教传人。他救人于阴阳之间，却引火烧身，遭天罚阴遣；仗侠肝义胆与一身道术，救活人于阴阳罅隙，渡死人于无间鬼道！身披鱼鳞的远古氐人，复活的神秘君王，真正的扶桑神树······',6,0,137,381916,0,1337879284824412160,'番外 桥','2020-12-13 01:54:28',0,NULL,NULL),(1337882606201475072,0,5,'科幻灵异','/images/default.gif','尸语者',0,'法医秦明','　　20个挑战心理极限的重口味案发现场，20份公安厅从未公开的法医禁忌档案。残忍、变态、惊悚、刺激、真实、震撼！尸语者，与死者朝夕相处的神秘职业，即将剖开震撼人心的亡灵之声！高速公路上抛下9袋尸块，被割下的膀胱里居然藏有冰碴，2000辆飞驰而过的车里，谁才是真正的凶手？垃圾场里被捆绑的女尸，全身器官都已经蜡化，要如何下手，才能验出她死亡的真相？电话打到一半，话筒里却传来沉闷的挣扎声，潜伏在校园当中的魅影，真的吞噬了那些女孩？资深法医老秦亲自捉刀，首度披露惊悚案发细节，创下悬疑小说从未到达的震撼尺度！荒山残尸、灭门惨案、校园禁地、公路游魂、水上浮骸、天外飞尸……每一案都让你无法入睡！',6,0,172,264167,0,1337882695020056576,'第二十案 午夜凶铃','2020-12-13 01:29:29',0,NULL,NULL),(1337884719262470144,0,5,'科幻灵异','/images/default.gif','古董局中局',0,'马伯庸','　　这是一部关于古董鉴定、收藏、造假、设局的百科全书式小说。字画、青铜、金石、瓷器每一件古董背后，都是深厚的历史积淀和文化传承；而每一件仿冒品背后，都是机关算尽的机巧和匪夷所思的圈套。古董造假、字画仿冒，古已有之。东晋时，康昕仿冒王羲之的书法真迹，连他儿子王献之也辨认不出来；宋朝皇帝宋徽宗喜欢造假，仿制了一大批商代的青铜兵器，摆在宫廷里，乐此不疲。在古董斑驳的纹理中，承载着一个民族的文化，一个时代的风貌，它的价值，不是金钱可以衡量的，但可怜的人类却只会用金钱去衡量它。',6,0,119,270312,0,1337884785616359424,'尾 声','2020-12-13 01:17:02',0,NULL,NULL),(1337949399824781312,0,5,'科幻灵异','/localPic/2020/12/13/e1ffbf0f78ea4fdea06fad26c6c9ce90.jpg','港综1986',0,'龙升云霄','　　五十年代，咏春叶问大战西洋拳王，咏春拳在港岛遍地开花。六十年，五亿探长雷洛一手遮天，组建金钱帝国。七十年，各大公司群雄并起，角逐王者宝座。八十年，群魔乱舞，你方唱罢我登场，弄潮儿各领风骚。说英雄谁是英雄，重生者吕泽仰望天空，立誓要谱写属于自己的传奇。',6,0,200,254724,0,1343916067483930624,'第七十七章：大D成残废了','2020-12-29 21:45:34',0,NULL,NULL),(1337957605418520576,0,2,'武侠仙侠','/images/default.gif','金丹传',0,'淮南居士','　　瑶池浪、多宝、后羿，他们三个一路为了追杀王子魔，三个上级武者，三个疯狂的上级武者，用他们变态的功力，摧毁了整个悬空城，彻底的打碎了悬空城，悬空城从此以后成为了传说。',6,0,141,276525,0,1337957804174004224,'第56章 世界大战 3','2020-12-13 10:17:52',0,NULL,NULL),(1337958745514233856,0,2,'武侠仙侠','/localPic/2020/12/13/b024b2fab49b4bc1a3b9e51d9edc0690.jpg','大虞天行',0,'叁拾伍','　　负责降妖除魔的大虞天行府的督丁赵山河醒来后惊骇发现自己竟是被只怨灵害死的。这职业如此危险他正惶恐，忽然察觉到自己识海竟有个书架，吸纳足够的情绪值，就能开启亮起的书本掌握本领。比如美食杂志能让他学会烧菜获得好评，反馈更多的情绪值。比如历代大家附录里的诗词能够提升灵符质地，甚至具现名将强军帮他杀敌。而他每学习一本，书籍还会自动更新其他的新书出来。这厮顿时振奋，于是天下妖魔就此倒了血霉。PS：我叫赵山河，我在大虞很红，因为我是个挂哔。',6,0,150,357237,0,1338431227580952576,'2谁敢一战','2020-12-14 18:30:46',0,NULL,NULL),(1337960531323047936,0,3,'都市言情','/localPic/2020/12/13/b41b17ca8b564a69b11196414e5f0484.jpg','脑海里飘来一座废品收购站',0,'鬼谷仙师','　　物品：雄鹰展翅图！介绍：唐府遗弃之物，唐寅闲暇所作……完整度：20％修复需消耗财富值：50W。——陈牧羽，一个普普通通收破烂的，本以为一生注定平凡，没想到脑海里莫名其妙的飘来一座万界废品收购站，从此，世界变得不同了起来……',6,0,233,386692,0,1338422501205651456,'第一百三十一章 妹子，你好漂亮！【第三更】','2020-12-14 17:56:05',0,NULL,NULL),(1337961040297644032,0,3,'都市言情','/images/default.gif','帝王之武修都市',0,'奇玄子','　　一个纵横商界的奇葩人物，意外邂逅一块奇异石头，从此攻城略地崔营拔寨，钱财滚滚美女缠身，成就都市逍遥帝王！',6,0,173,358157,0,1337961284045426688,'第81章 帝王,游戏人间','2020-12-13 10:24:11',0,NULL,NULL),(1337968514828390400,0,5,'科幻灵异','/images/default.gif','极品记者斗僵尸',0,'浪子月生','　　\"一个胯下有巨物的记者在调查一桩变态的凶杀案时，意外邂逅一名村姑美少妇。从此记者神魂颠倒，千方百计想把少妇泡到手骗上床。不幸的是，每次都是失败而终。正当记者通过不懈努力，一步步接近成功时，一场山村里的僵尸玩过界，正在悄然上演……于是记者展开了一边泡少妇一边斗僵尸的奇异之旅。随着他在两方都一步步接近成功时，最终的僵尸之祖旱魃逐渐在山村中复苏……\"',6,0,191,371402,0,1337968763789692928,'第102章 大结局 2','2020-12-13 11:01:51',0,NULL,NULL),(1337971702436515840,0,6,'网游竞技','/localPic/2020/12/13/c88be458ca764bc1810770edcd7fd588.jpg','我真不是角色球员',0,'易文三不知','　　最好的蓝领，最完美的拼图，最佳帮手，最优质的的角色球员……《混子》，《夺冠第六人》，《运气论》，《抱腿大师》……李恪：我真不是！',6,0,156,276647,0,1338409692384243712,'第七十三章 死神·我杜哥（求推荐票）','2020-12-14 17:05:11',0,NULL,NULL),(1337973622836350976,0,4,'历史军事','/images/default.gif','古董局中局2',0,'马伯庸','　　在古董斑驳的纹理中，承载着一个民族的文化，一个时代的风貌，它的价值，不是金钱可以衡量的，但可怜的人类却只会用金钱去衡量它。而本来一文不值的东西，精心涂抹一番，就可以价值连城；巨大的利益，令无数人铤而走险，更有一些家族，父传子，子传孙，世世代代在这个晦暗不明、凶险万状的江湖上营生。《清明上河图》四度被收入皇宫，又四度被盗出宫，直到……许愿从来没有想过，像自己这样的小人物，居然会和《清明上河图》这样的国宝车上关系，但是有一天……',6,0,120,255413,0,1337973779703320576,'第42章 香港:真假国宝现场对决! 4','2020-12-13 09:52:53',0,NULL,NULL),(1337980004591521792,0,6,'网游竞技','/images/default.gif','无限之网游',0,'4440784','　　21世纪是个科技高速飞跃的世纪，2033年年，世界上最大最发达的国家，美国，首先推出一种新型电脑，虚拟电脑，宣布人类将会进入新纪元，虚拟电脑将会通过人类脑电波处理器，更快更有效地获取信息，有效率是以前电脑的五十倍以上。2041年，世界最大的机器人制造国，日本，首先推出机器人法律，宣布日本大众将会与机器人共同生存，机器人将出大批量生产，并出现在日本家庭，社会生产力因此大增。',6,0,173,390275,0,1337980382053715968,'第133章 武林盟主 完','2020-12-13 10:55:33',0,NULL,NULL),(1337981165319016448,0,6,'网游竞技','/images/default.gif','古剑奇谭：琴心剑魄',0,'某树，宁昼','　　知名游戏《古剑奇谭》原著小说，一段时光中生死相随的爱情传说。剑胆琴心，侠骨柔情；少年英雄，美女红颜，共同演绎江湖组曲。还原你心中最完美的仙侠浪漫经典！同名电视剧将由杨幂、贾乃亮、马天宇、李易峰主演，即将上映。一段来自远古的约定与羁绊，一个于时光中生死相随的不朽传说！听说在遥远的极北之地，隐约有关于亡者重生的传说，我即将起程去那里。无论如何，在这一世走到尽头之前，我都会继续寻找下去，一直、一直……总有一天，我会和你回到桃花谷，到那时，我们，再也不分开……',6,0,117,306429,0,1337981268687638528,'后来……桃花幻梦','2020-12-13 05:52:54',0,NULL,NULL),(1337993641230127104,0,3,'都市言情','/localPic/2020/12/13/d417dd4e93304f1db21de1f6e6bb5c21.jpg','重生过去震八方',0,'锋临天下','　　一场意外，让一名四十岁的中年人回到了六十年代，并且重生在一名八岁的孩子身上，开始了他风骚的人生。',6,0,135,340254,0,1338423782032846848,'第八十二章 大收获','2020-12-14 18:01:11',0,NULL,NULL),(1337997125300047872,0,4,'历史军事','/localPic/2020/12/13/545a36861b0145ad901ada6f5ea35296.jpg','垃圾食品援助蜀汉',0,'吴老狼','　　随手选择了末日级难度，张志被坑爹系统带回最后的三国时代，成为了偏远小城毋敛的署理县长，此时刘禅已经投降曹魏，姜维已经殉国，统领南中蜀汉军队的霍弋也选择了投降曹魏，华夏大地上，只剩下人口不到四千的毋敛小县还在飘扬着大汉的旗帜。然后系统又交给了张志一个连神仙都不可能完成的任务，那就是率领毋敛汉军发起反攻，夺回蜀汉失土，继而北伐中原，消灭曹魏东吴，重新把汉军的旗帜插满华夏大地！任务不能拒绝，一旦失败立即死亡，而坑爹系统给张志的惟一帮助，就是援助给张志一些垃圾食品！点背运气差，随机抽取系统援助的垃圾食品时，张志还抽中了最没有营养价值的——方便面！',6,0,133,266617,0,1338431262829883392,'第四十四章 无中生有','2020-12-14 18:30:54',0,NULL,NULL),(1337997343118643200,0,4,'历史军事','/localPic/2020/12/13/fe0e12285ca24fcd84e896d8f68f12f6.jpg','贞观三百年',0,'鲨鱼禅师','　　王角穿越了，是唐朝，而且是贞观年间。很好！很有精神！但是……“贞观三百年？蛤？”这是一个已经被穿越者前辈捣烂的唐朝，王角压力很大，抄诗、玻璃、水泥……都没办法搞了！一咬牙，王角拿起了纸和笔，在首页写下五个大字：《门房秦大郎》。',6,0,158,443005,0,1338426898950172672,'151 那个眼神……','2020-12-14 18:13:34',0,NULL,NULL),(1337998237788852224,0,5,'科幻灵异','/images/default.gif','地狱',0,'丹·布朗','　　哈佛大学符号学家罗伯特·兰登头疼欲裂地从佛罗伦萨一家医院的病床上苏醒，埋在各种管线与一堆医疗设备里。他完全想不明白理应身处哈佛大学校园的自己怎会来到了意大利。在他依稀的梦境中，一个美得惊心动魄的蒙面女子隔着被鲜血染红的翻腾河水对他低语着：去寻找，你会发现……年长的马可尼与年轻的西恩娜两位医生向罗伯特·兰登解释他的病情，并描述着他来到此地的情形，此时，一位黑衣女子突然闯入重症监护室，不由分说地一枪击毙试图阻拦她的马可尼。西恩娜一把拉起罗伯特·兰登狂奔而逃。发现外套口袋里无端冒出一个标有警示图标的钛金管后，罗伯特·兰登且惊且惧，紧接着，他无意间得知西恩娜孩提时曾是个智商高得异乎寻常的神童。',6,0,163,355090,0,1337998537950023680,'尾声','2020-12-13 07:50:02',0,NULL,NULL),(1338003550239772672,0,5,'科幻灵异','/images/default.gif','黑白道终结篇：沉默',0,'朱维坚','　　李斌良调任奉春市公安局春城分局局长不久的一天夜里，他孤身前往一条小巷赴约，突遭袭击，陷入昏迷中。他被救醒后发现，他的身边还躺着一具尸体。他带伤亲自指挥破案，很快查到，这一蹊跷血案是本市一个杀害警察的在逃犯所为。然而，随着工作的深入，各种人物和事件围绕着此案一一呈现出来，奉春的种种社会矛盾也摆在李斌良面前。',6,0,139,396319,0,1338003705626152960,'第69章 尾声','2020-12-13 06:52:46',0,NULL,NULL),(1338008717253201920,0,6,'网游竞技','/localPic/2020/12/13/9472e8ba8b0b452b80a464513e1b10b5.jpg','天道游戏编辑器',0,'镇东','　　天道出世，神话降临，地球人类从此踏上超凡。幽冥地府，鬼门关开，各路阴差游神行走人间。四海龙宫，龙王神威，大战西方帝国航空母舰。外星入侵，地球危机，天山顶上南天门现，无数天兵天将杀出，迎击外星宇宙飞船…………一切尽在《天道游戏编辑器》',6,0,156,333380,0,1338422573217656832,'第一百一十六章 检测修行资质','2020-12-14 17:56:22',0,NULL,NULL),(1338009992640385024,0,4,'历史军事','/images/default.gif','我是特种兵之狭路相逢',0,'王者之风','　　有缘千里来相会，无缘对面不相逢。重新被划为026编外成员的小庄，再一次半强迫地参加了战斗，孤狼B组又聚在了一起。庄焱、郑三炮（老炮）、耿继辉、史大凡（卫生员）、邓振华（伞兵）、强晓伟将再一次的并肩作战，捍卫国家主权、光荣完成使命。',6,0,147,434613,0,1338010228507070464,'第95章 最终的战斗2','2020-12-13 09:08:57',0,NULL,NULL),(1338010234504925184,0,4,'历史军事','/images/default.gif','活着再见：我们曾执行过的特殊任务',0,'邵雪城','　　军校还没有毕业，“我”便在一次特殊筛选时被选中，加入了一个神秘得“我”到现在都不清楚的特殊部门。在经历了“枪毙死刑犯”“缉查私造枪械团伙”之后，“我”的战友一个个牺牲，“我”也在这些残酷训练中慢慢成长。最后，“我”接受了上级命令，前往金三角的监狱卧底，开始了一场无间道式的特殊任务。',6,0,149,284264,0,1338010378877063168,'第48章 我是战士,我叫秦川 6','2020-12-13 09:05:18',0,NULL,NULL),(1338016212952600576,0,4,'历史军事','/images/default.gif','亭长小武',0,'史杰鹏','　　汉武帝时期，南昌县的一个叫小武的亭长（大致相当于现在的村长），因为文弱无力，无法管束治下的流氓少年，长期被长官、同僚蔑视。此时县里突发了一件劫掠案，在别人束手无策时，小武凭借他的聪明才智，以及他对律法案例的丰富知识，顺利侦破此案。但这件发生在偏远地区的普通案件，却牵涉到宫中的太子、宰相，地方的诸侯王，以及名扬天下的长安豪侠。小武不得已走上逃亡之路，却意外获得诸侯王公主的爱情。此后小武一路高升，从手持金斧的钦差直到首都的市长——京兆尹，最后参与到汉武帝时期最著名的宫廷巫蛊政变中。',6,0,177,429212,0,1338016479341236224,'第82章 后记 2','2020-12-13 08:52:46',0,NULL,NULL),(1338018955243081728,0,5,'科幻灵异','/localPic/2020/12/13/ce26f0150c1247c1ba492edb0c269e15.jpg','我是一只大鳄霸',0,'七乐','　　寒风刺骨的缅因州，因为灵气复苏的缘故，今年的暴风雪比往年更加凶猛。治安官汉克基奥接到上司命令，说有一支非官方性质的的专业团队，将要前往“古湖”捕捉那条疑似变异的巨型鳄鱼。一阵寒风穿过吉普车的车门，让他不由的打了个冷颤，心中暗骂了一句这该死的天气。只是下一刻，鼻尖的血腥味让他不由脸色一变。似乎意识到了什么，汉克基奥连忙踩下油门，等吉普车穿过被暴风雪覆盖的松林，来到此前约定的“古湖”湖畔这里早已空无一人，在钢铁般坚硬的冻土层上，二十吨的装甲车在地面上留下一道巨大的犁痕，透过那数米厚的冰层，隐约能看到一道庞大的阴影……',6,0,143,444504,0,1338409313554706432,'第153章 试试威力','2020-12-14 17:03:41',0,NULL,NULL),(1338020917770506240,0,4,'历史军事','/images/default.gif','唐太宗政变24小时',0,'老克','　　中国历史上最扑朔迷离、最惊心动魄的宫廷政变——玄武门之变。以帝王家族内部的血腥屠杀开篇，以辉煌灿烂的大唐盛世收尾。这场政变筹划之细密，布局之完备，过程之惊险，都远远超出了世人的想象。李世民的两千名私人护卫，力克十倍于己的禁军，一举夺得大唐天下。大唐武德九年六月四日丑时正（凌晨1点整），李世民发动政变，带刀强闯长生殿，亲手斩杀了数名侍卫，命人将父皇李渊囚禁起来。卯时二刻（约清晨5点30分），李世民埋伏在玄武门，一箭射穿自己的大哥——太子李建成的脑袋，为自己腾出了太子的位置。卯时五刻（约清晨6点15分），尉迟恭持械逼宫，三言两语将李渊生生气晕了过去，又逼迫几位宰相假传圣旨，立李世民为太子。',6,0,119,375546,0,1338021200802140160,'第67章 附录三镜鉴千秋——唐太宗与魏徵 3','2020-12-13 08:40:10',0,NULL,NULL),(1338023305390641152,1,7,'女生频道','/localPic/2020/12/13/4c1d3d7b735e4152bf97d29695e449c2.jpg','重生七零之福妻当家',0,'西林葳蕤','　　陶真真重生到1976年的冬天。原主出生贫穷山村，长得漂亮心气又高，一心想嫁个吃公粮的，结果把自己给作死了。陶真真一来到这里，就要嫁给原主自己谋算来的男人。嫁就嫁吧，反正陶家容不下她了，想要把她嫁给大麻子，那她还不如嫁给原主自己作来的男人。可是，她没想到杨家偷梁换柱，把养子老三塞给她了，等她知道已木已成舟。陶真真觉得，杨老三也不错啊，最起码年轻，好看。可是被逼着娶了她的男人不这么觉得。二人日子过的鸡飞狗跳的，好容易异性相吸的道理在二人中间产生了，可这一个两个的烂桃花是怎么回事？',6,0,158,448154,0,1338415939762302976,'第一百六十七章 为了哄媳妇节操掉一地','2020-12-14 17:30:01',0,NULL,NULL),(1338030962667212800,0,2,'武侠仙侠','/localPic/2020/12/13/94ec9dcefbb242d1a24af918f6ffa239.jpg','我比天高',0,'银色纪念币','　　童子问：夫子，何为高人？夫子答：很高的人。童子又问：与天齐高？夫子笑答：比天还高。童子好奇再问：如何才能比天还高？夫子朗声答：如我一般，志比天高，命比天高，道比天高……童子不耐烦打断道：懂了懂了，我早就说夫子你三高嘛，你还不认，以后还是要少吃多动才好。夫子大怒：三日不打，上房揭瓦，我戒尺呢，我大锤呢，拿我方天画戟来！',6,0,178,254230,0,1338427536341774336,'第八十一章 三十六剑奴可诛仙？','2020-12-14 18:16:06',0,NULL,NULL),(1338040506818547712,0,4,'历史军事','/images/default.gif','苏麻喇姑',0,'文茜','　　这是一部讲述经历过五代四帝，地位和身份都很特殊的奇女子的故事。她虽然只是一名侍女，但却参与了清朝官服的设计，也是女性旗袍的最初设计者。她不仅懂蒙文、满文和汉文，而且还擅长满文书法。她平时是孝庄的“秘书”，在皇位争夺战中还是一名出色的“间谍”。同时，她是康熙的老师，还曾抚育康熙的十二子。她受到了同一时代，不同帝王的尊重，被孝庄称为“格格”、被康熙称为“额娘”、被皇子称为“奶奶”。她死后，人们为了尊重和纪念她，称她为“苏麻喇姑”。',6,0,144,277246,0,1338040694375239680,'第61章 非同寻常的地位','2020-12-13 07:43:46',0,NULL,NULL),(1338040707499216896,0,4,'历史军事','/images/default.gif','谍战',0,'熊诚，彭景泉，莫夫','　　谍海无和平。在谍海虽然听不到战场两军对垒时的拼杀呐喊，看不到遮天蔽日的炮火硝烟，但却无时无刻不在进行着你死我活的较量，惊心动魄的搏斗！‘于无声处听惊雷’，是谍海再恰当不过的写照！谍海很险恶。在谍海这个隐蔽的战线，常常是敌中有我，我中有敌，明知敌人就在身边，但就是不识‘庐山真面目’，虽然少见两人对决时的剑拔弩张，但无处不是陷阱，时刻会遇到阴谋，预料不到的危险随时都会发生。',6,0,152,257477,0,1338040868266889216,'第63章 迟到的勋章','2020-12-13 07:37:09',0,NULL,NULL),(1338060391980257280,0,1,'玄幻奇幻','/images/default.gif','至尊幽帝',0,'打死都要钱','　　（暴爽玄幻，激情澎湃！）少年赵无幽，遭青梅竹马背叛陷害，背负掘父之墓，盗父之骨大罪，被废除灵脉，贬为豨啰牲畜，关入黑狱第三层，三年后又遭人强行灌入毒药，生死边缘际觉醒前世记忆，一代至尊天帝开启重修复仇之路',6,0,120,363303,0,1338422337397108736,'第一百二十九章 重磅炸弹','2020-12-14 17:55:26',0,NULL,NULL),(1338061984708481024,0,4,'历史军事','/images/default.gif','猎人突击队',0,'信周','　　前无去路，后有追兵，走投无路之下，猎人们仓惶进入那一片远离文明的热带丛林。在一种安全孤立的处境中，一边是精锐的雇佣兵战士，一边是悍不畏死的恐怖分子，最先进的武器、最勇猛的战士、最危险的任务和最残酷的激战，一场你死我活的丛林游击战火爆上演从此，开始了他们悲壮惨烈、无可奈何的另一种命运。良知和生存这种痛苦而无奈的生活方式和魂萦梦牵的归国情怀，成为这群流浪金三角的国人心中永远的痛',6,0,110,348111,0,1338062115990196224,'第七十一回 渗入敌后 5','2020-12-13 00:08:09',0,NULL,NULL),(1338062435428388864,0,1,'玄幻奇幻','/images/default.gif','超级火神',0,'心狐野禅','　　我本无名，奈何天命，西里湖涂也成神。四海驰骋，花丛纵意，圣女公主做情人。天地任行，扭转乾坤，英雄豪杰尽服臣。妖魔鬼怪，奇兽异禽，荒诞离奇蛮荒争。一个少年在溶合妖神魂魄后，洗灵脉，伐神髓，贯奇络，溶合太阴混沌，在体内蕴育金龙，结成神蒂，凝就神芥。一个完全不同的炼神功法，一个完全不同的玄幻世界，一定会让您耳目一新！',6,0,174,363595,0,1338062624331452416,'第109章 功成身退','2020-12-13 15:40:50',0,NULL,NULL),(1338062919581093888,1,7,'女生频道','/localPic/2020/12/13/6d2073b6cdfd4ca080e99b524dfbb201.jpg','侯门嫡女如珠似玉',0,'小玉狐','　　穿越成永昌侯府唯一嫡女，崔知微毫无疑问拿到了团宠文剧本。明明不着急成亲，皇帝却包分配，硬是将她赐婚给了不学无术的兴国公世子宴景年。还能怎么着？闹到宴景年主动提出和离为止。宴景年接到赐婚圣旨后内心窃喜，却也瑟瑟发抖。怕老婆且宠女如命的老丈人、凶残护短的丈母娘，好几个宠妹狂魔的大舅哥，哪一个他都招惹不起啊！成亲后才发现，娇娇柔柔的崔知微根本就不用娘家人帮忙，就她一人，足以在兴国公府兴风作浪。',6,0,132,402579,0,1338419613020499968,'第一百五十三章 招供','2020-12-14 17:44:37',0,NULL,NULL),(1338064558060785664,0,1,'玄幻奇幻','/localPic/2020/12/13/1c423f3a5a9946f4a0824038edaffd4a.jpg','熊霸',0,'胖大福','　　范大彪，现实中懦弱无能，网络上意气风发，睥睨天下，怼天怼地怼社会，唯我独尊！封号至尊键帝！一次网络喷道大战之后，穿越了，变成成了一头熊。以上这些都不重要！重要的是，变成熊的范大彪，所在世界是一个可以修行的世界..............很多年后，熊大彪站在天空看着下面的人妖魔三族修士轻飘飘的说了一句“我为妖，谁敢斩妖！”',6,0,189,398211,0,1338101215854120960,'一百三十七章 这位真不是托！','2020-12-13 20:03:25',0,NULL,NULL),(1338069939721916416,0,3,'都市言情','/images/default.gif','女友背叛后的逆袭',0,'紫月枫麟','　　我叫李明，是一个二十二岁的打工仔。家境一般的我有一个很漂亮的女朋友，她是我的珍宝。但是那天晚上，她给我打了个电话，哭着告诉我她被强奸了后便离我远去。女友的离去，让我堕落，混混的殴打，让我想要疯狂地逆袭。我本以为这是我一生的耻辱，没想到女友其实是拿我当备胎，只是找我当被抛弃后的报复工具！当我得知此事后我爆发了！我要报仇，即使流血，即使断头也不怕！',6,0,131,322774,0,1338070026976022528,'第81章 酒店里颓废的激情','2020-12-13 16:05:51',0,NULL,NULL),(1338084112510013440,0,3,'都市言情','/images/default.gif','超级农民',0,'宋江','　　我是个地道的乡下农民，黝黑瘦小，其貌不扬。不知为啥村里的第一美女张小兰居然看上了我！为了爱情我和村里的少妇张小兰私奔了！因为生活所迫，我们来到了南方的城市打工，日子虽然艰苦，在我看来有张小兰的地方就是天堂。但某天我回工地宿舍的时候，蓦然却发现张小兰和工头滚在了床上……爱情，工作，一切都没有了。没想到在离开工地后我的命运发生急剧逆转，艳遇连连……',6,0,153,342893,0,1338084211336204288,'第85章 杀人凶手是男宠 6','2020-12-13 15:59:38',0,NULL,NULL),(1338087760287813632,0,5,'科幻灵异','/localPic/2020/12/13/7b9e65b4ac164dbfa9592f80a83ef434.jpg','诸天最强猎魔人',0,'苦大且仇深','　　雨夜的街道。身穿黑色风衣，水滴流淌的帽檐遮住半幅面容。染血长刀握在手心。皮套里的左轮蠢蠢欲动。燃烧的香烟还未落地。一道闪电划过，蛰伏在阴影中的邪恶发出惊恐不安的嘶吼。...这是穿越者柯尔·沃克，来到一个危机四伏的世界后，凭借诸天降临系统，成为最强猎魔人的故事。或者说。一个冷酷的老挂比拳打恶灵，脚踢魔鬼，从此开启酷炫人生的故事。',6,0,151,326007,0,1338412644322816000,'103、结束丨记者','2020-12-14 17:16:55',0,NULL,NULL),(1338090080807473152,1,7,'女生频道','/images/default.gif','闪婚：就是你别想逃',0,'辰怿','　　李漫星很少有出格的时候，即使在年少轻狂的时候。出现在韩辰义身边的几天恐怕是她这辈子做的最出格的事情。本以为随着她的消失一起都过去了，可再次相遇，貌似，她还做了更出格的事情……',6,0,145,375878,0,1338427561595678720,'第一百零九章 出轨的错觉','2020-12-14 18:16:12',0,NULL,NULL),(1338095930611650560,0,5,'科幻灵异','/images/default.gif','西村京太郎短篇集',0,'西村京太郎','　　暂无内容简介.',6,0,131,394996,0,1338096014212517889,'寻人游戏','2020-12-12 04:03:38',0,NULL,NULL),(1338096209511895040,0,6,'网游竞技','/images/default.gif','网游之圣人游戏',0,'小诺爱土豆','　　【Ghost·花季社】一个16便堕入圣劫，成为史上最最年轻的圣人……16年成就的一个圣人，心智还不成熟，所以不被圣界所接纳……看玩性大发的主角——炎熙诺，怎样在游戏人界，怎么样创造一个自己的传说！泡LOLI，玩空姐，戏明星，虐BOSS！',6,0,191,406581,0,1338096415628382208,'火!不生不灭!','2020-12-11 18:12:01',0,NULL,NULL),(1338098849029345280,0,1,'玄幻奇幻','/images/default.gif','混沌邪神',0,'奕天','　　叶天得混沌大帝传承，却意外成为了暗黑魔界的至尊！且看叶天如何玩转于神魔之间，成为一代至尊邪神，纵横天下！神？要是敢阻挡我，照杀不误！魔？杀！美女？我身边会缺美女吗？贼老天！！我来啦！！',6,0,165,306643,0,1338098981347053568,'第103章 夺宝之战','2020-12-13 17:33:26',0,NULL,NULL),(1338103259021234176,1,7,'女生频道','/localPic/2020/12/13/66d40b3bed594be4abf9a9ec768b0e40.jpg','神兽修真日常',0,'花羽容','　　这是一个人首蛇身的神兽白曦的修真日常。逗比日常欢乐多。',6,0,228,426596,0,1338430396127293440,'第151章新消息','2020-12-14 18:27:27',0,NULL,NULL),(1338409289206771712,1,7,'女生频道','/images/default.gif','她在他心尖上映',0,'米西亚','　　【甜宠轻松+科研大神+社畜导演】年少时，乐桃为了一包辣条，帮闺蜜江以笑送情书+告白。“晏旭，我喜欢你。”晏旭无情的拒绝了她：劝你不要喜欢我。长大后，乐桃为了一只大龙虾，被小舅拉去与晏旭相亲。结果，她没看上他，他却看上了她。乐桃也无情的拒绝了他：劝你不要喜欢我。晏旭笃定：你小时候说过喜欢我，所以这辈子你只能喜欢我！乐桃暴躁：凭什么！晏旭淡定：凭我喜欢你！言而总之，这是一部“软萌好吃的社畜导演vs清贵腹黑的科研精英”的甜宠爱情故事。',6,0,231,330380,0,1338409473311551488,'第234章 食骨知其髓','2020-12-14 17:03:36',0,NULL,NULL),(1338410664649076736,1,7,'女生频道','/localPic/2020/12/14/2a682e639f77499dbba9cd6a5fcd4dc4.jpg','末世胖妹逆袭记',0,'包包紫','　　体重二百五，拥有喝水都胖体质的乔绫香，被人打死在了一块农田里，她没穿越也没重生，自己睁开眼诈尸了。然后，就得了个奇怪的异能，只要减掉一点体重，就能拥有治疗能力她以为自己得了个什么可以给人家包治百病的异能。却发现自己还能催更植物，点石成矿。于是，生存第一步，赶紧出去摆个摊儿......卖食人花，打怪辅助利器、卖仙人草，出城必备止血药、卖能源矿，妈妈再也不用担心家里停电了。哎呀，我说，隔壁家末世高手排行榜第一的小哥哥，今晚上出去练摊儿吗？原在窗内小憩的岑以，闻言，将书从脸上拿下，看向窗外笑靥如花的邻家妹妹，朝她勾起修长的手指，豪横道：“你近我一些，今晚的物资哥哥全包了。”',6,0,157,361042,0,1338410786447470592,'149 老大又把城封了','2020-12-14 17:09:04',0,NULL,NULL),(1338412067618598912,0,6,'网游竞技','/localPic/2020/12/14/a270e3110b154fe499637a63dc50fe5a.jpg','我真的在打篮球',0,'临河羡鱼翁','　　我是一个准备留学的普通留美留学生，正准备努力学习天天向上，留学归来建设美丽祖国！可是，踏上美利坚的那一刻，一切都不一样了……你拿起了篮球！你走进了球场！你在球场的山呼海啸中‘迷路’了，头脑一片空白！……我本来是一个未来制霸21世纪的生物工程师，现在，我居然拿起了篮球……看着手上的篮球，我沉默了片刻。我，真的在打篮球！',6,0,131,357644,0,1338412117912498176,'第59章 双S球队马奎特大学和它的X王牌！','2020-12-14 17:14:38',0,NULL,NULL),(1338413569913434112,0,4,'历史军事','/localPic/2020/12/14/b35de9d6c8c446129762bfede022bf01.jpg','大英公务员',0,'青山铁杉','　　遍及整个世界的二战已经进入尾声，大英帝国的衰落却才刚刚开始，美苏憧憬着未来的光辉岁月，知道破落贵族已经不是自己的阻碍。“我并不同意他们的想法，可先拆了英属印度也并不全是坏事。”',6,0,174,444136,0,1338413698020061185,'第一百六十三章 红旗歌舞团来访','2020-12-14 17:20:36',0,NULL,NULL),(1338413707776012288,0,4,'历史军事','/images/default.gif','贞观幽明谭',0,'燕垒生','　　故事以唐代贞观末年的长安为背景，描写了一个自幼背负诅咒的少年巫师明崇俨在追寻自己身世之秘的过程中，卷入了太子、虬髯客、南昭郡王等争夺王位的阴谋。与此同时，日本、新罗、百济等周边国家的奇才异能之士也怀着各自的目的纷纷登场。作品中人物众多，架构也铺陈得极开，但是内容精彩紧凑，各条线索交织依存，扑朔迷离，对读者有极大的吸引力。',6,0,182,263908,0,1338413745994510336,'第49章 贞观幽明潭 48','2020-12-14 17:21:09',0,NULL,NULL),(1338413765233782784,0,5,'科幻灵异','/localPic/2020/12/14/def5115ac3064003acda960686c9a090.jpg','从火之寺开始',0,'横空日月','　　宇智波斑：“你想起舞吗？”明浩：“不，贫僧想超度你！”也不知道是因为开局火之寺，所以得到大佛果实能力；还是因为得到大佛果实能力，所以开局火之寺，总之，这是一个忍僧，从忍界开始超度诸天的故事。',6,0,127,263064,0,1338413842979401728,'第九九章 全力以赴（求订）','2020-12-14 17:21:23',0,NULL,NULL),(1338416134134738944,0,5,'科幻灵异','/images/default.gif','退休老道回忆录',0,'不再少年郎','　　中华五千年至今为止，还有多少人相信神鬼妖魅呢？在我三岁与一个人头女鬼相遇后，缘分似乎就已经将我拉入了道士的行列。驱鬼捉妖的道士、铁口断命改风水的相师、针灸刺穴治恶疾的古医等等等等。我和他们一样，是一个舞蹈在万丈深渊之中那摇晃的干丝上之人。',6,0,157,364215,0,1338416240934301696,'第97章 大结局','2020-12-14 17:30:48',0,NULL,NULL),(1338417307336093696,0,3,'都市言情','/images/default.gif','许我一世春暖花开',0,'丛苏','　　一夜艳遇之后的N种可能性发展，暮光中的城市丛林是兽的世界，上演的无非是男女的追逐与挑衅而已……',6,0,157,323023,0,1338417371085320192,'第71章 大结局','2020-12-14 17:35:27',0,NULL,NULL),(1338417923525488640,0,1,'玄幻奇幻','/images/default.gif','银月巫女',0,'梦三生','　　北莽史书记载，恒天七十二年，银月巫女被逐出赫连家族，施以火刑，挫骨扬灰，死无葬身之地。她的一切是属于赫连珈月的，为了他什么都可以牺牲掉，哪怕是生命，只因他那一句“相信我，等着我”，她甘心被擒甘心被火焰吞噬。然而三年后，她竟然从另一个时空回来了？！',6,0,138,386075,0,1338417978869329920,'第61章 后记','2020-12-14 17:37:54',0,NULL,NULL),(1338420014931292160,0,1,'玄幻奇幻','/images/default.gif','中华龙将',0,'千面妖王','　　十年前他是一位铁骨军人，是血龙特种部队的总教官，一位功名闪耀的少将威震军界。因为‘强暴’案件让他受尽世人唾骂黯然离去。十年后他是一位赫赫有名的杀手，他的名字让地下世界胆寒。',6,0,130,281515,0,1338420076562395136,'第73章 大结局','2020-12-14 17:46:13',0,NULL,NULL),(1338420576397602816,1,7,'女生频道','/localPic/2020/12/14/df0749853c1d49ce9f2fe71bad90d8aa.jpg','一不小心修成大佬了',0,'曾经的青柳','　　雁千惠，精通厨艺，十岁时剪燕诀小成，同年投入蓬莱仙宗，自此开始登天之路。仙路飘渺，弱肉强食，勾心斗角，雁千惠给自己立了一个小目标：觅长生；然后她又给自己立了一个大目标：衣锦还乡！乡关何处？',6,0,139,276963,0,1338420658471743488,'第一百章 吞并','2020-12-14 17:48:27',0,NULL,NULL),(1338421914749677568,0,6,'网游竞技','/images/default.gif','我的女友怎么会是九尾妖狐',0,'屌丝拌饭','　　我看着面前几个在我和九尾妖狐阿狸的联手攻击下，倒在地上呻吟不起的小混混。耸耸肩，走向身后已经被我英雄形象震惊的美女，一边在心里嘀咕着。哼哼，这种程度的小混混也配跟我斗？我现在可是召唤师。九尾妖狐阿狸可是我的爱宠加女友！好吧，我承认，如果这事传出去的话，我一定会被当做网瘾少年，被砖家叫兽抓走电击。我的女友怎么可能是九尾妖狐？YY向的开头，暧昧向的展开，纯情向的结局。（暧昧向的纯爱轻小说，英雄联盟向，希望支持哦，读者群152580149，喜欢的朋友可以加哦）',6,0,156,434895,0,1338422029510029312,'第145章 带上阿狸去海滩吧','2020-12-14 17:53:46',0,NULL,NULL),(1338424191917010944,0,6,'网游竞技','/images/default.gif','变身之网游法师',0,'轩辕星痕月','　　一个网游职业玩家，由于误服sc（变性药）而不得不重新开始自己的网游生活。面对网络和现实，他将如何面对自己的新身份呢？',6,0,158,380888,0,1338424298469109760,'结局','2020-12-14 18:02:49',0,NULL,NULL),(1338425367026774016,0,3,'都市言情','/localPic/2020/12/14/a608a7d4178a47ac842884e9cea09760.jpg','我究竟重生到哪儿了',0,'上帝不在天堂','　　感觉老惨了！以为重生了结果发现咋是大夏！那个为什么明明我重生先发达是我老豆啊？还有我不记得我老豆有个师兄弟啊而且这个吴省三感觉很熟悉~~这个港岛的唐记鲍鱼店质量到是很不错~~额所以我究竟重生到哪儿了！-----之前发新书因为好久没熟悉起点的规则掉坑里了此为大改章节抱歉-------',6,0,151,368407,0,1338425436362813440,'014电车之郎','2020-12-14 18:07:29',0,NULL,NULL),(1338426419025326080,0,2,'武侠仙侠','/images/default.gif','唐门逆子',0,'唐门逆子','　　龙朔，一个唐门少主年轻时风流赌约的产物。找回自己的身世后，迎来的却是人间冷暖、世态炎凉。被家族排挤，长子的身份不被承认。而他面对自己的父亲时，却只称呼“老爷”，从来没有叫过一声“爹”。',6,0,135,448718,0,1338426508301086720,'第112章 番外 永世沉沦 五 完','2020-12-14 18:11:40',0,NULL,NULL),(1338427751899639808,0,6,'网游竞技','/images/default.gif','这萧瑟的流光，一泻千里「网王同人」',0,'离洛Love','　　其实时间在那之前都是平静地流动四季都有各自的颜色风也有自己吹拂的规则然而在遇见你以后时间开始悄悄地变慢然后逐渐静止站在时间的轴线上回头看过去的自己其实我们从没有离开过一直都在那里从四周八方疯长出的草蔓成了世界唯一的色彩你知道我把一些最柔软和洁净的叹息遗落在你的身边一个脱离至回归的过程一个人的一生可以爱很多人可是这中间总有一个人会让你在日后里带着点遗憾带着点不甘隔着岁月的重山重水回想起来心里有一点遥远模糊的疼锁住了我们的命结抬起头艳阳高照这萧瑟的流光一泻千里',6,0,165,303890,0,1338427816877797376,'萧瑟流年——最初最终','2020-12-14 18:16:57',0,NULL,NULL),(1338428361457840129,0,4,'历史军事','/images/default.gif','中国敢死军',0,'疏梅淡影','　　一部中国版的敢死连您想看中国军人的英勇顽强和敢死精神吗？想知道中国军人的守土爱国和赴汤蹈火的斗志吗？想了解中国抗日战争、解放战争、抗美援朝战争时鲜为人知的动人故事吗？想回味那段令人难以忘怀的战争岁月吗？',6,0,162,369680,0,1338428438771445760,'第100章 奇袭“白虎团”','2020-12-14 18:19:23',0,NULL,NULL),(1338432000322744320,0,3,'都市言情','/images/default.gif','掌眼大亨',0,'元宝','　　聚宝阁老掌柜突然故去，因聚宝阁资不抵债亲生儿子觉得无油水可捞不愿继续经营，外甥王海东才得以顺利继承。王海东受业古玩大家，师从鉴定泰斗。刚刚大学毕业的他，忽闻外公陈一龙去世的消息，毅然接手风雨飘摇中的聚宝阁，运用所学于捡漏、鉴宝、修复、赌石，在胡龙观古董市场，甚至整个江流市如蛟龙入海，无往不胜，而外公陈一龙的不明死因也在此过程中一一揭开。',6,0,160,308614,0,1338432049526124544,'第61章 初露冰山一角 3','2020-12-14 18:33:50',0,NULL,NULL),(1357663182142902272,0,1,'玄幻奇幻','/images/default.gif','我每天都能获得一种天赋',0,'封山十月','　　全球物种大进化，各种从来没有见过的怪物都出现了，全球百分之八十以上的人都觉醒了一种天赋。只有许易发现自己好像有点不同。，他发现，自己能够获得的天赋似乎不止…一种。“等我捋一捋……”“第一天，我获得了牛头怪的战体天赋！”“第二天，我获得了艾力斯的火焰天赋！”“第三天，我获得了犬人的钝器攻击！”“第四天、第五天、第六天……”“等等，不止这些，我只需要击杀怪物，就能提升天赋品阶？”“而且，我好像我还能控制这些怪物…”',6,0,159,347432,0,1357663309742018560,'小小的说两句，','2021-02-05 20:11:41',0,NULL,NULL),(1357663733471580160,0,4,'历史军事','/images/default.gif','战国之东帝',0,'腊月青梅子','　　战国中期，天下纷争不断。刚刚穿越成齐湣王之子的田冀，浑浑噩噩间，却惊闻乐毅已大破齐国主力于济西，而且正率燕军向临淄杀来。田冀想起历史上临淄被乐毅攻克，齐国数百年财富皆被燕国所得，且齐湣王惨死，齐湣王子嗣只剩下齐襄王一根独苗等等。田冀：“······”',6,0,160,399311,0,1357663919711260672,'第一百九十五章 楚王配吗','2021-02-05 20:13:53',0,NULL,NULL),(1357664822275149824,1,7,'女生频道','/images/default.gif','重生后大佬撕了炮灰剧本',0,'年华','　　傅元蓁死后才知道自己不过是一本小说里早死的炮灰白月光。身为大齐的摄政长公主，她被亲弟弟和未婚夫联手设计，惨死在大火之中，遗产被人瓜分。小说里，她死后弟弟成了暴君，未婚夫宁修心如死灰，直到遇见古灵精怪的女主楚梦恬。楚梦恬不仅继承了她精心布置的小岛，还揭开了她这个恶毒白月光的真面目，狠狠惩治了恶毒继母和继姐，帮助宁修弄死了反派摄政王和暴君。两人携手江山，开创了盛世景象，万国来朝。傅元蓁直接气活了！谁知醒来已经是十年后，她的新身份，刚好是楚梦恬的恶毒继姐。而她的仇人们，活得比以前更肆意了。这还得了？傅元蓁果断决定搞事情！却发现反派摄政王居然是她以前养在身边的小可爱！PS：本文又叫《女主抢了反派剧本》《男主他总吃自己的醋》，重生霸气女主VS黑化小可爱男主，女主顶级大佬，又美又飒~',6,0,177,303898,0,1357664963497365504,'0158 冷宫里的沈美人','2021-02-05 20:18:12',0,NULL,NULL),(1357665926098522112,0,5,'科幻灵异','/images/default.gif','戏精的诞生',0,'燃冷光','　　马燃，【扮演】能力者。为了拯救地球，他逐渐成为一名戏精，马甲无数，各领风骚。剑裂魔山，七旋剑宗，剑首林求败！手撕机甲，血莲魔宗，魔子张狂！雷破苍穹，妙法仙门，赵观澜！游戏主神，玄！简言之，这是一个戏精拯救世界的故事。',6,0,171,376336,0,1357666106478759936,'177改路·越野·异常','2021-02-05 20:22:36',0,NULL,NULL),(1357666733187469312,0,4,'历史军事','/images/default.gif','千古第一圣贤',0,'孜然腰花','　　这里是一片玄奇的大陆，有东方人族诸国，百家秘术，有北方蛮族血气纵横，有南方巫族神秘莫测，有西方妖族霍乱众生。降临在这片大陆的陈铭身具神妙异能，一步步成为千古第一圣贤。“为了后人的幸福，我一定要让妖族加入到人族的大家庭中，大家和谐相处。”---陈铭。',6,0,172,275083,0,1357666850468597760,'第一百三十七章 若我不同意呢','2021-02-05 20:25:48',0,NULL,NULL),(1357668191920263169,0,2,'武侠仙侠','/localPic/2021/11/17/b5e3e97f843041e393c0e17089ca4af4.com/qdbimg/349573/1025223489/180','我反夺舍了诸天大佬',0,'银霜骑士','　　这是一个坐在家中奇遇便会上门的故事！身具夺舍体质，常被诸天大佬夺舍，体质特殊反夺舍了诸天大佬。神功妙法，武道经验，悟性天赋，武道神通，每一次夺舍都是一次主动上门的奇遇！！！',6,0,5500,273684,0,1357668292130574336,'第83章 以一敌二','2021-02-05 20:31:36',0,NULL,NULL),(1357668717919539200,0,2,'武侠仙侠','/images/default.gif','仙界之蜕变',0,'天上峡谷','　　前二百年春风得意，后五百年身陷囹圄，亡命奔逃入未知世界，竟重回青春年少，人生重来不易，自当倍加珍惜。哪曾想，脚下竟是一方“寿元千年封顶，境界凡仙盖帽”仙凡混杂的世界。那就归去，携改造后的这方世界归去，去改造那方无法割裂的过往世界。仙界之蜕变，开启……书友群：321906354',6,0,139,408380,0,1357668867794604035,'第一百六十二章：得知隐秘','2021-02-05 20:33:41',0,NULL,NULL),(1357670120540934144,0,6,'网游竞技','/images/default.gif','绿茵之热血燃烧',0,'刺客柔情','　　1989年世界杯预选赛黑色三分钟，咫尺天涯，中国队和意大利之夏失之交臂。与此同时，一颗足球的热血种子在一位年轻人血液里偷偷埋藏，直到多年后生根发芽。利物浦名帅香克利说过：“足球无关生死，足球高于生死。”也有人说，足球是和平年代的战争。但是对于很多人来说，足球是热血的青春，无忧无虑的追梦，足球就是生命的一块拼图。从K3列车北上开始，一位中国年轻人开始自己的足球追梦之旅，一切从泽尼特开始。（本文没有系统，没有穿越，就是一本纯粹的足球小说）',6,0,154,351981,0,1357670315127279616,'第187章 猎豹进球','2021-02-05 20:39:16',0,NULL,NULL),(1357671204894347265,1,7,'女生频道','/images/default.gif','0号玩家',0,'笨小涵Q','　　鲸落城，无主之城。只要参加游戏鲸落决，第一个战胜零号玩家的人，就可以成为鲸落城的下一任城主。然而，零号玩家的真实身份，扑朔迷离。得鲸落者，天上人间。',6,0,163,349571,0,1357671364751855618,'第175章 饥饿游戏','2021-02-05 20:43:34',0,NULL,NULL),(1357672011576446976,0,6,'网游竞技','/images/default.gif','绿茵逆转狂魔',0,'天天不休','　　执教过叶一锋的教头曾说：他就是一张每个周末能让你中奖的彩票。跟踪考察叶一锋的球探会在报告中写下类似的评价：实力平庸，特点多变，发挥极不稳定，但总能够制造进球。空门不进看齐快乐足球？停球三米远展现中国足球水平？过人晃倒了自己暴露了卧底身份？但当每一次球队深陷绝望中他将足球送入对手球门那一瞬间，他在球迷眼中犹如散发着万丈光芒！顶级名帅们对他又爱又恨。时常无语问苍天：谁能给我一份叶一锋的使用说明书？时常又在比赛结束后激情拥抱住他大吼道：你终于上线了！叶一锋摊手微笑：欢迎来到我的绝杀时刻。',6,0,150,364621,0,1357672231064375296,'123 这波亏大了','2021-02-05 20:46:47',0,NULL,NULL),(1357672502310014976,0,1,'玄幻奇幻','/images/default.gif','大夏封神记',0,'剑气书香','　　那年，有玄鸟落于天南，万妖来朝。那年，极西之地一位老者斋戒七七四十九年圆满，挥笔写下两个神篆“周易”。那年，九鼎异动，黯淡沉沦。大争之世，一触即发。一个来自后世的灵魂穿越成为大夏皇朝十三皇子，而他要做的第一件事，是想办法在凶险的宫中活下去。若干年后，赵泰傲视漫天仙佛：“这天庭我来建，这神我来封，人皇治世，天上地下，唯我独尊。”',6,0,208,443353,0,1357672743117590529,'第二百二十八章养寇自重','2021-02-05 20:48:44',0,NULL,NULL),(1357675307238232064,0,6,'网游竞技','/images/default.gif','扬名NBA',0,'漫长的旅行','　　好看就给点推荐，收藏，不好看也可以给我留下不好看的建议。',6,0,144,447982,0,1357675577053614080,'第7节 去除枷锁的金州勇士（上）','2021-02-05 20:59:52',0,NULL,NULL),(1357675644326055936,0,2,'武侠仙侠','/images/default.gif','玄木仙缘',0,'幽兰客','　　没有灵丹，我拿药材换，没有灵器，我拿药材换，没有阵法，我拿药材换。啥，你要抢我的药材，妹子，媳妇干活了',6,0,187,263753,0,1357675840699174913,'第三百四十七章 该报仇了','2021-02-05 21:01:13',0,NULL,NULL),(1357677274429722624,0,3,'都市言情','/images/default.gif','赘婿系统',0,'笑间神','　　意外车祸，系统降临，丰胸，治病，琴棋书画样样精通，赘婿又如何，被人看不起又如何，全能赘婿，系统来定，修武，泡妞，救人，武功秘籍数不胜数！我林宇注定要为赘婿挣上一口气，成为天地第一全能赘婿！',6,0,991,307137,2,1357677356512251904,'第一百章：搅局','2021-02-05 21:07:41',0,NULL,NULL),(1427171978163331072,0,6,'网游竞技','/localPic/2021/08/16/d02e0fcaa8404a9784ff725a3bd60c28.jpg','微铁镇Ⅱ',0,'周煜壹','&nbsp;&nbsp;&nbsp;&nbsp;下载客户端，查看完整作品简介。',6,0,195,330235,0,1427314094369779712,'第九十章 机械老炮（7）','2021-08-17 00:59:32',0,NULL,NULL),(1427173199813091328,1,7,'女生频道','/localPic/2021/08/16/43522761202c482cb022fba947bbd908.jpg','重生之跨越人海',0,'无奈选择','&nbsp;&nbsp;&nbsp;&nbsp;一个男人在年轻时，在一次意外之后穿越了，再次年轻时，开始潇洒人生，从赚第一桶金开始后，一发不可收拾，建立企业，发展娱乐影视，最后进入仕途的潇洒人生。<br/><br/>&nbsp;&nbsp;&nbsp;&nbsp;精彩的故事，扣人的情节，大家期待一下，多多关照，支持。',6,0,127,392918,0,1427325463458590720,'第一百四十五章杀手有点彪','2021-08-17 01:44:41',0,NULL,NULL),(1427174312041848832,0,5,'科幻灵异','/localPic/2021/08/16/207eed12e07544c3bd25727077c226d2.jpg','绝地求生之我是大魔王',0,'百度一吓','&nbsp;&nbsp;&nbsp;&nbsp;叶凌扶老奶奶过马路出车祸而穿越，来到绝地求生无比火爆的平行世界。<br/><br/>&nbsp;&nbsp;&nbsp;&nbsp;开局就获得绝地求生大魔王系统，从此绝地求生出现了一个魔王选手！<br/><br/>&nbsp;&nbsp;&nbsp;&nbsp;“叮咚，恭喜宿主淘汰韦神，获得顶配版兰博基尼！”<br/><br/>&nbsp;&nbsp;&nbsp;&nbsp;“叮咚，恭喜宿主淘汰麻花藤，获得企鹅集团股份！”<br/><br/>&nbsp;&nbsp;&nbsp;&nbsp;某团：“又被这个魔头欺负了，看我回去不叫他跪搓衣板！”<br/><br/>&nbsp;&nbsp;&nbsp;&nbsp;呆小妹：“我哭了，叶凌他就会欺负女孩子！”<br/><br/>&nbsp;&nbsp;&nbsp;&nbsp;韦神：“因为叶凌，这辈子不想打绝地！”<br/><br/>&nbsp;&nbsp;&nbsp;&nbsp;.....<br/><br/>&nbsp;&nbsp;&nbsp;&nbsp;叶凌表示：“我真不是大魔王啊！”',6,0,196,413955,0,1427322597956235264,'第161章 连续被爆头的狙王！','2021-08-17 01:33:04',0,NULL,NULL),(1427174314533265408,0,4,'历史军事','/localPic/2021/08/16/329890f4791548aea216d1e365c27116.jpg','镇国世子妃',0,'清之落漓','&nbsp;&nbsp;&nbsp;&nbsp;一场忌恋..导致那年她与他的相见。展凉夜布了三年的局只为谋得凤清言，尹宴用了十年跟凤清言下了一盘棋。<br/><br/>&nbsp;&nbsp;&nbsp;&nbsp;三年后展凉夜凤眸湿润，颤栗的指尖触碰自己的心口<br/><br/>&nbsp;&nbsp;&nbsp;&nbsp;“凤清言，你曾爱过我吗？”凤清言蹙眉，双眸冰冷无色，不带一丝感情<br/><br/>&nbsp;&nbsp;&nbsp;&nbsp;“不曾！”',6,0,40,367518,0,1427295712551481344,'第八十七章  重归圣女','2021-08-16 23:46:28',0,NULL,NULL),(1431611431921496064,0,5,'科幻灵异','/localPic/2021/08/28/822a237b4c0b486e91616698561a2d13.jpg','扭曲的日常物语',0,'木易长风','&nbsp;&nbsp;&nbsp;&nbsp;一直身处平凡日常生活中的男主角，在某天遇见一位濒死少女。因而被扯进非日常的世界当中。<br/><br/>&nbsp;&nbsp;&nbsp;&nbsp;自此开始逐步了解自己以及这个世界的真相。',7,0,1492,361960,0,1432041073996255232,'第一卷：黑夜 第二十三章：再次遇难的羽凛','2021-08-30 02:02:52',0,NULL,NULL),(1431612847591370752,0,5,'科幻灵异','/localPic/2021/08/28/0e54eeebcdf74ce486e32c61693ec94a.jpg','CFHD太初归途',0,'无臣子','&nbsp;&nbsp;&nbsp;&nbsp;【【<br/><br/>&nbsp;&nbsp;&nbsp;&nbsp;“脑洞大开”征文大奖赛】参赛作品】2021年，我们记忆中的穿越火线重置，席卷而来。<br/><br/>&nbsp;&nbsp;&nbsp;&nbsp;无数人奔走相告，带着记忆中的点滴。约上曾经的伙伴，再次齐聚网吧。<br/><br/>&nbsp;&nbsp;&nbsp;&nbsp;一群为了梦想而归来的人们，是否将这个游戏涅槃重生？无视冷眼，铭记埋怨，为了后辈，燃烧殆尽。',6,0,173,286350,0,1437086042259771392,'第九十五章 努力，奋斗','2021-09-13 00:09:45',0,NULL,NULL),(1431613237699391488,0,1,'玄幻奇幻','/localPic/2021/08/28/dc9caf973f224465aab1f97cab74e1aa.jpg','清梦大帝',0,'罗晋','&nbsp;&nbsp;&nbsp;&nbsp;故事设定在一个不存在的世界，泰威帝国末年，民不聊生，生灵涂炭，宦官轮流交替掌权，一心想完成统一大梦的青年张清梦，凭借着自己高超的军事才能和领导，以及遇到的许许多多伙伴，他的命运开始了扭转顺带说一下作者是学生，文笔不好，请大家轻喷(*/ω＼*)希望大家多多提出宝贵意见，我会......尽量使我的文笔更好的【展开】【收起】',6,0,658,262513,0,1445988184596992000,'第四篇 天下大战 四海难平 第八十八章 谋定天下','2021-10-07 13:43:36',0,NULL,NULL),(1431615838276923392,1,7,'女生频道','/localPic/2021/08/28/c85ed4d7564d40bbafce629ff47be0c9.jpg','那一年她们正毕业',0,'采竺','&nbsp;&nbsp;&nbsp;&nbsp;【【2019云起现实题材征文大赛】参赛作品】<br/><br/>&nbsp;&nbsp;&nbsp;&nbsp;216宿舍的六名大四女生，是一群充满理想并为之奋斗的热血青年。她们在大学的最后一年里因爱情、友情、推免研究生资格、考研、留校、出国留学、校园网贷、创业、就业等大学校园易发事件而上演着一幅幅丰富多彩、生动逼真的现代大学生活众生相。在她们的追梦路上不仅有对正义和善良的坚守，也有经过迷茫和迷途而获得的蜕变。<br/><br/>&nbsp;&nbsp;&nbsp;&nbsp;能歌善舞的冯露因为校园网贷，并间接导致室友宋瑶失去推免研究生资格，她该何去何从？<br/><br/>&nbsp;&nbsp;&nbsp;&nbsp;豪爽仗义的阿钰为了室友，不惜跑到学院替友出头，她会被处分吗？<br/><br/>&nbsp;&nbsp;&nbsp;&nbsp;娇柔善良的宋瑶虽然被人构陷失去推免研究生资格，但最后不仅原谅了室友，而且帮她度过难关。<br/><br/>&nbsp;&nbsp;&nbsp;&nbsp;一心出国的陈静萍为了室友，拉来当记者的男友调查推免研究生资格确定一事的真相。<br/><br/>&nbsp;&nbsp;&nbsp;&nbsp;小富婆兼新娘子的赵丽虹在创业陷入困境之时，她的快递站又该何去何从？<br/><br/>&nbsp;&nbsp;&nbsp;&nbsp;本校名师之女宁桦亲眼见证室友失去推免研究生资格，却因盲目相信学院而避口不言，后因一场盲目的爱情而失去了父亲，她能原谅自己吗？<br/><br/>&nbsp;&nbsp;&nbsp;&nbsp;?<br/><br/>&nbsp;&nbsp;&nbsp;&nbsp;阅读提醒：爱情、友情、推免研究生、考研、留校、出国留学、校园网贷、创业、就业',6,0,282,403135,0,1432044711045025792,'第117章 如同吃下一颗定心丸','2021-08-30 02:17:19',0,NULL,NULL),(1431621906981826560,0,4,'历史军事','/localPic/2021/08/28/e2c21e7eaf6e4736a72cfdfae3ef5689.jpg','烽烟满袖花满襟',0,'子初关','&nbsp;&nbsp;&nbsp;&nbsp;鹭洲坊间有三件“奇”事：<br/><br/>&nbsp;&nbsp;&nbsp;&nbsp;洋鬼子摘了林家的凤凰翎子，海龙王收了李家的免死牌子，沈老爷拆了舞鹤园的大戏台子。<br/><br/>&nbsp;&nbsp;&nbsp;&nbsp;如今大军阀刘家的长子，海军少帅刘瑾独宠林家大小姐晚婧目无旁人，<br/><br/>&nbsp;&nbsp;&nbsp;&nbsp;鹭洲这四大豪门在乱世里如何走便都成戏，成了谜。<br/><br/>&nbsp;&nbsp;&nbsp;&nbsp;……<br/><br/>&nbsp;&nbsp;&nbsp;&nbsp;“我知道你视晚婧为掌中珠玉，但你可是要做那姬宫湦，难道千余百姓的命尚不抵她一人？”<br/><br/>&nbsp;&nbsp;&nbsp;&nbsp;“对。便要我跟全天下为敌，我也在所不惜。”<br/><br/>&nbsp;&nbsp;&nbsp;&nbsp;……<br/><br/>&nbsp;&nbsp;&nbsp;&nbsp;“姐，姐夫很爱你，我看的出来。”<br/><br/>&nbsp;&nbsp;&nbsp;&nbsp;“你错了，盈盈。他不爱我，从来不曾爱过。”<br/><br/>&nbsp;&nbsp;&nbsp;&nbsp;……<br/><br/>&nbsp;&nbsp;&nbsp;&nbsp;凄凄复凄凄，嫁娶不须啼。愿得一心人，白头不相离。',6,0,104,399802,0,1432059379151065088,'Chapter 7 我要这天下','2021-08-30 03:15:36',0,NULL,NULL),(1431625876961865728,0,6,'网游竞技','/localPic/2021/08/28/139913c57b934bd9a6d6742a65d36660.jpg','社会上的大鹅',0,'二十二刀流','&nbsp;&nbsp;&nbsp;&nbsp;沙雕遇到了一只鹅，从此人生一败涂地……<br/><br/>&nbsp;&nbsp;&nbsp;&nbsp;“嘎！”（我想吃螃蟹）<br/><br/>&nbsp;&nbsp;&nbsp;&nbsp;“嘎嘎？”（有辆坦克，我能吃吗）<br/><br/>&nbsp;&nbsp;&nbsp;&nbsp;“嘎嘎嘎！”（远古巨兽，我要吃要吃）',6,0,463,351356,0,1432157525575258112,'第七十九章 查监控','2021-08-30 09:45:36',0,NULL,NULL),(1431626349915779072,0,1,'玄幻奇幻','/localPic/2021/08/28/d8bbfd73f1ae4b9dae8c5b27417eb2c7.jpg','帝王天道',0,'永恒的骑士','&nbsp;&nbsp;&nbsp;&nbsp;宏图霸业谈笑中，不胜人生一场醉。一朝穿越成为大夏国即将继位的皇子。<br/><br/>&nbsp;&nbsp;&nbsp;&nbsp;原本无法修炼的废物，一夜之间变成了一颗冉冉升起的新星。且看秦羽手持......帝王剑，身着帝王袍，领军百神魔，降临帝王道！<br/><br/>&nbsp;&nbsp;&nbsp;&nbsp;【展开】【收起】',6,0,158,362769,0,1440736645854842880,'第一百五十四章  霍去病，登场！','2021-09-23 01:55:55',0,NULL,NULL),(1431630568223780864,0,1,'玄幻奇幻','/localPic/2021/08/28/6af4240fece64ba48343b0fbb2f4c6d8.jpg','修真界出大事了',0,'神仙桃桃','&nbsp;&nbsp;&nbsp;&nbsp;修真界出大事了！<br/><br/>&nbsp;&nbsp;&nbsp;&nbsp;人间修真界第一高人，云蒙山的云清道长收了第一个徒弟，还是个女徒弟。<br/><br/>&nbsp;&nbsp;&nbsp;&nbsp;不不不，根本不是人，还是个刚修成人形的小狐狸精。<br/><br/>&nbsp;&nbsp;&nbsp;&nbsp;从此云蒙山炸开了锅......<br/><br/>&nbsp;&nbsp;&nbsp;&nbsp;一天后，厨房的鸡不见了，不是我，不是我。<br/><br/>&nbsp;&nbsp;&nbsp;&nbsp;一月后，灵虚剑不见了，不是我，不是我。<br/><br/>&nbsp;&nbsp;&nbsp;&nbsp;一年后，大师兄不见了，不是我，不是我。<br/><br/>&nbsp;&nbsp;&nbsp;&nbsp;真的不是我......我一只迷糊的小狐狸精什么都不知道……<br/><br/>&nbsp;&nbsp;&nbsp;&nbsp;修真是假，成仙更是无望。混吃混喝，骗个便宜师父，拐个厉害老公，拉个上神来挡劫，这样的日子差不多就行了......',7,0,1372,330451,0,1432077234357719040,'第40章 天选之狐的传说','2021-08-30 04:26:33',0,NULL,NULL),(1431630596354977792,0,3,'都市言情','/localPic/2021/08/28/a5896a7bff2d4ae08f8c5e99355dfd06.jpg','重生之夫妻双双把仙修',0,'木易秋','&nbsp;&nbsp;&nbsp;&nbsp;一生一世哪够，生生世世才够。一个是军人世家出身，冷酷无情。一个是医学怪才，从不心软。这样的两个人撞到了一起一个褪下了冷酷唯爱温柔，一个娇俏可爱，夫妻相互扶持一生到老。原以为俩人的缘分就这么一辈子，约<br/>',7,0,1734,364638,0,1432076089790877696,'第一百八十五章 智灭毒藤','2021-08-30 04:21:59',0,NULL,NULL);
/*!40000 ALTER TABLE `book_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `book_nextPages`
--

DROP TABLE IF EXISTS `book_nextPages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `book_nextPages` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `novel_id` bigint NOT NULL COMMENT '本章pageID',
  `book_id` bigint NOT NULL COMMENT '本章小说ID',
  `link_url` varchar(100) NOT NULL COMMENT '下一章链接url',
  `nextpage_name` varchar(100) DEFAULT NULL COMMENT '下一章的章节名',
  `nextpage_desc` varchar(1000) NOT NULL COMMENT '下一章的简单描述',
  `thumbsup_count` int DEFAULT '0' COMMENT '下一章的点赞数量',
  `reply_count` int DEFAULT '0' COMMENT '下一章的评论数量',
  `linkorder` int DEFAULT NULL COMMENT '这是第几个下一章链接?',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='下一章的集合表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book_nextPages`
--

LOCK TABLES `book_nextPages` WRITE;
/*!40000 ALTER TABLE `book_nextPages` DISABLE KEYS */;
INSERT INTO `book_nextPages` VALUES (1,0,1,'https://blog.csdn.net/weixin_38316697/article/details/108196401','第12章','null',0,0,NULL),(2,0,0,'https://mybatis.net.cn/java-api.html','测试的章节','null',0,0,NULL),(3,1546715404372705280,2,'https://www.baidu.com/','测试章节','null',0,0,NULL),(4,1546715404372705280,2,'https://mybatis.net.cn/java-api.html','测试章节2','null',0,0,NULL),(5,1548209604536733696,2,'https://blog.51cto.com/u_6740008/4852378','测试','null',0,0,NULL),(6,1546715404372705280,2,'https://blog.csdn.net/qq502948261/article/details/82810887','继续测试','null',0,0,NULL),(7,1546715404372705280,2,'https://www.csdn.net/tags/NtjaEgwsOTg0NjQtYmxvZwO0O0OO0O0O.html','第五章','null',0,0,NULL),(8,1548290825925074944,4,'https://blog.csdn.net/weixin_33121345/article/details/117798007','测试链接1','null',8,0,1),(9,1548290825925074944,4,'https://blog.csdn.net/weixin_33121345/article/details/117798007','测试链接2','null',12,0,2),(10,1548290825925074944,4,'https://blog.csdn.net/weixin_33121345/article/details/117798007','测试连接3','null',6,0,3),(11,1548290825925074944,4,'https://blog.csdn.net/weixin_33121345/article/details/117798007','测试连接4','null',4,0,4),(12,1548290825925074944,4,'https://blog.csdn.net/weixin_33121345/article/details/117798007','测试间接2','null',5,0,5),(13,1548290825925074944,4,'https://blog.csdn.net/weixin_33121345/article/details/117798007','测试链接6','null',8,0,6),(14,1548290825925074944,4,'www.baidu.com','12','null',6,0,7),(15,1550840735153139712,4,'https://www.baidu.com/','题目侧死','null',0,0,NULL),(16,1548290825925074944,4,'www.baidu.com','误伤的荣光难以命名','null',7,0,8),(17,1548290825925074944,4,'http:www.baidu.com','ceshi112','null',1,0,NULL),(18,1548290825925074944,4,'jsjidji','ceshi ','null',1,0,NULL),(19,1548290825925074944,4,'cjj','ceshi2','null',1,0,NULL),(20,1548290825925074944,4,'14','12','null',0,0,NULL),(21,1566680840233271296,42,'ssssss','ceshi','null',0,0,NULL);
/*!40000 ALTER TABLE `book_nextPages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `book_screen_bullet`
--

DROP TABLE IF EXISTS `book_screen_bullet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `book_screen_bullet` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `content_id` bigint NOT NULL COMMENT '小说内容ID',
  `screen_bullet` varchar(512) NOT NULL COMMENT '小说弹幕内容',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `key_contentId` (`content_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='小说弹幕表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book_screen_bullet`
--

LOCK TABLES `book_screen_bullet` WRITE;
/*!40000 ALTER TABLE `book_screen_bullet` DISABLE KEYS */;
/*!40000 ALTER TABLE `book_screen_bullet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `book_setting`
--

DROP TABLE IF EXISTS `book_setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `book_setting` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `book_id` bigint DEFAULT NULL COMMENT '小说ID',
  `sort` tinyint DEFAULT NULL COMMENT '排序号',
  `type` tinyint(1) DEFAULT NULL COMMENT '类型，0：轮播图，1：顶部小说栏设置，2：本周强推，3：热门推荐，4：精品推荐',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_user_id` bigint DEFAULT NULL COMMENT '创建人ID',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `update_user_id` bigint DEFAULT NULL COMMENT '更新人ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='首页小说设置表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book_setting`
--

LOCK TABLES `book_setting` WRITE;
/*!40000 ALTER TABLE `book_setting` DISABLE KEYS */;
INSERT INTO `book_setting` VALUES (32,1254674114481422336,1,0,'2020-04-27 15:45:58',NULL,'2020-04-27 15:46:03',NULL),(33,1254674171310047232,2,0,'2020-04-27 15:46:21',NULL,'2020-04-27 15:46:24',NULL),(34,1254674255883993088,3,0,'2020-04-27 15:47:06',NULL,'2020-04-27 15:47:09',NULL),(35,1254674396451897344,4,0,'2020-04-27 15:47:24',NULL,'2020-04-27 15:47:27',NULL),(36,1254674613117059072,1,1,NULL,NULL,NULL,NULL),(37,1254680030366859264,2,1,NULL,NULL,NULL,NULL),(38,1254677251162308608,3,1,NULL,NULL,NULL,NULL),(39,1254677745226153984,4,1,NULL,NULL,NULL,NULL),(40,1254677887534694400,5,1,NULL,NULL,NULL,NULL),(41,1254675594315759616,1,2,NULL,NULL,NULL,NULL),(42,1254675739140882432,2,2,NULL,NULL,NULL,NULL),(43,1254675826696978432,3,2,NULL,NULL,NULL,NULL),(44,1254676309448785920,4,2,NULL,NULL,NULL,NULL),(45,1254676443012202496,5,2,NULL,NULL,NULL,NULL),(46,1254676564366000128,6,2,NULL,NULL,NULL,NULL),(47,1254676970567565312,1,3,NULL,NULL,NULL,NULL),(48,1254677251162308608,2,3,NULL,NULL,NULL,NULL),(49,1254677745226153984,3,3,NULL,NULL,NULL,NULL),(50,1254677887534694400,4,3,NULL,NULL,NULL,NULL),(51,1254675826696978432,5,3,NULL,NULL,NULL,NULL),(52,1254676970567565312,6,3,NULL,NULL,NULL,NULL),(53,1254681827219275776,1,4,NULL,NULL,NULL,NULL),(54,1254681178427555840,2,4,NULL,NULL,NULL,NULL),(55,1254681827219275776,3,4,NULL,NULL,NULL,NULL),(56,1254681753466634240,4,4,NULL,NULL,NULL,NULL),(57,1254682148440047616,5,4,NULL,NULL,NULL,NULL),(58,1254682422076440576,6,4,NULL,NULL,NULL,NULL),(59,1254674794009001984,6,1,NULL,NULL,NULL,NULL),(60,1254678892443795456,7,1,NULL,NULL,NULL,NULL),(61,1254681753466634240,8,1,NULL,NULL,NULL,NULL),(62,1254681071191785472,9,1,NULL,NULL,NULL,NULL),(63,1254677745226153984,10,1,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `book_setting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `commentfirstlevel`
--

DROP TABLE IF EXISTS `commentfirstlevel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `commentfirstlevel` (
  `flc_id` int NOT NULL AUTO_INCREMENT,
  `sayingId` int NOT NULL,
  `commenter` varchar(50) NOT NULL,
  `commenterAvatar` varchar(100) NOT NULL COMMENT '评论者的头像位置',
  `commentContent` varchar(500) NOT NULL,
  `commentTime` datetime NOT NULL,
  `pageid` bigint DEFAULT NULL COMMENT '页面的id',
  `bookid` bigint DEFAULT NULL COMMENT '小说的id',
  `lineid` bigint DEFAULT NULL COMMENT '页面的第几行?',
  `thumpsup` int DEFAULT NULL COMMENT '这是评论的点赞数量',
  PRIMARY KEY (`flc_id`)
) ENGINE=InnoDB AUTO_INCREMENT=137 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `commentfirstlevel`
--

LOCK TABLES `commentfirstlevel` WRITE;
/*!40000 ALTER TABLE `commentfirstlevel` DISABLE KEYS */;
INSERT INTO `commentfirstlevel` VALUES (0,2,'timelessmemory','images/timelessmemory.jpg','12','2022-07-20 17:15:11',0,0,0,0),(84,1,'17853309279','/localPic/2022/07/22/d40a09f3a01240759de1a45fc0033041.jpeg','少时诵诗书','2022-07-23 10:53:46',1548290825925074944,4,1,5),(85,1,'17853309279','/localPic/2022/07/22/d40a09f3a01240759de1a45fc0033041.jpeg','顶顶顶顶','2022-07-23 10:55:11',1548290825925074944,4,1,1),(86,1,'17853309279','/localPic/2022/07/22/d40a09f3a01240759de1a45fc0033041.jpeg','的点点滴滴','2022-07-23 11:07:48',1548291115931836416,4,1,0),(87,1,'17853309279','/localPic/2022/07/22/d40a09f3a01240759de1a45fc0033041.jpeg','烦烦烦','2022-07-23 11:08:36',1548291115931836416,4,2,0),(88,1,'17853309279','/localPic/2022/07/22/d40a09f3a01240759de1a45fc0033041.jpeg','水水水水','2022-07-23 11:08:49',1548291115931836416,4,2,0),(89,1,'17853309279','/localPic/2022/07/22/d40a09f3a01240759de1a45fc0033041.jpeg','的点点滴滴','2022-07-23 11:09:05',1548291115931836416,4,1,0),(90,1,'17853309279','/localPic/2022/07/22/d40a09f3a01240759de1a45fc0033041.jpeg','对对对','2022-07-23 11:09:18',1548290825925074944,4,1,1),(91,1,'17853309279','/localPic/2022/07/22/d40a09f3a01240759de1a45fc0033041.jpeg','111','2022-07-23 11:10:27',1548291115931836416,4,2,0),(92,1,'17853309279','/localPic/2022/07/22/d40a09f3a01240759de1a45fc0033041.jpeg','对对对','2022-07-23 11:10:37',1548290825925074944,4,1,0),(93,1,'17853309279','/localPic/2022/07/22/d40a09f3a01240759de1a45fc0033041.jpeg','1','2022-07-23 11:11:29',1550679917270908928,4,1,0),(94,1,'17853309279','/localPic/2022/07/22/d40a09f3a01240759de1a45fc0033041.jpeg','2','2022-07-23 11:11:44',1550679917270908928,4,2,0),(95,1,'17853309279','/localPic/2022/07/22/d40a09f3a01240759de1a45fc0033041.jpeg','12','2022-07-23 11:15:38',1550679917270908928,4,4,0),(96,1,'17853309279','/localPic/2022/07/22/d40a09f3a01240759de1a45fc0033041.jpeg','12','2022-07-23 11:17:37',1550679917270908928,4,4,0),(97,1,'17853309279','/localPic/2022/07/22/d40a09f3a01240759de1a45fc0033041.jpeg','12','2022-07-23 11:18:52',1550679917270908928,4,3,0),(98,1,'17853309279','/localPic/2022/07/22/d40a09f3a01240759de1a45fc0033041.jpeg','ddddddd','2022-07-23 14:05:33',1550679917270908928,4,4,0),(99,1,'17853309279','/localPic/2022/07/22/d40a09f3a01240759de1a45fc0033041.jpeg','12','2022-07-23 14:13:48',1550724162555899904,4,2,0),(100,1,'17853309279','/localPic/2022/07/22/d40a09f3a01240759de1a45fc0033041.jpeg','13','2022-07-23 14:25:06',1550724162555899904,4,1,0),(101,1,'17853309279','/localPic/2022/07/22/d40a09f3a01240759de1a45fc0033041.jpeg','12','2022-07-23 15:11:33',1550724162555899904,4,3,0),(102,1,'17853309279','/localPic/2022/07/22/d40a09f3a01240759de1a45fc0033041.jpeg','12','2022-07-23 15:11:36',1550724162555899904,4,3,0),(103,1,'17853309279','/localPic/2022/07/22/d40a09f3a01240759de1a45fc0033041.jpeg','顶顶顶顶','2022-07-23 20:49:57',1550724162555899904,4,5,0),(104,1,'17853309279','/localPic/2022/07/22/d40a09f3a01240759de1a45fc0033041.jpeg','顶顶顶顶','2022-07-23 20:52:59',1550724162555899904,4,6,0),(105,1,'17853309279','/localPic/2022/07/22/d40a09f3a01240759de1a45fc0033041.jpeg','呃呃呃','2022-07-23 21:02:47',1550724162555899904,4,4,0),(106,1,'17853309279','/localPic/2022/07/22/d40a09f3a01240759de1a45fc0033041.jpeg','的点点滴滴','2022-07-23 21:03:11',1550724162555899904,4,7,0),(107,1,'17853309279','/localPic/2022/07/22/d40a09f3a01240759de1a45fc0033041.jpeg','对对对','2022-07-23 21:04:06',1550724162555899904,4,7,0),(108,1,'17853309279','/localPic/2022/07/22/d40a09f3a01240759de1a45fc0033041.jpeg','的点点滴滴','2022-07-23 21:05:09',1550724162555899904,4,8,0),(109,1,'17853309279','/localPic/2022/07/22/d40a09f3a01240759de1a45fc0033041.jpeg','去去去','2022-07-23 21:05:58',1550724162555899904,4,9,0),(110,1,'17853309279','/localPic/2022/07/22/d40a09f3a01240759de1a45fc0033041.jpeg','反反复复','2022-07-23 21:07:10',1550724162555899904,4,9,0),(111,1,'17853309279','/localPic/2022/07/22/d40a09f3a01240759de1a45fc0033041.jpeg','的点点滴滴','2022-07-23 21:10:33',1550724162555899904,4,1,0),(112,1,'17853309279','/localPic/2022/07/22/d40a09f3a01240759de1a45fc0033041.jpeg','呃呃呃','2022-07-23 21:11:03',1550724162555899904,4,1,0),(113,1,'17853309279','/localPic/2022/07/22/d40a09f3a01240759de1a45fc0033041.jpeg','4','2022-07-23 21:13:11',1550724162555899904,4,1,0),(114,1,'17853309279','/localPic/2022/07/22/d40a09f3a01240759de1a45fc0033041.jpeg','5','2022-07-23 21:19:03',1550724162555899904,4,1,0),(115,1,'17853309279','/localPic/2022/07/22/d40a09f3a01240759de1a45fc0033041.jpeg','7','2022-07-23 21:31:40',1550724162555899904,4,1,0),(116,1,'游客','images/li.jpg','沉甸甸的','2022-07-24 20:06:34',1548290825925074944,4,1,0),(117,1,'游客','images/li.jpg','草腹菜肠','2022-07-24 20:07:11',1548290825925074944,4,1,1),(118,1,'游客','images/li.jpg','ccc','2022-07-24 23:45:39',1548291115931836416,4,1,0),(119,1,'游客','images/li.jpg','实验效果哈哈哈','2022-08-01 15:45:53',1548290825925074944,4,1,1),(120,1,'游客','images/li.jpg','1222','2022-08-04 09:47:15',1548290825925074944,4,1,1),(121,1,'17754889839','null','是是是','2022-08-18 13:50:41',1550724162555899904,4,2,0),(122,1,'17754889839','null','顶顶顶顶','2022-08-18 13:51:12',1550724162555899904,4,1,0),(123,1,'17754889839','null','反反复复','2022-08-18 13:51:57',1548290825925074944,4,1,0),(124,1,'17754889839','null','反反复复','2022-08-20 10:00:15',NULL,15,1,0),(125,1,'游客','images/li.jpg','顶顶顶顶','2022-09-05 14:47:11',1564503542839013376,31,1,0),(126,1,'游客','images/li.jpg','的点点滴滴多多多','2022-09-05 14:54:27',1566680840233271296,42,2,1),(127,1,'17754889839','null','对对对','2022-09-05 15:00:30',1566680840233271296,42,2,1),(128,1,'17754889839','null','对对对','2022-09-05 15:01:34',1566680840233271296,42,2,0),(129,1,'17754889839','null','的点点滴滴多','2022-09-05 15:02:07',1566680840233271296,42,2,0),(130,1,'17754889839','null','的点点滴滴多多多多多多多多','2022-09-05 15:04:01',1566680840233271296,42,2,0),(131,1,'17754889839','null','测试评论','2022-09-05 19:59:10',1566680840233271296,42,2,0),(132,1,'游客','images/li.jpg','15','2022-09-21 11:20:26',1566680840233271296,42,3,0),(133,1,'游客','images/li.jpg','16','2022-09-21 11:21:07',1566680840233271296,42,1,2),(134,1,'游客','images/li.jpg','15','2022-09-23 20:32:44',NULL,42,1,0),(135,1,'游客','images/li.jpg','15','2022-09-23 20:39:19',NULL,42,1,0),(136,1,'游客','images/TouristAvatar.png','14','2022-10-06 07:58:59',1566680840233271296,42,4,0);
/*!40000 ALTER TABLE `commentfirstlevel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comments_line_number`
--

DROP TABLE IF EXISTS `comments_line_number`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comments_line_number` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `pageid` bigint NOT NULL DEFAULT '1' COMMENT '页面的id',
  `bookid` bigint NOT NULL DEFAULT '1' COMMENT '小说的id',
  `lineid` bigint NOT NULL DEFAULT '1' COMMENT '页面的第几行?',
  `commentNum` bigint NOT NULL DEFAULT '0' COMMENT '有几条评论?',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='小说评论数量表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments_line_number`
--

LOCK TABLES `comments_line_number` WRITE;
/*!40000 ALTER TABLE `comments_line_number` DISABLE KEYS */;
INSERT INTO `comments_line_number` VALUES (1,1548291115931836416,4,1,23),(2,1548291115931836416,4,2,13),(3,1548290825925074944,4,1,20),(4,1550679917270908928,4,1,1),(5,1550679917270908928,4,2,1),(6,1550679917270908928,4,4,3),(7,1550679917270908928,4,3,1),(8,1550724162555899904,4,2,2),(9,1550724162555899904,4,1,8),(10,1550724162555899904,4,3,2),(11,1550724162555899904,4,5,1),(12,1550724162555899904,4,6,1),(13,1550724162555899904,4,4,1),(14,1550724162555899904,4,7,2),(15,1550724162555899904,4,8,1),(16,1550724162555899904,4,9,2),(17,1564503542839013376,31,1,1),(18,1566680840233271296,42,2,7),(19,1566680840233271296,42,3,1),(20,1566680840233271296,42,1,1),(21,1566680840233271296,42,4,3);
/*!40000 ALTER TABLE `comments_line_number` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `commentsaying`
--

DROP TABLE IF EXISTS `commentsaying`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `commentsaying` (
  `saying_id` int NOT NULL AUTO_INCREMENT,
  `sayingContent` varchar(500) NOT NULL,
  `author` varchar(50) NOT NULL,
  `sayingAvatar` varchar(50) NOT NULL,
  `likes` varchar(500) NOT NULL,
  `createTime` datetime NOT NULL,
  PRIMARY KEY (`saying_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `commentsaying`
--

LOCK TABLES `commentsaying` WRITE;
/*!40000 ALTER TABLE `commentsaying` DISABLE KEYS */;
INSERT INTO `commentsaying` VALUES (1,'请写下评论。','n','images/man.png','10','2020-01-01 00:00:00'),(2,'ddddd','n','ee','10','2020-01-01 00:00:00'),(3,'ddddd','nnn','ffff','0','2020-01-01 00:00:00');
/*!40000 ALTER TABLE `commentsaying` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `commentsecondlevel`
--

DROP TABLE IF EXISTS `commentsecondlevel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `commentsecondlevel` (
  `slc_id` int NOT NULL AUTO_INCREMENT,
  `sayingId` int NOT NULL,
  `flcId` int NOT NULL,
  `replier` varchar(50) NOT NULL,
  `toCommenter` varchar(50) NOT NULL,
  `replyContent` varchar(50) NOT NULL,
  `replyTime` datetime NOT NULL,
  `thumpsup2` int DEFAULT NULL,
  PRIMARY KEY (`slc_id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `commentsecondlevel`
--

LOCK TABLES `commentsecondlevel` WRITE;
/*!40000 ALTER TABLE `commentsecondlevel` DISABLE KEYS */;
INSERT INTO `commentsecondlevel` VALUES (1,1,35,'timelessmemory','timelessmemory',' sdafdddd','2022-07-22 14:50:18',0),(2,1,35,'timelessmemory','timelessmemory',' sdaddd','2022-07-22 14:50:34',0),(3,1,61,'timelessmemory','timelessmemory',' 都是对的多','2022-07-22 17:54:52',0),(4,1,61,'timelessmemory','timelessmemory',' sabbatical','2022-07-22 17:54:58',0),(5,1,1,'timelessmemory','timelessmemory',' 司机及','2022-07-22 21:33:16',0),(6,1,63,'222','timelessmemory',' 的点点滴滴','2022-07-22 21:37:19',0),(7,1,69,'游客','游客',' 少时诵诗书','2022-07-22 21:44:03',0),(8,1,61,'登陆了','timelessmemory',' 顶顶顶顶','2022-07-22 21:47:49',0),(9,1,61,'登陆了','登陆了',' 顶顶顶顶','2022-07-22 21:48:16',0),(10,1,69,'17853309279','游客',' 顶顶顶顶','2022-07-23 00:03:46',0),(11,1,106,'17853309279','17853309279',' 磨难与','2022-07-23 21:03:36',0),(12,1,106,'17853309279','17853309279',' 呜呜呜呜','2022-07-23 21:03:52',0),(13,1,108,'17853309279','17853309279',' 巴巴爸爸不','2022-07-23 21:05:25',0),(14,1,108,'17853309279','17853309279',' 的点点滴滴多','2022-07-23 21:05:35',0),(15,1,99,'17853309279','17853309279',' 烦烦烦','2022-07-23 21:19:17',0),(16,1,100,'17853309279','17853309279',' erro','2022-07-23 21:31:22',0),(17,1,86,'游客','17853309279',' ddd','2022-07-24 23:37:44',0),(18,1,84,'游客','17853309279',' emoji','2022-08-01 15:39:10',6),(19,1,85,'游客','17853309279',' emoji777','2022-08-01 15:46:06',3),(20,1,90,'游客','17853309279',' 对对对','2022-08-04 09:50:05',1),(21,1,126,'游客','游客',' dddd','2022-10-05 10:02:53',0),(22,1,136,'游客','游客',' 15','2022-10-06 07:59:09',0),(23,1,136,'游客','游客',' 23','2022-10-06 08:00:11',0);
/*!40000 ALTER TABLE `commentsecondlevel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `crawl_batch_task`
--

DROP TABLE IF EXISTS `crawl_batch_task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `crawl_batch_task` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `source_id` int DEFAULT NULL COMMENT '爬虫源ID',
  `crawl_count_success` int DEFAULT NULL COMMENT '成功抓取数量',
  `crawl_count_target` int DEFAULT NULL COMMENT '目标抓取数量',
  `task_status` tinyint(1) DEFAULT '1' COMMENT '任务状态，1：正在运行，0已停止',
  `start_time` datetime DEFAULT NULL COMMENT '任务开始时间',
  `end_time` datetime DEFAULT NULL COMMENT '任务结束时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='批量抓取任务表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `crawl_batch_task`
--

LOCK TABLES `crawl_batch_task` WRITE;
/*!40000 ALTER TABLE `crawl_batch_task` DISABLE KEYS */;
/*!40000 ALTER TABLE `crawl_batch_task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `crawl_single_task`
--

DROP TABLE IF EXISTS `crawl_single_task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `crawl_single_task` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `source_id` int DEFAULT NULL COMMENT '爬虫源ID',
  `source_name` varchar(50) DEFAULT NULL COMMENT '爬虫源名',
  `source_book_id` varchar(255) DEFAULT NULL COMMENT '源站小说ID',
  `cat_id` int DEFAULT NULL COMMENT '分类ID',
  `book_name` varchar(50) DEFAULT NULL COMMENT '爬取的小说名',
  `author_name` varchar(50) DEFAULT NULL COMMENT '爬取的小说作者名',
  `task_status` tinyint(1) DEFAULT '2' COMMENT '任务状态，0：失败，1：成功，2；未执行',
  `exc_count` tinyint DEFAULT '0' COMMENT '已经执行次数，最多执行5次',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='抓取单本小说任务表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `crawl_single_task`
--

LOCK TABLES `crawl_single_task` WRITE;
/*!40000 ALTER TABLE `crawl_single_task` DISABLE KEYS */;
INSERT INTO `crawl_single_task` VALUES (6,2,'百书斋','1',1,'1','1',0,5,'2020-06-15 14:36:07'),(7,5,'笔趣阁','108_108291',1,'衍天志之不朽仙','白衣少年丶',1,1,'2020-06-15 14:46:08');
/*!40000 ALTER TABLE `crawl_single_task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `crawl_source`
--

DROP TABLE IF EXISTS `crawl_source`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `crawl_source` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `source_name` varchar(50) DEFAULT NULL COMMENT '源站名',
  `crawl_rule` text COMMENT '爬取规则（json串）',
  `source_status` tinyint(1) DEFAULT '0' COMMENT '爬虫源状态，0：关闭，1：开启',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='爬虫源表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `crawl_source`
--

LOCK TABLES `crawl_source` WRITE;
/*!40000 ALTER TABLE `crawl_source` DISABLE KEYS */;
INSERT INTO `crawl_source` VALUES (2,'百书斋','{\r\n	\"bookListUrl\": \"https://m.baishuzhai.com/blhb/{catId}/{page}.html\",\r\n	\"catIdRule\": {\r\n		\"catId1\": \"1\",\r\n		\"catId2\": \"2\",\r\n		\"catId3\": \"3\",\r\n		\"catId4\": \"4\",\r\n		\"catId5\": \"5\",\r\n		\"catId6\": \"6\",\r\n		\"catId7\": \"7\"\r\n	},\r\n	\"bookIdPatten\": \"href=\\\"/ibook/(\\\\d+/\\\\d+)/\\\"\",\r\n	\"pagePatten\": \"value=\\\"(\\\\d+)/\\\\d+\\\"\",\r\n	\"totalPagePatten\": \"value=\\\"\\\\d+/(\\\\d+)\\\"\",\r\n	\"bookDetailUrl\": \"https://m.baishuzhai.com/ibook/{bookId}/\",\r\n	\"bookNamePatten\": \"<span class=\\\"title\\\">([^/]+)</span>\",\r\n	\"authorNamePatten\": \">作者：([^/]+)<\",\r\n	\"picUrlPatten\": \"<img src=\\\"([^>]+)\\\"\\\\s+onerror=\\\"this.src=\",\r\n	\"statusPatten\": \"状态：([^/]+)</li>\",\r\n	\"bookStatusRule\": {\r\n		\"连载\": 0,\r\n		\"完成\": 1\r\n	},\r\n	\"scorePatten\": \"<em>([^<]+)</em>\",\r\n	\"descStart\": \"<p class=\\\"review\\\">\",\r\n	\"descEnd\": \"</p>\",\r\n	\"upadateTimePatten\": \"更新：(\\\\d+-\\\\d+-\\\\d+)</li>\",\r\n	\"upadateTimeFormatPatten\": \"yy-MM-dd\",\r\n	\"bookIndexUrl\": \"https://m.baishuzhai.com/ibook/{bookId}/all.html\",\r\n	\"indexIdPatten\": \"<a\\\\s+style=\\\"\\\"\\\\s+href=\\\"/ibook/\\\\d+/\\\\d+/(\\\\d+)\\\\.html\\\">[^/]+</a>\",\r\n	\"indexNamePatten\": \"<a\\\\s+style=\\\"\\\"\\\\s+href=\\\"/ibook/\\\\d+/\\\\d+/\\\\d+\\\\.html\\\">([^/]+)</a>\",\r\n	\"bookContentUrl\": \"https://baishuzhai.com/ibook/{bookId}/{indexId}.html\",\r\n	\"contentStart\": \"id=\\\"content\\\">\",\r\n	\"contentEnd\": \"<script>\"\r\n}',0,'2020-05-01 14:22:50','2020-05-01 14:22:50'),(3,'书包网','{\r\n	\"bookListUrl\": \"https://www.bookbao8.com/booklist-p_{page}-c_{catId}-t_0-o_0.html\",\r\n	\"catIdRule\": {\r\n		\"catId1\": \"5\",\r\n		\"catId2\": \"4\",\r\n		\"catId3\": \"8\",\r\n		\"catId4\": \"9\",\r\n		\"catId5\": \"3\",\r\n		\"catId6\": \"7\"\r\n	},\r\n	\"bookIdPatten\": \"href=\\\"/book/(\\\\d+/\\\\d+/id_[^.]+).html\\\"\",\r\n	\"pagePatten\": \"<span\\\\s+class=\\\"current\\\">([^<]+)</span>\",\r\n	\"totalPagePatten\": \"/共(\\\\d+)页\",\r\n	\"bookDetailUrl\": \"https://www.bookbao8.com/book/{bookId}.html\",\r\n	\"bookNamePatten\": \"<div\\\\s+id=\\\"info\\\">\\\\s*<h1>([^<]+)</h1>\",\r\n	\"authorNamePatten\": \"<p>作者：<a\\\\s+href=\\\"/Search/[^\\\"]+\\\"\\\\s+target=\\\"_blank\\\">([^<]+)</a></p>\",\r\n	\"picUrlPatten\": \"<div\\\\s+id=\\\"fmimg\\\">\\\\s*<img\\\\s+alt=\\\"[^\\\"]+\\\"\\\\s+src=\\\"([^\\\"]+)\\\"\",\r\n	\"statusPatten\": \"<p>状态：([^<]+)</p>\",\r\n	\"bookStatusRule\": {\r\n		\"连载中\": 0,\r\n		\"已完结\": 1\r\n	},\r\n	\"visitCountPatten\": \"<em\\\\s+id=\\\"hits\\\">(\\\\d+)</em>\",\r\n	\"descStart\": \"<div class=\\\"infocontent\\\">\",\r\n	\"descEnd\": \"</div>\",\r\n	\"upadateTimePatten\": \"<p>更新时间：(\\\\d+-\\\\d+-\\\\d+\\\\s\\\\d+:\\\\d+:\\\\d+)</p>\",\r\n	\"upadateTimeFormatPatten\": \"yyyy-MM-dd HH:mm:ss\",\r\n	\"bookIndexUrl\": \"https://www.bookbao8.com/book/{bookId}.html\",\r\n	\"indexIdPatten\": \"<li>\\\\s*<a\\\\s+href=\\\"/views/\\\\d+/\\\\d+/id_[^_]+_(\\\\d+).html\\\"\\\\s+target=\\\"_blank\\\">\",\r\n	\"indexNamePatten\": \"<li>\\\\s*<a\\\\s+href=\\\"/views/\\\\d+/\\\\d+/id_[^_]+_\\\\d+.html\\\"\\\\s+target=\\\"_blank\\\">([^<]+)</a>\",\r\n	\"bookContentUrl\": \"https://www.bookbao8.com/views/{bookId}_{indexId}.html\",\r\n	\"contentStart\": \"<dd id=\\\"contents\\\">\",\r\n	\"contentEnd\": \"</dd>\"\r\n}',0,'2020-05-04 17:42:22','2020-05-04 17:42:22'),(4,'书趣阁','{\n	\"bookListUrl\": \"http://m.shuquge.com/sort/{catId}/0_{page}.html\",\n	\"catIdRule\": {\n		\"catId1\": \"1\",\n		\"catId2\": \"2\",\n		\"catId3\": \"3\",\n		\"catId4\": \"4\",\n		\"catId5\": \"7\",\n		\"catId6\": \"6\",\n		\"catId7\": \"8\"\n	},\n	\"bookIdPatten\": \"href=\\\"/s/(\\\\d+)\\\\.html\\\"\",\n	\"pagePatten\": \"第(\\\\d+)/\\\\d+页\",\n	\"totalPagePatten\": \"第\\\\d+/(\\\\d+)页\",\n	\"bookDetailUrl\": \"http://m.shuquge.com/s/{bookId}.html\",\n	\"bookNamePatten\": \"<a\\\\s+href=\\\"/s/\\\\d+\\\\.html\\\"><h2>([^/]+)</h2></a>\",\n	\"authorNamePatten\": \"<p>作者：([^/]+)</p>\",\n	\"picUrlPatten\": \"src=\\\"(http://www.shuquge.com/files/article/image/\\\\d+/\\\\d+/\\\\d+s\\\\.jpg)\\\"\",\n	\"statusPatten\": \"<p>状态：([^/]+)</p>\",\n	\"bookStatusRule\": {\n		\"连载中\": 0,\n		\"完本\": 1\n	},\n	\"descStart\": \"<div class=\\\"intro_info\\\">\",\n	\"descEnd\": \"最新章节推荐地址\",\n	\"bookIndexUrl\": \"http://www.shuquge.com/txt/{bookId}/index.html\",\n	\"bookIndexStart\": \"<dt>《\",\n	\"indexIdPatten\": \"<dd><a\\\\s+href=\\\"(\\\\d+)\\\\.html\\\">[^/]+</a></dd>\",\n	\"indexNamePatten\": \"<dd><a\\\\s+href=\\\"\\\\d+\\\\.html\\\">([^/]+)</a></dd>\",\n	\"bookContentUrl\": \"http://www.shuquge.com/txt/{bookId}/{indexId}.html\",\n	\"contentStart\": \"<div id=\\\"content\\\" class=\\\"showtxt\\\">\",\n	\"contentEnd\": \"http://www.shuquge.com\"\n}',0,'2020-05-18 12:02:34','2020-05-18 12:02:34'),(5,'笔趣阁','{\"bookListUrl\":\"http://m.mcmssc.com/xclass/{catId}/{page}.html\",\"catIdRule\":{\"catId1\":\"1\",\"catId2\":\"2\",\"catId3\":\"3\",\"catId4\":\"4\",\"catId5\":\"5\",\"catId6\":\"6\",\"catId7\":\"7\"},\"bookIdPatten\":\"href=\\\"/(\\\\d+_\\\\d+)/\\\"\",\"pagePatten\":\"class=\\\"page_txt\\\"\\\\s+value=\\\"(\\\\d+)/\\\\d+\\\"\\\\s+size=\",\"totalPagePatten\":\"class=\\\"page_txt\\\"\\\\s+value=\\\"\\\\d+/(\\\\d+)\\\"\\\\s+size=\",\"bookDetailUrl\":\"http://m.mcmssc.com/{bookId}/\",\"bookNamePatten\":\"<span\\\\s+class=\\\"title\\\">([^/]+)</span>\",\"authorNamePatten\":\"<a\\\\s+href=\\\"/author/\\\\d+/\\\">([^/]+)</a>\",\"picUrlPatten\":\"<img\\\\s+src=\\\"([^>]+)\\\"\\\\s+onerror=\",\"picUrlPrefix\":\"http://m.mcmssc.com/\",\"statusPatten\":\">状态：([^/]+)<\",\"bookStatusRule\":{\"连载\":0,\"全本\":1},\"visitCountPatten\":\">点击：(\\\\d+)<\",\"descStart\":\"<p class=\\\"review\\\">\",\"descEnd\":\"</p>\",\"bookIndexUrl\":\"http://m.mcmssc.com/{bookId}/all.html\",\"indexIdPatten\":\"<a\\\\s+href=\\\"/\\\\d+_\\\\d+/(\\\\d+)\\\\.html\\\">[^/]+</a>\",\"indexNamePatten\":\"<a\\\\s+href=\\\"/\\\\d+_\\\\d+/\\\\d+\\\\.html\\\">([^/]+)</a>\",\"bookContentUrl\":\"http://www.mcmssc.com/{bookId}/{indexId}.html\",\"contentStart\":\"</p>\",\"contentEnd\":\"<div align=\\\"center\\\">\"}',0,'2020-05-18 15:57:41','2020-05-18 15:57:41'),(16,'i笔趣阁','{\"bookListUrl\":\"http://m.ibiquge.net/xclass/{catId}/{page}.html\",\"catIdRule\":{\"catId1\":\"1\",\"catId2\":\"2\",\"catId3\":\"3\",\"catId4\":\"4\",\"catId5\":\"6\",\"catId6\":\"5\",\"catId7\":\"7\"},\"bookIdPatten\":\"href=\\\"/(\\\\d+_\\\\d+)/\\\"\",\"pagePatten\":\"value=\\\"(\\\\d+)/\\\\d+\\\"\",\"totalPagePatten\":\"value=\\\"\\\\d+/(\\\\d+)\\\"\",\"bookDetailUrl\":\"http://m.ibiquge.net/{bookId}/\",\"bookNamePatten\":\"<span class=\\\"title\\\">([^/]+)</span>\",\"authorNamePatten\":\"<a href=\\\"/author/\\\\d+/\\\">([^/]+)</a>\",\"picUrlPatten\":\"<img src=\\\"([^>]+)\\\"\\\\s+onerror=\\\"this.src=\",\"picUrlPrefix\":\"http://m.ibiquge.net\",\"statusPatten\":\">状态：([^/]+)</li>\",\"bookStatusRule\":{\"连载\":0,\"完结\":1},\"visitCountPatten\":\">点击：(\\\\d+)</li>\",\"descStart\":\"<p class=\\\"review\\\">\",\"descEnd\":\"</p>\",\"bookIndexUrl\":\"http://www.ibiquge.net/{bookId}/\",\"bookIndexStart\":\"正文</dt>\",\"indexIdPatten\":\"<a\\\\s+style=\\\"\\\"\\\\s+href=\\\"/\\\\d+_\\\\d+/(\\\\d+)\\\\.html\\\">[^/]+</a>\",\"indexNamePatten\":\"<a\\\\s+style=\\\"\\\"\\\\s+href=\\\"/\\\\d+_\\\\d+/\\\\d+\\\\.html\\\">([^/]+)</a>\",\"bookContentUrl\":\"http://www.ibiquge.net/{bookId}/{indexId}.html\",\"contentStart\":\"</p>\",\"contentEnd\":\"<div align=\\\"center\\\">\"}',0,'2021-02-04 21:31:23','2021-02-04 21:31:23');
/*!40000 ALTER TABLE `crawl_source` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `friend_link`
--

DROP TABLE IF EXISTS `friend_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `friend_link` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `link_name` varchar(50) NOT NULL COMMENT '链接名',
  `link_url` varchar(100) NOT NULL COMMENT '链接url',
  `sort` tinyint NOT NULL DEFAULT '11' COMMENT '排序号',
  `is_open` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否开启，0：不开启，1：开启',
  `create_user_id` bigint DEFAULT NULL COMMENT '创建人id',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_user_id` bigint DEFAULT NULL COMMENT '更新者用户id',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `friend_link`
--

LOCK TABLES `friend_link` WRITE;
/*!40000 ALTER TABLE `friend_link` DISABLE KEYS */;
INSERT INTO `friend_link` VALUES (5,'古典文学','https://www.shicimingju.com/book/',10,1,NULL,NULL,NULL,NULL),(6,'爱下电子书','https://www.aixdzs.com/',11,1,NULL,NULL,NULL,NULL),(7,'公版书','https://www.7sbook.com/',21,1,NULL,NULL,NULL,NULL),(8,'道教典籍','http://www.daorenjia.com/c1',22,1,NULL,NULL,NULL,NULL),(9,'free-eBooks','https://www.gutenberg.org/',23,1,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `friend_link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `home_book`
--

DROP TABLE IF EXISTS `home_book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `home_book` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `type` tinyint unsigned NOT NULL COMMENT '推荐类型;0-轮播图 1-顶部栏 2-本周强推 3-热门推荐 4-精品推荐',
  `sort` tinyint unsigned NOT NULL COMMENT '推荐排序',
  `book_id` bigint unsigned NOT NULL COMMENT '推荐小说ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `pk_id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=96 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='小说推荐';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `home_book`
--

LOCK TABLES `home_book` WRITE;
/*!40000 ALTER TABLE `home_book` DISABLE KEYS */;
INSERT INTO `home_book` VALUES (64,0,0,1334318182169681920,'2020-12-03 11:43:23','2020-12-03 11:43:23'),(65,0,1,1334318497132552192,'2020-12-03 11:43:23','2020-12-03 11:43:23'),(66,0,2,1334318818323963904,'2020-12-03 11:43:23','2020-12-03 11:43:23'),(67,0,3,1334328310788882432,'2020-12-03 11:43:23','2020-12-03 11:43:23'),(68,1,4,1334334734843609088,'2020-12-03 11:43:23','2020-12-03 11:43:23'),(69,1,5,1334335471568912384,'2020-12-03 11:43:23','2020-12-03 11:43:23'),(70,1,6,1337759637059973121,'2020-12-03 11:43:23','2020-12-03 11:43:23'),(71,1,7,1337759773395824640,'2020-12-03 11:43:23','2020-12-03 11:43:23'),(72,1,8,1337762752513486849,'2020-12-03 11:43:23','2020-12-03 11:43:23'),(73,1,9,1337872061003993088,'2020-12-03 11:43:23','2020-12-03 11:43:23'),(74,1,10,1337872316667793408,'2020-12-03 11:43:23','2020-12-03 11:43:23'),(75,1,11,1337872488235798528,'2020-12-03 11:43:23','2020-12-03 11:43:23'),(76,1,12,1337872597996539904,'2020-12-03 11:43:23','2020-12-03 11:43:23'),(77,1,13,1337872898115768320,'2020-12-03 11:43:23','2020-12-03 11:43:23'),(78,2,14,1337873148071120896,'2020-12-03 11:43:23','2020-12-03 11:43:23'),(79,2,15,1337874646456864768,'2020-12-03 11:43:23','2020-12-03 11:43:23'),(80,2,16,1337874812798767104,'2020-12-03 11:43:23','2020-12-03 11:43:23'),(81,2,17,1337874951365988352,'2020-12-03 11:43:23','2020-12-03 11:43:23'),(82,2,18,1337875255574663168,'2020-12-03 11:43:23','2020-12-03 11:43:23'),(84,3,20,1337876581629038592,'2020-12-03 11:43:23','2020-12-03 11:43:23'),(85,3,21,1337879143543476224,'2020-12-03 11:43:23','2020-12-03 11:43:23'),(86,3,22,1337879206630002688,'2020-12-03 11:43:23','2020-12-03 11:43:23'),(87,3,23,1337882606201475072,'2020-12-03 11:43:23','2020-12-03 11:43:23'),(88,3,24,1337884719262470144,'2020-12-03 11:43:23','2020-12-03 11:43:23'),(89,3,25,1337949399824781312,'2020-12-03 11:43:23','2020-12-03 11:43:23'),(90,4,26,1337957605418520576,'2020-12-03 11:43:23','2020-12-03 11:43:23'),(91,4,27,1337958745514233856,'2020-12-03 11:43:23','2020-12-03 11:43:23'),(92,4,28,1337960531323047936,'2020-12-03 11:43:23','2020-12-03 11:43:23'),(93,4,29,1337961040297644032,'2020-12-03 11:43:23','2020-12-03 11:43:23'),(94,4,30,1337968514828390400,'2020-12-03 11:43:23','2020-12-03 11:43:23'),(95,4,31,1337971702436515840,'2020-12-03 11:43:23','2020-12-03 11:43:23');
/*!40000 ALTER TABLE `home_book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `home_friend_link`
--

DROP TABLE IF EXISTS `home_friend_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `home_friend_link` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `link_name` varchar(50) NOT NULL COMMENT '链接名',
  `link_url` varchar(100) NOT NULL COMMENT '链接url',
  `sort` tinyint unsigned NOT NULL DEFAULT '11' COMMENT '排序号',
  `is_open` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '是否开启;0-不开启 1-开启',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `pk_id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='友情链接';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `home_friend_link`
--

LOCK TABLES `home_friend_link` WRITE;
/*!40000 ALTER TABLE `home_friend_link` DISABLE KEYS */;
INSERT INTO `home_friend_link` VALUES (1,'官网','https://201206030.github.io/',1,1,NULL,NULL),(2,'文档','https://youdoc.github.io/',2,1,NULL,NULL),(3,'Github','https://github.com/201206030',3,1,NULL,NULL),(4,'码云','https://gitee.com/xiongxyang',4,1,NULL,NULL);
/*!40000 ALTER TABLE `home_friend_link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `news`
--

DROP TABLE IF EXISTS `news`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `news` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `cat_id` int DEFAULT NULL COMMENT '类别ID',
  `cat_name` varchar(50) DEFAULT NULL COMMENT '分类名',
  `source_name` varchar(50) DEFAULT NULL COMMENT '来源',
  `title` varchar(100) DEFAULT NULL COMMENT '标题',
  `content` text COMMENT '内容',
  `create_time` datetime DEFAULT NULL COMMENT '发布时间',
  `create_user_id` bigint DEFAULT NULL COMMENT '发布人ID',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `update_user_id` bigint DEFAULT NULL COMMENT '更新人ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='新闻表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `news`
--

LOCK TABLES `news` WRITE;
/*!40000 ALTER TABLE `news` DISABLE KEYS */;
INSERT INTO `news` VALUES (9,3,'公告','小说网','小说网支持：本章说、下一章链接修改','<p>提供行评论的本章说功能，可以在小说的每一行发布评论。</p><p>提供下一章链接修改的功能，可以为喜欢的章节添加下一章链接，引申出同人创作、短视频、图片创作等等。</p><p><br></p><p><br><br></p>','2022-08-14 09:35:14',NULL,'2022-08-14 09:35:26',NULL),(10,1,'招募','小说网','招募作者，支持内容付费','<p><span style=\"font-weight: bold;\">网站提供更多`下一章链接`功能，</span>可以通过添加链接的方式，为小说添加更多的下一章选择，可以用来测试不同下一章的反响，甚至为其他网站的作品引流。\r\n为自己喜欢的作品添加下一章，能够达到更好的同人创作效果。\r\n看到喜欢的作品，直接为其添加下一章，在其基础上进行二次创作，减去长时间单机的痛苦。 <br></p><p><span style=\"font-weight: bold;\">提供付费章节功能，支持作品付费。</span></p><p><br></p><p></p>','2022-08-14 10:57:18',NULL,'2022-08-14 10:57:47',NULL);
/*!40000 ALTER TABLE `news` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `news_category`
--

DROP TABLE IF EXISTS `news_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `news_category` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(20) NOT NULL COMMENT '分类名',
  `sort` tinyint NOT NULL DEFAULT '10' COMMENT '排序',
  `create_user_id` bigint DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_user_id` bigint DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='新闻类别表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `news_category`
--

LOCK TABLES `news_category` WRITE;
/*!40000 ALTER TABLE `news_category` DISABLE KEYS */;
INSERT INTO `news_category` VALUES (1,'招募',10,NULL,NULL,NULL,NULL),(3,'公告',11,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `news_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `news_content`
--

DROP TABLE IF EXISTS `news_content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `news_content` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `news_id` bigint unsigned NOT NULL COMMENT '新闻ID',
  `content` mediumtext NOT NULL COMMENT '新闻内容',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_newsId` (`news_id`),
  UNIQUE KEY `pk_id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='新闻内容';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `news_content`
--

LOCK TABLES `news_content` WRITE;
/*!40000 ALTER TABLE `news_content` DISABLE KEYS */;
INSERT INTO `news_content` VALUES (1,2,'<p>林黛玉葬花之时曹雪芹乱入，并与宝玉、袭人发生一场持续千年的世纪大战;鸿门宴再现，项羽喊着“伟大与光辉”与樊哙打作一团、而后项庄趁乱刺死刘邦;孔融让梨引发一场长达十多年的报复和最终精心谋划的血案;《桃花源记》中善良淳朴的村民竟会为了保守桃花源的秘密而设计害死渔民……<br></p><p>这些熟悉而又陌生的内容，并不是网友们对经典文学作品的恶搞，而是来自于<a href=\\\"https://www.chinaz.com/tags/AI.shtml\\\" target=\\\"_blank\\\">AI</a>的故事续写。</p><p>今年以来，由AI续写故事作为文本的视频在B站悄然流行开来，一些UP主利用市面上的AI创作应用续写人们熟知的文学作品，再将新的作品以人声演绎，配上BGM后制成视频。</p><p>经过AI的一顿操作，名著成了爆款爽文，前有诸葛亮开战斗机，后有庄子研究“三体”，各种平行世界信手拈来，AI一本正经胡说八道的本事，比过去的地摊文学还强。</p><p style=\\\"text-align: center;\\\"><span style=\\\"color: inherit;\\\">&nbsp; &nbsp;&nbsp;</span><img src=\\\"https://i.postimg.cc/htGj2gWm/2021051009140484921.jpg\\\" style=\\\"color: inherit; max-width: 100%;\\\"></p><p>其实，对于相关工具的使用者而言，用AI进行创作并没有技术门槛:只需输入文学作品的某些片段，AI创作机器就会根据给定文字的内容与风格对故事进行续写，这些经过AI二次创作的故事，往往情节曲折离奇，与原作的走向大相径庭，这种内容因为反常规和新鲜感而受到一些网民的追捧。</p><p>不过话说回来，艺术创作这种高度创意化、个性化的工作，原本被视为“人类的最后一片净土”，是理论上最不可能被<a href=\\\"https://www.chinaz.com/tags/rengongzhineng.shtml\\\" target=\\\"_blank\\\">人工智能</a>取代的工作之一，可如今人工智能技术的发展却为艺术创作开辟了一条新的捷径。<strong>本期全媒派（ID: quanmeipai）带来一篇文章，探析AI创作正在对内容创作领域产生怎样的影响。</strong></p><p><strong>AI写作是怎么回事?</strong></p><p>AI创作也就是机器人写作，这是一种拟人化的说法，实质上是指通过一定的计算机程序，对输入的信息进行自动化的分析、处理和加工，从而生成一篇较为完整的文章。总的来说，今天流行的AI续写，其实已经算是比较成熟的能力。</p><p>随着人工智能技术的快速发展，自然语言生成（natural language generation， NLG）技术在世界范围内得到广泛的应用。《纽约时报》和美联社等新闻机构都曾采用NLG技术来撰写新闻报道;仅在2014年，技术公司Automated Insights就实现了以每秒超过2000篇的速度生成新闻报道，全年发布新闻共计10亿多篇。[1]</p><p>AI写作背后的原理非常复杂，其核心是自然语言处理（natural language processing， NLP）技术，同时涉及到数据挖掘、机器学习、知识图谱等多项人工智能技术。自然语言处理是指让机器拥有理解并解释人类语言的能力，目标是让机器在理解语言上像人类一样智能，最终弥补人类交流(自然语言)和计算机理解(机器语言)之间的差距。[2]</p><p>自然语言处理（NLP）涉及两个流程，分别是自然语言理解(natural language understanding，NLU)和自然语言生成(NLG)。市面上的写稿机器人大都是NLG系统，目前主要有模板式、抽取式和生成式这三种技术方向。[3]</p><p>模板式写稿机器人主要通过优化算法，在预先存储的大量写作模板中，选择与给定材料相匹配的模板，将信息加以组合生成文本，是目前应用最成熟、实现最容易的一种机器写作方法。</p><p>抽取式机器人会对文本进行语义分析，识别冗余信息，抽取重要内容，通过摘录或概括的方法压缩文本，形成对于既定文字的摘要，再加以计算确保文摘的连续性，这种技术广泛应用于新闻内容概括和文摘生成。</p><p>生成式NLG主要通过深度学习和增强学习技术实现，机器通过大量的文学作品样本进行训练，学习各类写作风格、建立写作模型，再根据输入的文字片段获知任务需求，预测并生成与需求相匹配的文稿，进行输出。</p><p>从现阶段来看，模板式和抽取式写稿机器人的技术已经趋于成熟，在市场上得到了广泛的应用;生成式NLG技术更加智能，也是当前NLG技术中更为高级的目标，OpenAI等研究机构在这方面做出了尝试，并在市场上得到了应用。</p><p><br></p>\n',NULL,NULL),(2,1,'<p>6月3日消息，阅文集团新管理层发布“单本可选新合同”，根据不同授权分为三类四种，取消单一格式合同，并对此前充满争议的旧合同进行了十余项修改。</p><p>阅文推出了基础协议、授权协议、深度协议等三大类作者合作合同。在基础协议、授权协议下，作者可对每部作品自主选择是否授权及授权方式，并享受不同的权益和资源。其中，第二类授权协议对作品的授权期作了甲版（按著作权完整期限）和乙版（按完本后20年）两级可选，分别匹配不同的权益。而在第一类基础协议中，即便作者完全不授权，也可享受平台提供的创作支持和发表作品等各类服务；深度协议则将对作家的更多发展诉求进行多样的权益安排。</p><p>针对作家广泛关心的著作权、免费/付费模式等问题，新合同以条款明确，作品是否加入免费模式由作者确认，强调著作人身权属作者，平台与作家属合作关系并提供多种福利权益等。</p><p>新合同核心修改</p><p>1、取消统一格式合同，提供作品合作基础协议、授权协议（甲乙版）、深度协议等三类四种合同供作家选择</p><p>2、基础协议中，作家无须授予著作财产权，也可享受平台提供的创作支持和发表作品等各类服务，但平台和作家均无分成</p><p>3、授权协议，作家可针对单本作品授权平台，授权期分为甲版（按著作权完整期限）和乙版（按完本后20年）两种可选，匹配不同的各类权益</p><p>4、深度协议对资深作家的更多发展诉求进行多样的权益安排</p><p>5、明确作品的著作人身权归属于作者</p><p>6、是否要加入免费模式，由作者自主选择和确认</p><p>7、明确双方是合作关系，约定平台要为作家提供多种福利、权益</p><p>8、缩小了独家授权范围和作品优先权范围，仅包括剧本及小说</p><p>9、明确作家拥有IP改编版权收益，无论平台自用还是授权他用</p><p>10、明确净收益如为零或亏损，由平台兜底</p><p>11、平台不管理或代运营作家个人社交账号</p><p>12、删除平台自行安排完本或续写作品，及作品大纲违约的相关条款</p><p>今年5月6日，阅文新上任的管理团队宣布通过恳谈会和多种方式针对旧合同问题展开全面调研，并在一个月内发布新合同。</p><p>据悉，新合同已在阅文官方渠道上线。阅文表示，针对此前部分作家已签署的相关协议条款，将按照优化后的新合同精神执行。</p>\n',NULL,NULL);
/*!40000 ALTER TABLE `news_content` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `news_info`
--

DROP TABLE IF EXISTS `news_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `news_info` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `category_id` bigint unsigned NOT NULL COMMENT '类别ID',
  `category_name` varchar(50) NOT NULL COMMENT '类别名',
  `source_name` varchar(50) NOT NULL COMMENT '新闻来源',
  `title` varchar(100) NOT NULL COMMENT '新闻标题',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `pk_id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='新闻信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `news_info`
--

LOCK TABLES `news_info` WRITE;
/*!40000 ALTER TABLE `news_info` DISABLE KEYS */;
INSERT INTO `news_info` VALUES (1,5,'行业','未知','阅文推“单本可选新合同”：授权分级、免费或付费自选','2022-05-14 11:06:28','2022-05-14 11:06:33'),(2,4,'资讯','全媒派公众号','AI小说悄然流行：人类特有的创作力，已经被AI复制？','2022-05-14 11:06:37','2022-05-14 11:06:42');
/*!40000 ALTER TABLE `news_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_pay`
--

DROP TABLE IF EXISTS `order_pay`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_pay` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `out_trade_no` bigint NOT NULL COMMENT '商户订单号',
  `trade_no` varchar(64) DEFAULT NULL COMMENT '支付宝/微信交易号',
  `pay_channel` tinyint(1) NOT NULL DEFAULT '1' COMMENT '支付渠道，1：支付宝，2：微信',
  `total_amount` int NOT NULL COMMENT '交易金额(单位元)',
  `user_id` bigint NOT NULL COMMENT '支付用户ID',
  `pay_status` tinyint(1) DEFAULT '2' COMMENT '支付状态：0：支付失败，1：支付成功，2：待支付',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='充值订单';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_pay`
--

LOCK TABLES `order_pay` WRITE;
/*!40000 ALTER TABLE `order_pay` DISABLE KEYS */;
INSERT INTO `order_pay` VALUES (1,202207232257305540,NULL,1,10,1548290516624515072,2,'2022-07-23 22:57:31','2022-07-23 22:57:31'),(2,202207262146432681,NULL,1,10,1548290516624515072,2,'2022-07-26 21:46:43','2022-07-26 21:46:43'),(3,202207272138042295,NULL,1,10,1548290516624515072,2,'2022-07-27 21:38:04','2022-07-27 21:38:04'),(4,202207272222226913,NULL,1,10,1548290516624515072,2,'2022-07-27 22:22:23','2022-07-27 22:22:23'),(5,202207272224235744,NULL,1,10,1548290516624515072,2,'2022-07-27 22:24:24','2022-07-27 22:24:24'),(6,202207272228413648,NULL,1,10,1548290516624515072,2,'2022-07-27 22:28:41','2022-07-27 22:28:41'),(7,202207272236138359,NULL,1,10,1548290516624515072,2,'2022-07-27 22:36:14','2022-07-27 22:36:14'),(8,202207272237017089,NULL,1,10,1548290516624515072,2,'2022-07-27 22:37:02','2022-07-27 22:37:02'),(9,202207272238294723,NULL,1,10,1548290516624515072,2,'2022-07-27 22:38:29','2022-07-27 22:38:29'),(10,202207272243560178,NULL,1,10,1548290516624515072,2,'2022-07-27 22:43:56','2022-07-27 22:43:56'),(11,202207272245005741,NULL,1,10,1548290516624515072,2,'2022-07-27 22:45:01','2022-07-27 22:45:01'),(12,202207272245599475,NULL,1,10,1548290516624515072,2,'2022-07-27 22:46:00','2022-07-27 22:46:00'),(13,202207272248013390,NULL,1,10,1548290516624515072,2,'2022-07-27 22:48:01','2022-07-27 22:48:01'),(14,202207272248422179,NULL,1,10,1548290516624515072,2,'2022-07-27 22:48:42','2022-07-27 22:48:42'),(15,202207280018576830,NULL,1,10,1548290516624515072,2,'2022-07-28 00:18:58','2022-07-28 00:18:58'),(16,202207280020493855,NULL,1,10,1548290516624515072,2,'2022-07-28 00:20:49','2022-07-28 00:20:49'),(17,202207280021244963,NULL,1,10,1548290516624515072,2,'2022-07-28 00:21:24','2022-07-28 00:21:24'),(18,202207280022266133,NULL,1,10,1548290516624515072,2,'2022-07-28 00:22:27','2022-07-28 00:22:27'),(19,202207280706591554,NULL,1,10,1548290516624515072,2,'2022-07-28 07:06:59','2022-07-28 07:06:59'),(20,202207280710462887,NULL,1,10,1548290516624515072,2,'2022-07-28 07:10:46','2022-07-28 07:10:46'),(21,202207281332034173,NULL,1,10,1548290516624515072,2,'2022-07-28 13:32:03','2022-07-28 13:32:03'),(22,202207281620129690,NULL,1,10,1548290516624515072,2,'2022-07-28 16:20:13','2022-07-28 16:20:13'),(23,202207281623167817,NULL,1,10,1548290516624515072,2,'2022-07-28 16:23:17','2022-07-28 16:23:17'),(24,202207281626086762,NULL,1,10,1548290516624515072,1,'2022-07-28 16:26:09','2022-07-28 16:26:54'),(25,202207282013398410,NULL,1,10,1548290516624515072,2,'2022-07-28 20:13:40','2022-07-28 20:13:40'),(26,202207282014306463,NULL,1,10,1548290516624515072,2,'2022-07-28 20:14:31','2022-07-28 20:14:31'),(27,202207282018474748,NULL,1,10,1548290516624515072,2,'2022-07-28 20:18:47','2022-07-28 20:18:47'),(28,202207282022009786,NULL,1,10,1548290516624515072,2,'2022-07-28 20:22:01','2022-07-28 20:22:01'),(29,202207282023227813,NULL,1,10,1548290516624515072,2,'2022-07-28 20:23:23','2022-07-28 20:23:23'),(30,202207282026287832,NULL,1,10,1548290516624515072,2,'2022-07-28 20:26:29','2022-07-28 20:26:29'),(31,202207282043005349,NULL,1,10,1548290516624515072,2,'2022-07-28 20:43:01','2022-07-28 20:43:01'),(32,202207282044541456,NULL,1,10,1548290516624515072,2,'2022-07-28 20:44:54','2022-07-28 20:44:54'),(33,202207282048192386,NULL,1,10,1548290516624515072,2,'2022-07-28 20:48:19','2022-07-28 20:48:19'),(34,202207282048461454,NULL,1,10,1548290516624515072,2,'2022-07-28 20:48:46','2022-07-28 20:48:46'),(35,202207282059005057,NULL,1,10,1548290516624515072,2,'2022-07-28 20:59:01','2022-07-28 20:59:01'),(36,202207282112266897,NULL,1,10,1548290516624515072,2,'2022-07-28 21:12:27','2022-07-28 21:12:27'),(37,202207282113539469,NULL,1,10,1548290516624515072,2,'2022-07-28 21:13:54','2022-07-28 21:13:54'),(38,202207282114272405,NULL,1,10,1548290516624515072,2,'2022-07-28 21:14:27','2022-07-28 21:14:27'),(39,202207282123460243,NULL,1,10,1548290516624515072,2,'2022-07-28 21:23:46','2022-07-28 21:23:46'),(40,202207282131108040,NULL,1,10,1548290516624515072,1,'2022-07-28 21:31:11','2022-07-28 21:31:29'),(41,202207301604428567,NULL,1,10,1548290516624515072,2,'2022-07-30 16:04:43','2022-07-30 16:04:43'),(42,202207301606029474,NULL,1,10,1548290516624515072,2,'2022-07-30 16:06:03','2022-07-30 16:06:03'),(43,202208122147512497,NULL,1,10,1548290516624515072,2,'2022-08-12 21:47:51','2022-08-12 21:47:51'),(44,202208232344470919,NULL,1,10,1551834843753619456,2,'2022-08-23 23:44:47','2022-08-23 23:44:47');
/*!40000 ALTER TABLE `order_pay` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pay_alipay`
--

DROP TABLE IF EXISTS `pay_alipay`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pay_alipay` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `out_trade_no` varchar(64) NOT NULL COMMENT '商户订单号',
  `trade_no` varchar(64) NOT NULL COMMENT '支付宝交易号',
  `buyer_id` varchar(16) DEFAULT NULL COMMENT '买家支付宝账号 ID',
  `trade_status` varchar(32) DEFAULT NULL COMMENT '交易状态;TRADE_SUCCESS-交易成功',
  `total_amount` int unsigned NOT NULL COMMENT '订单金额;单位：分',
  `receipt_amount` int unsigned DEFAULT NULL COMMENT '实收金额;单位：分',
  `invoice_amount` int unsigned DEFAULT NULL COMMENT '开票金额',
  `gmt_create` datetime DEFAULT NULL COMMENT '交易创建时间',
  `gmt_payment` datetime DEFAULT NULL COMMENT '交易付款时间',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `pk_id` (`id`),
  KEY `uk_outTradeNo` (`out_trade_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='支付宝支付';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pay_alipay`
--

LOCK TABLES `pay_alipay` WRITE;
/*!40000 ALTER TABLE `pay_alipay` DISABLE KEYS */;
/*!40000 ALTER TABLE `pay_alipay` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pay_wechat`
--

DROP TABLE IF EXISTS `pay_wechat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pay_wechat` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `out_trade_no` varchar(32) NOT NULL COMMENT '商户订单号',
  `transaction_id` varchar(32) NOT NULL COMMENT '微信支付订单号',
  `trade_type` varchar(16) DEFAULT NULL COMMENT '交易类型;JSAPI-公众号支付 NATIVE-扫码支付 APP-APP支付 MICROPAY-付款码支付 MWEB-H5支付 FACEPAY-刷脸支付',
  `trade_state` varchar(32) DEFAULT NULL COMMENT '交易状态;SUCCESS-支付成功 REFUND-转入退款 NOTPAY-未支付 CLOSED-已关闭 REVOKED-已撤销（付款码支付） USERPAYING-用户支付中（付款码支付） PAYERROR-支付失败(其他原因，如银行返回失败)',
  `trade_state_desc` varchar(255) DEFAULT NULL COMMENT '交易状态描述',
  `amount` int unsigned NOT NULL COMMENT '订单总金额;单位：分',
  `payer_total` int unsigned DEFAULT NULL COMMENT '用户支付金额;单位：分',
  `success_time` datetime DEFAULT NULL COMMENT '支付完成时间',
  `payer_openid` varchar(128) DEFAULT NULL COMMENT '支付者用户标识;用户在直连商户appid下的唯一标识',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `pk_id` (`id`),
  KEY `uk_outTradeNo` (`out_trade_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='微信支付';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pay_wechat`
--

LOCK TABLES `pay_wechat` WRITE;
/*!40000 ALTER TABLE `pay_wechat` DISABLE KEYS */;
/*!40000 ALTER TABLE `pay_wechat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `runoob_tbl`
--

DROP TABLE IF EXISTS `runoob_tbl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `runoob_tbl` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `novel_id` bigint NOT NULL COMMENT '本章pageID',
  `book_id` bigint NOT NULL COMMENT '本章小说ID',
  `link_url` varchar(100) NOT NULL COMMENT '下一章链接url',
  `nextpage_name` varchar(100) DEFAULT NULL COMMENT '下一章的章节名',
  `nextpage_desc` varchar(1000) NOT NULL COMMENT '下一章的简单描述',
  `thumbsup_count` int DEFAULT '0' COMMENT '下一章的点赞数量',
  `reply_count` int DEFAULT '0' COMMENT '下一章的评论数量',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='下一章的集合表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `runoob_tbl`
--

LOCK TABLES `runoob_tbl` WRITE;
/*!40000 ALTER TABLE `runoob_tbl` DISABLE KEYS */;
/*!40000 ALTER TABLE `runoob_tbl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `samehobbycfl`
--

DROP TABLE IF EXISTS `samehobbycfl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `samehobbycfl` (
  `flc_id` int NOT NULL AUTO_INCREMENT,
  `sayingId` int NOT NULL,
  `commenter` varchar(50) NOT NULL,
  `commenterAvatar` varchar(100) NOT NULL COMMENT '评论者的头像位置',
  `commentContent` varchar(500) NOT NULL,
  `commentTime` datetime NOT NULL,
  `bookid` bigint DEFAULT NULL COMMENT '小说的id',
  `lineid` bigint DEFAULT NULL COMMENT '页面的第几行?',
  `thumpsup` int DEFAULT NULL COMMENT '这是评论的点赞数量',
  PRIMARY KEY (`flc_id`)
) ENGINE=InnoDB AUTO_INCREMENT=153 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `samehobbycfl`
--

LOCK TABLES `samehobbycfl` WRITE;
/*!40000 ALTER TABLE `samehobbycfl` DISABLE KEYS */;
INSERT INTO `samehobbycfl` VALUES (121,1,'17754889839','null','的点点滴滴多多','2022-08-20 10:02:01',15,1,1),(122,1,'17754889839','null','第二条评论的内容','2022-08-20 12:11:56',15,2,0),(123,1,'17754889839','null','<p><br></p><p><br></p>','2022-08-21 22:39:08',15,1,1),(124,1,'17754889839','null','<p><strong>MaxLength: 30</strong></p><p><br></p>','2022-08-21 22:41:32',15,1,0),(125,1,'17754889839','null','<p><span style=\"background-color: rgb(89, 191, 192);\">MaxLength: 30</span></p><p><span style=\"color: rgb(255, 213, 145);\">对对对 &nbsp; </span><a href=\"https://www.runoob.com/try/try.php?filename=try_ng_ng-bind-html\" target=\"_blank\">的 </a></p>','2022-08-22 09:34:36',15,1,0),(126,1,'17754889839','null','<p><img src=\"https://i.postimg.cc/4NH9zd2K/5ab876cf8ae5d8f329d2344f640345e2.jpg\" alt=\"测试图片\" data-href=\"https://i.postimg.cc/4NH9zd2K/5ab876cf8ae5d8f329d2344f640345e2.jpg\" style=\"\"/></p>','2022-08-22 09:38:14',15,1,0),(127,1,'17754889839','null','<p><strong>MaxLength: 100</strong></p><p><br></p>','2022-08-22 14:59:16',15,1,0),(128,1,'17754889839','null','<p><strong>MaxLength: 10015 &nbsp; </strong>方法</p><p><br></p>','2022-08-22 15:01:40',15,1,0),(129,1,'17754889839','null','<p>MaxLength: 100</p><p><br></p>','2022-08-22 15:51:39',15,2,0),(130,1,'17754889839','null','<p>MaxLength: 100</p><p><br></p>','2022-08-22 15:58:00',15,2,0),(131,1,'17754889839','null','<p>MaxLength: 100</p><p><br></p>','2022-08-22 16:02:59',15,1,0),(132,1,'17754889839','null','<p>MaxLength: 100</p><p><br></p>','2022-08-22 16:15:25',15,1,0),(133,1,'17754889839','null','<p>MaxLength: 100</p><p><br></p>','2022-08-22 16:26:39',15,1,0),(134,1,'17754889839','null','<p><strong>MaxLength: 100</strong></p><p><br></p>','2022-08-22 16:28:10',15,1,0),(135,1,'17754889839','null','<p>MaxLength: 100</p><p><br></p>','2022-08-22 20:30:13',15,1,0),(136,1,'17754889839','null','<p>MaxLength: 100</p><p><br></p>','2022-08-22 20:30:25',15,1,0),(139,1,'17754889839','/localPic/2022/09/17/65477a38736e4f6cb10534bbcdbc1f7f.jpeg','<p><u><em>MaxLength: 100</em></u></p><p><br></p>','2022-09-21 16:45:40',42,2,1),(140,1,'17754889839','/localPic/2022/09/17/65477a38736e4f6cb10534bbcdbc1f7f.jpeg','<p><span style=\"color: rgb(235, 144, 58);\">MaxLength: 100</span></p><p><br></p>','2022-09-21 16:57:13',42,1,2),(141,1,'17754889839','/localPic/2022/09/17/65477a38736e4f6cb10534bbcdbc1f7f.jpeg','<p><span style=\"color: rgb(255, 169, 64);\">MaxLength222</span></p><p><br></p>','2022-09-21 16:58:14',42,1,1),(145,1,'游客','/images/man.png','<p>MaxLength: 100</p><p><br></p>','2022-10-05 10:42:00',42,1,0),(146,1,'游客','/images/man.png','<p>最后一条评论</p><p><br></p>','2022-10-05 10:48:41',42,1,0),(147,1,'游客','/images/man.png','<p>更后面的评论</p><p><br></p>','2022-10-06 04:37:03',42,1,0),(148,1,'游客','/images/man.png','<p>佚名的评论测试</p><p><br></p>','2022-10-06 04:43:01',42,1,0),(149,1,'13000000005','null','<p>MaxLength: 100</p><p><br></p>','2022-10-06 05:02:52',42,1,0),(150,1,'游客','/images/TouristAvatar.png','<p>MaxLength: 100</p><p><br></p>','2022-10-06 05:05:35',42,1,0),(151,1,'游客','/images/TouristAvatar.png','<p>测试一条评论</p><p><br></p>','2022-10-06 07:26:43',23,231,0),(152,1,'游客','/images/TouristAvatar.png','<p>测试2条评论</p><p><br></p>','2022-10-06 07:29:51',23,231,0);
/*!40000 ALTER TABLE `samehobbycfl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `samehobbycsl`
--

DROP TABLE IF EXISTS `samehobbycsl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `samehobbycsl` (
  `slc_id` int NOT NULL AUTO_INCREMENT,
  `sayingId` int NOT NULL,
  `flcId` int NOT NULL,
  `replier` varchar(50) NOT NULL,
  `toCommenter` varchar(50) NOT NULL,
  `replyContent` varchar(50) NOT NULL,
  `replyTime` datetime NOT NULL,
  `thumpsup2` int DEFAULT NULL,
  PRIMARY KEY (`slc_id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `samehobbycsl`
--

LOCK TABLES `samehobbycsl` WRITE;
/*!40000 ALTER TABLE `samehobbycsl` DISABLE KEYS */;
INSERT INTO `samehobbycsl` VALUES (21,1,121,'17754889839','17754889839',' 呜呜呜呜','2022-08-20 12:09:20',1),(22,1,122,'17754889839','17754889839',' 顶顶顶顶','2022-08-20 12:12:09',0),(23,1,123,'游客','17754889839',' 再看看效果','2022-08-23 18:44:49',0);
/*!40000 ALTER TABLE `samehobbycsl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shuyouquan_html`
--

DROP TABLE IF EXISTS `shuyouquan_html`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shuyouquan_html` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `content` mediumtext COMMENT '超长的内容,是书友圈内容的富文本',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='书友圈';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shuyouquan_html`
--

LOCK TABLES `shuyouquan_html` WRITE;
/*!40000 ALTER TABLE `shuyouquan_html` DISABLE KEYS */;
INSERT INTO `shuyouquan_html` VALUES (8,'<pre><code >var ShuyouquanContent=editor.getHtml();</code></pre><p>的点点滴滴</p>'),(13,'内容'),(14,'内容12'),(15,'<p>反反</p><h1>此处插入评论框...</h1><p>复</p><p>||此处插入评论框...1||</p><p>||此处插入评论框...2||</p><p>复vvv4444,<u>灌灌灌ddee</u></p>'),(16,''),(17,''),(18,''),(19,''),(20,''),(21,''),(22,''),(23,'插入书友圈内容 '),(24,''),(25,''),(26,''),(27,''),(28,''),(29,''),(30,''),(31,''),(32,''),(33,''),(34,''),(35,''),(36,''),(37,''),(38,''),(39,''),(40,''),(41,''),(42,'<p>1</p><p>||此处插入评论框...1||</p><p>2</p><p>||此处插入评论框...2||</p>'),(43,''),(44,'<p>对对对 </p>');
/*!40000 ALTER TABLE `shuyouquan_html` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_data_perm`
--

DROP TABLE IF EXISTS `sys_data_perm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_data_perm` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL COMMENT '权限名称',
  `table_name` varchar(50) DEFAULT NULL COMMENT '数据表名称',
  `module_name` varchar(50) DEFAULT NULL COMMENT '所属模块',
  `crl_attr_name` varchar(50) DEFAULT NULL COMMENT '用户权限控制属性名',
  `crl_column_name` varchar(50) DEFAULT NULL COMMENT '数据表权限控制列名',
  `perm_code` varchar(50) DEFAULT NULL COMMENT '权限code，all_开头表示查看所有数据的权限，sup_开头表示查看下级数据的权限，own_开头表示查看本级数据的权限',
  `order_num` int DEFAULT NULL COMMENT '排序',
  `gmt_create` datetime DEFAULT NULL COMMENT '创建时间',
  `gmt_modified` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=216 DEFAULT CHARSET=utf8mb3 COMMENT='数据权限管理';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_data_perm`
--

LOCK TABLES `sys_data_perm` WRITE;
/*!40000 ALTER TABLE `sys_data_perm` DISABLE KEYS */;
INSERT INTO `sys_data_perm` VALUES (210,'查看用户表全部数据','sys_user','用户管理','deptId','dept_id','all_dept_sys_user',1,NULL,NULL),(211,'查看用户表下级部门数据','sys_user','用户管理','deptId','dept_id','sup_dept_sys_user',2,NULL,NULL),(212,'查看用户表本部门数据','sys_user','用户管理','deptId','dept_id','own_dept_sys_user',3,NULL,NULL),(213,'查看用户表个人数据','sys_user','用户管理','userId','user_id','own_user_sys_user',4,NULL,NULL),(214,'查看下级部门订单数据','fb_order','订单管理','deptId','dept_id','sup_dept_fb_order',2,NULL,NULL),(215,'查看本部门订单数据','fb_order','订单管理','deptId','dept_id','own_dept_fb_order',3,NULL,NULL);
/*!40000 ALTER TABLE `sys_data_perm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_dept`
--

DROP TABLE IF EXISTS `sys_dept`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_dept` (
  `dept_id` bigint NOT NULL AUTO_INCREMENT,
  `parent_id` bigint DEFAULT NULL COMMENT '上级部门ID，一级部门为0',
  `name` varchar(50) DEFAULT NULL COMMENT '部门名称',
  `order_num` int DEFAULT NULL COMMENT '排序',
  `del_flag` tinyint DEFAULT '0' COMMENT '是否删除  -1：已删除  0：正常',
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb3 COMMENT='部门管理';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_dept`
--

LOCK TABLES `sys_dept` WRITE;
/*!40000 ALTER TABLE `sys_dept` DISABLE KEYS */;
INSERT INTO `sys_dept` VALUES (13,0,'测试部',5,1),(14,13,'测试一部',1,1),(15,13,'测试二部',2,1),(16,13,'测试三部',13,1);
/*!40000 ALTER TABLE `sys_dept` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_dict`
--

DROP TABLE IF EXISTS `sys_dict`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_dict` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8_bin DEFAULT NULL COMMENT '标签名',
  `value` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8_bin DEFAULT NULL COMMENT '数据值',
  `type` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8_bin DEFAULT NULL COMMENT '类型',
  `description` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8_bin DEFAULT NULL COMMENT '描述',
  `sort` decimal(10,0) DEFAULT NULL COMMENT '排序（升序）',
  `parent_id` bigint DEFAULT '0' COMMENT '父级编号',
  `create_by` int DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint DEFAULT NULL COMMENT '更新者',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_bin DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) CHARACTER SET utf8mb3 COLLATE utf8_bin DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `sys_dict_value` (`value`),
  KEY `sys_dict_label` (`name`),
  KEY `sys_dict_del_flag` (`del_flag`)
) ENGINE=InnoDB AUTO_INCREMENT=142 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin COMMENT='字典表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_dict`
--

LOCK TABLES `sys_dict` WRITE;
/*!40000 ALTER TABLE `sys_dict` DISABLE KEYS */;
INSERT INTO `sys_dict` VALUES (1,'正常','0','del_flag','删除标记',10,0,1,NULL,1,NULL,NULL,'0'),(3,'显示','1','show_hide','显示/隐藏',10,0,1,NULL,1,NULL,NULL,'0'),(4,'隐藏','0','show_hide','显示/隐藏',20,0,1,NULL,1,NULL,NULL,'0'),(5,'是','1','yes_no','是/否',10,0,1,NULL,1,NULL,NULL,'0'),(6,'否','0','yes_no','是/否',20,0,1,NULL,1,NULL,NULL,'0'),(7,'红色','red','color','颜色值',10,0,1,NULL,1,NULL,NULL,'0'),(8,'绿色','green','color','颜色值',20,0,1,NULL,1,NULL,NULL,'0'),(9,'蓝色','blue','color','颜色值',30,0,1,NULL,1,NULL,NULL,'0'),(10,'黄色','yellow','color','颜色值',40,0,1,NULL,1,NULL,NULL,'0'),(11,'橙色','orange','color','颜色值',50,0,1,NULL,1,NULL,NULL,'0'),(12,'默认主题','default','theme','主题方案',10,0,1,NULL,1,NULL,NULL,'0'),(13,'天蓝主题','cerulean','theme','主题方案',20,0,1,NULL,1,NULL,NULL,'0'),(14,'橙色主题','readable','theme','主题方案',30,0,1,NULL,1,NULL,NULL,'0'),(15,'红色主题','united','theme','主题方案',40,0,1,NULL,1,NULL,NULL,'0'),(16,'Flat主题','flat','theme','主题方案',60,0,1,NULL,1,NULL,NULL,'0'),(17,'国家','1','sys_area_type','区域类型',10,0,1,NULL,1,NULL,NULL,'0'),(18,'省份、直辖市','2','sys_area_type','区域类型',20,0,1,NULL,1,NULL,NULL,'0'),(19,'地市','3','sys_area_type','区域类型',30,0,1,NULL,1,NULL,NULL,'0'),(20,'区县','4','sys_area_type','区域类型',40,0,1,NULL,1,NULL,NULL,'0'),(21,'公司','1','sys_office_type','机构类型',60,0,1,NULL,1,NULL,NULL,'0'),(22,'部门','2','sys_office_type','机构类型',70,0,1,NULL,1,NULL,NULL,'0'),(23,'小组','3','sys_office_type','机构类型',80,0,1,NULL,1,NULL,NULL,'0'),(24,'其它','4','sys_office_type','机构类型',90,0,1,NULL,1,NULL,NULL,'0'),(25,'综合部','1','sys_office_common','快捷通用部门',30,0,1,NULL,1,NULL,NULL,'0'),(26,'开发部','2','sys_office_common','快捷通用部门',40,0,1,NULL,1,NULL,NULL,'0'),(27,'人力部','3','sys_office_common','快捷通用部门',50,0,1,NULL,1,NULL,NULL,'0'),(28,'一级','1','sys_office_grade','机构等级',10,0,1,NULL,1,NULL,NULL,'0'),(29,'二级','2','sys_office_grade','机构等级',20,0,1,NULL,1,NULL,NULL,'0'),(30,'三级','3','sys_office_grade','机构等级',30,0,1,NULL,1,NULL,NULL,'0'),(31,'四级','4','sys_office_grade','机构等级',40,0,1,NULL,1,NULL,NULL,'0'),(32,'所有数据','1','sys_data_scope','数据范围',10,0,1,NULL,1,NULL,NULL,'0'),(33,'所在公司及以下数据','2','sys_data_scope','数据范围',20,0,1,NULL,1,NULL,NULL,'0'),(34,'所在公司数据','3','sys_data_scope','数据范围',30,0,1,NULL,1,NULL,NULL,'0'),(35,'所在部门及以下数据','4','sys_data_scope','数据范围',40,0,1,NULL,1,NULL,NULL,'0'),(36,'所在部门数据','5','sys_data_scope','数据范围',50,0,1,NULL,1,NULL,NULL,'0'),(37,'仅本人数据','8','sys_data_scope','数据范围',90,0,1,NULL,1,NULL,NULL,'0'),(38,'按明细设置','9','sys_data_scope','数据范围',100,0,1,NULL,1,NULL,NULL,'0'),(39,'系统管理','1','sys_user_type','用户类型',10,0,1,NULL,1,NULL,NULL,'0'),(40,'部门经理','2','sys_user_type','用户类型',20,0,1,NULL,1,NULL,NULL,'0'),(41,'普通用户','3','sys_user_type','用户类型',30,0,1,NULL,1,NULL,NULL,'0'),(42,'基础主题','basic','cms_theme','站点主题',10,0,1,NULL,1,NULL,NULL,'0'),(43,'蓝色主题','blue','cms_theme','站点主题',20,0,1,NULL,1,NULL,NULL,'1'),(44,'红色主题','red','cms_theme','站点主题',30,0,1,NULL,1,NULL,NULL,'1'),(45,'文章模型','article','cms_module','栏目模型',10,0,1,NULL,1,NULL,NULL,'0'),(46,'图片模型','picture','cms_module','栏目模型',20,0,1,NULL,1,NULL,NULL,'1'),(47,'下载模型','download','cms_module','栏目模型',30,0,1,NULL,1,NULL,NULL,'1'),(48,'链接模型','link','cms_module','栏目模型',40,0,1,NULL,1,NULL,NULL,'0'),(49,'专题模型','special','cms_module','栏目模型',50,0,1,NULL,1,NULL,NULL,'1'),(50,'默认展现方式','0','cms_show_modes','展现方式',10,0,1,NULL,1,NULL,NULL,'0'),(51,'首栏目内容列表','1','cms_show_modes','展现方式',20,0,1,NULL,1,NULL,NULL,'0'),(52,'栏目第一条内容','2','cms_show_modes','展现方式',30,0,1,NULL,1,NULL,NULL,'0'),(53,'发布','0','cms_del_flag','内容状态',10,0,1,NULL,1,NULL,NULL,'0'),(54,'删除','1','cms_del_flag','内容状态',20,0,1,NULL,1,NULL,NULL,'0'),(55,'审核','2','cms_del_flag','内容状态',15,0,1,NULL,1,NULL,NULL,'0'),(56,'首页焦点图','1','cms_posid','推荐位',10,0,1,NULL,1,NULL,NULL,'0'),(57,'栏目页文章推荐','2','cms_posid','推荐位',20,0,1,NULL,1,NULL,NULL,'0'),(58,'咨询','1','cms_guestbook','留言板分类',10,0,1,NULL,1,NULL,NULL,'0'),(59,'建议','2','cms_guestbook','留言板分类',20,0,1,NULL,1,NULL,NULL,'0'),(60,'投诉','3','cms_guestbook','留言板分类',30,0,1,NULL,1,NULL,NULL,'0'),(61,'其它','4','cms_guestbook','留言板分类',40,0,1,NULL,1,NULL,NULL,'0'),(62,'公休','1','oa_leave_type','请假类型',10,0,1,NULL,1,NULL,NULL,'0'),(63,'病假','2','oa_leave_type','请假类型',20,0,1,NULL,1,NULL,NULL,'0'),(64,'事假','3','oa_leave_type','请假类型',30,0,1,NULL,1,NULL,NULL,'0'),(65,'调休','4','oa_leave_type','请假类型',40,0,1,NULL,1,NULL,NULL,'0'),(66,'婚假','5','oa_leave_type','请假类型',60,0,1,NULL,1,NULL,NULL,'0'),(67,'接入日志','1','sys_log_type','日志类型',30,0,1,NULL,1,NULL,NULL,'0'),(68,'异常日志','2','sys_log_type','日志类型',40,0,1,NULL,1,NULL,NULL,'0'),(69,'请假流程','leave','act_type','流程类型',10,0,1,NULL,1,NULL,NULL,'0'),(70,'审批测试流程','test_audit','act_type','流程类型',20,0,1,NULL,1,NULL,NULL,'0'),(71,'分类1','1','act_category','流程分类',10,0,1,NULL,1,NULL,NULL,'0'),(72,'分类2','2','act_category','流程分类',20,0,1,NULL,1,NULL,NULL,'0'),(73,'增删改查','crud','gen_category','代码生成分类',10,0,1,NULL,1,NULL,NULL,'1'),(74,'增删改查（包含从表）','crud_many','gen_category','代码生成分类',20,0,1,NULL,1,NULL,NULL,'1'),(75,'树结构','tree','gen_category','代码生成分类',30,0,1,NULL,1,NULL,NULL,'1'),(76,'=','=','gen_query_type','查询方式',10,0,1,NULL,1,NULL,NULL,'1'),(77,'!=','!=','gen_query_type','查询方式',20,0,1,NULL,1,NULL,NULL,'1'),(78,'&gt;','&gt;','gen_query_type','查询方式',30,0,1,NULL,1,NULL,NULL,'1'),(79,'&lt;','&lt;','gen_query_type','查询方式',40,0,1,NULL,1,NULL,NULL,'1'),(80,'Between','between','gen_query_type','查询方式',50,0,1,NULL,1,NULL,NULL,'1'),(81,'Like','like','gen_query_type','查询方式',60,0,1,NULL,1,NULL,NULL,'1'),(82,'Left Like','left_like','gen_query_type','查询方式',70,0,1,NULL,1,NULL,NULL,'1'),(83,'Right Like','right_like','gen_query_type','查询方式',80,0,1,NULL,1,NULL,NULL,'1'),(84,'文本框','input','gen_show_type','字段生成方案',10,0,1,NULL,1,NULL,NULL,'1'),(85,'文本域','textarea','gen_show_type','字段生成方案',20,0,1,NULL,1,NULL,NULL,'1'),(86,'下拉框','select','gen_show_type','字段生成方案',30,0,1,NULL,1,NULL,NULL,'1'),(87,'复选框','checkbox','gen_show_type','字段生成方案',40,0,1,NULL,1,NULL,NULL,'1'),(88,'单选框','radiobox','gen_show_type','字段生成方案',50,0,1,NULL,1,NULL,NULL,'1'),(89,'日期选择','dateselect','gen_show_type','字段生成方案',60,0,1,NULL,1,NULL,NULL,'1'),(90,'人员选择','userselect','gen_show_type','字段生成方案',70,0,1,NULL,1,NULL,NULL,'1'),(91,'部门选择','officeselect','gen_show_type','字段生成方案',80,0,1,NULL,1,NULL,NULL,'1'),(92,'区域选择','areaselect','gen_show_type','字段生成方案',90,0,1,NULL,1,NULL,NULL,'1'),(93,'String','String','gen_java_type','Java类型',10,0,1,NULL,1,NULL,NULL,'1'),(94,'Long','Long','gen_java_type','Java类型',20,0,1,NULL,1,NULL,NULL,'1'),(95,'仅持久层','dao','gen_category','代码生成分类',40,0,1,NULL,1,NULL,NULL,'1'),(96,'男','1','sex','性别',10,0,1,NULL,1,NULL,NULL,'0'),(97,'女','2','sex','性别',20,0,1,NULL,1,NULL,NULL,'0'),(98,'Integer','Integer','gen_java_type','Java类型',30,0,1,NULL,1,NULL,NULL,'1'),(99,'Double','Double','gen_java_type','Java类型',40,0,1,NULL,1,NULL,NULL,'1'),(100,'Date','java.util.Date','gen_java_type','Java类型',50,0,1,NULL,1,NULL,NULL,'1'),(104,'Custom','Custom','gen_java_type','Java类型',90,0,1,NULL,1,NULL,NULL,'1'),(105,'会议通告','1','oa_notify_type','通知通告类型',10,0,1,NULL,1,NULL,NULL,'0'),(106,'奖惩通告','2','oa_notify_type','通知通告类型',20,0,1,NULL,1,NULL,NULL,'0'),(107,'活动通告','3','oa_notify_type','通知通告类型',30,0,1,NULL,1,NULL,NULL,'0'),(108,'草稿','0','oa_notify_status','通知通告状态',10,0,1,NULL,1,NULL,NULL,'0'),(109,'发布','1','oa_notify_status','通知通告状态',20,0,1,NULL,1,NULL,NULL,'0'),(110,'未读','0','oa_notify_read','通知通告状态',10,0,1,NULL,1,NULL,NULL,'0'),(111,'已读','1','oa_notify_read','通知通告状态',20,0,1,NULL,1,NULL,NULL,'0'),(112,'草稿','0','oa_notify_status','通知通告状态',10,0,1,NULL,1,NULL,'','0'),(113,'删除','1','del_flag','删除标记',NULL,NULL,NULL,NULL,NULL,NULL,'',''),(121,'编码','code','hobby','爱好',NULL,NULL,NULL,NULL,NULL,NULL,'',''),(122,'绘画','painting','hobby','爱好',NULL,NULL,NULL,NULL,NULL,NULL,'',''),(123,'Integer','Integer','java_type','Java数据类型',1,NULL,NULL,NULL,NULL,NULL,'',NULL),(124,'Long','Long','java_type','Java数据类型',2,NULL,NULL,NULL,NULL,NULL,'',NULL),(125,'Float','Float','java_type','Java数据类型',3,NULL,NULL,NULL,NULL,NULL,'',NULL),(126,'Double','Double','java_type','Java数据类型',4,NULL,NULL,NULL,NULL,NULL,'',NULL),(127,'BigDecimal','BigDecimal','java_type','Java数据类型',5,NULL,NULL,NULL,NULL,NULL,'',NULL),(128,'Boolean','Boolean','java_type','Java数据类型',6,NULL,NULL,NULL,NULL,NULL,'',NULL),(129,'String','String','java_type','Java数据类型',7,NULL,NULL,NULL,NULL,NULL,'',NULL),(130,'Date','Date','java_type','Java数据类型',8,NULL,NULL,NULL,NULL,NULL,'',NULL),(131,'文本框','1','page_type','页面显示类型',1,NULL,NULL,NULL,NULL,NULL,'',NULL),(132,'下拉框','2','page_type','页面显示类型',2,NULL,NULL,NULL,NULL,NULL,'',NULL),(133,'数值','3','page_type','页面显示类型',3,NULL,NULL,NULL,NULL,NULL,'',NULL),(134,'日期','4','page_type','页面显示类型',4,NULL,NULL,NULL,NULL,NULL,'',NULL),(135,'文本域','5','page_type','页面显示类型',5,NULL,NULL,NULL,NULL,NULL,'',NULL),(136,'富文本','6','page_type','页面显示类型',6,NULL,NULL,NULL,NULL,NULL,'',NULL),(137,'上传图片【单文件】','7','page_type','页面显示类型',7,NULL,NULL,NULL,NULL,NULL,'',NULL),(138,'隐藏域','11','page_type','页面显示类型',11,NULL,NULL,NULL,NULL,NULL,'',NULL),(139,'不显示','12','page_type','页面显示类型',12,NULL,NULL,NULL,NULL,NULL,'',NULL),(140,'男频','0','work_direction','作品方向',0,NULL,NULL,NULL,NULL,NULL,'',NULL),(141,'女频','1','work_direction','作品方向',1,NULL,NULL,NULL,NULL,NULL,'',NULL);
/*!40000 ALTER TABLE `sys_dict` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_file`
--

DROP TABLE IF EXISTS `sys_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_file` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `type` int DEFAULT NULL COMMENT '文件类型',
  `url` varchar(200) DEFAULT NULL COMMENT 'URL地址',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=183 DEFAULT CHARSET=utf8mb3 COMMENT='文件上传';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_file`
--

LOCK TABLES `sys_file` WRITE;
/*!40000 ALTER TABLE `sys_file` DISABLE KEYS */;
INSERT INTO `sys_file` VALUES (142,0,'/files/658554ff-cd62-4ca2-936d-62e35f8af5ef.png','2019-11-01 16:13:39'),(143,0,'/files/de40bb48-c278-4360-9ee6-80b464419255.png','2019-11-01 16:14:24'),(144,0,'/files/8b0737fb-e68d-4162-a066-05f1f3f66b0f.png','2019-11-02 19:42:03'),(145,0,'/files/1006a87c-ee4e-4e97-8bcd-2b5cf861b826.png','2019-11-02 19:42:28'),(146,0,'/files/d7834c20-0e29-4c92-8d0a-9b1297b6e5b8.png','2019-11-02 19:43:05'),(147,0,'/files/6e5d38de-4366-459a-a498-7e418e746f62.png','2019-11-02 19:45:59'),(148,0,'/files/e34d60a9-6bde-48c0-ac4c-64a5ddffcdd4.jpg','2019-11-02 19:54:49'),(149,0,'/files/545579fa-ab81-42e2-8bfa-13ebdc7a137d.png','2019-11-09 10:39:05'),(150,1,'/files/fe0fe8db-495f-4c23-8c74-744399f5c1af.txt','2019-11-09 17:28:31'),(151,99,'/files/1a710af4-a766-4ed8-b8e9-2ec5ef25df6b.sql','2019-11-09 17:42:59'),(152,99,'/files/3a984623-4d2c-4122-9b47-6054eb670dc9.sql','2019-11-09 17:43:04'),(153,0,'/files/2019/11/09/44eddafe-1c58-4710-a2ba-3f88d0e77958.png','2019-11-09 18:29:26'),(154,0,'/files/2019/11/23/f0dfac47-7fc4-43e3-aab9-f5f2276ac550.png','2019-11-23 11:29:03'),(155,0,'/files/2019/11/23/c7ed1b36-63dc-4259-bb31-e2f8d86234de.png','2019-11-23 11:29:06'),(156,0,'/files/2019/11/23/4c772801-5cce-40ce-bd3c-603bb30d5ff4.png','2019-11-23 13:18:11'),(157,0,'/files/2019/11/23/3878019f-6799-4ac4-9a6b-4c709cca5610.png','2019-11-23 13:18:50'),(158,0,'/files/2019/11/23/94bac082-7358-4d84-a3e2-ae8ce31cc427.png','2019-11-23 13:30:38'),(159,0,'/files/2019/11/23/d5ae3fa2-deae-4703-93b8-723d372895a6.png','2019-11-23 13:31:09'),(160,0,'/files/2019/11/23/7b7beb05-9c02-40a1-b25f-db2366d76c87.png','2019-11-23 13:33:04'),(161,0,'/files/2019/11/23/b9deb454-b243-4685-8c69-ae2f302a079f.png','2019-11-23 14:29:52'),(162,0,'/files/2019/11/23/b33b6601-7578-4c58-86bf-d4099d53e752.png','2019-11-23 14:30:32'),(163,0,'/files/2019/11/23/16ed3b6a-c5c8-442e-a166-3f43f45cfc0f.png','2019-11-23 14:33:53'),(164,0,'/files/2019/11/23/9b768a28-d720-4f00-a019-9f3136f61ac4.png','2019-11-23 14:34:22'),(165,0,'/files/2019/11/23/51efde05-3096-4eda-a07e-fc44a939e909.png','2019-11-23 15:15:13'),(166,0,'/files/2019/11/23/eb590e78-f1e3-4d6a-879c-02f9e5028519.png','2019-11-23 15:22:34'),(167,0,'/files/2019/11/23/2d974db3-1292-47e8-8d37-5696d63fd737.png','2019-11-23 15:23:11'),(168,0,'/files/2019/11/23/afbf87aa-1ee9-4244-8f3c-a06dc75b950a.png','2019-11-23 15:24:06'),(169,0,'/files/2019/11/23/e1d27b6b-9c45-4309-9861-9bdb77dbea4c.png','2019-11-23 15:34:14'),(170,0,'/files/2019/11/23/25f40d3b-965d-4564-b153-052139446149.png','2019-11-23 15:34:59'),(171,0,'/files/2019/11/23/01c6e8ea-e25c-4191-b12c-0884391157c5.png','2019-11-23 15:50:06'),(172,0,'/files/2019/11/23/3a230ea3-93dc-4bf7-9037-94a013b3408c.png','2019-11-23 15:51:04'),(173,0,'/files/2019/11/23/4b6994ad-7629-48dc-9c15-c2cf01900b96.png','2019-11-23 15:58:25'),(174,0,'/files/2019/11/23/298fb24b-3e1f-4e97-88d7-2df41acffb8d.png','2019-11-23 15:59:26'),(175,0,'/files/2019/11/23/8e314673-ed11-4b58-942c-68ac34ade62d.png','2019-11-23 16:10:07'),(176,0,'/files/2019/11/23/4497dc84-518e-4b4f-b5f1-a38922827c00.png','2019-11-23 16:11:19'),(177,0,'/files/2019/11/23/81215d73-5922-4d99-8134-710d8a1505f5.png','2019-11-23 16:59:39'),(178,0,'/files/2019/11/23/22be71d0-e2e4-4c80-9db3-0955acf3a3b4.png','2019-11-23 17:00:00'),(179,0,'/files/2019/11/23/c92a51b2-0ee1-4f9a-aa9f-18da61d07e8f.png','2019-11-23 17:13:28'),(180,0,'/files/2019/11/23/eb3f9286-a8b2-46a1-9d1d-54d1b2170b0d.png','2019-11-23 17:14:16'),(181,0,'/files/2019/11/23/912af35f-8514-408d-9b21-f226e52f8611.png','2019-11-23 17:33:16'),(182,0,'/files/2019/11/23/ff9e2850-6d60-4a6b-a93a-d0e58b5dc21c.png','2019-11-23 17:34:09');
/*!40000 ALTER TABLE `sys_file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_gen_columns`
--

DROP TABLE IF EXISTS `sys_gen_columns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_gen_columns` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `table_name` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT '' COMMENT '表名',
  `column_name` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT '' COMMENT '列名',
  `column_type` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL COMMENT '映射java类型',
  `column_comment` varchar(1024) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT '' COMMENT '列注释',
  `column_sort` tinyint DEFAULT NULL COMMENT '列排序（升序）',
  `column_label` varchar(64) DEFAULT NULL COMMENT '鍒楁爣绛惧悕',
  `page_type` tinyint DEFAULT '1' COMMENT '页面显示类型：1、文本框 2、下拉框 3、数值4、日期 5、文本域6、富文本 7、上传图片【单文件】 8、上传图片【多文件】9、上传文件【单文件】 10、上传文件【多文件】11、隐藏域 12、不显示',
  `is_required` tinyint(1) DEFAULT NULL COMMENT '是否必填',
  `dict_type` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT '' COMMENT '页面显示为下拉时使用，字典类型从字典表中取出',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=815 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_gen_columns`
--

LOCK TABLES `sys_gen_columns` WRITE;
/*!40000 ALTER TABLE `sys_gen_columns` DISABLE KEYS */;
INSERT INTO `sys_gen_columns` VALUES (452,'sys_user','username','varchar','String','用户名',2,'用户名',1,0,NULL),(453,'sys_user','name','varchar','String','',3,'真实姓名',6,0,NULL),(454,'sys_user','password','varchar','String','密码',4,'密码',3,0,NULL),(455,'sys_user','dept_id','bigint','Long','',5,'部门',1,0,NULL),(456,'sys_user','email','varchar','String','邮箱',6,'邮箱',1,0,NULL),(457,'sys_user','mobile','varchar','String','手机号',7,'手机号',1,0,NULL),(458,'sys_user','status','tinyint','Integer','状态 0:禁用，1:正常',8,'状态 0:禁用，1:正常',2,0,'yes_no'),(459,'sys_user','user_id_create','bigint','Long','创建用户id',9,'创建用户id',1,0,NULL),(460,'sys_user','gmt_create','datetime','Date','创建时间',10,'创建时间',4,0,NULL),(461,'sys_user','gmt_modified','datetime','Date','修改时间',11,'修改时间',4,0,NULL),(462,'sys_user','sex','bigint','Long','性别',12,'性别',1,0,NULL),(463,'sys_user','birth','datetime','Date','出身日期',13,'出身日期',4,0,NULL),(464,'sys_user','pic_id','bigint','Long','',14,'',1,0,NULL),(465,'sys_user','live_address','varchar','String','现居住地',50,'现居住地',6,0,NULL),(466,'sys_user','hobby','varchar','String','爱好',16,'爱好',7,0,NULL),(467,'sys_user','province','varchar','String','省份',17,'省份',2,0,'theme'),(468,'sys_user','city','varchar','String','所在城市',18,'所在城市',1,0,NULL),(469,'sys_user','district','varchar','String','所在地区',19,'所在地区',7,0,NULL),(730,'sys_role_data_perm','role_id','bigint','Long','角色ID',2,'角色ID',1,0,NULL),(731,'sys_role_data_perm','perm_id','bigint','Long','权限ID',3,'权限ID',1,0,NULL),(732,'sys_data_perm','name','varchar','String','权限名称',2,'权限名称',1,1,NULL),(733,'sys_data_perm','table_name','varchar','String','数据表名称',3,'数据表名称',1,1,NULL),(734,'sys_data_perm','module_name','varchar','String','所属模块',4,'所属模块',1,1,NULL),(735,'sys_data_perm','crl_attr_name','varchar','String','用户权限控制属性名',5,'用户权限控制属性名',1,1,NULL),(736,'sys_data_perm','crl_column_name','varchar','String','数据表权限控制列名',6,'数据表权限控制列名',1,1,NULL),(737,'sys_data_perm','perm_code','varchar','String','权限code，all_开头表示查看所有数据的权限，sup_开头表示查看下级数据的权限，own_开头表示查看本级数据的权限',7,'权限code',1,1,NULL),(738,'sys_data_perm','order_num','int','Integer','排序',8,'排序',3,0,NULL),(739,'sys_data_perm','gmt_create','datetime','Date','创建时间',9,'创建时间',12,0,NULL),(740,'sys_data_perm','gmt_modified','datetime','Date','修改时间',10,'修改时间',12,0,NULL),(771,'fb_order','fb_merchant_code','varchar','String','付呗商户号',4,'付呗商户号',1,0,'del_flag'),(772,'fb_order','merchant_order_sn','varchar','String','第三方商户的订单号',5,'第三方商户的订单号',1,0,'del_flag'),(773,'fb_order','order_sn','varchar','String','付呗订单号',6,'付呗订单号',2,0,'color'),(774,'fb_order','platform_order_no','varchar','String','平台方订单号',7,'平台方订单号',2,0,'oa_leave_type'),(775,'fb_order','trade_no','varchar','String','商户单号',8,'商户单号',6,0,'del_flag'),(776,'fb_order','order_state','tinyint','Integer','订单状态，1：未支付，2：支付成功，3：支付失败，4：支付取消',9,'订单状态，1：未支付，2：支付成功，3：支付失败，4：支付取消',2,0,'yes_no'),(777,'fb_order','fn_coupon','decimal','Double','蜂鸟优惠卷抵扣',10,'蜂鸟优惠卷抵扣',3,0,'del_flag'),(778,'fb_order','red_packet','decimal','BigDecimal','红包抵扣',11,'红包抵扣',3,0,'del_flag'),(779,'fb_order','total_fee','decimal','BigDecimal','实收金额(元)',12,'实收金额(元)',3,0,'del_flag'),(780,'fb_order','order_price','decimal','BigDecimal','订单金额',13,'订单金额',3,0,'del_flag'),(781,'fb_order','fee','decimal','BigDecimal','手续费(元)',14,'手续费(元)',3,0,'del_flag'),(782,'fb_order','body','varchar','String','对商品或交易的描述',15,'对商品或交易的描述',7,0,'del_flag'),(783,'fb_order','attach','varchar','String','附加数据',16,'附加数据',6,0,'del_flag'),(784,'fb_order','store_id','bigint','Long','付呗系统的门店id',17,'付呗系统的门店id',3,0,'del_flag'),(785,'fb_order','cashier_id','bigint','Long','付呗系统的收银员id',18,'付呗系统的收银员id',3,0,'del_flag'),(786,'fb_order','device_no','varchar','String','设备终端号',19,'设备终端号',1,0,'del_flag'),(787,'fb_order','user_id','varchar','String','微信顾客支付授权的“open_id”或者支付宝顾客的“buyer_user_id”',20,'微信顾客支付授权的“open_id”或者支付宝顾客的“buyer_user_id”',1,0,'del_flag'),(788,'fb_order','user_logon_id','varchar','String','支付宝顾客的账号',21,'支付宝顾客的账号',5,0,'del_flag'),(789,'fb_order','pay_time','datetime','Date','交易成功的时间',22,'交易成功的时间',4,0,'del_flag'),(790,'fb_order','pay_channel','tinyint','Integer','支付通道:1微信、2支付宝、3银联',23,'支付通道:1微信、2支付宝、3银联',2,0,'del_flag'),(791,'fb_order','no_cash_coupon_fee','decimal','BigDecimal','免充值代金券金额(元)',24,'免充值代金券金额(元)',3,0,'del_flag'),(792,'fb_order','cash_coupon_fee','decimal','BigDecimal','预充值代金券金额(元)',25,'预充值代金券金额(元)',3,0,'yes_no'),(793,'fb_order','cash_fee','decimal','BigDecimal','顾客实际支付金额(元)',26,'顾客实际支付金额(元)',3,0,'del_flag'),(794,'fb_order','sign','varchar','String','签名',27,'签名',2,0,'theme'),(795,'fb_order','options','varchar','String','其它选项',28,'其它选项',7,0,'del_flag'),(796,'fb_order','create_time','datetime','Date','创建时间',29,'创建时间',4,0,'del_flag'),(797,'fb_order','push_time','datetime','Date','推送时间',30,'推送时间',4,0,'del_flag'),(798,'fb_order','push_ip','varchar','String','推送IP',31,'推送IP',6,0,'del_flag'),(799,'fb_order','mcht_id','bigint','BigDecimal','商户id',90,'商户id',3,0,'theme'),(800,'fb_order','sn','char','String','QR编号',100,'QR编号',1,0,'del_flag'),(801,'author','user_id','bigint','Long','用户ID',2,'用户ID',1,0,NULL),(802,'author','invite_code','varchar','String','邀请码',3,'邀请码',1,0,NULL),(803,'author','pen_name','varchar','String','笔名',4,'笔名',1,0,NULL),(804,'author','tel_phone','varchar','String','手机号码',5,'手机号码',1,0,NULL),(805,'author','chat_account','varchar','String','QQ或微信账号',6,'QQ或微信账号',1,0,NULL),(806,'author','email','varchar','String','电子邮箱',7,'电子邮箱',1,0,NULL),(807,'author','work_direction','tinyint','Integer','作品方向，0：男频，1：女频',8,'作品方向，0：男频，1：女频',2,0,'work_direction'),(808,'author','status','tinyint','Integer','0：正常，1：封禁',10,'0：正常，1：封禁',1,0,NULL),(809,'author','create_time','datetime','Date','创建时间',9,'入驻时间',4,0,NULL),(810,'author_code','invite_code','varchar','String','邀请码',2,'邀请码',1,1,NULL),(811,'author_code','validity_time','datetime','Date','有效时间',3,'有效时间',4,1,NULL),(812,'author_code','is_use','tinyint','Integer','是否使用过，0：未使用，1:使用过',4,'是否使用过，0：未使用，1:使用过',1,0,NULL),(813,'author_code','create_time','datetime','Date','创建时间',5,'创建时间',4,0,NULL),(814,'author_code','create_user_id','bigint','Long','创建人ID',6,'创建人ID',1,0,NULL);
/*!40000 ALTER TABLE `sys_gen_columns` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_gen_table`
--

DROP TABLE IF EXISTS `sys_gen_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_gen_table` (
  `id` bigint NOT NULL COMMENT '主键',
  `table_name` varchar(64) NOT NULL COMMENT '表名',
  `class_name` varchar(100) NOT NULL COMMENT '实体类名称',
  `comments` varchar(500) NOT NULL COMMENT '表说明',
  `category` tinyint(1) NOT NULL DEFAULT '0' COMMENT '分类：0：数据表，1：树表',
  `package_name` varchar(500) DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) DEFAULT NULL COMMENT '生成模块名',
  `sub_module_name` varchar(30) DEFAULT NULL COMMENT '生成子模块名',
  `function_name` varchar(200) DEFAULT NULL COMMENT '生成功能名，用于类描述',
  `function_name_simple` varchar(50) DEFAULT NULL COMMENT '生成功能名（简写），用于功能提示，如“保存xx成功”',
  `author` varchar(50) DEFAULT NULL COMMENT '生成功能作者',
  `src_dir` varchar(1000) DEFAULT NULL COMMENT 'src目录',
  `options` varchar(1000) DEFAULT NULL COMMENT '其它生成选项',
  `create_by` bigint NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` bigint NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(500) DEFAULT NULL COMMENT '备注信息',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='代码生成表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_gen_table`
--

LOCK TABLES `sys_gen_table` WRITE;
/*!40000 ALTER TABLE `sys_gen_table` DISABLE KEYS */;
INSERT INTO `sys_gen_table` VALUES (1,'表名','1','1',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,'2019-10-24 18:21:24',1,'2019-10-24 18:21:35',NULL);
/*!40000 ALTER TABLE `sys_gen_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_gen_table_column`
--

DROP TABLE IF EXISTS `sys_gen_table_column`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_gen_table_column` (
  `id` bigint NOT NULL COMMENT '主键',
  `table_id` bigint NOT NULL COMMENT '表id',
  `column_name` varchar(64) NOT NULL COMMENT '列名',
  `column_sort` decimal(10,0) DEFAULT NULL COMMENT '列排序（升序）',
  `column_type` varchar(100) NOT NULL COMMENT '类型',
  `column_label` varchar(50) DEFAULT NULL COMMENT '列标签名',
  `comments` varchar(500) NOT NULL COMMENT '列备注说明',
  `attr_name` varchar(200) NOT NULL COMMENT '类的属性名',
  `attr_type` varchar(200) NOT NULL COMMENT '类的属性类型',
  `is_pk` char(1) DEFAULT NULL COMMENT '是否主键',
  `is_null` char(1) DEFAULT NULL COMMENT '是否可为空',
  `is_insert` char(1) DEFAULT NULL COMMENT '是否插入字段',
  `is_update` char(1) DEFAULT NULL COMMENT '是否更新字段',
  `is_list` char(1) DEFAULT NULL COMMENT '是否列表字段',
  `is_query` char(1) DEFAULT NULL COMMENT '是否查询字段',
  `query_type` varchar(200) DEFAULT NULL COMMENT '查询方式',
  `is_edit` char(1) DEFAULT NULL COMMENT '是否编辑字段',
  `show_type` varchar(200) DEFAULT NULL COMMENT '表单类型',
  `options` varchar(1000) DEFAULT NULL COMMENT '其它生成选项',
  PRIMARY KEY (`id`),
  KEY `idx_gen_table_column_tn` (`table_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='代码生成表列';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_gen_table_column`
--

LOCK TABLES `sys_gen_table_column` WRITE;
/*!40000 ALTER TABLE `sys_gen_table_column` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_gen_table_column` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_log`
--

DROP TABLE IF EXISTS `sys_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_log` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint DEFAULT NULL COMMENT '用户id',
  `username` varchar(50) DEFAULT NULL COMMENT '用户名',
  `operation` varchar(50) DEFAULT NULL COMMENT '用户操作',
  `time` int DEFAULT NULL COMMENT '响应时间',
  `method` varchar(200) DEFAULT NULL COMMENT '请求方法',
  `params` varchar(5000) DEFAULT NULL COMMENT '请求参数',
  `ip` varchar(64) DEFAULT NULL COMMENT 'IP地址',
  `gmt_create` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=83 DEFAULT CHARSET=utf8mb3 COMMENT='系统日志';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_log`
--

LOCK TABLES `sys_log` WRITE;
/*!40000 ALTER TABLE `sys_log` DISABLE KEYS */;
INSERT INTO `sys_log` VALUES (1,1,'admin','登录',240,'com.java2nb.system.controller.LoginController.ajaxLogin()',NULL,'172.20.0.1','2022-06-22 15:37:15'),(2,1,'admin','请求访问主页',173,'com.java2nb.system.controller.LoginController.index()',NULL,'172.20.0.1','2022-06-22 15:37:15'),(3,1,'admin','请求访问主页',14,'com.java2nb.system.controller.LoginController.index()',NULL,'172.20.0.1','2022-06-22 15:48:03'),(4,1,'admin','登录',299,'com.java2nb.system.controller.LoginController.ajaxLogin()',NULL,'172.19.0.1','2022-07-03 22:09:56'),(5,1,'admin','请求访问主页',197,'com.java2nb.system.controller.LoginController.index()',NULL,'172.19.0.1','2022-07-03 22:09:56'),(6,1,'admin','error',NULL,'http://localhost:8088/common/dict/list','org.apache.catalina.connector.ClientAbortException: java.io.IOException: Broken pipe',NULL,'2022-07-04 00:42:49'),(7,1,'admin','登录',418,'com.java2nb.system.controller.LoginController.ajaxLogin()',NULL,'127.0.0.1','2022-07-26 12:39:42'),(8,1,'admin','请求访问主页',338,'com.java2nb.system.controller.LoginController.index()',NULL,'127.0.0.1','2022-07-26 12:39:43'),(9,1,'admin','登录',387,'com.java2nb.system.controller.LoginController.ajaxLogin()',NULL,'127.0.0.1','2022-07-26 16:20:57'),(10,1,'admin','请求访问主页',146,'com.java2nb.system.controller.LoginController.index()',NULL,'127.0.0.1','2022-07-26 16:20:57'),(11,-1,'获取用户信息为空','登录',441,'com.java2nb.system.controller.LoginController.ajaxLogin()',NULL,'127.0.0.1','2022-08-13 15:50:17'),(12,1,'admin','登录',94,'com.java2nb.system.controller.LoginController.ajaxLogin()',NULL,'127.0.0.1','2022-08-13 15:50:31'),(13,1,'admin','请求访问主页',143,'com.java2nb.system.controller.LoginController.index()',NULL,'127.0.0.1','2022-08-13 15:50:31'),(14,1,'admin','登录',345,'com.java2nb.system.controller.LoginController.ajaxLogin()',NULL,'127.0.0.1','2022-08-13 21:12:04'),(15,1,'admin','请求访问主页',155,'com.java2nb.system.controller.LoginController.index()',NULL,'127.0.0.1','2022-08-13 21:12:04'),(16,1,'admin','登录',311,'com.java2nb.system.controller.LoginController.ajaxLogin()',NULL,'127.0.0.1','2022-08-13 21:29:26'),(17,1,'admin','请求访问主页',113,'com.java2nb.system.controller.LoginController.index()',NULL,'127.0.0.1','2022-08-13 21:29:26'),(18,1,'admin','登录',31,'com.java2nb.system.controller.LoginController.ajaxLogin()',NULL,'127.0.0.1','2022-08-13 21:33:50'),(19,1,'admin','请求访问主页',39,'com.java2nb.system.controller.LoginController.index()',NULL,'127.0.0.1','2022-08-13 21:33:50'),(20,1,'admin','请求访问主页',20,'com.java2nb.system.controller.LoginController.index()',NULL,'127.0.0.1','2022-08-13 21:34:57'),(21,1,'admin','登录',41,'com.java2nb.system.controller.LoginController.ajaxLogin()',NULL,'127.0.0.1','2022-08-13 21:47:53'),(22,1,'admin','请求访问主页',49,'com.java2nb.system.controller.LoginController.index()',NULL,'127.0.0.1','2022-08-13 21:47:53'),(23,1,'admin','请求访问主页',18,'com.java2nb.system.controller.LoginController.index()',NULL,'127.0.0.1','2022-08-13 21:48:53'),(24,1,'admin','登录',506,'com.java2nb.system.controller.LoginController.ajaxLogin()',NULL,'127.0.0.1','2022-08-13 22:07:45'),(25,1,'admin','请求访问主页',197,'com.java2nb.system.controller.LoginController.index()',NULL,'127.0.0.1','2022-08-13 22:07:46'),(26,1,'admin','请求访问主页',32,'com.java2nb.system.controller.LoginController.index()',NULL,'127.0.0.1','2022-08-13 22:16:59'),(27,1,'admin','登录',349,'com.java2nb.system.controller.LoginController.ajaxLogin()',NULL,'127.0.0.1','2022-08-14 09:34:04'),(28,1,'admin','请求访问主页',168,'com.java2nb.system.controller.LoginController.index()',NULL,'127.0.0.1','2022-08-14 09:34:05'),(29,1,'admin','请求访问主页',14,'com.java2nb.system.controller.LoginController.index()',NULL,'127.0.0.1','2022-08-14 09:35:39'),(30,-1,'获取用户信息为空','登录',4,'com.java2nb.system.controller.LoginController.ajaxLogin()',NULL,'127.0.0.1','2022-08-14 10:45:35'),(31,-1,'获取用户信息为空','登录',2,'com.java2nb.system.controller.LoginController.ajaxLogin()',NULL,'127.0.0.1','2022-08-14 10:45:44'),(32,-1,'获取用户信息为空','登录',1,'com.java2nb.system.controller.LoginController.ajaxLogin()',NULL,'127.0.0.1','2022-08-14 10:45:48'),(33,1,'admin','登录',238,'com.java2nb.system.controller.LoginController.ajaxLogin()',NULL,'127.0.0.1','2022-08-14 10:45:56'),(34,1,'admin','请求访问主页',189,'com.java2nb.system.controller.LoginController.index()',NULL,'127.0.0.1','2022-08-14 10:45:57'),(35,1,'admin','登录',496,'com.java2nb.system.controller.LoginController.ajaxLogin()',NULL,'127.0.0.1','2022-08-14 10:53:17'),(36,1,'admin','请求访问主页',163,'com.java2nb.system.controller.LoginController.index()',NULL,'127.0.0.1','2022-08-14 10:53:17'),(37,1,'admin','登录',27,'com.java2nb.system.controller.LoginController.ajaxLogin()',NULL,'127.0.0.1','2022-08-14 10:55:56'),(38,1,'admin','请求访问主页',29,'com.java2nb.system.controller.LoginController.index()',NULL,'127.0.0.1','2022-08-14 10:55:56'),(39,1,'admin','请求访问主页',19,'com.java2nb.system.controller.LoginController.index()',NULL,'127.0.0.1','2022-08-14 10:57:49'),(40,-1,'获取用户信息为空','登录',4,'com.java2nb.system.controller.LoginController.ajaxLogin()',NULL,'127.0.0.1','2022-08-14 11:02:20'),(41,1,'admin','登录',141,'com.java2nb.system.controller.LoginController.ajaxLogin()',NULL,'127.0.0.1','2022-08-14 11:02:29'),(42,1,'admin','请求访问主页',92,'com.java2nb.system.controller.LoginController.index()',NULL,'127.0.0.1','2022-08-14 11:02:29'),(43,1,'admin','请求访问主页',19,'com.java2nb.system.controller.LoginController.index()',NULL,'127.0.0.1','2022-08-14 11:03:00'),(44,1,'admin','登录',447,'com.java2nb.system.controller.LoginController.ajaxLogin()',NULL,'127.0.0.1','2022-08-14 16:30:22'),(45,1,'admin','请求访问主页',193,'com.java2nb.system.controller.LoginController.index()',NULL,'127.0.0.1','2022-08-14 16:30:23'),(46,1,'admin','请求访问主页',17,'com.java2nb.system.controller.LoginController.index()',NULL,'127.0.0.1','2022-08-14 16:30:34'),(47,1,'admin','请求访问主页',13,'com.java2nb.system.controller.LoginController.index()',NULL,'127.0.0.1','2022-08-14 16:30:55'),(48,-1,'获取用户信息为空','登录',362,'com.java2nb.system.controller.LoginController.ajaxLogin()',NULL,'127.0.0.1','2022-08-18 10:10:22'),(49,1,'admin','登录',86,'com.java2nb.system.controller.LoginController.ajaxLogin()',NULL,'127.0.0.1','2022-08-18 10:10:31'),(50,1,'admin','请求访问主页',154,'com.java2nb.system.controller.LoginController.index()',NULL,'127.0.0.1','2022-08-18 10:10:32'),(51,1,'admin','登录',298,'com.java2nb.system.controller.LoginController.ajaxLogin()',NULL,'127.0.0.1','2022-08-18 10:16:29'),(52,1,'admin','请求访问主页',153,'com.java2nb.system.controller.LoginController.index()',NULL,'127.0.0.1','2022-08-18 10:16:29'),(53,1,'admin','登录',3,'com.java2nb.system.controller.LoginController.ajaxLogin()',NULL,'127.0.0.1','2022-08-18 10:16:39'),(54,1,'admin','登录',48,'com.java2nb.system.controller.LoginController.ajaxLogin()',NULL,'127.0.0.1','2022-08-18 10:16:45'),(55,1,'admin','请求访问主页',57,'com.java2nb.system.controller.LoginController.index()',NULL,'127.0.0.1','2022-08-18 10:16:45'),(56,1,'admin','登录',25,'com.java2nb.system.controller.LoginController.ajaxLogin()',NULL,'127.0.0.1','2022-08-18 10:17:10'),(57,1,'admin','请求访问主页',45,'com.java2nb.system.controller.LoginController.index()',NULL,'127.0.0.1','2022-08-18 10:17:11'),(58,1,'admin','登录',12,'com.java2nb.system.controller.LoginController.ajaxLogin()',NULL,'127.0.0.1','2022-08-18 10:17:33'),(59,-1,'获取用户信息为空','登录',35,'com.java2nb.system.controller.LoginController.ajaxLogin()',NULL,'127.0.0.1','2022-08-18 10:20:38'),(60,-1,'获取用户信息为空','登录',36,'com.java2nb.system.controller.LoginController.ajaxLogin()',NULL,'127.0.0.1','2022-08-18 10:24:53'),(61,1,'admin','登录',202,'com.java2nb.system.controller.LoginController.ajaxLogin()',NULL,'127.0.0.1','2022-08-18 10:24:58'),(62,1,'admin','请求访问主页',231,'com.java2nb.system.controller.LoginController.index()',NULL,'127.0.0.1','2022-08-18 10:24:59'),(63,1,'admin','编辑用户',90,'com.java2nb.system.controller.SysUserController.edit()',NULL,'127.0.0.1','2022-08-18 10:25:17'),(64,1,'admin','请求更改用户密码',2,'com.java2nb.system.controller.SysUserController.resetPwd()',NULL,'127.0.0.1','2022-08-18 10:26:33'),(65,1,'admin','admin提交更改用户密码',28,'com.java2nb.system.controller.SysUserController.adminResetPwd()',NULL,'127.0.0.1','2022-08-18 10:27:13'),(66,1,'admin','admin提交更改用户密码',14,'com.java2nb.system.controller.SysUserController.adminResetPwd()',NULL,'127.0.0.1','2022-08-18 10:27:25'),(67,1,'admin','编辑用户',26,'com.java2nb.system.controller.SysUserController.edit()',NULL,'127.0.0.1','2022-08-18 10:27:29'),(68,1,'admin','请求更改用户密码',6,'com.java2nb.system.controller.SysUserController.resetPwd()',NULL,'127.0.0.1','2022-08-18 10:27:42'),(69,1,'admin','admin提交更改用户密码',20,'com.java2nb.system.controller.SysUserController.adminResetPwd()',NULL,'127.0.0.1','2022-08-18 10:27:46'),(70,1,'admin','提交更改用户密码',19,'com.java2nb.system.controller.SysUserController.resetPwd()',NULL,'127.0.0.1','2022-08-18 10:29:31'),(71,1,'admin','请求访问主页',16,'com.java2nb.system.controller.LoginController.index()',NULL,'127.0.0.1','2022-08-18 10:29:39'),(72,1,'admin','登录',40,'com.java2nb.system.controller.LoginController.ajaxLogin()',NULL,'127.0.0.1','2022-08-18 10:29:50'),(73,1,'admin','请求访问主页',58,'com.java2nb.system.controller.LoginController.index()',NULL,'127.0.0.1','2022-08-18 10:29:50'),(74,1,'admin','登录',53,'com.java2nb.system.controller.LoginController.ajaxLogin()',NULL,'127.0.0.1','2022-08-18 10:30:00'),(75,-1,'获取用户信息为空','登录',9,'com.java2nb.system.controller.LoginController.ajaxLogin()',NULL,'127.0.0.1','2022-08-29 12:44:41'),(76,-1,'获取用户信息为空','登录',154,'com.java2nb.system.controller.LoginController.ajaxLogin()',NULL,'127.0.0.1','2022-08-29 12:44:48'),(77,-1,'获取用户信息为空','登录',16,'com.java2nb.system.controller.LoginController.ajaxLogin()',NULL,'127.0.0.1','2022-08-29 12:45:03'),(78,-1,'获取用户信息为空','登录',20,'com.java2nb.system.controller.LoginController.ajaxLogin()',NULL,'127.0.0.1','2022-08-29 12:45:36'),(79,1,'admin','登录',103,'com.java2nb.system.controller.LoginController.ajaxLogin()',NULL,'127.0.0.1','2022-08-29 12:46:14'),(80,1,'admin','请求访问主页',148,'com.java2nb.system.controller.LoginController.index()',NULL,'127.0.0.1','2022-08-29 12:46:15'),(81,1,'admin','登录',374,'com.java2nb.system.controller.LoginController.ajaxLogin()',NULL,'127.0.0.1','2022-09-05 15:00:02'),(82,1,'admin','请求访问主页',212,'com.java2nb.system.controller.LoginController.index()',NULL,'127.0.0.1','2022-09-05 15:00:02');
/*!40000 ALTER TABLE `sys_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_menu`
--

DROP TABLE IF EXISTS `sys_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_menu` (
  `menu_id` bigint NOT NULL AUTO_INCREMENT,
  `parent_id` bigint DEFAULT NULL COMMENT '父菜单ID，一级菜单为0',
  `name` varchar(50) DEFAULT NULL COMMENT '菜单名称',
  `url` varchar(200) DEFAULT NULL COMMENT '菜单URL',
  `perms` varchar(500) DEFAULT NULL COMMENT '授权(多个用逗号分隔，如：user:list,user:create)',
  `type` int DEFAULT NULL COMMENT '类型   0：目录   1：菜单   2：按钮',
  `icon` varchar(50) DEFAULT NULL COMMENT '菜单图标',
  `order_num` int DEFAULT NULL COMMENT '排序',
  `gmt_create` datetime DEFAULT NULL COMMENT '创建时间',
  `gmt_modified` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=247 DEFAULT CHARSET=utf8mb3 COMMENT='菜单管理';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_menu`
--

LOCK TABLES `sys_menu` WRITE;
/*!40000 ALTER TABLE `sys_menu` DISABLE KEYS */;
INSERT INTO `sys_menu` VALUES (1,0,'基础管理','','',0,'fa fa-bars',0,'2017-08-09 22:49:47',NULL),(2,3,'系统菜单','sys/menu/','sys:menu:menu',1,'fa fa-th-list',2,'2017-08-09 22:55:15',NULL),(3,0,'系统管理',NULL,NULL,0,'fa fa-desktop',1,'2017-08-09 23:06:55','2017-08-14 14:13:43'),(6,3,'用户管理','sys/user/','sys:user:user',1,'fa fa-user',0,'2017-08-10 14:12:11',NULL),(7,3,'角色管理','sys/role','sys:role:role',1,'fa fa-paw',1,'2017-08-10 14:13:19',NULL),(12,6,'新增','','sys:user:add',2,'',0,'2017-08-14 10:51:35',NULL),(13,6,'编辑','','sys:user:edit',2,'',0,'2017-08-14 10:52:06',NULL),(14,6,'删除',NULL,'sys:user:remove',2,NULL,0,'2017-08-14 10:52:24',NULL),(15,7,'新增','','sys:role:add',2,'',0,'2017-08-14 10:56:37',NULL),(20,2,'新增','','sys:menu:add',2,'',0,'2017-08-14 10:59:32',NULL),(21,2,'编辑','','sys:menu:edit',2,'',0,'2017-08-14 10:59:56',NULL),(22,2,'删除','','sys:menu:remove',2,'',0,'2017-08-14 11:00:26',NULL),(24,6,'批量删除','','sys:user:batchRemove',2,'',0,'2017-08-14 17:27:18',NULL),(25,6,'停用',NULL,'sys:user:disable',2,NULL,0,'2017-08-14 17:27:43',NULL),(26,6,'重置密码','','sys:user:resetPwd',2,'',0,'2017-08-14 17:28:34',NULL),(27,91,'系统日志','common/log','common:log',1,'fa fa-warning',0,'2017-08-14 22:11:53',NULL),(28,27,'刷新',NULL,'sys:log:list',2,NULL,0,'2017-08-14 22:30:22',NULL),(29,27,'删除',NULL,'sys:log:remove',2,NULL,0,'2017-08-14 22:30:43',NULL),(30,27,'清空',NULL,'sys:log:clear',2,NULL,0,'2017-08-14 22:31:02',NULL),(48,77,'代码生成','common/generator','common:generator',1,'fa fa-code',3,NULL,NULL),(55,7,'编辑','','sys:role:edit',2,'',NULL,NULL,NULL),(56,7,'删除','','sys:role:remove',2,NULL,NULL,NULL,NULL),(57,91,'运行监控','/druid/index.html','',1,'fa fa-caret-square-o-right',1,NULL,NULL),(61,2,'批量删除','','sys:menu:batchRemove',2,NULL,NULL,NULL,NULL),(62,7,'批量删除','','sys:role:batchRemove',2,NULL,NULL,NULL,NULL),(71,1,'文件管理','/common/sysFile','common:sysFile:sysFile',1,'fa fa-folder-open',2,NULL,NULL),(73,3,'部门管理','/system/sysDept','system:sysDept:sysDept',1,'fa fa-users',3,NULL,NULL),(74,73,'增加','/system/sysDept/add','system:sysDept:add',2,NULL,1,NULL,NULL),(75,73,'刪除','system/sysDept/remove','system:sysDept:remove',2,NULL,2,NULL,NULL),(76,73,'编辑','/system/sysDept/edit','system:sysDept:edit',2,NULL,3,NULL,NULL),(77,0,'研发工具','','',0,'fa fa-gear',5,NULL,NULL),(78,1,'数据字典','/common/dict','common:dict:dict',1,'fa fa-book',1,NULL,NULL),(79,78,'增加','/common/dict/add','common:dict:add',2,NULL,2,NULL,NULL),(80,78,'编辑','/common/dict/edit','common:dict:edit',2,NULL,2,NULL,NULL),(81,78,'删除','/common/dict/remove','common:dict:remove',2,'',3,NULL,NULL),(83,78,'批量删除','/common/dict/batchRemove','common:dict:batchRemove',2,'',4,NULL,NULL),(91,0,'系统监控','','',0,'fa fa-video-camera',4,NULL,NULL),(92,91,'在线用户','sys/online','',1,'fa fa-user',NULL,NULL,NULL),(104,77,'swagger','/swagger-ui.html','',1,'',NULL,NULL,NULL),(203,202,'订单管理','test/order','test:order:order',1,'',1,NULL,NULL),(204,203,'新增','','test:order:add',2,'',NULL,NULL,NULL),(205,203,'编辑','','test:order:edit',2,'',NULL,NULL,NULL),(206,203,'删除','','test:order:remove',2,'',NULL,NULL,NULL),(207,203,'批量删除','','test:order:batchRemove',2,'',NULL,NULL,NULL),(208,203,'详情','','test:order:detail',2,'',0,NULL,NULL),(209,3,'数据权限','system/dataPerm','system:dataPerm:dataPerm',1,'fa',6,NULL,NULL),(210,209,'查看',NULL,'system:dataPerm:detail',2,NULL,6,NULL,NULL),(211,209,'新增',NULL,'system:dataPerm:add',2,NULL,6,NULL,NULL),(212,209,'修改',NULL,'system:dataPerm:edit',2,NULL,6,NULL,NULL),(213,209,'删除',NULL,'system:dataPerm:remove',2,NULL,6,NULL,NULL),(214,209,'批量删除',NULL,'system:dataPerm:batchRemove',2,NULL,6,NULL,NULL),(221,0,'作家管理','','',0,'fa fa-user-o',10,NULL,NULL),(222,221,'作者列表','novel/author','novel:author:author',1,'fa',6,NULL,NULL),(223,222,'查看',NULL,'novel:author:detail',2,NULL,6,NULL,NULL),(224,222,'新增',NULL,'novel:author:add',2,NULL,6,NULL,NULL),(225,222,'修改',NULL,'novel:author:edit',2,NULL,6,NULL,NULL),(226,222,'删除',NULL,'novel:author:remove',2,NULL,6,NULL,NULL),(227,222,'批量删除',NULL,'novel:author:batchRemove',2,NULL,6,NULL,NULL),(228,221,'邀请码管理','novel/authorCode','novel:authorCode:authorCode',1,'fa',3,NULL,NULL),(229,228,'查看',NULL,'novel:authorCode:detail',2,NULL,6,NULL,NULL),(230,228,'新增',NULL,'novel:authorCode:add',2,NULL,6,NULL,NULL),(231,228,'修改',NULL,'novel:authorCode:edit',2,NULL,6,NULL,NULL),(232,228,'删除',NULL,'novel:authorCode:remove',2,NULL,6,NULL,NULL),(233,228,'批量删除',NULL,'novel:authorCode:batchRemove',2,NULL,6,NULL,NULL),(234,0,'新闻管理','','',0,'fa fa-newspaper-o',8,NULL,NULL),(235,234,'类别管理','novel/category','novel:category:category',1,'fa',6,NULL,NULL),(236,235,'查看',NULL,'novel:category:detail',2,NULL,6,NULL,NULL),(237,235,'新增',NULL,'novel:category:add',2,NULL,6,NULL,NULL),(238,235,'修改',NULL,'novel:category:edit',2,NULL,6,NULL,NULL),(239,235,'删除',NULL,'novel:category:remove',2,NULL,6,NULL,NULL),(240,235,'批量删除',NULL,'novel:category:batchRemove',2,NULL,6,NULL,NULL),(241,234,'新闻列表','novel/news','novel:news:news',1,'fa',8,NULL,NULL),(242,241,'查看',NULL,'novel:news:detail',2,NULL,6,NULL,NULL),(243,241,'新增',NULL,'novel:news:add',2,NULL,6,NULL,NULL),(244,241,'修改',NULL,'novel:news:edit',2,NULL,6,NULL,NULL),(245,241,'删除',NULL,'novel:news:remove',2,NULL,6,NULL,NULL),(246,241,'批量删除',NULL,'novel:news:batchRemove',2,NULL,6,NULL,NULL);
/*!40000 ALTER TABLE `sys_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role`
--

DROP TABLE IF EXISTS `sys_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_role` (
  `role_id` bigint NOT NULL AUTO_INCREMENT,
  `role_name` varchar(100) DEFAULT NULL COMMENT '角色名称',
  `role_sign` varchar(100) DEFAULT NULL COMMENT '角色标识',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  `user_id_create` bigint DEFAULT NULL COMMENT '创建用户id',
  `gmt_create` datetime DEFAULT NULL COMMENT '创建时间',
  `gmt_modified` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COMMENT='角色';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role`
--

LOCK TABLES `sys_role` WRITE;
/*!40000 ALTER TABLE `sys_role` DISABLE KEYS */;
INSERT INTO `sys_role` VALUES (1,'超级用户角色','admin','拥有最高权限',2,'2017-08-12 00:43:52','2017-08-12 19:14:59');
/*!40000 ALTER TABLE `sys_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role_data_perm`
--

DROP TABLE IF EXISTS `sys_role_data_perm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_role_data_perm` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `role_id` bigint DEFAULT NULL COMMENT '角色ID',
  `perm_id` bigint DEFAULT NULL COMMENT '权限ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=79 DEFAULT CHARSET=utf8mb3 COMMENT='角色与数据权限对应关系';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role_data_perm`
--

LOCK TABLES `sys_role_data_perm` WRITE;
/*!40000 ALTER TABLE `sys_role_data_perm` DISABLE KEYS */;
INSERT INTO `sys_role_data_perm` VALUES (60,60,211),(61,60,-1),(62,60,1199170283966787584),(71,1,214),(72,1,213),(73,1,212),(74,1,211),(75,1,210),(76,1,1260412100929482752),(77,1,-1),(78,1,1260412099998347264);
/*!40000 ALTER TABLE `sys_role_data_perm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role_menu`
--

DROP TABLE IF EXISTS `sys_role_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_role_menu` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `role_id` bigint DEFAULT NULL COMMENT '角色ID',
  `menu_id` bigint DEFAULT NULL COMMENT '菜单ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4901 DEFAULT CHARSET=utf8mb3 COMMENT='角色与菜单对应关系';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role_menu`
--

LOCK TABLES `sys_role_menu` WRITE;
/*!40000 ALTER TABLE `sys_role_menu` DISABLE KEYS */;
INSERT INTO `sys_role_menu` VALUES (367,44,1),(368,44,32),(369,44,33),(370,44,34),(371,44,35),(372,44,28),(373,44,29),(374,44,30),(375,44,38),(376,44,4),(377,44,27),(378,45,38),(379,46,3),(380,46,20),(381,46,21),(382,46,22),(383,46,23),(384,46,11),(385,46,12),(386,46,13),(387,46,14),(388,46,24),(389,46,25),(390,46,26),(391,46,15),(392,46,2),(393,46,6),(394,46,7),(598,50,38),(632,38,42),(737,51,38),(738,51,39),(739,51,40),(740,51,41),(741,51,4),(742,51,32),(743,51,33),(744,51,34),(745,51,35),(746,51,27),(747,51,28),(748,51,29),(749,51,30),(750,51,1),(1064,54,53),(1095,55,2),(1096,55,6),(1097,55,7),(1098,55,3),(1099,55,50),(1100,55,49),(1101,55,1),(1856,53,28),(1857,53,29),(1858,53,30),(1859,53,27),(1860,53,57),(1861,53,71),(1862,53,48),(1863,53,72),(1864,53,1),(1865,53,7),(1866,53,55),(1867,53,56),(1868,53,62),(1869,53,15),(1870,53,2),(1871,53,61),(1872,53,20),(1873,53,21),(1874,53,22),(2084,56,68),(2085,56,60),(2086,56,59),(2087,56,58),(2088,56,51),(2089,56,50),(2090,56,49),(2243,48,72),(2247,63,-1),(2248,63,84),(2249,63,85),(2250,63,88),(2251,63,87),(2252,64,84),(2253,64,89),(2254,64,88),(2255,64,87),(2256,64,86),(2257,64,85),(2258,65,89),(2259,65,88),(2260,65,86),(2262,67,48),(2263,68,88),(2264,68,87),(2265,69,89),(2266,69,88),(2267,69,86),(2268,69,87),(2269,69,85),(2270,69,84),(2271,70,85),(2272,70,89),(2273,70,88),(2274,70,87),(2275,70,86),(2276,70,84),(2277,71,87),(2278,72,59),(2279,73,48),(2280,74,88),(2281,74,87),(2282,75,88),(2283,75,87),(2284,76,85),(2285,76,89),(2286,76,88),(2287,76,87),(2288,76,86),(2289,76,84),(2292,78,88),(2293,78,87),(2294,78,NULL),(2295,78,NULL),(2296,78,NULL),(2308,80,87),(2309,80,86),(2310,80,-1),(2311,80,84),(2312,80,85),(2328,79,72),(2329,79,48),(2330,79,77),(2331,79,84),(2332,79,89),(2333,79,88),(2334,79,87),(2335,79,86),(2336,79,85),(2337,79,-1),(2338,77,89),(2339,77,88),(2340,77,87),(2341,77,86),(2342,77,85),(2343,77,84),(2344,77,72),(2345,77,-1),(2346,77,77),(2974,57,93),(2975,57,99),(2976,57,95),(2977,57,101),(2978,57,96),(2979,57,94),(2980,57,-1),(2981,58,93),(2982,58,99),(2983,58,95),(2984,58,101),(2985,58,96),(2986,58,94),(2987,58,-1),(3232,59,98),(3233,59,101),(3234,59,99),(3235,59,95),(3236,59,90),(3237,59,89),(3238,59,88),(3239,59,87),(3240,59,86),(3241,59,68),(3242,59,60),(3243,59,59),(3244,59,58),(3245,59,51),(3246,59,76),(3247,59,75),(3248,59,74),(3249,59,62),(3250,59,56),(3251,59,55),(3252,59,15),(3253,59,26),(3254,59,25),(3255,59,24),(3256,59,14),(3257,59,13),(3258,59,12),(3259,59,61),(3260,59,22),(3261,59,21),(3262,59,20),(3263,59,83),(3264,59,81),(3265,59,80),(3266,59,79),(3267,59,71),(3268,59,97),(3269,59,96),(3270,59,94),(3271,59,93),(3272,59,85),(3273,59,84),(3274,59,50),(3275,59,49),(3276,59,73),(3277,59,7),(3278,59,6),(3279,59,2),(3280,59,3),(3281,59,78),(3282,59,1),(3283,59,-1),(4611,61,208),(4612,61,207),(4613,61,206),(4614,61,205),(4615,61,204),(4616,61,92),(4617,61,57),(4618,61,30),(4619,61,29),(4620,61,28),(4621,61,104),(4622,61,48),(4623,61,214),(4624,61,213),(4625,61,212),(4626,61,211),(4627,61,210),(4628,61,76),(4629,61,75),(4630,61,74),(4631,61,62),(4632,61,56),(4633,61,55),(4634,61,15),(4635,61,26),(4636,61,25),(4637,61,24),(4638,61,14),(4639,61,13),(4640,61,12),(4641,61,61),(4642,61,22),(4643,61,21),(4644,61,20),(4645,61,83),(4646,61,81),(4647,61,80),(4648,61,79),(4649,61,71),(4650,61,203),(4651,61,202),(4652,61,27),(4653,61,91),(4654,61,77),(4655,61,209),(4656,61,73),(4657,61,7),(4658,61,6),(4659,61,2),(4660,61,3),(4661,61,78),(4662,61,1),(4663,61,-1),(4664,60,92),(4665,60,57),(4666,60,30),(4667,60,29),(4668,60,28),(4669,60,104),(4670,60,48),(4671,60,76),(4672,60,75),(4673,60,74),(4674,60,62),(4675,60,56),(4676,60,55),(4677,60,15),(4678,60,26),(4679,60,25),(4680,60,24),(4681,60,14),(4682,60,13),(4683,60,12),(4684,60,61),(4685,60,22),(4686,60,21),(4687,60,20),(4688,60,83),(4689,60,81),(4690,60,80),(4691,60,79),(4692,60,71),(4693,60,27),(4694,60,91),(4695,60,77),(4696,60,73),(4697,60,7),(4698,60,6),(4699,60,2),(4700,60,78),(4701,60,1),(4702,60,-1),(4703,60,3),(4764,1,227),(4765,1,226),(4766,1,225),(4767,1,224),(4768,1,223),(4769,1,208),(4770,1,207),(4771,1,206),(4772,1,205),(4773,1,204),(4774,1,92),(4775,1,57),(4776,1,30),(4777,1,29),(4778,1,28),(4779,1,104),(4780,1,48),(4781,1,214),(4782,1,213),(4783,1,212),(4784,1,211),(4785,1,210),(4786,1,76),(4787,1,75),(4788,1,74),(4789,1,62),(4790,1,56),(4791,1,55),(4792,1,15),(4793,1,26),(4794,1,25),(4795,1,24),(4796,1,14),(4797,1,13),(4798,1,12),(4799,1,61),(4800,1,22),(4801,1,21),(4802,1,20),(4803,1,83),(4804,1,81),(4805,1,80),(4806,1,79),(4807,1,71),(4808,1,222),(4809,1,203),(4810,1,202),(4811,1,27),(4812,1,91),(4813,1,77),(4814,1,209),(4815,1,73),(4816,1,7),(4817,1,6),(4818,1,2),(4819,1,3),(4820,1,78),(4821,1,1),(4822,1,228),(4823,1,233),(4824,1,232),(4825,1,231),(4826,1,230),(4827,1,229),(4828,1,221),(4829,1,-1),(4888,1,234),(4889,1,246),(4890,1,245),(4891,1,244),(4892,1,243),(4893,1,242),(4894,1,240),(4895,1,239),(4896,1,238),(4897,1,237),(4898,1,236),(4899,1,241),(4900,1,235);
/*!40000 ALTER TABLE `sys_role_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user`
--

DROP TABLE IF EXISTS `sys_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_user` (
  `user_id` bigint NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL COMMENT '用户名',
  `name` varchar(100) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL COMMENT '密码',
  `dept_id` bigint DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL COMMENT '邮箱',
  `mobile` varchar(100) DEFAULT NULL COMMENT '手机号',
  `status` tinyint DEFAULT NULL COMMENT '状态 0:禁用，1:正常',
  `user_id_create` bigint DEFAULT NULL COMMENT '创建用户id',
  `gmt_create` datetime DEFAULT NULL COMMENT '创建时间',
  `gmt_modified` datetime DEFAULT NULL COMMENT '修改时间',
  `sex` bigint DEFAULT NULL COMMENT '性别',
  `birth` datetime DEFAULT NULL COMMENT '出身日期',
  `pic_id` bigint DEFAULT NULL,
  `live_address` varchar(500) DEFAULT NULL COMMENT '现居住地',
  `hobby` varchar(255) DEFAULT NULL COMMENT '爱好',
  `province` varchar(255) DEFAULT NULL COMMENT '省份',
  `city` varchar(255) DEFAULT NULL COMMENT '所在城市',
  `district` varchar(255) DEFAULT NULL COMMENT '所在地区',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user`
--

LOCK TABLES `sys_user` WRITE;
/*!40000 ALTER TABLE `sys_user` DISABLE KEYS */;
INSERT INTO `sys_user` VALUES (1,'admin','超级管理员','780184818d60ac8dc6261940ffe51c63',14,'admin@example.com','17699999999',1,1,'2017-08-15 21:40:39','2017-08-15 21:41:00',96,'2017-12-14 00:00:00',148,'ccc','122;121;','北京市','北京市市辖区','东城区');
/*!40000 ALTER TABLE `sys_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user_role`
--

DROP TABLE IF EXISTS `sys_user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_user_role` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint DEFAULT NULL COMMENT '用户ID',
  `role_id` bigint DEFAULT NULL COMMENT '角色ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=137 DEFAULT CHARSET=utf8mb3 COMMENT='用户与角色对应关系';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user_role`
--

LOCK TABLES `sys_user_role` WRITE;
/*!40000 ALTER TABLE `sys_user_role` DISABLE KEYS */;
INSERT INTO `sys_user_role` VALUES (73,30,48),(74,30,49),(75,30,50),(76,31,48),(77,31,49),(78,31,52),(79,32,48),(80,32,49),(81,32,50),(82,32,51),(83,32,52),(84,33,38),(85,33,49),(86,33,52),(87,34,50),(88,34,51),(89,34,52),(106,124,1),(110,1,1),(111,2,1),(113,131,48),(117,135,1),(120,134,1),(121,134,48),(123,130,1),(124,NULL,48),(125,132,52),(126,132,49),(127,123,48),(132,36,48),(133,137,61),(134,137,60),(135,138,61),(136,138,60);
/*!40000 ALTER TABLE `sys_user_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `test`
--

DROP TABLE IF EXISTS `test`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `test` (
  `id` int NOT NULL,
  `test` tinyint(1) unsigned zerofill DEFAULT NULL,
  `test2` tinyint(4) unsigned zerofill DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test`
--

LOCK TABLES `test` WRITE;
/*!40000 ALTER TABLE `test` DISABLE KEYS */;
/*!40000 ALTER TABLE `test` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(50) NOT NULL COMMENT '登录名',
  `password` varchar(100) NOT NULL COMMENT '登录密码',
  `nick_name` varchar(50) DEFAULT NULL COMMENT '昵称',
  `user_photo` varchar(100) DEFAULT NULL COMMENT '用户头像',
  `user_sex` tinyint(1) DEFAULT NULL COMMENT '用户性别，0：男，1：女',
  `account_balance` bigint NOT NULL DEFAULT '0' COMMENT '账户余额',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '用户状态，0：正常',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_uq_username` (`username`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1579033406501695489 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1551834843753619456,'17754889839','f9c973ba8fc512e6bbc893794dbdc3c8','17754889839','/localPic/2022/09/17/65477a38736e4f6cb10534bbcdbc1f7f.jpeg',NULL,991,0,'2022-07-26 15:40:33','2022-09-17 23:09:15'),(1579033406501695488,'17754889833','3620f4c1a1600f9a80c9003222dcac4d','17754889833',NULL,NULL,0,0,'2022-10-09 16:57:56','2022-10-09 16:57:56');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_bookshelf`
--

DROP TABLE IF EXISTS `user_bookshelf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_bookshelf` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `book_id` bigint NOT NULL COMMENT '小说ID',
  `pre_content_id` bigint DEFAULT NULL COMMENT '上一次阅读的章节内容表ID',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_uq_userid_bookid` (`user_id`,`book_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户书架表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_bookshelf`
--

LOCK TABLES `user_bookshelf` WRITE;
/*!40000 ALTER TABLE `user_bookshelf` DISABLE KEYS */;
INSERT INTO `user_bookshelf` VALUES (37,1255060328322027520,1254957312633352192,3335449,'2020-04-30 07:27:23','2020-04-30 19:37:36'),(38,1255664783722586112,1254674396451897344,1254674396690972672,'2020-04-30 09:06:53','2020-04-30 09:06:59'),(39,1255060328322027520,1254681071191785472,1254681071552495616,'2020-04-30 09:37:47',NULL),(40,1255060328322027520,1254676970567565312,3264258,'2020-04-30 09:57:18','2020-04-30 19:19:11'),(41,1255060328322027520,1254675594315759616,1254675594496114688,'2020-04-30 18:37:18',NULL),(42,1548290516624515072,4,1551836709287792640,'2022-08-16 15:10:20','2022-08-18 08:30:37'),(43,1548290516624515072,7,1558289371067834368,'2022-08-16 15:11:11','2022-08-18 08:26:12');
/*!40000 ALTER TABLE `user_bookshelf` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_buy_record`
--

DROP TABLE IF EXISTS `user_buy_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_buy_record` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `book_id` bigint DEFAULT NULL COMMENT '购买的小说ID',
  `book_name` varchar(50) DEFAULT NULL COMMENT '购买的小说名',
  `book_index_id` bigint DEFAULT NULL COMMENT '购买的章节ID',
  `book_index_name` varchar(100) DEFAULT NULL COMMENT '购买的章节名',
  `buy_amount` int DEFAULT NULL COMMENT '购买使用的屋币数量',
  `create_time` datetime DEFAULT NULL COMMENT '购买时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_userId_indexId` (`user_id`,`book_index_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户消费记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_buy_record`
--

LOCK TABLES `user_buy_record` WRITE;
/*!40000 ALTER TABLE `user_buy_record` DISABLE KEYS */;
INSERT INTO `user_buy_record` VALUES (1,1255060328322027520,1260400284744613890,'我是一只消消乐2',1260522024606953472,'第三章',10,'2020-05-13 21:29:09'),(2,1255060328322027520,1260400284744613890,'我是一只消消乐2',1260564410687107072,'第四章',10,'2020-05-13 21:40:38'),(3,1548290516624515072,4,'test4',1550839339917914112,'测试付费章节',9,'2022-07-23 21:45:19'),(4,1551834843753619456,4,'test4',1550839339917914112,'测试付费章节',9,'2022-07-26 15:42:02'),(5,1551836812819992576,4,'test4',1550839339917914112,'测试付费章节',9,'2022-07-26 15:50:32');
/*!40000 ALTER TABLE `user_buy_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_comment`
--

DROP TABLE IF EXISTS `user_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_comment` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint unsigned NOT NULL COMMENT '评论用户ID',
  `book_id` bigint unsigned NOT NULL COMMENT '评论小说ID',
  `comment_content` varchar(512) NOT NULL COMMENT '评价内容',
  `reply_count` int unsigned NOT NULL DEFAULT '0' COMMENT '回复数量',
  `audit_status` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '审核状态;0-待审核 1-审核通过 2-审核不通过',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_bookId_userId` (`book_id`,`user_id`),
  UNIQUE KEY `pk_id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户评论';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_comment`
--

LOCK TABLES `user_comment` WRITE;
/*!40000 ALTER TABLE `user_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_comment_reply`
--

DROP TABLE IF EXISTS `user_comment_reply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_comment_reply` (
  `id` bigint unsigned NOT NULL COMMENT '主键',
  `comment_id` bigint unsigned NOT NULL COMMENT '评论ID',
  `user_id` bigint unsigned NOT NULL COMMENT '回复用户ID',
  `reply_content` varchar(512) NOT NULL COMMENT '回复内容',
  `audit_status` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '审核状态;0-待审核 1-审核通过 2-审核不通过',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `pk_id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户评论回复';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_comment_reply`
--

LOCK TABLES `user_comment_reply` WRITE;
/*!40000 ALTER TABLE `user_comment_reply` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_comment_reply` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_consume_log`
--

DROP TABLE IF EXISTS `user_consume_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_consume_log` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint unsigned NOT NULL COMMENT '消费用户ID',
  `amount` int unsigned NOT NULL COMMENT '消费使用的金额;单位：屋币',
  `product_type` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '消费商品类型;0-小说VIP章节',
  `product_id` bigint unsigned DEFAULT NULL COMMENT '消费的的商品ID;例如：章节ID',
  `produc_name` varchar(50) DEFAULT NULL COMMENT '消费的的商品名;例如：章节名',
  `produc_value` int unsigned DEFAULT NULL COMMENT '消费的的商品值;例如：1',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `pk_id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户消费记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_consume_log`
--

LOCK TABLES `user_consume_log` WRITE;
/*!40000 ALTER TABLE `user_consume_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_consume_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_feedback`
--

DROP TABLE IF EXISTS `user_feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_feedback` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `user_id` bigint DEFAULT NULL COMMENT '用户id',
  `content` varchar(512) DEFAULT NULL COMMENT '反馈内容',
  `create_time` datetime DEFAULT NULL COMMENT '反馈时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_feedback`
--

LOCK TABLES `user_feedback` WRITE;
/*!40000 ALTER TABLE `user_feedback` DISABLE KEYS */;
INSERT INTO `user_feedback` VALUES (8,1255060328322027520,'好战，多点书','2020-04-30 08:58:49'),(9,1548290516624515072,'的点点滴滴多多','2022-08-18 08:49:18'),(10,1548290516624515072,'反馈测试13解决的基督教','2022-08-18 09:04:25'),(11,1548290516624515072,'反馈测试13解决的基督教','2022-08-18 09:05:58'),(12,1548290516624515072,'反馈测试13解决的基督教 111','2022-08-18 09:06:05');
/*!40000 ALTER TABLE `user_feedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_info`
--

DROP TABLE IF EXISTS `user_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_info` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL COMMENT '登录名',
  `password` varchar(100) NOT NULL COMMENT '登录密码-加密',
  `salt` varchar(8) NOT NULL COMMENT '加密盐值',
  `nick_name` varchar(50) DEFAULT NULL COMMENT '昵称',
  `user_photo` varchar(100) DEFAULT NULL COMMENT '用户头像',
  `user_sex` tinyint unsigned DEFAULT NULL COMMENT '用户性别;0-男 1-女',
  `account_balance` bigint unsigned NOT NULL DEFAULT '0' COMMENT '账户余额',
  `status` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '用户状态;0-正常',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_username` (`username`),
  UNIQUE KEY `pk_id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_info`
--

LOCK TABLES `user_info` WRITE;
/*!40000 ALTER TABLE `user_info` DISABLE KEYS */;
INSERT INTO `user_info` VALUES (1,'17754889839','f9c973ba8fc512e6bbc893794dbdc3c8','0','17754889839',NULL,NULL,0,0,'2022-07-04 23:15:34','2022-07-04 23:15:34');
/*!40000 ALTER TABLE `user_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_pay_log`
--

DROP TABLE IF EXISTS `user_pay_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_pay_log` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL COMMENT '充值用户ID',
  `pay_channel` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '充值方式;0-支付宝 1-微信',
  `out_trade_no` varchar(64) NOT NULL COMMENT '商户订单号',
  `amount` int unsigned NOT NULL COMMENT '充值金额;单位：分',
  `product_type` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '充值商品类型;0-屋币 1-包年VIP',
  `product_id` bigint unsigned DEFAULT NULL COMMENT '充值商品ID',
  `product_name` varchar(255) NOT NULL COMMENT '充值商品名;示例值：屋币',
  `product_value` int unsigned DEFAULT NULL COMMENT '充值商品值;示例值：255',
  `pay_time` datetime NOT NULL COMMENT '充值时间',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `pk_id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户充值记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_pay_log`
--

LOCK TABLES `user_pay_log` WRITE;
/*!40000 ALTER TABLE `user_pay_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_pay_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_read_history`
--

DROP TABLE IF EXISTS `user_read_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_read_history` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `book_id` bigint NOT NULL COMMENT '小说ID',
  `pre_content_id` bigint DEFAULT NULL COMMENT '上一次阅读的章节内容表ID',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_uq_userid_bookid` (`user_id`,`book_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=706 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户阅读记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_read_history`
--

LOCK TABLES `user_read_history` WRITE;
/*!40000 ALTER TABLE `user_read_history` DISABLE KEYS */;
INSERT INTO `user_read_history` VALUES (49,1255060328322027520,1254944717113274368,1254944717314600960,'2020-04-28 17:05:48','2020-04-28 17:05:48'),(52,1255060328322027520,1254944968184311808,1254944969023172608,'2020-04-28 17:12:31','2020-04-28 17:12:31'),(53,1255379610071322624,1254682148440047616,1254682148729454592,'2020-04-29 14:13:28','2020-04-29 14:13:28'),(54,1255379610071322624,1254676970567565312,1254676970794057728,'2020-04-29 14:17:36','2020-04-29 14:17:36'),(60,1255060328322027520,1254677251162308608,1254677251367829504,'2020-04-30 07:32:03','2020-04-30 07:32:03'),(61,1255060328322027520,1254677887534694400,1254677887790546944,'2020-04-30 07:36:03','2020-04-30 07:36:03'),(64,1255060328322027520,1254678892443795456,1254678893156827136,'2020-04-30 08:34:00','2020-04-30 08:34:00'),(65,1255664783722586112,1254674396451897344,1254674396690972672,'2020-04-30 09:06:59','2020-04-30 09:06:59'),(66,1255664783722586112,1254945413401292800,1254945551112876032,'2020-04-30 09:09:46','2020-04-30 09:09:46'),(68,1255664783722586112,1254681071191785472,1254681071552495616,'2020-04-30 09:14:31','2020-04-30 09:14:31'),(75,1255060328322027520,1254677745226153984,1254677746505416704,'2020-04-30 09:53:17','2020-04-30 09:53:17'),(90,1255060328322027520,1254681753466634240,1254681754687176704,'2020-04-30 10:47:47','2020-04-30 10:47:47'),(91,1255060328322027520,1254943211274252288,1254943211462995968,'2020-04-30 10:53:51','2020-04-30 10:53:51'),(104,1255060328322027520,1254675826696978432,3263201,'2020-04-30 18:53:02','2020-04-30 18:53:02'),(111,1255060328322027520,1254957626056912896,3336649,'2020-04-30 19:11:57','2020-04-30 19:11:57'),(113,1255060328322027520,1254676970567565312,3264258,'2020-04-30 19:19:11','2020-04-30 19:19:11'),(117,1255060328322027520,1254946661743603712,1254946914001629184,'2020-04-30 19:37:09','2020-04-30 19:37:09'),(118,1255060328322027520,1254957312633352192,3335449,'2020-04-30 19:37:36','2020-04-30 19:37:36'),(142,1539515167128186880,1,1539521729305538560,'2022-06-22 21:27:41','2022-06-22 21:27:41'),(145,1546715035601108992,3,1546760243088871424,'2022-07-12 15:39:10','2022-07-12 15:39:10'),(153,1546715035601108992,2,1548209604536733696,'2022-07-16 15:36:34','2022-07-16 15:36:34'),(406,1551836812819992576,4,1550839339917914112,'2022-07-26 15:56:18','2022-07-26 15:56:18'),(424,1548290516624515072,2,1546715404372705280,'2022-08-16 20:15:43','2022-08-16 20:15:43'),(425,1548290516624515072,7,1558289371067834368,'2022-08-18 08:26:12','2022-08-18 08:26:12'),(426,1548290516624515072,4,1551836709287792640,'2022-08-18 08:30:37','2022-08-18 08:30:37'),(440,1551834843753619456,2,1546715404372705280,'2022-08-19 19:28:39','2022-08-19 19:28:39'),(445,1551834843753619456,15,1560598094989635584,'2022-08-19 23:26:22','2022-08-19 23:26:22'),(454,1551834843753619456,4,1548290825925074944,'2022-08-22 23:39:44','2022-08-22 23:39:44'),(473,1563418122722193408,17,1563447495584043008,'2022-08-27 16:59:13','2022-08-27 16:59:13'),(476,1551834843753619456,18,1563752931038216192,'2022-08-28 13:00:09','2022-08-28 13:00:09'),(506,1563418122722193408,18,1563872334904029184,'2022-08-29 00:25:59','2022-08-29 00:25:59'),(508,1563418122722193408,19,1563926151733321728,'2022-08-29 09:53:52','2022-08-29 09:53:52'),(523,1563418122722193408,4,1550840735153139712,'2022-08-29 11:13:01','2022-08-29 11:13:01'),(533,1563418122722193408,20,1564089505995173888,'2022-08-29 12:51:44','2022-08-29 12:51:44'),(541,1564143073913704448,24,1564146537704144896,'2022-08-29 15:03:13','2022-08-29 15:03:13'),(545,1564147259887800320,25,1564151408209616896,'2022-08-29 15:22:59','2022-08-29 15:22:59'),(547,1564152438620086272,26,1564174323965747200,'2022-08-29 16:53:58','2022-08-29 16:53:58'),(548,1564189495946010624,27,1564190457993609216,'2022-08-29 17:57:47','2022-08-29 17:57:47'),(551,1564250653516341248,27,1564190774315343872,'2022-08-29 22:04:08','2022-08-29 22:04:08'),(552,1564250653516341248,29,1564252435160219648,'2022-08-29 22:04:23','2022-08-29 22:04:23'),(553,1564254970935660544,30,1564257836886908928,'2022-08-29 22:25:33','2022-08-29 22:25:33'),(581,1564500007003082752,31,1564503543870812160,'2022-08-30 23:51:33','2022-08-30 23:51:33'),(582,1564500007003082752,30,1564258142391521280,'2022-08-30 23:51:34','2022-08-30 23:51:34'),(583,1564500007003082752,29,1564252800005959680,'2022-08-30 23:51:36','2022-08-30 23:51:36'),(584,1564500007003082752,28,1564201941196804096,'2022-08-30 23:51:38','2022-08-30 23:51:38'),(585,1564500007003082752,27,1564190775032569856,'2022-08-30 23:51:39','2022-08-30 23:51:39'),(586,1564500007003082752,26,1564181027063279616,'2022-08-30 23:51:41','2022-08-30 23:51:41'),(587,1564500007003082752,25,1564149790386900992,'2022-08-30 23:51:43','2022-08-30 23:51:43'),(588,1564500007003082752,24,1564146537498624000,'2022-08-30 23:51:45','2022-08-30 23:51:45'),(589,1564500007003082752,23,1564141063889920000,'2022-08-30 23:51:46','2022-08-30 23:51:46'),(614,1564116447956025344,42,1566680840233271296,'2022-09-16 22:04:47','2022-09-16 22:04:47'),(618,1564116447956025344,27,1564190774315343872,'2022-09-17 23:06:24','2022-09-17 23:06:24'),(634,1564116447956025344,23,1572923150793105408,'2022-09-22 20:56:03','2022-09-22 20:56:03'),(694,1551834843753619456,42,1566680840233271296,'2022-10-09 16:52:08','2022-10-09 16:52:08'),(695,1579033406501695488,42,1566680840233271296,'2022-10-09 16:58:08','2022-10-09 16:58:08'),(705,1551834843753619456,23,1564141063491461120,'2022-10-16 14:57:00','2022-10-16 14:57:00');
/*!40000 ALTER TABLE `user_read_history` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-10-16 20:41:42
