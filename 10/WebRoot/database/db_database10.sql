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
-- Create schema db_database10
--

CREATE DATABASE IF NOT EXISTS db_database10;
USE db_database10;

--
-- Definition of table `tb_course`
--

DROP TABLE IF EXISTS `tb_course`;
CREATE TABLE `tb_course` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '课程编号',
  `name` varchar(40) NOT NULL COMMENT '课程名称',
  `schooltime` varchar(40) NOT NULL COMMENT '上课时间',
  `addr` varchar(50) NOT NULL COMMENT '上课地点',
  `credit` decimal(3,0) NOT NULL COMMENT '课程学分',
  `courseInfo` varchar(100) NOT NULL COMMENT '课程介绍',
  `teacherName` varchar(20) NOT NULL COMMENT '授课教师',
  `teacherInfo` varchar(100) NOT NULL COMMENT '教师介绍',
  `isFinish` bit(1) NOT NULL COMMENT '是否结课',
  `specialtyId` int(10) unsigned NOT NULL COMMENT '专业编号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=gbk;

--
-- Dumping data for table `tb_course`
--

/*!40000 ALTER TABLE `tb_course` DISABLE KEYS */;
INSERT INTO `tb_course` (`id`,`name`,`schooltime`,`addr`,`credit`,`courseInfo`,`teacherName`,`teacherInfo`,`isFinish`,`specialtyId`) VALUES 
 (1,'大学英语1','每周二上午8点到12点','文科楼第一教室','5','英语基础课程','张老师','拥有多年教学经验的优秀教师',0x00,1),
 (2,'平面设计','每周一、周四上午','文科楼第三教室','4','设计基础课程','李老师','一位优秀的教师',0x01,1),
 (3,'国内贸易','每周一全天','文科楼第一教室','4','这里是介绍','孙老师','新来的一个老师',0x01,2),
 (4,'大学英语1','每周一、周四上午','文科楼第一教室','5','这里是介绍','张老师','新来的一个老师',0x00,2),
 (5,'计算机二级','每周日','阶梯教室','50','课程介绍课程介绍课程介绍课程介绍课程介绍课程介绍课程介绍课程介绍课程介绍课程介绍课程介绍课程介绍课程介绍','明明老师','明明老师毕业于XX大学，博士学位，有着丰富的教学经验.....',0x00,3),
 (6,'数据','周一','学校','10','地在地圭','灵儿','地在地圭',0x01,4),
 (7,'需要','城','城','20','霜','在','在',0x01,5);
/*!40000 ALTER TABLE `tb_course` ENABLE KEYS */;


--
-- Definition of table `tb_specialty`
--

DROP TABLE IF EXISTS `tb_specialty`;
CREATE TABLE `tb_specialty` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '专业编号',
  `enterYear` varchar(4) NOT NULL COMMENT '入学年份',
  `name` varchar(40) NOT NULL COMMENT '专业名称',
  `langthYear` varchar(10) NOT NULL COMMENT '学制',
  `isFinish` bit(1) NOT NULL COMMENT '是否毕业',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=gbk;

--
-- Dumping data for table `tb_specialty`
--

/*!40000 ALTER TABLE `tb_specialty` DISABLE KEYS */;
INSERT INTO `tb_specialty` (`id`,`enterYear`,`name`,`langthYear`,`isFinish`) VALUES 
 (1,'2005','美术装潢设计','2',0x01),
 (2,'2005','进出口贸易','4',0x01),
 (3,'2010','计算机','3',0x01),
 (4,'2010','数据','2',0x00),
 (5,'2005','遥','2',0x00);
/*!40000 ALTER TABLE `tb_specialty` ENABLE KEYS */;


--
-- Definition of table `tb_stucourse`
--

