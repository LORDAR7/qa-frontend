CREATE DATABASE  IF NOT EXISTS `qadb` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `qadb`;
-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: localhost    Database: qadb
-- ------------------------------------------------------
-- Server version	8.0.40

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
-- Table structure for table `adjuntos`
--

DROP TABLE IF EXISTS `adjuntos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `adjuntos` (
  `Proyecto_Id` int NOT NULL,
  `Etapa_Id` int NOT NULL,
  `Revision_Id` int NOT NULL,
  `Adjunto_Id` int NOT NULL AUTO_INCREMENT,
  `Filename` varchar(240) NOT NULL,
  `Created` datetime NOT NULL,
  `User_Created` varchar(24) NOT NULL,
  PRIMARY KEY (`Adjunto_Id`,`Etapa_Id`,`Proyecto_Id`,`Revision_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adjuntos`
--

LOCK TABLES `adjuntos` WRITE;
/*!40000 ALTER TABLE `adjuntos` DISABLE KEYS */;
/*!40000 ALTER TABLE `adjuntos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalogos`
--

DROP TABLE IF EXISTS `catalogos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalogos` (
  `item_id` int NOT NULL AUTO_INCREMENT,
  `item` varchar(32) NOT NULL,
  `tipo` varchar(8) DEFAULT NULL,
  PRIMARY KEY (`item_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalogos`
--

LOCK TABLES `catalogos` WRITE;
/*!40000 ALTER TABLE `catalogos` DISABLE KEYS */;
INSERT INTO `catalogos` VALUES (1,'Servidor Web QA-1','serv'),(2,'Servidor Web QA-2','serv'),(3,'SQL Server QA-1','db'),(4,'SQL Server QA-2','db'),(5,'Servidor Web Cert-1','serv'),(6,'Servidor Web Cert-2','serv'),(7,'SQL Server Cert-1','db'),(8,'SQL Server Cert-2','db'),(9,'Servidor Web Piloto','serv'),(10,'SQL Server Piloto','db'),(11,'Servidor Web Prod','serv'),(12,'SQL Server Prod','db'),(13,'Lectura','acc'),(14,'Lecutra/Escritura','acc'),(15,'Select','per'),(16,'Select/Insert','per'),(17,'Select/Insert/Update','per'),(18,'Select/Insert/Update/Delete','per');
/*!40000 ALTER TABLE `catalogos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `check_list`
--

DROP TABLE IF EXISTS `check_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `check_list` (
  `Check_List_Id` int NOT NULL AUTO_INCREMENT,
  `Item` varchar(64) NOT NULL,
  `Tipo_Test_Id` int NOT NULL,
  `Activo` int DEFAULT NULL,
  PRIMARY KEY (`Check_List_Id`),
  KEY `Tipos_Test_Check_List_FK1` (`Tipo_Test_Id`),
  CONSTRAINT `Tipos_Test_Check_List_FK1` FOREIGN KEY (`Tipo_Test_Id`) REFERENCES `tipos_test` (`Tipo_Test_Id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `check_list`
--

