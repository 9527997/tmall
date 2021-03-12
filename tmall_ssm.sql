# Host: 127.0.0.1  (Version: 5.5.15)
# Date: 2021-03-12 23:26:32
# Generator: MySQL-Front 5.3  (Build 4.269)

/*!40101 SET NAMES utf8 */;

#
# Structure for table "category"
#

DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

#
# Data for table "category"
#

INSERT INTO `category` VALUES (1,'头像');

#
# Structure for table "product"
#

DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `subTitle` varchar(255) DEFAULT NULL,
  `originalPrice` float DEFAULT NULL,
  `promotePrice` float DEFAULT NULL,
  `stock` int(11) DEFAULT NULL,
  `cid` int(11) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_product_category` (`cid`),
  CONSTRAINT `fk_product_category` FOREIGN KEY (`cid`) REFERENCES `category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

#
# Data for table "product"
#

INSERT INTO `product` VALUES (1,'一号','一',99.98,19.98,99,1,'2021-03-10 15:47:55');

#
# Structure for table "productimage"
#

DROP TABLE IF EXISTS `productimage`;
CREATE TABLE `productimage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_productimage_product` (`pid`),
  CONSTRAINT `fk_productimage_product` FOREIGN KEY (`pid`) REFERENCES `product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

#
# Data for table "productimage"
#

INSERT INTO `productimage` VALUES (1,1,'type_single'),(2,1,'type_detail'),(3,1,'type_detail');

#
# Structure for table "property"
#

DROP TABLE IF EXISTS `property`;
CREATE TABLE `property` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_property_category` (`cid`),
  CONSTRAINT `fk_property_category` FOREIGN KEY (`cid`) REFERENCES `category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

#
# Data for table "property"
#

INSERT INTO `property` VALUES (1,1,'大小'),(2,1,'格式');

#
# Structure for table "propertyvalue"
#

DROP TABLE IF EXISTS `propertyvalue`;
CREATE TABLE `propertyvalue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) DEFAULT NULL,
  `ptid` int(11) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_propertyvalue_property` (`ptid`),
  KEY `fk_propertyvalue_product` (`pid`),
  CONSTRAINT `fk_propertyvalue_product` FOREIGN KEY (`pid`) REFERENCES `product` (`id`),
  CONSTRAINT `fk_propertyvalue_property` FOREIGN KEY (`ptid`) REFERENCES `property` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

#
# Data for table "propertyvalue"
#

INSERT INTO `propertyvalue` VALUES (1,1,2,'jpg'),(2,1,1,'wei\'zhi');

#
# Structure for table "user"
#

DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

#
# Data for table "user"
#

INSERT INTO `user` VALUES (1,'测试用户1','password1'),(2,'测试用户2','password2'),(3,'测试用户3','password3'),(4,'测试用户4','password4'),(5,'测试用户5','password5'),(6,'黑夜问白天','123456789'),(7,'123','123'),(8,'admin','nihoa'),(9,'你好','123');

#
# Structure for table "review"
#

DROP TABLE IF EXISTS `review`;
CREATE TABLE `review` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(4000) DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  `pid` int(11) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_review_product` (`pid`),
  KEY `fk_review_user` (`uid`),
  CONSTRAINT `fk_review_product` FOREIGN KEY (`pid`) REFERENCES `product` (`id`),
  CONSTRAINT `fk_review_user` FOREIGN KEY (`uid`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "review"
#


#
# Structure for table "order_"
#

DROP TABLE IF EXISTS `order_`;
CREATE TABLE `order_` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orderCode` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `post` varchar(255) DEFAULT NULL,
  `receiver` varchar(255) DEFAULT NULL,
  `mobile` varchar(255) DEFAULT NULL,
  `userMessage` varchar(255) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `payDate` datetime DEFAULT NULL,
  `deliveryDate` datetime DEFAULT NULL,
  `confirmDate` datetime DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_order_user` (`uid`),
  CONSTRAINT `fk_order_user` FOREIGN KEY (`uid`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

#
# Data for table "order_"
#

INSERT INTO `order_` VALUES (5,'201608241638122609867','某某市，某某区，某某街道，某某号 ','610000','某某某','15111111111',NULL,'2016-12-30 00:00:00',NULL,'2021-03-10 17:08:13',NULL,1,'waitConfirm'),(6,'202103122144333881990','','','','','','2021-03-12 21:44:33','2021-03-12 21:44:37',NULL,NULL,9,'waitDelivery');

#
# Structure for table "orderitem"
#

DROP TABLE IF EXISTS `orderitem`;
CREATE TABLE `orderitem` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) DEFAULT NULL,
  `oid` int(11) DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  `number` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_orderitem_user` (`uid`),
  KEY `fk_orderitem_product` (`pid`),
  KEY `fk_orderitem_order` (`oid`),
  CONSTRAINT `fk_orderitem_order` FOREIGN KEY (`oid`) REFERENCES `order_` (`id`),
  CONSTRAINT `fk_orderitem_product` FOREIGN KEY (`pid`) REFERENCES `product` (`id`),
  CONSTRAINT `fk_orderitem_user` FOREIGN KEY (`uid`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

#
# Data for table "orderitem"
#

INSERT INTO `orderitem` VALUES (1,1,6,9,2);
