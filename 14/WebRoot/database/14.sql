-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.0.82-community-nt


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema db_myenterprise
--

CREATE DATABASE IF NOT EXISTS db_myenterprise;
USE db_myenterprise;

--
-- Definition of table `affiche`
--

DROP TABLE IF EXISTS `affiche`;
CREATE TABLE `affiche` (
  `aid` int(11) NOT NULL auto_increment,
  `uid` varchar(50) default NULL,
  `title` varchar(200) default NULL,
  `atime` datetime default NULL,
  `content` text,
  PRIMARY KEY  (`aid`)
) ENGINE=MyISAM AUTO_INCREMENT=60 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `affiche`
--

/*!40000 ALTER TABLE `affiche` DISABLE KEYS */;
INSERT INTO `affiche` (`aid`,`uid`,`title`,`atime`,`content`) VALUES 
 (59,'mr','¹«¸æ±êÌâ','2011-02-14 10:41:14','¹«¸æ±ê');
/*!40000 ALTER TABLE `affiche` ENABLE KEYS */;


--
-- Definition of table `guestboard`
--

DROP TABLE IF EXISTS `guestboard`;
CREATE TABLE `guestboard` (
  `gid` int(11) NOT NULL auto_increment,
  `title` varchar(100) default NULL,
  `guest` varchar(50) default NULL,
  `gtime` datetime default NULL,
  `content` varchar(250) default NULL,
  `gflag` tinyint(1) default '0',
  `rtime` datetime default NULL,
  `recontent` text,
  PRIMARY KEY  (`gid`)
) ENGINE=MyISAM AUTO_INCREMENT=79 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `guestboard`
--

/*!40000 ALTER TABLE `guestboard` DISABLE KEYS */;
INSERT INTO `guestboard` (`gid`,`title`,`guest`,`gtime`,`content`,`gflag`,`rtime`,`recontent`) VALUES 
 (76,'Ï£Íû¹ó¹«Ë¾Ô½À´Ô½ºÃ','ÓÎ¿Í','2011-02-19 11:27:36','·Ç³£Ï²»¶¹ó¹«Ë¾µÄ²úÆ·¡£¡£',1,'2011-02-19 11:28:48','Ð»Ð»'),
 (77,'ÄãºÃÎÒÏë¹ºÂòÄãÃÇÉÌÆ·È¥ÄÄÂò£¿','ÓÎ¿Í','2011-02-25 16:09:24','ÈçÌâ',0,NULL,NULL),
 (78,'ÓÃÁËÄãÃÇµÄ²úÆ·','ÓÎ¿Í','2011-02-25 16:10:04','·Ç³£ºÃ',0,NULL,NULL);
/*!40000 ALTER TABLE `guestboard` ENABLE KEYS */;


--
-- Definition of table `ico`
--

