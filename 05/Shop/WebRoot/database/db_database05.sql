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
-- Create schema db_database24
--

CREATE DATABASE IF NOT EXISTS db_database24;
USE db_database24;

--
-- Definition of table `tb_customer`
--

DROP TABLE IF EXISTS `tb_customer`;
CREATE TABLE `tb_customer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `realname` varchar(20) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `mobile` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=gbk;

--
-- Dumping data for table `tb_customer`
--

/*!40000 ALTER TABLE `tb_customer` DISABLE KEYS */;
INSERT INTO `tb_customer` (`id`,`username`,`password`,`realname`,`address`,`email`,`mobile`) VALUES 
 (1,'mrsoft','mrsoft',NULL,'吉林省长春市二道区xxx号xxx小区xxx门','mrsoft@mrsoft.com','139xxxx8888');
/*!40000 ALTER TABLE `tb_customer` ENABLE KEYS */;


--
-- Definition of table `tb_order`
--

DROP TABLE IF EXISTS `tb_order`;
CREATE TABLE `tb_order` (
  `orderId` varchar(30) NOT NULL,
  `name` varchar(50) NOT NULL,
  `address` varchar(200) NOT NULL,
  `mobile` varchar(11) NOT NULL,
  `totalPrice` float DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  `paymentWay` varchar(15) DEFAULT NULL,
  `orderState` varchar(10) DEFAULT NULL,
  `customerId` int(11) DEFAULT NULL,
  PRIMARY KEY (`orderId`),
  KEY `FKFA98EE3DD0EDC05E` (`customerId`),
  CONSTRAINT `FKFA98EE3DD0EDC05E` FOREIGN KEY (`customerId`) REFERENCES `tb_customer` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

--
-- Dumping data for table `tb_order`
--

/*!40000 ALTER TABLE `tb_order` DISABLE KEYS */;
INSERT INTO `tb_order` (`orderId`,`name`,`address`,`mobile`,`totalPrice`,`createTime`,`paymentWay`,`orderState`,`customerId`) VALUES 
 ('201004201352400389678','mrsoft','吉林省长春市二道区xxx号xxx小区xxx门','139xxxx8888',120,'2010-04-20 13:52:40','POSTOFFICE_PAY','DELIVERED',1),
 ('201004220944580771720','mrsoft','吉林省长春市二道区xxx号xxx小区xxx门','139xxxx8888',120,'2010-04-22 09:44:58','POSTOFFICE_PAY','DELIVERED',1),
 ('201004220957520484473','mrsoft','吉林省长春市二道区xxx号xxx小区xxx门','139xxxx8888',0,'2010-04-22 09:57:52','POSTOFFICE_PAY','DELIVERED',1);
/*!40000 ALTER TABLE `tb_order` ENABLE KEYS */;


--
-- Definition of table `tb_orderitem`
--

DROP TABLE IF EXISTS `tb_orderitem`;
CREATE TABLE `tb_orderitem` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `productId` int(11) NOT NULL,
  `productName` varchar(200) NOT NULL,
  `productPrice` float NOT NULL,
  `amount` int(11) DEFAULT NULL,
  `orderId` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKBF076F042FE3E9B` (`orderId`),
  CONSTRAINT `FKBF076F042FE3E9B` FOREIGN KEY (`orderId`) REFERENCES `tb_order` (`orderId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=gbk;

--
-- Dumping data for table `tb_orderitem`
--

/*!40000 ALTER TABLE `tb_orderitem` DISABLE KEYS */;
INSERT INTO `tb_orderitem` (`id`,`productId`,`productName`,`productPrice`,`amount`,`orderId`) VALUES 
 (1,1,'Java 编程词典',120,1,NULL),
 (2,1,'Java 编程词典',120,1,NULL);
/*!40000 ALTER TABLE `tb_orderitem` ENABLE KEYS */;


--
-- Definition of table `tb_productcategory`
--

DROP TABLE IF EXISTS `tb_productcategory`;
CREATE TABLE `tb_productcategory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `level` int(11) DEFAULT NULL,
  `pid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKB405573CFB37BC9D` (`pid`),
  CONSTRAINT `FKB405573CFB37BC9D` FOREIGN KEY (`pid`) REFERENCES `tb_productcategory` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=350 DEFAULT CHARSET=gbk;

--
-- Dumping data for table `tb_productcategory`
--

/*!40000 ALTER TABLE `tb_productcategory` DISABLE KEYS */;
INSERT INTO `tb_productcategory` (`id`,`name`,`level`,`pid`) VALUES 
 (1,'服装',1,NULL),
 (2,'品质男装',2,1),
 (3,'衬衫',3,2),
 (4,'男鞋',3,2),
 (5,'男裤',3,2),
 (6,'西服',3,2),
 (7,'女鞋',2,1),
 (8,'帆布',3,7),
 (9,'高帮',3,7),
 (10,'单鞋',3,7),
 (11,'凉鞋',3,7),
 (12,'鱼嘴',3,7),
 (13,'内衣',2,1),
 (14,'睡衣',3,13),
 (15,'男内裤',3,13),
 (16,'文胸',3,13),
 (17,'袜',3,13),
 (18,'内裤',3,13),
 (19,'运动服',2,1),
 (20,'夹克',3,19),
 (21,'卫衣',3,19),
 (22,'裤',3,19),
 (23,'棉衣',3,19),
 (24,'T恤',3,19),
 (25,'童装',2,1),
 (26,'鞋',3,25),
 (27,'裤',3,25),
 (28,'套装',3,25),
 (29,'T恤',3,25),
 (30,'孕妇装',3,25),
 (31,'连衣裙',2,1),
 (32,'裤',3,31),
 (33,'半裙',3,31),
 (34,'雪纺裙',3,31),
 (35,'蕾丝裙',3,31),
 (36,'运动鞋',2,1),
 (37,'Nike',3,36),
 (38,'李宁',3,36),
 (39,'Adidas',3,36),
 (40,'匡威',3,36),
 (41,'休闲男装',2,1),
 (42,'牛仔',3,41),
 (43,'T恤',3,41),
 (44,'夹克',3,41),
 (45,'卫衣',3,41),
 (46,'女装',2,1),
 (47,'针织衫',3,46),
 (48,'T恤',3,46),
 (49,'短外套',3,46),
 (50,'衬衫',3,46),
 (51,'配饰',1,NULL),
 (52,'眼镜',2,51),
 (53,'烟具',3,52),
 (54,'眼镜架',3,52),
 (55,'太阳镜',3,52),
 (56,'Zippo',3,52),
 (57,'手表',2,51),
 (58,'天梭',3,57),
 (59,'Casio',3,57),
 (60,'欧米茄',3,57),
 (61,'浪琴',3,57),
 (62,'服饰配件',2,51),
 (63,'皮带',3,62),
 (64,'颈环',3,62),
 (65,'帽子',3,62),
 (66,'围巾',3,62),
 (67,'饰品',2,51),
 (68,'戒指',3,67),
 (69,'手链',3,67),
 (70,'项链',3,67),
 (71,'耳饰',3,67),
 (72,'发饰',3,67),
 (73,'珠宝',2,51),
 (74,'翡翠',3,73),
 (75,'婚钻',3,73),
 (76,'千足金',3,73),
 (77,'施华洛',3,73),
 (78,'男女箱包',2,51),
 (79,'男包',3,78),
 (80,'肩包',3,78),
 (81,'旅行',3,78),
 (82,'钱包',3,78),
 (83,'家居',1,NULL),
 (84,'日用超市',2,83),
 (85,'收纳',3,84),
 (86,'伞',3,84),
 (87,'礼品',3,84),
 (88,'钟表',3,84),
 (89,'家饰',2,83),
 (90,'窗帘',3,89),
 (91,'十字绣',3,89),
 (92,'照片墙',3,89),
 (93,'地毯',3,89),
 (94,'家纺',2,83),
 (95,'四件套',3,94),
 (96,'靠垫',3,94),
 (97,'蚊帐',3,94),
 (98,'蚕丝被',3,94),
 (99,'日化',2,83),
 (100,'洗发',3,99),
 (101,'香薰',3,99),
 (102,'沐浴',3,99),
 (103,'卫生巾',3,99),
 (104,'家具',2,83),
 (105,'床',3,104),
 (106,'柜子',3,104),
 (107,'茶几',3,104),
 (108,'沙发',3,104),
 (109,'宜家',3,104),
 (110,'厨房',2,83),
 (111,'茶具',3,110),
 (112,'健康筷子',3,110),
 (113,'餐具',3,110),
 (114,'锅具',3,110),
 (115,'杯',3,110),
 (116,'装潢建材',2,83),
 (117,'灯饰',3,116),
 (118,'浴霸',3,116),
 (119,'卫浴',3,116),
 (120,'地板',3,116),
 (121,'洁具',2,83),
 (122,'晒衣',3,121),
 (123,'拖把',3,121),
 (124,'牙刷',3,121),
 (125,'擦地拖',3,121),
 (126,'母婴',1,NULL),
 (127,'奶粉',2,126),
 (128,'辅食',3,127),
 (129,'营养',3,127),
 (130,'妈妈保健',3,127),
 (131,'益智',2,126),
 (132,'家具',3,131),
 (133,'户外',3,131),
 (134,'早教',3,131),
 (135,'推车',3,131),
 (136,'车',3,131),
 (137,'用品',2,126),
 (138,'湿巾',3,137),
 (139,'喂哺',3,137),
 (140,'洗护',3,137),
 (141,'睡袋',3,137),
 (142,'尿片',3,137),
 (143,'食品',1,NULL),
 (144,'保健',2,143),
 (145,'燕窝',3,144),
 (146,'螺旋藻',3,144),
 (147,'安利',3,144),
 (148,'蜂蜜',3,144),
 (149,'零食',2,143),
 (150,'牛肉干',3,149),
 (151,'春茶',3,149),
 (152,'枣类',3,149),
 (153,'巧克力',3,149),
 (154,'民生',2,143),
 (155,'水果',3,154),
 (156,'私房菜',3,154),
 (157,'膳食',3,154),
 (158,'干货',3,154),
 (159,'美容',1,NULL),
 (160,'护肤',2,159),
 (161,'精华',3,160),
 (162,'面膜',3,160),
 (163,'精油',3,160),
 (164,'爽肤水',3,160),
 (165,'彩妆',2,159),
 (166,'粉饼',3,165),
 (167,'腮红',3,165),
 (168,'粉底',3,165),
 (169,'眼影',3,165),
 (170,'香水',3,165),
 (171,'国货',2,159),
 (172,'芳草集',3,171),
 (173,'牛尔',3,171),
 (174,'相宜',3,171),
 (175,'佰草集',3,171),
 (176,'数码',1,NULL),
 (177,'配件',2,176),
 (178,'摄像头',3,177),
 (179,'3G上网',3,177),
 (180,'USB',3,177),
 (181,'蓝牙',3,177),
 (182,'大家电',2,176),
 (183,'空调',3,182),
 (184,'液晶',3,182),
 (185,'油烟机',3,182),
 (186,'冰箱',3,182),
 (187,'办公',2,176),
 (188,'辞典',3,187),
 (189,'投影',3,187),
 (190,'打印',3,187),
 (191,'墨盒',3,187),
 (192,'手机',2,176),
 (193,'三星',3,192),
 (194,'索爱',3,192),
 (195,'Nokia',3,192),
 (196,'Dopod',3,192),
 (197,'电脑',2,176),
 (198,'整机',3,197),
 (199,'硬件',3,197),
 (200,'周边',3,197),
 (201,'LCD',3,197),
 (202,'网络',3,197),
 (203,'小家电',2,176),
 (204,'风扇',3,203),
 (205,'榨汁',3,203),
 (206,'耳机',3,203),
 (207,'加湿',3,203),
 (208,'笔记本',2,176),
 (209,'苹果',3,208),
 (210,'联想',3,208),
 (211,'上网本',3,208),
 (212,'IBM',3,208),
 (213,'相机',2,176),
 (214,'富士',3,213),
 (215,'索尼',3,213),
 (216,'摄像机',3,213),
 (217,'单反',3,213),
 (218,'国货手机',2,176),
 (219,'智能',3,218),
 (220,'双卡双待',3,218),
 (221,'炒股',3,218),
 (222,'个人护理',2,176),
 (223,'按摩',3,222),
 (224,'剃须刀',3,222),
 (225,'足浴器',3,222),
 (226,'电玩',2,176),
 (227,'U盘',3,226),
 (228,'移动硬盘',3,226),
 (229,'内存卡',3,226),
 (230,'PSP',3,226),
 (231,'MP4',2,176),
 (232,'索尼',3,231),
 (233,'iPod',3,231),
 (234,'艾诺',3,231),
 (235,'蓝魔',3,231),
 (236,'文体',1,NULL),
 (237,'宠物',2,236),
 (238,'鱼',3,237),
 (239,'零食',3,237),
 (240,'服饰',3,237),
 (241,'猫粮',3,237),
 (242,'狗粮',3,237),
 (243,'音像',2,236),
 (244,'胎教',3,243),
 (245,'吉他',3,243),
 (246,'电影',3,243),
 (247,'唱片',3,243),
 (248,'电视',3,243),
 (249,'书籍',2,236),
 (250,'外语',3,249),
 (251,'养生',3,249),
 (252,'小说',3,249),
 (253,'育儿',3,249),
 (254,'考试',3,249),
 (255,'文具',2,236),
 (256,'书包',3,255),
 (257,'日韩',3,255),
 (258,'本册',3,255),
 (259,'台历',3,255),
 (260,'笔',3,255),
 (261,'收藏',2,236),
 (262,'邮品',3,261),
 (263,'古玩街',3,261),
 (264,'和田玉',3,261),
 (265,'钱币',3,261),
 (266,'汽车',2,236),
 (267,'坐垫',3,266),
 (268,'GPS',3,266),
 (269,'外饰',3,266),
 (270,'保养',3,266),
 (271,'美容',3,266),
 (272,'运动',2,236),
 (273,'羽拍',3,272),
 (274,'游泳',3,272),
 (275,'瑜伽',3,272),
 (276,'舞',3,272),
 (277,'器械',3,272),
 (278,'玩具',2,236),
 (279,'机器人',3,278),
 (280,'毛绒',3,278),
 (281,'模型',3,278),
 (282,'娃娃',3,278),
 (283,'户外',2,236),
 (284,'垂钓',3,283),
 (285,'登山鞋',3,283),
 (286,'背包',3,283),
 (287,'冲锋衣',3,283),
 (288,'虚拟',1,NULL),
 (289,'机票',2,288),
 (290,'特色客栈',3,289),
 (291,'酒店',3,289),
 (292,'旅游',3,289),
 (293,'门票',3,289),
 (294,'IP卡',2,288),
 (295,'网络电话',3,294),
 (296,'skype',3,294),
 (297,'手机号码',3,294),
 (298,'充值卡',2,288),
 (299,'电信',3,298),
 (300,'联通',3,298),
 (301,'移动',3,298),
 (302,'网游',2,288),
 (303,'永恒之塔',3,302),
 (304,'问道',3,302),
 (305,'DNF',3,302),
 (306,'诛仙2',3,302),
 (307,'点卡',2,288),
 (308,'蜀门',3,307),
 (309,'QQ',3,307),
 (310,'魔兽',3,307),
 (311,'完美国际',3,307),
 (312,'彩票',2,288),
 (313,'大乐透',3,312),
 (314,'排三',3,312),
 (315,'足彩',3,312),
 (316,'双色球',3,312),
 (317,'服务',1,NULL),
 (318,'吃喝玩乐',2,317),
 (319,'同城活动',3,318),
 (320,'省钱',3,318),
 (321,'外卖',3,318),
 (322,'保姆',2,317),
 (323,'婚嫁',3,322),
 (324,'装修',3,322),
 (325,'培训班',3,322),
 (326,'招工',3,322),
 (327,'网络服务',2,317),
 (328,'网店装修',3,327),
 (329,'物流',3,327),
 (330,'软件',3,327),
 (331,'房产',2,317),
 (332,'租房',3,331),
 (333,'急售',3,331),
 (334,'合租',3,331),
 (335,'二手房',3,331),
 (336,'创意站',2,317),
 (337,'礼物',3,336),
 (338,'定制',3,336),
 (339,'品牌设计',3,336),
 (340,'折扣券',2,317),
 (341,'超市卡',3,340),
 (342,'蛋糕券',3,340),
 (343,'电影票',3,340),
 (344,'生活',2,317),
 (345,'摄影',3,344),
 (346,'益智',3,344),
 (347,'鲜花',3,344),
 (348,'翻译',3,344),
 (349,'园艺',3,344);
/*!40000 ALTER TABLE `tb_productcategory` ENABLE KEYS */;


--
-- Definition of table `tb_productinfo`
--

DROP TABLE IF EXISTS `tb_productinfo`;
CREATE TABLE `tb_productinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `description` text,
  `createTime` datetime DEFAULT NULL,
  `baseprice` float DEFAULT NULL,
  `marketprice` float DEFAULT NULL,
  `sellprice` float DEFAULT NULL,
  `sexrequest` varchar(5) DEFAULT NULL,
  `commend` bit(1) DEFAULT NULL,
  `clickcount` int(11) DEFAULT NULL,
  `sellCount` int(11) DEFAULT NULL,
  `categoryId` int(11) DEFAULT NULL,
  `uploadFile` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uploadFile` (`uploadFile`),
  KEY `FK28A6CDEC487D8DAB` (`categoryId`),
  KEY `FK28A6CDEC3E1DFEF5` (`uploadFile`),
  CONSTRAINT `FK28A6CDEC3E1DFEF5` FOREIGN KEY (`uploadFile`) REFERENCES `tb_uploadfile` (`id`),
  CONSTRAINT `FK28A6CDEC487D8DAB` FOREIGN KEY (`categoryId`) REFERENCES `tb_productcategory` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=gbk;

--
-- Dumping data for table `tb_productinfo`
--

/*!40000 ALTER TABLE `tb_productinfo` DISABLE KEYS */;
INSERT INTO `tb_productinfo` (`id`,`name`,`description`,`createTime`,`baseprice`,`marketprice`,`sellprice`,`sexrequest`,`commend`,`clickcount`,`sellCount`,`categoryId`,`uploadFile`) VALUES 
 (1,'Java 编程词典','JAVA编程词典  全能版 u       初学者快速入门（入门模式）：\r\n\r\nJava编程入门技能学习与训练（29课，乐趣学习模式）及该部分内容全程技术支持。\r\n\r\nu       视频讲堂（视频中心）：19小时入门学习录像，18小时项目开发录像  \r\n\r\nu       典型实例（实例中心）：408个典型实例\r\n\r\nu       实用项目（项目中心）：10个实用项目\r\n\r\n','2010-04-20 13:40:25',98,150,120,'BOY',0x01,17369,2,330,1),
 (2,'C# 编程词典','C#编程词典  全能版 u       初学者快速入门：\r\n\r\nC#编程入门技能学习与训练（28课，乐趣学习模式）及该部分内容全程技术支持。\r\n\r\nu       视频讲堂（视频中心）：14小时入门学习录像，16小时项目开发录像\r\n\r\nu       典型实例（实例中心）：134个典型实例，C#程序开发范例参考\r\n\r\nu       实用项目（项目中心）：10个行业项目\r\n\r\n','2010-04-20 13:42:26',98,150,120,'BOY',0x01,12239,0,330,2),
 (3,'.NET编程词典','ASP.NET编程词典  企业版 u       初学者快速入门：\r\n\r\nAsp.net编程技能入门学习与训练（20课，乐趣学习模式）及该部分内容全程技术支持\r\n\r\nAsp.net编程技能拓展学习专题训练（20课，实践学习模式）及该部分内容全程技术支持（升级）\r\n\r\nAsp.net编程技能专题训练（12课，专题开发模式）及该部分内容全程技术支持（升级）\r\n\r\nu       视频讲堂（视频中心）：73小时录像（入门学习，典型模块、范例、项目）\r\n\r\nu       开发技术全解：Asp.net核心技术参考、Asp.net数据库开发参考、网络编程、从基础到项目实战、\r\n\r\n全能速查手册、网络编程标准教程\r\n\r\nu       典型实例应用：程序开发范例（1版+2版新增）：473个典型实例；      范例：126个范例\r\n\r\nu       系统开发方案：128个系统开发方案\r\n\r\nu           实用项目：34个项目，27个典型模块\r\n\r\n','2010-04-20 14:05:07',98,150,120,'BOY',0x01,1247,0,330,3),
 (4,'VB 编程词典','Visual Basic 编程词典  企业版 u       两种数据库：所有项目均提供二种数据库实现方法（SQL   Access \r\nu       初学者快速入门：\r\n\r\nVisual Basic编程技能入门学习与训练（25课，乐趣学习模式）及该部分内容全程技术支持\r\n\r\nVisual Basic编程技能拓展学习专题训练（20课，实践学习模式）及该部分内容全程技术支持（升级）\r\n\r\nVisual Basic编程技能专题训练（12课，专题开发模式）及该部分内容全程技术支持（升级）\r\n\r\nu        视频讲堂（视频中心）：110.5小时录像（从零起步学习、程序设计入门、开发应用实战、范例全程、项目开发、打包发行）\r\n\r\nu        开发技术全解：Visual Basic函数开发参考、Visual Basic语句开发参考、控件开发参考、程序设计入门参考、程序设计进阶参考、数据库开发参考、数据库开发实例参考、应用开发参考、程序开发实战参考、核心开发参考、VB2005入门参考\r\n\r\nu       典型实例应用：827个典型实例+104个关键技术+1266个经验技巧\r\n\r\nu       系统开发方案：305个系统开发方案\r\n\r\n','2010-04-20 14:02:33',98,150,120,'BOY',0x01,12366,0,330,4),
 (5,'VC++编程词典','Visual c++编程词典  企业版 u       初学者快速入门：\r\n\r\nVisual C++编程技能入门学习与训练（24课，乐趣学习模式）及该部分内容全程技术支持\r\n\r\nVisual C++编程技能拓展学习专题训练（20课，实践学习模式）及该部分内容全程技术支持（升级）\r\n\r\nVisual C++编程技能专题训练（12课，专题开发模式）及该部分内容全程技术支持（升级）\r\n\r\nu       编程视频讲堂：****小时\r\n\r\nu       开发技术全解：Visual C++编程速成指南（一），Visual C++核心技术参考\r\n\r\nVisual C++编程速成指南（二）， Visual C++程序开发技术\r\n\r\n','2010-04-20 14:04:41',98,150,120,'BOY',0x01,4563,0,330,5);
/*!40000 ALTER TABLE `tb_productinfo` ENABLE KEYS */;


--
-- Definition of table `tb_uploadfile`
--

DROP TABLE IF EXISTS `tb_uploadfile`;
CREATE TABLE `tb_uploadfile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `path` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=gbk;

--
-- Dumping data for table `tb_uploadfile`
--

/*!40000 ALTER TABLE `tb_uploadfile` DISABLE KEYS */;
INSERT INTO `tb_uploadfile` (`id`,`path`) VALUES 
 (1,'201004201340260341.jpg'),
 (2,'201004201342270110.jpg'),
 (3,'201004201359330922.jpg'),
 (4,'201004201400560420.jpg'),
 (5,'201004201401400092.jpg');
/*!40000 ALTER TABLE `tb_uploadfile` ENABLE KEYS */;


--
-- Definition of table `tb_user`
--

DROP TABLE IF EXISTS `tb_user`;
CREATE TABLE `tb_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=gbk;

--
-- Dumping data for table `tb_user`
--

/*!40000 ALTER TABLE `tb_user` DISABLE KEYS */;
INSERT INTO `tb_user` (`id`,`username`,`password`) VALUES 
 (1,'admin','admin');
/*!40000 ALTER TABLE `tb_user` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
