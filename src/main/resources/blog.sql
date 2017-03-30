/*
Navicat MySQL Data Transfer

Source Server         : liaosheng
Source Server Version : 80000
Source Host           : localhost:3306
Source Database       : blog

Target Server Type    : MYSQL
Target Server Version : 80000
File Encoding         : 65001

Date: 2017-03-30 15:04:15
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
INSERT INTO `t_board` VALUES ('1', '炉石传说', '我们玩炉石，靠的是技术', '8', '0');
INSERT INTO `t_board` VALUES ('2', '\r\n刀塔', '刀狗装逼讨论区', '0', '0');
INSERT INTO `t_board` VALUES ('3', '守望先锋', '有基佬拉我裤链', '0', '0');
INSERT INTO `t_board` VALUES ('4', '魔兽世界', '为了部落', '3', '0');
INSERT INTO `t_board` VALUES ('7', '英雄联盟', '面对疾风吧', '0', '0');
INSERT INTO `t_board` VALUES ('8', '黑框眼镜', '你们搞得这个东西啊，excited！', '0', '0');

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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

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
INSERT INTO `t_login_log` VALUES ('11', '4', '0:0:0:0:0:0:0:1', '2017-03-29 23:24:52.654', '0');
INSERT INTO `t_login_log` VALUES ('12', '4', '0:0:0:0:0:0:0:1', '2017-03-29 23:26:50.052', '0');

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
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `deleteflag` int(11) DEFAULT '0',
  PRIMARY KEY (`post_id`),
  KEY `IDX_POST_TOPIC_ID` (`topic_id`),
  KEY `FK_s8ds9wudctcypjgvid4ln3nnp` (`user_id`),
  CONSTRAINT `FK_s8ds9wudctcypjgvid4ln3nnp` FOREIGN KEY (`user_id`) REFERENCES `t_user` (`user_id`),
  CONSTRAINT `FK_t3iu1n5uayjh585r182qgimwm` FOREIGN KEY (`topic_id`) REFERENCES `t_topic` (`topic_id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COMMENT='帖子';

-- ----------------------------
-- Records of t_post
-- ----------------------------
INSERT INTO `t_post` VALUES ('1', '1', '1', '1', '1', '炉石传说', '我是从去年12月开始专注玩奶骑的，因为好几个职业都已经500胜了，而骑士才不到100胜，不能忍。。。摸腿骑，中速骑，佛祖骑之前也玩过，实在无爱。正好开包出了个金光螺丝，就同时练习宇宙骑，死鱼骑，恩佐斯奶骑几套卡组。幸运的是，当月就上了传说，这个月随便打打也在月末赶上了传说。这篇文章想更多的谈游戏感受，不适合效率冲传说人士阅读，希望能与单纯追求游戏乐趣的人共勉。', '2011-05-07 00:00:00', '0');
INSERT INTO `t_post` VALUES ('2', '1', '2', '1', '1', '炉石传说', '新版本萨满任务是鱼人，鱼人萨满终于要出山了，这张牌跟鱼人的配合会非常好，鱼人卡组的手牌会用的非常快，一旦成功铺场之后灵魂回响，真的是解不解左右为难。\r\n　　估计以后常见的配合就是5费芬杰，6费领军加回响，一旦卡手也可以留着配合任务完成之后的一大波铺场，我很看好这张牌在鱼人萨中的表现。', '2011-05-07 00:00:00', '0');
INSERT INTO `t_post` VALUES ('3', '1', '3', '1', '1', '炉石传说', '炉石传说朝神在新版中一套只有3张紫卡的奇迹贼冲到国服天梯前100名，这一套极为平民的奇迹贼卡组是如何构筑的呢？看看下面的卡组推荐吧。', '2011-05-16 00:00:00', '0');
INSERT INTO `t_post` VALUES ('4', '1', '4', '1', '1', '炉石传说', '在最初的方案里，是有元素系法术存在的，类似于火球术这样的元素法术会触发其它的元素单卡特效；\r\n　　●当时还有一种关于元素的创意是“当你使用的最后一张牌是元素牌时……”，不过我们不喜欢当玩家触发这个特效后却好几个回合什么也没干，“如果你在上个回合使用过元素牌……”这样的特效会更简洁；\r\n　　●我们故意让某些元素衍生卡不是元素卡，这样玩家就不能在每个回合都轻易的触发元素特效了；\r\n　　●有一些旧卡是故意没有加上元素种族的，这些卡到底加不加我们还在讨论中；\r\n　　●进化（Adapt）这个机制最开始是给“加基森”版本设计的，最开始的方案里，加基森的某一个帮派拥有“机械”和“进化 Adapt”的联动词条，玩家们可以“升级”那些联动卡；\r\n　　●进化（Adapt）最初其实叫做进化（Evolve），但后来叫进化（Adapt）了，因为我们不想把进化（Adapt）和进化（Evolve）之间混淆了（然而国服依然搞混~）。\r\n　　关于进化请以上线版本描述为准（进化/Adapt）和进化/Evolve傻傻分不清，国服上线后会在翻译上做区别吗？）\r\n　　●新版本有很多非常“酷炫”的白卡，我们想让传说卡不再成为唯一的构筑核心；', '2011-05-16 00:00:00', '0');
INSERT INTO `t_post` VALUES ('5', '4', '5', '1', '1', '魔兽世界', '魔兽世界魔兽世界魔兽世界魔兽世界', '2011-06-16 00:00:00', '0');
INSERT INTO `t_post` VALUES ('7', '4', '6', '1', '1', '魔兽世界', '魔兽世界魔兽世界魔兽世界魔兽世界', '2011-06-16 00:00:00', '0');
INSERT INTO `t_post` VALUES ('8', '4', '7', '1', '1', '魔兽世界', '魔兽世界魔兽世界魔兽世界魔兽世界', '2011-06-16 00:00:00', '0');
INSERT INTO `t_post` VALUES ('20', '1', '20', '1', '1', '炉石传说', '测试。。。。', '2011-09-17 00:00:00', '0');
INSERT INTO `t_post` VALUES ('21', '1', '21', '1', '1', '炉石传说', '测试。。。。', '2011-09-17 00:00:00', '0');
INSERT INTO `t_post` VALUES ('22', '1', '22', '1', '1', '炉石传说', '测试。。。。', '2011-09-18 00:00:00', '0');
INSERT INTO `t_post` VALUES ('23', '1', '23', '1', '1', '炉石传说', '测试。。。。', '2011-09-18 00:00:00', '0');
INSERT INTO `t_post` VALUES ('24', '1', '1', '1', '2', '炉石传说', '测试。。。。', '2011-09-18 00:00:00', '0');
INSERT INTO `t_post` VALUES ('25', '1', '1', '4', '2', '炉石传说', '哈哈哈哈', '2017-03-30 10:44:51', '0');

-- ----------------------------
-- Table structure for t_topic
-- ----------------------------
DROP TABLE IF EXISTS `t_topic`;
CREATE TABLE `t_topic` (
  `topic_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '帖子ID',
  `board_id` int(11) NOT NULL COMMENT '所属论坛',
  `topic_title` varchar(100) NOT NULL DEFAULT '' COMMENT '帖子标题',
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '发表用户',
  `create_time` datetime NOT NULL COMMENT '发表时间',
  `last_post` datetime NOT NULL COMMENT '最后回复时间',
  `topic_views` int(11) NOT NULL DEFAULT '1' COMMENT '浏览数',
  `topic_replies` int(11) NOT NULL DEFAULT '0' COMMENT '回复数',
  `digest` int(11) NOT NULL COMMENT '0:不是精华话题 1:是精华话题',
  `deleteflag` int(11) DEFAULT '0',
  PRIMARY KEY (`topic_id`),
  KEY `IDX_TOPIC_USER_ID` (`user_id`),
  KEY `IDX_TOPIC_TITLE` (`topic_title`),
  CONSTRAINT `FK_2k0o897cw1avfcyl4svhs7p57` FOREIGN KEY (`user_id`) REFERENCES `t_user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COMMENT='话题';

-- ----------------------------
-- Records of t_topic
-- ----------------------------
INSERT INTO `t_topic` VALUES ('1', '1', '输赢看淡 超冷门奶骑也可以冲上传说', '1', '2011-05-07 00:00:00', '2011-09-18 00:00:00', '0', '2', '1', '0');
INSERT INTO `t_topic` VALUES ('2', '1', '放弃后期抓海贼 月末前十防战思路分享', '1', '2011-05-07 00:00:00', '2011-05-07 00:00:00', '0', '0', '1', '0');
INSERT INTO `t_topic` VALUES ('3', '1', 'TS炉石传说卡组传承史 黑夜中的奇迹贼', '1', '2011-05-16 00:00:00', '2011-05-16 00:00:00', '0', '0', '0', '0');
INSERT INTO `t_topic` VALUES ('4', '1', '设计师：海盗仇恨太高 临时添了针对牌', '1', '2011-05-16 00:00:00', '2011-05-16 00:00:00', '0', '0', '0', '0');
INSERT INTO `t_topic` VALUES ('5', '4', '7.2萨格拉斯之墓即将到来：告诉你一些需要做的准备', '1', '2011-05-16 00:00:00', '2011-05-16 00:00:00', '0', '1', '1', '0');
INSERT INTO `t_topic` VALUES ('6', '4', '写在7.15赛季末：国服战野骑2700分3V3竞技场心得', '1', '2011-05-16 00:00:00', '2011-05-16 00:00:00', '0', '0', '0', '0');
INSERT INTO `t_topic` VALUES ('7', '4', '7.2元素萨攻略分享：新特质收益超高 饰品无新意', '1', '2011-05-16 00:00:00', '2011-05-16 00:00:00', '0', '0', '0', '0');
INSERT INTO `t_topic` VALUES ('20', '1', '平民卡组也要上传说！欧服难民贼分享', '1', '2011-09-17 00:00:00', '2011-09-17 00:00:00', '0', '0', '0', '0');
INSERT INTO `t_topic` VALUES ('21', '1', '弃牌术 你离传说只有几个青玉德的距离', '1', '2011-09-17 00:00:00', '2011-09-17 00:00:00', '0', '0', '0', '0');
INSERT INTO `t_topic` VALUES ('22', '1', '墨泽炉石秀第三期 五费大表哥也能输？', '1', '2011-09-18 00:00:00', '2011-09-18 00:00:00', '0', '0', '0', '0');
INSERT INTO `t_topic` VALUES ('23', '1', '天梯趣味实战 土豪骑士大战狂野海盗战', '1', '2011-09-18 00:00:00', '2011-09-18 00:00:00', '0', '0', '0', '0');
INSERT INTO `t_topic` VALUES ('24', '8', '一个人的命运呀,当然要靠自我奋斗', '4', '2017-03-29 00:00:00', '2017-03-29 00:00:00', '1', '0', '1', '0');
INSERT INTO `t_topic` VALUES ('27', '8', '接龙，我先来一句，“苟”', '5', '2017-03-29 00:00:00', '2017-03-29 00:00:00', '1', '0', '0', '0');

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
INSERT INTO `t_user` VALUES ('4', '廖晟', '123456', '1', '0', '150', '2017-03-29 23:26:38', '0:0:0:0:0:0:0:1');
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