LOCK TABLES `check_list` WRITE;
/*!40000 ALTER TABLE `check_list` DISABLE KEYS */;
INSERT INTO `check_list` VALUES (1,'Pruebas del Desarrollador',1,1),(2,'Set de Pruebas de QA',1,1),(3,'Pruebas de Navegación',1,1),(4,'Pruebas de Integración',1,1),(5,'Pruebas del Negocio',1,1),(6,'Prueba de Length Max',1,1),(9,'Prueba de Punto Decimal',1,1),(10,'Prueba de Fechas',1,0);
/*!40000 ALTER TABLE `check_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dashboard`
--

DROP TABLE IF EXISTS `dashboard`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dashboard` (
  `id` int NOT NULL,
  `estado` varchar(45) NOT NULL,
  `cantidad` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dashboard`
--

LOCK TABLES `dashboard` WRITE;
/*!40000 ALTER TABLE `dashboard` DISABLE KEYS */;
INSERT INTO `dashboard` VALUES (1,'Solicitado',2),(2,'En Revisión',13),(3,'En Corrección',3),(4,'Aprobado',1),(5,'Rechazado',1);
/*!40000 ALTER TABLE `dashboard` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle_revision`
--

DROP TABLE IF EXISTS `detalle_revision`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalle_revision` (
  `Proyecto_Id` int NOT NULL,
  `Etapa_Id` int NOT NULL,
  `Revision_Id` int NOT NULL,
  `Check_List_Id` int NOT NULL,
  `Marcado` tinyint NOT NULL,
  `Fecha` datetime DEFAULT NULL,
  PRIMARY KEY (`Check_List_Id`,`Etapa_Id`,`Proyecto_Id`,`Revision_Id`),
  KEY `Revision_Detalle_Revision_FK1_idx` (`Proyecto_Id`,`Etapa_Id`,`Revision_Id`),
  CONSTRAINT `Check_List_Detalle_Revision_FK1` FOREIGN KEY (`Check_List_Id`) REFERENCES `check_list` (`Check_List_Id`),
  CONSTRAINT `Revision_Detalle_Revision_FK1` FOREIGN KEY (`Proyecto_Id`, `Etapa_Id`, `Revision_Id`) REFERENCES `revision` (`Proyecto_Id`, `Etapa_Id`, `Revision_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_revision`
--

LOCK TABLES `detalle_revision` WRITE;
/*!40000 ALTER TABLE `detalle_revision` DISABLE KEYS */;
INSERT INTO `detalle_revision` VALUES (154,1,1,1,1,'2024-11-17 00:00:00'),(158,1,1,1,1,'2024-11-17 00:00:00'),(159,1,1,1,1,'2024-11-18 00:00:00'),(159,1,2,1,1,'2024-11-26 00:00:00'),(154,2,1,1,1,NULL),(158,2,1,1,1,'2024-11-18 00:00:00'),(159,2,1,1,1,NULL),(158,3,1,1,1,'2024-11-25 00:00:00'),(158,4,1,1,1,'2024-11-18 00:00:00'),(154,1,1,2,1,'2024-11-18 00:00:00'),(158,1,1,2,1,'2024-11-18 00:00:00'),(159,1,1,2,1,'2024-11-18 00:00:00'),(159,1,2,2,1,'2024-11-27 00:00:00'),(154,2,1,2,1,NULL),(158,2,1,2,1,'2024-11-18 00:00:00'),(159,2,1,2,1,NULL),(158,3,1,2,1,'2024-11-25 00:00:00'),(158,4,1,2,1,'2024-11-18 00:00:00'),(154,1,1,3,1,'2024-11-19 00:00:00'),(158,1,1,3,1,'2024-11-18 00:00:00'),(159,1,2,3,1,'2024-11-28 00:00:00'),(154,2,1,3,1,NULL),(158,2,1,3,1,'2024-11-19 00:00:00'),(159,2,1,3,1,NULL),(158,3,1,3,1,'2024-11-26 00:00:00'),(158,4,1,3,1,'2024-11-26 00:00:00'),(154,1,1,4,1,'2024-11-20 00:00:00'),(158,1,1,4,1,'2024-11-19 00:00:00'),(159,1,2,4,1,'2024-11-28 00:00:00'),(154,2,1,4,1,NULL),(158,2,1,4,1,'2024-11-19 00:00:00'),(159,2,1,4,1,NULL),(158,3,1,4,1,'2024-11-26 00:00:00'),(158,4,1,4,1,'2024-11-26 00:00:00'),(154,1,1,5,1,'2024-11-20 00:00:00'),(158,1,1,5,1,'2024-11-19 00:00:00'),(159,1,2,5,1,'2024-11-29 00:00:00'),(154,2,1,5,1,NULL),(158,2,1,5,1,'2024-11-20 00:00:00'),(159,2,1,5,1,NULL),(158,3,1,5,1,'2024-11-27 00:00:00'),(158,4,1,5,1,'2024-11-26 00:00:00'),(154,1,1,6,1,'2024-11-22 00:00:00'),(158,1,1,6,1,'2024-11-19 00:00:00'),(159,1,2,6,1,'2024-11-29 00:00:00'),(154,2,1,6,1,NULL),(158,2,1,6,1,'2024-11-20 00:00:00'),(158,3,1,6,1,'2024-11-27 00:00:00'),(158,4,1,6,1,'2024-11-26 00:00:00'),(154,1,1,9,1,'2024-11-22 00:00:00'),(158,1,1,9,1,'2024-11-20 00:00:00'),(159,1,2,9,1,'2024-11-29 00:00:00'),(154,2,1,9,1,NULL),(158,2,1,9,1,'2024-11-21 00:00:00'),(158,3,1,9,1,'2024-11-29 00:00:00'),(158,4,1,9,1,'2024-11-26 00:00:00');
/*!40000 ALTER TABLE `detalle_revision` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estados`
--

DROP TABLE IF EXISTS `estados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estados` (
  `estado_id` int NOT NULL,
  `estado` varchar(45) NOT NULL,
  `etapa_id` int DEFAULT NULL,
  PRIMARY KEY (`estado_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estados`
--

LOCK TABLES `estados` WRITE;
/*!40000 ALTER TABLE `estados` DISABLE KEYS */;
INSERT INTO `estados` VALUES (1,'Nueva Solicitud de QA',NULL),(2,'Revisión en Proceso',NULL),(3,'Pendiente de Corrección',NULL),(4,'Correcciónes Completas',NULL),(5,'QA Satisfactorio',NULL),(6,'Desarrollo Rechazado',NULL);
/*!40000 ALTER TABLE `estados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `etapas`
--

DROP TABLE IF EXISTS `etapas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `etapas` (
  `Etapa_Id` int NOT NULL AUTO_INCREMENT,
  `Etapa` varchar(24) NOT NULL,
  PRIMARY KEY (`Etapa_Id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `etapas`
--

LOCK TABLES `etapas` WRITE;
/*!40000 ALTER TABLE `etapas` DISABLE KEYS */;
INSERT INTO `etapas` VALUES (1,'Control de Calidad'),(2,'Certificación'),(3,'Piloto'),(4,'Producción');
/*!40000 ALTER TABLE `etapas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proy_etapas`
--

DROP TABLE IF EXISTS `proy_etapas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proy_etapas` (
  `Proyecto_Id` int NOT NULL,
  `Etapa_Id` int NOT NULL,
  `Estado` varchar(64) NOT NULL,
  `Dev` varchar(24) NOT NULL,
  `QA_Tester` varchar(24) NOT NULL,
  `Manual_Tecnico` varchar(128) NOT NULL,
  `Manual_Despliegue` varchar(128) NOT NULL,
  `Cronograma` varchar(128) NOT NULL,
  `Ambiente` varchar(128) NOT NULL,
  `Accesso` varchar(128) NOT NULL,
  `Permisos` varchar(128) NOT NULL,
  `Instancia_DB` varchar(128) NOT NULL,
  `Server_Name` varchar(24) NOT NULL,
  `Fecha_Inicio` datetime NOT NULL,
  `Fecha_Final` datetime DEFAULT NULL,
  PRIMARY KEY (`Proyecto_Id`,`Etapa_Id`),
  KEY `Etapas_Proy_Etapas_FK1` (`Etapa_Id`),
  CONSTRAINT `Etapas_Proy_Etapas_FK1` FOREIGN KEY (`Etapa_Id`) REFERENCES `etapas` (`Etapa_Id`),
  CONSTRAINT `Proyectos_Proy_Etapas_FK1` FOREIGN KEY (`Proyecto_Id`) REFERENCES `proyectos` (`Proyecto_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proy_etapas`
--

LOCK TABLES `proy_etapas` WRITE;
/*!40000 ALTER TABLE `proy_etapas` DISABLE KEYS */;
INSERT INTO `proy_etapas` VALUES (154,1,'En Proceso','Jhon Doe','Jane Deep','1731892489313-Manual Tecnico.docx','1731892492776-Fuente.zip','1731892521688-Cronograma de QA.xlsx','Certificación','Lectura','Select','SQL Server QA-1','Servidor Web QA-1','2024-11-17 00:00:00','2024-11-24 00:00:00'),(154,2,'Revisión Satifactoria','Jhon Doe','April Smith','1731892489313-Manual Tecnico.docx','1731892492776-Fuente.zip','1731892521688-Cronograma de QA.xlsx','Control de Calidad','Lectura','Select','SQL Server QA-1','Servidor Web QA-1','2024-11-17 00:00:00','2024-11-19 21:44:23'),(158,1,'En Proceso','Jhon Doe','Jane Deep','1731897383422-Manual Tecnico.docx','1731897386170-Fuente.zip','1731897392206-Cronograma de QA.xlsx','Producción','Lectura','Select/Insert/Update/Delete','SQL Server QA-1','Servidor Web QA-1','2024-11-19 00:00:00','2024-11-26 00:00:00'),(158,2,'Revisión Satifactoria','Scarlett Johasson','Jane Deep','1731897383422-Manual Tecnico.docx','1731897386170-Fuente.zip','1731897392206-Cronograma de QA.xlsx','Control de Calidad','Lectura','Select/Insert/Update/Delete','SQL Server QA-1','Servidor Web QA-1','2024-11-17 00:00:00','2024-11-17 20:49:57'),(158,3,'Revisión Satifactoria','Scarlett Johasson','Jane Deep','1731897383422-Manual Tecnico.docx','1731897386170-Fuente.zip','1731897392206-Cronograma de QA.xlsx','Control de Calidad','Lectura','Select/Insert/Update/Delete','SQL Server QA-1','Servidor Web QA-1','2024-11-17 00:00:00','2024-11-17 20:52:32'),(158,4,'Pendiente de Corrección','Scarlett Johasson','April Smith','1731897383422-Manual Tecnico.docx','1731897386170-Fuente.zip','1731897392206-Cronograma de QA.xlsx','Producción','Lectura','Select/Insert/Update/Delete','SQL Server QA-1','Servidor Web QA-1','2024-11-19 00:00:00','2024-11-19 22:03:51'),(159,1,'Revisión Satifactoria','Jhon Doe','April Smith','1731898735795-Manual Tecnico.docx','1731898739715-Fuente.zip','1731898610328-Cronograma de QA.xlsx','Control de Calidad','Lectura','Select','SQL Server QA-1','Servidor Web QA-1','2024-11-17 00:00:00','2024-11-17 21:00:09'),(159,2,'Desarrollo Rechazado','Jhon Doe','April Smith','1731898735795-Manual Tecnico.docx','1731898739715-Fuente.zip','1731898610328-Cronograma de QA.xlsx','Control de Calidad','Lectura','Select','SQL Server QA-1','Servidor Web QA-1','2024-11-17 00:00:00','2024-11-17 21:01:40');
/*!40000 ALTER TABLE `proy_etapas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proy_users`
--

DROP TABLE IF EXISTS `proy_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proy_users` (
  `Proyecto_Id` int NOT NULL AUTO_INCREMENT,
  `Username` varchar(24) NOT NULL,
  `Fecha` datetime NOT NULL,
  `Estado` varchar(24) NOT NULL,
  PRIMARY KEY (`Proyecto_Id`,`Username`),
  KEY `Usuarios_Proy_Users_FK1` (`Username`),
  CONSTRAINT `Proyectos_Proy_Users_FK1` FOREIGN KEY (`Proyecto_Id`) REFERENCES `proyectos` (`Proyecto_Id`),
  CONSTRAINT `Usuarios_Proy_Users_FK1` FOREIGN KEY (`Username`) REFERENCES `usuarios` (`Username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proy_users`
--

LOCK TABLES `proy_users` WRITE;
/*!40000 ALTER TABLE `proy_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `proy_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proyectos`
--

DROP TABLE IF EXISTS `proyectos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proyectos` (
  `Proyecto_Id` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(128) NOT NULL,
  `User_Create` varchar(24) NOT NULL,
  `Created` datetime NOT NULL,
  `Estado` varchar(32) NOT NULL,
  PRIMARY KEY (`Proyecto_Id`)
) ENGINE=InnoDB AUTO_INCREMENT=160 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proyectos`
--

LOCK TABLES `proyectos` WRITE;
/*!40000 ALTER TABLE `proyectos` DISABLE KEYS */;
INSERT INTO `proyectos` VALUES (154,'Ventas','Abner Ramos','2024-11-17 00:00:00','Revisión en Proceso'),(158,'RRHH','Abner Ramos','2024-11-19 00:00:00','Pendiente de Corrección'),(159,'Sistema de Nomina','Sarah Connor','2024-11-17 00:00:00','Desarrollo Rechazado');
/*!40000 ALTER TABLE `proyectos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `revision`
--

DROP TABLE IF EXISTS `revision`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `revision` (
  `Proyecto_Id` int NOT NULL,
  `Etapa_Id` int NOT NULL,
  `Revision_Id` int NOT NULL,
  `Fecha` datetime NOT NULL,
  `Estado` varchar(24) NOT NULL,
  `Cantidad_Defectos` int DEFAULT NULL,
  `Cantidad_Atrasos` int DEFAULT NULL,
  `Tasa_Defectos` int DEFAULT NULL,
  `Tasa_Correcciones` int DEFAULT NULL,
  `Tiempo_Resolucion` int DEFAULT NULL,
  PRIMARY KEY (`Revision_Id`,`Etapa_Id`,`Proyecto_Id`),
  KEY `Proy_Etapas_Revision_FK1` (`Proyecto_Id`,`Etapa_Id`),
  CONSTRAINT `Proy_Etapas_Revision_FK1` FOREIGN KEY (`Proyecto_Id`, `Etapa_Id`) REFERENCES `proy_etapas` (`Proyecto_Id`, `Etapa_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `revision`
--

LOCK TABLES `revision` WRITE;
/*!40000 ALTER TABLE `revision` DISABLE KEYS */;
INSERT INTO `revision` VALUES (154,1,1,'2024-11-17 20:28:58','En Proceso',0,0,0,0,0),(158,1,1,'2024-11-17 20:36:48','En Proceso',0,0,0,0,0),(159,1,1,'2024-11-17 20:57:16','En Proceso',0,0,0,0,0),(154,2,1,'2024-11-17 20:32:04','En Proceso',0,0,0,0,0),(158,2,1,'2024-11-17 20:46:17','En Proceso',0,0,0,0,0),(159,2,1,'2024-11-17 21:00:57','En Proceso',0,0,0,0,0),(158,3,1,'2024-11-17 20:50:38','En Proceso',0,0,0,0,0),(158,4,1,'2024-11-17 20:52:57','En Proceso',0,0,0,0,0),(159,1,2,'2024-11-17 00:00:00','En revision',0,0,NULL,NULL,NULL),(158,4,2,'2024-11-19 00:00:00','En revision',0,0,NULL,NULL,NULL),(158,4,3,'2024-11-19 00:00:00','En revision',0,0,NULL,NULL,NULL);
/*!40000 ALTER TABLE `revision` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `Rol_Id` int NOT NULL AUTO_INCREMENT,
  `Rol_name` varchar(24) NOT NULL,
  `Estado` varchar(24) NOT NULL,
  PRIMARY KEY (`Rol_Id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'Product Owner','Activo'),(2,'Developer','Activo'),(3,'QA Tester','Activo');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipos_test`
--

DROP TABLE IF EXISTS `tipos_test`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipos_test` (
  `Tipo_Test_Id` int NOT NULL AUTO_INCREMENT,
  `Tipo` varchar(24) NOT NULL,
  PRIMARY KEY (`Tipo_Test_Id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipos_test`
--

LOCK TABLES `tipos_test` WRITE;
/*!40000 ALTER TABLE `tipos_test` DISABLE KEYS */;
INSERT INTO `tipos_test` VALUES (1,'Pruebas de QA');
/*!40000 ALTER TABLE `tipos_test` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `Username` varchar(24) NOT NULL,
  `Fullname` varchar(24) NOT NULL,
  `Estado` varchar(24) NOT NULL,
  `Rol_Id` int NOT NULL,
  `Pwd` varchar(24) NOT NULL,
  `Created` datetime NOT NULL,
  `User_Create` varchar(24) NOT NULL,
  `Email` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`Username`),
  KEY `Roles_Usuarios_FK1` (`Rol_Id`),
  CONSTRAINT `Roles_Usuarios_FK1` FOREIGN KEY (`Rol_Id`) REFERENCES `roles` (`Rol_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES ('aramos','Abner Ramos','Activo',1,'123','2024-10-21 00:00:00','sys','aramos@gmail.com'),('asmith','April Smith','Activo',3,'123','2024-10-21 00:00:00','sys','new@gmail.com'),('froche','FELIPE ROCHE','Activo',3,'123','2024-11-17 21:06:58','sys','felroc@gmail.com'),('jdeep','Jane Deep','Activo',3,'123','2024-11-17 13:18:58','sys','jdeep@gmail.com'),('jdoe','Jhon Doe','Activo',2,'123','2024-10-21 00:00:00','sys','jdoe@gmail.com'),('new','new user','Activo',1,'123','2024-11-16 21:17:06','sys','new@gmail.com'),('sconnor','Sarah Connor','Activo',1,'123','2024-11-17 13:13:51','sys','sconnor@gmail.com'),('sjohansson','Scarlett Johasson','Activo',2,'123','2024-11-17 13:15:34','sys','sjohansson@gmail.com');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'qadb'
--
/*!50003 DROP PROCEDURE IF EXISTS `sp_Delete_Check_List` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_Delete_Check_List`(
	IN p_CheckListId  int		
)
BEGIN
	DELETE FROM check_list WHERE CheckListId = p_CheckListId ;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_Delete_Proyecto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_Delete_Proyecto`(
	IN p_id int
)
BEGIN
	DELETE FROM detalle_revision WHERE proyecto_id = p_id ;
	DELETE FROM revision WHERE proyecto_id = p_id ;
	DELETE FROM proy_etapas WHERE proyecto_id = p_id ;
	DELETE FROM proyectos WHERE proyecto_id = p_id ;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_Insert_Adjunto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_Insert_Adjunto`(
    IN p_Proyecto_Id INT,
    IN p_Etapa_Id INT,
    IN p_Revision_Id INT,
    IN p_Filename VARCHAR(240),
    IN p_Created DATETIME,
    IN p_User_Created VARCHAR(24)
)
BEGIN
    INSERT INTO adjuntos (
		Proyecto_Id, 
		Etapa_Id, 
		Revision_Id, 
		Filename, 
		Created, 
		User_Created
		)
    VALUES (
		p_Proyecto_Id, 
		p_Etapa_Id, 
		p_Revision_Id, 
		p_Filename, 
		p_Created, 
		p_User_Created);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_Insert_Check_List` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_Insert_Check_List`(
    IN p_CheckListId INT,
    IN p_Item VARCHAR(64),
    IN p_TipoTestId INT,
    IN p_Activo TINYINT
)
BEGIN
    DECLARE v_count INT;

    SELECT COUNT(*) INTO v_count
    FROM check_list
    WHERE Check_List_Id = p_CheckListId;

    IF v_count = 0 THEN
        INSERT INTO check_list (Item, Tipo_Test_Id, Activo)
        VALUES (p_Item, p_TipoTestId, p_Activo);
    ELSE
        UPDATE check_list
        SET Item = p_Item, Activo = p_Activo
        WHERE Check_List_Id = p_CheckListId;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_Insert_Detalle_Revision` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_Insert_Detalle_Revision`(
    IN p_Proyecto_Id INT,
    IN p_Etapa_Id INT,
    IN p_Revision_Id INT,
    IN p_Check_List_Id INT,
    IN p_Marcado int,
    IN p_Fecha DATETIME
)
BEGIN
	DECLARE existing_count INT;
    SELECT count(*) INTO existing_count
    FROM detalle_revision
    WHERE Proyecto_Id = p_Proyecto_Id and
		Etapa_Id = p_Etapa_Id and 
		Revision_Id = p_Revision_Id and
		Check_List_Id = p_Check_List_Id ;
        
	IF( existing_count = 0 ) THEN
			
		INSERT INTO detalle_revision (
			Proyecto_Id, 
			Etapa_Id, 
			Revision_Id, 
			Check_List_Id, 
			Marcado, 
			Fecha
			)
		VALUES (
			p_Proyecto_Id, 
			p_Etapa_Id, 
			p_Revision_Id, 
			p_Check_List_Id, 
			p_Marcado, 
			p_Fecha
			);
		ELSE 
			UPDATE detalle_revision
            SET Marcado = p_Marcado , Fecha = p_Fecha
            WHERE Proyecto_Id = p_Proyecto_Id and
			Etapa_Id = p_Etapa_Id and 
			Revision_Id = p_Revision_Id and
			Check_List_Id = p_Check_List_Id ;
        END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_Insert_Etapa` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_Insert_Etapa`(
    IN p_Etapa VARCHAR(24)
)
BEGIN
    INSERT INTO etapas (Etapa)
    VALUES (p_Etapa);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_Insert_Proyecto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_Insert_Proyecto`(
    IN p_Nombre VARCHAR(128),
    IN p_User_Create VARCHAR(24),
    IN p_Created DATETIME,
    IN p_Estado VARCHAR(24)
    ,OUT proyectoId INT
)
BEGIN
    INSERT INTO proyectos (
		Nombre, 
		User_Create, 
		Created, 
		Estado
		)
    VALUES (
		p_Nombre, 
		p_User_Create, 
		p_Created, 
		p_Estado);
	SET proyectoId = LAST_INSERT_ID();
    SELECT proyectoId ;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_Insert_Proy_Etapa` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_Insert_Proy_Etapa`(
    IN p_Proyecto_Id INT,
    IN p_Etapa_Id INT,
    IN p_Estado VARCHAR(24),
    IN p_Dev VARCHAR(24),
    IN p_QA_Tester VARCHAR(24),
    IN p_Manual_Tecnico VARCHAR(128),
    IN p_Manual_Despliegue VARCHAR(128),
    IN p_Cronograma VARCHAR(128),
    IN p_Ambiente VARCHAR(128),
    IN p_Accesso VARCHAR(128),
    IN p_Permisos VARCHAR(128),
    IN p_Instancia_DB VARCHAR(128),
    IN p_Server_Name VARCHAR(24),
    IN p_Fecha_Inicio DATETIME,
    IN p_Fecha_Final DATETIME
)
BEGIN

	DECLARE v_count INT; 

    SELECT COUNT(*) INTO v_count
    FROM proy_etapas
    WHERE Proyecto_Id 	= p_Proyecto_Id
    AND Etapa_Id 		= p_Etapa_Id;

    IF v_count = 0 THEN
			
		INSERT INTO proy_etapas (
			Proyecto_Id, 
			Etapa_Id, 	
			Estado, 
			Dev, 
			QA_Tester, 
			Manual_Tecnico, 
			Manual_Despliegue, 
			Cronograma, 
			Ambiente, 
			Accesso, 
			Permisos, 
			Instancia_DB, 
			Server_Name, 
			Fecha_Inicio, 
			Fecha_Final
			)
		VALUES (
			p_Proyecto_Id, 
			p_Etapa_Id, 
			p_Estado, 
			p_Dev, 
			p_QA_Tester, 
			p_Manual_Tecnico, 
			p_Manual_Despliegue, 
			p_Cronograma, 
			p_Ambiente, 
			p_Accesso, 
			p_Permisos, 
			p_Instancia_DB, 
			p_Server_Name, 
			p_Fecha_Inicio, 
			p_Fecha_Final
			);
    ELSE
        CALL sp_update_Proy_Etapa ( 
			p_Proyecto_Id, 
			p_Etapa_Id, 
			p_Estado, 
			p_Dev, 
			p_QA_Tester, 
			p_Manual_Tecnico, 
			p_Manual_Despliegue, 
			p_Cronograma, 
			p_Ambiente, 
			p_Accesso, 
			p_Permisos, 
			p_Instancia_DB, 
			p_Server_Name, 
			p_Fecha_Inicio, 
			p_Fecha_Final
		);
    END IF;
        
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_Insert_Proy_User` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_Insert_Proy_User`(
    IN p_Proyecto_Id INT,
    IN p_Username VARCHAR(24),
    IN p_Fecha DATETIME,
    IN p_Estado VARCHAR(24)
)
BEGIN
    INSERT INTO proy_users (Proyecto_Id, Username, Fecha, Estado)
    VALUES (p_Proyecto_Id, p_Username, p_Fecha, p_Estado);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_Insert_Revision` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_Insert_Revision`(
    IN p_Proyecto_Id INT,
    IN p_Etapa_Id INT,
    IN p_Revision_Id INT,
    IN p_Fecha DATETIME,
    IN p_Estado VARCHAR(24)
)
BEGIN
    INSERT INTO revision (Proyecto_Id, Etapa_Id, Revision_Id,  Fecha, Estado, Cantidad_Defectos, Cantidad_Atrasos)  
    VALUES (p_Proyecto_Id, p_Etapa_Id, p_Revision_Id, p_Fecha, p_Estado,0,0);
	/* SOLO INSERTAR VALORES REQUERIDOS */
	/* LOS CAMPOS QUE ACEPTAN NULOS SE LLENAN EN EL PROCESO */
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_Insert_Rol` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_Insert_Rol`(
    IN p_Rolname VARCHAR(24),
    IN p_Estado VARCHAR(24)
)
BEGIN
    INSERT INTO roles (Rolname, Estado)
    VALUES (p_Rolname, p_Estado);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_Insert_Tipo_Test` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_Insert_Tipo_Test`(
    IN p_Tipo VARCHAR(24)
)
BEGIN
    INSERT INTO tipos_test (Tipo)
    VALUES (p_Tipo);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_Insert_Usuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_Insert_Usuario`(
    IN p_Username VARCHAR(24),
    IN p_Fullname VARCHAR(24),
    IN p_Email VARCHAR(128),
    IN p_Estado VARCHAR(24),
    IN p_Rol_Id INT,
    IN p_Pwd VARCHAR(24)
)
BEGIN
    INSERT INTO usuarios (
		Username, 
		Fullname, 
        Email,
		Estado, 
		Rol_Id, 
		Pwd, 
		Created, 
		User_Create
		)
    VALUES (
		p_Username, 
		p_Fullname, 
        p_Email,
		p_Estado, 
		p_Rol_Id, 
		p_Pwd, 
		now(), 
		'sys'
		);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_Seleccionar_Revision` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_Seleccionar_Revision`(
	p_Revision_Id INT, 
	p_Proyecto_Id INT, 
	p_Etapa_Id INT
	)
begin
    (SELECT * 
	FROM revision 
	WHERE 
		Revision_Id = p_Revision_Id AND 
		Proyecto_Id = p_Proyecto_Id AND 
		Etapa_Id 	= p_Etapa_Id);
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_Seleccionar_Tipo_Test` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_Seleccionar_Tipo_Test`(p_Tipo_Test_Id INT)
begin
    (SELECT * FROM tipos_test WHERE Tipo_Test_Id = p_Tipo_Test_Id);
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_SelectAll_Adjuntos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_SelectAll_Adjuntos`()
begin
    (SELECT * FROM adjuntos);
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_SelectAll_Catalogos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_SelectAll_Catalogos`()
begin
    (SELECT * FROM catalogos);
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_SelectAll_Check_List` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_SelectAll_Check_List`()
begin

    (SELECT * FROM check_list);
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_SelectAll_Detalle_Revision` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_SelectAll_Detalle_Revision`()
begin
    (SELECT 
    proyecto_id, etapa_id, revision_id, check_list_id, Marcado, 
    DATE_FORMAT(Fecha, '%d/%m/%Y') as Fecha
    FROM detalle_revision);
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_SelectAll_Estados` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_SelectAll_Estados`()
begin
    (SELECT * FROM estados);
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_SelectAll_Etapas` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_SelectAll_Etapas`()
begin
    (SELECT * FROM etapas);
    end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_SelectAll_Proyectos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_SelectAll_Proyectos`()
