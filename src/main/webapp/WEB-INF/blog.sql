/*
Navicat MySQL Data Transfer

Source Server         : LS
Source Server Version : 50713
Source Host           : localhost:3306
Source Database       : blog

Target Server Type    : MYSQL
Target Server Version : 50713
File Encoding         : 65001

Date: 2016-08-07 10:49:50
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for tb_group
-- ----------------------------
DROP TABLE IF EXISTS `tb_group`;
CREATE TABLE `tb_group` (
  `pkGroup` bigint(20) NOT NULL,
  `name` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`pkGroup`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tb_menu
-- ----------------------------
DROP TABLE IF EXISTS `tb_menu`;
CREATE TABLE `tb_menu` (
  `pkMenu` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `code` int(11) NOT NULL,
  `addresss` varchar(50) NOT NULL,
  `query` bit(1) NOT NULL DEFAULT b'0',
  `add` bit(1) NOT NULL DEFAULT b'0',
  `delete` bit(1) NOT NULL DEFAULT b'0',
  `update` bit(1) NOT NULL DEFAULT b'0',
  `enable` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`pkMenu`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tb_role
-- ----------------------------
DROP TABLE IF EXISTS `tb_role`;
CREATE TABLE `tb_role` (
  `pkRole` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `parent` bigint(20) unsigned DEFAULT NULL COMMENT '父角色pkRole',
  `enable` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`pkRole`),
  KEY `parent` (`parent`),
  CONSTRAINT `tb_role_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `tb_role` (`pkRole`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tb_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `tb_role_menu`;
CREATE TABLE `tb_role_menu` (
  `pkRoleMenu` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `pkRole` bigint(20) unsigned NOT NULL,
  `pkMenu` bigint(20) unsigned NOT NULL,
  `add` bit(1) NOT NULL DEFAULT b'0',
  `delete` bit(1) NOT NULL DEFAULT b'0',
  `query` bit(1) NOT NULL DEFAULT b'0',
  `update` bit(1) NOT NULL DEFAULT b'0',
  `bgn_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  PRIMARY KEY (`pkRoleMenu`),
  KEY `pkRole` (`pkRole`),
  KEY `pkMenu` (`pkMenu`),
  CONSTRAINT `tb_role_menu_ibfk_1` FOREIGN KEY (`pkRole`) REFERENCES `tb_role` (`pkRole`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `tb_role_menu_ibfk_2` FOREIGN KEY (`pkMenu`) REFERENCES `tb_menu` (`pkMenu`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tb_user
-- ----------------------------
DROP TABLE IF EXISTS `tb_user`;
CREATE TABLE `tb_user` (
  `pkUser` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `account` varchar(50) NOT NULL,
  `nickname` varchar(50) NOT NULL,
  `sex` bit(1) NOT NULL,
  `email` varchar(60) DEFAULT NULL,
  `head` varchar(60) DEFAULT NULL,
  `signa` varchar(255) DEFAULT NULL,
  `phone` varchar(11) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`pkUser`),
  UNIQUE KEY `account` (`account`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tb_user_private
-- ----------------------------
DROP TABLE IF EXISTS `tb_user_private`;
CREATE TABLE `tb_user_private` (
  `pkUser` bigint(20) unsigned NOT NULL,
  `passwd` varchar(32) NOT NULL,
  `lock` bit(1) NOT NULL,
  PRIMARY KEY (`pkUser`),
  CONSTRAINT `tb_user_private_ibfk_1` FOREIGN KEY (`pkUser`) REFERENCES `tb_user` (`pkUser`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tb_user_role
-- ----------------------------
DROP TABLE IF EXISTS `tb_user_role`;
CREATE TABLE `tb_user_role` (
  `pkUserRole` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `pkUser` bigint(30) unsigned NOT NULL,
  `pkRole` bigint(20) unsigned NOT NULL,
  `bgn_date` datetime DEFAULT NULL COMMENT '开始时间',
  `end_date` datetime DEFAULT NULL COMMENT '结束时间',
  PRIMARY KEY (`pkUserRole`),
  KEY `pkUser` (`pkUser`),
  KEY `pkRole` (`pkRole`),
  CONSTRAINT `tb_user_role_ibfk_1` FOREIGN KEY (`pkUser`) REFERENCES `tb_user` (`pkUser`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `tb_user_role_ibfk_2` FOREIGN KEY (`pkRole`) REFERENCES `tb_role` (`pkRole`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
