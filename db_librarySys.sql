--
-- Create schema db_librarySys
--

CREATE DATABASE IF NOT EXISTS db_librarySys;
USE db_librarySys;

--
-- Definition of table `tb_bookinfo`
--

DROP TABLE IF EXISTS `tb_bookinfo`;
CREATE TABLE `tb_bookinfo` (
  `barcode` varchar(30) default NULL,
  `bookname` varchar(70) default NULL,
  `author` varchar(30) default NULL,
  `translator` varchar(30) default NULL,
  `ISBN` varchar(20) default NULL,
  `price` float(8,2) default NULL,
  `page` int(10) unsigned default NULL,
  `days` int(10) unsigned default NULL
  `del` tinyint(1) default '0',
  `id` int(11) NOT NULL auto_increment,
  PRIMARY KEY  (`id`)
);

--
-- Dumping data for table `tb_bookinfo`
--

INSERT INTO `tb_bookinfo` (`barcode`,`bookname`,`author`,`translator`,`ISBN`,`price`,`page`,`days`,`del`,`id`) VALUES 
 ('9787302047230','Java 2','***','','7-302',39.00,440,20,0,1),
 ('jk','kjkj','***','','7-302',12.00,50,15,1,2),
 ('9787115157690','JSP','***','','978-7',89.00,816,60,0,3),
 ('123','HTML','11','11','7-302',11.00,11,7,1,5);

--
-- Definition of table `tb_borrow`
--

DROP TABLE IF EXISTS `tb_borrow`;
CREATE TABLE `tb_borrow` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `readerid` int(10) unsigned default NULL,
  `bookid` int(10) default NULL,
  `borrowTime` date default NULL,
  `backTime` date default NULL,
  `ifback` tinyint(1) default '0',
  PRIMARY KEY  (`id`)
);

--
-- Dumping data for table `tb_borrow`
--

INSERT INTO `tb_borrow` (`id`,`readerid`,`bookid`,`borrowTime`,`backTime`,`ifback`) VALUES 
 (1,1,1,'2007-11-22','2007-12-22',1),
 (2,1,3,'2007-11-26','2007-12-26',0),
 (3,1,1,'2007-11-26','2007-12-26',0),
 (4,3,6,'2007-12-29','2007-01-08',0),
 (5,3,1,'2007-12-29','2008-01-28',0),
 (6,3,3,'2007-12-29','2008-01-28',1);


--
-- Definition of table `tb_giveback`
--

DROP TABLE IF EXISTS `tb_giveback`;
CREATE TABLE `tb_giveback` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `readerid` int(11) default NULL,
  `bookid` int(11) default NULL,
  `backTime` date default NULL,
  PRIMARY KEY  (`id`)
);

--
-- Dumping data for table `tb_giveback`
--

INSERT INTO `tb_giveback` (`id`,`readerid`,`bookid`,`backTime`) VALUES 
 (1,1,1,'2007-11-22'),
 (2,3,3,'2007-01-03');

--
-- Definition of table `tb_manager`
--

DROP TABLE IF EXISTS `tb_manager`;
CREATE TABLE `tb_manager` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `name` varchar(30) default NULL,
  `PWD` varchar(30) default NULL,
  PRIMARY KEY  (`id`)
);

--
-- Dumping data for table `tb_manager`
--

INSERT INTO `tb_manager` (`id`,`name`,`PWD`) VALUES 
 (4,'tsoft','111'),
 (3,'admin','111');

--
-- Definition of table `tb_purview`
--

DROP TABLE IF EXISTS `tb_purview`;
CREATE TABLE `tb_purview` (
  `id` int(11) NOT NULL,
  `sysset` tinyint(1) default '0',
  `readerset` tinyint(1) default '0',
  `bookset` tinyint(1) default '0',
  `borrowback` tinyint(1) default '0',
  `sysquery` tinyint(1) default '0',
  PRIMARY KEY  (`id`)
) ;

--
-- Dumping data for table `tb_purview`
--

INSERT INTO `tb_purview` (`id`,`sysset`,`readerset`,`bookset`,`borrowback`,`sysquery`) VALUES 
 (4,1,1,1,1,1),
 (3,1,1,1,1,1);


--
-- Definition of table `tb_reader`
--

DROP TABLE IF EXISTS `tb_reader`;
CREATE TABLE `tb_reader` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `name` varchar(20) default NULL,
  `sex` varchar(4) default NULL,
  `barcode` varchar(30) default NULL,
  `vocation` varchar(50) default NULL,
  `birthday` date default NULL,
  `paperType` varchar(10) default NULL,
  `paperNO` varchar(20) default NULL,
  `tel` varchar(20) default NULL,
  `email` varchar(100) default NULL,
  `createDate` date default NULL,
  `remark` text,
  PRIMARY KEY  (`id`)
);

--
-- Dumping data for table `tb_reader`
--

INSERT INTO `tb_reader` (`id`,`name`,`sex`,`barcode`,`vocation`,`birthday`,`paperType`,`paperNO`,`tel`,`email`,`createDate`,`remark`) VALUES 
 (1,'Jack','M','2008010100001','Manager','1980-07-17','Canada Visa','2201041980********','13634*******','wgh717@****.com','2007-11-22','Lyn'),
 (2,'Mary','F','123123123','Nurse','1983-02-22','Canada Visa','220','','','2007-12-29','');