begin
    (
		SELECT 
			p.Proyecto_Id , 
			Nombre, 
			User_Create, 
			Created, 
			p.Estado, 
			max(pe.etapa_id) as Etapa_Id, 
            -- max(e.Etapa) as Etapa,
			max(r.revision_id) as Revision_Id
		FROM proyectos as p
		INNER JOIN proy_etapas  as pe ON pe.proyecto_id = p.proyecto_id
        -- INNER JOIN etapas as e ON e.etapa_id = pe.etapa_id
		INNER JOIN revision as r ON r.proyecto_id = p.proyecto_id and r.etapa_id = pe.etapa_id
		group by Proyecto_Id, Nombre, user_create, created, estado   
    ) ;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_SelectAll_Proy_Etapas` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_SelectAll_Proy_Etapas`()
begin
    (SELECT * FROM proy_etapas);
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_SelectAll_Proy_Users` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_SelectAll_Proy_Users`()
begin
    (SELECT * FROM proy_users);
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_SelectAll_Revision` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_SelectAll_Revision`()
begin
    (SELECT * FROM revision);
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_SelectAll_Roles` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_SelectAll_Roles`()
begin
    (SELECT * FROM roles);
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_SelectAll_Tipos_Test` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_SelectAll_Tipos_Test`()
begin
    (SELECT * FROM tipos_test);
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_SelectAll_Usuarios` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_SelectAll_Usuarios`()
begin
    (SELECT * FROM usuarios);
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_Select_Adjunto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_Select_Adjunto`(
	p_Adjunto_Id 	INT, 
	p_Proyecto_Id 	INT, 
	p_Etapa_Id 		INT, 
	p_Revision_Id 	INT
	)
begin
    (SELECT * FROM adjuntos 
	WHERE 
	Adjunto_Id 	= p_Adjunto_Id AND 
	Proyecto_Id = p_Proyecto_Id AND 
	Etapa_Id 	= p_Etapa_Id AND 
	Revision_Id = p_Revision_Id);
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_Select_Catalogo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_Select_Catalogo`(p_tipo varchar(8))
begin
    (SELECT * FROM catalogos
    WHERE 
		tipo = p_tipo);
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_Select_Check_List` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_Select_Check_List`(p_Check_List_Id INT)
begin
    (SELECT * 
	FROM check_list 
	WHERE 
		Check_List_Id = p_Check_List_Id);
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_Select_Detalle_Revision` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_Select_Detalle_Revision`(
	-- p_Check_List_Id INT, 
	p_Proyecto_Id INT, 
	p_Etapa_Id INT, 
	p_Revision_Id INT)
