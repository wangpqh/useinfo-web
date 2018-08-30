/*
Navicat MySQL Data Transfer

Source Server         : 172.16.0.191
Source Server Version : 50556
Source Host           : 172.16.0.191:3306
Source Database       : test

Target Server Type    : MYSQL
Target Server Version : 50556
File Encoding         : 65001

Date: 2018-08-30 14:48:38
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for userInfo
-- ----------------------------
DROP TABLE IF EXISTS `userInfo`;
CREATE TABLE `userInfo` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(20) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `mailBox` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of userInfo
-- ----------------------------
INSERT INTO `userInfo` VALUES ('1', 'wu', 'ptyyy', null);
INSERT INTO `userInfo` VALUES ('2', 'liu', '777', '777@we.cn');
INSERT INTO `userInfo` VALUES ('3', 'wang', 'pqh5123xy', '241391@qq.vom');
INSERT INTO `userInfo` VALUES ('4', 'duan', 'njtech', '1324@njtech.edu.cn');
INSERT INTO `userInfo` VALUES ('5', 'liii', '87903', 'kkk@mail.com');
INSERT INTO `userInfo` VALUES ('6', 'ping', 'qiu', 'hao');
INSERT INTO `userInfo` VALUES ('7', 'qiu', 'reut', 'erer');
INSERT INTO `userInfo` VALUES ('8', 'wasai', '666', 'jixuxuexi');
INSERT INTO `userInfo` VALUES ('9', '5', '5', '6');
INSERT INTO `userInfo` VALUES ('10', 'tt', 'uii', '7878');
INSERT INTO `userInfo` VALUES ('11', '358', '626', '7890');
