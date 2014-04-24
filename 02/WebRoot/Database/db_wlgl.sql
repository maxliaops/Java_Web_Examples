-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.1.40-community


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema db_wlgl
--

CREATE DATABASE IF NOT EXISTS db_wlgl;
USE db_wlgl;

--
-- Definition of table `tb_admin`
--

DROP TABLE IF EXISTS `tb_admin`;
CREATE TABLE `tb_admin` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `admin_user` varchar(50) NOT NULL,
  `admin_password` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=gb2312;

--
-- Dumping data for table `tb_admin`
--

/*!40000 ALTER TABLE `tb_admin` DISABLE KEYS */;
INSERT INTO `tb_admin` (`id`,`admin_user`,`admin_password`) VALUES 
 (1,'mr','mrsoft');
/*!40000 ALTER TABLE `tb_admin` ENABLE KEYS */;


--
-- Definition of table `tb_car`
--

DROP TABLE IF EXISTS `tb_car`;
CREATE TABLE `tb_car` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `user_number` varchar(50) NOT NULL,
  `car_number` varchar(50) NOT NULL,
  `tel` varchar(50) NOT NULL,
  `address` varchar(80) NOT NULL,
  `car_road` varchar(50) NOT NULL,
  `car_content` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=gb2312;

--
-- Dumping data for table `tb_car`
--

/*!40000 ALTER TABLE `tb_car` DISABLE KEYS */;
INSERT INTO `tb_car` (`id`,`username`,`user_number`,`car_number`,`tel`,`address`,`car_road`,`car_content`) VALUES 
 (11,'小三','333333333333333','33333','84978981','长春市','长春――上海','无'),
 (9,'小一','111111111111111','11111','84978981','长春市','长春――哈尔滨','没有了'),
 (10,'小二','222222222222222','22222','84978981','长春市','长春――辽宁','无');
/*!40000 ALTER TABLE `tb_car` ENABLE KEYS */;


--
-- Definition of table `tb_carlog`
--

DROP TABLE IF EXISTS `tb_carlog`;
CREATE TABLE `tb_carlog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_id` varchar(255) NOT NULL,
  `car_id` int(11) NOT NULL,
  `startTime` varchar(255) NOT NULL,
  `endTime` varchar(255) NOT NULL,
  `describer` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=gb2312;

--
-- Dumping data for table `tb_carlog`
--

/*!40000 ALTER TABLE `tb_carlog` DISABLE KEYS */;
INSERT INTO `tb_carlog` (`id`,`goods_id`,`car_id`,`startTime`,`endTime`,`describer`) VALUES 
 (15,'1305783681593',10,'2011-05-19','2011-05-19','没有'),
 (17,'1305783758281',11,'2011-5-19','2011-5-19','无');
/*!40000 ALTER TABLE `tb_carlog` ENABLE KEYS */;


--
-- Definition of table `tb_customer`
--

DROP TABLE IF EXISTS `tb_customer`;
CREATE TABLE `tb_customer` (
  `customer_id` int(10) NOT NULL AUTO_INCREMENT,
  `customer_user` varchar(50) NOT NULL,
  `customer_tel` varchar(50) NOT NULL,
  `customer_address` varchar(80) NOT NULL,
  PRIMARY KEY (`customer_id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=gb2312;

--
-- Dumping data for table `tb_customer`
--

/*!40000 ALTER TABLE `tb_customer` DISABLE KEYS */;
INSERT INTO `tb_customer` (`customer_id`,`customer_user`,`customer_tel`,`customer_address`) VALUES 
 (1,'张一','0431-12345678','长春市'),
 (3,'张三','0431-98765432','长春市'),
 (4,'张四','0431-36925810','吉林市'),
 (5,'张五','0432-12345678','吉林市'),
 (6,'张六','0433-45612378','白山市'),
 (7,'张七','0434-56666233','四平市'),
 (8,'张八','0431-46454541','长春市'),
 (9,'张九','0431-78787888','长春市'),
 (10,'张十','0431-33333333','长春市'),
 (11,'张零','0431-12345678','九台市');
/*!40000 ALTER TABLE `tb_customer` ENABLE KEYS */;


--
-- Definition of table `tb_operationgoods`
--

DROP TABLE IF EXISTS `tb_operationgoods`;
CREATE TABLE `tb_operationgoods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `car_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `goods_id` varchar(255) NOT NULL,
  `goods_name` varchar(255) NOT NULL,
  `goods_tel` varchar(255) NOT NULL,
  `goods_address` varchar(255) NOT NULL,
  `goods_sure` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=gb2312;

--
-- Dumping data for table `tb_operationgoods`
--

/*!40000 ALTER TABLE `tb_operationgoods` DISABLE KEYS */;
INSERT INTO `tb_operationgoods` (`id`,`car_id`,`customer_id`,`goods_id`,`goods_name`,`goods_tel`,`goods_address`,`goods_sure`) VALUES 
 (15,10,11,'1305783681593','一一','4564','吉林',1),
 (17,11,11,'1305783758281','三三','7474','辽宁',1);
/*!40000 ALTER TABLE `tb_operationgoods` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
