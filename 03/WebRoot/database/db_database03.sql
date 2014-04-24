-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.0.67-community-nt


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema db_blog
--

CREATE DATABASE IF NOT EXISTS db_blog;
USE db_blog;

--
-- Definition of table `tb_admin`
--

DROP TABLE IF EXISTS `tb_admin`;
CREATE TABLE `tb_admin` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `account` varchar(45) NOT NULL COMMENT '用户名',
  `password` varchar(45) NOT NULL COMMENT '登录密码',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tb_admin`
--

/*!40000 ALTER TABLE `tb_admin` DISABLE KEYS */;
INSERT INTO `tb_admin` (`id`,`account`,`password`) VALUES 
 (1,'mr','FDB390E945559E74475ED8C8BBB48CA5');
/*!40000 ALTER TABLE `tb_admin` ENABLE KEYS */;


--
-- Definition of table `tb_article`
--

DROP TABLE IF EXISTS `tb_article`;
CREATE TABLE `tb_article` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `typeName` varchar(45) NOT NULL COMMENT '文章类别名称',
  `title` varchar(45) NOT NULL COMMENT '题目',
  `content` varchar(3000) NOT NULL COMMENT '文章主要内容',
  `author` varchar(20) NOT NULL COMMENT '发布人',
  `sendTime` varchar(45) NOT NULL COMMENT '发布时间',
  `visit` int(10) unsigned NOT NULL COMMENT '访问次数',
  `commend` varchar(10) NOT NULL COMMENT '是否推荐',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tb_article`
--

/*!40000 ALTER TABLE `tb_article` DISABLE KEYS */;
INSERT INTO `tb_article` (`id`,`typeName`,`title`,`content`,`author`,`sendTime`,`visit`,`commend`) VALUES 
 (2,'技术','Spring技术入门','Spring是一个开源框架，由Rod Johnson创建，从2003年初正式启动。它能够降低开发企业应用程序的复杂性，可以使用Spring替代EJB开发企业级应用，而不用担心工作量太大、开发进度难以控制和复杂的测试过程等问题。Spring简化了企业应用的开发、降低了开发成本、能够整合各种流行框架。它以IoC（反向控制）和AOP（面向切面编程）两种先进的技术为基础，完美的简化了企业级开发的复杂度。','test','2010-04-22 09:14:52',1,'是'),
 (3,'笑话','Hibernate技术入门','话说很久很久以前，在遥远的遥远的天际上…………话说很久很久以前，在遥远的遥远的天际上…………话说很久很久以前，在遥远的遥远的天际上…………话说很久很久以前，在遥远的遥远的天际上…………话说很久很久以前，在遥远的遥远的天际上…………话说很久很久以前，在遥远的遥远的天际上…………话说很久很久以前，在遥远的遥远的天际上…………话说很久很久以前，在遥远的遥远的天际上…………话说很久很久以前，在遥远的遥远的天际上…………','test','2010-04-22 09:16:19',1,'否'),
 (4,'技术','struts2高级技术应用','struts2高级技术应用struts2高级技术应用struts2高级技术应用struts2高级技术应用struts2高级技术应用struts2高级技术应用struts2高级技术应用struts2高级技术应用struts2高级技术应用struts2高级技术应用','test','2010-04-22 09:18:19',0,'是'),
 (5,'随笔','元宵节','祝您元宵节快乐！','mrwgh','2011-02-17 11:48:40',0,'否'),
 (6,'技术','艾瑟顿','艾瑟顿','陈丹丹','2011-04-16 15:14:24',0,'否'),
 (7,'技术','圣达菲','圣达菲','cdd','2011-04-16 15:18:55',0,'否');
/*!40000 ALTER TABLE `tb_article` ENABLE KEYS */;


--
-- Definition of table `tb_info`
--

DROP TABLE IF EXISTS `tb_info`;
CREATE TABLE `tb_info` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `info_account` varchar(45) NOT NULL COMMENT '发送信息人',
  `info_fromAccount` varchar(45) NOT NULL COMMENT '接受信息人',
  `info_content` varchar(45) NOT NULL COMMENT '发送内容',
  `info_sign` int(10) unsigned NOT NULL COMMENT '留言与小纸条标识',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tb_info`
--

/*!40000 ALTER TABLE `tb_info` DISABLE KEYS */;
INSERT INTO `tb_info` (`id`,`info_account`,`info_fromAccount`,`info_content`,`info_sign`) VALUES 
 (1,'test','匿名','最近怎么样？',0),
 (2,'风轻云淡','cdd','大法官',1),
 (3,'风轻云淡','cdd','爱上当飞',1);
/*!40000 ALTER TABLE `tb_info` ENABLE KEYS */;


--
-- Definition of table `tb_photo`
--

DROP TABLE IF EXISTS `tb_photo`;
CREATE TABLE `tb_photo` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `photoType` varchar(45) NOT NULL COMMENT '照片类型',
  `photoName` varchar(45) NOT NULL COMMENT '照片名称',
  `photoAddress` varchar(45) NOT NULL COMMENT '照片地址',
  `photoVisit` int(10) unsigned NOT NULL COMMENT '访问次数',
  `author` varchar(45) NOT NULL COMMENT '用户名',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tb_photo`
