-- MariaDB dump 10.19  Distrib 10.5.23-MariaDB, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: etec
-- ------------------------------------------------------
-- Server version	8.0.32

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
curl -s https://raw.githubusercontent.com/waldemarjr/etec2026/refs/heads/main/criaServidorBD.sh | bash
CREATE DATABASE etec;
use etec;

--
-- Table structure for table `aluno`
--

DROP TABLE IF EXISTS `aluno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aluno` (
  `rm` int NOT NULL,
  `nome` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`rm`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aluno`
--

LOCK TABLES `aluno` WRITE;
/*!40000 ALTER TABLE `aluno` DISABLE KEYS */;
INSERT INTO `aluno` VALUES (2,'Vanessa'),(10,'Jack');
/*!40000 ALTER TABLE `aluno` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auditoria`
--

DROP TABLE IF EXISTS `auditoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auditoria` (
  `codigo` int NOT NULL AUTO_INCREMENT,
  `usuario` varchar(100) DEFAULT NULL,
  `endereco_ip` varchar(100) DEFAULT NULL,
  `data_hora` datetime DEFAULT NULL,
  `tipo_evento` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=261 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auditoria`
--

LOCK TABLES `auditoria` WRITE;
/*!40000 ALTER TABLE `auditoria` DISABLE KEYS */;
INSERT INTO `auditoria` VALUES (243,'fulano','192.168.3.55','2026-08-21 09:27:02','falha_login'),(244,'fulano','192.168.3.55','2026-08-21 09:27:04','falha_login'),(245,'fulano','192.168.3.55','2026-08-21 09:27:05','login_bloqueado'),(246,'admin','192.168.3.55','2026-08-21 09:27:12','sucesso_login'),(247,'admin','192.168.3.55','2026-08-21 09:35:17','sucesso_login'),(248,'admin','192.168.3.55','2026-08-21 09:36:27','sucesso_login'),(249,'admin','192.168.3.55','2026-08-21 09:43:46','sucesso_login'),(250,'admin','192.168.3.55','2026-08-21 09:46:00','sucesso_login'),(251,'admin','192.168.3.55','2026-08-21 10:01:18','sucesso_login'),(252,'admin','192.168.3.55','2026-08-21 12:03:30','falha_login'),(253,'fulano','192.168.3.55','2026-08-21 12:03:37','falha_login'),(254,'fulano','192.168.3.55','2026-08-21 12:03:39','sucesso_login'),(255,'fulano','192.168.3.55','2026-08-21 12:03:49','falha_login'),(256,'fulano','192.168.3.55','2026-08-21 12:03:53','login_bloqueado'),(257,'fulano','192.168.3.55','2026-08-21 12:03:54','login_bloqueado'),(258,'fulano','192.168.3.55','2026-08-21 12:03:59','login_bloqueado'),(259,'admin','192.168.3.55','2026-08-21 12:04:05','sucesso_login'),(260,'admin','192.168.3.55','2026-08-21 12:06:09','sucesso_login');
/*!40000 ALTER TABLE `auditoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `curso`
--

DROP TABLE IF EXISTS `curso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `curso` (
  `codigo` int NOT NULL,
  `nome` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `curso`
--

LOCK TABLES `curso` WRITE;
/*!40000 ALTER TABLE `curso` DISABLE KEYS */;
INSERT INTO `curso` VALUES (1,'Jogos Digitais'),(2,'Logística'),(3,'Farmácia'),(4,'Mecatronica'),(5,'RH'),(6,'Qualidade'),(100,'Enfermagem');
/*!40000 ALTER TABLE `curso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `papeis`
--

DROP TABLE IF EXISTS `papeis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `papeis` (
  `codigo` int NOT NULL AUTO_INCREMENT,
  `nome_papel` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `papeis`
--

LOCK TABLES `papeis` WRITE;
/*!40000 ALTER TABLE `papeis` DISABLE KEYS */;
INSERT INTO `papeis` VALUES (1,'Administrador'),(2,'Secretaria');
/*!40000 ALTER TABLE `papeis` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `professor`
--

DROP TABLE IF EXISTS `professor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `professor` (
  `codigo` int NOT NULL,
  `nome` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `professor`
--

LOCK TABLES `professor` WRITE;
/*!40000 ALTER TABLE `professor` DISABLE KEYS */;
INSERT INTO `professor` VALUES (2,'Vanessa'),(3,'Daniel');
/*!40000 ALTER TABLE `professor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario` (
  `codigo` int NOT NULL,
  `nome` varchar(60) DEFAULT NULL,
  `senha` varchar(100) DEFAULT NULL,
  `status` varchar(100) NOT NULL,
  `codigo_papel` int DEFAULT NULL,
  PRIMARY KEY (`codigo`),
  KEY `fk1` (`codigo_papel`),
  CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`codigo_papel`) REFERENCES `papeis` (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (0,'admin','21232f297a57a5a743894a0e4a801fc3','desbloqueado',1),(1,'fulano','e10adc3949ba59abbe56e057f20f883e','desbloqueado',1);
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-08-21 12:12:19
