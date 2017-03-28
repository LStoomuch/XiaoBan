/*
Navicat MySQL Data Transfer

Source Server         : sheng
Source Server Version : 50634
Source Host           : localhost:3306
Source Database       : blog

Target Server Type    : MYSQL
Target Server Version : 50634
File Encoding         : 65001

Date: 2017-03-28 23:28:07
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for t_board
-- ----------------------------
DROP TABLE IF EXISTS `t_board`;
CREATE TABLE `t_board` (
  `board_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '论坛版块ID',
  `board_name` varchar(150) NOT NULL DEFAULT '' COMMENT '论坛版块名',
  `board_desc` varchar(255) DEFAULT NULL COMMENT '论坛版块描述',
  `topic_num` int(11) NOT NULL DEFAULT '0' COMMENT '帖子数目',
  `deleteflag` int(11) DEFAULT '0',
  PRIMARY KEY (`board_id`),
  KEY `AK_Board_NAME` (`board_name`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_board
-- ----------------------------
INSERT INTO `t_board` VALUES ('1', '育儿', '培育健康聪明宝贝，分享您的经验心得\r\n', '8', '0');
INSERT INTO `t_board` VALUES ('2', '\r\n童言', '从宝宝丫丫学语开始，总是会冒出很多奇思妙想，总是会说出一些令你开心大笑的话，让我们一起记录，一起分享', '0', '0');
INSERT INTO `t_board` VALUES ('3', '儿哥', '经典传承——古代儿歌精选 ', '0', '0');
INSERT INTO `t_board` VALUES ('4', ' 故事', '讲故事,故事让宝宝学会自己讲故事', '3', '0');
INSERT INTO `t_board` VALUES ('7', 'dddddddddddd', 'ddddddddddddddddddddddddddddddd', '0', '0');
INSERT INTO `t_board` VALUES ('8', '育儿', '育儿经验~~', '0', '0');

-- ----------------------------
-- Table structure for t_board_manager
-- ----------------------------
DROP TABLE IF EXISTS `t_board_manager`;
CREATE TABLE `t_board_manager` (
  `board_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`board_id`,`user_id`),
  KEY `FK_mr36eb5oudr4kkdhjhn9tnjvw` (`user_id`),
  CONSTRAINT `FK_mr36eb5oudr4kkdhjhn9tnjvw` FOREIGN KEY (`user_id`) REFERENCES `t_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='论坛管理员';

-- ----------------------------
-- Records of t_board_manager
-- ----------------------------
INSERT INTO `t_board_manager` VALUES ('1', '1');
INSERT INTO `t_board_manager` VALUES ('1', '2');
INSERT INTO `t_board_manager` VALUES ('5', '2');
INSERT INTO `t_board_manager` VALUES ('5', '3');

-- ----------------------------
-- Table structure for t_login_log
-- ----------------------------
DROP TABLE IF EXISTS `t_login_log`;
CREATE TABLE `t_login_log` (
  `login_log_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `ip` varchar(30) NOT NULL DEFAULT '',
  `login_datetime` varchar(30) NOT NULL,
  `deleteflag` int(11) DEFAULT '0',
  PRIMARY KEY (`login_log_id`),
  KEY `FK_9ewx8t59gl5pyoxtw467a4phv` (`user_id`),
  CONSTRAINT `FK_9ewx8t59gl5pyoxtw467a4phv` FOREIGN KEY (`user_id`) REFERENCES `t_user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_login_log
-- ----------------------------
INSERT INTO `t_login_log` VALUES ('1', '4', '0:0:0:0:0:0:0:1', '2017-03-21 23:15:03.969', '0');
INSERT INTO `t_login_log` VALUES ('2', '4', '0:0:0:0:0:0:0:1', '2017-03-21 23:22:02.383', '0');
INSERT INTO `t_login_log` VALUES ('3', '4', '0:0:0:0:0:0:0:1', '2017-03-23 00:08:08.056', '0');
INSERT INTO `t_login_log` VALUES ('4', '4', '192.168.1.107', '2017-03-25 14:49:10.183', '0');
INSERT INTO `t_login_log` VALUES ('5', '17', '0:0:0:0:0:0:0:1', '2017-03-25 15:01:43.105', '0');
INSERT INTO `t_login_log` VALUES ('6', '4', '0:0:0:0:0:0:0:1', '2017-03-25 15:02:05.831', '0');
INSERT INTO `t_login_log` VALUES ('7', '4', '0:0:0:0:0:0:0:1', '2017-03-25 15:13:04.498', '0');
INSERT INTO `t_login_log` VALUES ('8', '4', '0:0:0:0:0:0:0:1', '2017-03-25 15:31:09.574', '0');
INSERT INTO `t_login_log` VALUES ('10', '4', '0:0:0:0:0:0:0:1', '2017-03-28 22:57:43.478', '0');

-- ----------------------------
-- Table structure for t_post
-- ----------------------------
DROP TABLE IF EXISTS `t_post`;
CREATE TABLE `t_post` (
  `post_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '帖子ID',
  `board_id` int(11) NOT NULL DEFAULT '0' COMMENT '论坛ID',
  `topic_id` int(11) NOT NULL DEFAULT '0' COMMENT '话题ID',
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '发表者ID',
  `post_type` tinyint(4) NOT NULL DEFAULT '2' COMMENT '帖子类型 1:主帖子 2:回复帖子',
  `post_title` varchar(50) NOT NULL COMMENT '帖子标题',
  `post_text` text NOT NULL COMMENT '帖子内容',
  `create_time` date NOT NULL COMMENT '创建时间',
  `deleteflag` int(11) DEFAULT '0',
  PRIMARY KEY (`post_id`),
  KEY `IDX_POST_TOPIC_ID` (`topic_id`),
  KEY `FK_s8ds9wudctcypjgvid4ln3nnp` (`user_id`),
  CONSTRAINT `FK_s8ds9wudctcypjgvid4ln3nnp` FOREIGN KEY (`user_id`) REFERENCES `t_user` (`user_id`),
  CONSTRAINT `FK_t3iu1n5uayjh585r182qgimwm` FOREIGN KEY (`topic_id`) REFERENCES `t_topic` (`topic_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COMMENT='帖子';

-- ----------------------------
-- Records of t_post
-- ----------------------------
INSERT INTO `t_post` VALUES ('1', '1', '1', '1', '1', '育儿', '培育健康聪明宝贝，分享您的经验心得\r\n', '2011-05-07', '0');
INSERT INTO `t_post` VALUES ('2', '1', '2', '1', '1', '趣语\r\n童言', '从宝宝丫丫学语开始，总是会冒出很多奇思妙想，总是会说出一些令你开心大笑的话，让我们一起记录，一起分享', '2011-05-07', '0');
INSERT INTO `t_post` VALUES ('3', '1', '3', '1', '1', 'test3', 'http://localhost/forum/boardManage.do?method=addTopicPage&boardId=1', '2011-05-16', '0');
INSERT INTO `t_post` VALUES ('4', '1', '4', '1', '1', 'test5', 'http://localhost/forum/boardManage.do?method=addTopicPage&boardId=1', '2011-05-16', '0');
INSERT INTO `t_post` VALUES ('5', '4', '5', '1', '1', '广为传颂的美德故事', '广为传颂的美德故事\r\n', '2011-06-16', '0');
INSERT INTO `t_post` VALUES ('6', '0', '5', '1', '2', '铁杵磨成针', '铁杵磨成针............\r\n', '2011-06-16', '0');
INSERT INTO `t_post` VALUES ('7', '4', '6', '1', '1', '让宝宝学会自己讲故事的妙招一', '让宝宝学会自己讲故事的妙招\r\n', '2011-06-16', '0');
INSERT INTO `t_post` VALUES ('8', '4', '7', '1', '1', '让宝宝学会自己讲故事的妙招二', '让宝宝学会自己讲故事的妙招', '2011-06-16', '0');
INSERT INTO `t_post` VALUES ('14', '5', '14', '1', '1', 'd', 'dddddddddddddd', '2011-09-12', '0');
INSERT INTO `t_post` VALUES ('15', '5', '15', '1', '1', 'dad', 'sdfffffffffffffffffff', '2011-09-12', '0');
INSERT INTO `t_post` VALUES ('20', '1', '20', '1', '1', '测试。。。。', '测试。。。。', '2011-09-17', '0');
INSERT INTO `t_post` VALUES ('21', '1', '21', '1', '1', '测试。。。。', '测试。。。。', '2011-09-17', '0');
INSERT INTO `t_post` VALUES ('22', '1', '22', '1', '1', '育儿经验', '育儿经验交流！！', '2011-09-18', '0');
INSERT INTO `t_post` VALUES ('23', '1', '23', '1', '1', '育儿经验', '育儿经验交流！！', '2011-09-18', '0');
INSERT INTO `t_post` VALUES ('24', '1', '1', '1', '2', '育儿经验', '育儿经验交流！！', '2011-09-18', '0');

-- ----------------------------
-- Table structure for t_topic
-- ----------------------------
DROP TABLE IF EXISTS `t_topic`;
CREATE TABLE `t_topic` (
  `topic_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '帖子ID',
  `board_id` int(11) NOT NULL COMMENT '所属论坛',
  `topic_title` varchar(100) NOT NULL DEFAULT '' COMMENT '帖子标题',
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '发表用户',
  `create_time` date NOT NULL COMMENT '发表时间',
  `last_post` date NOT NULL COMMENT '最后回复时间',
  `topic_views` int(11) NOT NULL DEFAULT '1' COMMENT '浏览数',
  `topic_replies` int(11) NOT NULL DEFAULT '0' COMMENT '回复数',
  `digest` int(11) NOT NULL COMMENT '0:不是精华话题 1:是精华话题',
  `deleteflag` int(11) DEFAULT '0',
  PRIMARY KEY (`topic_id`),
  KEY `IDX_TOPIC_USER_ID` (`user_id`),
  KEY `IDX_TOPIC_TITLE` (`topic_title`),
  CONSTRAINT `FK_2k0o897cw1avfcyl4svhs7p57` FOREIGN KEY (`user_id`) REFERENCES `t_user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COMMENT='话题';

-- ----------------------------
-- Records of t_topic
-- ----------------------------
INSERT INTO `t_topic` VALUES ('1', '1', 'test', '1', '2011-05-07', '2011-09-18', '0', '1', '1', '0');
INSERT INTO `t_topic` VALUES ('2', '1', 'test2', '1', '2011-05-07', '2011-05-07', '0', '0', '1', '0');
INSERT INTO `t_topic` VALUES ('3', '1', 'test3', '1', '2011-05-16', '2011-05-16', '0', '0', '0', '0');
INSERT INTO `t_topic` VALUES ('4', '1', 'test5', '1', '2011-05-16', '2011-05-16', '0', '0', '0', '0');
INSERT INTO `t_topic` VALUES ('5', '4', '广为传颂的美德故事', '1', '2011-05-16', '2011-05-16', '0', '1', '1', '0');
INSERT INTO `t_topic` VALUES ('6', '4', '让宝宝学会自己讲故事的妙招一', '1', '2011-05-16', '2011-05-16', '0', '0', '0', '0');
INSERT INTO `t_topic` VALUES ('7', '4', '让宝宝学会自己讲故事的妙招二', '1', '2011-05-16', '2011-05-16', '0', '0', '0', '0');
INSERT INTO `t_topic` VALUES ('14', '5', 'd', '1', '2011-09-12', '2011-09-12', '0', '0', '0', '0');
INSERT INTO `t_topic` VALUES ('15', '5', 'dad', '1', '2011-09-12', '2011-09-12', '0', '0', '0', '0');
INSERT INTO `t_topic` VALUES ('20', '1', '测试。。。。', '1', '2011-09-17', '2011-09-17', '0', '0', '0', '0');
INSERT INTO `t_topic` VALUES ('21', '1', '测试。。。。', '1', '2011-09-17', '2011-09-17', '0', '0', '0', '0');
INSERT INTO `t_topic` VALUES ('22', '1', '育儿经验', '1', '2011-09-18', '2011-09-18', '0', '0', '0', '0');
INSERT INTO `t_topic` VALUES ('23', '1', '育儿经验', '1', '2011-09-18', '2011-09-18', '0', '0', '0', '0');

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户Id',
  `user_name` varchar(30) NOT NULL COMMENT '用户名',
  `password` varchar(30) NOT NULL DEFAULT '' COMMENT '密码',
  `user_type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1:普通用户 2:管理员',
  `locked` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0:未锁定 1:锁定',
  `credit` int(11) DEFAULT NULL COMMENT '积分',
  `last_visit` datetime DEFAULT NULL COMMENT '最后登陆时间',
  `last_ip` varchar(20) DEFAULT NULL COMMENT '最后登陆IP',
  PRIMARY KEY (`user_id`),
  KEY `AK_AK_USER_USER_NAME` (`user_name`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('1', 'tom', '1234', '1', '1', '205', null, null);
INSERT INTO `t_user` VALUES ('2', 'john', '1234', '2', '1', '10', null, null);
INSERT INTO `t_user` VALUES ('3', 'ggg', '123123', '1', '0', '110', null, null);
INSERT INTO `t_user` VALUES ('4', '廖晟', '123456', '1', '0', '140', '2017-03-28 22:57:43', '0:0:0:0:0:0:0:1');
INSERT INTO `t_user` VALUES ('5', '王预', '123456', '1', '0', '100', null, null);
INSERT INTO `t_user` VALUES ('6', '廖晟2', '123456', '1', '0', '100', null, null);
INSERT INTO `t_user` VALUES ('7', '廖晟3', '123456', '1', '0', '100', null, null);
INSERT INTO `t_user` VALUES ('8', '廖晟5', '123456', '1', '0', '100', null, null);
INSERT INTO `t_user` VALUES ('9', '廖晟4', '123456', '1', '0', '100', null, null);
INSERT INTO `t_user` VALUES ('10', '王预2', '123', '1', '0', '100', null, null);
INSERT INTO `t_user` VALUES ('11', '廖晟6', '123', '1', '0', '100', null, null);
INSERT INTO `t_user` VALUES ('12', '廖晟7', '123', '1', '0', '100', null, null);
INSERT INTO `t_user` VALUES ('13', '廖晟8', '123', '1', '0', '100', null, null);
INSERT INTO `t_user` VALUES ('14', '廖晟9', '123', '1', '0', '100', null, null);
INSERT INTO `t_user` VALUES ('15', '廖晟10', '123', '1', '0', '100', null, null);
INSERT INTO `t_user` VALUES ('17', 'aaaa', '123456', '1', '0', '105', '2017-03-25 15:01:43', '0:0:0:0:0:0:0:1');
INSERT INTO `t_user` VALUES ('21', 'uu', '123', '1', '0', '100', null, null);
