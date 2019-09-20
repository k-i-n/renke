/*
Navicat MySQL Data Transfer

Source Server         : 本机
Source Server Version : 50553
Source Host           : localhost:3306
Source Database       : renkeyun

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2019-09-20 10:23:53
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for td_article
-- ----------------------------
DROP TABLE IF EXISTS `td_article`;
CREATE TABLE `td_article` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) DEFAULT NULL,
  `code` varchar(20) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `content` text,
  `author` varchar(20) DEFAULT NULL,
  `post_time` int(11) DEFAULT NULL,
  `image` varchar(200) DEFAULT NULL,
  `slide` text,
  `url` varchar(200) DEFAULT NULL,
  `file` text,
  `is_del` tinyint(3) DEFAULT '0',
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of td_article
-- ----------------------------
INSERT INTO `td_article` VALUES ('1', '12', null, '单位简介下的标题', '<p>单位简介下的文章</p>', '1', '2019', null, null, '#', null, '0', null, null);
INSERT INTO `td_article` VALUES ('2', '13', null, '组织架构下的标题', '<p>组织架构下的文章</p>', '1', '2019', null, null, '#', null, '0', null, null);
INSERT INTO `td_article` VALUES ('3', '14', null, '科室介绍下的标题', '<p>科室介绍下的文章</p>', '1', '2019', null, null, '#', null, '0', null, null);
INSERT INTO `td_article` VALUES ('5', '15', null, '资产管理下标题一', '<p>资产管理下文章一</p>', '1', '2019', null, null, '#', null, '0', null, null);
INSERT INTO `td_article` VALUES ('6', '15', null, '资产管理下标题二', '<p>资产管理下文章二</p>', '1', '2019', null, null, '#', null, '0', null, null);
INSERT INTO `td_article` VALUES ('7', '16', null, '房地产管理下的标题一', '<p>房地产管理下的内容一</p>', '1', '2019', null, null, '#', null, '0', null, null);
INSERT INTO `td_article` VALUES ('8', '16', null, '房地产管理下的标题二', '<p>房地产管理下的内容二</p>', '1', '2019', null, null, '#', null, '0', null, null);
INSERT INTO `td_article` VALUES ('9', '17', null, '招聘采购下的标题一', '<p>招聘采购下的内容一</p>', '1', '2019', null, null, '#', null, '0', null, null);
INSERT INTO `td_article` VALUES ('10', '17', null, '招聘采购下的标题二', '<p>招聘采购下的内容二</p>', '1', '2019', null, null, '#', null, '1', null, null);
INSERT INTO `td_article` VALUES ('11', '18', null, '海关免税下的标题一', '<p>海关免税下的内容一</p>', '1', '2019', null, null, '#', null, '1', null, null);
INSERT INTO `td_article` VALUES ('12', '18', null, '海关免税下的标题二', '<p>海关免税下的内容二</p>', '1', '2019', null, null, '#', null, '0', null, null);
INSERT INTO `td_article` VALUES ('13', '5', null, '招标信息标题一', '<p>招标信息内容一</p>', '1', '2019', null, null, '#', null, '0', null, null);
INSERT INTO `td_article` VALUES ('14', '5', null, '招标信息标题二', '<p>招标信息内容二</p>', '1', '2019', null, null, '#', null, '1', null, null);
INSERT INTO `td_article` VALUES ('15', '21', null, '山东科技大学资产管理处服务事项', '<p>这是表格内容</p>', '1', '2019', null, null, '#', null, '0', null, null);
INSERT INTO `td_article` VALUES ('16', '22', null, '教职工子女入学、生育建档、出国等开具住房证明流程', '<p>教职工子女入学、生育建档、出国等开具住房证明流程下的内容</p>', '1', '2019', null, null, '#', null, '0', null, null);
INSERT INTO `td_article` VALUES ('17', '22', null, '教职工子女入学、生育建档、出国等开具住房证明流程', '<p>教职工子女入学、生育建档、出国等开具住房证明流程下的内容二</p>', '1', '2019', null, null, '#', null, '0', null, null);
INSERT INTO `td_article` VALUES ('18', '7', null, '关于加强省级政府采购预算执行工作有关事项的通知', '<p>关于加强省级政府采购预算执行工作有关事项的通知下的内容</p>', '1', '2019', null, null, '#', null, '0', null, null);
INSERT INTO `td_article` VALUES ('19', '7', null, '中华人民共和国财政部令第100号--财政部关于修改《事业单位国有资产管理暂行办法', '<p>中华什么什么办法内容</p>', '1', '2019', null, null, '#', null, '0', null, null);
INSERT INTO `td_article` VALUES ('20', '18', null, '海关你好呀', '<p>海关海关你好呀</p>', '1', '2019', null, null, '#', null, '1', null, null);
INSERT INTO `td_article` VALUES ('21', '12', null, '1', '<p>1<br/></p>', '1', '2019', null, null, '1', null, '1', null, null);

-- ----------------------------
-- Table structure for td_article_category
-- ----------------------------
DROP TABLE IF EXISTS `td_article_category`;
CREATE TABLE `td_article_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` varchar(255) DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  `code` varchar(20) DEFAULT NULL,
  `is_del` tinyint(3) DEFAULT '0',
  `sort` int(11) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `is_nav` tinyint(3) DEFAULT '0',
  `icon` varchar(50) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `column` varchar(20) DEFAULT NULL COMMENT '栏目属性',
  `list` varchar(255) DEFAULT NULL COMMENT '列表模板',
  `article` varchar(255) DEFAULT NULL COMMENT '文章模板',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of td_article_category
-- ----------------------------
INSERT INTO `td_article_category` VALUES ('1', '0', '首页', '', '0', '0', null, null, '/home/index/index', '0', '', '', 'url', '', '');
INSERT INTO `td_article_category` VALUES ('2', '0', '机构设置', '', '0', '0', null, null, '', '0', '', '', 'article', '', 'page/article');
INSERT INTO `td_article_category` VALUES ('3', '0', '规章制度', '', '0', '0', null, null, '#', '0', '', '', 'list', 'page/list', '');
INSERT INTO `td_article_category` VALUES ('4', '0', '法律法规', '', '0', '0', null, null, '#', '0', '', '', 'list', 'page/list', '');
INSERT INTO `td_article_category` VALUES ('5', '0', '招标信息', '', '0', '0', null, null, '#', '0', '', '', 'list', 'page/list', '');
INSERT INTO `td_article_category` VALUES ('6', '0', '服务指南', '', '0', '0', null, null, '', '0', '', '', 'article', '', 'page/article');
INSERT INTO `td_article_category` VALUES ('7', '0', '资料下载', '', '0', '0', null, null, '#', '0', '', '', 'list', 'page/list', '');
INSERT INTO `td_article_category` VALUES ('8', '0', '科大首页', '', '0', '0', null, null, '/home/index/index', '0', '', '', 'url', '', '');
INSERT INTO `td_article_category` VALUES ('12', '2', '单位简介', '', '0', '0', null, null, '', '0', '', '', 'article', '', 'page/article');
INSERT INTO `td_article_category` VALUES ('13', '2', '组织架构', '', '0', '0', null, null, '', '0', '', '', 'article', '', 'page/article');
INSERT INTO `td_article_category` VALUES ('14', '2', '科室介绍', '', '0', '0', null, null, '', '0', '', '', 'article', '', 'page/article');
INSERT INTO `td_article_category` VALUES ('15', '3', '资产管理', '', '0', '0', null, null, '#', '0', '', '', 'list', 'page/list', '');
INSERT INTO `td_article_category` VALUES ('16', '3', '房地产管理', '', '0', '0', null, null, '#', '0', '', '', 'list', 'page/list', '');
INSERT INTO `td_article_category` VALUES ('17', '3', '招聘采购', '', '0', '0', null, null, '', '0', '', '', 'list', 'page/list', '');
INSERT INTO `td_article_category` VALUES ('18', '3', '海关免税', '', '0', '0', null, null, '', '0', '', '', 'list', 'page/list', '');
INSERT INTO `td_article_category` VALUES ('19', '4', '法规二级导航一', '', '0', '0', null, null, '', '0', '', '', 'list', 'page/list', '');
INSERT INTO `td_article_category` VALUES ('20', '4', '法规二级导航二', '', '0', '0', null, null, '#', '0', '', '', 'list', 'page/list', '');
INSERT INTO `td_article_category` VALUES ('21', '6', '服务事项', '', '0', '0', null, null, '#', '0', '', '', 'article', '', 'page/article');
INSERT INTO `td_article_category` VALUES ('22', '6', '工作流程', '', '0', '0', null, null, '#', '0', '', '', 'list', 'page/list', '');

-- ----------------------------
-- Table structure for td_block
-- ----------------------------
DROP TABLE IF EXISTS `td_block`;
CREATE TABLE `td_block` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) DEFAULT NULL,
  `code` varchar(20) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `content` text,
  `author` varchar(20) DEFAULT NULL,
  `post_time` int(11) DEFAULT NULL,
  `image` varchar(200) DEFAULT NULL,
  `slide` text,
  `url` varchar(200) DEFAULT NULL,
  `file` text,
  `is_del` tinyint(3) DEFAULT '0',
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of td_block
-- ----------------------------
INSERT INTO `td_block` VALUES ('1', '1', null, '图片1', 'qqq', '1', '2019', '/img/banner.png', null, '#', null, '0', null, null);
INSERT INTO `td_block` VALUES ('2', '1', null, '图片2', 'qqq', '1', '2019', '/img/banner2.png', null, '#', null, '0', null, null);
INSERT INTO `td_block` VALUES ('3', '1', null, '图片3', 'qqq', '1', '2019', '/img/banner3.png', null, '#', null, '0', null, null);
INSERT INTO `td_block` VALUES ('4', '2', null, '资产管理处召开三校区资产管理工作业务交流会', '<p>为提高业务人员工作能力，增强服务意识，2019年5月22日，资产管理处在行政楼二楼会议室召开资产管理工作业务交流会。会议围绕业务人员工作能力一系列问题展开讨论。</p>', '1', '2019', '/img/airtcle_img.png', null, '#', null, '0', null, null);
INSERT INTO `td_block` VALUES ('5', '2', null, '资产管理处召开三校区资产管理工作业务交流会', 'qqq', '1', '2019', null, null, '#', null, '0', null, null);
INSERT INTO `td_block` VALUES ('6', '2', null, '资产管理处召开三校区资产管理工作业务交流会', 'qqq', '1', '2019', null, null, '#', null, '0', null, null);
INSERT INTO `td_block` VALUES ('7', '2', null, '资产管理处召开三校区资产管理工作业务交流会', 'qqq', '1', '2019', null, null, '#', null, '0', null, null);
INSERT INTO `td_block` VALUES ('8', '2', null, '资产管理处召开三校区资产管理工作业务交流会', 'qqq', '1', '2019', null, null, '#', null, '0', null, null);
INSERT INTO `td_block` VALUES ('9', '2', null, '资产管理处召开三校区资产管理工作业务交流会', 'qqqq', '1', '2019', null, null, '#', null, '0', null, null);
INSERT INTO `td_block` VALUES ('10', '3', null, '山东科技大学矿业学院设备采购项目', 'qqq', '1', '2019', null, null, '#', null, '0', null, null);
INSERT INTO `td_block` VALUES ('11', '3', null, '山东科技大学矿业学院设备采购项目', 'qqq', '1', '2019', null, null, '#', null, '0', null, null);
INSERT INTO `td_block` VALUES ('12', '3', null, '山东科技大学矿业学院设备采购项目', 'qqq', '1', '2019', null, null, '#', null, '0', null, null);
INSERT INTO `td_block` VALUES ('13', '3', null, '山东科技大学矿业学院设备采购项目', 'qqq', '1', '2019', null, null, '#', null, '0', null, null);
INSERT INTO `td_block` VALUES ('14', '3', null, '山东科技大学矿业学院设备采购项目', 'qqq', '1', '2019', null, null, '#', null, '0', null, null);
INSERT INTO `td_block` VALUES ('15', '4', null, '服务事项', 'qqq', '1', '2019', null, null, '#', null, '0', null, null);
INSERT INTO `td_block` VALUES ('16', '4', null, '工作流程', 'qqq', '1', '2019', null, null, '#', null, '0', null, null);
INSERT INTO `td_block` VALUES ('17', '4', null, '政采目录限额标准', 'qqq', '1', '2019', null, null, '#', null, '0', null, null);
INSERT INTO `td_block` VALUES ('18', '4', null, '政采进口产品目录', 'qqq', '1', '2019', null, null, '#', null, '0', null, null);
INSERT INTO `td_block` VALUES ('19', '4', null, '固定资源使用年限', 'qqq', '1', '2019', null, null, '#', null, '0', null, null);
INSERT INTO `td_block` VALUES ('20', '4', null, '通用资产配置标准', 'qqq', '1', '2019', null, null, '#', null, '0', null, null);
INSERT INTO `td_block` VALUES ('21', '5', null, '资产管理处召开三校区资产管理工作业务交流交流会', 'qqq', '1', '2019', null, null, '#', null, '0', null, null);
INSERT INTO `td_block` VALUES ('22', '5', null, '资产管理处召开三校区资产管理工作业务交流交流会', 'qqq', '1', '2019', null, null, '#', null, '0', null, null);
INSERT INTO `td_block` VALUES ('23', '5', null, '资产管理处召开三校区资产管理工作业务交流交流会', 'qqq', '1', '2019', null, null, '#', null, '0', null, null);
INSERT INTO `td_block` VALUES ('24', '5', null, '资产管理处召开三校区资产管理工作业务交流交流会', 'qqq', '1', '2019', null, null, '#', null, '0', null, null);
INSERT INTO `td_block` VALUES ('25', '5', null, '资产管理处召开三校区资产管理工作业务交流交流会', 'qqq', '1', '2019', null, null, '#', null, '0', null, null);
INSERT INTO `td_block` VALUES ('26', '6', null, '山东科技大学矿业学院设备采购项目', 'qqq', '1', '2019', null, null, '#', null, '0', null, null);
INSERT INTO `td_block` VALUES ('27', '6', null, '山东科技大学矿业学院设备采购项目', 'qqq', '1', '2019', null, null, '#', null, '0', null, null);
INSERT INTO `td_block` VALUES ('28', '6', null, '山东科技大学矿业学院设备采购项目', 'qqq', '1', '2019', null, null, '#', null, '0', null, null);
INSERT INTO `td_block` VALUES ('29', '7', null, '固定资产管理系统', 'qqq', '1', '2019', null, null, '#', null, '0', null, null);
INSERT INTO `td_block` VALUES ('30', '7', null, '房地产综合管理系统', 'qqq', '1', '2019', null, null, '#', null, '0', null, null);
INSERT INTO `td_block` VALUES ('31', '8', null, 'Action', null, '1', '2019', null, null, '#', null, '0', null, null);
INSERT INTO `td_block` VALUES ('32', '8', null, 'Another action', '', '1', '2019', null, null, '#', null, '0', null, null);
INSERT INTO `td_block` VALUES ('33', '8', null, 'Something else here', '', '1', '2019', null, null, '#', null, '0', null, null);
INSERT INTO `td_block` VALUES ('34', '8', null, 'Separated link', '', '1', '2019', null, null, '#', null, '0', null, null);
INSERT INTO `td_block` VALUES ('35', '9', null, 'Action', '', '1', '2019', null, null, '#', null, '0', null, null);
INSERT INTO `td_block` VALUES ('36', '9', null, 'Another action', '', '1', '2019', null, null, '#', null, '0', null, null);
INSERT INTO `td_block` VALUES ('37', '9', null, 'Something else here', '', '1', '2019', null, null, '#', null, '0', null, null);
INSERT INTO `td_block` VALUES ('38', '9', null, 'Separated link', '', '1', '2019', null, null, '#', null, '0', null, null);
INSERT INTO `td_block` VALUES ('39', '10', null, 'Action', '', '1', '2019', null, null, '#', null, '0', null, null);
INSERT INTO `td_block` VALUES ('40', '10', null, 'Another action', '', '1', '2019', null, null, '#', null, '0', null, null);
INSERT INTO `td_block` VALUES ('41', '10', null, 'Something else here', '', '1', '2019', null, null, '#', null, '0', null, null);
INSERT INTO `td_block` VALUES ('42', '10', null, 'Separated link', '', '1', '2019', null, null, '#', null, '0', null, null);
INSERT INTO `td_block` VALUES ('43', '2', null, '最新动态你好呀', '<p>最新动态你好呀</p>', '1', '2019', null, null, '#', null, '0', null, null);

-- ----------------------------
-- Table structure for td_block_category
-- ----------------------------
DROP TABLE IF EXISTS `td_block_category`;
CREATE TABLE `td_block_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` varchar(255) DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  `code` varchar(20) DEFAULT NULL,
  `is_del` tinyint(3) DEFAULT '0',
  `sort` int(11) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `is_nav` tinyint(3) DEFAULT '0',
  `icon` varchar(50) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of td_block_category
-- ----------------------------
INSERT INTO `td_block_category` VALUES ('1', '0', '首页轮播图', 'lunbo', '0', '0', null, null, '', '0', '', '');
INSERT INTO `td_block_category` VALUES ('2', '0', '最新动态', 'zuixin', '0', '0', null, null, '#', '0', '', '');
INSERT INTO `td_block_category` VALUES ('3', '0', '招标信息', 'zhaobiao', '0', '0', null, null, '#', '0', '', '');
INSERT INTO `td_block_category` VALUES ('4', '0', '服务指南', 'fuwu', '0', '0', null, null, '#', '0', '', '');
INSERT INTO `td_block_category` VALUES ('5', '0', '通知公告', 'tongzhi', '0', '0', null, null, '#', '0', '', '');
INSERT INTO `td_block_category` VALUES ('6', '0', '资料下载', 'ziliao', '0', '0', null, null, '#', '0', '', '');
INSERT INTO `td_block_category` VALUES ('7', '0', '快速通道', 'kuaishu', '0', '0', null, null, '#', '0', '', '');
INSERT INTO `td_block_category` VALUES ('8', '0', '政府部门', 'zhengfu', '0', '0', null, null, '#', '0', '', '');
INSERT INTO `td_block_category` VALUES ('9', '0', '兄弟院校', 'xiongdi', '0', '0', null, null, '#', '0', '', '');
INSERT INTO `td_block_category` VALUES ('10', '0', '校园内部', 'xiaoyuan', '0', '0', null, null, '#', '0', '', '');

-- ----------------------------
-- Table structure for td_customer
-- ----------------------------
DROP TABLE IF EXISTS `td_customer`;
CREATE TABLE `td_customer` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `emp_no` varchar(20) NOT NULL DEFAULT '',
  `name` varchar(20) NOT NULL,
  `letter` varchar(10) NOT NULL DEFAULT '',
  `password` char(32) NOT NULL,
  `position_id` int(11) NOT NULL,
  `sex` varchar(50) NOT NULL,
  `birthday` date DEFAULT NULL,
  `avatar` varchar(200) DEFAULT NULL,
  `email` varchar(50) NOT NULL,
  `duty` varchar(2000) NOT NULL,
  `office_tel` varchar(20) NOT NULL,
  `mobile_tel` varchar(20) NOT NULL,
  `create_time` int(11) unsigned NOT NULL,
  `update_time` int(11) unsigned NOT NULL,
  `openid` varchar(50) DEFAULT NULL,
  `nickname` varchar(20) DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  `is_del` tinyint(3) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=365 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='用户信息';

-- ----------------------------
-- Records of td_customer
-- ----------------------------
INSERT INTO `td_customer` VALUES ('363', '1001', '1001', '', '925c842568735e2c2ef592754d75652e', '0', '', null, null, '', '', '', '', '0', '0', null, null, '0', '0');
INSERT INTO `td_customer` VALUES ('364', '1002', '1002', '', '75697693260c96b3d1aefa516884a793', '0', '', null, null, '', '', '', '', '0', '0', null, null, '0', '0');

-- ----------------------------
-- Table structure for td_customer_copy
-- ----------------------------
DROP TABLE IF EXISTS `td_customer_copy`;
CREATE TABLE `td_customer_copy` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `emp_no` varchar(20) NOT NULL DEFAULT '',
  `name` varchar(20) NOT NULL,
  `letter` varchar(10) NOT NULL DEFAULT '',
  `password` char(32) NOT NULL,
  `position_id` int(11) NOT NULL,
  `sex` varchar(50) NOT NULL,
  `birthday` date DEFAULT NULL,
  `avatar` varchar(200) DEFAULT NULL,
  `email` varchar(50) NOT NULL,
  `duty` varchar(2000) NOT NULL,
  `office_tel` varchar(20) NOT NULL,
  `mobile_tel` varchar(20) NOT NULL,
  `create_time` int(11) unsigned NOT NULL,
  `update_time` int(11) unsigned NOT NULL,
  `openid` varchar(50) DEFAULT NULL,
  `nickname` varchar(20) DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  `is_del` tinyint(3) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=365 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='用户信息';

-- ----------------------------
-- Records of td_customer_copy
-- ----------------------------
INSERT INTO `td_customer_copy` VALUES ('363', '1001', '1001', '', '925c842568735e2c2ef592754d75652e', '0', '', null, null, '', '', '', '', '0', '0', null, null, '0', '0');
INSERT INTO `td_customer_copy` VALUES ('364', '1002', '1002', '', '75697693260c96b3d1aefa516884a793', '0', '', null, null, '', '', '', '', '0', '0', null, null, '0', '0');

-- ----------------------------
-- Table structure for td_dept
-- ----------------------------
DROP TABLE IF EXISTS `td_dept`;
CREATE TABLE `td_dept` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  `is_del` tinyint(3) DEFAULT '0',
  `user_id` int(11) DEFAULT NULL,
  `user_name` varchar(20) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of td_dept
-- ----------------------------
INSERT INTO `td_dept` VALUES ('1', '0', 'AAA', '0', '1', 'user_name', null, null);
INSERT INTO `td_dept` VALUES ('2', '0', 'BBBB', '0', '1', 'user_name', null, null);
INSERT INTO `td_dept` VALUES ('3', '0', 'CCC', '0', '1', 'user_name', null, null);

-- ----------------------------
-- Table structure for td_index
-- ----------------------------
DROP TABLE IF EXISTS `td_index`;
CREATE TABLE `td_index` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(5) DEFAULT NULL,
  `is_del` tinyint(3) DEFAULT '0',
  `user_id` int(11) DEFAULT NULL,
  `user_name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of td_index
-- ----------------------------

-- ----------------------------
-- Table structure for td_menu
-- ----------------------------
DROP TABLE IF EXISTS `td_menu`;
CREATE TABLE `td_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  `pid` int(11) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  `remark` text,
  `is_del` tinyint(3) DEFAULT '0',
  `create_time` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `user_name` varchar(20) DEFAULT NULL,
  `badge` varchar(255) DEFAULT NULL,
  `icon` varchar(50) DEFAULT NULL,
  `module` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=303 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='菜单管理';

-- ----------------------------
-- Records of td_menu
-- ----------------------------
INSERT INTO `td_menu` VALUES ('18', '权限管理', '0', '', '30', '', '0', null, null, null, '', 'fa fa-cog', 'admin');
INSERT INTO `td_menu` VALUES ('19', '功能权限组', '18', 'Role/index', '420', '', '0', null, null, null, '', null, 'admin');
INSERT INTO `td_menu` VALUES ('20', '用户管理', '37', 'User/index', '440', '', '0', null, null, null, '', null, 'admin');
INSERT INTO `td_menu` VALUES ('21', '菜单管理', '37', 'Menu/index', '450', '', '0', null, null, null, '', null, 'admin');
INSERT INTO `td_menu` VALUES ('23', '功能权限设置', '18', 'Role/menu', '410', '', '0', null, null, null, '', null, 'admin');
INSERT INTO `td_menu` VALUES ('24', '功能权限分配', '18', 'Role/user', '400', '', '0', null, null, null, '', null, 'admin');
INSERT INTO `td_menu` VALUES ('25', '系统设置', '37', 'SystemConfig/index', '390', '', '0', null, null, null, '', null, 'admin');
INSERT INTO `td_menu` VALUES ('37', '系统管理', '0', '', '10', '', '0', null, null, null, '', 'fa fa-cog', 'admin');
INSERT INTO `td_menu` VALUES ('262', '首页', '0', 'index/index', '140', '', '0', null, null, null, '', '', null);
INSERT INTO `td_menu` VALUES ('263', '客户', '0', '', '130', '', '0', null, null, null, '', '', null);
INSERT INTO `td_menu` VALUES ('264', '客户列表', '263', 'Customer/index', '20', '', '0', null, null, null, '', '', null);
INSERT INTO `td_menu` VALUES ('265', '服务合同列表', '263', 'Customer/contract', '10', '', '0', null, null, null, '', '', null);
INSERT INTO `td_menu` VALUES ('266', '供应商', '0', '', '110', '', '0', null, null, null, '', '', null);
INSERT INTO `td_menu` VALUES ('267', '供应商列表', '266', 'Provider/index', '30', '', '0', null, null, null, '', '', null);
INSERT INTO `td_menu` VALUES ('268', '服务合同列表', '266', 'Provider/contract', '20', '', '0', null, null, null, '', '', null);
INSERT INTO `td_menu` VALUES ('269', '结算管理', '266', 'Provider/settlement', '10', '', '0', null, null, null, '', '', null);
INSERT INTO `td_menu` VALUES ('270', '员工', '0', '', '100', '', '0', null, null, null, '', '', null);
INSERT INTO `td_menu` VALUES ('271', '员工管理', '270', 'employee/home', '0', '', '0', null, null, null, '', '', null);
INSERT INTO `td_menu` VALUES ('272', '问答', '270', 'Employee/answers', '0', '', '0', null, null, null, '', '', null);
INSERT INTO `td_menu` VALUES ('273', '劳动合同', '0', '', '90', '', '0', null, null, null, '', '', null);
INSERT INTO `td_menu` VALUES ('274', '招聘', '0', '', '80', '', '0', null, null, null, '', '', null);
INSERT INTO `td_menu` VALUES ('275', '工作台', '274', 'NewRecruit/home', '0', '', '0', null, null, null, '', '', null);
INSERT INTO `td_menu` VALUES ('276', '  招聘需求', '274', 'Position', '0', '', '0', null, null, null, '', '', null);
INSERT INTO `td_menu` VALUES ('277', '求职者', '274', 'Candidate', '0', '', '0', null, null, null, '', '', null);
INSERT INTO `td_menu` VALUES ('278', '人才库', '274', 'Resumes/index', '0', '', '0', null, null, null, '', '', null);
INSERT INTO `td_menu` VALUES ('279', '经理人', '274', 'Agent/index', '0', '', '0', null, null, null, '', '', null);
INSERT INTO `td_menu` VALUES ('280', '企业社保', '0', '', '70', '', '0', null, null, null, '', '', null);
INSERT INTO `td_menu` VALUES ('281', '接单', '280', 'SocialInsurance/home', '0', '', '0', null, null, null, '', '', null);
INSERT INTO `td_menu` VALUES ('282', '办理', '280', 'SocialInsurance/index', '0', '', '0', null, null, null, '', '', null);
INSERT INTO `td_menu` VALUES ('283', '政策', '280', 'SocialInsurance/policy', '0', '', '0', null, null, null, '', '', null);
INSERT INTO `td_menu` VALUES ('284', '自由社保', '0', 'PersonalInsurance/home', '60', '', '0', null, null, null, '', '', null);
INSERT INTO `td_menu` VALUES ('285', '结算', '0', '', '50', '', '0', null, null, null, '', '', null);
INSERT INTO `td_menu` VALUES ('286', '帐套管理', '285', 'AccountSet/index', '0', '', '0', null, null, null, '', '', null);
INSERT INTO `td_menu` VALUES ('287', '结算管理', '285', 'AccountSet/home', '0', '', '0', null, null, null, '', '', null);
INSERT INTO `td_menu` VALUES ('288', '数据看板', '0', '', '40', '', '0', null, null, null, '', '', null);
INSERT INTO `td_menu` VALUES ('289', '数据概览', '288', 'OverviewData/home', '0', '', '0', null, null, null, '', '', null);
INSERT INTO `td_menu` VALUES ('290', '招聘业绩', '288', 'RecruitReport/index', '0', '', '0', null, null, null, '', '', null);
INSERT INTO `td_menu` VALUES ('291', '设置', '0', '', '30', '', '0', null, null, null, '', '', null);
INSERT INTO `td_menu` VALUES ('292', '企业管理', '291', 'User/index', '0', '', '0', null, null, null, '', '', null);
INSERT INTO `td_menu` VALUES ('293', '企业信息', '291', 'EnterpriseInfo/index', '0', '', '0', null, null, null, '', '', null);
INSERT INTO `td_menu` VALUES ('294', '企业设置', '291', 'EnterpriseConfig/index', '0', '', '0', null, null, null, '', '', null);
INSERT INTO `td_menu` VALUES ('297', '内容管理', '0', '', '0', '', '0', null, null, null, '', '', null);
INSERT INTO `td_menu` VALUES ('298', '文章管理', '297', 'Article/index', '0', '', '0', null, null, null, '', '', null);
INSERT INTO `td_menu` VALUES ('299', '文章分类', '297', 'Article_category/index', '0', '', '0', null, null, null, '', '', null);
INSERT INTO `td_menu` VALUES ('300', '区块管理', '297', 'Block/index', '0', '', '0', null, null, null, '', '', null);
INSERT INTO `td_menu` VALUES ('301', '区块分类', '297', 'Block_category/index', '0', '', '0', null, null, null, '', '', null);
INSERT INTO `td_menu` VALUES ('302', '单页管理', '297', 'Page/index', '0', '', '0', null, null, null, '', '', null);

-- ----------------------------
-- Table structure for td_page
-- ----------------------------
DROP TABLE IF EXISTS `td_page`;
CREATE TABLE `td_page` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(20) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `content` text,
  `author` varchar(20) DEFAULT NULL,
  `post_time` int(11) DEFAULT NULL,
  `image` varchar(200) DEFAULT NULL,
  `slide` text,
  `url` varchar(200) DEFAULT NULL,
  `file` text,
  `is_del` tinyint(3) DEFAULT '0',
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of td_page
-- ----------------------------
INSERT INTO `td_page` VALUES ('1', null, '标题', '', '鲁迅', '2019', null, null, 'block/index', null, '0', null, null);

-- ----------------------------
-- Table structure for td_position
-- ----------------------------
DROP TABLE IF EXISTS `td_position`;
CREATE TABLE `td_position` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  `dept_id` int(11) DEFAULT NULL,
  `is_del` tinyint(3) DEFAULT '0',
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of td_position
-- ----------------------------

-- ----------------------------
-- Table structure for td_role
-- ----------------------------
DROP TABLE IF EXISTS `td_role`;
CREATE TABLE `td_role` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `pid` smallint(6) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  `create_time` int(11) unsigned NOT NULL,
  `update_time` int(11) unsigned NOT NULL,
  `is_del` tinyint(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `parentId` (`pid`),
  KEY `ename` (`sort`),
  KEY `status` (`is_del`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8 COMMENT='权限';

-- ----------------------------
-- Records of td_role
-- ----------------------------
INSERT INTO `td_role` VALUES ('33', '系统管理员', null, null, '0', '0', '0', '0');
INSERT INTO `td_role` VALUES ('34', '33333', null, '', '11', '0', '0', '1');
INSERT INTO `td_role` VALUES ('35', '测试1', null, null, '0', '0', '0', '1');

-- ----------------------------
-- Table structure for td_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `td_role_menu`;
CREATE TABLE `td_role_menu` (
  `role_id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  `read` tinyint(1) DEFAULT NULL,
  `write` tinyint(1) DEFAULT NULL,
  `admin` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='权限菜单分配';

-- ----------------------------
-- Records of td_role_menu
-- ----------------------------
INSERT INTO `td_role_menu` VALUES ('33', '262', '1', '1', '1');
INSERT INTO `td_role_menu` VALUES ('33', '263', '1', '1', '1');
INSERT INTO `td_role_menu` VALUES ('33', '265', '1', '1', '1');
INSERT INTO `td_role_menu` VALUES ('33', '264', '1', '1', '1');
INSERT INTO `td_role_menu` VALUES ('33', '266', '1', '1', '1');
INSERT INTO `td_role_menu` VALUES ('33', '267', '1', '1', '1');
INSERT INTO `td_role_menu` VALUES ('33', '268', '1', '1', '1');
INSERT INTO `td_role_menu` VALUES ('33', '269', '1', '1', '1');
INSERT INTO `td_role_menu` VALUES ('33', '270', '1', '1', '1');
INSERT INTO `td_role_menu` VALUES ('33', '271', '1', '1', '1');
INSERT INTO `td_role_menu` VALUES ('33', '272', '1', '1', '1');
INSERT INTO `td_role_menu` VALUES ('33', '273', '1', '1', '1');
INSERT INTO `td_role_menu` VALUES ('33', '274', '1', '1', '1');
INSERT INTO `td_role_menu` VALUES ('33', '275', '1', '1', '1');
INSERT INTO `td_role_menu` VALUES ('33', '276', '1', '1', '1');
INSERT INTO `td_role_menu` VALUES ('33', '277', '1', '1', '1');
INSERT INTO `td_role_menu` VALUES ('33', '278', '1', '1', '1');
INSERT INTO `td_role_menu` VALUES ('33', '279', '1', '1', '1');
INSERT INTO `td_role_menu` VALUES ('33', '280', '1', '1', '1');
INSERT INTO `td_role_menu` VALUES ('33', '283', '1', '1', '1');
INSERT INTO `td_role_menu` VALUES ('33', '282', '1', '1', '1');
INSERT INTO `td_role_menu` VALUES ('33', '281', '1', '1', '1');
INSERT INTO `td_role_menu` VALUES ('33', '284', '1', '1', '1');
INSERT INTO `td_role_menu` VALUES ('33', '285', '1', '1', '1');
INSERT INTO `td_role_menu` VALUES ('33', '286', '1', '1', '1');
INSERT INTO `td_role_menu` VALUES ('33', '287', '1', '1', '1');
INSERT INTO `td_role_menu` VALUES ('33', '288', '1', '1', '1');
INSERT INTO `td_role_menu` VALUES ('33', '289', '1', '1', '1');
INSERT INTO `td_role_menu` VALUES ('33', '290', '1', '1', '1');
INSERT INTO `td_role_menu` VALUES ('33', '291', '1', '1', '1');
INSERT INTO `td_role_menu` VALUES ('33', '294', '1', '1', '1');
INSERT INTO `td_role_menu` VALUES ('33', '293', '1', '1', '1');
INSERT INTO `td_role_menu` VALUES ('33', '292', '1', '1', '1');
INSERT INTO `td_role_menu` VALUES ('33', '18', '1', '1', '1');
INSERT INTO `td_role_menu` VALUES ('33', '19', '1', '1', '1');
INSERT INTO `td_role_menu` VALUES ('33', '23', '1', '1', '1');
INSERT INTO `td_role_menu` VALUES ('33', '24', '1', '1', '1');
INSERT INTO `td_role_menu` VALUES ('33', '37', '1', '1', '1');
INSERT INTO `td_role_menu` VALUES ('33', '21', '1', '1', '1');
INSERT INTO `td_role_menu` VALUES ('33', '20', '1', '1', '1');
INSERT INTO `td_role_menu` VALUES ('33', '25', '1', '1', '1');
INSERT INTO `td_role_menu` VALUES ('33', '262', null, null, null);
INSERT INTO `td_role_menu` VALUES ('33', '263', null, null, null);
INSERT INTO `td_role_menu` VALUES ('33', '265', null, null, null);
INSERT INTO `td_role_menu` VALUES ('33', '264', null, null, null);
INSERT INTO `td_role_menu` VALUES ('33', '266', null, null, null);
INSERT INTO `td_role_menu` VALUES ('33', '267', null, null, null);
INSERT INTO `td_role_menu` VALUES ('33', '268', null, null, null);
INSERT INTO `td_role_menu` VALUES ('33', '269', null, null, null);
INSERT INTO `td_role_menu` VALUES ('33', '270', null, null, null);
INSERT INTO `td_role_menu` VALUES ('33', '271', null, null, null);
INSERT INTO `td_role_menu` VALUES ('33', '272', null, null, null);
INSERT INTO `td_role_menu` VALUES ('33', '273', null, null, null);
INSERT INTO `td_role_menu` VALUES ('33', '274', null, null, null);
INSERT INTO `td_role_menu` VALUES ('33', '275', null, null, null);
INSERT INTO `td_role_menu` VALUES ('33', '276', null, null, null);
INSERT INTO `td_role_menu` VALUES ('33', '277', null, null, null);
INSERT INTO `td_role_menu` VALUES ('33', '278', null, null, null);
INSERT INTO `td_role_menu` VALUES ('33', '279', null, null, null);
INSERT INTO `td_role_menu` VALUES ('33', '280', null, null, null);
INSERT INTO `td_role_menu` VALUES ('33', '283', null, null, null);
INSERT INTO `td_role_menu` VALUES ('33', '282', null, null, null);
INSERT INTO `td_role_menu` VALUES ('33', '281', null, null, null);
INSERT INTO `td_role_menu` VALUES ('33', '284', null, null, null);
INSERT INTO `td_role_menu` VALUES ('33', '285', null, null, null);
INSERT INTO `td_role_menu` VALUES ('33', '286', null, null, null);
INSERT INTO `td_role_menu` VALUES ('33', '287', null, null, null);
INSERT INTO `td_role_menu` VALUES ('33', '288', null, null, null);
INSERT INTO `td_role_menu` VALUES ('33', '289', null, null, null);
INSERT INTO `td_role_menu` VALUES ('33', '290', null, null, null);
INSERT INTO `td_role_menu` VALUES ('33', '291', null, null, null);
INSERT INTO `td_role_menu` VALUES ('33', '294', null, null, null);
INSERT INTO `td_role_menu` VALUES ('33', '293', null, null, null);
INSERT INTO `td_role_menu` VALUES ('33', '292', null, null, null);
INSERT INTO `td_role_menu` VALUES ('33', '18', null, null, null);
INSERT INTO `td_role_menu` VALUES ('33', '19', null, null, null);
INSERT INTO `td_role_menu` VALUES ('33', '23', null, null, null);
INSERT INTO `td_role_menu` VALUES ('33', '24', null, null, null);
INSERT INTO `td_role_menu` VALUES ('33', '37', null, null, null);
INSERT INTO `td_role_menu` VALUES ('33', '21', null, null, null);
INSERT INTO `td_role_menu` VALUES ('33', '20', null, null, null);
INSERT INTO `td_role_menu` VALUES ('33', '25', null, null, null);
INSERT INTO `td_role_menu` VALUES ('33', '262', null, null, null);
INSERT INTO `td_role_menu` VALUES ('33', '263', null, null, null);
INSERT INTO `td_role_menu` VALUES ('33', '264', null, null, null);
INSERT INTO `td_role_menu` VALUES ('33', '265', null, null, null);
INSERT INTO `td_role_menu` VALUES ('33', '266', null, null, null);
INSERT INTO `td_role_menu` VALUES ('33', '267', null, null, null);
INSERT INTO `td_role_menu` VALUES ('33', '268', null, null, null);
INSERT INTO `td_role_menu` VALUES ('33', '269', null, null, null);
INSERT INTO `td_role_menu` VALUES ('33', '270', null, null, null);
INSERT INTO `td_role_menu` VALUES ('33', '272', null, null, null);
INSERT INTO `td_role_menu` VALUES ('33', '271', null, null, null);
INSERT INTO `td_role_menu` VALUES ('33', '273', null, null, null);
INSERT INTO `td_role_menu` VALUES ('33', '274', null, null, null);
INSERT INTO `td_role_menu` VALUES ('33', '276', null, null, null);
INSERT INTO `td_role_menu` VALUES ('33', '277', null, null, null);
INSERT INTO `td_role_menu` VALUES ('33', '278', null, null, null);
INSERT INTO `td_role_menu` VALUES ('33', '279', null, null, null);
INSERT INTO `td_role_menu` VALUES ('33', '275', null, null, null);
INSERT INTO `td_role_menu` VALUES ('33', '280', null, null, null);
INSERT INTO `td_role_menu` VALUES ('33', '281', null, null, null);
INSERT INTO `td_role_menu` VALUES ('33', '282', null, null, null);
INSERT INTO `td_role_menu` VALUES ('33', '283', null, null, null);
INSERT INTO `td_role_menu` VALUES ('33', '284', null, null, null);
INSERT INTO `td_role_menu` VALUES ('33', '285', null, null, null);
INSERT INTO `td_role_menu` VALUES ('33', '287', null, null, null);
INSERT INTO `td_role_menu` VALUES ('33', '286', null, null, null);
INSERT INTO `td_role_menu` VALUES ('33', '288', null, null, null);
INSERT INTO `td_role_menu` VALUES ('33', '290', null, null, null);
INSERT INTO `td_role_menu` VALUES ('33', '289', null, null, null);
INSERT INTO `td_role_menu` VALUES ('33', '18', null, null, null);
INSERT INTO `td_role_menu` VALUES ('33', '19', null, null, null);
INSERT INTO `td_role_menu` VALUES ('33', '23', null, null, null);
INSERT INTO `td_role_menu` VALUES ('33', '24', null, null, null);
INSERT INTO `td_role_menu` VALUES ('33', '291', null, null, null);
INSERT INTO `td_role_menu` VALUES ('33', '293', null, null, null);
INSERT INTO `td_role_menu` VALUES ('33', '292', null, null, null);
INSERT INTO `td_role_menu` VALUES ('33', '294', null, null, null);
INSERT INTO `td_role_menu` VALUES ('33', '37', null, null, null);
INSERT INTO `td_role_menu` VALUES ('33', '21', null, null, null);
INSERT INTO `td_role_menu` VALUES ('33', '20', null, null, null);
INSERT INTO `td_role_menu` VALUES ('33', '25', null, null, null);
INSERT INTO `td_role_menu` VALUES ('33', '297', null, null, null);
INSERT INTO `td_role_menu` VALUES ('33', '262', null, null, null);
INSERT INTO `td_role_menu` VALUES ('33', '263', null, null, null);
INSERT INTO `td_role_menu` VALUES ('33', '264', null, null, null);
INSERT INTO `td_role_menu` VALUES ('33', '265', null, null, null);
INSERT INTO `td_role_menu` VALUES ('33', '266', null, null, null);
INSERT INTO `td_role_menu` VALUES ('33', '267', null, null, null);
INSERT INTO `td_role_menu` VALUES ('33', '268', null, null, null);
INSERT INTO `td_role_menu` VALUES ('33', '269', null, null, null);
INSERT INTO `td_role_menu` VALUES ('33', '270', null, null, null);
INSERT INTO `td_role_menu` VALUES ('33', '272', null, null, null);
INSERT INTO `td_role_menu` VALUES ('33', '271', null, null, null);
INSERT INTO `td_role_menu` VALUES ('33', '273', null, null, null);
INSERT INTO `td_role_menu` VALUES ('33', '274', null, null, null);
INSERT INTO `td_role_menu` VALUES ('33', '276', null, null, null);
INSERT INTO `td_role_menu` VALUES ('33', '277', null, null, null);
INSERT INTO `td_role_menu` VALUES ('33', '278', null, null, null);
INSERT INTO `td_role_menu` VALUES ('33', '279', null, null, null);
INSERT INTO `td_role_menu` VALUES ('33', '275', null, null, null);
INSERT INTO `td_role_menu` VALUES ('33', '280', null, null, null);
INSERT INTO `td_role_menu` VALUES ('33', '281', null, null, null);
INSERT INTO `td_role_menu` VALUES ('33', '282', null, null, null);
INSERT INTO `td_role_menu` VALUES ('33', '283', null, null, null);
INSERT INTO `td_role_menu` VALUES ('33', '284', null, null, null);
INSERT INTO `td_role_menu` VALUES ('33', '285', null, null, null);
INSERT INTO `td_role_menu` VALUES ('33', '287', null, null, null);
INSERT INTO `td_role_menu` VALUES ('33', '286', null, null, null);
INSERT INTO `td_role_menu` VALUES ('33', '288', null, null, null);
INSERT INTO `td_role_menu` VALUES ('33', '290', null, null, null);
INSERT INTO `td_role_menu` VALUES ('33', '289', null, null, null);
INSERT INTO `td_role_menu` VALUES ('33', '18', null, null, null);
INSERT INTO `td_role_menu` VALUES ('33', '19', null, null, null);
INSERT INTO `td_role_menu` VALUES ('33', '23', null, null, null);
INSERT INTO `td_role_menu` VALUES ('33', '24', null, null, null);
INSERT INTO `td_role_menu` VALUES ('33', '291', null, null, null);
INSERT INTO `td_role_menu` VALUES ('33', '293', null, null, null);
INSERT INTO `td_role_menu` VALUES ('33', '292', null, null, null);
INSERT INTO `td_role_menu` VALUES ('33', '294', null, null, null);
INSERT INTO `td_role_menu` VALUES ('33', '37', null, null, null);
INSERT INTO `td_role_menu` VALUES ('33', '21', null, null, null);
INSERT INTO `td_role_menu` VALUES ('33', '20', null, null, null);
INSERT INTO `td_role_menu` VALUES ('33', '25', null, null, null);
INSERT INTO `td_role_menu` VALUES ('33', '297', null, null, null);
INSERT INTO `td_role_menu` VALUES ('33', '298', null, null, null);
INSERT INTO `td_role_menu` VALUES ('33', '262', null, null, null);
INSERT INTO `td_role_menu` VALUES ('33', '263', null, null, null);
INSERT INTO `td_role_menu` VALUES ('33', '264', null, null, null);
INSERT INTO `td_role_menu` VALUES ('33', '265', null, null, null);
INSERT INTO `td_role_menu` VALUES ('33', '266', null, null, null);
INSERT INTO `td_role_menu` VALUES ('33', '267', null, null, null);
INSERT INTO `td_role_menu` VALUES ('33', '268', null, null, null);
INSERT INTO `td_role_menu` VALUES ('33', '269', null, null, null);
INSERT INTO `td_role_menu` VALUES ('33', '270', null, null, null);
INSERT INTO `td_role_menu` VALUES ('33', '272', null, null, null);
INSERT INTO `td_role_menu` VALUES ('33', '271', null, null, null);
INSERT INTO `td_role_menu` VALUES ('33', '273', null, null, null);
INSERT INTO `td_role_menu` VALUES ('33', '274', null, null, null);
INSERT INTO `td_role_menu` VALUES ('33', '275', null, null, null);
INSERT INTO `td_role_menu` VALUES ('33', '276', null, null, null);
INSERT INTO `td_role_menu` VALUES ('33', '277', null, null, null);
INSERT INTO `td_role_menu` VALUES ('33', '278', null, null, null);
INSERT INTO `td_role_menu` VALUES ('33', '279', null, null, null);
INSERT INTO `td_role_menu` VALUES ('33', '280', null, null, null);
INSERT INTO `td_role_menu` VALUES ('33', '281', null, null, null);
INSERT INTO `td_role_menu` VALUES ('33', '282', null, null, null);
INSERT INTO `td_role_menu` VALUES ('33', '283', null, null, null);
INSERT INTO `td_role_menu` VALUES ('33', '284', null, null, null);
INSERT INTO `td_role_menu` VALUES ('33', '285', null, null, null);
INSERT INTO `td_role_menu` VALUES ('33', '287', null, null, null);
INSERT INTO `td_role_menu` VALUES ('33', '286', null, null, null);
INSERT INTO `td_role_menu` VALUES ('33', '288', null, null, null);
INSERT INTO `td_role_menu` VALUES ('33', '289', null, null, null);
INSERT INTO `td_role_menu` VALUES ('33', '290', null, null, null);
INSERT INTO `td_role_menu` VALUES ('33', '291', null, null, null);
INSERT INTO `td_role_menu` VALUES ('33', '292', null, null, null);
INSERT INTO `td_role_menu` VALUES ('33', '293', null, null, null);
INSERT INTO `td_role_menu` VALUES ('33', '294', null, null, null);
INSERT INTO `td_role_menu` VALUES ('33', '18', null, null, null);
INSERT INTO `td_role_menu` VALUES ('33', '19', null, null, null);
INSERT INTO `td_role_menu` VALUES ('33', '23', null, null, null);
INSERT INTO `td_role_menu` VALUES ('33', '24', null, null, null);
INSERT INTO `td_role_menu` VALUES ('33', '37', null, null, null);
INSERT INTO `td_role_menu` VALUES ('33', '21', null, null, null);
INSERT INTO `td_role_menu` VALUES ('33', '20', null, null, null);
INSERT INTO `td_role_menu` VALUES ('33', '25', null, null, null);
INSERT INTO `td_role_menu` VALUES ('33', '297', null, null, null);
INSERT INTO `td_role_menu` VALUES ('33', '298', null, null, null);
INSERT INTO `td_role_menu` VALUES ('33', '299', null, null, null);
INSERT INTO `td_role_menu` VALUES ('33', '262', null, null, null);
INSERT INTO `td_role_menu` VALUES ('33', '263', null, null, null);
INSERT INTO `td_role_menu` VALUES ('33', '264', null, null, null);
INSERT INTO `td_role_menu` VALUES ('33', '265', null, null, null);
INSERT INTO `td_role_menu` VALUES ('33', '266', null, null, null);
INSERT INTO `td_role_menu` VALUES ('33', '267', null, null, null);
INSERT INTO `td_role_menu` VALUES ('33', '268', null, null, null);
INSERT INTO `td_role_menu` VALUES ('33', '269', null, null, null);
INSERT INTO `td_role_menu` VALUES ('33', '270', null, null, null);
INSERT INTO `td_role_menu` VALUES ('33', '272', null, null, null);
INSERT INTO `td_role_menu` VALUES ('33', '271', null, null, null);
INSERT INTO `td_role_menu` VALUES ('33', '273', null, null, null);
INSERT INTO `td_role_menu` VALUES ('33', '274', null, null, null);
INSERT INTO `td_role_menu` VALUES ('33', '275', null, null, null);
INSERT INTO `td_role_menu` VALUES ('33', '276', null, null, null);
INSERT INTO `td_role_menu` VALUES ('33', '277', null, null, null);
INSERT INTO `td_role_menu` VALUES ('33', '278', null, null, null);
INSERT INTO `td_role_menu` VALUES ('33', '279', null, null, null);
INSERT INTO `td_role_menu` VALUES ('33', '280', null, null, null);
INSERT INTO `td_role_menu` VALUES ('33', '281', null, null, null);
INSERT INTO `td_role_menu` VALUES ('33', '282', null, null, null);
INSERT INTO `td_role_menu` VALUES ('33', '283', null, null, null);
INSERT INTO `td_role_menu` VALUES ('33', '284', null, null, null);
INSERT INTO `td_role_menu` VALUES ('33', '285', null, null, null);
INSERT INTO `td_role_menu` VALUES ('33', '287', null, null, null);
INSERT INTO `td_role_menu` VALUES ('33', '286', null, null, null);
INSERT INTO `td_role_menu` VALUES ('33', '288', null, null, null);
INSERT INTO `td_role_menu` VALUES ('33', '289', null, null, null);
INSERT INTO `td_role_menu` VALUES ('33', '290', null, null, null);
INSERT INTO `td_role_menu` VALUES ('33', '18', null, null, null);
INSERT INTO `td_role_menu` VALUES ('33', '19', null, null, null);
INSERT INTO `td_role_menu` VALUES ('33', '23', null, null, null);
INSERT INTO `td_role_menu` VALUES ('33', '24', null, null, null);
INSERT INTO `td_role_menu` VALUES ('33', '291', null, null, null);
INSERT INTO `td_role_menu` VALUES ('33', '292', null, null, null);
INSERT INTO `td_role_menu` VALUES ('33', '293', null, null, null);
INSERT INTO `td_role_menu` VALUES ('33', '294', null, null, null);
INSERT INTO `td_role_menu` VALUES ('33', '37', null, null, null);
INSERT INTO `td_role_menu` VALUES ('33', '21', null, null, null);
INSERT INTO `td_role_menu` VALUES ('33', '20', null, null, null);
INSERT INTO `td_role_menu` VALUES ('33', '25', null, null, null);
INSERT INTO `td_role_menu` VALUES ('33', '297', null, null, null);
INSERT INTO `td_role_menu` VALUES ('33', '298', null, null, null);
INSERT INTO `td_role_menu` VALUES ('33', '299', null, null, null);
INSERT INTO `td_role_menu` VALUES ('33', '300', null, null, null);
INSERT INTO `td_role_menu` VALUES ('33', '301', null, null, null);
INSERT INTO `td_role_menu` VALUES ('33', '262', null, null, null);
INSERT INTO `td_role_menu` VALUES ('33', '263', null, null, null);
INSERT INTO `td_role_menu` VALUES ('33', '264', null, null, null);
INSERT INTO `td_role_menu` VALUES ('33', '265', null, null, null);
INSERT INTO `td_role_menu` VALUES ('33', '266', null, null, null);
INSERT INTO `td_role_menu` VALUES ('33', '267', null, null, null);
INSERT INTO `td_role_menu` VALUES ('33', '268', null, null, null);
INSERT INTO `td_role_menu` VALUES ('33', '269', null, null, null);
INSERT INTO `td_role_menu` VALUES ('33', '270', null, null, null);
INSERT INTO `td_role_menu` VALUES ('33', '272', null, null, null);
INSERT INTO `td_role_menu` VALUES ('33', '271', null, null, null);
INSERT INTO `td_role_menu` VALUES ('33', '273', null, null, null);
INSERT INTO `td_role_menu` VALUES ('33', '274', null, null, null);
INSERT INTO `td_role_menu` VALUES ('33', '275', null, null, null);
INSERT INTO `td_role_menu` VALUES ('33', '276', null, null, null);
INSERT INTO `td_role_menu` VALUES ('33', '277', null, null, null);
INSERT INTO `td_role_menu` VALUES ('33', '278', null, null, null);
INSERT INTO `td_role_menu` VALUES ('33', '279', null, null, null);
INSERT INTO `td_role_menu` VALUES ('33', '280', null, null, null);
INSERT INTO `td_role_menu` VALUES ('33', '281', null, null, null);
INSERT INTO `td_role_menu` VALUES ('33', '282', null, null, null);
INSERT INTO `td_role_menu` VALUES ('33', '283', null, null, null);
INSERT INTO `td_role_menu` VALUES ('33', '284', null, null, null);
INSERT INTO `td_role_menu` VALUES ('33', '285', null, null, null);
INSERT INTO `td_role_menu` VALUES ('33', '287', null, null, null);
INSERT INTO `td_role_menu` VALUES ('33', '286', null, null, null);
INSERT INTO `td_role_menu` VALUES ('33', '288', null, null, null);
INSERT INTO `td_role_menu` VALUES ('33', '289', null, null, null);
INSERT INTO `td_role_menu` VALUES ('33', '290', null, null, null);
INSERT INTO `td_role_menu` VALUES ('33', '291', null, null, null);
INSERT INTO `td_role_menu` VALUES ('33', '292', null, null, null);
INSERT INTO `td_role_menu` VALUES ('33', '293', null, null, null);
INSERT INTO `td_role_menu` VALUES ('33', '294', null, null, null);
INSERT INTO `td_role_menu` VALUES ('33', '18', null, null, null);
INSERT INTO `td_role_menu` VALUES ('33', '19', null, null, null);
INSERT INTO `td_role_menu` VALUES ('33', '23', null, null, null);
INSERT INTO `td_role_menu` VALUES ('33', '24', null, null, null);
INSERT INTO `td_role_menu` VALUES ('33', '37', null, null, null);
INSERT INTO `td_role_menu` VALUES ('33', '21', null, null, null);
INSERT INTO `td_role_menu` VALUES ('33', '20', null, null, null);
INSERT INTO `td_role_menu` VALUES ('33', '25', null, null, null);
INSERT INTO `td_role_menu` VALUES ('33', '297', null, null, null);
INSERT INTO `td_role_menu` VALUES ('33', '298', null, null, null);
INSERT INTO `td_role_menu` VALUES ('33', '299', null, null, null);
INSERT INTO `td_role_menu` VALUES ('33', '300', null, null, null);
INSERT INTO `td_role_menu` VALUES ('33', '301', null, null, null);
INSERT INTO `td_role_menu` VALUES ('33', '302', null, null, null);

-- ----------------------------
-- Table structure for td_role_user
-- ----------------------------
DROP TABLE IF EXISTS `td_role_user`;
CREATE TABLE `td_role_user` (
  `role_id` mediumint(9) unsigned DEFAULT NULL,
  `user_id` char(32) DEFAULT NULL,
  KEY `role_id` (`role_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色用户分配';

-- ----------------------------
-- Records of td_role_user
-- ----------------------------
INSERT INTO `td_role_user` VALUES ('33', '363');
INSERT INTO `td_role_user` VALUES ('33', '364');
INSERT INTO `td_role_user` VALUES ('33', '388');

-- ----------------------------
-- Table structure for td_system_config
-- ----------------------------
DROP TABLE IF EXISTS `td_system_config`;
CREATE TABLE `td_system_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) NOT NULL DEFAULT '',
  `name` varchar(50) NOT NULL DEFAULT '',
  `val` text,
  `is_del` tinyint(3) NOT NULL DEFAULT '0',
  `sort` varchar(20) DEFAULT NULL,
  `pid` int(11) DEFAULT '0',
  `data_type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=183 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='系统设置';

-- ----------------------------
-- Records of td_system_config
-- ----------------------------
INSERT INTO `td_system_config` VALUES ('111', 'system_name', '', '人科云', '0', null, '0', 'system');
INSERT INTO `td_system_config` VALUES ('112', 'home_slide', '', 'MDAwMDAwMDAwMLGIcpc;MDAwMDAwMDAwMLGIcpg;MDAwMDAwMDAwMLGIdpk;', '0', null, '0', 'home');
INSERT INTO `td_system_config` VALUES ('113', 'home_introduce', '', '<p>1</p>', '0', null, '0', 'home');
INSERT INTO `td_system_config` VALUES ('114', 'holiday_title', '', '1', '0', null, '0', 'home');
INSERT INTO `td_system_config` VALUES ('115', 'holiday_sub_title', '', '3', '0', null, '0', 'home');
INSERT INTO `td_system_config` VALUES ('116', 'home_introduce_en', '', '<p>2</p>', '0', null, '0', 'home');
INSERT INTO `td_system_config` VALUES ('117', 'holiday_id_list', '', '', '0', null, '0', 'home');
INSERT INTO `td_system_config` VALUES ('118', 'holiday_name', '', '', '0', null, '0', 'home');
INSERT INTO `td_system_config` VALUES ('119', 'partner_title', '', '1', '0', null, '0', 'home');
INSERT INTO `td_system_config` VALUES ('120', 'partner_sub_title', '', '3', '0', null, '0', 'home');
INSERT INTO `td_system_config` VALUES ('121', 'partner_id_list', '', '', '0', null, '0', 'home');
INSERT INTO `td_system_config` VALUES ('122', 'partner_name', '', '', '0', null, '0', 'home');
INSERT INTO `td_system_config` VALUES ('123', 'category_title', '', '1', '0', null, '0', 'home');
INSERT INTO `td_system_config` VALUES ('124', 'category_sub_title', '', '3', '0', null, '0', 'home');
INSERT INTO `td_system_config` VALUES ('125', 'category_id_list', '', '1,2,3', '0', null, '0', 'home');
INSERT INTO `td_system_config` VALUES ('126', 'category_name', '', '<span class=\"item\" data=\"1\">狩猎<i class=\"fa fa-times\"></i></span><span class=\"item\" data=\"2\">潜水<i class=\"fa fa-times\"></i></span><span class=\"item\" data=\"3\">瑜伽<i class=\"fa fa-times\"></i></span>', '0', null, '0', 'home');
INSERT INTO `td_system_config` VALUES ('127', 'destination_title', '', 'aaaaaaaaa', '0', null, '0', 'home');
INSERT INTO `td_system_config` VALUES ('128', 'destination_sub_title', '', 'bbbbbbbbb', '0', null, '0', 'home');
INSERT INTO `td_system_config` VALUES ('129', 'destination_id_list', '', '', '0', null, '0', 'home');
INSERT INTO `td_system_config` VALUES ('130', 'destination_name', '', '                            ', '0', null, '0', 'home');
INSERT INTO `td_system_config` VALUES ('131', 'companion_title', '', '', '0', null, '0', 'home');
INSERT INTO `td_system_config` VALUES ('132', 'companion_sub_title', '', '', '0', null, '0', 'home');
INSERT INTO `td_system_config` VALUES ('133', 'blog_id_list', '', '', '0', null, '0', 'home');
INSERT INTO `td_system_config` VALUES ('134', 'blog_name', '', '', '0', null, '0', 'home');
INSERT INTO `td_system_config` VALUES ('135', 'blog_title', '', '', '0', null, '0', 'home');
INSERT INTO `td_system_config` VALUES ('136', 'blog_sub_title', '', '', '0', null, '0', 'home');
INSERT INTO `td_system_config` VALUES ('137', 'companion_id_list', '', '', '0', null, '0', 'home');
INSERT INTO `td_system_config` VALUES ('138', 'companion_name', '', '', '0', null, '0', 'home');
INSERT INTO `td_system_config` VALUES ('139', 'partner_introduce', '', '', '0', null, '0', 'home');
INSERT INTO `td_system_config` VALUES ('140', 'page_1_en', '', '<p>2</p>', '0', null, '0', 'home');
INSERT INTO `td_system_config` VALUES ('141', 'page_2_en', '', '<p>4</p>', '0', null, '0', 'home');
INSERT INTO `td_system_config` VALUES ('142', 'page_3', '', '<p>5</p>', '0', null, '0', 'home');
INSERT INTO `td_system_config` VALUES ('143', 'page_3_en', '', '<p>6</p>', '0', null, '0', 'home');
INSERT INTO `td_system_config` VALUES ('144', 'page_4', '', '<p>7</p>', '0', null, '0', 'home');
INSERT INTO `td_system_config` VALUES ('145', 'page_4_en', '', '<p>8</p>', '0', null, '0', 'home');
INSERT INTO `td_system_config` VALUES ('146', 'page_5', '', '<p>9</p>', '0', null, '0', 'home');
INSERT INTO `td_system_config` VALUES ('147', 'page_5_en', '', '<p>10</p>', '0', null, '0', 'home');
INSERT INTO `td_system_config` VALUES ('148', 'page_6_en', '', '<p>2</p>', '0', null, '0', 'home');
INSERT INTO `td_system_config` VALUES ('149', 'page_6', '', '<p>1</p>', '0', null, '0', 'home');
INSERT INTO `td_system_config` VALUES ('150', 'page_1', '', '<p>1</p>', '0', null, '0', 'home');
INSERT INTO `td_system_config` VALUES ('151', 'page_2', '', '<p>3</p>', '0', null, '0', 'home');
INSERT INTO `td_system_config` VALUES ('152', 'hotel_title', '', '', '0', null, '0', 'home');
INSERT INTO `td_system_config` VALUES ('153', 'hotel_sub_title', '', '', '0', null, '0', 'home');
INSERT INTO `td_system_config` VALUES ('154', 'hotel_id_list', '', '', '0', null, '0', 'home');
INSERT INTO `td_system_config` VALUES ('155', 'hotel_html', '', '', '0', null, '0', 'home');
INSERT INTO `td_system_config` VALUES ('156', 'smtp_server', '', 'smtp.qq.com', '0', null, '0', 'system');
INSERT INTO `td_system_config` VALUES ('157', 'smtp_port', '', '465', '0', null, '0', 'system');
INSERT INTO `td_system_config` VALUES ('158', 'smtp_user', '', 'smeoa@qq.com', '0', null, '0', 'system');
INSERT INTO `td_system_config` VALUES ('159', 'smtp_password', '', 'yin1898', '0', null, '0', 'system');
INSERT INTO `td_system_config` VALUES ('160', 'send_email', '', 'smeoa@qq.com', '0', null, '0', 'system');
INSERT INTO `td_system_config` VALUES ('161', 'send_name', '', 'smeoa', '0', null, '0', 'system');
INSERT INTO `td_system_config` VALUES ('162', 'holiday_title_en', '', '2', '0', null, '0', 'home');
INSERT INTO `td_system_config` VALUES ('163', 'holiday_sub_title_en', '', '4', '0', null, '0', 'home');
INSERT INTO `td_system_config` VALUES ('164', 'partner_title_en', '', '2', '0', null, '0', 'home');
INSERT INTO `td_system_config` VALUES ('165', 'partner_sub_title_en', '', '4', '0', null, '0', 'home');
INSERT INTO `td_system_config` VALUES ('166', 'category_title_en', '', '2', '0', null, '0', 'home');
INSERT INTO `td_system_config` VALUES ('167', 'category_sub_title_en', '', '4', '0', null, '0', 'home');
INSERT INTO `td_system_config` VALUES ('168', 'destination_title_en', '', '2', '0', null, '0', 'home');
INSERT INTO `td_system_config` VALUES ('169', 'destination_sub_title_en', '', '4', '0', null, '0', 'home');
INSERT INTO `td_system_config` VALUES ('170', 'companion_title_en', '', '', '0', null, '0', 'home');
INSERT INTO `td_system_config` VALUES ('171', 'companion_sub_title_en', '', '', '0', null, '0', 'home');
INSERT INTO `td_system_config` VALUES ('172', 'blog_title_en', '', '', '0', null, '0', 'home');
INSERT INTO `td_system_config` VALUES ('173', 'blog_sub_title_en', '', '', '0', null, '0', 'home');
INSERT INTO `td_system_config` VALUES ('174', 'qiniu_access_key', '', 'CuZa3VHvZHzMAsbmeNyR5mIErrFzBINVvHy4hg6s', '0', null, '0', 'system');
INSERT INTO `td_system_config` VALUES ('175', 'qiniu_secret_key', '', 'LfoNWDQESlFWHCyGutTn_jX2iF0eTtBunvgGTQi9', '0', null, '0', 'system');
INSERT INTO `td_system_config` VALUES ('176', 'qiniu_bucket', '', 'safarigo', '0', null, '0', 'system');
INSERT INTO `td_system_config` VALUES ('177', 'weixin_app_id', '', 'wxa642512d00a63cf2', '0', null, '0', 'system');
INSERT INTO `td_system_config` VALUES ('178', 'weixin_secret', '', '47bd74ae45c276476e3b3162b1b53bb6', '0', null, '0', 'system');
INSERT INTO `td_system_config` VALUES ('179', 'qiniu_domain', '', 'http://qiniu.safarigo.com/', '0', null, '0', 'system');
INSERT INTO `td_system_config` VALUES ('180', 'qiniu_pipeline', '', 'convert_to_mp4', '0', null, '0', 'system');
INSERT INTO `td_system_config` VALUES ('181', '/admin/system_config/save_html', '', '', '0', null, '0', 'home');
INSERT INTO `td_system_config` VALUES ('182', 'system_url', '', '11', '0', null, '0', 'system');

-- ----------------------------
-- Table structure for td_user
-- ----------------------------
DROP TABLE IF EXISTS `td_user`;
CREATE TABLE `td_user` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `emp_no` varchar(20) NOT NULL DEFAULT '',
  `name` varchar(20) NOT NULL,
  `letter` varchar(10) NOT NULL DEFAULT '',
  `password` char(32) NOT NULL,
  `position_id` int(11) NOT NULL,
  `sex` varchar(50) NOT NULL,
  `birthday` date DEFAULT NULL,
  `avatar` varchar(200) DEFAULT NULL,
  `email` varchar(50) NOT NULL,
  `duty` varchar(2000) NOT NULL,
  `mobile` varchar(20) NOT NULL,
  `create_time` int(11) unsigned NOT NULL,
  `update_time` int(11) unsigned NOT NULL,
  `is_del` tinyint(3) NOT NULL DEFAULT '0',
  `openid` varchar(50) DEFAULT NULL,
  `is_bind_wechat` tinyint(3) DEFAULT '0',
  `nickname` varchar(20) DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  `dept_id` int(11) DEFAULT NULL,
  `is_valid` tinyint(3) DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `account` (`emp_no`)
) ENGINE=InnoDB AUTO_INCREMENT=389 DEFAULT CHARSET=utf8 COMMENT='用户信息';

-- ----------------------------
-- Records of td_user
-- ----------------------------
INSERT INTO `td_user` VALUES ('363', '1001', '1001', '', '925c842568735e2c2ef592754d75652e', '0', '', null, null, '', '', '1001', '0', '0', '1', null, '0', null, '0', '1', '1');
INSERT INTO `td_user` VALUES ('364', '1002', '1002', '', '75697693260c96b3d1aefa516884a793', '0', '', null, null, '', '', '', '0', '0', '1', null, '0', null, '0', null, '0');
INSERT INTO `td_user` VALUES ('388', '', '1', '', '74be16979710d4c4e7c6647856088456', '0', '', null, null, '', '', '1', '0', '0', '0', null, '0', null, null, null, '1');