DROP TABLE IF EXISTS `ico`;
CREATE TABLE `ico` (
  `iid` varchar(50) NOT NULL default '',
  `path` varchar(50) default NULL,
  `atime` datetime default NULL,
  `state` int(11) default '0',
  PRIMARY KEY  (`iid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ico`
--

/*!40000 ALTER TABLE `ico` DISABLE KEYS */;
INSERT INTO `ico` (`iid`,`path`,`atime`,`state`) VALUES 
 ('01.gif','images/ico/01.gif','2011-02-18 13:20:22',0),
 ('08.gif','images/ico/08.gif','2011-02-18 15:29:46',0),
 ('_2676648875979061543','images/resolvent/_2676648875979061543.jpg','2011-02-18 11:28:40',2);
/*!40000 ALTER TABLE `ico` ENABLE KEYS */;


--
-- Definition of table `link`
--

DROP TABLE IF EXISTS `link`;
CREATE TABLE `link` (
  `lid` int(11) NOT NULL auto_increment,
  `name` varchar(50) default NULL,
  `ltime` datetime default NULL,
  `url` varchar(50) default NULL,
  PRIMARY KEY  (`lid`)
) ENGINE=MyISAM AUTO_INCREMENT=32 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `link`
--

/*!40000 ALTER TABLE `link` DISABLE KEYS */;
INSERT INTO `link` (`lid`,`name`,`ltime`,`url`) VALUES 
 (31,'¼ªÁÖÊ¡Ã÷ÈÕ¿Æ¼¼ÓÐÏÞ¹«Ë¾','2011-02-14 12:50:10','http://www.mingrisoft.com');
/*!40000 ALTER TABLE `link` ENABLE KEYS */;


--
-- Definition of table `mend`
--

DROP TABLE IF EXISTS `mend`;
CREATE TABLE `mend` (
  `mid` int(11) NOT NULL auto_increment,
  `sid` int(11) default NULL,
  `name` varchar(50) default NULL,
  `path` varchar(50) default NULL,
  `state` int(11) default NULL,
  `uptime` datetime default NULL,
  `commend` int(11) default NULL,
  `loadnum` int(11) default NULL,
  `filesize` int(11) default NULL,
  `resume` varchar(250) default NULL,
  PRIMARY KEY  (`mid`)
) ENGINE=MyISAM AUTO_INCREMENT=38 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mend`
--

/*!40000 ALTER TABLE `mend` DISABLE KEYS */;
INSERT INTO `mend` (`mid`,`sid`,`name`,`path`,`state`,`uptime`,`commend`,`loadnum`,`filesize`,`resume`) VALUES 
 (25,41,'JDK1.6','\\jdk1.6.txt',0,'2011-02-14 11:00:34',3,10,67,'ÎÞ'),
 (26,41,'JDBCÇý¶¯°ü','\\JDBC.txt',1,'2011-02-14 11:16:59',3,4,1,'ÎÞ'),
 (27,41,'JDBC_SQL','\\JDBC.sql.txt',1,'2011-02-14 11:18:35',3,3,1,'ÎÞ'),
 (30,41,'mysqlÇý¶¯','\\mysql-connector-java-5.1.6-bin.jar',1,'2011-02-14 16:02:22',3,1,0,'Çý¶¯Àà'),
 (31,42,'Vb','\\mysql-connector-java-5[1].1.6-bin.jar',1,'2011-02-17 14:25:43',3,0,1,'111');
/*!40000 ALTER TABLE `mend` ENABLE KEYS */;


--
-- Definition of table `new`
--

DROP TABLE IF EXISTS `new`;
CREATE TABLE `new` (
  `nid` int(11) NOT NULL auto_increment,
  `uid` varchar(50) default NULL,
  `title` varchar(200) default NULL,
  `ntime` datetime default NULL,
  `fromto` varchar(100) default NULL,
  `content` text,
  PRIMARY KEY  (`nid`)
) ENGINE=MyISAM AUTO_INCREMENT=36 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `new`
--

/*!40000 ALTER TABLE `new` DISABLE KEYS */;
INSERT INTO `new` (`nid`,`uid`,`title`,`ntime`,`fromto`,`content`) VALUES 
 (35,'mr','Ã÷ÈÕ¿Æ¼¼±à³Ì´Êµä¼´½«ÃæÊÐ¡£','2011-02-16 08:44:01','ÎÞ','Ã÷ÈÕ¿Æ¼¼±à³Ì´Êµä¼´½«ÃæÊÐ¡£');
/*!40000 ALTER TABLE `new` ENABLE KEYS */;


--
-- Definition of table `question`
--

DROP TABLE IF EXISTS `question`;
CREATE TABLE `question` (
  `qid` int(11) NOT NULL auto_increment,
  `question` varchar(250) default NULL,
  `answer` text,
  PRIMARY KEY  (`qid`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `question`
--

/*!40000 ALTER TABLE `question` DISABLE KEYS */;
INSERT INTO `question` (`qid`,`question`,`answer`) VALUES 
 (20,'ÈçºÎ¹ºÂò±à³Ì´Êµä£¿','£¨1£©ÓÃ»§Ê×ÏÈÐèÒªÏêÏ¸²é¿´±à³Ì´ÊµäµÄÏà¹ØÐÅÏ¢£¬Ñ¡ÔñÊÊºÏ×Ô¼ºµÄ±à³Ì´Êµä¼°°æ±¾\r\n£¨2£©ÓÃ»§Ñ¡ÔñÍê±à³Ì´Êµäºó£¬¿É½«¸Ã±à³Ì´Êµä·ÅÈë¹ºÎï³µÖÐ£¬Í¬Ê±ÓÃ»§¿ÉÒÔÐÞ¸Ä¹ºÂò±à³Ì´ÊµäµÄÊýÁ¿»òÒÆ³ý¹ºÎï³µÖÐµÄ±à³Ì´Êµä\r\n£¨3£©ÓÃ»§È·ÈÏ¹ºÂòºó£¬ÐèÒªÏêÏ¸ÌîÐ´ÊÕ»õÈËÐÅÏ¢£¬ÒÔ±ãÓÚÎÒ¹«Ë¾¹¤×÷ÈËÔ±ÓëÄúÁªÏµ¼°ÓÊ¼ÄÉÌÆ·\r\n£¨4£©ÌîÐ´ÍêÊÕ»õÈËÐÅÏ¢ºó£¬ÓÃ»§ÐèÒªÑ¡ÔñÖ§¸¶·½Ê½£¬²¢¼°Ê±Ö§¸¶,ÎÒ¹«Ë¾È·ÈÏÊÕ¿îºó£¬»áÁ¢¼´ÎªÄúÓÊµÝ±à³Ì´Êµä');
/*!40000 ALTER TABLE `question` ENABLE KEYS */;


--
-- Definition of table `resolvent`
--

DROP TABLE IF EXISTS `resolvent`;
CREATE TABLE `resolvent` (
  `rid` int(11) NOT NULL auto_increment,
  `sid` int(11) default NULL,
  `uid` varchar(50) default NULL,
  `sfid` int(11) default NULL,
  `name` varchar(50) default NULL,
  `uptime` datetime default NULL,
  `iid` varchar(50) default NULL,
  `content` text,
  PRIMARY KEY  (`rid`)
) ENGINE=MyISAM AUTO_INCREMENT=30 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `resolvent`
--

/*!40000 ALTER TABLE `resolvent` DISABLE KEYS */;
INSERT INTO `resolvent` (`rid`,`sid`,`uid`,`sfid`,`name`,`uptime`,`iid`,`content`) VALUES 
 (29,41,'mr',64,'¹ØÓÚÊ¹ÓÃÆóÒµEQµÄ½â¾ö·½°¸','2011-02-18 11:28:40','_2676648875979061543','°²×°ÆóÒµEQ');
/*!40000 ALTER TABLE `resolvent` ENABLE KEYS */;


--
-- Definition of table `soft`
--

DROP TABLE IF EXISTS `soft`;
CREATE TABLE `soft` (
  `sfid` int(11) NOT NULL auto_increment,
  `name` varchar(100) default NULL,
  `edition` varchar(50) default NULL,
  `price` float default NULL,
  `uptime` datetime default NULL,
  `uid` varchar(50) default NULL,
  `iid` varchar(50) default NULL,
  `sid` int(11) default NULL,
  `environment` varchar(50) default NULL,
  `filesize` int(11) default NULL,
  `commend` int(11) default NULL,
  `loadnum` int(11) default NULL,
  `regular` tinyint(1) default NULL,
  `introduce` text,
  `path` varchar(50) default NULL,
  `resume` varchar(200) default NULL,
  PRIMARY KEY  (`sfid`)
) ENGINE=MyISAM AUTO_INCREMENT=66 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `soft`
--

/*!40000 ALTER TABLE `soft` DISABLE KEYS */;
INSERT INTO `soft` (`sfid`,`name`,`edition`,`price`,`uptime`,`uid`,`iid`,`sid`,`environment`,`filesize`,`commend`,`loadnum`,`regular`,`introduce`,`path`,`resume`) VALUES 
 (64,'ÆóÒµEQ','3.2',1200,'2011-02-14 09:03:59','mr','',41,'windows/linux',1,4,11,0,'·½±ãÔ±¹¤¼äµÄ¹µÍ¨£¡','\\eq.rar',''),
 (65,'Ö»ÎÄ','44',444,'2011-02-14 14:15:01','mr','',42,'windows',11,3,12,0,'kk','\\DOS´°¿ÚÏÂµÄÐÅÏ¢.txt','');
/*!40000 ALTER TABLE `soft` ENABLE KEYS */;


--
-- Definition of table `ssort`
--

DROP TABLE IF EXISTS `ssort`;
CREATE TABLE `ssort` (
  `sid` int(11) NOT NULL auto_increment,
  `name` varchar(50) default NULL,
  `resume` varchar(100) default NULL,
  PRIMARY KEY  (`sid`)
) ENGINE=MyISAM AUTO_INCREMENT=43 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ssort`
--

/*!40000 ALTER TABLE `ssort` DISABLE KEYS */;
INSERT INTO `ssort` (`sid`,`name`,`resume`) VALUES 
 (41,'Java','ÓëÆ½Ì¨ÎÞ¹Ø'),
 (42,'Visual Basic','·½±ã¿ì½Ý');
/*!40000 ALTER TABLE `ssort` ENABLE KEYS */;


--
-- Definition of table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `uid` varchar(50) NOT NULL default '',
  `password` varchar(50) default NULL,
  `name` varchar(50) default NULL,
  `regqu` varchar(50) default NULL,
  `reganswer` varchar(50) default NULL,
  `iid` varchar(50) NOT NULL default '',
  `sex` tinyint(1) default NULL,
  `age` int(11) default NULL,
  `tel` varchar(50) default NULL,
  `email` varchar(50) default NULL,
  `qq` varchar(50) default NULL,
  `regtime` datetime default NULL,
  `address` varchar(200) default NULL,
  `http` varchar(50) default NULL,
  `status` int(11) default NULL,
  `state` int(11) default NULL,
  `resume` varchar(250) default NULL,
  PRIMARY KEY  (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`uid`,`password`,`name`,`regqu`,`reganswer`,`iid`,`sex`,`age`,`tel`,`email`,`qq`,`regtime`,`address`,`http`,`status`,`state`,`resume`) VALUES 
 ('mr','mrsoft','Ã÷ÈÕ¿Æ¼¼','mr','Ã÷ÈÕÈí¼þ','08.gif',1,10,'0431-84972266','mingrisoft@mingrisoft.com','','2011-02-16 15:54:07','³¤´ºÊÐ','http://www.mingribook.com',1,0,''),
 ('wgh','111','wguohui','1','1','08.gif',0,28,'','wgh717@sohu.com','','2011-02-16 16:24:35','³¤´ºÊÐ','',0,0,''),
 ('abc','123','ÐÕÃû','aa','a','',1,12,'','mingrisoft@mingrisoft.com','','2011-02-16 16:46:21','','',1,0,''),
 ('zzzzz','zzz','°¡Ê¢´ó','zz','zz','',1,12,'','mingrisoft@mingrisoft.com&nbsp;','','2011-02-19 16:31:24','','',0,0,'');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
