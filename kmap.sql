/*
SQLyog Ultimate v11.24 (32 bit)
MySQL - 5.6.24 : Database - kmap
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`kmap` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `kmap`;

/*Table structure for table `academy` */

DROP TABLE IF EXISTS `academy`;

CREATE TABLE `academy` (
  `codeNumber` int(11) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `academy` */

insert  into `academy`(`codeNumber`,`name`,`id`) values (209,'管理与经济学部',1),(210,'计算机科学与技术',2);

/*Table structure for table `bonus` */

DROP TABLE IF EXISTS `bonus`;

CREATE TABLE `bonus` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `info` text NOT NULL,
  `score` int(11) DEFAULT NULL COMMENT '得分: 采用投票机制',
  `user` int(10) unsigned DEFAULT NULL,
  `detail` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user` (`user`),
  KEY `detail` (`detail`),
  CONSTRAINT `bonus_ibfk_1` FOREIGN KEY (`user`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `bonus_ibfk_2` FOREIGN KEY (`detail`) REFERENCES `detail` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `bonus` */

/*Table structure for table `category` */

DROP TABLE IF EXISTS `category`;

CREATE TABLE `category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `color` varchar(8) DEFAULT '#000000',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

/*Data for the table `category` */

insert  into `category`(`id`,`name`,`color`) values (1,'人文与社会科学类','#209643'),(2,'训练与健康类','#967720'),(3,'数学与自然科学类','#EF7957'),(4,'学科基础类','#A21B4C'),(5,'专业类','#7F1BA2'),(6,'集中实践类','#6160CB'),(7,'创新与研修类','#60CBC1');

/*Table structure for table `cc` */

DROP TABLE IF EXISTS `cc`;

CREATE TABLE `cc` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tail` int(10) unsigned DEFAULT NULL COMMENT '前驱课程',
  `head` int(10) unsigned DEFAULT NULL COMMENT '后继课程',
  PRIMARY KEY (`id`),
  KEY `tail` (`tail`),
  KEY `head` (`head`),
  CONSTRAINT `cc_ibfk_1` FOREIGN KEY (`tail`) REFERENCES `course` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `cc_ibfk_2` FOREIGN KEY (`head`) REFERENCES `course` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8;

/*Data for the table `cc` */

insert  into `cc`(`id`,`tail`,`head`) values (1,1,13),(2,1,20),(3,1,4),(4,1,2),(5,2,13),(6,2,20),(7,2,4),(8,3,13),(9,3,20),(10,4,13),(11,4,20),(12,7,23),(13,7,42),(14,7,29),(15,7,26),(16,7,8),(17,8,12),(18,8,18),(19,9,33),(20,9,16),(21,9,14),(22,10,14),(23,10,39),(24,10,15),(25,10,16),(26,11,27),(27,11,26),(28,11,32),(29,11,17),(30,12,30),(31,12,32),(32,12,45),(33,12,24),(34,12,31),(35,13,14),(36,13,44),(37,14,30),(38,17,44),(39,17,12),(40,17,18),(41,18,30),(42,18,31),(43,18,44),(44,18,32),(45,19,21),(46,19,14),(47,20,13),(48,20,14),(49,21,14),(50,23,26),(51,24,28),(52,25,28),(53,25,1),(54,25,3),(55,25,4),(56,26,30),(57,29,30),(58,31,30),(59,33,14),(60,44,32),(61,38,14),(62,39,38);

/*Table structure for table `course` */

DROP TABLE IF EXISTS `course`;

CREATE TABLE `course` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `info` varchar(1500) DEFAULT NULL,
  `category` int(10) unsigned DEFAULT NULL,
  `property` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `category` (`category`),
  KEY `property` (`property`),
  CONSTRAINT `course_ibfk_1` FOREIGN KEY (`category`) REFERENCES `category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `course_ibfk_2` FOREIGN KEY (`property`) REFERENCES `property` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8;

/*Data for the table `course` */

insert  into `course`(`id`,`name`,`info`,`category`,`property`) values (1,'高等数学2A',NULL,3,7),(2,'高等数学2B',NULL,3,7),(3,'线性代数及其应用',NULL,3,7),(4,'概率论',NULL,3,7),(5,'大学物理概论',NULL,3,8),(6,'物理实验A',NULL,3,8),(7,'大学计算机基础',NULL,3,9),(8,'计算机软件技术基础',NULL,3,9),(9,'管理学',NULL,4,10),(10,'经济学',NULL,4,10),(11,'离散数学',NULL,4,10),(12,'面向对象的程序设计',NULL,4,10),(13,'应用统计学',NULL,4,10),(14,'企业运营管理',NULL,4,10),(15,'经济法',NULL,4,10),(16,'工程经济学',NULL,4,10),(17,'数据结构',NULL,4,10),(18,'数据库原理与技术',NULL,4,10),(19,'会计学',NULL,4,10),(20,'运筹学',NULL,4,10),(21,'企业财务管理',NULL,4,10),(22,'学科与专业导论',NULL,4,10),(23,'计算机硬件与集成',NULL,4,10),(24,'JAVA与J2EE',NULL,4,10),(25,'数值计算方法',NULL,4,10),(26,'计算机网络基础与应用',NULL,4,10),(27,'计算机信息安全',NULL,4,10),(28,'UML原理与应用',NULL,4,10),(29,'系统软件原理与技术',NULL,4,10),(30,'信息系统分析与设计',NULL,5,11),(31,'IT项目管理',NULL,5,11),(32,'人工智能与专家系统',NULL,5,12),(33,'ERP与供应链管理',NULL,5,12),(34,'数据仓库与数据挖掘',NULL,5,12),(35,'基于图形处理的信息系统',NULL,5,12),(36,'专业前沿讨论班',NULL,7,16),(37,'信息系统案例分析',NULL,7,16),(38,'电子商务概论',NULL,7,17),(39,'信息经济学',NULL,7,17),(40,'专业课程设计',NULL,6,13),(41,'计算机综合练习',NULL,6,13),(42,'多媒体技术实践',NULL,6,13),(43,'认识实习',NULL,6,14),(44,'社会调查',NULL,6,14),(45,'企业运营模拟(ERP沙盘)',NULL,6,14),(46,'毕业设计(论文)',NULL,6,15);

/*Table structure for table `dd` */

DROP TABLE IF EXISTS `dd`;

CREATE TABLE `dd` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tail` int(10) unsigned DEFAULT NULL COMMENT '大粒度知识点',
  `head` int(10) unsigned DEFAULT NULL COMMENT '小粒度知识点',
  PRIMARY KEY (`id`),
  KEY `tail` (`tail`),
  KEY `head` (`head`),
  CONSTRAINT `dd_ibfk_1` FOREIGN KEY (`tail`) REFERENCES `detail` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `dd_ibfk_2` FOREIGN KEY (`head`) REFERENCES `detail` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

/*Data for the table `dd` */

insert  into `dd`(`id`,`tail`,`head`) values (1,1,7),(2,1,8),(3,1,9),(4,2,10),(5,2,11),(6,3,12),(7,3,13),(8,3,14),(9,4,15),(10,4,16),(11,4,17),(12,5,18),(13,5,19),(14,5,20),(15,6,21),(16,6,22),(17,6,23),(18,6,24);

/*Table structure for table `detail` */

DROP TABLE IF EXISTS `detail`;

CREATE TABLE `detail` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `info` varchar(1500) DEFAULT NULL,
  `course` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `course` (`course`),
  CONSTRAINT `detail_ibfk_1` FOREIGN KEY (`course`) REFERENCES `course` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

/*Data for the table `detail` */

insert  into `detail`(`id`,`name`,`info`,`course`) values (1,'分析软件',NULL,13),(2,'预测',NULL,13),(3,'假设检验',NULL,13),(4,'估计',NULL,13),(5,'理论基础',NULL,13),(6,'数据',NULL,13),(7,'EXCEL',NULL,13),(8,'SPSS',NULL,13),(9,'R',NULL,13),(10,'时间序列分析',NULL,13),(11,'回归分析',NULL,13),(12,'判别标准',NULL,13),(13,'检验方法',NULL,13),(14,'原假设',NULL,13),(15,'估计对象',NULL,13),(16,'估计方法',NULL,13),(17,'样本容量确定',NULL,13),(18,'大数定律',NULL,13),(19,'中心极限定理',NULL,13),(20,'正态分布',NULL,13),(21,'类型',NULL,13),(22,'可视化',NULL,13),(23,'特征',NULL,13),(24,'获取',NULL,13);

/*Table structure for table `major` */

DROP TABLE IF EXISTS `major`;

CREATE TABLE `major` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `year` int(10) unsigned DEFAULT NULL COMMENT '入学年份',
  `name` varchar(300) DEFAULT NULL,
  `info` varchar(1500) DEFAULT NULL COMMENT '专业简介',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `major` */

insert  into `major`(`id`,`year`,`name`,`info`) values (1,2010,'信息管理与信息系统','信息管理与信息系统专业是一个很好很好很好的专业'),(2,2011,'信息管理与信息系统','信息管理与信息系统专业是一个很好很好很好的专业');

/*Table structure for table `mc` */

DROP TABLE IF EXISTS `mc`;

CREATE TABLE `mc` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `major` int(10) unsigned DEFAULT NULL,
  `course` int(10) unsigned DEFAULT NULL,
  `credit` decimal(3,1) DEFAULT NULL COMMENT '学分',
  PRIMARY KEY (`id`),
  KEY `major` (`major`),
  KEY `course` (`course`),
  CONSTRAINT `mc_ibfk_1` FOREIGN KEY (`major`) REFERENCES `major` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `mc_ibfk_2` FOREIGN KEY (`course`) REFERENCES `course` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8;

/*Data for the table `mc` */

insert  into `mc`(`id`,`major`,`course`,`credit`) values (1,2,1,'6.0'),(2,2,2,'5.0'),(3,2,3,'3.5'),(4,2,4,'2.0'),(5,2,5,'4.0'),(6,2,6,'1.0'),(7,2,7,'0.0'),(8,2,8,'3.0'),(9,2,9,'2.0'),(10,2,10,'4.0'),(11,2,11,'3.0'),(12,2,12,'4.0'),(13,2,13,'3.0'),(14,2,14,'2.0'),(15,2,15,'2.0'),(16,2,16,'3.0'),(17,2,17,'4.0'),(18,2,18,'3.5'),(19,2,19,'3.0'),(20,2,20,'4.0'),(21,2,21,'3.0'),(22,2,22,'1.0'),(23,2,23,'3.0'),(24,2,24,'3.0'),(25,2,25,'2.5'),(26,2,26,'4.0'),(27,2,27,'3.0'),(28,2,28,'2.0'),(29,2,29,'3.0'),(30,2,30,'4.5'),(31,2,31,'3.5'),(32,2,32,'2.0'),(33,2,33,'3.0'),(34,2,34,'3.0'),(35,2,35,'3.0'),(36,2,36,'1.0'),(37,2,37,'1.0'),(38,2,38,'2.0'),(39,2,39,'2.0'),(40,2,40,'4.0'),(41,2,41,'3.0'),(42,2,42,'4.0'),(43,2,43,'1.0'),(44,2,44,'2.0'),(45,2,45,'1.0'),(46,2,46,'12.0');

/*Table structure for table `property` */

DROP TABLE IF EXISTS `property`;

CREATE TABLE `property` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

/*Data for the table `property` */

insert  into `property`(`id`,`name`) values (1,'思想政治理论'),(2,'外语'),(3,'文化素质教育'),(4,'体育'),(5,'军事'),(6,'健康教育'),(7,'数学'),(8,'物理'),(9,'计算机'),(10,'学科基础'),(11,'专业核心'),(12,'专业选修'),(13,'课程设计'),(14,'实习'),(15,'毕业设计(论文)'),(16,'研究与创新'),(17,'跨学科选修'),(18,'学生创新实践计划(PSIP)');

/*Table structure for table `roles` */

DROP TABLE IF EXISTS `roles`;

CREATE TABLE `roles` (
  `userid` varchar(50) DEFAULT NULL COMMENT '用户邮箱',
  `role` varchar(20) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `roles` */

/*Table structure for table `uc` */

DROP TABLE IF EXISTS `uc`;

CREATE TABLE `uc` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user` int(10) unsigned DEFAULT NULL,
  `course` int(10) unsigned DEFAULT NULL,
  `mark` decimal(4,1) DEFAULT NULL COMMENT '成绩',
  PRIMARY KEY (`id`),
  KEY `user` (`user`),
  KEY `course` (`course`),
  CONSTRAINT `uc_ibfk_1` FOREIGN KEY (`user`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `uc_ibfk_2` FOREIGN KEY (`course`) REFERENCES `course` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;

/*Data for the table `uc` */

insert  into `uc`(`id`,`user`,`course`,`mark`) values (1,1,1,'91.5'),(2,1,2,'92.5'),(3,1,3,'93.5'),(4,1,4,'75.0'),(5,1,5,'77.0'),(6,1,6,'79.0'),(7,1,7,'85.0'),(8,1,8,'85.0'),(9,1,9,'83.0'),(10,1,10,'70.0'),(11,1,11,'95.0'),(12,1,12,'77.0'),(13,1,13,'95.0'),(14,1,14,'85.0'),(15,1,15,'55.0'),(16,1,16,'97.0'),(17,1,17,'84.0'),(18,1,18,'89.0'),(19,1,19,'65.0'),(20,1,20,'69.0'),(21,1,21,'85.0'),(22,1,22,'80.0'),(23,1,23,'90.0'),(24,1,24,'85.0'),(25,1,25,'95.0'),(26,1,26,'79.0'),(27,1,27,'85.0'),(28,1,28,'88.0'),(29,1,29,'65.0'),(30,1,30,'95.0'),(31,1,31,'79.0'),(32,1,32,'80.0'),(33,1,33,'90.0'),(34,1,34,'92.0');

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `passwd` varchar(100) NOT NULL,
  `eid` int(11) unsigned DEFAULT NULL COMMENT '办公网学号',
  `epasswd` varchar(100) DEFAULT NULL COMMENT '办公网密码',
  `major` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `major` (`major`),
  CONSTRAINT `user_ibfk_1` FOREIGN KEY (`major`) REFERENCES `major` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `user` */

insert  into `user`(`id`,`name`,`email`,`passwd`,`eid`,`epasswd`,`major`) values (1,'andy','aishuo2357@126.com','asvc9851',NULL,NULL,NULL),(2,'lichao','sha@tju.edu.cn','1',NULL,NULL,NULL);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
