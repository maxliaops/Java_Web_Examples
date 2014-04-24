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
-- Create schema db_librarysys
--

CREATE DATABASE IF NOT EXISTS db_librarysys;
USE db_librarysys;

--
-- Definition of table `tb_bookcase`
--

DROP TABLE IF EXISTS `tb_bookcase`;
CREATE TABLE `tb_bookcase` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=gbk;

--
-- Dumping data for table `tb_bookcase`
--

/*!40000 ALTER TABLE `tb_bookcase` DISABLE KEYS */;
INSERT INTO `tb_bookcase` (`id`,`name`) VALUES 
 (4,'左A-1'),
 (5,'左A-2'),
 (6,'右A-1');
/*!40000 ALTER TABLE `tb_bookcase` ENABLE KEYS */;


--
-- Definition of table `tb_bookinfo`
--

DROP TABLE IF EXISTS `tb_bookinfo`;
CREATE TABLE `tb_bookinfo` (
  `barcode` varchar(30) DEFAULT NULL,
  `bookname` varchar(70) DEFAULT NULL,
  `typeid` int(10) unsigned DEFAULT NULL,
  `author` varchar(30) DEFAULT NULL,
  `translator` varchar(30) DEFAULT NULL,
  `ISBN` varchar(20) DEFAULT NULL,
  `price` float(8,2) DEFAULT NULL,
  `page` int(10) unsigned DEFAULT NULL,
  `bookcase` int(10) unsigned DEFAULT NULL,
  `inTime` date DEFAULT NULL,
  `operator` varchar(30) DEFAULT NULL,
  `del` tinyint(1) DEFAULT '0',
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=gbk;

--
-- Dumping data for table `tb_bookinfo`
--

/*!40000 ALTER TABLE `tb_bookinfo` DISABLE KEYS */;
INSERT INTO `tb_bookinfo` (`barcode`,`bookname`,`typeid`,`author`,`translator`,`ISBN`,`price`,`page`,`bookcase`,`inTime`,`operator`,`del`,`id`) VALUES 
 ('9787302210337','Java Web开发实战宝典',4,'王国辉','','302',89.00,834,4,'2011-02-24','mr',0,7),
 ('9787115195975','Java Web开发典型模块大全',4,'王国辉、王毅、王殊宇','','115',89.00,752,5,'2011-02-24','mr',0,8),
 ('4521212','njknjn',5,'mnm','','115',11.00,0,4,'2011-02-24','mr',1,9),
 ('gf','gfhgf',4,'','','111',26.00,0,4,'2011-02-24','mr',1,10);
/*!40000 ALTER TABLE `tb_bookinfo` ENABLE KEYS */;


--
-- Definition of table `tb_booktype`
--

DROP TABLE IF EXISTS `tb_booktype`;
CREATE TABLE `tb_booktype` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `typename` varchar(30) DEFAULT NULL,
  `days` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=gbk;

--
-- Dumping data for table `tb_booktype`
--

/*!40000 ALTER TABLE `tb_booktype` DISABLE KEYS */;
INSERT INTO `tb_booktype` (`id`,`typename`,`days`) VALUES 
 (4,'网络编程',20),
 (5,'数据库开发',15);
/*!40000 ALTER TABLE `tb_booktype` ENABLE KEYS */;


--
-- Definition of table `tb_borrow`
--

DROP TABLE IF EXISTS `tb_borrow`;
CREATE TABLE `tb_borrow` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `readerid` int(10) unsigned DEFAULT NULL,
  `bookid` int(10) DEFAULT NULL,
  `borrowTime` date DEFAULT NULL,
  `backTime` date DEFAULT NULL,
  `operator` varchar(30) DEFAULT NULL,
  `ifback` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=gbk;

--
-- Dumping data for table `tb_borrow`
--

/*!40000 ALTER TABLE `tb_borrow` DISABLE KEYS */;
INSERT INTO `tb_borrow` (`id`,`readerid`,`bookid`,`borrowTime`,`backTime`,`operator`,`ifback`) VALUES 
 (7,4,7,'2011-02-24','2011-03-16','mr',1),
 (8,4,7,'2011-02-24','2011-03-16','mr',0),
 (9,5,8,'2011-02-24','2011-04-05','mr',0);
/*!40000 ALTER TABLE `tb_borrow` ENABLE KEYS */;


--
-- Definition of table `tb_giveback`
--

DROP TABLE IF EXISTS `tb_giveback`;
CREATE TABLE `tb_giveback` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `readerid` int(11) DEFAULT NULL,
  `bookid` int(11) DEFAULT NULL,
  `backTime` date DEFAULT NULL,
  `operator` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=gbk;

--
-- Dumping data for table `tb_giveback`
--

/*!40000 ALTER TABLE `tb_giveback` DISABLE KEYS */;
INSERT INTO `tb_giveback` (`id`,`readerid`,`bookid`,`backTime`,`operator`) VALUES 
 (3,4,7,'2011-02-24','mr');
/*!40000 ALTER TABLE `tb_giveback` ENABLE KEYS */;


--
-- Definition of table `tb_library`
--

DROP TABLE IF EXISTS `tb_library`;
CREATE TABLE `tb_library` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `libraryname` varchar(50) DEFAULT NULL,
  `curator` varchar(10) DEFAULT NULL,
  `tel` varchar(20) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `url` varchar(100) DEFAULT NULL,
  `createDate` date DEFAULT NULL,
  `introduce` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=gbk;

--
-- Dumping data for table `tb_library`
--

/*!40000 ALTER TABLE `tb_library` DISABLE KEYS */;
INSERT INTO `tb_library` (`id`,`libraryname`,`curator`,`tel`,`address`,`email`,`url`,`createDate`,`introduce`) VALUES 
 (1,'博研图书馆','mr','0431-84978981','长春市东盛大街89','mingrisoft@mingsoft.com','http://www','1999-12-12','本市拥有计算机类图书最多的图书馆。');
/*!40000 ALTER TABLE `tb_library` ENABLE KEYS */;


--
-- Definition of table `tb_manager`
--

DROP TABLE IF EXISTS `tb_manager`;
CREATE TABLE `tb_manager` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) DEFAULT NULL,
  `PWD` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=gbk;

