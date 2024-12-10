-- MySQL dump 10.13  Distrib 5.7.9, for Win64 (x86_64)
--
-- Host: localhost    Database: tracingapp
-- ------------------------------------------------------
-- Server version	5.6.26

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
-- Table structure for table `mt_clientes`
--
/* 
3600
4580-390
800
1990
1190
2650

14420
 */
-- REPOSITORIE COMPLETE --------------

DROP TABLE IF EXISTS `mt_clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mt_clientes` (
 `mt_cli_id` int(11) NOT NULL AUTO_INCREMENT,
`mt_cli_per_id` int(11) NOT NULL,  ----fk persona
`mt_cli_direccion` varchar(300) DEFAULT NULL,
`mt_cli_fecha_nacimiento` date NOT NULL,
`mt_cli_telefono` varchar(13) DEFAULT NULL,
`mt_cli_tipo_consumidor` int(11) NOT NULL, ----fk parametro
`mt_cli_banco` varchar(45) DEFAULT NULL,
`mt_cli_tipo_cuenta` int(11) NOT NULL, ----fk parametro
`mt_cli_cbu` varchar(22) NOT NULL,
mt_cli_provincia varchar(300)
mt_cli_localidad varchar(300)
mt_cli_cuil varchar(22)
mt_cli_telefono2 varchar(13)
mt_cli_observaciones varchar(3000)
mt_cli_tipo_cliente int(11) ----fk parametro
  PRIMARY KEY (`mt_cli_id`),
  KEY `fk_mt_cli_per_id_idx` (`mt_cli_per_id`),
  KEY `fk_mt_cli_tipo_consumidor_idx` (`mt_cli_tipo_consumidor`),
  KEY `fk_mt_cli_tipo_cuenta_idx` (`mt_cli_tipo_cuenta`),
  CONSTRAINT `fk_mt_cli_per_id` FOREIGN KEY (`mt_cli_per_id`) REFERENCES `mt_personas` (`mt_per_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_mt_cli_tipo_consumidor` FOREIGN KEY (`mt_cli_tipo_consumidor`) REFERENCES `tt_parametros` (`tt_param_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_mt_cli_tipo_cuenta` FOREIGN KEY (`mt_cli_tipo_cuenta`) REFERENCES `tt_parametros` (`tt_param_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mt_clientes`
--

LOCK TABLES `mt_clientes` WRITE;
/*!40000 ALTER TABLE `mt_clientes` DISABLE KEYS */;
INSERT INTO `mt_clientes` VALUES (1,8,'9 de julio 1050','1995-03-03','0261153029504',3,'Santander Rio',2,'123456789098765432123'),(2,9,'España 1890','1954-12-29','0261155857438',4,'Nacion',1,'1234567890987654321234');
/*!40000 ALTER TABLE `mt_clientes` ENABLE KEYS */;
UNLOCK TABLES;

ALTER TABLE `mt_clientes` ADD `mt_cli_alertaBateria` INT NULL DEFAULT NULL AFTER `mt_cli_tipo_cliente`;
ALTER TABLE `mt_clientes` ADD `mt_cli_cambioBateria` TIMESTAMP NULL DEFAULT NULL AFTER `mt_cli_tipo_cliente`;
ALTER TABLE `mt_clientes` CHANGE `mt_cli_cambioBateria` `mt_cli_cambioBateria` DATE NULL DEFAULT NULL;
ALTER TABLE `mt_clientes` CHANGE `mt_cli_alertaBateria` `mt_cli_alertaBateria` BOOLEAN NOT NULL DEFAULT FALSE;
ALTER TABLE `mt_clientes` ADD `mt_cli_productosInstalados` JSON NULL DEFAULT NULL AFTER `mt_cli_cambioBateria`;
-- Table structure for table `mt_personas`
--


-- REPOSITORIE COMPLETE --------------

DROP TABLE IF EXISTS `mt_personas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mt_personas` (
  `mt_per_id` int(11) NOT NULL AUTO_INCREMENT,
  `mt_per_nombre` varchar(45) NOT NULL,
  `mt_per_apellido` varchar(45) NOT NULL,
  `mt_per_email` varchar(100) NOT NULL,
  PRIMARY KEY (`mt_per_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mt_personas`
--

LOCK TABLES `mt_personas` WRITE;
/*!40000 ALTER TABLE `mt_personas` DISABLE KEYS */;
INSERT INTO `mt_personas` VALUES (2,'Juan','Churin','juanchurin@gmail.com'),(3,'Jerónimo','Pizarro','jpizarroq@gmail.com'),(7,'Maron','Abdala','mabdala@gmail.com'),(8,'Jorge','Murgo','jmurgo@gmail.com'),(9,'Graciela','Galaverna','ggalaverna@gmail.com');
/*!40000 ALTER TABLE `mt_personas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mt_usuarios`
--

DROP TABLE IF EXISTS `mt_usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;

-- REPOSITORIE COMPLETE --------------

CREATE TABLE `mt_usuarios` (
  `mt_usr_id` int(11) NOT NULL AUTO_INCREMENT,
  `mt_usr_per_id` int(11) NOT NULL,
  `mt_usr_username` varchar(45) NOT NULL,
  `mt_usr_password` varchar(45) NOT NULL,
  `mt_usr_rol` int(11) NOT NULL,
  PRIMARY KEY (`mt_usr_id`),
  KEY `fk_mt_usr_per_id_idx` (`mt_usr_per_id`),
  CONSTRAINT `fk_mt_usr_per_id` FOREIGN KEY (`mt_usr_per_id`) REFERENCES `mt_personas` (`mt_per_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mt_usuarios`
--

LOCK TABLES `mt_usuarios` WRITE;
/*!40000 ALTER TABLE `mt_usuarios` DISABLE KEYS */;
INSERT INTO `mt_usuarios` VALUES (2,2,'jchurin','97380c892f8811a6d866f32a0190bda0',1),(3,3,'jpizarro','30f8661b238421884a80bcdf485bceac',1),(7,7,'mabdala','078404cec1de53dafe830f29a51a5590',1);
/*!40000 ALTER TABLE `mt_usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tt_parametros`
--


-- REPOSITORIE COMPLETE --------------


DROP TABLE IF EXISTS `tt_parametros`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tt_parametros` (
  `tt_param_id` int(11) NOT NULL AUTO_INCREMENT,
  `tt_param_nombre` varchar(45) NOT NULL,
  `tt_param_codigo` varchar(45) NOT NULL,
  PRIMARY KEY (`tt_param_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tt_parametros`
--

LOCK TABLES `tt_parametros` WRITE;
/*!40000 ALTER TABLE `tt_parametros` DISABLE KEYS */;
INSERT INTO `tt_parametros` VALUES (1,'Caja de ahorro','TIPO_CUENTA'),(2,'Cuenta corriente','TIPO_CUENTA'),(3,'Consumidor final','TIPO_CONSUMIDOR'),(4,'Monotributista','TIPO_CONSUMIDOR'),(5,'Instalacion de alarma','TIPO_SERVICIO');
/*!40000 ALTER TABLE `tt_parametros` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tt_servicios`
--

DROP TABLE IF EXISTS `tt_servicios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tt_servicios` (
  `tt_srvc_id` int(11) NOT NULL AUTO_INCREMENT,
  `tt_srvc_cli_id` int(11) NOT NULL,
  `tt_srvc_tipo` int(11) NOT NULL,
  `tt_srvc_precio` decimal(8,2) NOT NULL,
  `tt_srvc_observaciones` varchar(500) DEFAULT NULL,
  `tt_srvc_estado` int(11) NOT NULL,
  `tt_srvc_fecha` date NOT NULL,
  `tt_srvc_tecnico` varchar(45) NOT NULL,
  PRIMARY KEY (`tt_srvc_id`),
  KEY `fk_tt_srvc_cli_id_idx` (`tt_srvc_cli_id`),
  KEY `fk_tt_srvc_tipo_idx` (`tt_srvc_tipo`),
  CONSTRAINT `fk_tt_srvc_cli_id` FOREIGN KEY (`tt_srvc_cli_id`) REFERENCES `mt_clientes` (`mt_cli_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tt_srvc_tipo` FOREIGN KEY (`tt_srvc_tipo`) REFERENCES `tt_parametros` (`tt_param_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tt_servicios`
--

LOCK TABLES `tt_servicios` WRITE;
/*!40000 ALTER TABLE `tt_servicios` DISABLE KEYS */;
INSERT INTO `tt_servicios` VALUES (1,2,5,250.00,'No hay observaciones',1,'2017-02-01','Robertito');
/*!40000 ALTER TABLE `tt_servicios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `view_clientes`
--

DROP TABLE IF EXISTS `view_clientes`;
/*!50001 DROP VIEW IF EXISTS `view_clientes`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `view_clientes` AS SELECT 
 1 AS `id`,
 1 AS `nombre`,
 1 AS `apellido`,
 1 AS `email`,
 1 AS `direccion`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_servicios`
--

DROP TABLE IF EXISTS `view_servicios`;
/*!50001 DROP VIEW IF EXISTS `view_servicios`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `view_servicios` AS SELECT 
 1 AS `id`,
 1 AS `nombre`,
 1 AS `direccion`,
 1 AS `tipo`,
 1 AS `precio`,
 1 AS `tecnico`,
 1 AS `fecha`,
 1 AS `estado`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_usuarios`
--

DROP TABLE IF EXISTS `view_usuarios`;
/*!50001 DROP VIEW IF EXISTS `view_usuarios`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `view_usuarios` AS SELECT 
 1 AS `id`,
 1 AS `nombre`,
 1 AS `apellido`,
 1 AS `email`,
 1 AS `username`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping events for database 'tracingapp'
--

--
-- Dumping routines for database 'tracingapp'
--

--
-- Final view structure for view `view_clientes`
--

/*!50001 DROP VIEW IF EXISTS `view_clientes`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_clientes` AS select `cli`.`mt_cli_id` AS `id`,`per`.`mt_per_nombre` AS `nombre`,`per`.`mt_per_apellido` AS `apellido`,`per`.`mt_per_email` AS `email`,`cli`.`mt_cli_direccion` AS `direccion` from (`mt_clientes` `cli` join `mt_personas` `per` on((`cli`.`mt_cli_per_id` = `per`.`mt_per_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_servicios`
--

/*!50001 DROP VIEW IF EXISTS `view_servicios`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_servicios` AS select `srvc`.`tt_srvc_id` AS `id`,concat(`per`.`mt_per_nombre`,' ',`per`.`mt_per_apellido`) AS `nombre`,`cli`.`mt_cli_direccion` AS `direccion`,`param`.`tt_param_nombre` AS `tipo`,`srvc`.`tt_srvc_precio` AS `precio`,`srvc`.`tt_srvc_tecnico` AS `tecnico`,`srvc`.`tt_srvc_fecha` AS `fecha`,`srvc`.`tt_srvc_estado` AS `estado` from (((`tt_servicios` `srvc` join `mt_clientes` `cli` on((`srvc`.`tt_srvc_cli_id` = `cli`.`mt_cli_id`))) join `mt_personas` `per` on((`cli`.`mt_cli_per_id` = `per`.`mt_per_id`))) join `tt_parametros` `param` on((`srvc`.`tt_srvc_tipo` = `param`.`tt_param_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_usuarios`
--

/*!50001 DROP VIEW IF EXISTS `view_usuarios`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_usuarios` AS select `usr`.`mt_usr_id` AS `id`,`per`.`mt_per_nombre` AS `nombre`,`per`.`mt_per_apellido` AS `apellido`,`per`.`mt_per_email` AS `email`,`usr`.`mt_usr_username` AS `username` from (`mt_usuarios` `usr` join `mt_personas` `per` on((`usr`.`mt_usr_per_id` = `per`.`mt_per_id`))) */;
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

-- Dump completed on 2017-02-01 20:26:12
