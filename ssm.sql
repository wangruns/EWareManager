/*
Navicat MySQL Data Transfer

Source Server         : hadwin
Source Server Version : 50711
Source Host           : localhost:3306
Source Database       : ssm

Target Server Type    : MYSQL
Target Server Version : 50711
File Encoding         : 65001

Date: 2017-07-05 18:51:34
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for brand
-- ----------------------------
DROP TABLE IF EXISTS `brand`;
CREATE TABLE `brand` (
  `brandId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `brandName` varchar(255) NOT NULL,
  PRIMARY KEY (`brandId`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of brand
-- ----------------------------
INSERT INTO `brand` VALUES ('45', '苹果');
INSERT INTO `brand` VALUES ('46', '三星');
INSERT INTO `brand` VALUES ('47', '小米');
INSERT INTO `brand` VALUES ('48', '佳能');
INSERT INTO `brand` VALUES ('49', '索尼');
INSERT INTO `brand` VALUES ('50', '富士');
INSERT INTO `brand` VALUES ('51', '创维');
INSERT INTO `brand` VALUES ('52', '格力');
INSERT INTO `brand` VALUES ('53', '美的');
INSERT INTO `brand` VALUES ('54', '海尔');
INSERT INTO `brand` VALUES ('55', '海信');
INSERT INTO `brand` VALUES ('56', '雅诗兰黛');
INSERT INTO `brand` VALUES ('57', '兰蔻');
INSERT INTO `brand` VALUES ('58', '欧莱雅');
INSERT INTO `brand` VALUES ('59', '香奈儿');
INSERT INTO `brand` VALUES ('60', '资生堂');
INSERT INTO `brand` VALUES ('61', '自然堂');
INSERT INTO `brand` VALUES ('62', '天梭');
INSERT INTO `brand` VALUES ('63', '卡西欧');
INSERT INTO `brand` VALUES ('64', '联想');
INSERT INTO `brand` VALUES ('65', 'OPPO');

-- ----------------------------
-- Table structure for checktb
-- ----------------------------
DROP TABLE IF EXISTS `checktb`;
CREATE TABLE `checktb` (
  `checkId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `shelfId` int(10) unsigned NOT NULL,
  `userId` int(10) unsigned NOT NULL,
  `productId` int(10) unsigned NOT NULL,
  `checkNumber` int(11) NOT NULL,
  `checkDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`checkId`),
  KEY `shelfId` (`shelfId`),
  KEY `userId` (`userId`),
  KEY `productId` (`productId`),
  CONSTRAINT `checktb_ibfk_1` FOREIGN KEY (`shelfId`) REFERENCES `shelf` (`shelfId`),
  CONSTRAINT `checktb_ibfk_2` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`),
  CONSTRAINT `checktb_ibfk_3` FOREIGN KEY (`productId`) REFERENCES `product` (`productId`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of checktb
-- ----------------------------
INSERT INTO `checktb` VALUES ('7', '63', '7', '13', '21', '2017-07-05 16:45:16');
INSERT INTO `checktb` VALUES ('8', '60', '7', '20', '52', '2017-07-05 16:45:27');

-- ----------------------------
-- Table structure for customer
-- ----------------------------
DROP TABLE IF EXISTS `customer`;
CREATE TABLE `customer` (
  `customerId` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `customerName` varchar(255) NOT NULL,
  `customerSex` varchar(255) DEFAULT NULL,
  `customerEmail` varchar(255) DEFAULT NULL,
  `customerAddress` varchar(255) DEFAULT NULL,
  `customerPhone` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`customerId`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of customer
-- ----------------------------
INSERT INTO `customer` VALUES ('2', '李强', '男', '112564356@qq.com', '长春', '13956241859');
INSERT INTO `customer` VALUES ('3', '周文浩', '男', 'cd5648@qq.com', '呼伦贝尔', '15365489521');
INSERT INTO `customer` VALUES ('4', '李晓慧', '女', 'sd21@163.com', '阿克苏', '13884555677');
INSERT INTO `customer` VALUES ('5', '张丰', '男', 'tw23@163.com', '日喀则', '15365489524');
INSERT INTO `customer` VALUES ('6', '王巍', '男', 'cd5648@qq.com', '南宁', '13956461859');
INSERT INTO `customer` VALUES ('7', '田伟华', '男', 'YF5651@126.com', '徐州', '18034846895');

-- ----------------------------
-- Table structure for intb
-- ----------------------------
DROP TABLE IF EXISTS `intb`;
CREATE TABLE `intb` (
  `inId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `productId` int(10) unsigned NOT NULL,
  `providerId` int(10) unsigned NOT NULL,
  `inNumber` int(11) NOT NULL,
  `shelfId` int(10) unsigned NOT NULL,
  `inDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`inId`),
  KEY `productId` (`productId`),
  KEY `providerId` (`providerId`),
  KEY `shelfId` (`shelfId`),
  CONSTRAINT `intb_ibfk_1` FOREIGN KEY (`productId`) REFERENCES `product` (`productId`),
  CONSTRAINT `intb_ibfk_2` FOREIGN KEY (`providerId`) REFERENCES `provider` (`providerId`),
  CONSTRAINT `intb_ibfk_3` FOREIGN KEY (`shelfId`) REFERENCES `shelf` (`shelfId`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of intb
-- ----------------------------
INSERT INTO `intb` VALUES ('4', '7', '1', '215', '67', '2017-07-05 16:38:04');
INSERT INTO `intb` VALUES ('5', '8', '2', '226', '68', '2017-07-05 16:38:29');
INSERT INTO `intb` VALUES ('6', '10', '3', '226', '65', '2017-07-05 16:39:39');

-- ----------------------------
-- Table structure for outtb
-- ----------------------------
DROP TABLE IF EXISTS `outtb`;
CREATE TABLE `outtb` (
  `outId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `productId` int(10) unsigned NOT NULL,
  `customerId` int(10) unsigned NOT NULL,
  `outNumber` int(11) NOT NULL,
  `shelfId` int(10) unsigned NOT NULL,
  `outDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `planOutNumber` int(11) NOT NULL,
  PRIMARY KEY (`outId`),
  KEY `productId` (`productId`),
  KEY `customerId` (`customerId`),
  KEY `shelfId` (`shelfId`),
  CONSTRAINT `outtb_ibfk_1` FOREIGN KEY (`productId`) REFERENCES `product` (`productId`),
  CONSTRAINT `outtb_ibfk_2` FOREIGN KEY (`customerId`) REFERENCES `customer` (`customerId`),
  CONSTRAINT `outtb_ibfk_3` FOREIGN KEY (`shelfId`) REFERENCES `shelf` (`shelfId`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of outtb
-- ----------------------------
INSERT INTO `outtb` VALUES ('4', '7', '3', '21', '60', '2017-07-05 16:40:21', '21');
INSERT INTO `outtb` VALUES ('5', '10', '4', '30', '61', '2017-07-05 16:40:42', '54');
INSERT INTO `outtb` VALUES ('6', '7', '3', '25', '61', '2017-07-05 16:49:11', '25');
INSERT INTO `outtb` VALUES ('7', '7', '4', '21', '61', '2017-07-05 16:50:02', '24');
INSERT INTO `outtb` VALUES ('8', '10', '4', '14', '62', '2017-07-05 16:50:17', '14');

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `productId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `productName` varchar(255) NOT NULL,
  `typeId` int(10) unsigned NOT NULL,
  `brandId` int(10) unsigned NOT NULL,
  `shelfId` int(10) unsigned NOT NULL,
  `productAlertValue` int(10) NOT NULL DEFAULT '100',
  `productNumber` int(11) DEFAULT NULL,
  PRIMARY KEY (`productId`),
  KEY `typeId` (`typeId`),
  KEY `brandId` (`brandId`),
  KEY `shelfId` (`shelfId`),
  CONSTRAINT `product_ibfk_1` FOREIGN KEY (`typeId`) REFERENCES `type` (`typeId`),
  CONSTRAINT `product_ibfk_2` FOREIGN KEY (`brandId`) REFERENCES `brand` (`brandId`),
  CONSTRAINT `product_ibfk_3` FOREIGN KEY (`shelfId`) REFERENCES `shelf` (`shelfId`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES ('7', '三星SM-T820', '46', '46', '60', '100', '200');
INSERT INTO `product` VALUES ('8', '三星GalaxyS8 ', '46', '46', '60', '100', '300');
INSERT INTO `product` VALUES ('9', 'iPhone 7 Plus', '46', '45', '62', '100', '400');
INSERT INTO `product` VALUES ('10', 'iPhone SE ', '46', '45', '62', '100', '200');
INSERT INTO `product` VALUES ('11', '佳能 77D', '46', '48', '61', '100', '156');
INSERT INTO `product` VALUES ('12', '佳能 800D', '46', '48', '61', '100', '159');
INSERT INTO `product` VALUES ('13', 'GreeA3变频空调', '47', '52', '63', '100', '148');
INSERT INTO `product` VALUES ('14', 'Hisense LED39S30', '47', '55', '64', '100', '148');
INSERT INTO `product` VALUES ('15', '海尔 BCD-572WDENU1冰箱', '47', '54', '64', '100', '189');
INSERT INTO `product` VALUES ('16', '雅诗兰黛沁水粉底液SPF15', '49', '56', '65', '100', '124');
INSERT INTO `product` VALUES ('17', '雅诗兰黛倾慕唇膏', '49', '56', '65', '100', '111');
INSERT INTO `product` VALUES ('18', '兰蔻水光润养精华液 ', '49', '57', '66', '100', '256');
INSERT INTO `product` VALUES ('19', '兰蔻新立体塑颜紧致乳液 ', '49', '57', '66', '100', '324');
INSERT INTO `product` VALUES ('20', '欧莱雅清润葡萄籽特润凝霜 ', '49', '58', '67', '100', '154');
INSERT INTO `product` VALUES ('21', '天梭2015新款杜鲁尔系列T099.407.22.038.00自动机械表', '50', '62', '68', '100', '148');
INSERT INTO `product` VALUES ('22', '卡西欧CASIO手表G-SHOCK潮流双显GA-110 GA-110HC-1A 潮流黑紫', '50', '63', '68', '100', '456');

-- ----------------------------
-- Table structure for provider
-- ----------------------------
DROP TABLE IF EXISTS `provider`;
CREATE TABLE `provider` (
  `providerId` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `providerName` varchar(255) NOT NULL,
  `providerSex` varchar(255) DEFAULT NULL,
  `providerEmail` varchar(255) DEFAULT NULL,
  `providerAddress` varchar(255) DEFAULT NULL,
  `providerPhone` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`providerId`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of provider
-- ----------------------------
INSERT INTO `provider` VALUES ('1', '李华', '女', '112564356@qq.com', '北京', '13884555671');
INSERT INTO `provider` VALUES ('2', '张丰', '男', 'zf2015@163.com', '西安', '13956241859');
INSERT INTO `provider` VALUES ('3', '周伟', '男', 'zw89@126.com', '乌鲁木齐', '15365489521');
INSERT INTO `provider` VALUES ('4', '才旦卓玛', '女', 'cd5648@qq.com', '西藏', '18035468954');
INSERT INTO `provider` VALUES ('5', '李明', '男', 'lm3695@yahoo.com', '呼和浩特', '13884555677');
INSERT INTO `provider` VALUES ('6', '王巍', '男', 'ww21@qq.com', '贵阳', '15365489524');
INSERT INTO `provider` VALUES ('7', '叶凡', '男', 'YF5651@126.com', '昆明', '13956461859');
INSERT INTO `provider` VALUES ('8', '苏丹红', '女', 'sd21@163.com', '广东', '18034846895');
INSERT INTO `provider` VALUES ('9', '田伟华', '男', 'tw23@163.com', '合肥', '13956241859');
INSERT INTO `provider` VALUES ('10', '田筱竹', '女', 'tx56@qq.com', '上海', '18035448954');
INSERT INTO `provider` VALUES ('11', '肖田', '女', 'xt134@163.coom', '秦皇岛', '13874555677');

-- ----------------------------
-- Table structure for qrcode
-- ----------------------------
DROP TABLE IF EXISTS `qrcode`;
CREATE TABLE `qrcode` (
  `qrCodeId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `qrContent` varchar(255) NOT NULL,
  PRIMARY KEY (`qrCodeId`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrcode
-- ----------------------------
INSERT INTO `qrcode` VALUES ('19', 'Q20145689');
INSERT INTO `qrcode` VALUES ('20', 'Q20156457');
INSERT INTO `qrcode` VALUES ('21', 'Q20164578');
INSERT INTO `qrcode` VALUES ('22', 'Q20172316');

-- ----------------------------
-- Table structure for shelf
-- ----------------------------
DROP TABLE IF EXISTS `shelf`;
CREATE TABLE `shelf` (
  `shelfId` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `shelfNumber` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`shelfId`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shelf
-- ----------------------------
INSERT INTO `shelf` VALUES ('60', 'SA100341');
INSERT INTO `shelf` VALUES ('61', 'SF110258');
INSERT INTO `shelf` VALUES ('62', 'SH110025');
INSERT INTO `shelf` VALUES ('63', 'SG500625');
INSERT INTO `shelf` VALUES ('64', 'SX802516');
INSERT INTO `shelf` VALUES ('65', 'SR402695');
INSERT INTO `shelf` VALUES ('66', 'SA618420');
INSERT INTO `shelf` VALUES ('67', 'ST402154');
INSERT INTO `shelf` VALUES ('68', 'SQ215489');

-- ----------------------------
-- Table structure for type
-- ----------------------------
DROP TABLE IF EXISTS `type`;
CREATE TABLE `type` (
  `typeId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `typeName` varchar(255) NOT NULL,
  `fatherTypeId` int(11) DEFAULT NULL,
  `sonTypeId` int(11) DEFAULT NULL,
  PRIMARY KEY (`typeId`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of type
-- ----------------------------
INSERT INTO `type` VALUES ('46', '手机数码', '0', '0');
INSERT INTO `type` VALUES ('47', '家电办公', '1', '2');
INSERT INTO `type` VALUES ('49', '护肤彩妆', '1', '2');
INSERT INTO `type` VALUES ('50', '珠宝配饰', '1', '2');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `userId` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `userName` varchar(255) NOT NULL,
  `userAccount` varchar(255) NOT NULL,
  `userPassword` varchar(255) NOT NULL,
  `userSex` varchar(255) DEFAULT NULL,
  `userEmail` varchar(255) DEFAULT NULL,
  `userAddress` varchar(255) DEFAULT NULL,
  `userLevel` int(11) NOT NULL,
  `userPhone` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('4', '王润生', '20141808', '20141808', '男', '673290045@qq.com', '重庆大学', '1', '18725886549');
INSERT INTO `user` VALUES ('5', '吕国庆', '20141793', '20141895', '男', '514535116@qq.com', '重庆大学', '1', '13956845682');
INSERT INTO `user` VALUES ('6', 'admin', 'admin', 'admin', '男', 'admin@cqu.edu.cn', '重庆大学', '10010', null);
INSERT INTO `user` VALUES ('7', '蔡捷', '20141806', '20141806', '男', '20171806@cqu.edu.cn', '重庆大学', '1', '13056894521');
INSERT INTO `user` VALUES ('8', '吴军', '20142348', '20142348', '男', '301589456@qq.com', '上海', '1', '18956026218');
INSERT INTO `user` VALUES ('9', '李红', '20145641', '20145641', '女', 'c3215@outlook.com ', '武汉', '1', '13564892548');
