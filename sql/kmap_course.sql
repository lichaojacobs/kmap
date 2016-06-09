CREATE DATABASE  IF NOT EXISTS `kmap` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `kmap`;
-- MySQL dump 10.13  Distrib 5.7.9, for osx10.9 (x86_64)
--
-- Host: 127.0.0.1    Database: kmap
-- ------------------------------------------------------
-- Server version	5.7.9

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
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `info` varchar(1500) DEFAULT NULL,
  `category` int(10) unsigned DEFAULT NULL,
  `property` int(10) unsigned DEFAULT NULL,
  `courseCode` int(11) DEFAULT NULL,
  `credit` double DEFAULT NULL COMMENT '课程学分',
  `academyId` int(11) DEFAULT NULL COMMENT '所属学院',
  PRIMARY KEY (`id`),
  KEY `category` (`category`),
  KEY `property` (`property`),
  CONSTRAINT `course_ibfk_1` FOREIGN KEY (`category`) REFERENCES `category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `course_ibfk_2` FOREIGN KEY (`property`) REFERENCES `property` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course`
--

LOCK TABLES `course` WRITE;
/*!40000 ALTER TABLE `course` DISABLE KEYS */;
INSERT INTO `course` VALUES (1,'高等数学2A',NULL,3,7,102,6,209),(2,'高等数学2B',NULL,3,7,103,5,209),(4,'概率论',NULL,3,7,105,3,209),(5,'大学物理概论',NULL,3,8,106,4,209),(6,'物理实验A',NULL,3,8,107,2,209),(7,'大学计算机基础',NULL,3,9,108,0,209),(8,'计算机软件技术基础',NULL,3,9,109,2.5,209),(9,'管理学',NULL,4,10,110,3,209),(10,'经济学',NULL,4,10,111,4,209),(11,'离散数学',NULL,4,10,113,3,209),(12,'面向对象的程序设计',NULL,4,10,114,3,209),(13,'应用统计学',NULL,4,10,115,3,209),(14,'企业运营管理',NULL,4,10,116,2,209),(15,'经济法',NULL,4,10,117,2,209),(16,'工程经济学',NULL,4,10,118,3,209),(17,'数据结构',NULL,4,10,119,3,209),(18,'数据库原理与技术',NULL,4,10,120,4,209),(19,'会计学',NULL,4,10,121,4,209),(20,'运筹学',NULL,4,10,122,4,209),(21,'企业财务管理',NULL,4,10,123,3,209),(22,'学科与专业导论',NULL,4,10,124,2,209),(23,'计算机硬件与集成',NULL,4,10,125,3,209),(24,'JAVA与J2EE',NULL,4,10,126,3,209),(25,'数值计算方法',NULL,4,10,127,2.5,209),(26,'计算机网络基础与应用',NULL,4,10,128,4,209),(27,'计算机信息安全',NULL,4,10,129,3,209),(28,'UML原理与应用',NULL,4,10,130,2.5,209),(29,'系统软件原理与技术',NULL,4,10,131,3,209),(30,'信息系统分析与设计',NULL,5,11,132,4,209),(31,'IT项目管理',NULL,5,11,133,3,209),(32,'人工智能与专家系统',NULL,5,12,134,3,209),(33,'ERP与供应链管理',NULL,5,12,135,3,209),(34,'数据仓库与数据挖掘',NULL,5,12,136,3,209),(35,'基于图形处理的信息系统',NULL,5,12,137,2,209),(36,'专业前沿讨论班',NULL,7,16,138,2,209),(37,'信息系统案例分析',NULL,7,16,139,2,209),(38,'电子商务概论',NULL,7,17,140,2,209),(39,'信息经济学',NULL,7,17,141,2,209),(40,'专业课程设计',NULL,6,13,142,4.5,209),(41,'计算机综合练习',NULL,6,13,143,3,209),(42,'多媒体技术实践',NULL,6,13,144,3,209),(43,'认识实习',NULL,6,14,145,2,209),(44,'社会调查',NULL,6,14,146,2,209),(45,'企业运营模拟(ERP沙盘)',NULL,6,14,147,2,209),(46,'毕业设计(论文)',NULL,6,15,148,4,209),(47,'计算机软件基础',NULL,4,4,1,3,999),(48,'经济学原理',NULL,4,4,2,3,999),(50,'面向对象程序设计',NULL,4,4,4,4,999),(51,'数据结构1',NULL,4,4,6,4,999),(52,'计算机网络',NULL,4,4,7,4,999),(53,'数据库原理与技术',NULL,4,4,8,4,999),(54,'系统分析与设计',NULL,4,4,9,4.5,999),(55,'ERP',NULL,4,4,10,3,999),(56,'运筹学1',NULL,4,4,11,4,999),(57,'应用统计学1',NULL,4,4,12,3,999),(58,'企业运营管理1',NULL,4,4,13,3,999),(59,'数据仓储与数据挖掘1',NULL,4,4,14,3,999),(60,'数据结构3',NULL,4,9,10200,4,1000),(61,'操作系统',NULL,4,9,10201,4,1000),(62,'计算机网络',NULL,4,9,10202,4.5,1000),(63,'Java程序设计',NULL,4,9,10203,3,1000),(64,'C+＋程序设计',NULL,4,9,10204,4,1000),(65,'数据库设计',NULL,4,9,10205,4,1000),(66,'数据仓储与数据挖掘1',NULL,4,9,10206,3,1000);
/*!40000 ALTER TABLE `course` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-03-17 11:23:58
