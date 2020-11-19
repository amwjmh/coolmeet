/*
SQLyog Enterprise v12.09 (64 bit)
MySQL - 5.5.40 : Database - meeting
*********************************************************************
*/


/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`meeting` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `meeting`;

/*Table structure for table `counter` */

DROP TABLE IF EXISTS `counter`;

CREATE TABLE `counter` (
  `visitcount` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `counter` */

insert  into `counter`(`visitcount`) values (99);

/*Table structure for table `department` */

DROP TABLE IF EXISTS `department`;

CREATE TABLE `department` (
  `departmentid` int(16) NOT NULL AUTO_INCREMENT,
  `departmentname` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`departmentid`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8;

/*Data for the table `department` */

insert  into `department`(`departmentid`,`departmentname`) values (3,'财务部'),(4,'行政部'),(7,'运维部'),(37,'人事部'),(39,'营销部'),(40,'行政部'),(41,'出纳部'),(43,'名正言顺 ');

/*Table structure for table `employee` */

DROP TABLE IF EXISTS `employee`;

CREATE TABLE `employee` (
  `employeeid` int(16) NOT NULL AUTO_INCREMENT,
  `employeename` varchar(14) DEFAULT NULL,
  `username` varchar(20) NOT NULL,
  `phone` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `status` varchar(20) DEFAULT '0',
  `departmentid` int(16) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `role` varchar(12) DEFAULT NULL,
  PRIMARY KEY (`employeeid`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=utf8;

/*Data for the table `employee` */

insert  into `employee`(`employeeid`,`employeename`,`username`,`phone`,`email`,`status`,`departmentid`,`password`,`role`) values (8,'王晓华','wangxh','13671075406','wang@qq.com','1',1,'1','1'),(9,'林耀坤','linyk','13671075406','yang@qq.com','1',2,'222222','2'),(10,'熊杰文','xiongjw','134555555','xiong@qq.com','1',3,'111111','2'),(11,'王敏','wangmin','1324554321','wangm@qq.com','1',4,'111111','2'),(17,'黄美玲','huangml002','huangml@qq.com','13567898765','1',1,'111111','2'),(20,'王敏','wangmin002','13454332334','wang@qq.com','-1',4,'111111','2'),(21,'陈敏','chenm','13559994444','www@aa.com','1',2,'111111','2'),(23,'陈晨','wangm','22·2','11','-1',1,'111111','2'),(25,'王晓华','wangxh222','111','1','-1',4,'111111','2'),(28,'武振瑶','fahget','12345678910','sqp133@126.com','1',1,'111111','2'),(64,'阳玉泉','bjgyriu','13623489','121548546.com','-1',7,'qwertyuiop',NULL),(65,'罗小龙','lid','16723333','dkfjd@qq.com','1',3,'123890',NULL),(67,'李家坤','spf','129345','fivneia','1',3,'qwerty',NULL),(68,'老僧入定','fwtp','234567890','ls@itcast.c0','1',3,'987654',NULL),(77,'黄帅','1111','13786310327','spq133@126.com','0',3,'222222',NULL);

/*Table structure for table `meeting` */

DROP TABLE IF EXISTS `meeting`;

CREATE TABLE `meeting` (
  `meetingid` int(16) NOT NULL AUTO_INCREMENT,
  `meetingname` varchar(20) DEFAULT NULL,
  `roomid` int(16) DEFAULT NULL,
  `reservationistid` int(16) DEFAULT NULL,
  `numberofparticipants` int(16) DEFAULT NULL,
  `starttime` datetime DEFAULT NULL,
  `endtime` datetime DEFAULT NULL,
  `reservationtime` datetime DEFAULT NULL,
  `canceledtime` datetime DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`meetingid`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8;

/*Data for the table `meeting` */

insert  into `meeting`(`meetingid`,`meetingname`,`roomid`,`reservationistid`,`numberofparticipants`,`starttime`,`endtime`,`reservationtime`,`canceledtime`,`description`,`status`) values (25,'公司未来走向公议',5,8,12,'2015-01-12 10:00:00','2015-01-12 12:00:00','2015-01-10 23:02:39',NULL,NULL,'1'),(26,'三季度销售总结会',7,8,12,'2015-01-12 13:00:00','2015-01-12 15:00:00','2015-01-17 23:04:18','2015-01-11 01:06:20',NULL,'1'),(27,'培训会议',6,8,12,'2015-01-13 23:06:06','2015-01-14 03:06:08','2015-01-10 23:06:33','2015-01-11 01:01:42','我看看','1'),(28,'运营会',5,8,12,'2015-01-10 23:26:11','2015-01-11 23:26:13','2015-01-10 23:26:26',NULL,'测试','0'),(29,'市场部会议',6,8,12,'2015-01-10 23:44:22','2015-01-11 23:44:24','2015-01-10 23:44:41',NULL,'市场部','0'),(30,'内部会议',10,8,12,'2015-01-10 23:55:59','2015-01-11 23:56:01','2015-01-10 23:56:20',NULL,'内部会议','0'),(31,'我的会议',9,8,12,'2015-01-12 16:33:16','2015-01-13 16:33:18','2015-01-11 16:35:11',NULL,'测试','0'),(32,'我的会议哈哈',5,8,10,'2015-01-12 16:40:31','2015-01-13 16:40:35','2015-01-11 16:40:50',NULL,'','0'),(33,'哈哈',6,8,12,'2015-01-12 16:41:45','2015-01-13 16:41:48','2015-01-11 16:42:09','2015-01-12 11:44:57','你好','1'),(34,'我的会议3',8,8,12,'2015-01-11 16:42:36','2015-01-13 16:42:38','2015-01-11 16:42:51',NULL,'测试','0'),(35,'我的会议',7,8,12,'2015-01-11 16:44:03','2015-01-11 16:44:05','2015-01-11 16:44:35',NULL,'','0'),(36,'我问问',7,8,12,'2015-01-11 16:56:57','2015-01-11 16:56:59','2015-01-11 16:57:56','2015-01-11 16:59:57','地点','1'),(37,'我的会议4',7,8,12,'2015-01-12 16:59:26','2015-01-12 16:59:31','2015-01-11 16:59:49',NULL,'我的会议','0'),(38,'班会',9,8,12,'2015-01-15 16:46:25','2015-01-16 18:46:53','2015-01-12 11:49:17','2015-01-12 11:49:37','班会','1'),(39,'测试会议',5,8,12,'2015-01-14 14:41:11','2015-01-15 14:41:14','2015-01-14 14:44:07',NULL,'ss','0'),(59,'人大会',5,NULL,34,'2020-10-03 22:50:00','2020-10-24 23:50:00',NULL,NULL,'',NULL),(60,'人大会',5,NULL,NULL,'2020-10-24 22:59:00','2020-10-24 23:59:00',NULL,NULL,'',NULL),(62,'人大会',6,9,34,'2020-10-25 08:49:00','2020-10-25 09:49:00','2020-10-25 08:49:51',NULL,'lll',NULL),(63,'人大会',5,9,34,'2020-11-10 18:22:00','2020-11-10 20:22:00','2020-11-10 17:22:25',NULL,'',NULL),(64,'测试',6,9,12,'2020-11-10 23:50:00','2020-11-10 00:50:00','2020-11-10 22:50:00',NULL,'22',NULL);

/*Table structure for table `meetingparticipants` */

DROP TABLE IF EXISTS `meetingparticipants`;

CREATE TABLE `meetingparticipants` (
  `meetingid` int(16) NOT NULL,
  `employeeid` int(16) DEFAULT NULL,
  KEY `employeeid` (`employeeid`),
  KEY `meetingparticipants` (`meetingid`),
  CONSTRAINT `employeeid` FOREIGN KEY (`employeeid`) REFERENCES `employee` (`employeeid`),
  CONSTRAINT `meetingid` FOREIGN KEY (`meetingid`) REFERENCES `meeting` (`meetingid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `meetingparticipants` */

insert  into `meetingparticipants`(`meetingid`,`employeeid`) values (62,65),(63,67),(63,68),(64,10),(64,65),(64,67),(64,68),(64,77);

/*Table structure for table `meetingroom` */

DROP TABLE IF EXISTS `meetingroom`;

CREATE TABLE `meetingroom` (
  `roomid` int(16) NOT NULL AUTO_INCREMENT,
  `roomnum` int(16) NOT NULL,
  `roomname` varchar(20) NOT NULL,
  `capacity` int(16) DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`roomid`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

/*Data for the table `meetingroom` */

insert  into `meetingroom`(`roomid`,`roomnum`,`roomname`,`capacity`,`status`,`description`) values (5,101,'第一会议室',150,'0','公共会议室'),(6,102,'第二会议室',5,'0','管理部门会议室'),(7,103,'第三会议室',12,'0','市场部专用会议室'),(8,401,'第四会议室',15,'0','公共会议室'),(9,201,'第五会议室',15,'0','最大会议室'),(10,601,'第六会议室',12,'0','需要提前三天预定'),(11,301,'多媒体教室',24,'1','测试！'),(22,101,'第一会议室',1000,'0','公共会议室');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
alter table employee add  foreign key (departmentid) references department(departmentid);


alter table meetingparticipants add  foreign key (employeeid) references employee(employeeid);


alter table meetingparticipants add  foreign key (meetingid) references meeting(meetingid);

alter table meeting add  foreign key (roomid) references meetingroom(roomid);

-- 级联

alter table meetingparticipants add foreign key (meetingid) references meeting(meetingid)on delete cascade on update cascade;

alter table meetingparticipants add foreign key (employeeid) references employee(employeeid)on delete cascade on update cascade;


alter table meeting add foreign key (roomid) references meetingroom(roomid)on delete cascade on update cascade;

alter table employee add foreign key (departmentid) references department(departmentid)on delete cascade on update cascade;

