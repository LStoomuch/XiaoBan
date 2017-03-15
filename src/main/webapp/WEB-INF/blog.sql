/*
Navicat MySQL Data Transfer

Source Server         : liaosheng
Source Server Version : 80000
Source Host           : localhost:3306
Source Database       : blog

Target Server Type    : MYSQL
Target Server Version : 80000
File Encoding         : 65001

Date: 2017-03-15 17:17:58
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for t_board
-- ----------------------------
DROP TABLE IF EXISTS `t_board`;
CREATE TABLE `t_board` (
  `board_id` int(50) NOT NULL AUTO_INCREMENT COMMENT '版块ID',
  `board_name` varchar(150) NOT NULL COMMENT '板块名',
  `board_desc` varchar(255) DEFAULT NULL COMMENT '板块描述',
  `topic_num` int(50) NOT NULL DEFAULT '0' COMMENT '帖子数目',
  `deleteflag` tinyint(4) DEFAULT NULL COMMENT '0：未删除 1：已删除',
  PRIMARY KEY (`board_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_board_manager
-- ----------------------------
DROP TABLE IF EXISTS `t_board_manager`;
CREATE TABLE `t_board_manager` (
  `board_id` int(50) NOT NULL,
  `user_id` int(50) NOT NULL,
  `deleteflag` tinyint(4) DEFAULT NULL COMMENT '0：未删除 1：已删除',
  PRIMARY KEY (`board_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_login_log
-- ----------------------------
DROP TABLE IF EXISTS `t_login_log`;
CREATE TABLE `t_login_log` (
  `login_log_id` int(11) NOT NULL COMMENT '日志Id',
  `user_id` int(11) DEFAULT NULL COMMENT '发表者ID',
  `ip` varchar(30) DEFAULT NULL COMMENT '登陆IP',
  `login_datetime` datetime DEFAULT NULL COMMENT '登陆时间',
  `deleteflag` tinyint(4) DEFAULT NULL COMMENT '0：未删除 1：已删除',
  PRIMARY KEY (`login_log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_post
-- ----------------------------
DROP TABLE IF EXISTS `t_post`;
CREATE TABLE `t_post` (
  `post_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '帖子详情ID',
  `board_id` int(11) DEFAULT NULL COMMENT '板块ID',
  `topic_id` int(11) DEFAULT NULL COMMENT '帖子ID',
  `user_id` int(11) DEFAULT NULL COMMENT '发表者ID',
  `post_type` tinyint(4) DEFAULT NULL COMMENT '帖子类型 1：主帖子 2：回复帖子',
  `post_title` varchar(50) DEFAULT NULL COMMENT '帖子标题',
  `post_text` text COMMENT '帖子内容',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `deleteflag` tinyint(4) DEFAULT NULL COMMENT '0：未删除 1：已删除',
  PRIMARY KEY (`post_id`),
  KEY `topic_id_index` (`topic_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_topic
-- ----------------------------
DROP TABLE IF EXISTS `t_topic`;
CREATE TABLE `t_topic` (
  `topic_id` int(50) NOT NULL AUTO_INCREMENT COMMENT '帖子ID',
  `board_id` int(50) NOT NULL COMMENT '所属板块',
  `topic_title` varchar(100) NOT NULL COMMENT '帖子标题',
  `user_id` int(11) NOT NULL COMMENT '发表者用户id',
  `create_time` datetime NOT NULL COMMENT '发表时间',
  `last_post_time` datetime NOT NULL COMMENT '最后回复时间',
  `topic_views` int(11) NOT NULL COMMENT '浏览数',
  `topic_replies` int(11) NOT NULL COMMENT '回复数',
  `digest` int(11) NOT NULL COMMENT '是否是精选,1：是精选，0：不是精选',
  `deleteflag` tinyint(4) DEFAULT NULL COMMENT '0：未删除 1：已删除',
  PRIMARY KEY (`topic_id`),
  KEY `topic_title_index` (`topic_title`) USING BTREE,
  KEY `user_id_index` (`user_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `user_name` varchar(30) DEFAULT NULL COMMENT '用户名',
  `user_nickname` varchar(30) DEFAULT NULL COMMENT '用户昵称',
  `password` varchar(30) DEFAULT NULL COMMENT '密码',
  `user_type` tinyint(4) DEFAULT NULL COMMENT '1:普通用户 2：管理员',
  `locked` tinyint(4) DEFAULT NULL COMMENT '0：未锁定 1：锁定',
  `credit` int(11) DEFAULT NULL COMMENT '积分',
  `deleteflag` tinyint(4) DEFAULT NULL COMMENT '0：未删除 1：已删除',
  PRIMARY KEY (`user_id`),
  KEY `user_name_index` (`user_name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
