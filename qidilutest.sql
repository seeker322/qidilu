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

 Date: 22/12/2020 02:54:00
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
) ENGINE = MyISAM AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin_artical
-- ----------------------------
INSERT INTO `admin_artical` VALUES (10, 61, 'ASDFASDF', 'ASDFASDF', '<p>SDFASDFASDF</p>', '2020-12-20 15:47:07', '2020-12-20 15:47:07', 'ASDFASDF', 1, NULL, 'ASDFASDF');
INSERT INTO `admin_artical` VALUES (7, 56, 'sadfasdf', '大是大非', '<p>撒打发斯蒂芬</p>', '2020-12-20 15:27:44', '2020-12-20 15:27:44', '阿斯蒂芬阿斯蒂芬', 11, NULL, '士大夫阿斯蒂芬');
INSERT INTO `admin_artical` VALUES (8, 56, '撒旦法撒旦法', '按份阿斯蒂芬', '<p>阿斯蒂芬阿斯蒂</p>', '2020-12-20 15:28:00', '2020-12-20 15:28:00', '按份阿斯蒂芬', 1, NULL, '大是大非');
INSERT INTO `admin_artical` VALUES (9, 56, '1111', '11111', '<p>111111</p>', '2020-12-20 15:28:37', '2020-12-20 15:28:37', '1111', 1, NULL, '1111');

