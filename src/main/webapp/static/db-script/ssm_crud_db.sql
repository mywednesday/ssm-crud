-- MySQL dump 10.13  Distrib 5.7.28, for Win64 (x86_64)
--
-- Host: localhost    Database: ssm_crud
-- ------------------------------------------------------
-- Server version	5.7.28-log

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
-- Table structure for table `tbl_dept`
--

DROP TABLE IF EXISTS `tbl_dept`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_dept` (
  `dept_id` int(11) NOT NULL AUTO_INCREMENT,
  `dept_name` varchar(255) NOT NULL,
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_dept`
--

LOCK TABLES `tbl_dept` WRITE;
/*!40000 ALTER TABLE `tbl_dept` DISABLE KEYS */;
INSERT INTO `tbl_dept` VALUES (1,'寮€鍙戦儴'),(2,'娴嬭瘯閮?),(3,'绠＄悊閮?);
/*!40000 ALTER TABLE `tbl_dept` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_emp`
--

DROP TABLE IF EXISTS `tbl_emp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_emp` (
  `emp_id` int(11) NOT NULL AUTO_INCREMENT,
  `emp_name` varchar(255) NOT NULL,
  `gender` char(1) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `d_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`emp_id`),
  KEY `fk_emp_dept_idx` (`d_id`),
  CONSTRAINT `fk_emp_dept` FOREIGN KEY (`d_id`) REFERENCES `tbl_dept` (`dept_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_emp`
--

LOCK TABLES `tbl_emp` WRITE;
/*!40000 ALTER TABLE `tbl_emp` DISABLE KEYS */;
INSERT INTO `tbl_emp` VALUES (1,'Jerry','M','Jerry@163.com',1),(2,'3e5ad0','M','3e5ad0@163.com',1),(3,'808fa1','M','808fa1@163.com',1),(4,'d60a32','M','d60a32@163.com',1),(5,'09cb93','M','09cb93@163.com',1),(6,'156a94','M','156a94@163.com',1),(7,'635fb5','M','635fb5@163.com',1),(8,'9d1b76','M','9d1b76@163.com',1),(9,'9dadf7','M','9dadf7@163.com',1),(10,'ba57a8','M','ba57a8@163.com',1),(11,'fbef19','M','fbef19@163.com',1),(12,'7bdc110','M','7bdc110@163.com',1),(13,'2928511','M','2928511@163.com',1),(14,'42c2912','M','42c2912@163.com',1),(15,'913dd13','M','913dd13@163.com',1),(16,'4899d14','M','4899d14@163.com',1),(17,'6126215','M','6126215@163.com',1),(18,'931c516','M','931c516@163.com',1),(19,'e9ed717','M','e9ed717@163.com',1),(20,'d7af218','M','d7af218@163.com',1),(21,'56ec819','M','56ec819@163.com',1),(22,'7999420','M','7999420@163.com',1),(23,'c7c7721','M','c7c7721@163.com',1),(24,'d20d022','M','d20d022@163.com',1),(25,'33b4323','M','33b4323@163.com',1),(26,'3b5f024','M','3b5f024@163.com',1),(27,'6062125','M','6062125@163.com',1),(28,'6be6b26','M','6be6b26@163.com',1),(29,'b870327','M','b870327@163.com',1),(30,'8a53828','M','8a53828@163.com',1),(31,'dbe5329','M','dbe5329@163.com',1),(32,'d282130','M','d282130@163.com',1),(33,'dab1731','M','dab1731@163.com',1),(34,'5368632','M','5368632@163.com',1),(35,'3720233','M','3720233@163.com',1),(36,'bce4a34','M','bce4a34@163.com',1),(37,'06a3335','M','06a3335@163.com',1),(38,'3321a36','M','3321a36@163.com',1),(39,'3f3ec37','M','3f3ec37@163.com',1),(40,'b7f3c38','M','b7f3c38@163.com',1),(41,'3e9b639','M','3e9b639@163.com',1),(42,'b899d40','M','b899d40@163.com',1),(43,'37cb341','M','37cb341@163.com',1),(44,'6e12742','M','6e12742@163.com',1),(45,'e2bc743','M','e2bc743@163.com',1),(46,'bacc944','M','bacc944@163.com',1),(47,'b825045','M','b825045@163.com',1),(48,'ec25f46','M','ec25f46@163.com',1),(49,'b2b1147','M','b2b1147@163.com',1),(50,'5727148','M','5727148@163.com',1),(51,'ec5bc49','M','ec5bc49@163.com',1),(52,'6be5050','M','6be5050@163.com',1),(53,'e72cb51','M','e72cb51@163.com',1),(54,'2407852','M','2407852@163.com',1),(55,'52f9953','M','52f9953@163.com',1),(56,'ed70f54','M','ed70f54@163.com',1),(57,'578af55','M','578af55@163.com',1),(58,'045d756','M','045d756@163.com',1),(59,'f708657','M','f708657@163.com',1),(60,'9734b58','M','9734b58@163.com',1),(61,'b27d959','M','b27d959@163.com',1),(62,'5f2c860','M','5f2c860@163.com',1),(63,'2ebea61','M','2ebea61@163.com',1),(64,'1316862','M','1316862@163.com',1),(65,'0cc8363','M','0cc8363@163.com',1),(66,'90abe64','M','90abe64@163.com',1),(67,'ebea965','M','ebea965@163.com',1),(68,'b289466','M','b289466@163.com',1),(69,'2efda67','M','2efda67@163.com',1),(70,'b410868','M','b410868@163.com',1),(71,'ffa0b69','M','ffa0b69@163.com',1),(72,'7edaa70','M','7edaa70@163.com',1),(73,'1f4cb71','M','1f4cb71@163.com',1),(74,'34d9672','M','34d9672@163.com',1),(75,'796b973','M','796b973@163.com',1),(76,'8dcb274','M','8dcb274@163.com',1),(77,'de7b475','M','de7b475@163.com',1),(78,'2ea2876','M','2ea2876@163.com',1),(79,'b73f677','M','b73f677@163.com',1),(80,'e57ab78','M','e57ab78@163.com',1),(81,'aeefc79','M','aeefc79@163.com',1),(82,'f61e480','M','f61e480@163.com',1),(83,'8411481','M','8411481@163.com',1),(84,'5526782','M','5526782@163.com',1),(85,'56e2283','M','56e2283@163.com',1),(86,'257d384','M','257d384@163.com',1),(87,'2a2f385','M','2a2f385@163.com',1),(88,'f95ae86','M','f95ae86@163.com',1),(89,'4a38787','M','4a38787@163.com',1),(90,'043c688','M','043c688@163.com',1),(91,'b528289','M','b528289@163.com',1),(92,'e7ea890','M','e7ea890@163.com',1),(93,'7234091','M','7234091@163.com',1),(94,'f2baf92','M','f2baf92@163.com',1),(95,'9085493','M','9085493@163.com',1),(96,'83c0294','M','83c0294@163.com',1),(97,'53f0895','M','53f0895@163.com',1),(98,'fb8d496','M','fb8d496@163.com',1),(99,'fd08c97','M','fd08c97@163.com',1),(100,'96eac98','M','96eac98@163.com',1);
/*!40000 ALTER TABLE `tbl_emp` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-12-03 23:45:13
