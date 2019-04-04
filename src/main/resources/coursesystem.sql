/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50724
Source Host           : localhost:3306
Source Database       : coursesystem

Target Server Type    : MYSQL
Target Server Version : 50724
File Encoding         : 65001

Date: 2019-04-04 14:20:42
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for project
-- ----------------------------
DROP TABLE IF EXISTS `project`;
CREATE TABLE `project` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `score` bigint(20) DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  `dr` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of project
-- ----------------------------
INSERT INTO `project` VALUES ('1', '计算机', '1', '2019-03-30 21:29:01', '0');
INSERT INTO `project` VALUES ('2', '广告', '2', '2019-03-31 21:31:49', '0');

-- ----------------------------
-- Table structure for project_date
-- ----------------------------
DROP TABLE IF EXISTS `project_date`;
CREATE TABLE `project_date` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `beginTime` date NOT NULL,
  `endTime` date NOT NULL,
  `dr` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of project_date
-- ----------------------------
INSERT INTO `project_date` VALUES ('9', '2019-03-31', '2020-03-25', '0');

-- ----------------------------
-- Table structure for project_student
-- ----------------------------
DROP TABLE IF EXISTS `project_student`;
CREATE TABLE `project_student` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `projectId` int(11) NOT NULL,
  `ispass` bigint(5) NOT NULL DEFAULT '2' COMMENT '0 及格 1不及格',
  `dr` bigint(20) DEFAULT '0',
  `createTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of project_student
-- ----------------------------
INSERT INTO `project_student` VALUES ('2', '1', '1', '2', '1', '2019-03-31 21:27:13');
INSERT INTO `project_student` VALUES ('3', '1', '3', '2', '1', '2019-03-31 21:31:52');
INSERT INTO `project_student` VALUES ('4', '2', '1', '2', '1', '2019-03-31 21:34:51');
INSERT INTO `project_student` VALUES ('5', '2', '4', '0', '0', '2019-03-31 21:35:03');
INSERT INTO `project_student` VALUES ('6', '2', '3', '0', '0', '2019-04-01 20:41:09');
INSERT INTO `project_student` VALUES ('7', '1', '1', '2', '1', '2019-04-01 21:02:52');
INSERT INTO `project_student` VALUES ('8', '1', '3', '2', '1', '2019-04-01 21:03:31');
INSERT INTO `project_student` VALUES ('9', '1', '4', '2', '1', '2019-04-01 21:03:31');
INSERT INTO `project_student` VALUES ('10', '1', '1', '2', '1', '2019-04-01 23:02:49');
INSERT INTO `project_student` VALUES ('11', '1', '3', '2', '1', '2019-04-01 23:02:52');

-- ----------------------------
-- Table structure for project_teacher
-- ----------------------------
DROP TABLE IF EXISTS `project_teacher`;
CREATE TABLE `project_teacher` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `teacherId` int(11) NOT NULL,
  `project` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `score` tinyint(4) DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  `dr` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of project_teacher
-- ----------------------------
INSERT INTO `project_teacher` VALUES ('1', '1', 'shuxue', '1', '2019-03-31 08:43:01', '0');
INSERT INTO `project_teacher` VALUES ('2', '1', 'yp', '2', '2019-03-31 14:46:38', '1');
INSERT INTO `project_teacher` VALUES ('3', '1', 'fasfsa', '1', '2019-03-31 19:45:38', '0');
INSERT INTO `project_teacher` VALUES ('4', '1', 'fasfsa', '2', '2019-03-31 19:47:13', '0');
INSERT INTO `project_teacher` VALUES ('5', '5', '高数', '3', '2019-04-01 23:38:02', '0');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `number` varchar(255) NOT NULL,
  `role` bigint(5) NOT NULL COMMENT '0 学生 1教师 2管理员',
  `password` varchar(255) NOT NULL,
  `createTime` datetime DEFAULT NULL,
  `dr` bigint(20) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', '啊', '1233', '1', '123122', '2019-03-30 21:29:59', '0');
INSERT INTO `user` VALUES ('2', 'xuesheng', '123', '0', '123123', '2019-03-31 08:42:35', '0');
INSERT INTO `user` VALUES ('3', 'sb', '134213123', '0', '12312313', '2019-03-31 14:42:59', '0');
INSERT INTO `user` VALUES ('4', 'feretert', '12431241234', '0', '123123', '2019-03-31 19:55:00', '0');
INSERT INTO `user` VALUES ('5', 'zlg', '15631030603', '1', '123123', '2019-04-01 23:37:11', '0');
