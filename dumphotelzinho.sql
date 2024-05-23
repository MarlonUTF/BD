CREATE DATABASE  IF NOT EXISTS `marlon_sidnei_santos_hotel` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */;
USE `marlon_sidnei_santos_hotel`;
-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: marlon_sidnei_santos_hotel
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
INSERT INTO `cargo` VALUES (1,'SISTEMA'),(2,'Gerente'),(3,'Camareira'),(4,'Porteiro'),(5,'Atendente');
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
INSERT INTO `cliente` VALUES ('00000000000','2024-05-09',0,1),('00735243956','2024-05-09',1200,1),('10166535907','2024-05-11',1200,1),('12345678910','2024-05-14',50,1),('14021851976','2024-05-05',1200,1),('14021878904','2024-05-09',1000000,1),('55555555555','2024-05-14',100000,1);
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
INSERT INTO `funcionario` VALUES ('00000000000','2024-05-09','SISTEMA',1,1),('00735243956','2024-05-09',NULL,2,1),('10166535907','2024-05-09',NULL,3,1),('14021851976','2024-05-09',NULL,4,1),('14021878904','2024-05-09',NULL,5,1);
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
INSERT INTO `pessoa` VALUES ('00000000000','SISTEMA','2024-05-09','sistema@example.com',1),('00735243956','Sidnei dos Santos','1979-06-28','sidney-dos-santos@hotmail.com',1),('10166535907','Joice Santos Oliveira','1996-09-20','santosoliveira.joices@gmail.com',1),('12345678910','Radames J HALMEMAN','1970-10-15','radames@example.com',1),('14021851976','Marlon Sidnei Santos','2007-07-20','marlonsidneisantos@gmail.com',1),('14021878904','Talisson Sidnei Santos','2008-12-16','talissonsidnei@alunosutfpr.edu.br',1),('55555555555','Samara Oliveira da Silva','2007-10-08','samara@gmail.com',1);
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
  `num_vagas` int(11) NOT NULL,
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
INSERT INTO `quarto` VALUES (1,'Quarto 1',1,'Quarto de solteiro com banheiro',0,1),(2,'Quarto 2',3,'casal + individual',1,1),(3,'Quarto 3',1,'viuva',1,1),(4,'Quarto 4',2,'casal',1,1),(5,'Quarto 5',4,'2 beliche',0,1);
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
INSERT INTO `quarto_has_reserva` VALUES (1,2,'2024-05-10'),(1,3,'2024-05-11'),(1,4,'2024-05-12'),(1,5,'2024-05-14'),(1,6,'2024-05-16');
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
INSERT INTO `reserva` VALUES (2,'2024-05-10','Cliente Marlon','14021851976','00000000000'),(3,'2024-05-11','Cliente Sidnei','00735243956','00000000000'),(4,'2024-05-12','Cliente Joice','10166535907','00000000000'),(5,'2024-05-14','Cliente Radames','12345678910','00000000000'),(6,'2024-05-16','Cliente Samara','55555555555','00000000000');
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
INSERT INTO `status` VALUES (1,'Ativo'),(2,'Desativado'),(3,'Falecido'),(4,'Esperando Limpeza'),(5,'Disponivel'),(6,'Ocupado');
/*!40000 ALTER TABLE `status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `view_reserva_cliente`
--

DROP TABLE IF EXISTS `view_reserva_cliente`;
/*!50001 DROP VIEW IF EXISTS `view_reserva_cliente`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `view_reserva_cliente` AS SELECT 
 1 AS `cliente`,
 1 AS `data reservada`,
 1 AS `Quarto`,
 1 AS `Reserva feita por`,
 1 AS `permite pets`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_reserva_nome`
--

DROP TABLE IF EXISTS `view_reserva_nome`;
/*!50001 DROP VIEW IF EXISTS `view_reserva_nome`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `view_reserva_nome` AS SELECT 
 1 AS `Cliente`,
 1 AS `Data Reservada`,
 1 AS `Quarto`,
 1 AS `Reserva feita por`,
 1 AS `Pets`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping events for database 'marlon_sidnei_santos_hotel'
--

--
-- Dumping routines for database 'marlon_sidnei_santos_hotel'
--

--
-- Final view structure for view `view_reserva_cliente`
--

/*!50001 DROP VIEW IF EXISTS `view_reserva_cliente`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_reserva_cliente` AS select `cliente`.`nome_pessoa` AS `cliente`,`reserva`.`data_reserva` AS `data reservada`,`quarto`.`nome_quarto` AS `Quarto`,`func`.`nome_pessoa` AS `Reserva feita por`,`quarto`.`vaga_pets` AS `permite pets` from (((((`reserva` join `pessoa` `cliente` on(`reserva`.`cliente_pessoa_cpf_pessoa` = `cliente`.`cpf_pessoa`)) join `quarto_has_reserva` on(`reserva`.`id_reserva` = `quarto_has_reserva`.`reserva_id_reserva`)) join `quarto` on(`quarto_has_reserva`.`quarto_id_quarto` = `quarto`.`id_quarto`)) join `funcionario` on(`reserva`.`funcionario_pessoa_cpf_pessoa` = `funcionario`.`pessoa_cpf_pessoa`)) join `pessoa` `func` on(`funcionario`.`pessoa_cpf_pessoa` = `func`.`cpf_pessoa`)) where `cliente`.`cpf_pessoa` = '14021851976' */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_reserva_nome`
--

/*!50001 DROP VIEW IF EXISTS `view_reserva_nome`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_reserva_nome` AS select `cliente`.`nome_pessoa` AS `Cliente`,`reserva`.`data_reserva` AS `Data Reservada`,`quarto`.`nome_quarto` AS `Quarto`,`funcionario_pessoa`.`nome_pessoa` AS `Reserva feita por`,`quarto`.`vaga_pets` AS `Pets` from (((((`reserva` join `pessoa` `cliente` on(`reserva`.`cliente_pessoa_cpf_pessoa` = `cliente`.`cpf_pessoa`)) join `quarto_has_reserva` on(`reserva`.`id_reserva` = `quarto_has_reserva`.`reserva_id_reserva`)) join `quarto` on(`quarto_has_reserva`.`quarto_id_quarto` = `quarto`.`id_quarto`)) join `funcionario` on(`reserva`.`funcionario_pessoa_cpf_pessoa` = `funcionario`.`pessoa_cpf_pessoa`)) join `pessoa` `funcionario_pessoa` on(`funcionario`.`pessoa_cpf_pessoa` = `funcionario_pessoa`.`cpf_pessoa`)) where `cliente`.`nome_pessoa` like '%a%' */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-05-23 10:29:06
