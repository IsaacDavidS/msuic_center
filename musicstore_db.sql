CREATE DATABASE  IF NOT EXISTS `musicstore_db` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `musicstore_db`;
-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: localhost    Database: musicstore_db
-- ------------------------------------------------------
-- Server version	8.0.28

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
-- Table structure for table `carts`
--

DROP TABLE IF EXISTS `carts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `usuario_id` int DEFAULT NULL,
  `producto_id` int DEFAULT NULL,
  `cantidad` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `carts_usuario_id_foreign` (`usuario_id`),
  KEY `carts_producto_id_foreign` (`producto_id`),
  CONSTRAINT `carts_producto_id_foreign` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`id`),
  CONSTRAINT `carts_usuario_id_foreign` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carts`
--

LOCK TABLES `carts` WRITE;
/*!40000 ALTER TABLE `carts` DISABLE KEYS */;
/*!40000 ALTER TABLE `carts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categorias`
--

DROP TABLE IF EXISTS `categorias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categorias` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `titulo` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorias`
--

LOCK TABLES `categorias` WRITE;
/*!40000 ALTER TABLE `categorias` DISABLE KEYS */;
INSERT INTO `categorias` VALUES (1,'teclados'),(2,'auriculares'),(3,'controladores'),(4,'tocadiscos'),(5,'guitarras'),(6,'consolas'),(7,'adapdatores');
/*!40000 ALTER TABLE `categorias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productos`
--

DROP TABLE IF EXISTS `productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `titulo` varchar(100) NOT NULL,
  `descripcion` text,
  `img` varchar(100) DEFAULT NULL,
  `precio` int NOT NULL,
  `caracteristicas` text,
  `stock` int DEFAULT '0',
  `categoria_id` int DEFAULT NULL,
  `isRecommended` tinyint DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `productos_categoria_id_foreign` (`categoria_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos`
--

LOCK TABLES `productos` WRITE;
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
INSERT INTO `productos` VALUES (2,'La consola de Dj Chimango','Tocadiscos digital ultima tecnologia','1645661662372_img_.jpg',1518,'GEl motor de par más potente del mundo (4,5 kgf-cm) - Construcción de acero resistente - Plato y brazo de tono ultraestables - Ajuste de velocidad de arranque/freno',5,6,1,'2022-01-03 15:45:40','2022-02-24 00:14:22'),(3,'Controlador MIDI Pioneer','Controlador Potente','img-controlador.jpg',3501,'Controlador de DJ de 2 canales para computadora portátil, teléfonos inteligentes y tabletas con conectividad Bluetooth incorporada. Controle sus mezclas desde todos sus dispositivos, incluidos Android, iOS, PC y Mac con 1 controlador, 1 programa, 2 aplicaciones, 3 modos con solo un dedo',25,3,1,'2022-01-04 16:50:33','2022-01-23 18:30:45'),(4,'Pioneer CDJ-2000NXS2','Consola Mixer','img-consola.jpg',2500,'Dos bancos de cuatro Hot Cues le brindan más libertad creativa, mientras que una tarjeta de sonido de 96 kHz/24 bits y soporte para FLAC/Apple Lossless Audio (ALAC) significa que puede jugar con formatos de mayor resolución. ',30,6,1,'2022-01-05 17:50:35','2022-01-24 20:30:35'),(5,'Consola DMX NAVIGATOR','Consola Navigator','img-consola-dmxNavigator.jpg',1600,'Salida de línea o fono seleccionable (la corrección de clave funciona solo en salida de línea) - Botones duales de inicio/parada - Brazo de tono ajustable en altura - Reproducción inversa - 3 velocidades (33, 45, 78)',30,6,1,'2022-01-06 18:30:55','2022-01-25 17:10:15'),(6,'Teclado Alesis','Teclado con MIDI','midi.jpg',2600,'Beat Color Effect es una primicia en la industria. Sidechaining agrega una nueva capa de control. Beat Effect escucha la entrada de audio de cada canal y conecta los cambios de volumen con otros parámetros, lo que facilita la  combinación de nuevos sonidos y efectos .',25,1,1,'2022-01-07 19:50:25','2022-01-25 23:40:35'),(7,'Adaptadores JACK JK-3000','Adaptadores para consola DJ','img-adaptador-jack.jpg',1100,'La aplicación sennheiser smart control app proporciona un ecualizador, modo de podcast y actualizaciones de firmware',20,7,1,'2022-01-08 23:40:55','2022-01-26 22:10:25'),(8,'Microfono Senheiser con Adaptador y Estuche','Microfono Potente','img-microfono.jpg',1600,'Preparado y listo con efectos preconfigurados con calidad de estudio accesibles con solo tocar un botón, el mezclador ofrece infinitas posibilidades creativas y una experiencia de DJ inigualable',30,7,0,'2022-01-10 00:45:35','2022-01-27 23:10:35'),(9,'Guitarra Electrica Gibson Les Paul Standard USA 2020 Heritage Cherry','Guitarra Gibson','img-guitarra.jpg',3600,'Rinde homenaje a la Era Dorada de la innovación de Gibson y le da vida a la autenticidad. El Les Paul Standard 50s tiene un cuerpo sólido de caoba con una tapa de arce, un cuello redondeado de caoba estilo años 50 con un diapasón de palo de rosa e incrustaciones trapezoidales.',30,5,0,'2022-01-11 00:40:55','2022-01-28 23:10:25'),(10,'Bafle Driver Tita','Bafle con sonido HD','img-bafle-driverTita.jpg',2600,'La tarjeta de sonido integrada de 4 canales estéreo hace que la configuración sea increíblemente simple, con  conexión a PC y portátiles que requieren solo un cable .',30,2,1,'2022-01-12 01:45:55','2022-01-29 00:36:25'),(12,'La consola de Rocko','ffgfdhgfhfgjfhjhfjfjfghjh','1645661838547_img_.jpg',5020,'sgdfhfgjghjghkjghjkhgjghdsfsgsfhfxhdfhjdgjgfnvbnvmghjkhgdjrghdfhdf',8,2,1,'2022-02-24 00:17:18','2022-02-24 00:17:18');
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `lastName` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(200) NOT NULL,
  `userImage` varchar(100) DEFAULT NULL,
  `isAdmin` tinyint DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'Isaac','Ackerman','isaac.ackerman@ymail.com','123callefalsa','usuario-1.jpg',1,'2022-01-13 01:45:55','2022-01-30 00:36:25'),(2,'Rama','Bernard','rama.bernard@ymail.com','kunt123','usuario-2.jpg',1,'2022-01-14 02:45:35','2022-01-29 19:45:15'),(3,'Isaac','Solis','isaac.david@ymail.com','$2a$10$V2iD9cK8L.RaSYuejIH5ju9Qt.do46AGtJzG4gGYHVAALpdhYkVIS','default.svg',1,'2022-02-23 08:54:00','2022-02-23 08:54:00'),(4,'Ramiro','Beccar','ramiro.beccar@ymail.com','$2a$10$csqXo4z9iZAn8KkfGbNu3eMthV.nExkXmWxYQsIitJckM4zwX4.jO','1645652952064_img_.jpg',1,'2022-02-23 21:25:15','2022-02-23 21:49:12'),(5,'Isaac','David','isaac.solis@ymail.com','$2a$10$qhgEIsuCOYKCgb96pMkTNeyAeVQdIY/QASB5eUR1cv3.eIRVQ0ZB.','1645652906944_img_.jpg',1,'2022-02-23 21:43:36','2022-02-23 21:48:26'),(6,'Ramiro','Andres','ramiro.andres@ymail.com','$2a$10$SBb1YmU4QDDGAa4BgMXOA./yTakcSmWjvxAGNCRsxNDqRuxStjvqS','1645661515730_img_.jpg',0,'2022-02-24 00:11:55','2022-02-24 00:11:55');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-02-24 19:34:27
