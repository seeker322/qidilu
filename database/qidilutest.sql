/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50554
Source Host           : localhost:3306
Source Database       : qidilutest

Target Server Type    : MYSQL
Target Server Version : 50554
File Encoding         : 65001

Date: 2020-07-28 18:02:00
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for admin_permissions
-- ----------------------------
DROP TABLE IF EXISTS `admin_permissions`;
CREATE TABLE `admin_permissions` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '权限标识',
  `display_name` varchar(255) DEFAULT NULL COMMENT '权限名称',
  `pid` smallint(6) DEFAULT NULL COMMENT '控制器及方法',
  `url` varchar(255) DEFAULT NULL COMMENT '页面地址',
  `action` varchar(255) DEFAULT NULL,
  `sort` smallint(6) DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL COMMENT '图标',
  `is_menu` tinyint(1) unsigned zerofill DEFAULT '0' COMMENT '是否为菜单（左侧显示）：0:非菜单，1：菜单',
  `status` tinyint(1) DEFAULT '1' COMMENT '是否隐藏：0：隐藏，1显示',
  `description` varchar(255) DEFAULT NULL COMMENT '权限描述',
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=55 DEFAULT CHARSET=utf8 COMMENT='权限表';

-- ----------------------------
-- Records of admin_permissions
-- ----------------------------
INSERT INTO `admin_permissions` VALUES ('41', '系统管理', null, '0', null, 'systemManger', '2', 'ios-keypad', '1', '1', '系统管理', '2020-03-29 11:39:20', '2020-03-29 19:39:20');
INSERT INTO `admin_permissions` VALUES ('44', '权限控制', null, '0', null, null, '3', 'ios-navigate', '1', '1', '权限控制', '2020-03-29 11:39:57', '2020-03-29 19:39:57');
INSERT INTO `admin_permissions` VALUES ('43', '系统设置', null, '41', 'system', 'SystemCtroller@index', null, null, '1', '1', '系统设置主页', '2020-03-29 11:00:27', '2020-03-29 19:00:27');
INSERT INTO `admin_permissions` VALUES ('45', '二级菜单', null, '41', null, null, null, null, '0', '1', '菜单测试', '2020-03-29 11:19:42', '2020-03-29 19:19:42');
INSERT INTO `admin_permissions` VALUES ('47', '菜单规则', null, '44', 'permissions', 'permissionCroller@index', null, null, '1', '1', '菜单规则', '2020-03-29 06:06:51', '2020-03-29 14:06:51');
INSERT INTO `admin_permissions` VALUES ('48', '角色管理', null, '44', 'permissions-roles', 'roleCtroller@index', null, null, '1', '1', '角色列表', '2020-03-29 06:08:02', '2020-03-29 14:08:02');
INSERT INTO `admin_permissions` VALUES ('49', '用户管理', null, '44', 'permissions-users', 'userCtroller@index', null, null, '1', '1', '用户列表', '2020-03-29 06:08:26', '2020-03-29 14:08:26');
INSERT INTO `admin_permissions` VALUES ('50', '新增', null, '47', null, 'permissionCtroller@stroe', null, null, '0', '1', '新增', '2020-03-29 05:00:34', '2020-03-29 05:00:34');
INSERT INTO `admin_permissions` VALUES ('51', '编辑', null, '47', null, 'permissionCroller@update', null, null, '0', '1', '编辑菜单规则', '2020-03-29 05:02:00', '2020-03-29 05:02:00');
INSERT INTO `admin_permissions` VALUES ('52', '删除', null, '47', null, 'permissionCtroller@destry', null, null, '0', '1', '删除菜单规则', '2020-03-29 05:02:41', '2020-03-29 05:02:41');
INSERT INTO `admin_permissions` VALUES ('53', '内容管理', null, '0', 'article', 'ArticleController@index', '4', 'ios-analytics', '1', '1', '内容管理', '2020-03-29 11:40:15', '2020-03-29 19:40:15');
INSERT INTO `admin_permissions` VALUES ('54', '控制台', null, '0', 'control-board', 'indexController@index', '1', 'ios-keypad', '1', '1', '控制台内容', '2020-03-29 11:38:28', '2020-03-29 19:38:28');

-- ----------------------------
-- Table structure for admin_roles
-- ----------------------------
DROP TABLE IF EXISTS `admin_roles`;
CREATE TABLE `admin_roles` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL COMMENT '角色名称',
  `description` varchar(255) DEFAULT NULL COMMENT '角色描述',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='角色表';

