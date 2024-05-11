CREATE DATABASE  IF NOT EXISTS `hotel` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */;
USE `hotel`;
-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: hotel
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.32-MariaDB

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
-- Table structure for table `cargo`
--

DROP TABLE IF EXISTS `cargo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cargo` (
  `id_cargo` int(11) NOT NULL,
  `nome_cargo` varchar(45) NOT NULL,
  PRIMARY KEY (`id_cargo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cargo`
--

LOCK TABLES `cargo` WRITE;
/*!40000 ALTER TABLE `cargo` DISABLE KEYS */;
INSERT INTO `cargo` VALUES (1,'SISTEMA');
/*!40000 ALTER TABLE `cargo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `pessoa_cpf_pessoa` varchar(11) NOT NULL,
  `data_cadastro` date NOT NULL,
  `renda` double NOT NULL,
  `status_idstatus` int(11) NOT NULL,
  PRIMARY KEY (`pessoa_cpf_pessoa`),
  KEY `fk_cliente_pessoa1_idx` (`pessoa_cpf_pessoa`),
  KEY `fk_cliente_status1_idx` (`status_idstatus`),
  CONSTRAINT `fk_cliente_pessoa1` FOREIGN KEY (`pessoa_cpf_pessoa`) REFERENCES `pessoa` (`cpf_pessoa`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_cliente_status1` FOREIGN KEY (`status_idstatus`) REFERENCES `status` (`idstatus`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES ('00000000000','2024-05-09',0,1),('00735243956','2024-05-09',1200,1),('10166535907','2024-05-11',1200,1),('14021851976','2024-05-05',1200,1),('14021878904','2024-05-09',1000000,1);
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `funcionario`
--

DROP TABLE IF EXISTS `funcionario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `funcionario` (
  `pessoa_cpf_pessoa` varchar(11) NOT NULL,
  `data_cadastro` date NOT NULL,
  `observacao` varchar(200) DEFAULT NULL,
  `cargo_id_cargo` int(11) NOT NULL,
  `status_idstatus` int(11) NOT NULL,
  PRIMARY KEY (`pessoa_cpf_pessoa`),
  KEY `fk_funcionario_pessoa1_idx` (`pessoa_cpf_pessoa`),
  KEY `fk_funcionario_cargo1_idx` (`cargo_id_cargo`),
  KEY `fk_funcionario_status1_idx` (`status_idstatus`),
  CONSTRAINT `fk_funcionario_cargo1` FOREIGN KEY (`cargo_id_cargo`) REFERENCES `cargo` (`id_cargo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_funcionario_pessoa1` FOREIGN KEY (`pessoa_cpf_pessoa`) REFERENCES `pessoa` (`cpf_pessoa`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_funcionario_status1` FOREIGN KEY (`status_idstatus`) REFERENCES `status` (`idstatus`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `funcionario`
--

LOCK TABLES `funcionario` WRITE;
/*!40000 ALTER TABLE `funcionario` DISABLE KEYS */;
INSERT INTO `funcionario` VALUES ('00000000000','2024-05-09','SISTEMA',1,1);
/*!40000 ALTER TABLE `funcionario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pessoa`
--

DROP TABLE IF EXISTS `pessoa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pessoa` (
  `cpf_pessoa` varchar(11) NOT NULL,
  `nome_pessoa` varchar(100) NOT NULL,
  `data_nasc_pessoa` date NOT NULL,
  `email_pessoa` varchar(100) DEFAULT NULL,
  `status_idstatus` int(11) NOT NULL,
  PRIMARY KEY (`cpf_pessoa`),
  KEY `fk_pessoa_status1_idx` (`status_idstatus`),
  CONSTRAINT `fk_pessoa_status1` FOREIGN KEY (`status_idstatus`) REFERENCES `status` (`idstatus`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pessoa`
--

LOCK TABLES `pessoa` WRITE;
/*!40000 ALTER TABLE `pessoa` DISABLE KEYS */;
INSERT INTO `pessoa` VALUES ('00000000000','SISTEMA','2024-05-09','sistema@example.com',1),('00735243956','Sidnei dos Santos','1979-06-28','sidney-dos-santos@hotmail.com',1),('10166535907','Joice Santos Oliveira','1996-09-20','santosoliveira.joices@gmail.com',1),('14021851976','Marlon Sidnei Santos','2007-07-20','marlonsidneisantos@gmail.com',1),('14021878904','Talisson Sidnei Santos','2008-12-16','talissonsidnei@alunosutfpr.edu.br',1);
/*!40000 ALTER TABLE `pessoa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quarto`
--

DROP TABLE IF EXISTS `quarto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `quarto` (
  `id_quarto` int(11) NOT NULL,
  `nome_quarto` varchar(45) NOT NULL,
  `num_vagasl` int(11) NOT NULL,
  `observacao` varchar(200) DEFAULT NULL,
  `vaga_pets` tinyint(4) DEFAULT NULL,
  `status_idstatus` int(11) NOT NULL,
  PRIMARY KEY (`id_quarto`),
  KEY `fk_quarto_status1_idx` (`status_idstatus`),
  CONSTRAINT `fk_quarto_status1` FOREIGN KEY (`status_idstatus`) REFERENCES `status` (`idstatus`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quarto`
--

LOCK TABLES `quarto` WRITE;
/*!40000 ALTER TABLE `quarto` DISABLE KEYS */;
INSERT INTO `quarto` VALUES (1,'Quarto 1',1,'Quarto de solteiro com banheiro',0,1);
/*!40000 ALTER TABLE `quarto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quarto_has_reserva`
--

DROP TABLE IF EXISTS `quarto_has_reserva`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `quarto_has_reserva` (
  `quarto_id_quarto` int(11) NOT NULL,
  `reserva_id_reserva` int(11) NOT NULL,
  `reserva_data_reserva` date NOT NULL,
  PRIMARY KEY (`quarto_id_quarto`,`reserva_id_reserva`,`reserva_data_reserva`),
  KEY `fk_quarto_has_reserva_reserva1_idx` (`reserva_id_reserva`,`reserva_data_reserva`),
  KEY `fk_quarto_has_reserva_quarto1_idx` (`quarto_id_quarto`),
  CONSTRAINT `fk_quarto_has_reserva_quarto1` FOREIGN KEY (`quarto_id_quarto`) REFERENCES `quarto` (`id_quarto`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_quarto_has_reserva_reserva1` FOREIGN KEY (`reserva_id_reserva`, `reserva_data_reserva`) REFERENCES `reserva` (`id_reserva`, `data_reserva`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quarto_has_reserva`
--

LOCK TABLES `quarto_has_reserva` WRITE;
/*!40000 ALTER TABLE `quarto_has_reserva` DISABLE KEYS */;
INSERT INTO `quarto_has_reserva` VALUES (1,1,'2024-05-09'),(1,2,'2024-05-10'),(1,3,'2024-05-11'),(1,4,'2024-05-12');
/*!40000 ALTER TABLE `quarto_has_reserva` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reserva`
--

DROP TABLE IF EXISTS `reserva`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reserva` (
  `id_reserva` int(11) NOT NULL,
  `data_reserva` date NOT NULL,
  `observacao` varchar(200) DEFAULT NULL,
  `reservacol` varchar(45) DEFAULT NULL,
  `cliente_pessoa_cpf_pessoa` varchar(11) NOT NULL,
  `funcionario_pessoa_cpf_pessoa` varchar(11) NOT NULL,
  PRIMARY KEY (`id_reserva`,`data_reserva`),
  KEY `fk_reserva_cliente1_idx` (`cliente_pessoa_cpf_pessoa`),
  KEY `fk_reserva_funcionario1_idx` (`funcionario_pessoa_cpf_pessoa`),
  CONSTRAINT `fk_reserva_cliente1` FOREIGN KEY (`cliente_pessoa_cpf_pessoa`) REFERENCES `cliente` (`pessoa_cpf_pessoa`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_reserva_funcionario1` FOREIGN KEY (`funcionario_pessoa_cpf_pessoa`) REFERENCES `funcionario` (`pessoa_cpf_pessoa`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reserva`
--

LOCK TABLES `reserva` WRITE;
/*!40000 ALTER TABLE `reserva` DISABLE KEYS */;
INSERT INTO `reserva` VALUES (1,'2024-05-09','Cliente Marlon',NULL,'14021851976','00000000000'),(2,'2024-05-10','Cliente Marlon',NULL,'14021851976','00000000000'),(3,'2024-05-11','Cliente Sidnei',NULL,'00735243956','00000000000'),(4,'2024-05-12','Cliente Joice',NULL,'10166535907','00000000000');
/*!40000 ALTER TABLE `reserva` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `status`
--

DROP TABLE IF EXISTS `status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `status` (
  `idstatus` int(11) NOT NULL,
  `nome_status` varchar(45) NOT NULL,
  PRIMARY KEY (`idstatus`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `status`
--

LOCK TABLES `status` WRITE;
/*!40000 ALTER TABLE `status` DISABLE KEYS */;
INSERT INTO `status` VALUES (1,'Ativo');
/*!40000 ALTER TABLE `status` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-05-11 14:05:08