--
-- Dumping data for table `tb_manager`
--

/*!40000 ALTER TABLE `tb_manager` DISABLE KEYS */;
INSERT INTO `tb_manager` (`id`,`name`,`PWD`) VALUES 
 (1,'mr','mrsoft'),
 (7,'wgh','111'),
 (9,'admin','111');
/*!40000 ALTER TABLE `tb_manager` ENABLE KEYS */;


--
-- Definition of table `tb_parameter`
--

DROP TABLE IF EXISTS `tb_parameter`;
CREATE TABLE `tb_parameter` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cost` int(10) unsigned DEFAULT NULL,
  `validity` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=gbk;

--
-- Dumping data for table `tb_parameter`
--

/*!40000 ALTER TABLE `tb_parameter` DISABLE KEYS */;
INSERT INTO `tb_parameter` (`id`,`cost`,`validity`) VALUES 
 (1,30,6);
/*!40000 ALTER TABLE `tb_parameter` ENABLE KEYS */;


--
-- Definition of table `tb_publishing`
--

DROP TABLE IF EXISTS `tb_publishing`;
CREATE TABLE `tb_publishing` (
  `ISBN` varchar(20) NOT NULL COMMENT 'ISBN号',
  `pubname` varchar(30) DEFAULT NULL COMMENT '出版社名称',
  PRIMARY KEY (`ISBN`)
) ENGINE=MyISAM DEFAULT CHARSET=gbk;

--
-- Dumping data for table `tb_publishing`
--

/*!40000 ALTER TABLE `tb_publishing` DISABLE KEYS */;
INSERT INTO `tb_publishing` (`ISBN`,`pubname`) VALUES 
 ('111','机械工业出版社'),
 ('115','人民邮电出版社'),
 ('302','清华大学出版社');
/*!40000 ALTER TABLE `tb_publishing` ENABLE KEYS */;


--
-- Definition of table `tb_purview`
--

DROP TABLE IF EXISTS `tb_purview`;
CREATE TABLE `tb_purview` (
  `id` int(11) NOT NULL,
  `sysset` tinyint(1) DEFAULT '0',
  `readerset` tinyint(1) DEFAULT '0',
  `bookset` tinyint(1) DEFAULT '0',
  `borrowback` tinyint(1) DEFAULT '0',
  `sysquery` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=gbk;

--
-- Dumping data for table `tb_purview`
--

/*!40000 ALTER TABLE `tb_purview` DISABLE KEYS */;
INSERT INTO `tb_purview` (`id`,`sysset`,`readerset`,`bookset`,`borrowback`,`sysquery`) VALUES 
 (1,1,1,1,1,1),
 (7,0,1,1,1,1),
 (9,1,1,1,0,0);
/*!40000 ALTER TABLE `tb_purview` ENABLE KEYS */;


--
-- Definition of table `tb_reader`
--

DROP TABLE IF EXISTS `tb_reader`;
CREATE TABLE `tb_reader` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  `sex` varchar(4) DEFAULT NULL,
  `barcode` varchar(30) DEFAULT NULL,
  `vocation` varchar(50) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `paperType` varchar(10) DEFAULT NULL,
  `paperNO` varchar(20) DEFAULT NULL,
  `tel` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `createDate` date DEFAULT NULL,
  `operator` varchar(30) DEFAULT NULL,
  `remark` text,
  `typeid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=gbk;

--
-- Dumping data for table `tb_reader`
--

/*!40000 ALTER TABLE `tb_reader` DISABLE KEYS */;
INSERT INTO `tb_reader` (`id`,`name`,`sex`,`barcode`,`vocation`,`birthday`,`paperType`,`paperNO`,`tel`,`email`,`createDate`,`operator`,`remark`,`typeid`) VALUES 
 (4,'琦琦','女','20110224000001','学生','2010-07-10','身份证','220104201007100001','84978981','wgh717@sohu.com','2011-02-24','mr','无',4),
 (5,'wgh','女','20110224000002','程序员','1980-07-10','工作证','20010228','84978981','wgh717@sohu.com','2011-02-24','mr','无',4),
 (6,'uui','男','iuoui','',NULL,'身份证','iuoi','','nmb','2011-02-24','mr','',4);
/*!40000 ALTER TABLE `tb_reader` ENABLE KEYS */;


--
-- Definition of table `tb_readertype`
--

DROP TABLE IF EXISTS `tb_readertype`;
CREATE TABLE `tb_readertype` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `number` int(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=gbk;

--
-- Dumping data for table `tb_readertype`
--

/*!40000 ALTER TABLE `tb_readertype` DISABLE KEYS */;
INSERT INTO `tb_readertype` (`id`,`name`,`number`) VALUES 
 (4,'学生',1);
/*!40000 ALTER TABLE `tb_readertype` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
