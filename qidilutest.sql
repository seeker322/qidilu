/*
 Navicat Premium Data Transfer

 Source Server         : qidilutest
 Source Server Type    : MySQL
 Source Server Version : 50562
 Source Host           : localhost:3306
 Source Schema         : qidilutest

 Target Server Type    : MySQL
 Target Server Version : 50562
 File Encoding         : 65001

 Date: 23/12/2020 02:35:35
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin_app
-- ----------------------------
DROP TABLE IF EXISTS `admin_app`;
CREATE TABLE `admin_app`  (
  `pid` int(11) NOT NULL COMMENT '当前菜单的栏目id',
  `ios` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'ios下载地址',
  `android` int(11) NULL DEFAULT NULL COMMENT 'android下载地址',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `cover_img` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '封面图',
  PRIMARY KEY (`pid`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin_app
-- ----------------------------
INSERT INTO `admin_app` VALUES (62, 'sadfasdf', NULL, '2020-12-20 16:28:11', '2020-12-20 16:26:09', NULL);

-- ----------------------------
-- Table structure for admin_artical
-- ----------------------------
DROP TABLE IF EXISTS `admin_artical`;
CREATE TABLE `admin_artical`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `pid` int(11) NULL DEFAULT NULL COMMENT '父级ID',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标题',
  `description` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '内容',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `origin` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '来源',
  `sort` int(11) NULL DEFAULT NULL COMMENT '排序',
  `cover_img` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '封面图',
  `author` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '作者',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 15 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin_artical
-- ----------------------------
INSERT INTO `admin_artical` VALUES (10, 61, '电力需求超出预期', '受工业生产高速增长，以及低温寒流叠加的影响', '<p>江西12月上旬发用电量同比增长18.4%，比湖南略少一点，但是也超过18%，这个数也很大。截至目前，江西最大的用电负荷，前几天达到了2631万千瓦，江西这个情况比夏季过去曾经的历史最高负荷也高出了五六十万千瓦。湖南和江西都创造了高点。</p>', '2020-12-22 14:23:48', '2020-12-20 15:47:07', 'E汇客', 1, '/upload/img/2020-12-225fe2017300057.jpg', 'E汇客');
INSERT INTO `admin_artical` VALUES (7, 56, '拉卡拉新闻', '拉卡拉拉卡拉拉卡拉', '<p>腾付通POS机已经全面开通实时到账服务，交易成功到账成功率99%。</p>\n\n<p>当然，如果因为操作不当、卡片风控、交易存在风险等个别情况，交易可能延迟到账或者不到账，这时候就要联系售后处理了。但您放心，电银通POS机正规一清机器，资金安全，只需要核实交易即可到账，或者退回该笔交易。您刷卡的钱是安全的，不会出现任何损失，所以不用着急。</p>\n\n<p>1.如果您是正规渠道办理的腾付通POS机，只需要联系给您办理的服务机构，查询交易记录和未到账原因，进行相应处理便可到账。</p>\n\n<p>2.如果您是个人兼职、或者小业务员办理、再或者电话销售等非正规渠道办理，出现交易不到账找不到人，可以联系我们官网帮您查询处理。</p>\n\n<p>3.还有一种方式是拨打全国统一售后服务热线：400655766或者腾付通客服微信：5119296 进行账务查询。</p>\n\n<p>第2和第3两种方式，都可以协助您查询交易情况和一般账务问题，但是如果出现交易存在风险，需要上传交易记录和相关材料的情况，则需要联系办理机器的服务商，通过服务商渠道上传和处理。因而非正规渠道办理的机具会出现解决麻烦的问题，影响交易和使用。</p>\n\n<div class=\"ckeditor-html5-video-v1\" data-responsive=\"true\" style=\"text-align:center\">\n<video controls=\"controls\" src=\"https://vd4.bdstatic.com/mda-kmmsim0bz6qgn37i/v1-cae/sc/mda-kmmsim0bz6qgn37i.mp4\" style=\"height:auto; max-width:100%\">&nbsp;</video>\n</div>\n\n<p>腾付通POS机已经全面开通实时到账服务，交易成功到账成功率99%。</p>\n\n<p>当然，如果因为操作不当、卡片风控、交易存在风险等个别情况，交易可能延迟到账或者不到账，这时候就要联系售后处理了。但您放心，电银通POS机正规一清机器，资金安全，只需要核实交易即可到账，或者退回该笔交易。您刷卡的钱是安全的，不会出现任何损失，所以不用着急。</p>', '2020-12-22 13:55:32', '2020-12-20 15:27:44', '网站自建', 11, NULL, 'e汇客');
INSERT INTO `admin_artical` VALUES (8, 56, '撒旦法撒旦法', '按份阿斯蒂芬', '<p>阿斯蒂芬阿斯蒂</p>', '2020-12-20 15:28:00', '2020-12-20 15:28:00', '按份阿斯蒂芬', 1, NULL, '大是大非');
INSERT INTO `admin_artical` VALUES (11, 57, '金小宝新闻', '金小宝新闻', '<p>金小宝新闻</p>', '2020-12-22 14:19:14', '2020-12-22 14:19:14', NULL, 1, NULL, NULL);
INSERT INTO `admin_artical` VALUES (12, 65, '付临门', '付临门', '<p>付临门付临门付临门付临门付临门付临门付临门付临门</p>', '2020-12-22 14:19:31', '2020-12-22 14:19:31', '付临门', NULL, NULL, '付临门');
INSERT INTO `admin_artical` VALUES (13, 66, '银盛通', '银盛通银盛通银盛通银盛通', '<p>银盛通银盛通银盛通银盛通银盛通银盛通</p>', '2020-12-22 14:19:51', '2020-12-22 14:19:51', '银盛通', NULL, NULL, '银盛通');
INSERT INTO `admin_artical` VALUES (14, 67, '腾付通', '腾付通腾付通', '<p>腾付通腾付通腾付通腾付通腾付通腾付通</p>', '2020-12-22 14:20:08', '2020-12-22 14:20:08', '腾付通', NULL, NULL, '腾付通');

-- ----------------------------
-- Table structure for admin_banner
-- ----------------------------
DROP TABLE IF EXISTS `admin_banner`;
CREATE TABLE `admin_banner`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `img` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `mobile_img` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sort` int(255) NULL DEFAULT NULL,
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin_banner
-- ----------------------------
INSERT INTO `admin_banner` VALUES (3, '银盛通', '/upload/img/2020-12-225fe1fd8b1864e.jpg', '/upload/img/2020-12-225fe20012b4ed4.jpg', 2, NULL, '2020-12-22 14:17:57', '2020-12-22 14:07:13');
INSERT INTO `admin_banner` VALUES (2, '腾付通', '/upload/img/2020-12-225fe1fff49251a.jpg', '/upload/img/2020-12-225fe200001445f.jpg', 1, 'http://www.baidu.com', '2020-12-22 14:17:38', '2020-12-21 16:34:32');
INSERT INTO `admin_banner` VALUES (4, '金小宝', '/upload/img/2020-12-225fe1fdd32dbf6.jpg', '/upload/img/2020-12-225fe20023e1995.jpg', 3, NULL, '2020-12-22 14:18:13', '2020-12-22 14:08:24');
INSERT INTO `admin_banner` VALUES (5, '拉卡拉', '/upload/img/2020-12-225fe1fe02893f0.jpg', '/upload/img/2020-12-225fe200322b087.jpg', 4, NULL, '2020-12-22 14:18:28', '2020-12-22 14:09:10');
INSERT INTO `admin_banner` VALUES (6, '付临门', '/upload/img/2020-12-225fe1fe31d05ca.jpg', '/upload/img/2020-12-225fe2003f7957f.jpg', 5, NULL, '2020-12-22 14:18:41', '2020-12-22 14:09:59');

-- ----------------------------
-- Table structure for admin_comment
-- ----------------------------
DROP TABLE IF EXISTS `admin_comment`;
CREATE TABLE `admin_comment`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电话',
  `wechat` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '微信',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '留言内容',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin_comment
-- ----------------------------
INSERT INTO `admin_comment` VALUES (3, '测试', '测试', '测试', '测试', '2020-12-20 23:18:55', '2020-12-20 23:18:57');

-- ----------------------------
-- Table structure for admin_permissions
-- ----------------------------
DROP TABLE IF EXISTS `admin_permissions`;
CREATE TABLE `admin_permissions`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '权限标识',
  `display_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '权限名称',
  `pid` smallint(6) NULL DEFAULT NULL COMMENT '控制器及方法',
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '页面地址',
  `has_params` int(2) NULL DEFAULT 0 COMMENT '页面URL是否可携带参数',
  `action` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sort` smallint(6) NULL DEFAULT NULL,
  `icon` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图标',
  `is_menu` tinyint(1) UNSIGNED ZEROFILL NULL DEFAULT 0 COMMENT '是否为菜单（左侧显示）：0:非菜单，1：菜单',
  `status` tinyint(1) NULL DEFAULT 1 COMMENT '是否隐藏：0：隐藏，1显示',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '权限描述',
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `banner` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '栏目图片',
  `hover_icon` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '鼠标经过时的icon',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 89 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin_permissions
-- ----------------------------
INSERT INTO `admin_permissions` VALUES (41, '系统管理', NULL, 0, NULL, 0, 'systemManger', 2, 'ios-keypad', 0, 1, '系统管理', '2020-12-20 16:31:00', '2020-12-21 00:31:00', NULL, NULL);
INSERT INTO `admin_permissions` VALUES (44, '权限控制', NULL, 0, NULL, NULL, NULL, 3, 'ios-navigate', 1, 1, '权限控制', '2020-03-29 11:39:57', '2020-03-29 19:39:57', NULL, NULL);
INSERT INTO `admin_permissions` VALUES (43, '系统设置', NULL, 41, 'system', NULL, 'SystemCtroller@index', NULL, NULL, 1, 1, '系统设置主页', '2020-12-18 14:22:33', '2020-12-18 22:22:33', NULL, NULL);
INSERT INTO `admin_permissions` VALUES (47, '菜单规则', NULL, 44, 'permissions', NULL, 'permissionCroller@index', NULL, NULL, 1, 1, '菜单规则', '2020-03-29 06:06:51', '2020-03-29 14:06:51', NULL, NULL);
INSERT INTO `admin_permissions` VALUES (48, '角色管理', NULL, 44, 'permissions-roles', NULL, 'roleCtroller@index', NULL, NULL, 1, 1, '角色列表', '2020-03-29 06:08:02', '2020-03-29 14:08:02', NULL, NULL);
INSERT INTO `admin_permissions` VALUES (49, '用户管理', NULL, 44, 'permissions-users', NULL, 'userCtroller@index', NULL, NULL, 1, 1, '用户列表', '2020-03-29 06:08:26', '2020-03-29 14:08:26', NULL, NULL);
INSERT INTO `admin_permissions` VALUES (50, '新增', NULL, 47, NULL, NULL, 'permissionCtroller@stroe', NULL, NULL, 0, 1, '新增', '2020-03-29 05:00:34', '2020-03-29 05:00:34', NULL, NULL);
INSERT INTO `admin_permissions` VALUES (51, '编辑', NULL, 47, NULL, NULL, 'permissionCroller@update', NULL, NULL, 0, 1, '编辑菜单规则', '2020-03-29 05:02:00', '2020-03-29 05:02:00', NULL, NULL);
INSERT INTO `admin_permissions` VALUES (52, '删除', NULL, 47, NULL, NULL, 'permissionCtroller@destry', NULL, NULL, 0, 1, '删除菜单规则', '2020-03-29 05:02:41', '2020-03-29 05:02:41', NULL, NULL);
INSERT INTO `admin_permissions` VALUES (53, 'POS机商城', NULL, 0, 'pos', NULL, 'posController@index', 4, 'ios-analytics', 1, 1, 'pos机商城', '2020-12-19 10:16:59', '2020-12-19 18:16:59', NULL, NULL);
INSERT INTO `admin_permissions` VALUES (54, '控制台', NULL, 0, 'control-board', 0, 'indexController@index', 1, 'ios-keypad', 0, 1, '控制台内容', '2020-12-20 16:30:49', '2020-12-21 00:30:49', NULL, NULL);
INSERT INTO `admin_permissions` VALUES (56, '拉卡拉', NULL, 53, 'pos', 1, 'articalContoller@show', 0, NULL, 1, 1, '拉卡拉', '2020-12-21 18:08:15', '2020-12-22 02:08:15', '/upload/img/2020-12-215fe0e48f6b141.jpg', NULL);
INSERT INTO `admin_permissions` VALUES (57, '金小宝', NULL, 53, 'pos', 1, 'posContoller@list', 0, NULL, 1, 1, '金小宝', '2020-12-20 11:40:42', '2020-12-20 19:40:42', NULL, NULL);
INSERT INTO `admin_permissions` VALUES (58, '十大渠道', NULL, 0, 'pos', 1, 'channelController@index', 5, 'ios-analytics', 1, 1, '十大渠道', '2020-12-20 11:50:19', '2020-12-20 19:50:19', NULL, NULL);
INSERT INTO `admin_permissions` VALUES (59, '商学院', NULL, 0, NULL, NULL, 'schoolController@index', 6, 'ios-easel', 1, 1, '商学院', '2020-12-19 10:52:46', '2020-12-19 18:52:46', NULL, NULL);
INSERT INTO `admin_permissions` VALUES (60, '视频相关', NULL, 59, 'video', 1, 'videoController@index', 0, NULL, 1, 1, '视频相关', '2020-12-20 15:42:44', '2020-12-20 23:42:44', NULL, NULL);
INSERT INTO `admin_permissions` VALUES (61, '资讯相关', NULL, 59, 'info', 1, 'schoolController@channels', 0, NULL, 1, 1, '内容管理', '2020-12-21 18:57:10', '2020-12-22 02:57:10', '/upload/img/2020-12-215fe0f006383e5.jpg', NULL);
INSERT INTO `admin_permissions` VALUES (62, 'APP管理', NULL, 0, 'app', 1, 'appController@index', 7, 'ios-download', 1, 1, 'app管理', '2020-12-20 16:07:39', '2020-12-21 00:07:39', NULL, NULL);
INSERT INTO `admin_permissions` VALUES (63, '公司介绍', NULL, 0, NULL, NULL, 'aboutController@index', 8, 'md-eye', 1, 1, '关于我们', '2020-12-19 13:31:35', '2020-12-19 21:31:35', NULL, NULL);
INSERT INTO `admin_permissions` VALUES (64, '留言管理', NULL, 0, 'comment', 0, 'commentController@index', 9, 'ios-mail', 1, 1, '留言管理', '2020-12-20 14:28:31', '2020-12-20 22:28:31', NULL, NULL);
INSERT INTO `admin_permissions` VALUES (65, '付临门', NULL, 53, 'pos', 1, 'posController@list', 0, NULL, 1, 1, '付临门', '2020-12-20 11:47:53', '2020-12-20 19:47:53', NULL, NULL);
INSERT INTO `admin_permissions` VALUES (66, '银盛通', NULL, 53, 'pos', 1, 'posController@list', 0, NULL, 1, 1, '银盛通', '2020-12-20 11:48:15', '2020-12-20 19:48:15', NULL, NULL);
INSERT INTO `admin_permissions` VALUES (67, '腾付通', NULL, 53, 'pos', 1, 'posController@list', 0, NULL, 1, 1, '腾付通', '2020-12-20 11:48:34', '2020-12-20 19:48:34', NULL, NULL);
INSERT INTO `admin_permissions` VALUES (68, '关于我们', NULL, 63, 'company', 1, 'aboutController@index', 0, NULL, 1, 1, '关于我们', '2020-12-20 12:19:56', '2020-12-20 20:19:56', NULL, NULL);
INSERT INTO `admin_permissions` VALUES (69, '企业资质', NULL, 63, 'company', 1, 'aboutController@index', 0, NULL, 1, 1, '企业资质', '2020-12-20 12:20:36', '2020-12-20 20:20:36', NULL, NULL);
INSERT INTO `admin_permissions` VALUES (70, '联系我们', NULL, 63, 'company', 1, 'aboutController@index', 0, NULL, 1, 1, '联系我们', '2020-12-20 12:20:44', '2020-12-20 20:20:44', NULL, NULL);
INSERT INTO `admin_permissions` VALUES (71, '企业文化', NULL, 63, 'company', 1, 'aboutController@index', 0, NULL, 1, 1, '联系我们', '2020-12-20 12:20:52', '2020-12-20 20:20:52', NULL, NULL);
INSERT INTO `admin_permissions` VALUES (72, '积分兑换', NULL, 58, 'channels', 1, 'singleController@show', 0, NULL, 1, 1, '积分兑换', '2020-12-20 14:50:20', '2020-12-20 22:50:20', NULL, NULL);
INSERT INTO `admin_permissions` VALUES (73, '账单延期', NULL, 58, 'channels', 1, 'singleController@show', 0, NULL, 1, 1, '积分兑换', '2020-12-20 15:47:37', '2020-12-20 23:47:37', NULL, NULL);
INSERT INTO `admin_permissions` VALUES (74, '刷脸闪付', NULL, 58, 'channels', 1, 'singleController@show', 0, NULL, 1, 1, '刷脸闪付', '2020-12-20 15:47:44', '2020-12-20 23:47:44', NULL, NULL);
INSERT INTO `admin_permissions` VALUES (75, '花呗白条', NULL, 58, 'channels', 1, 'singleController@show', 0, NULL, 1, 1, '花呗白条', '2020-12-20 15:47:50', '2020-12-20 23:47:50', NULL, NULL);
INSERT INTO `admin_permissions` VALUES (76, '维权退保', NULL, 58, 'channels', 1, 'singleController@show', 0, NULL, 1, 1, '维权退保', '2020-12-20 15:47:58', '2020-12-20 23:47:58', NULL, NULL);
INSERT INTO `admin_permissions` VALUES (77, '征信修复', NULL, 58, 'channels', 1, 'singleController@show', 0, NULL, 1, 1, '征信修复', '2020-12-20 15:48:05', '2020-12-20 23:48:05', NULL, NULL);
INSERT INTO `admin_permissions` VALUES (78, '停息挂账', NULL, 58, 'channels', 1, 'singleController@show', 0, NULL, 1, 1, '停息挂账', '2020-12-20 15:48:11', '2020-12-20 23:48:11', NULL, NULL);
INSERT INTO `admin_permissions` VALUES (79, '退息退年费', NULL, 58, 'channels', 1, 'singleController@show', 0, NULL, 1, 1, '退息退年费', '2020-12-20 15:49:37', '2020-12-20 23:49:37', NULL, NULL);
INSERT INTO `admin_permissions` VALUES (80, '商学院', NULL, 58, 'channels', 1, 'singleController@show', 0, NULL, 1, 1, '商学院', '2020-12-20 15:48:24', '2020-12-20 23:48:24', NULL, NULL);
INSERT INTO `admin_permissions` VALUES (81, 'POS机办理', NULL, 58, 'channels', 1, 'singleController@show', 0, NULL, 1, 1, 'POS机办理', '2020-12-20 15:48:30', '2020-12-20 23:48:30', NULL, NULL);
INSERT INTO `admin_permissions` VALUES (82, '轮播图管理', NULL, 0, 'banner', 0, 'bannerController@show', 11, 'ios-keypad', 1, 1, '轮播图管理', '2020-12-21 16:26:29', '2020-12-22 00:26:29', NULL, NULL);
INSERT INTO `admin_permissions` VALUES (83, '新闻中心', NULL, 0, 'news', 0, 'articalController@index', 8, 'ios-keypad', 1, 1, '新闻中心', '2020-12-22 14:30:28', '2020-12-22 22:30:28', NULL, NULL);
INSERT INTO `admin_permissions` VALUES (84, '银联新闻', NULL, 83, 'news', 1, NULL, 1, NULL, 1, 1, '银联新闻', '2020-12-22 14:35:03', '2020-12-22 22:35:03', NULL, NULL);
INSERT INTO `admin_permissions` VALUES (85, '业务公告', NULL, 83, 'news', 1, NULL, 2, NULL, 1, 1, '业务公告', '2020-12-22 14:35:25', '2020-12-22 22:35:25', NULL, NULL);
INSERT INTO `admin_permissions` VALUES (86, '媒体报道', NULL, 83, 'news', 1, NULL, 0, NULL, 1, 1, '媒体报道', '2020-12-22 14:38:16', '2020-12-22 22:38:16', NULL, NULL);
INSERT INTO `admin_permissions` VALUES (87, '党建专栏', NULL, 83, 'news', 1, NULL, 0, NULL, 1, 1, '党建专栏', '2020-12-22 14:38:11', '2020-12-22 22:38:11', NULL, NULL);
INSERT INTO `admin_permissions` VALUES (88, '专题专栏', NULL, 83, 'news', 1, NULL, 0, NULL, 1, 1, '专题专栏', '2020-12-22 14:39:28', '2020-12-22 22:39:28', NULL, NULL);

-- ----------------------------
-- Table structure for admin_role_permissions
-- ----------------------------
DROP TABLE IF EXISTS `admin_role_permissions`;
CREATE TABLE `admin_role_permissions`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `permission_id` int(11) NOT NULL,
  `role_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 104 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色和权限中间表' ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of admin_role_permissions
-- ----------------------------
INSERT INTO `admin_role_permissions` VALUES (37, 41, 1);
INSERT INTO `admin_role_permissions` VALUES (40, 44, 1);
INSERT INTO `admin_role_permissions` VALUES (39, 43, 1);
INSERT INTO `admin_role_permissions` VALUES (88, 73, 1);
INSERT INTO `admin_role_permissions` VALUES (43, 47, 1);
INSERT INTO `admin_role_permissions` VALUES (44, 48, 1);
INSERT INTO `admin_role_permissions` VALUES (45, 49, 1);
INSERT INTO `admin_role_permissions` VALUES (46, 50, 1);
INSERT INTO `admin_role_permissions` VALUES (47, 51, 1);
INSERT INTO `admin_role_permissions` VALUES (50, 54, 1);
INSERT INTO `admin_role_permissions` VALUES (49, 53, 1);
INSERT INTO `admin_role_permissions` VALUES (48, 52, 1);
INSERT INTO `admin_role_permissions` VALUES (52, 50, 2);
INSERT INTO `admin_role_permissions` VALUES (53, 41, 2);
INSERT INTO `admin_role_permissions` VALUES (54, 44, 2);
INSERT INTO `admin_role_permissions` VALUES (55, 47, 2);
INSERT INTO `admin_role_permissions` VALUES (56, 51, 2);
INSERT INTO `admin_role_permissions` VALUES (87, 72, 1);
INSERT INTO `admin_role_permissions` VALUES (67, 47, 9);
INSERT INTO `admin_role_permissions` VALUES (66, 44, 9);
INSERT INTO `admin_role_permissions` VALUES (65, 49, 9);
INSERT INTO `admin_role_permissions` VALUES (64, 51, 9);
INSERT INTO `admin_role_permissions` VALUES (63, 54, 9);
INSERT INTO `admin_role_permissions` VALUES (72, 57, 1);
INSERT INTO `admin_role_permissions` VALUES (71, 56, 1);
INSERT INTO `admin_role_permissions` VALUES (73, 58, 1);
INSERT INTO `admin_role_permissions` VALUES (74, 59, 1);
INSERT INTO `admin_role_permissions` VALUES (75, 60, 1);
INSERT INTO `admin_role_permissions` VALUES (76, 61, 1);
INSERT INTO `admin_role_permissions` VALUES (77, 62, 1);
INSERT INTO `admin_role_permissions` VALUES (78, 63, 1);
INSERT INTO `admin_role_permissions` VALUES (79, 64, 1);
INSERT INTO `admin_role_permissions` VALUES (80, 65, 1);
INSERT INTO `admin_role_permissions` VALUES (81, 66, 1);
INSERT INTO `admin_role_permissions` VALUES (82, 67, 1);
INSERT INTO `admin_role_permissions` VALUES (83, 68, 1);
INSERT INTO `admin_role_permissions` VALUES (84, 69, 1);
INSERT INTO `admin_role_permissions` VALUES (85, 70, 1);
INSERT INTO `admin_role_permissions` VALUES (86, 71, 1);
INSERT INTO `admin_role_permissions` VALUES (89, 74, 1);
INSERT INTO `admin_role_permissions` VALUES (90, 75, 1);
INSERT INTO `admin_role_permissions` VALUES (91, 76, 1);
INSERT INTO `admin_role_permissions` VALUES (92, 77, 1);
INSERT INTO `admin_role_permissions` VALUES (93, 78, 1);
INSERT INTO `admin_role_permissions` VALUES (94, 79, 1);
INSERT INTO `admin_role_permissions` VALUES (95, 80, 1);
INSERT INTO `admin_role_permissions` VALUES (96, 81, 1);
INSERT INTO `admin_role_permissions` VALUES (97, 82, 1);
INSERT INTO `admin_role_permissions` VALUES (98, 83, 1);
INSERT INTO `admin_role_permissions` VALUES (99, 84, 1);
INSERT INTO `admin_role_permissions` VALUES (100, 85, 1);
INSERT INTO `admin_role_permissions` VALUES (101, 86, 1);
INSERT INTO `admin_role_permissions` VALUES (102, 87, 1);
INSERT INTO `admin_role_permissions` VALUES (103, 88, 1);

-- ----------------------------
-- Table structure for admin_roles
-- ----------------------------
DROP TABLE IF EXISTS `admin_roles`;
CREATE TABLE `admin_roles`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色名称',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色描述',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin_roles
-- ----------------------------
INSERT INTO `admin_roles` VALUES (1, '超级管理员', '拥有所有权限', '2020-03-17 23:18:00', '2020-03-17 23:18:04');
INSERT INTO `admin_roles` VALUES (2, '普通管理员', '拥有部分权限', '2020-03-17 23:18:07', '2020-03-17 23:18:10');
INSERT INTO `admin_roles` VALUES (9, '测试角色', '测试角色权限', '2020-03-30 02:29:04', '2020-03-30 02:29:04');

-- ----------------------------
-- Table structure for admin_single
-- ----------------------------
DROP TABLE IF EXISTS `admin_single`;
CREATE TABLE `admin_single`  (
  `pid` int(11) NOT NULL COMMENT '当前菜单的栏目id',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标题',
  `description` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '内容',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `sort` int(11) NULL DEFAULT NULL COMMENT '排序',
  `cover_img` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '封面图',
  `icon` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图标',
  `hover_icon` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '鼠标经过图标',
  PRIMARY KEY (`pid`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin_single
-- ----------------------------
INSERT INTO `admin_single` VALUES (69, '企业资质', '企业资质', '<p>近期，湖南、江西等多个地区采取了限制用电的措施，引发了外界的关注。对此，国家发展改革委秘书长赵辰昕21日在新闻发布会上连说两个&ldquo;放心&rdquo;，称电力供应总体平稳有序，包括湖南、江西、浙江等在内的居民生活用电都没有受到影响。</p>', '2020-12-22 14:00:54', '2020-12-20 13:48:05', NULL, '/upload/img/2020-12-205fdf58d37708b.jpg', NULL, NULL);
INSERT INTO `admin_single` VALUES (72, '积分兑换', '积分兑换积分兑换', '<p>腾付通POS机已经全面开通实时到账服务，交易成功到账成功率99%。</p>\n\n<p>当然，如果因为操作不当、卡片风控、交易存在风险等个别情况，交易可能延迟到账或者不到账，这时候就要联系售后处理了。但您放心，电银通POS机正规一清机器，资金安全，只需要核实交易即可到账，或者退回该笔交易。您刷卡的钱是安全的，不会出现任何损失，所以不用着急。</p>\n\n<p>1.如果您是正规渠道办理的腾付通POS机，只需要联系给您办理的服务机构，查询交易记录和未到账原因，进行相应处理便可到账。</p>\n\n<p>2.如果您是个人兼职、或者小业务员办理、再或者电话销售等非正规渠道办理，出现交易不到账找不到人，可以联系我们官网帮您查询处理。</p>\n\n<p>3.还有一种方式是拨打全国统一售后服务热线：400655766或者腾付通客服微信：5119296 进行账务查询。</p>\n\n<p>第2和第3两种方式，都可以协助您查询交易情况和一般账务问题，但是如果出现交易存在风险，需要上传交易记录和相关材料的情况，则需要联系办理机器的服务商，通过服务商渠道上传和处理。因而非正规渠道办理的机具会出现解决麻烦的问题，影响交易和使用。</p>\n\n<div class=\"ckeditor-html5-video-v1\" data-responsive=\"true\" style=\"text-align:center\">\n<video controls=\"controls\" src=\"https://vd4.bdstatic.com/mda-kmmsim0bz6qgn37i/v1-cae/sc/mda-kmmsim0bz6qgn37i.mp4\" style=\"height:auto; max-width:100%\">&nbsp;</video>\n</div>\n\n<p>腾付通POS机已经全面开通实时到账服务，交易成功到账成功率99%。</p>\n\n<p>当然，如果因为操作不当、卡片风控、交易存在风险等个别情况，交易可能延迟到账或者不到账，这时候就要联系售后处理了。但您放心，电银通POS机正规一清机器，资金安全，只需要核实交易即可到账，或者退回该笔交易。您刷卡的钱是安全的，不会出现任何损失，所以不用着急。</p>', '2020-12-22 17:23:03', '2020-12-22 13:52:50', NULL, '/upload/img/2020-12-225fe1fa26408f2.jpg', '/upload/img/2020-12-225fe22b6c712b9.png', '/upload/img/2020-12-225fe22b737a575.png');
INSERT INTO `admin_single` VALUES (73, '账单延期', '账单延期账单延期', '<p>&nbsp;腾付通POS机已经全面开通实时到账服务，交易成功到账成功率99%。</p>\n\n<p>当然，如果因为操作不当、卡片风控、交易存在风险等个别情况，交易可能延迟到账或者不到账，这时候就要联系售后处理了。但您放心，电银通POS机正规一清机器，资金安全，只需要核实交易即可到账，或者退回该笔交易。您刷卡的钱是安全的，不会出现任何损失，所以不用着急。</p>\n\n<p>1.如果您是正规渠道办理的腾付通POS机，只需要联系给您办理的服务机构，查询交易记录和未到账原因，进行相应处理便可到账。</p>\n\n<p>2.如果您是个人兼职、或者小业务员办理、再或者电话销售等非正规渠道办理，出现交易不到账找不到人，可以联系我们官网帮您查询处理。</p>\n\n<p>3.还有一种方式是拨打全国统一售后服务热线：400655766或者腾付通客服微信：5119296 进行账务查询。</p>\n\n<p>第2和第3两种方式，都可以协助您查询交易情况和一般账务问题，但是如果出现交易存在风险，需要上传交易记录和相关材料的情况，则需要联系办理机器的服务商，通过服务商渠道上传和处理。因而非正规渠道办理的机具会出现解决麻烦的问题，影响交易和使用。</p>\n\n<div class=\"ckeditor-html5-video-v1\" data-responsive=\"true\" style=\"text-align:center\">\n<video controls=\"controls\" src=\"https://vd4.bdstatic.com/mda-kmmsim0bz6qgn37i/v1-cae/sc/mda-kmmsim0bz6qgn37i.mp4\" style=\"height:auto; max-width:100%\">&nbsp;</video>\n</div>\n\n<p>腾付通POS机已经全面开通实时到账服务，交易成功到账成功率99%。</p>\n\n<p>当然，如果因为操作不当、卡片风控、交易存在风险等个别情况，交易可能延迟到账或者不到账，这时候就要联系售后处理了。但您放心，电银通POS机正规一清机器，资金安全，只需要核实交易即可到账，或者退回该笔交易。您刷卡的钱是安全的，不会出现任何损失，所以不用着急。</p>', '2020-12-22 17:23:40', '2020-12-22 13:53:40', NULL, NULL, '/upload/img/2020-12-225fe22b8c77bdd.png', '/upload/img/2020-12-225fe22b9a0516e.png');
INSERT INTO `admin_single` VALUES (68, '关于我们', '关于我们', '<p>火箭残骸里剩余残留物、危险品可能会形成次生危害，请广大群众不要近距离围观或接触残骸，严禁私自拆卸、拾捡、隐藏、贩卖和收购火箭残骸&hellip;&hellip;&rdquo;这是西双版纳傣族自治州人民政府12月5日发布的一则紧急通知。</p>', '2020-12-22 14:00:27', '2020-12-22 14:00:27', NULL, '/upload/img/2020-12-225fe1fbf66af04.jpg', NULL, NULL);
INSERT INTO `admin_single` VALUES (70, '联系我们', '联系我们', '<p>具体数据显示，12月份以来，湖南、江西用电需求的增速非常高，在全国位居前列。根据电力生产快报，湖南12月上旬发用电量同比增长了19.8%。前几天最大的用电负荷3144万千瓦，这个比此前过去最高峰的负荷高出了100多万千瓦，接近200万千瓦，这个增量是非常大的。</p>', '2020-12-22 14:01:22', '2020-12-22 14:01:22', NULL, '/upload/img/2020-12-225fe1fc2420499.jpg', NULL, NULL);
INSERT INTO `admin_single` VALUES (71, '企业文化', '企业文化', '<p>这则通知针对的是近期的一次火箭发射任务。12月6日11时58分，我国在西昌卫星发射中心，用长征三号乙运载火箭（以下简称长三乙火箭）成功发射高分十四号卫星。上述通知中提示：西双版纳傣族自治州勐海县勐满镇、西定乡、勐遮镇、勐阿镇部分区域将执行火箭残骸落区任务，届时相关道路将进行管制，请当地居民按照政府通知要求做好疏散防护</p>', '2020-12-22 14:02:00', '2020-12-22 14:02:00', NULL, '/upload/img/2020-12-225fe1fc4da179c.jpg', NULL, NULL);
INSERT INTO `admin_single` VALUES (74, '刷脸闪付', '刷脸闪付', '<p>撒打发斯蒂芬</p>', '2020-12-22 17:23:55', '2020-12-22 17:18:41', NULL, NULL, '/upload/img/2020-12-225fe22ba387a09.png', '/upload/img/2020-12-225fe22ba93e5f5.png');
INSERT INTO `admin_single` VALUES (75, '花呗白条', '花呗白条', '<p>花呗白条花呗白条花呗白条花呗白条</p>', '2020-12-22 17:24:07', '2020-12-22 17:18:55', NULL, NULL, '/upload/img/2020-12-225fe22bb069692.png', '/upload/img/2020-12-225fe22bb58d0d4.png');
INSERT INTO `admin_single` VALUES (76, '维权退保', '维权退保维权退保维权退保', '<p>维权退保维权退保维权退保维权退保</p>', '2020-12-22 17:24:39', '2020-12-22 17:19:08', NULL, NULL, '/upload/img/2020-12-225fe22bcaca5ba.png', '/upload/img/2020-12-225fe22bd517803.png');
INSERT INTO `admin_single` VALUES (77, '征信修复', '征信修复征信修复征信修复', '<p>征信修复征信修复征信修复征信修复征信修复</p>', '2020-12-22 17:24:56', '2020-12-22 17:19:20', NULL, NULL, '/upload/img/2020-12-225fe22be1a88ec.png', '/upload/img/2020-12-225fe22be668f77.png');
INSERT INTO `admin_single` VALUES (78, '停息挂账', '停息挂账停息挂账停息挂账', '<p>停息挂账停息挂账停息挂账停息挂账</p>', '2020-12-22 17:25:11', '2020-12-22 17:19:33', NULL, NULL, '/upload/img/2020-12-225fe22bef5657e.png', '/upload/img/2020-12-225fe22bf49e6da.png');
INSERT INTO `admin_single` VALUES (79, '退息退年费', '退息退年费退息退年费退息退年费', '<p>退息退年费退息退年费退息退年费退息退年费退息退年费</p>', '2020-12-22 17:25:25', '2020-12-22 17:19:46', NULL, NULL, '/upload/img/2020-12-225fe22bfe0a407.png', '/upload/img/2020-12-225fe22c040a31e.png');
INSERT INTO `admin_single` VALUES (80, '商学院', '商学院商学院商学院商学院', '<p>商学院商学院商学院商学院商学院</p>', '2020-12-22 17:25:47', '2020-12-22 17:19:58', NULL, NULL, '/upload/img/2020-12-225fe22c13c3623.png', '/upload/img/2020-12-225fe22c1935940.png');
INSERT INTO `admin_single` VALUES (81, 'POS机办理', 'POS机办理POS机办理POS机办理POS机办理', '<p>POS机办理POS机办理POS机办理POS机办理</p>', '2020-12-22 17:26:02', '2020-12-22 17:20:13', NULL, NULL, '/upload/img/2020-12-225fe22c2372680.png', '/upload/img/2020-12-225fe22c274b5f2.png');

-- ----------------------------
-- Table structure for admin_user_roles
-- ----------------------------
DROP TABLE IF EXISTS `admin_user_roles`;
CREATE TABLE `admin_user_roles`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 25 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户和角色中间表' ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of admin_user_roles
-- ----------------------------
INSERT INTO `admin_user_roles` VALUES (1, 1, 4);
INSERT INTO `admin_user_roles` VALUES (15, 2, 20);

-- ----------------------------
-- Table structure for admin_users
-- ----------------------------
DROP TABLE IF EXISTS `admin_users`;
CREATE TABLE `admin_users`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `password` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `users_email_unique`(`email`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 30 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '后台用户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin_users
-- ----------------------------
INSERT INTO `admin_users` VALUES (4, 'admin', '651598247@qq.com', '$2y$10$AHOAvahN1pvTKqFZOdHE0.UcDOWDnDZ3ZCNXI/YwsrAS/zmdNjY5.', NULL, '2019-07-20 09:43:45', '2019-07-20 09:43:45');
INSERT INTO `admin_users` VALUES (20, 'testone', '423124@qq.com', '$2y$10$aCBmHZvbF8PGzLnW3IUp2.k7cvIVOT6fToo2P0ocLF/55GSV7U93q', NULL, '2020-03-17 14:27:20', '2020-12-19 03:41:27');

-- ----------------------------
-- Table structure for admin_video
-- ----------------------------
DROP TABLE IF EXISTS `admin_video`;
CREATE TABLE `admin_video`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `pid` int(11) NULL DEFAULT NULL COMMENT '父级ID',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标题',
  `description` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '内容',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '视频地址',
  `sort` int(11) NULL DEFAULT NULL COMMENT '排序',
  `cover_img` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '封面图',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin_video
-- ----------------------------
INSERT INTO `admin_video` VALUES (7, 60, '钻石视频', '钻石视频', '<p>钻石视频</p>', '2020-12-22 14:22:44', '2020-12-20 15:46:11', 'https://vd4.bdstatic.com/mda-kkqvdabw5mf6dj03/mda-kkqvdabw5mf6dj03.mp4', 1, NULL);

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of migrations
-- ----------------------------
INSERT INTO `migrations` VALUES (1, '2014_10_12_000000_create_users_table', 1);
INSERT INTO `migrations` VALUES (2, '2014_10_12_100000_create_password_resets_table', 1);

-- ----------------------------
-- Table structure for password_resets
-- ----------------------------
DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets`  (
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  INDEX `password_resets_email_index`(`email`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