-- ----------------------------
-- Table structure for admin_banner
-- ----------------------------
DROP TABLE IF EXISTS `admin_banner`;
CREATE TABLE `admin_banner`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `img` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sort` int(255) NULL DEFAULT NULL,
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin_banner
-- ----------------------------
INSERT INTO `admin_banner` VALUES (2, '付临门', '/upload/img/2020-12-215fe0ce950ea67.jpg', 1, 'http://www.baidu.com', '2020-12-21 16:34:50', '2020-12-21 16:34:32');

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
INSERT INTO `admin_comment` VALUES (4, '111', '1123123', 'asdfasdfasdf', 'e42423', '2020-12-21 18:30:14', '2020-12-21 18:30:14');
INSERT INTO `admin_comment` VALUES (5, 'rqwer', 'wqerqwer', 'qwerqwer', 'qwerqwerqwerqwer', '2020-12-21 18:44:52', '2020-12-21 18:44:52');
INSERT INTO `admin_comment` VALUES (6, 'rqwer', 'wqerqwer', 'qwerqwer', 'qwerqwerqwerqwer', '2020-12-21 18:45:54', '2020-12-21 18:45:54');
INSERT INTO `admin_comment` VALUES (7, 'asdfsadf', 'asdfasdf', 'asdfasdf', 'asdfasdfasdf', '2020-12-21 18:46:58', '2020-12-21 18:46:58');
INSERT INTO `admin_comment` VALUES (8, 'asdfsadf', 'asdfasdf', 'asdfasdf', 'asdfasdfasdf', '2020-12-21 18:48:03', '2020-12-21 18:48:03');

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
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 83 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin_permissions
-- ----------------------------
INSERT INTO `admin_permissions` VALUES (41, '系统管理', NULL, 0, NULL, 0, 'systemManger', 2, 'ios-keypad', 0, 1, '系统管理', '2020-12-20 16:31:00', '2020-12-21 00:31:00', NULL);
INSERT INTO `admin_permissions` VALUES (44, '权限控制', NULL, 0, NULL, NULL, NULL, 3, 'ios-navigate', 1, 1, '权限控制', '2020-03-29 11:39:57', '2020-03-29 19:39:57', NULL);
INSERT INTO `admin_permissions` VALUES (43, '系统设置', NULL, 41, 'system', NULL, 'SystemCtroller@index', NULL, NULL, 1, 1, '系统设置主页', '2020-12-18 14:22:33', '2020-12-18 22:22:33', NULL);
INSERT INTO `admin_permissions` VALUES (47, '菜单规则', NULL, 44, 'permissions', NULL, 'permissionCroller@index', NULL, NULL, 1, 1, '菜单规则', '2020-03-29 06:06:51', '2020-03-29 14:06:51', NULL);
INSERT INTO `admin_permissions` VALUES (48, '角色管理', NULL, 44, 'permissions-roles', NULL, 'roleCtroller@index', NULL, NULL, 1, 1, '角色列表', '2020-03-29 06:08:02', '2020-03-29 14:08:02', NULL);
INSERT INTO `admin_permissions` VALUES (49, '用户管理', NULL, 44, 'permissions-users', NULL, 'userCtroller@index', NULL, NULL, 1, 1, '用户列表', '2020-03-29 06:08:26', '2020-03-29 14:08:26', NULL);
INSERT INTO `admin_permissions` VALUES (50, '新增', NULL, 47, NULL, NULL, 'permissionCtroller@stroe', NULL, NULL, 0, 1, '新增', '2020-03-29 05:00:34', '2020-03-29 05:00:34', NULL);
INSERT INTO `admin_permissions` VALUES (51, '编辑', NULL, 47, NULL, NULL, 'permissionCroller@update', NULL, NULL, 0, 1, '编辑菜单规则', '2020-03-29 05:02:00', '2020-03-29 05:02:00', NULL);
INSERT INTO `admin_permissions` VALUES (52, '删除', NULL, 47, NULL, NULL, 'permissionCtroller@destry', NULL, NULL, 0, 1, '删除菜单规则', '2020-03-29 05:02:41', '2020-03-29 05:02:41', NULL);
INSERT INTO `admin_permissions` VALUES (53, 'POS机商城', NULL, 0, 'pos', NULL, 'posController@index', 4, 'ios-analytics', 1, 1, 'pos机商城', '2020-12-19 10:16:59', '2020-12-19 18:16:59', NULL);
INSERT INTO `admin_permissions` VALUES (54, '控制台', NULL, 0, 'control-board', 0, 'indexController@index', 1, 'ios-keypad', 0, 1, '控制台内容', '2020-12-20 16:30:49', '2020-12-21 00:30:49', NULL);
INSERT INTO `admin_permissions` VALUES (56, '拉卡拉', NULL, 53, 'pos', 1, 'articalContoller@show', 0, NULL, 1, 1, '拉卡拉', '2020-12-21 18:08:15', '2020-12-22 02:08:15', '/upload/img/2020-12-215fe0e48f6b141.jpg');
INSERT INTO `admin_permissions` VALUES (57, '金小宝', NULL, 53, 'pos', 1, 'posContoller@list', 0, NULL, 1, 1, '金小宝', '2020-12-20 11:40:42', '2020-12-20 19:40:42', NULL);
INSERT INTO `admin_permissions` VALUES (58, '十大渠道', NULL, 0, 'pos', 1, 'channelController@index', 5, 'ios-analytics', 1, 1, '十大渠道', '2020-12-20 11:50:19', '2020-12-20 19:50:19', NULL);
INSERT INTO `admin_permissions` VALUES (59, '商学院', NULL, 0, NULL, NULL, 'schoolController@index', 6, 'ios-easel', 1, 1, '商学院', '2020-12-19 10:52:46', '2020-12-19 18:52:46', NULL);
INSERT INTO `admin_permissions` VALUES (60, '视频相关', NULL, 59, 'video', 1, 'videoController@index', 0, NULL, 1, 1, '视频相关', '2020-12-20 15:42:44', '2020-12-20 23:42:44', NULL);
INSERT INTO `admin_permissions` VALUES (61, '资讯相关', NULL, 59, 'info', 1, 'schoolController@channels', 0, NULL, 1, 1, '内容管理', '2020-12-20 12:06:37', '2020-12-20 20:06:37', NULL);
INSERT INTO `admin_permissions` VALUES (62, 'APP管理', NULL, 0, 'app', 1, 'appController@index', 7, 'ios-download', 1, 1, 'app管理', '2020-12-20 16:07:39', '2020-12-21 00:07:39', NULL);
INSERT INTO `admin_permissions` VALUES (63, '公司介绍', NULL, 0, NULL, NULL, 'aboutController@index', 8, 'md-eye', 1, 1, '关于我们', '2020-12-19 13:31:35', '2020-12-19 21:31:35', NULL);
INSERT INTO `admin_permissions` VALUES (64, '留言管理', NULL, 0, 'comment', 0, 'commentController@index', 9, 'ios-mail', 1, 1, '留言管理', '2020-12-20 14:28:31', '2020-12-20 22:28:31', NULL);
INSERT INTO `admin_permissions` VALUES (65, '付临门', NULL, 53, 'pos', 1, 'posController@list', 0, NULL, 1, 1, '付临门', '2020-12-20 11:47:53', '2020-12-20 19:47:53', NULL);
INSERT INTO `admin_permissions` VALUES (66, '银盛通', NULL, 53, 'pos', 1, 'posController@list', 0, NULL, 1, 1, '银盛通', '2020-12-20 11:48:15', '2020-12-20 19:48:15', NULL);
INSERT INTO `admin_permissions` VALUES (67, '腾付通', NULL, 53, 'pos', 1, 'posController@list', 0, NULL, 1, 1, '腾付通', '2020-12-20 11:48:34', '2020-12-20 19:48:34', NULL);
INSERT INTO `admin_permissions` VALUES (68, '关于我们', NULL, 63, 'company', 1, 'aboutController@index', 0, NULL, 1, 1, '关于我们', '2020-12-20 12:19:56', '2020-12-20 20:19:56', NULL);
INSERT INTO `admin_permissions` VALUES (69, '企业资质', NULL, 63, 'company', 1, 'aboutController@index', 0, NULL, 1, 1, '企业资质', '2020-12-20 12:20:36', '2020-12-20 20:20:36', NULL);
INSERT INTO `admin_permissions` VALUES (70, '联系我们', NULL, 63, 'company', 1, 'aboutController@index', 0, NULL, 1, 1, '联系我们', '2020-12-20 12:20:44', '2020-12-20 20:20:44', NULL);
INSERT INTO `admin_permissions` VALUES (71, '企业文化', NULL, 63, 'company', 1, 'aboutController@index', 0, NULL, 1, 1, '联系我们', '2020-12-20 12:20:52', '2020-12-20 20:20:52', NULL);
INSERT INTO `admin_permissions` VALUES (72, '积分兑换', NULL, 58, 'channels', 1, 'singleController@show', 0, NULL, 1, 1, '积分兑换', '2020-12-20 14:50:20', '2020-12-20 22:50:20', NULL);
INSERT INTO `admin_permissions` VALUES (73, '账单延期', NULL, 58, 'channels', 1, 'singleController@show', 0, NULL, 1, 1, '积分兑换', '2020-12-20 15:47:37', '2020-12-20 23:47:37', NULL);
INSERT INTO `admin_permissions` VALUES (74, '刷脸闪付', NULL, 58, 'channels', 1, 'singleController@show', 0, NULL, 1, 1, '刷脸闪付', '2020-12-20 15:47:44', '2020-12-20 23:47:44', NULL);
INSERT INTO `admin_permissions` VALUES (75, '花呗白条', NULL, 58, 'channels', 1, 'singleController@show', 0, NULL, 1, 1, '花呗白条', '2020-12-20 15:47:50', '2020-12-20 23:47:50', NULL);
INSERT INTO `admin_permissions` VALUES (76, '维权退保', NULL, 58, 'channels', 1, 'singleController@show', 0, NULL, 1, 1, '维权退保', '2020-12-20 15:47:58', '2020-12-20 23:47:58', NULL);
INSERT INTO `admin_permissions` VALUES (77, '征信修复', NULL, 58, 'channels', 1, 'singleController@show', 0, NULL, 1, 1, '征信修复', '2020-12-20 15:48:05', '2020-12-20 23:48:05', NULL);
INSERT INTO `admin_permissions` VALUES (78, '停息挂账', NULL, 58, 'channels', 1, 'singleController@show', 0, NULL, 1, 1, '停息挂账', '2020-12-20 15:48:11', '2020-12-20 23:48:11', NULL);
INSERT INTO `admin_permissions` VALUES (79, '退息退年费', NULL, 58, 'channels', 1, 'singleController@show', 0, NULL, 1, 1, '退息退年费', '2020-12-20 15:49:37', '2020-12-20 23:49:37', NULL);
INSERT INTO `admin_permissions` VALUES (80, '商学院', NULL, 58, 'channels', 1, 'singleController@show', 0, NULL, 1, 1, '商学院', '2020-12-20 15:48:24', '2020-12-20 23:48:24', NULL);
INSERT INTO `admin_permissions` VALUES (81, 'POS机办理', NULL, 58, 'channels', 1, 'singleController@show', 0, NULL, 1, 1, 'POS机办理', '2020-12-20 15:48:30', '2020-12-20 23:48:30', NULL);
INSERT INTO `admin_permissions` VALUES (82, '轮播图管理', NULL, 0, 'banner', 0, 'bannerController@show', 11, 'ios-keypad', 1, 1, '轮播图管理', '2020-12-21 16:26:29', '2020-12-22 00:26:29', NULL);

-- ----------------------------
-- Table structure for admin_role_permissions
-- ----------------------------
DROP TABLE IF EXISTS `admin_role_permissions`;
CREATE TABLE `admin_role_permissions`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `permission_id` int(11) NOT NULL,
  `role_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 98 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色和权限中间表' ROW_FORMAT = Fixed;

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
  PRIMARY KEY (`pid`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin_single
-- ----------------------------
INSERT INTO `admin_single` VALUES (69, 'asdfasdf', 'asdfasdf', '<p>asdfasdf</p>', '2020-12-20 13:59:49', '2020-12-20 13:48:05', NULL, '/upload/img/2020-12-205fdf58d37708b.jpg', NULL);
INSERT INTO `admin_single` VALUES (74, NULL, NULL, '<p>sdfsadfasdf</p>', '2020-12-20 16:26:05', '2020-12-20 16:26:05', NULL, NULL, NULL);

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
INSERT INTO `admin_video` VALUES (7, 60, 'AFADASD', 'SDFSADFSADF', '<p>SADFASDFASDFASDF</p>', '2020-12-20 15:46:11', '2020-12-20 15:46:11', 'ASDFASDFSADF', 1111, NULL);

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