begin	
    (SELECT * FROM detalle_revision 
	WHERE 
		-- Check_List_Id 	= p_Check_List_Id AND 
		Proyecto_Id 	= p_Proyecto_Id AND 
		Etapa_Id 		= p_Etapa_Id AND 
		Revision_Id 	= p_Revision_Id);
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_Select_Estado` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_Select_Estado`(p_Estado_Id INT)
begin
    (SELECT * 
	FROM estados 
	WHERE 
		Estado_Id = p_Estado_Id);
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_Select_Etapa` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_Select_Etapa`(p_Etapa_Id INT)
begin
    (SELECT * 
	FROM etapas 
	WHERE 
		Etapa_Id = p_Etapa_Id);
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_Select_Proyecto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_Select_Proyecto`(p_Proyecto_Id INT)
begin
    (SELECT * 
	FROM proyectos 
	WHERE 
		Proyecto_Id = p_Proyecto_Id);
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_Select_Proy_Etapa` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_Select_Proy_Etapa`(
	p_Proyecto_Id INT
	-- ,p_Etapa_Id INT
	)
begin
    (SELECT * FROM proy_etapas 
	WHERE 
		Proyecto_Id = p_Proyecto_Id 
        -- AND Etapa_Id 	= p_Etapa_Id 
	ORDER BY etapa_id DESC 
	LIMIT 1
	);
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_Select_Proy_Etapas` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_Select_Proy_Etapas`(
	p_Proyecto_Id int
    )
begin
    (SELECT * FROM proy_etapas
    WHERE 
		Proyecto_Id = p_Proyecto_Id 
	);
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_Select_Proy_User` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_Select_Proy_User`(p_Proyecto_Id INT, p_Username VARCHAR(24))
begin
    (SELECT * FROM proy_users WHERE Proyecto_Id = p_Proyecto_Id AND Username = p_Username);
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_Select_Revision` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_Select_Revision`(	
	p_Proyecto_Id INT, 
	p_Etapa_Id INT
	)
BEGIN
	DECLARE existing_count INT;
    SELECT count(*) INTO existing_count
    FROM revision     
	WHERE 
		-- Check_List_Id 	= p_Check_List_Id AND 
		Proyecto_Id 	= p_Proyecto_Id AND 
		Etapa_Id 		= p_Etapa_Id ;	
        
    IF( existing_count = 0 ) THEN
		INSERT INTO revision( Proyecto_Id, Etapa_id, Revision_id, Fecha, Estado,
        Cantidad_Defectos, Cantidad_Atrasos, Tasa_Defectos, Tasa_Correcciones, Tiempo_Resolucion) 
        values (p_Proyecto_Id,p_Etapa_Id, 1, now(), 'En Proceso',
        0, 0, 0, 0, 0 );
    END IF;
    
    (SELECT * 
	FROM revision 
	WHERE 		
		Proyecto_Id = p_Proyecto_Id AND 
		Etapa_Id 	= p_Etapa_Id
	ORDER BY Revision_Id DESC
	LIMIT 1
    );
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_Select_Rol` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_Select_Rol`(p_Rol_Id INT)
begin
    (SELECT * FROM roles WHERE Rol_Id = p_Rol_Id);
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_Select_Usuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_Select_Usuario`(p_Username VARCHAR(24))
begin
    (SELECT * FROM usuarios WHERE Username = p_Username);
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_Update_Adjunto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_Update_Adjunto`(
    IN p_Adjunto_Id INT,
    IN p_Proyecto_Id INT,
    IN p_Etapa_Id INT,
    IN p_Revision_Id INT,
    IN p_Filename VARCHAR(240),
    IN p_Created DATETIME,
    IN p_User_Created VARCHAR(24)
)
BEGIN
    UPDATE adjuntos
    SET Filename 	= p_Filename,
        Created 	= p_Created,
        User_Created = p_User_Created
    WHERE 
	Adjunto_Id 		= p_Adjunto_Id
    AND Proyecto_Id = p_Proyecto_Id
    AND Etapa_Id 	= p_Etapa_Id
    AND Revision_Id = p_Revision_Id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_Update_Check_List` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_Update_Check_List`(
    IN p_Check_List_Id INT,
    IN p_Item VARCHAR(64),
    IN Tipo_Test_Id INT,
    IN p_Activo INT
)
BEGIN
    UPDATE check_list
    SET 
		Item 			= p_Item,
        Activo 			= p_Activo,
        Tipo_Test_Id 	= Tipo_Test_Id
    WHERE 
		Check_List_Id 	= p_Check_List_Id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_Update_Detalle_Revision` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_Update_Detalle_Revision`(
    IN p_Check_List_Id INT,
    IN p_Proyecto_Id INT,
    IN p_Etapa_Id INT,
    IN p_Revision_Id INT,
    IN p_Marcado bit,
    IN p_Fecha DATETIME
)
BEGIN
    UPDATE detalle_revision
    SET Marcado = p_Marcado,
        Fecha = p_Fecha
    WHERE Check_List_Id 	= p_Check_List_Id
    AND Proyecto_Id 	= p_Proyecto_Id
    AND Etapa_Id 		= p_Etapa_Id
    AND Revision_Id 	= p_Revision_Id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_Update_EstadoProyecto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_Update_EstadoProyecto`(
    IN p_Proyecto_Id INT,    
    IN p_Estado VARCHAR(24)
)
BEGIN
    UPDATE proyectos
    SET 		
        Estado 		= p_Estado
    WHERE 
		Proyecto_Id = p_Proyecto_Id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_Update_Etapa` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_Update_Etapa`(
    IN p_Etapa_Id INT,
    IN p_Etapa VARCHAR(24)
)
BEGIN
    UPDATE etapas
    SET 
		Etapa 		= p_Etapa
    WHERE 
		Etapa_Id 	= p_Etapa_Id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_Update_Proyecto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_Update_Proyecto`(
    IN p_Proyecto_Id INT,
    IN p_Nombre VARCHAR(128),
    IN p_User_Create VARCHAR(24),
    IN p_Created DATETIME,
    IN p_Estado VARCHAR(24)
)
BEGIN
    UPDATE proyectos
    SET 
		Nombre 		= p_Nombre,
        User_Create = p_User_Create,
        Created 	= p_Created,
        Estado 		= p_Estado
    WHERE 
		Proyecto_Id = p_Proyecto_Id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_Update_Proy_Etapa` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_Update_Proy_Etapa`(
    IN p_Proyecto_Id INT,
    IN p_Etapa_Id INT,
    IN p_Estado VARCHAR(24),
    IN p_Dev VARCHAR(24),
    IN p_QA_Tester VARCHAR(24),
    IN p_Manual_Tecnico VARCHAR(128),
    IN p_Manual_Despliegue VARCHAR(128),
    IN p_Cronograma VARCHAR(128),
    IN p_Ambiente VARCHAR(128),
    IN p_Accesso VARCHAR(128),
    IN p_Permisos VARCHAR(128),
    IN p_Instancia_DB VARCHAR(128),
    IN p_Server_Name VARCHAR(24),
    IN p_Fecha_Inicio DATETIME,
    IN p_Fecha_Final DATETIME
)
BEGIN
    UPDATE proy_etapas
    SET 
		Estado 				= p_Estado,
        Dev 				= p_Dev,
        QA_Tester 			= p_QA_Tester,
        Manual_Tecnico 		= p_Manual_Tecnico,
        Manual_Despliegue 	= p_Manual_Despliegue,
        Cronograma 			= p_Cronograma,
        Ambiente 			= p_Ambiente,
        Accesso 			= p_Accesso,
        Permisos 			= p_Permisos,
        Instancia_DB 		= p_Instancia_DB,
        Server_Name 		= p_Server_Name,
        Fecha_Inicio 		= p_Fecha_Inicio,
        Fecha_Final 		= p_Fecha_Final
    WHERE 
		Proyecto_Id 		= p_Proyecto_Id
    AND 
		Etapa_Id 			= p_Etapa_Id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_Update_Proy_User` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_Update_Proy_User`(
    IN p_Proyecto_Id INT,
    IN p_Username VARCHAR(24),
    IN p_Fecha DATETIME,
    IN p_Estado VARCHAR(24)
)
BEGIN
    UPDATE proy_users
    SET Fecha = p_Fecha,
        Estado = p_Estado
    WHERE Proyecto_Id = p_Proyecto_Id
    AND Username = p_Username;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_Update_Revision` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_Update_Revision`(
    IN p_Revision_Id INT,
    IN p_Proyecto_Id INT,
    IN p_Etapa_Id INT,
    IN p_Fecha DATETIME,
    IN p_Estado VARCHAR(24),
--  ADD-IN
	IN p_Cantidad_Defectos INT,
	IN p_Cantidad_Atrasos INT,
	IN p_Tasa_Defectos INT,
	IN p_Tasa_Correcciones INT,
	IN p_Tiempo_Resolucion INT
)
BEGIN
    UPDATE revision
    SET 
		  Fecha 			= p_Fecha
        , Estado 			= p_Estado
--  ADD-IN		
		, Cantidad_Defectos 	= p_Cantidad_Defectos
		, Cantidad_Atrasos  	= p_Cantidad_Atrasos
		, Tasa_Defectos			= p_Tasa_Defectos
		, Tasa_Correcciones 	= p_Tasa_Correcciones
		, Tiempo_Resolucion 	= p_Tiempo_Resolucion

    WHERE 
		Revision_Id = p_Revision_Id AND 
		Proyecto_Id = p_Proyecto_Id AND 
		Etapa_Id 	= p_Etapa_Id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_Update_Rol` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_Update_Rol`(
    IN p_Rol_Id INT,
    IN p_Rolname VARCHAR(24),
    IN p_Estado VARCHAR(24)
)
BEGIN
    UPDATE roles
    SET Rolname = p_Rolname,
        Estado = p_Estado
    WHERE Rol_Id = p_Rol_Id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_Update_Tipo_Test` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_Update_Tipo_Test`(
    IN p_Tipo_Test_Id INT,
    IN p_Tipo VARCHAR(24)
)
BEGIN
    UPDATE tipos_test
    SET Tipo = p_Tipo
    WHERE Tipo_Test_Id = p_Tipo_Test_Id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_Update_Usuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_Update_Usuario`(
    IN p_Username VARCHAR(24),
    IN p_Fullname VARCHAR(24),
    IN p_Email VARCHAR(128),
    IN p_Estado VARCHAR(24),
    IN p_Rol_Id INT,
    IN p_Pwd VARCHAR(24)
    -- IN p_Created DATETIME,
    -- IN p_User_Create VARCHAR(24)
)
BEGIN
    UPDATE usuarios
    SET Fullname 	= p_Fullname,
		Email 		= p_Email,
        Estado 		= p_Estado,
        Rol_Id 		= p_Rol_Id,
        Pwd 		= p_Pwd        
    WHERE Username 	= p_Username;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-11-19 22:12:40