--

/*!40000 ALTER TABLE `tb_photo` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_photo` ENABLE KEYS */;


--
-- Definition of table `tb_rearticle`
--

DROP TABLE IF EXISTS `tb_rearticle`;
CREATE TABLE `tb_rearticle` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `re_id` int(10) unsigned NOT NULL COMMENT '文章回复人ID号',
  `account` varchar(45) NOT NULL COMMENT '文章回复人名称',
  `content` varchar(45) NOT NULL COMMENT '文章回复内容',
  `re_time` datetime NOT NULL COMMENT '文章回复时间',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tb_rearticle`
--

/*!40000 ALTER TABLE `tb_rearticle` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_rearticle` ENABLE KEYS */;


--
-- Definition of table `tb_userinfo`
--

DROP TABLE IF EXISTS `tb_userinfo`;
CREATE TABLE `tb_userinfo` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `account` varchar(45) NOT NULL COMMENT '用户名',
  `password` varchar(45) NOT NULL COMMENT '用户登录密码',
  `realname` varchar(45) NOT NULL COMMENT '真实姓名',
  `email` varchar(45) NOT NULL COMMENT 'E-mail地址',
  `sex` varchar(2) NOT NULL COMMENT '性别',
  `tel` int(10) unsigned NOT NULL COMMENT '联系电话',
  `profession` varchar(45) NOT NULL COMMENT '职业名称',
  `address` varchar(45) NOT NULL COMMENT '联系地址',
  `homepage` varchar(45) default NULL COMMENT '主页名称',
  `qq` int(10) unsigned NOT NULL COMMENT 'QQ号码',
  `headgif` varchar(45) default NULL COMMENT '个人头像地址',
  `freeze` varchar(10) default NULL COMMENT '用户是否冻结',
  `art_type` varchar(100) default NULL COMMENT '文章类别名称',
  `pic_type` varchar(100) default NULL COMMENT '相片类别名称',
  `friend_type` varchar(45) default NULL COMMENT '好友名称',
  `commend` varchar(45) default NULL COMMENT '是否推荐',
  `vistor` int(10) unsigned default '0' COMMENT '访问次数',
  `self` varchar(200) default NULL COMMENT '自我评价',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tb_userinfo`
--

/*!40000 ALTER TABLE `tb_userinfo` DISABLE KEYS */;
INSERT INTO `tb_userinfo` (`id`,`account`,`password`,`realname`,`email`,`sex`,`tel`,`profession`,`address`,`homepage`,`qq`,`headgif`,`freeze`,`art_type`,`pic_type`,`friend_type`,`commend`,`vistor`,`self`) VALUES 
 (1,'test','698D51A19D8A121CE581499D7B701668','测试','mr@163.com','男',1234,'软件工程师','不知','http://192.168.1.199:8080/22.1/test',1234,'images/headgif/1.gif','解冻','技术,笑话','分享','','是',0,'斯蒂芬萨菲'),
 (2,'风轻云淡','698D51A19D8A121CE581499D7B701668','测试','mr@1126.com','男',1324,'不告诉你','不知道','http://192.168.1.199:8080/22.1/风轻云淡',2564,'images/headgif/1.gif','解冻','','','','是',0,'阿斯顿飞'),
 (3,'wgh','96E79218965EB72C92A549DD5A330112','wgh','wgh717@sohu.com','男',11111111,'程序员','长春市','http://192.168.1.66:8080/577/wgh',1111111111,'images/headgif/6.gif','解冻','','个人写真','','否',0,'平平淡淡才是真！'),
 (4,'qq','698D51A19D8A121CE581499D7B701668','qiqi','wgh717@sohu.com','女',111111,'111','长春市','http://192.168.1.66:8080/577/qq',805342,'images/headgif/4.gif','冻结','','','','否',0,'天天'),
 (5,'rty','202CB962AC59075B964B07152D234B70','345','rty@ert.fgf','男',345,'345345','345345','http://192.168.1.66:8080/577/rty',345,'images/headgif/2.gif','冻结','','','','否',0,'345'),
 (6,'sss','202CB962AC59075B964B07152D234B70','dsa','ssss@163.com','男',123456,'sda','asd','http://192.168.1.66:8080/577/sss',123456,'images/headgif/1.gif','冻结','','','','否',0,'sdfsd'),
 (7,'mrwgh','698D51A19D8A121CE581499D7B701668','wanggh','wgh717@sohu.com','女',11111111,'程序员','长春市','http://localhost:8080/577/mrwgh',11111111,'images/headgif/6.gif','解冻','随笔','','','是',0,'平平淡淡才是真！'),
 (8,'cdd','96E79218965EB72C92A549DD5A330112','vdd','sdf@sdf.com','男',123123,'123','123','http://127.0.0.1:8080/blog/cdd',23123,'images/headgif/1.gif','冻结','技术','','','否',1,'123'),
 (9,'陈丹丹','96E79218965EB72C92A549DD5A330112','陈丹丹','sdf@sdf.com','女',12123,'sdf','sadf ','http://127.0.0.1:8080/blog/陈丹丹',12312,'images/headgif/2.gif','解冻','技术','','','否',3,'234');
/*!40000 ALTER TABLE `tb_userinfo` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