DROP TABLE IF EXISTS `tb_stucourse`;
CREATE TABLE `tb_stucourse` (
  `stuID` int(10) unsigned NOT NULL COMMENT '学生编号',
  `courseID` int(10) unsigned NOT NULL COMMENT '课程编号',
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=gbk;

--
-- Dumping data for table `tb_stucourse`
--

/*!40000 ALTER TABLE `tb_stucourse` DISABLE KEYS */;
INSERT INTO `tb_stucourse` (`stuID`,`courseID`,`id`) VALUES 
 (6,1,3),
 (11,1,4),
 (10,1,5),
 (12,1,6),
 (12,2,7),
 (7,2,8),
 (10,2,9),
 (7,7,10),
 (44,6,11),
 (45,7,12);
/*!40000 ALTER TABLE `tb_stucourse` ENABLE KEYS */;


--
-- Definition of table `tb_stuuser`
--

DROP TABLE IF EXISTS `tb_stuuser`;
CREATE TABLE `tb_stuuser` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '学生编号',
  `stuName` varchar(20) NOT NULL COMMENT '学生姓名',
  `stuNo` varchar(15) NOT NULL COMMENT '学号',
  `specialtyId` int(10) unsigned NOT NULL COMMENT '专业编号',
  `stuSex` varchar(2) NOT NULL COMMENT '性别',
  `birthday` varchar(10) NOT NULL COMMENT '出生日期',
  `homeAddr` varchar(50) NOT NULL COMMENT '家庭住址',
  `tel` varchar(20) NOT NULL COMMENT '联系电话',
  `addr` varchar(50) NOT NULL COMMENT '现住址',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=gbk;

--
-- Dumping data for table `tb_stuuser`
--

/*!40000 ALTER TABLE `tb_stuuser` DISABLE KEYS */;
INSERT INTO `tb_stuuser` (`id`,`stuName`,`stuNo`,`specialtyId`,`stuSex`,`birthday`,`homeAddr`,`tel`,`addr`) VALUES 
 (5,'aa','123456',1,'男','1981-08-17','吉林省四平市','87793***','吉林省长春市'),
 (6,'张三','654321',1,'男','1981-08-01','吉林省四平市','0431-84972266','吉林省长春市'),
 (7,'bbb','555555',1,'男','1981-08-01','吉林省四平市','0431-84972266','吉林省长春市'),
 (10,'555','005',1,'男','1981-08-01','吉林省四平市','0431-84972266','吉林省长春市'),
 (11,'666','006',1,'男','1981-08-01','吉林省四平市','0431-84972266','吉林省长春市'),
 (12,'777','007',1,'男','1981-08-01','吉林省四平市','0431-84972266','吉林省长春市'),
 (15,'33','33',2,'女','33','3','33','333'),
 (30,'3','4',2,'女','3','3','3','3'),
 (31,'6','人',2,'女','2','2','2','2'),
 (33,'8','8',2,'女','8','8','8','8'),
 (35,'张大','12',4,'男','','','',''),
 (36,'王明','120',4,'女','6','6','6','6'),
 (37,'杨林','002',7,'','87','长春','0987822','吉林'),
 (38,'2','2',5,'','2','2','2','2'),
 (39,'明天','009',4,'','2','2','2','2'),
 (40,'user22','2',2,'','','','',''),
 (43,'小明','001',3,'男','1989-05-05','长春','1212','长春'),
 (44,'一一','002',4,'女','1989-9-9','长春','55','长春'),
 (45,'99','003',5,'','1898-08-08','长春','555','长春');
/*!40000 ALTER TABLE `tb_stuuser` ENABLE KEYS */;


--
-- Definition of table `tb_userlogin`
--

DROP TABLE IF EXISTS `tb_userlogin`;
CREATE TABLE `tb_userlogin` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户编号',
  `loginName` varchar(20) NOT NULL COMMENT '登录名称',
  `pwd` varchar(20) NOT NULL COMMENT '登录密码',
  `type` varchar(1) NOT NULL COMMENT '用户类型',
  `mail` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=gbk;

--
-- Dumping data for table `tb_userlogin`
--

/*!40000 ALTER TABLE `tb_userlogin` DISABLE KEYS */;
INSERT INTO `tb_userlogin` (`id`,`loginName`,`pwd`,`type`,`mail`) VALUES 
 (1,'mr','mrsoft','1','mr@mr.com'),
 (5,'user2','user','2','user'),
 (6,'user','111','2','111@mr.com'),
 (7,'user1','555','2','111@mr.com'),
 (8,'user3','111','2','111@mr.com'),
 (9,'user4','111','2','111@mr.com'),
 (10,'user5','111','2','111@mr.com'),
 (11,'user6','111','2','111@mr.com'),
 (12,'user7','111','2','111@mr.com'),
 (36,'user9','3','2','3'),
 (37,'user10','3','2','3'),
 (38,'user11','3','2','3'),
 (39,'user12','3','2','3'),
 (40,'user22','111','2','mr'),
 (41,'2223','33','2','33'),
 (42,'cdd','cdd','2','we@163.com'),
 (43,'小明','000000','2','88@88.com'),
 (44,'00','000000','2','88@88.com'),
 (45,'88','88888888','2','99@99');
/*!40000 ALTER TABLE `tb_userlogin` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
