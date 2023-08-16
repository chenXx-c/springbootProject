/*
 Navicat MySQL Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 80026
 Source Host           : localhost:3306
 Source Schema         : xdboot

 Target Server Type    : MySQL
 Target Server Version : 80026
 File Encoding         : 65001

 Date: 21/02/2023 08:55:49
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for x_menu
-- ----------------------------
DROP TABLE IF EXISTS `x_menu`;
CREATE TABLE `x_menu`  (
  `menu_id` int NOT NULL AUTO_INCREMENT,
  `component` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `path` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `redirect` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `icon` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `parent_id` int NULL DEFAULT NULL,
  `is_leaf` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `hidden` tinyint(1) NULL DEFAULT NULL,
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of x_menu
-- ----------------------------
INSERT INTO `x_menu` VALUES (1, 'Layout', '/user', '/user/list', 'userManage', '用户管理', 'userManage', 0, 'N', 0);
INSERT INTO `x_menu` VALUES (2, 'user/user', 'list', NULL, 'userList', '用户列表', 'userList', 1, 'Y', 0);
INSERT INTO `x_menu` VALUES (3, 'user/role', 'role', NULL, 'roleList', '角色列表', 'role', 1, 'Y', 0);
INSERT INTO `x_menu` VALUES (4, 'user/permission', 'permission', NULL, 'permissionList', '权限列表', 'permission', 1, 'Y', 0);

-- ----------------------------
-- Table structure for x_role
-- ----------------------------
DROP TABLE IF EXISTS `x_role`;
CREATE TABLE `x_role`  (
  `role_id` int NOT NULL AUTO_INCREMENT,
  `role_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `role_desc` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of x_role
-- ----------------------------
INSERT INTO `x_role` VALUES (1, 'admin', '超级管理员');
INSERT INTO `x_role` VALUES (2, 'hr', '人事专员');
INSERT INTO `x_role` VALUES (3, 'normal', '普通员工');

-- ----------------------------
-- Table structure for x_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `x_role_menu`;
CREATE TABLE `x_role_menu`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `role_id` int NULL DEFAULT NULL,
  `menu_id` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of x_role_menu
-- ----------------------------

-- ----------------------------
-- Table structure for x_user
-- ----------------------------
DROP TABLE IF EXISTS `x_user`;
CREATE TABLE `x_user`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `password` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `status` int NULL DEFAULT NULL COMMENT '状态',
  `avatar` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '头像',
  `deleted` int NULL DEFAULT 0 COMMENT '逻辑删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of x_user
-- ----------------------------
INSERT INTO `x_user` VALUES (1, 'admin', '$2a$10$NaJt6S91AzejKlApIYI07e/yhVGcHPEM1rm0lOzbgC80Tmxdd8Zli', 'super@aliyun.com', '18677778888', 1, 'https://wpimg.wallstcn.com/f778738c-e4f8-4870-b634-56703b4acafe.gif', 0);
INSERT INTO `x_user` VALUES (2, 'zhangsan', '$2a$10$NaJt6S91AzejKlApIYI07e/yhVGcHPEM1rm0lOzbgC80Tmxdd8Zli', 'zhangsan@gmail.com', '13966667777', 1, 'https://wpimg.wallstcn.com/f778738c-e4f8-4870-b634-56703b4acafe.gif', 0);
INSERT INTO `x_user` VALUES (3, 'lisi', '$2a$10$NaJt6S91AzejKlApIYI07e/yhVGcHPEM1rm0lOzbgC80Tmxdd8Zli', 'lisi@gmail.com', '13966667778', 1, 'https://wpimg.wallstcn.com/f778738c-e4f8-4870-b634-56703b4acafe.gif', 0);
INSERT INTO `x_user` VALUES (4, 'wangwu', '$2a$10$NaJt6S91AzejKlApIYI07e/yhVGcHPEM1rm0lOzbgC80Tmxdd8Zli', 'wangwu@gmail.com', '13966667772', 1, 'https://wpimg.wallstcn.com/f778738c-e4f8-4870-b634-56703b4acafe.gif', 0);
INSERT INTO `x_user` VALUES (5, 'zhaoer', '$2a$10$NaJt6S91AzejKlApIYI07e/yhVGcHPEM1rm0lOzbgC80Tmxdd8Zli', 'zhaoer@gmail.com', '13966667776', 1, 'https://wpimg.wallstcn.com/f778738c-e4f8-4870-b634-56703b4acafe.gif', 0);
INSERT INTO `x_user` VALUES (6, 'songliu', '$2a$10$NaJt6S91AzejKlApIYI07e/yhVGcHPEM1rm0lOzbgC80Tmxdd8Zli', 'songliu@gmail.com', '13966667771', 1, 'https://wpimg.wallstcn.com/f778738c-e4f8-4870-b634-56703b4acafe.gif', 0);
INSERT INTO `x_user` VALUES (7, '测试一', '$2a$10$NaJt6S91AzejKlApIYI07e/yhVGcHPEM1rm0lOzbgC80Tmxdd8Zli', 'sasasa@qq.com', '152315454154', 1, NULL, 0);
INSERT INTO `x_user` VALUES (8, '测试二', '$2a$10$NaJt6S91AzejKlApIYI07e/yhVGcHPEM1rm0lOzbgC80Tmxdd8Zli', 'sasas@qq.com', '1515156456', 0, NULL, 0);
INSERT INTO `x_user` VALUES (9, '测试三10', '$2a$10$NaJt6S91AzejKlApIYI07e/yhVGcHPEM1rm0lOzbgC80Tmxdd8Zli', 'sssss@qq.com', '1512234515214', 1, NULL, 0);
INSERT INTO `x_user` VALUES (10, '测试五12', '$2a$10$Ve8gIBIpnFsq0PcG6mkViOccZOjzcx5pqAAgsFxtxXYttqJsKt5z.', '1554@qq.com', '151545414455', 1, NULL, 1);

-- ----------------------------
-- Table structure for x_user_role
-- ----------------------------
DROP TABLE IF EXISTS `x_user_role`;
CREATE TABLE `x_user_role`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NULL DEFAULT NULL,
  `role_id` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of x_user_role
-- ----------------------------
INSERT INTO `x_user_role` VALUES (1, 1, 1);

SET FOREIGN_KEY_CHECKS = 1;
