/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50724
Source Host           : localhost:3306
Source Database       : leave_system

Target Server Type    : MYSQL
Target Server Version : 50724
File Encoding         : 65001

Date: 2019-04-03 17:49:20
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for record
-- ----------------------------
DROP TABLE IF EXISTS `record`;
CREATE TABLE `record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `beginTime` datetime NOT NULL,
  `endTime` datetime NOT NULL,
  `reason` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `updateTime` datetime DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  `auditorId` int(255) DEFAULT NULL,
  `day` bigint(20) NOT NULL COMMENT '天数',
  `status` bigint(20) NOT NULL DEFAULT '0' COMMENT '0 待批准 1已销假 2拒绝 3待销假',
  `studentId` int(11) DEFAULT NULL,
  `dr` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of record
-- ----------------------------

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `number` varchar(11) COLLATE utf8mb4_unicode_ci NOT NULL,
  `passWord` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `clas` bigint(20) DEFAULT NULL,
  `college` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '学院',
  `updateTime` datetime DEFAULT NULL,
  `grade` bigint(20) DEFAULT NULL COMMENT '年级',
  `createTime` datetime DEFAULT NULL,
  `major` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '专业',
  `phone` varchar(11) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role` bigint(20) NOT NULL COMMENT '0学生 1任课教师 2辅导员 3领导 4管理员',
  `dr` bigint(20) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of user
-- ----------------------------