-- ----------------------------
-- Records of admin_roles
-- ----------------------------
INSERT INTO `admin_roles` VALUES ('1', '超级管理员', '拥有所有权限', '2020-03-17 23:18:00', '2020-03-17 23:18:04');
INSERT INTO `admin_roles` VALUES ('2', '普通管理员', '拥有部分权限', '2020-03-17 23:18:07', '2020-03-17 23:18:10');
INSERT INTO `admin_roles` VALUES ('9', '测试角色', '测试角色权限', '2020-03-30 02:29:04', '2020-03-30 02:29:04');

-- ----------------------------
-- Table structure for admin_role_permissions
-- ----------------------------
DROP TABLE IF EXISTS `admin_role_permissions`;
CREATE TABLE `admin_role_permissions` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `permission_id` int(11) NOT NULL,
  `role_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=69 DEFAULT CHARSET=utf8 COMMENT='角色和权限中间表';

-- ----------------------------
-- Records of admin_role_permissions
-- ----------------------------
INSERT INTO `admin_role_permissions` VALUES ('37', '41', '1');
INSERT INTO `admin_role_permissions` VALUES ('40', '44', '1');
INSERT INTO `admin_role_permissions` VALUES ('39', '43', '1');
INSERT INTO `admin_role_permissions` VALUES ('51', '45', '2');
INSERT INTO `admin_role_permissions` VALUES ('43', '47', '1');
INSERT INTO `admin_role_permissions` VALUES ('44', '48', '1');
INSERT INTO `admin_role_permissions` VALUES ('45', '49', '1');
INSERT INTO `admin_role_permissions` VALUES ('46', '50', '1');
INSERT INTO `admin_role_permissions` VALUES ('47', '51', '1');
INSERT INTO `admin_role_permissions` VALUES ('50', '54', '1');
INSERT INTO `admin_role_permissions` VALUES ('49', '53', '1');
INSERT INTO `admin_role_permissions` VALUES ('48', '52', '1');
INSERT INTO `admin_role_permissions` VALUES ('52', '50', '2');
INSERT INTO `admin_role_permissions` VALUES ('53', '41', '2');
INSERT INTO `admin_role_permissions` VALUES ('54', '44', '2');
INSERT INTO `admin_role_permissions` VALUES ('55', '47', '2');
INSERT INTO `admin_role_permissions` VALUES ('56', '51', '2');
INSERT INTO `admin_role_permissions` VALUES ('68', '45', '1');
INSERT INTO `admin_role_permissions` VALUES ('67', '47', '9');
INSERT INTO `admin_role_permissions` VALUES ('66', '44', '9');
INSERT INTO `admin_role_permissions` VALUES ('65', '49', '9');
INSERT INTO `admin_role_permissions` VALUES ('64', '51', '9');
INSERT INTO `admin_role_permissions` VALUES ('63', '54', '9');

-- ----------------------------
-- Table structure for admin_users
-- ----------------------------
DROP TABLE IF EXISTS `admin_users`;
CREATE TABLE `admin_users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='后台用户表';

-- ----------------------------
-- Records of admin_users
-- ----------------------------
INSERT INTO `admin_users` VALUES ('4', 'admin', '651598247@qq.com', '$2y$10$AHOAvahN1pvTKqFZOdHE0.UcDOWDnDZ3ZCNXI/YwsrAS/zmdNjY5.', null, '2019-07-20 09:43:45', '2019-07-20 09:43:45');
INSERT INTO `admin_users` VALUES ('20', 'testone', '423124@qq.com', '$2y$10$hLhTquC1Q9DuTrjrHB2lsOaRCuCcDLfsok4R298rAx9GI8xYKJ.Lq', null, '2020-03-17 14:27:20', '2020-03-30 06:39:36');

-- ----------------------------
-- Table structure for admin_user_roles
-- ----------------------------
DROP TABLE IF EXISTS `admin_user_roles`;
CREATE TABLE `admin_user_roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='用户和角色中间表';

-- ----------------------------
-- Records of admin_user_roles
-- ----------------------------
INSERT INTO `admin_user_roles` VALUES ('1', '1', '4');
INSERT INTO `admin_user_roles` VALUES ('15', '2', '20');

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of migrations
-- ----------------------------
INSERT INTO `migrations` VALUES ('1', '2014_10_12_000000_create_users_table', '1');
INSERT INTO `migrations` VALUES ('2', '2014_10_12_100000_create_password_resets_table', '1');

-- ----------------------------
-- Table structure for password_resets
-- ----------------------------
DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of password_resets
-- ----------------------------
