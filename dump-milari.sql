-- MySQL dump 10.16  Distrib 10.1.11-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: milari
-- ------------------------------------------------------
-- Server version	10.1.11-MariaDB-log

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
-- Table structure for table `t_admin`
--

DROP TABLE IF EXISTS `t_admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_admin` (
  `id_admin` int(11) NOT NULL AUTO_INCREMENT,
  `name_admin` varchar(64) NOT NULL,
  `email_admin` varchar(64) NOT NULL,
  PRIMARY KEY (`id_admin`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_admin`
--

LOCK TABLES `t_admin` WRITE;
/*!40000 ALTER TABLE `t_admin` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_kuliah`
--

DROP TABLE IF EXISTS `t_kuliah`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_kuliah` (
  `kode_kuliah` varchar(8) NOT NULL,
  `waktu_awal_kuliah` datetime NOT NULL,
  `waktu_akhir_kuliah` datetime NOT NULL,
  PRIMARY KEY (`kode_kuliah`),
  UNIQUE KEY `kode_kuliah_UNIQUE` (`kode_kuliah`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_kuliah`
--

LOCK TABLES `t_kuliah` WRITE;
/*!40000 ALTER TABLE `t_kuliah` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_kuliah` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_kuliah_ruang_kuliah`
--

DROP TABLE IF EXISTS `t_kuliah_ruang_kuliah`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_kuliah_ruang_kuliah` (
  `id_penggunaan` int(11) NOT NULL AUTO_INCREMENT,
  `kode_kuliah` varchar(8) NOT NULL,
  `kode_ruang_kuliah` int(11) NOT NULL,
  `status` varchar(8) DEFAULT NULL,
  PRIMARY KEY (`id_penggunaan`),
  UNIQUE KEY `kode_kuliah_UNIQUE` (`kode_kuliah`),
  UNIQUE KEY `kode_ruang_kuliah_UNIQUE` (`kode_ruang_kuliah`),
  CONSTRAINT `fk_t_kuliah_ruang_kuliah_1` FOREIGN KEY (`kode_kuliah`) REFERENCES `t_kuliah` (`kode_kuliah`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_t_kuliah_ruang_kuliah_2` FOREIGN KEY (`kode_ruang_kuliah`) REFERENCES `t_ruang_kuliah` (`kode_ruang_kuliah`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_kuliah_ruang_kuliah`
--

LOCK TABLES `t_kuliah_ruang_kuliah` WRITE;
/*!40000 ALTER TABLE `t_kuliah_ruang_kuliah` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_kuliah_ruang_kuliah` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_peminjam`
--

DROP TABLE IF EXISTS `t_peminjam`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_peminjam` (
  `id_peminjaman` int(11) NOT NULL AUTO_INCREMENT,
  `nim_peminjam` int(11) NOT NULL,
  `no_hp_peminjam` int(11) NOT NULL,
  `nama_peminjam` varchar(64) NOT NULL,
  PRIMARY KEY (`id_peminjaman`),
  UNIQUE KEY `id_peminjaman_UNIQUE` (`id_peminjaman`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_peminjam`
--

LOCK TABLES `t_peminjam` WRITE;
/*!40000 ALTER TABLE `t_peminjam` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_peminjam` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_peminjaman`
--

DROP TABLE IF EXISTS `t_peminjaman`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_peminjaman` (
  `id_peminjaman` int(11) NOT NULL AUTO_INCREMENT,
  `id_peminjam` int(11) NOT NULL,
  `kode_ruang_kuliah` int(11) NOT NULL,
  `waktu_pemesanan` datetime NOT NULL,
  `waktu_awal_peminjaman` datetime NOT NULL,
  `waktu_akhir_peminjaman` datetime NOT NULL,
  `keperluan_peminjaman` varchar(256) DEFAULT NULL,
  `status_peminjaman` varchar(8) DEFAULT NULL,
  PRIMARY KEY (`id_peminjaman`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_peminjaman`
--

LOCK TABLES `t_peminjaman` WRITE;
/*!40000 ALTER TABLE `t_peminjaman` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_peminjaman` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_ruang_kuliah`
--

DROP TABLE IF EXISTS `t_ruang_kuliah`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_ruang_kuliah` (
  `kode_ruang_kuliah` int(11) NOT NULL,
  `kapasitas_ruang_kuliah` int(11) NOT NULL,
  `status_ruang_kuliah` varchar(16) NOT NULL,
  PRIMARY KEY (`kode_ruang_kuliah`),
  UNIQUE KEY `kode_ruang_kuliah_UNIQUE` (`kode_ruang_kuliah`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_ruang_kuliah`
--

LOCK TABLES `t_ruang_kuliah` WRITE;
/*!40000 ALTER TABLE `t_ruang_kuliah` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_ruang_kuliah` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-02-08 16:31:39
