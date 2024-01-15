/*
 Navicat Premium Data Transfer

 Source Server         : 本地MySQL
 Source Server Type    : MySQL
 Source Server Version : 80031
 Source Host           : localhost:3306
 Source Schema         : link

 Target Server Type    : MySQL
 Target Server Version : 80031
 File Encoding         : 65001

 Date: 15/01/2024 11:31:48
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for t_group_0
-- ----------------------------
DROP TABLE IF EXISTS `t_group_0`;
CREATE TABLE `t_group_0` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `gid` varchar(32) DEFAULT NULL COMMENT '短链接分组标识',
  `name` varchar(64) DEFAULT NULL COMMENT '分组名称',
  `username` varchar(255) DEFAULT NULL COMMENT '创建分组的用户名',
  `sort_order` int DEFAULT NULL COMMENT '分组排序',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `del_flag` tinyint(1) DEFAULT '0' COMMENT '删除标识，0：未删除，1：已删除',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_gid&username` (`gid`,`username`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Table structure for t_group_1
-- ----------------------------
DROP TABLE IF EXISTS `t_group_1`;
CREATE TABLE `t_group_1` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `gid` varchar(32) DEFAULT NULL COMMENT '短链接分组标识',
  `name` varchar(64) DEFAULT NULL COMMENT '分组名称',
  `username` varchar(255) DEFAULT NULL COMMENT '创建分组的用户名',
  `sort_order` int DEFAULT NULL COMMENT '分组排序',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `del_flag` tinyint(1) DEFAULT '0' COMMENT '删除标识，0：未删除，1：已删除',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_gid&username` (`gid`,`username`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Table structure for t_group_10
-- ----------------------------
DROP TABLE IF EXISTS `t_group_10`;
CREATE TABLE `t_group_10` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `gid` varchar(32) DEFAULT NULL COMMENT '短链接分组标识',
  `name` varchar(64) DEFAULT NULL COMMENT '分组名称',
  `username` varchar(255) DEFAULT NULL COMMENT '创建分组的用户名',
  `sort_order` int DEFAULT NULL COMMENT '分组排序',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `del_flag` tinyint(1) DEFAULT '0' COMMENT '删除标识，0：未删除，1：已删除',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_gid&username` (`gid`,`username`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Table structure for t_group_11
-- ----------------------------
DROP TABLE IF EXISTS `t_group_11`;
CREATE TABLE `t_group_11` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `gid` varchar(32) DEFAULT NULL COMMENT '短链接分组标识',
  `name` varchar(64) DEFAULT NULL COMMENT '分组名称',
  `username` varchar(255) DEFAULT NULL COMMENT '创建分组的用户名',
  `sort_order` int DEFAULT NULL COMMENT '分组排序',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `del_flag` tinyint(1) DEFAULT '0' COMMENT '删除标识，0：未删除，1：已删除',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_gid&username` (`gid`,`username`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Table structure for t_group_12
-- ----------------------------
DROP TABLE IF EXISTS `t_group_12`;
CREATE TABLE `t_group_12` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `gid` varchar(32) DEFAULT NULL COMMENT '短链接分组标识',
  `name` varchar(64) DEFAULT NULL COMMENT '分组名称',
  `username` varchar(255) DEFAULT NULL COMMENT '创建分组的用户名',
  `sort_order` int DEFAULT NULL COMMENT '分组排序',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `del_flag` tinyint(1) DEFAULT '0' COMMENT '删除标识，0：未删除，1：已删除',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_gid&username` (`gid`,`username`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Table structure for t_group_13
-- ----------------------------
DROP TABLE IF EXISTS `t_group_13`;
CREATE TABLE `t_group_13` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `gid` varchar(32) DEFAULT NULL COMMENT '短链接分组标识',
  `name` varchar(64) DEFAULT NULL COMMENT '分组名称',
  `username` varchar(255) DEFAULT NULL COMMENT '创建分组的用户名',
  `sort_order` int DEFAULT NULL COMMENT '分组排序',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `del_flag` tinyint(1) DEFAULT '0' COMMENT '删除标识，0：未删除，1：已删除',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_gid&username` (`gid`,`username`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Table structure for t_group_14
-- ----------------------------
DROP TABLE IF EXISTS `t_group_14`;
CREATE TABLE `t_group_14` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `gid` varchar(32) DEFAULT NULL COMMENT '短链接分组标识',
  `name` varchar(64) DEFAULT NULL COMMENT '分组名称',
  `username` varchar(255) DEFAULT NULL COMMENT '创建分组的用户名',
  `sort_order` int DEFAULT NULL COMMENT '分组排序',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `del_flag` tinyint(1) DEFAULT '0' COMMENT '删除标识，0：未删除，1：已删除',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_gid&username` (`gid`,`username`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Table structure for t_group_15
-- ----------------------------
DROP TABLE IF EXISTS `t_group_15`;
CREATE TABLE `t_group_15` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `gid` varchar(32) DEFAULT NULL COMMENT '短链接分组标识',
  `name` varchar(64) DEFAULT NULL COMMENT '分组名称',
  `username` varchar(255) DEFAULT NULL COMMENT '创建分组的用户名',
  `sort_order` int DEFAULT NULL COMMENT '分组排序',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `del_flag` tinyint(1) DEFAULT '0' COMMENT '删除标识，0：未删除，1：已删除',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_gid&username` (`gid`,`username`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1745305331292033028 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Table structure for t_group_2
-- ----------------------------
DROP TABLE IF EXISTS `t_group_2`;
CREATE TABLE `t_group_2` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `gid` varchar(32) DEFAULT NULL COMMENT '短链接分组标识',
  `name` varchar(64) DEFAULT NULL COMMENT '分组名称',
  `username` varchar(255) DEFAULT NULL COMMENT '创建分组的用户名',
  `sort_order` int DEFAULT NULL COMMENT '分组排序',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `del_flag` tinyint(1) DEFAULT '0' COMMENT '删除标识，0：未删除，1：已删除',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_gid&username` (`gid`,`username`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Table structure for t_group_3
-- ----------------------------
DROP TABLE IF EXISTS `t_group_3`;
CREATE TABLE `t_group_3` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `gid` varchar(32) DEFAULT NULL COMMENT '短链接分组标识',
  `name` varchar(64) DEFAULT NULL COMMENT '分组名称',
  `username` varchar(255) DEFAULT NULL COMMENT '创建分组的用户名',
  `sort_order` int DEFAULT NULL COMMENT '分组排序',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `del_flag` tinyint(1) DEFAULT '0' COMMENT '删除标识，0：未删除，1：已删除',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_gid&username` (`gid`,`username`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Table structure for t_group_4
-- ----------------------------
DROP TABLE IF EXISTS `t_group_4`;
CREATE TABLE `t_group_4` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `gid` varchar(32) DEFAULT NULL COMMENT '短链接分组标识',
  `name` varchar(64) DEFAULT NULL COMMENT '分组名称',
  `username` varchar(255) DEFAULT NULL COMMENT '创建分组的用户名',
  `sort_order` int DEFAULT NULL COMMENT '分组排序',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `del_flag` tinyint(1) DEFAULT '0' COMMENT '删除标识，0：未删除，1：已删除',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_gid&username` (`gid`,`username`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Table structure for t_group_5
-- ----------------------------
DROP TABLE IF EXISTS `t_group_5`;
CREATE TABLE `t_group_5` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `gid` varchar(32) DEFAULT NULL COMMENT '短链接分组标识',
  `name` varchar(64) DEFAULT NULL COMMENT '分组名称',
  `username` varchar(255) DEFAULT NULL COMMENT '创建分组的用户名',
  `sort_order` int DEFAULT NULL COMMENT '分组排序',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `del_flag` tinyint(1) DEFAULT '0' COMMENT '删除标识，0：未删除，1：已删除',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_gid&username` (`gid`,`username`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Table structure for t_group_6
-- ----------------------------
DROP TABLE IF EXISTS `t_group_6`;
CREATE TABLE `t_group_6` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `gid` varchar(32) DEFAULT NULL COMMENT '短链接分组标识',
  `name` varchar(64) DEFAULT NULL COMMENT '分组名称',
  `username` varchar(255) DEFAULT NULL COMMENT '创建分组的用户名',
  `sort_order` int DEFAULT NULL COMMENT '分组排序',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `del_flag` tinyint(1) DEFAULT '0' COMMENT '删除标识，0：未删除，1：已删除',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_gid&username` (`gid`,`username`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Table structure for t_group_7
-- ----------------------------
DROP TABLE IF EXISTS `t_group_7`;
CREATE TABLE `t_group_7` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `gid` varchar(32) DEFAULT NULL COMMENT '短链接分组标识',
  `name` varchar(64) DEFAULT NULL COMMENT '分组名称',
  `username` varchar(255) DEFAULT NULL COMMENT '创建分组的用户名',
  `sort_order` int DEFAULT NULL COMMENT '分组排序',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `del_flag` tinyint(1) DEFAULT '0' COMMENT '删除标识，0：未删除，1：已删除',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_gid&username` (`gid`,`username`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Table structure for t_group_8
-- ----------------------------
DROP TABLE IF EXISTS `t_group_8`;
CREATE TABLE `t_group_8` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `gid` varchar(32) DEFAULT NULL COMMENT '短链接分组标识',
  `name` varchar(64) DEFAULT NULL COMMENT '分组名称',
  `username` varchar(255) DEFAULT NULL COMMENT '创建分组的用户名',
  `sort_order` int DEFAULT NULL COMMENT '分组排序',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `del_flag` tinyint(1) DEFAULT '0' COMMENT '删除标识，0：未删除，1：已删除',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_gid&username` (`gid`,`username`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Table structure for t_group_9
-- ----------------------------
DROP TABLE IF EXISTS `t_group_9`;
CREATE TABLE `t_group_9` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `gid` varchar(32) DEFAULT NULL COMMENT '短链接分组标识',
  `name` varchar(64) DEFAULT NULL COMMENT '分组名称',
  `username` varchar(255) DEFAULT NULL COMMENT '创建分组的用户名',
  `sort_order` int DEFAULT NULL COMMENT '分组排序',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `del_flag` tinyint(1) DEFAULT '0' COMMENT '删除标识，0：未删除，1：已删除',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_gid&username` (`gid`,`username`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Table structure for t_link_0
-- ----------------------------
DROP TABLE IF EXISTS `t_link_0`;
CREATE TABLE `t_link_0` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `domain` varchar(128) DEFAULT NULL COMMENT '域名',
  `short_uri` varchar(8) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL COMMENT '短链接',
  `full_short_url` varchar(128) DEFAULT NULL COMMENT '完整短链接',
  `origin_url` varchar(1024) DEFAULT NULL COMMENT '原始链接',
  `click_num` int DEFAULT '0' COMMENT '点击量',
  `gid` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT 'default' COMMENT '短链接分组标识',
  `favicon` varchar(256) DEFAULT NULL COMMENT '网站图标',
  `enable_status` tinyint(1) DEFAULT '0' COMMENT '启用标识 0：启用，1:未启用',
  `create_type` tinyint(1) DEFAULT NULL COMMENT '创建类型',
  `valid_date_type` tinyint(1) DEFAULT NULL COMMENT '有效期类型',
  `valid_date` datetime DEFAULT NULL COMMENT '有效期',
  `describe` varchar(1024) DEFAULT NULL COMMENT '描述',
  `total_pv` int DEFAULT NULL COMMENT '历史PV',
  `total_uv` int DEFAULT NULL COMMENT '历史UV',
  `total_uip` int DEFAULT NULL COMMENT '历史uip',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `del_time` bigint DEFAULT NULL COMMENT '删除时间戳',
  `del_flag` tinyint(1) DEFAULT '0' COMMENT '软删除标识',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unqiue_full_short_url` (`full_short_url`,`del_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Table structure for t_link_1
-- ----------------------------
DROP TABLE IF EXISTS `t_link_1`;
CREATE TABLE `t_link_1` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `domain` varchar(128) DEFAULT NULL COMMENT '域名',
  `short_uri` varchar(8) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL COMMENT '短链接',
  `full_short_url` varchar(128) DEFAULT NULL COMMENT '完整短链接',
  `origin_url` varchar(1024) DEFAULT NULL COMMENT '原始链接',
  `click_num` int DEFAULT '0' COMMENT '点击量',
  `gid` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT 'default' COMMENT '短链接分组标识',
  `favicon` varchar(256) DEFAULT NULL COMMENT '网站图标',
  `enable_status` tinyint(1) DEFAULT '0' COMMENT '启用标识 0：启用，1:未启用',
  `create_type` tinyint(1) DEFAULT NULL COMMENT '创建类型',
  `valid_date_type` tinyint(1) DEFAULT NULL COMMENT '有效期类型',
  `valid_date` datetime DEFAULT NULL COMMENT '有效期',
  `describe` varchar(1024) DEFAULT NULL COMMENT '描述',
  `total_pv` int DEFAULT NULL COMMENT '历史PV',
  `total_uv` int DEFAULT NULL COMMENT '历史UV',
  `total_uip` int DEFAULT NULL COMMENT '历史uip',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `del_time` bigint DEFAULT NULL COMMENT '删除时间戳',
  `del_flag` tinyint(1) DEFAULT '0' COMMENT '软删除标识',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unqiue_full_short_url` (`full_short_url`,`del_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Table structure for t_link_10
-- ----------------------------
DROP TABLE IF EXISTS `t_link_10`;
CREATE TABLE `t_link_10` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `domain` varchar(128) DEFAULT NULL COMMENT '域名',
  `short_uri` varchar(8) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL COMMENT '短链接',
  `full_short_url` varchar(128) DEFAULT NULL COMMENT '完整短链接',
  `origin_url` varchar(1024) DEFAULT NULL COMMENT '原始链接',
  `click_num` int DEFAULT '0' COMMENT '点击量',
  `gid` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT 'default' COMMENT '短链接分组标识',
  `favicon` varchar(256) DEFAULT NULL COMMENT '网站图标',
  `enable_status` tinyint(1) DEFAULT '0' COMMENT '启用标识 0：启用，1:未启用',
  `create_type` tinyint(1) DEFAULT NULL COMMENT '创建类型',
  `valid_date_type` tinyint(1) DEFAULT NULL COMMENT '有效期类型',
  `valid_date` datetime DEFAULT NULL COMMENT '有效期',
  `describe` varchar(1024) DEFAULT NULL COMMENT '描述',
  `total_pv` int DEFAULT NULL COMMENT '历史PV',
  `total_uv` int DEFAULT NULL COMMENT '历史UV',
  `total_uip` int DEFAULT NULL COMMENT '历史uip',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `del_time` bigint DEFAULT NULL COMMENT '删除时间戳',
  `del_flag` tinyint(1) DEFAULT '0' COMMENT '软删除标识',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unqiue_full_short_url` (`full_short_url`,`del_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Table structure for t_link_11
-- ----------------------------
DROP TABLE IF EXISTS `t_link_11`;
CREATE TABLE `t_link_11` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `domain` varchar(128) DEFAULT NULL COMMENT '域名',
  `short_uri` varchar(8) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL COMMENT '短链接',
  `full_short_url` varchar(128) DEFAULT NULL COMMENT '完整短链接',
  `origin_url` varchar(1024) DEFAULT NULL COMMENT '原始链接',
  `click_num` int DEFAULT '0' COMMENT '点击量',
  `gid` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT 'default' COMMENT '短链接分组标识',
  `favicon` varchar(256) DEFAULT NULL COMMENT '网站图标',
  `enable_status` tinyint(1) DEFAULT '0' COMMENT '启用标识 0：启用，1:未启用',
  `create_type` tinyint(1) DEFAULT NULL COMMENT '创建类型',
  `valid_date_type` tinyint(1) DEFAULT NULL COMMENT '有效期类型',
  `valid_date` datetime DEFAULT NULL COMMENT '有效期',
  `describe` varchar(1024) DEFAULT NULL COMMENT '描述',
  `total_pv` int DEFAULT NULL COMMENT '历史PV',
  `total_uv` int DEFAULT NULL COMMENT '历史UV',
  `total_uip` int DEFAULT NULL COMMENT '历史uip',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `del_time` bigint DEFAULT NULL COMMENT '删除时间戳',
  `del_flag` tinyint(1) DEFAULT '0' COMMENT '软删除标识',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unqiue_full_short_url` (`full_short_url`,`del_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Table structure for t_link_12
-- ----------------------------
DROP TABLE IF EXISTS `t_link_12`;
CREATE TABLE `t_link_12` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `domain` varchar(128) DEFAULT NULL COMMENT '域名',
  `short_uri` varchar(8) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL COMMENT '短链接',
  `full_short_url` varchar(128) DEFAULT NULL COMMENT '完整短链接',
  `origin_url` varchar(1024) DEFAULT NULL COMMENT '原始链接',
  `click_num` int DEFAULT '0' COMMENT '点击量',
  `gid` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT 'default' COMMENT '短链接分组标识',
  `favicon` varchar(256) DEFAULT NULL COMMENT '网站图标',
  `enable_status` tinyint(1) DEFAULT '0' COMMENT '启用标识 0：启用，1:未启用',
  `create_type` tinyint(1) DEFAULT NULL COMMENT '创建类型',
  `valid_date_type` tinyint(1) DEFAULT NULL COMMENT '有效期类型',
  `valid_date` datetime DEFAULT NULL COMMENT '有效期',
  `describe` varchar(1024) DEFAULT NULL COMMENT '描述',
  `total_pv` int DEFAULT NULL COMMENT '历史PV',
  `total_uv` int DEFAULT NULL COMMENT '历史UV',
  `total_uip` int DEFAULT NULL COMMENT '历史uip',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `del_time` bigint DEFAULT NULL COMMENT '删除时间戳',
  `del_flag` tinyint(1) DEFAULT '0' COMMENT '软删除标识',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unqiue_full_short_url` (`full_short_url`,`del_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Table structure for t_link_13
-- ----------------------------
DROP TABLE IF EXISTS `t_link_13`;
CREATE TABLE `t_link_13` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `domain` varchar(128) DEFAULT NULL COMMENT '域名',
  `short_uri` varchar(8) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL COMMENT '短链接',
  `full_short_url` varchar(128) DEFAULT NULL COMMENT '完整短链接',
  `origin_url` varchar(1024) DEFAULT NULL COMMENT '原始链接',
  `click_num` int DEFAULT '0' COMMENT '点击量',
  `gid` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT 'default' COMMENT '短链接分组标识',
  `favicon` varchar(256) DEFAULT NULL COMMENT '网站图标',
  `enable_status` tinyint(1) DEFAULT '0' COMMENT '启用标识 0：启用，1:未启用',
  `create_type` tinyint(1) DEFAULT NULL COMMENT '创建类型',
  `valid_date_type` tinyint(1) DEFAULT NULL COMMENT '有效期类型',
  `valid_date` datetime DEFAULT NULL COMMENT '有效期',
  `describe` varchar(1024) DEFAULT NULL COMMENT '描述',
  `total_pv` int DEFAULT NULL COMMENT '历史PV',
  `total_uv` int DEFAULT NULL COMMENT '历史UV',
  `total_uip` int DEFAULT NULL COMMENT '历史uip',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `del_time` bigint DEFAULT NULL COMMENT '删除时间戳',
  `del_flag` tinyint(1) DEFAULT '0' COMMENT '软删除标识',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unqiue_full_short_url` (`full_short_url`,`del_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Table structure for t_link_14
-- ----------------------------
DROP TABLE IF EXISTS `t_link_14`;
CREATE TABLE `t_link_14` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `domain` varchar(128) DEFAULT NULL COMMENT '域名',
  `short_uri` varchar(8) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL COMMENT '短链接',
  `full_short_url` varchar(128) DEFAULT NULL COMMENT '完整短链接',
  `origin_url` varchar(1024) DEFAULT NULL COMMENT '原始链接',
  `click_num` int DEFAULT '0' COMMENT '点击量',
  `gid` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT 'default' COMMENT '短链接分组标识',
  `favicon` varchar(256) DEFAULT NULL COMMENT '网站图标',
  `enable_status` tinyint(1) DEFAULT '0' COMMENT '启用标识 0：启用，1:未启用',
  `create_type` tinyint(1) DEFAULT NULL COMMENT '创建类型',
  `valid_date_type` tinyint(1) DEFAULT NULL COMMENT '有效期类型',
  `valid_date` datetime DEFAULT NULL COMMENT '有效期',
  `describe` varchar(1024) DEFAULT NULL COMMENT '描述',
  `total_pv` int DEFAULT NULL COMMENT '历史PV',
  `total_uv` int DEFAULT NULL COMMENT '历史UV',
  `total_uip` int DEFAULT NULL COMMENT '历史uip',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `del_time` bigint DEFAULT NULL COMMENT '删除时间戳',
  `del_flag` tinyint(1) DEFAULT '0' COMMENT '软删除标识',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unqiue_full_short_url` (`full_short_url`,`del_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Table structure for t_link_15
-- ----------------------------
DROP TABLE IF EXISTS `t_link_15`;
CREATE TABLE `t_link_15` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `domain` varchar(128) DEFAULT NULL COMMENT '域名',
  `short_uri` varchar(8) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL COMMENT '短链接',
  `full_short_url` varchar(128) DEFAULT NULL COMMENT '完整短链接',
  `origin_url` varchar(1024) DEFAULT NULL COMMENT '原始链接',
  `click_num` int DEFAULT '0' COMMENT '点击量',
  `gid` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT 'default' COMMENT '短链接分组标识',
  `favicon` varchar(256) DEFAULT NULL COMMENT '网站图标',
  `enable_status` tinyint(1) DEFAULT '0' COMMENT '启用标识 0：启用，1:未启用',
  `create_type` tinyint(1) DEFAULT NULL COMMENT '创建类型',
  `valid_date_type` tinyint(1) DEFAULT NULL COMMENT '有效期类型',
  `valid_date` datetime DEFAULT NULL COMMENT '有效期',
  `describe` varchar(1024) DEFAULT NULL COMMENT '描述',
  `total_pv` int DEFAULT NULL COMMENT '历史PV',
  `total_uv` int DEFAULT NULL COMMENT '历史UV',
  `total_uip` int DEFAULT NULL COMMENT '历史uip',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `del_time` bigint DEFAULT NULL COMMENT '删除时间戳',
  `del_flag` tinyint(1) DEFAULT '0' COMMENT '软删除标识',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unqiue_full_short_url` (`full_short_url`,`del_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Table structure for t_link_2
-- ----------------------------
DROP TABLE IF EXISTS `t_link_2`;
CREATE TABLE `t_link_2` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `domain` varchar(128) DEFAULT NULL COMMENT '域名',
  `short_uri` varchar(8) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL COMMENT '短链接',
  `full_short_url` varchar(128) DEFAULT NULL COMMENT '完整短链接',
  `origin_url` varchar(1024) DEFAULT NULL COMMENT '原始链接',
  `click_num` int DEFAULT '0' COMMENT '点击量',
  `gid` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT 'default' COMMENT '短链接分组标识',
  `favicon` varchar(256) DEFAULT NULL COMMENT '网站图标',
  `enable_status` tinyint(1) DEFAULT '0' COMMENT '启用标识 0：启用，1:未启用',
  `create_type` tinyint(1) DEFAULT NULL COMMENT '创建类型',
  `valid_date_type` tinyint(1) DEFAULT NULL COMMENT '有效期类型',
  `valid_date` datetime DEFAULT NULL COMMENT '有效期',
  `describe` varchar(1024) DEFAULT NULL COMMENT '描述',
  `total_pv` int DEFAULT NULL COMMENT '历史PV',
  `total_uv` int DEFAULT NULL COMMENT '历史UV',
  `total_uip` int DEFAULT NULL COMMENT '历史uip',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `del_time` bigint DEFAULT NULL COMMENT '删除时间戳',
  `del_flag` tinyint(1) DEFAULT '0' COMMENT '软删除标识',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unqiue_full_short_url` (`full_short_url`,`del_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Table structure for t_link_3
-- ----------------------------
DROP TABLE IF EXISTS `t_link_3`;
CREATE TABLE `t_link_3` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `domain` varchar(128) DEFAULT NULL COMMENT '域名',
  `short_uri` varchar(8) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL COMMENT '短链接',
  `full_short_url` varchar(128) DEFAULT NULL COMMENT '完整短链接',
  `origin_url` varchar(1024) DEFAULT NULL COMMENT '原始链接',
  `click_num` int DEFAULT '0' COMMENT '点击量',
  `gid` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT 'default' COMMENT '短链接分组标识',
  `favicon` varchar(256) DEFAULT NULL COMMENT '网站图标',
  `enable_status` tinyint(1) DEFAULT '0' COMMENT '启用标识 0：启用，1:未启用',
  `create_type` tinyint(1) DEFAULT NULL COMMENT '创建类型',
  `valid_date_type` tinyint(1) DEFAULT NULL COMMENT '有效期类型',
  `valid_date` datetime DEFAULT NULL COMMENT '有效期',
  `describe` varchar(1024) DEFAULT NULL COMMENT '描述',
  `total_pv` int DEFAULT NULL COMMENT '历史PV',
  `total_uv` int DEFAULT NULL COMMENT '历史UV',
  `total_uip` int DEFAULT NULL COMMENT '历史uip',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `del_time` bigint DEFAULT NULL COMMENT '删除时间戳',
  `del_flag` tinyint(1) DEFAULT '0' COMMENT '软删除标识',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unqiue_full_short_url` (`full_short_url`,`del_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Table structure for t_link_4
-- ----------------------------
DROP TABLE IF EXISTS `t_link_4`;
CREATE TABLE `t_link_4` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `domain` varchar(128) DEFAULT NULL COMMENT '域名',
  `short_uri` varchar(8) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL COMMENT '短链接',
  `full_short_url` varchar(128) DEFAULT NULL COMMENT '完整短链接',
  `origin_url` varchar(1024) DEFAULT NULL COMMENT '原始链接',
  `click_num` int DEFAULT '0' COMMENT '点击量',
  `gid` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT 'default' COMMENT '短链接分组标识',
  `favicon` varchar(256) DEFAULT NULL COMMENT '网站图标',
  `enable_status` tinyint(1) DEFAULT '0' COMMENT '启用标识 0：启用，1:未启用',
  `create_type` tinyint(1) DEFAULT NULL COMMENT '创建类型',
  `valid_date_type` tinyint(1) DEFAULT NULL COMMENT '有效期类型',
  `valid_date` datetime DEFAULT NULL COMMENT '有效期',
  `describe` varchar(1024) DEFAULT NULL COMMENT '描述',
  `total_pv` int DEFAULT NULL COMMENT '历史PV',
  `total_uv` int DEFAULT NULL COMMENT '历史UV',
  `total_uip` int DEFAULT NULL COMMENT '历史uip',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `del_time` bigint DEFAULT NULL COMMENT '删除时间戳',
  `del_flag` tinyint(1) DEFAULT '0' COMMENT '软删除标识',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unqiue_full_short_url` (`full_short_url`,`del_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Table structure for t_link_5
-- ----------------------------
DROP TABLE IF EXISTS `t_link_5`;
CREATE TABLE `t_link_5` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `domain` varchar(128) DEFAULT NULL COMMENT '域名',
  `short_uri` varchar(8) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL COMMENT '短链接',
  `full_short_url` varchar(128) DEFAULT NULL COMMENT '完整短链接',
  `origin_url` varchar(1024) DEFAULT NULL COMMENT '原始链接',
  `click_num` int DEFAULT '0' COMMENT '点击量',
  `gid` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT 'default' COMMENT '短链接分组标识',
  `favicon` varchar(256) DEFAULT NULL COMMENT '网站图标',
  `enable_status` tinyint(1) DEFAULT '0' COMMENT '启用标识 0：启用，1:未启用',
  `create_type` tinyint(1) DEFAULT NULL COMMENT '创建类型',
  `valid_date_type` tinyint(1) DEFAULT NULL COMMENT '有效期类型',
  `valid_date` datetime DEFAULT NULL COMMENT '有效期',
  `describe` varchar(1024) DEFAULT NULL COMMENT '描述',
  `total_pv` int DEFAULT NULL COMMENT '历史PV',
  `total_uv` int DEFAULT NULL COMMENT '历史UV',
  `total_uip` int DEFAULT NULL COMMENT '历史uip',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `del_time` bigint DEFAULT NULL COMMENT '删除时间戳',
  `del_flag` tinyint(1) DEFAULT '0' COMMENT '软删除标识',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unqiue_full_short_url` (`full_short_url`,`del_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Table structure for t_link_6
-- ----------------------------
DROP TABLE IF EXISTS `t_link_6`;
CREATE TABLE `t_link_6` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `domain` varchar(128) DEFAULT NULL COMMENT '域名',
  `short_uri` varchar(8) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL COMMENT '短链接',
  `full_short_url` varchar(128) DEFAULT NULL COMMENT '完整短链接',
  `origin_url` varchar(1024) DEFAULT NULL COMMENT '原始链接',
  `click_num` int DEFAULT '0' COMMENT '点击量',
  `gid` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT 'default' COMMENT '短链接分组标识',
  `favicon` varchar(256) DEFAULT NULL COMMENT '网站图标',
  `enable_status` tinyint(1) DEFAULT '0' COMMENT '启用标识 0：启用，1:未启用',
  `create_type` tinyint(1) DEFAULT NULL COMMENT '创建类型',
  `valid_date_type` tinyint(1) DEFAULT NULL COMMENT '有效期类型',
  `valid_date` datetime DEFAULT NULL COMMENT '有效期',
  `describe` varchar(1024) DEFAULT NULL COMMENT '描述',
  `total_pv` int DEFAULT NULL COMMENT '历史PV',
  `total_uv` int DEFAULT NULL COMMENT '历史UV',
  `total_uip` int DEFAULT NULL COMMENT '历史uip',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `del_time` bigint DEFAULT NULL COMMENT '删除时间戳',
  `del_flag` tinyint(1) DEFAULT '0' COMMENT '软删除标识',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unqiue_full_short_url` (`full_short_url`,`del_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Table structure for t_link_7
-- ----------------------------
DROP TABLE IF EXISTS `t_link_7`;
CREATE TABLE `t_link_7` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `domain` varchar(128) DEFAULT NULL COMMENT '域名',
  `short_uri` varchar(8) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL COMMENT '短链接',
  `full_short_url` varchar(128) DEFAULT NULL COMMENT '完整短链接',
  `origin_url` varchar(1024) DEFAULT NULL COMMENT '原始链接',
  `click_num` int DEFAULT '0' COMMENT '点击量',
  `gid` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT 'default' COMMENT '短链接分组标识',
  `favicon` varchar(256) DEFAULT NULL COMMENT '网站图标',
  `enable_status` tinyint(1) DEFAULT '0' COMMENT '启用标识 0：启用，1:未启用',
  `create_type` tinyint(1) DEFAULT NULL COMMENT '创建类型',
  `valid_date_type` tinyint(1) DEFAULT NULL COMMENT '有效期类型',
  `valid_date` datetime DEFAULT NULL COMMENT '有效期',
  `describe` varchar(1024) DEFAULT NULL COMMENT '描述',
  `total_pv` int DEFAULT NULL COMMENT '历史PV',
  `total_uv` int DEFAULT NULL COMMENT '历史UV',
  `total_uip` int DEFAULT NULL COMMENT '历史uip',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `del_time` bigint DEFAULT NULL COMMENT '删除时间戳',
  `del_flag` tinyint(1) DEFAULT '0' COMMENT '软删除标识',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unqiue_full_short_url` (`full_short_url`,`del_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Table structure for t_link_8
-- ----------------------------
DROP TABLE IF EXISTS `t_link_8`;
CREATE TABLE `t_link_8` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `domain` varchar(128) DEFAULT NULL COMMENT '域名',
  `short_uri` varchar(8) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL COMMENT '短链接',
  `full_short_url` varchar(128) DEFAULT NULL COMMENT '完整短链接',
  `origin_url` varchar(1024) DEFAULT NULL COMMENT '原始链接',
  `click_num` int DEFAULT '0' COMMENT '点击量',
  `gid` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT 'default' COMMENT '短链接分组标识',
  `favicon` varchar(256) DEFAULT NULL COMMENT '网站图标',
  `enable_status` tinyint(1) DEFAULT '0' COMMENT '启用标识 0：启用，1:未启用',
  `create_type` tinyint(1) DEFAULT NULL COMMENT '创建类型',
  `valid_date_type` tinyint(1) DEFAULT NULL COMMENT '有效期类型',
  `valid_date` datetime DEFAULT NULL COMMENT '有效期',
  `describe` varchar(1024) DEFAULT NULL COMMENT '描述',
  `total_pv` int DEFAULT NULL COMMENT '历史PV',
  `total_uv` int DEFAULT NULL COMMENT '历史UV',
  `total_uip` int DEFAULT NULL COMMENT '历史uip',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `del_time` bigint DEFAULT NULL COMMENT '删除时间戳',
  `del_flag` tinyint(1) DEFAULT '0' COMMENT '软删除标识',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unqiue_full_short_url` (`full_short_url`,`del_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Table structure for t_link_9
-- ----------------------------
DROP TABLE IF EXISTS `t_link_9`;
CREATE TABLE `t_link_9` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `domain` varchar(128) DEFAULT NULL COMMENT '域名',
  `short_uri` varchar(8) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL COMMENT '短链接',
  `full_short_url` varchar(128) DEFAULT NULL COMMENT '完整短链接',
  `origin_url` varchar(1024) DEFAULT NULL COMMENT '原始链接',
  `click_num` int DEFAULT '0' COMMENT '点击量',
  `gid` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT 'default' COMMENT '短链接分组标识',
  `favicon` varchar(256) DEFAULT NULL COMMENT '网站图标',
  `enable_status` tinyint(1) DEFAULT '0' COMMENT '启用标识 0：启用，1:未启用',
  `create_type` tinyint(1) DEFAULT NULL COMMENT '创建类型',
  `valid_date_type` tinyint(1) DEFAULT NULL COMMENT '有效期类型',
  `valid_date` datetime DEFAULT NULL COMMENT '有效期',
  `describe` varchar(1024) DEFAULT NULL COMMENT '描述',
  `total_pv` int DEFAULT NULL COMMENT '历史PV',
  `total_uv` int DEFAULT NULL COMMENT '历史UV',
  `total_uip` int DEFAULT NULL COMMENT '历史uip',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `del_time` bigint DEFAULT NULL COMMENT '删除时间戳',
  `del_flag` tinyint(1) DEFAULT '0' COMMENT '软删除标识',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unqiue_full_short_url` (`full_short_url`,`del_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Table structure for t_link_access_logs
-- ----------------------------
DROP TABLE IF EXISTS `t_link_access_logs`;
CREATE TABLE `t_link_access_logs` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `ip` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'IP',
  `full_short_url` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '完整短链接',
  `gid` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '分组标识',
  `user` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '用户信息',
  `browser` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '浏览器',
  `os` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '操作系统',
  `network` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '访问网络',
  `device` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '访问设备',
  `locale` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '地区',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `del_flag` tinyint(1) DEFAULT NULL COMMENT '删除标识 0：未删除 1：已删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=167 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Table structure for t_link_access_stats
-- ----------------------------
DROP TABLE IF EXISTS `t_link_access_stats`;
CREATE TABLE `t_link_access_stats` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `full_short_url` varchar(128) DEFAULT NULL COMMENT '完整短链接',
  `gid` varchar(32) DEFAULT NULL COMMENT '分组标识',
  `date` date DEFAULT NULL COMMENT '日期',
  `pv` int DEFAULT NULL COMMENT '访问量',
  `uv` int DEFAULT NULL COMMENT '独立访客数量',
  `uip` int DEFAULT NULL COMMENT '独立ip数',
  `hour` int DEFAULT NULL COMMENT '小时',
  `weekday` int DEFAULT NULL COMMENT '星期',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `del_flag` tinyint(1) DEFAULT '0' COMMENT '删除标识，0：未删除，1：已删除',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_unique_access_stats` (`full_short_url`,`gid`,`weekday`,`hour`)
) ENGINE=InnoDB AUTO_INCREMENT=229 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Table structure for t_link_browser_stats
-- ----------------------------
DROP TABLE IF EXISTS `t_link_browser_stats`;
CREATE TABLE `t_link_browser_stats` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `full_short_url` varchar(128) DEFAULT NULL COMMENT '完整短链接',
  `gid` varchar(32) DEFAULT 'default' COMMENT '分组标识',
  `date` date DEFAULT NULL COMMENT '日期',
  `cnt` int DEFAULT NULL COMMENT '访问量',
  `browser` varchar(64) DEFAULT NULL COMMENT '浏览器',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `del_flag` tinyint(1) DEFAULT NULL COMMENT '删除标识 0：未删除 1：已删除',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_unique_browser_stats` (`full_short_url`,`gid`,`date`,`browser`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=177 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Table structure for t_link_device_stats
-- ----------------------------
DROP TABLE IF EXISTS `t_link_device_stats`;
CREATE TABLE `t_link_device_stats` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `full_short_url` varchar(128) DEFAULT NULL COMMENT '完整短链接',
  `gid` varchar(32) DEFAULT 'default' COMMENT '分组标识',
  `date` date DEFAULT NULL COMMENT '日期',
  `cnt` int DEFAULT NULL COMMENT '访问量',
  `device` varchar(64) DEFAULT NULL COMMENT '访问设备',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `del_flag` tinyint(1) DEFAULT NULL COMMENT '删除标识 0：未删除 1：已删除',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_unique_browser_stats` (`full_short_url`,`gid`,`date`,`device`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=156 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Table structure for t_link_goto_0
-- ----------------------------
DROP TABLE IF EXISTS `t_link_goto_0`;
CREATE TABLE `t_link_goto_0` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `gid` varchar(32) DEFAULT NULL,
  `full_short_url` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Table structure for t_link_goto_1
-- ----------------------------
DROP TABLE IF EXISTS `t_link_goto_1`;
CREATE TABLE `t_link_goto_1` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `gid` varchar(32) DEFAULT NULL,
  `full_short_url` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Table structure for t_link_goto_10
-- ----------------------------
DROP TABLE IF EXISTS `t_link_goto_10`;
CREATE TABLE `t_link_goto_10` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `gid` varchar(32) DEFAULT NULL,
  `full_short_url` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Table structure for t_link_goto_11
-- ----------------------------
DROP TABLE IF EXISTS `t_link_goto_11`;
CREATE TABLE `t_link_goto_11` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `gid` varchar(32) DEFAULT NULL,
  `full_short_url` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Table structure for t_link_goto_12
-- ----------------------------
DROP TABLE IF EXISTS `t_link_goto_12`;
CREATE TABLE `t_link_goto_12` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `gid` varchar(32) DEFAULT NULL,
  `full_short_url` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Table structure for t_link_goto_13
-- ----------------------------
DROP TABLE IF EXISTS `t_link_goto_13`;
CREATE TABLE `t_link_goto_13` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `gid` varchar(32) DEFAULT NULL,
  `full_short_url` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Table structure for t_link_goto_14
-- ----------------------------
DROP TABLE IF EXISTS `t_link_goto_14`;
CREATE TABLE `t_link_goto_14` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `gid` varchar(32) DEFAULT NULL,
  `full_short_url` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Table structure for t_link_goto_15
-- ----------------------------
DROP TABLE IF EXISTS `t_link_goto_15`;
CREATE TABLE `t_link_goto_15` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `gid` varchar(32) DEFAULT NULL,
  `full_short_url` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Table structure for t_link_goto_2
-- ----------------------------
DROP TABLE IF EXISTS `t_link_goto_2`;
CREATE TABLE `t_link_goto_2` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `gid` varchar(32) DEFAULT NULL,
  `full_short_url` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Table structure for t_link_goto_3
-- ----------------------------
DROP TABLE IF EXISTS `t_link_goto_3`;
CREATE TABLE `t_link_goto_3` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `gid` varchar(32) DEFAULT NULL,
  `full_short_url` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Table structure for t_link_goto_4
-- ----------------------------
DROP TABLE IF EXISTS `t_link_goto_4`;
CREATE TABLE `t_link_goto_4` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `gid` varchar(32) DEFAULT NULL,
  `full_short_url` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Table structure for t_link_goto_5
-- ----------------------------
DROP TABLE IF EXISTS `t_link_goto_5`;
CREATE TABLE `t_link_goto_5` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `gid` varchar(32) DEFAULT NULL,
  `full_short_url` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Table structure for t_link_goto_6
-- ----------------------------
DROP TABLE IF EXISTS `t_link_goto_6`;
CREATE TABLE `t_link_goto_6` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `gid` varchar(32) DEFAULT NULL,
  `full_short_url` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Table structure for t_link_goto_7
-- ----------------------------
DROP TABLE IF EXISTS `t_link_goto_7`;
CREATE TABLE `t_link_goto_7` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `gid` varchar(32) DEFAULT NULL,
  `full_short_url` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Table structure for t_link_goto_8
-- ----------------------------
DROP TABLE IF EXISTS `t_link_goto_8`;
CREATE TABLE `t_link_goto_8` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `gid` varchar(32) DEFAULT NULL,
  `full_short_url` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Table structure for t_link_goto_9
-- ----------------------------
DROP TABLE IF EXISTS `t_link_goto_9`;
CREATE TABLE `t_link_goto_9` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `gid` varchar(32) DEFAULT NULL,
  `full_short_url` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Table structure for t_link_locale_stats
-- ----------------------------
DROP TABLE IF EXISTS `t_link_locale_stats`;
CREATE TABLE `t_link_locale_stats` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `full_short_url` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '完整短链接',
  `gid` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '分组标识',
  `date` date DEFAULT NULL COMMENT '日期',
  `cnt` int DEFAULT NULL COMMENT '访问量',
  `province` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '省份名称',
  `city` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '市名称',
  `adcode` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '城市编码',
  `country` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '国家标识',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `del_flag` tinyint(1) DEFAULT NULL COMMENT '删除标识 0表示删除 1表示未删除',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_unique_locale_stats` (`full_short_url`,`gid`,`date`,`adcode`,`province`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=178 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Table structure for t_link_network_stats
-- ----------------------------
DROP TABLE IF EXISTS `t_link_network_stats`;
CREATE TABLE `t_link_network_stats` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `full_short_url` varchar(128) DEFAULT NULL COMMENT '完整短链接',
  `gid` varchar(32) DEFAULT 'default' COMMENT '分组标识',
  `date` date DEFAULT NULL COMMENT '日期',
  `cnt` int DEFAULT NULL COMMENT '访问量',
  `network` varchar(64) DEFAULT NULL COMMENT '访问网络',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `del_flag` tinyint(1) DEFAULT NULL COMMENT '删除标识 0：未删除 1：已删除',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_unique_browser_stats` (`full_short_url`,`gid`,`date`,`network`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=154 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Table structure for t_link_os_stats
-- ----------------------------
DROP TABLE IF EXISTS `t_link_os_stats`;
CREATE TABLE `t_link_os_stats` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `full_short_url` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '完整短链接',
  `gid` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '分组标识',
  `date` date DEFAULT NULL COMMENT '日期',
  `cnt` int DEFAULT NULL COMMENT '访问量',
  `os` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '操作系统',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `del_flag` tinyint(1) DEFAULT NULL COMMENT '删除标识 0表示删除 1表示未删除',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_unique_locale_stats` (`full_short_url`,`gid`,`date`,`os`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=172 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='短链接监控操作系统访问状态';

-- ----------------------------
-- Table structure for t_link_stats_today_0
-- ----------------------------
DROP TABLE IF EXISTS `t_link_stats_today_0`;
CREATE TABLE `t_link_stats_today_0` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `gid` varchar(32) DEFAULT 'default' COMMENT '分组标识',
  `full_short_url` varchar(128) DEFAULT NULL COMMENT '短链接',
  `date` date DEFAULT NULL COMMENT '日期',
  `today_pv` int DEFAULT '0' COMMENT '今日PV',
  `today_uv` int DEFAULT '0' COMMENT '今日UV',
  `today_uip` int DEFAULT '0' COMMENT '今日IP数',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `del_flag` tinyint(1) DEFAULT NULL COMMENT '删除标识 0：未删除 1：已删除',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_unique_full-short-url` (`full_short_url`,`gid`,`date`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Table structure for t_link_stats_today_1
-- ----------------------------
DROP TABLE IF EXISTS `t_link_stats_today_1`;
CREATE TABLE `t_link_stats_today_1` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `gid` varchar(32) DEFAULT 'default' COMMENT '分组标识',
  `full_short_url` varchar(128) DEFAULT NULL COMMENT '短链接',
  `date` date DEFAULT NULL COMMENT '日期',
  `today_pv` int DEFAULT '0' COMMENT '今日PV',
  `today_uv` int DEFAULT '0' COMMENT '今日UV',
  `today_uip` int DEFAULT '0' COMMENT '今日IP数',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `del_flag` tinyint(1) DEFAULT NULL COMMENT '删除标识 0：未删除 1：已删除',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_unique_full-short-url` (`full_short_url`,`gid`,`date`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Table structure for t_link_stats_today_10
-- ----------------------------
DROP TABLE IF EXISTS `t_link_stats_today_10`;
CREATE TABLE `t_link_stats_today_10` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `gid` varchar(32) DEFAULT 'default' COMMENT '分组标识',
  `full_short_url` varchar(128) DEFAULT NULL COMMENT '短链接',
  `date` date DEFAULT NULL COMMENT '日期',
  `today_pv` int DEFAULT '0' COMMENT '今日PV',
  `today_uv` int DEFAULT '0' COMMENT '今日UV',
  `today_uip` int DEFAULT '0' COMMENT '今日IP数',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `del_flag` tinyint(1) DEFAULT NULL COMMENT '删除标识 0：未删除 1：已删除',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_unique_full-short-url` (`full_short_url`,`gid`,`date`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Table structure for t_link_stats_today_11
-- ----------------------------
DROP TABLE IF EXISTS `t_link_stats_today_11`;
CREATE TABLE `t_link_stats_today_11` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `gid` varchar(32) DEFAULT 'default' COMMENT '分组标识',
  `full_short_url` varchar(128) DEFAULT NULL COMMENT '短链接',
  `date` date DEFAULT NULL COMMENT '日期',
  `today_pv` int DEFAULT '0' COMMENT '今日PV',
  `today_uv` int DEFAULT '0' COMMENT '今日UV',
  `today_uip` int DEFAULT '0' COMMENT '今日IP数',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `del_flag` tinyint(1) DEFAULT NULL COMMENT '删除标识 0：未删除 1：已删除',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_unique_full-short-url` (`full_short_url`,`gid`,`date`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Table structure for t_link_stats_today_12
-- ----------------------------
DROP TABLE IF EXISTS `t_link_stats_today_12`;
CREATE TABLE `t_link_stats_today_12` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `gid` varchar(32) DEFAULT 'default' COMMENT '分组标识',
  `full_short_url` varchar(128) DEFAULT NULL COMMENT '短链接',
  `date` date DEFAULT NULL COMMENT '日期',
  `today_pv` int DEFAULT '0' COMMENT '今日PV',
  `today_uv` int DEFAULT '0' COMMENT '今日UV',
  `today_uip` int DEFAULT '0' COMMENT '今日IP数',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `del_flag` tinyint(1) DEFAULT NULL COMMENT '删除标识 0：未删除 1：已删除',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_unique_full-short-url` (`full_short_url`,`gid`,`date`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Table structure for t_link_stats_today_13
-- ----------------------------
DROP TABLE IF EXISTS `t_link_stats_today_13`;
CREATE TABLE `t_link_stats_today_13` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `gid` varchar(32) DEFAULT 'default' COMMENT '分组标识',
  `full_short_url` varchar(128) DEFAULT NULL COMMENT '短链接',
  `date` date DEFAULT NULL COMMENT '日期',
  `today_pv` int DEFAULT '0' COMMENT '今日PV',
  `today_uv` int DEFAULT '0' COMMENT '今日UV',
  `today_uip` int DEFAULT '0' COMMENT '今日IP数',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `del_flag` tinyint(1) DEFAULT NULL COMMENT '删除标识 0：未删除 1：已删除',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_unique_full-short-url` (`full_short_url`,`gid`,`date`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Table structure for t_link_stats_today_14
-- ----------------------------
DROP TABLE IF EXISTS `t_link_stats_today_14`;
CREATE TABLE `t_link_stats_today_14` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `gid` varchar(32) DEFAULT 'default' COMMENT '分组标识',
  `full_short_url` varchar(128) DEFAULT NULL COMMENT '短链接',
  `date` date DEFAULT NULL COMMENT '日期',
  `today_pv` int DEFAULT '0' COMMENT '今日PV',
  `today_uv` int DEFAULT '0' COMMENT '今日UV',
  `today_uip` int DEFAULT '0' COMMENT '今日IP数',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `del_flag` tinyint(1) DEFAULT NULL COMMENT '删除标识 0：未删除 1：已删除',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_unique_full-short-url` (`full_short_url`,`gid`,`date`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Table structure for t_link_stats_today_15
-- ----------------------------
DROP TABLE IF EXISTS `t_link_stats_today_15`;
CREATE TABLE `t_link_stats_today_15` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `gid` varchar(32) DEFAULT 'default' COMMENT '分组标识',
  `full_short_url` varchar(128) DEFAULT NULL COMMENT '短链接',
  `date` date DEFAULT NULL COMMENT '日期',
  `today_pv` int DEFAULT '0' COMMENT '今日PV',
  `today_uv` int DEFAULT '0' COMMENT '今日UV',
  `today_uip` int DEFAULT '0' COMMENT '今日IP数',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `del_flag` tinyint(1) DEFAULT NULL COMMENT '删除标识 0：未删除 1：已删除',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_unique_full-short-url` (`full_short_url`,`gid`,`date`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Table structure for t_link_stats_today_2
-- ----------------------------
DROP TABLE IF EXISTS `t_link_stats_today_2`;
CREATE TABLE `t_link_stats_today_2` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `gid` varchar(32) DEFAULT 'default' COMMENT '分组标识',
  `full_short_url` varchar(128) DEFAULT NULL COMMENT '短链接',
  `date` date DEFAULT NULL COMMENT '日期',
  `today_pv` int DEFAULT '0' COMMENT '今日PV',
  `today_uv` int DEFAULT '0' COMMENT '今日UV',
  `today_uip` int DEFAULT '0' COMMENT '今日IP数',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `del_flag` tinyint(1) DEFAULT NULL COMMENT '删除标识 0：未删除 1：已删除',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_unique_full-short-url` (`full_short_url`,`gid`,`date`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Table structure for t_link_stats_today_3
-- ----------------------------
DROP TABLE IF EXISTS `t_link_stats_today_3`;
CREATE TABLE `t_link_stats_today_3` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `gid` varchar(32) DEFAULT 'default' COMMENT '分组标识',
  `full_short_url` varchar(128) DEFAULT NULL COMMENT '短链接',
  `date` date DEFAULT NULL COMMENT '日期',
  `today_pv` int DEFAULT '0' COMMENT '今日PV',
  `today_uv` int DEFAULT '0' COMMENT '今日UV',
  `today_uip` int DEFAULT '0' COMMENT '今日IP数',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `del_flag` tinyint(1) DEFAULT NULL COMMENT '删除标识 0：未删除 1：已删除',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_unique_full-short-url` (`full_short_url`,`gid`,`date`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Table structure for t_link_stats_today_4
-- ----------------------------
DROP TABLE IF EXISTS `t_link_stats_today_4`;
CREATE TABLE `t_link_stats_today_4` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `gid` varchar(32) DEFAULT 'default' COMMENT '分组标识',
  `full_short_url` varchar(128) DEFAULT NULL COMMENT '短链接',
  `date` date DEFAULT NULL COMMENT '日期',
  `today_pv` int DEFAULT '0' COMMENT '今日PV',
  `today_uv` int DEFAULT '0' COMMENT '今日UV',
  `today_uip` int DEFAULT '0' COMMENT '今日IP数',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `del_flag` tinyint(1) DEFAULT NULL COMMENT '删除标识 0：未删除 1：已删除',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_unique_full-short-url` (`full_short_url`,`gid`,`date`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Table structure for t_link_stats_today_5
-- ----------------------------
DROP TABLE IF EXISTS `t_link_stats_today_5`;
CREATE TABLE `t_link_stats_today_5` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `gid` varchar(32) DEFAULT 'default' COMMENT '分组标识',
  `full_short_url` varchar(128) DEFAULT NULL COMMENT '短链接',
  `date` date DEFAULT NULL COMMENT '日期',
  `today_pv` int DEFAULT '0' COMMENT '今日PV',
  `today_uv` int DEFAULT '0' COMMENT '今日UV',
  `today_uip` int DEFAULT '0' COMMENT '今日IP数',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `del_flag` tinyint(1) DEFAULT NULL COMMENT '删除标识 0：未删除 1：已删除',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_unique_full-short-url` (`full_short_url`,`gid`,`date`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Table structure for t_link_stats_today_6
-- ----------------------------
DROP TABLE IF EXISTS `t_link_stats_today_6`;
CREATE TABLE `t_link_stats_today_6` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `gid` varchar(32) DEFAULT 'default' COMMENT '分组标识',
  `full_short_url` varchar(128) DEFAULT NULL COMMENT '短链接',
  `date` date DEFAULT NULL COMMENT '日期',
  `today_pv` int DEFAULT '0' COMMENT '今日PV',
  `today_uv` int DEFAULT '0' COMMENT '今日UV',
  `today_uip` int DEFAULT '0' COMMENT '今日IP数',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `del_flag` tinyint(1) DEFAULT NULL COMMENT '删除标识 0：未删除 1：已删除',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_unique_full-short-url` (`full_short_url`,`gid`,`date`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Table structure for t_link_stats_today_7
-- ----------------------------
DROP TABLE IF EXISTS `t_link_stats_today_7`;
CREATE TABLE `t_link_stats_today_7` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `gid` varchar(32) DEFAULT 'default' COMMENT '分组标识',
  `full_short_url` varchar(128) DEFAULT NULL COMMENT '短链接',
  `date` date DEFAULT NULL COMMENT '日期',
  `today_pv` int DEFAULT '0' COMMENT '今日PV',
  `today_uv` int DEFAULT '0' COMMENT '今日UV',
  `today_uip` int DEFAULT '0' COMMENT '今日IP数',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `del_flag` tinyint(1) DEFAULT NULL COMMENT '删除标识 0：未删除 1：已删除',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_unique_full-short-url` (`full_short_url`,`gid`,`date`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Table structure for t_link_stats_today_8
-- ----------------------------
DROP TABLE IF EXISTS `t_link_stats_today_8`;
CREATE TABLE `t_link_stats_today_8` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `gid` varchar(32) DEFAULT 'default' COMMENT '分组标识',
  `full_short_url` varchar(128) DEFAULT NULL COMMENT '短链接',
  `date` date DEFAULT NULL COMMENT '日期',
  `today_pv` int DEFAULT '0' COMMENT '今日PV',
  `today_uv` int DEFAULT '0' COMMENT '今日UV',
  `today_uip` int DEFAULT '0' COMMENT '今日IP数',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `del_flag` tinyint(1) DEFAULT NULL COMMENT '删除标识 0：未删除 1：已删除',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_unique_full-short-url` (`full_short_url`,`gid`,`date`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Table structure for t_link_stats_today_9
-- ----------------------------
DROP TABLE IF EXISTS `t_link_stats_today_9`;
CREATE TABLE `t_link_stats_today_9` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `gid` varchar(32) DEFAULT 'default' COMMENT '分组标识',
  `full_short_url` varchar(128) DEFAULT NULL COMMENT '短链接',
  `date` date DEFAULT NULL COMMENT '日期',
  `today_pv` int DEFAULT '0' COMMENT '今日PV',
  `today_uv` int DEFAULT '0' COMMENT '今日UV',
  `today_uip` int DEFAULT '0' COMMENT '今日IP数',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `del_flag` tinyint(1) DEFAULT NULL COMMENT '删除标识 0：未删除 1：已删除',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_unique_full-short-url` (`full_short_url`,`gid`,`date`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Table structure for t_user_0
-- ----------------------------
DROP TABLE IF EXISTS `t_user_0`;
CREATE TABLE `t_user_0` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `real_name` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `mail` varchar(255) DEFAULT NULL,
  `delete_time` bigint DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `del_flag` tinyint(1) DEFAULT '0' COMMENT '删除标识，0：未删除，1：已删除',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_name` (`username`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Table structure for t_user_1
-- ----------------------------
DROP TABLE IF EXISTS `t_user_1`;
CREATE TABLE `t_user_1` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `real_name` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `mail` varchar(255) DEFAULT NULL,
  `delete_time` bigint DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `del_flag` tinyint(1) DEFAULT '0' COMMENT '删除标识，0：未删除，1：已删除',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_name` (`username`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Table structure for t_user_10
-- ----------------------------
DROP TABLE IF EXISTS `t_user_10`;
CREATE TABLE `t_user_10` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `real_name` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `mail` varchar(255) DEFAULT NULL,
  `delete_time` bigint DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `del_flag` tinyint(1) DEFAULT '0' COMMENT '删除标识，0：未删除，1：已删除',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_name` (`username`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Table structure for t_user_11
-- ----------------------------
DROP TABLE IF EXISTS `t_user_11`;
CREATE TABLE `t_user_11` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `real_name` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `mail` varchar(255) DEFAULT NULL,
  `delete_time` bigint DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `del_flag` tinyint(1) DEFAULT '0' COMMENT '删除标识，0：未删除，1：已删除',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_name` (`username`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Table structure for t_user_12
-- ----------------------------
DROP TABLE IF EXISTS `t_user_12`;
CREATE TABLE `t_user_12` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `real_name` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `mail` varchar(255) DEFAULT NULL,
  `delete_time` bigint DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `del_flag` tinyint(1) DEFAULT '0' COMMENT '删除标识，0：未删除，1：已删除',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_name` (`username`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Table structure for t_user_13
-- ----------------------------
DROP TABLE IF EXISTS `t_user_13`;
CREATE TABLE `t_user_13` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `real_name` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `mail` varchar(255) DEFAULT NULL,
  `delete_time` bigint DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `del_flag` tinyint(1) DEFAULT '0' COMMENT '删除标识，0：未删除，1：已删除',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_name` (`username`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Table structure for t_user_14
-- ----------------------------
DROP TABLE IF EXISTS `t_user_14`;
CREATE TABLE `t_user_14` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `real_name` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `mail` varchar(255) DEFAULT NULL,
  `delete_time` bigint DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `del_flag` tinyint(1) DEFAULT '0' COMMENT '删除标识，0：未删除，1：已删除',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_name` (`username`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Table structure for t_user_15
-- ----------------------------
DROP TABLE IF EXISTS `t_user_15`;
CREATE TABLE `t_user_15` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `real_name` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `mail` varchar(255) DEFAULT NULL,
  `delete_time` bigint DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `del_flag` tinyint(1) DEFAULT '0' COMMENT '删除标识，0：未删除，1：已删除',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_name` (`username`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1745305330809688068 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Table structure for t_user_2
-- ----------------------------
DROP TABLE IF EXISTS `t_user_2`;
CREATE TABLE `t_user_2` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `real_name` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `mail` varchar(255) DEFAULT NULL,
  `delete_time` bigint DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `del_flag` tinyint(1) DEFAULT '0' COMMENT '删除标识，0：未删除，1：已删除',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_name` (`username`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Table structure for t_user_3
-- ----------------------------
DROP TABLE IF EXISTS `t_user_3`;
CREATE TABLE `t_user_3` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `real_name` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `mail` varchar(255) DEFAULT NULL,
  `delete_time` bigint DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `del_flag` tinyint(1) DEFAULT '0' COMMENT '删除标识，0：未删除，1：已删除',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_name` (`username`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Table structure for t_user_4
-- ----------------------------
DROP TABLE IF EXISTS `t_user_4`;
CREATE TABLE `t_user_4` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `real_name` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `mail` varchar(255) DEFAULT NULL,
  `delete_time` bigint DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `del_flag` tinyint(1) DEFAULT '0' COMMENT '删除标识，0：未删除，1：已删除',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_name` (`username`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Table structure for t_user_5
-- ----------------------------
DROP TABLE IF EXISTS `t_user_5`;
CREATE TABLE `t_user_5` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `real_name` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `mail` varchar(255) DEFAULT NULL,
  `delete_time` bigint DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `del_flag` tinyint(1) DEFAULT '0' COMMENT '删除标识，0：未删除，1：已删除',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_name` (`username`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Table structure for t_user_6
-- ----------------------------
DROP TABLE IF EXISTS `t_user_6`;
CREATE TABLE `t_user_6` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `real_name` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `mail` varchar(255) DEFAULT NULL,
  `delete_time` bigint DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `del_flag` tinyint(1) DEFAULT '0' COMMENT '删除标识，0：未删除，1：已删除',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_name` (`username`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Table structure for t_user_7
-- ----------------------------
DROP TABLE IF EXISTS `t_user_7`;
CREATE TABLE `t_user_7` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `real_name` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `mail` varchar(255) DEFAULT NULL,
  `delete_time` bigint DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `del_flag` tinyint(1) DEFAULT '0' COMMENT '删除标识，0：未删除，1：已删除',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_name` (`username`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Table structure for t_user_8
-- ----------------------------
DROP TABLE IF EXISTS `t_user_8`;
CREATE TABLE `t_user_8` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `real_name` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `mail` varchar(255) DEFAULT NULL,
  `delete_time` bigint DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `del_flag` tinyint(1) DEFAULT '0' COMMENT '删除标识，0：未删除，1：已删除',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_name` (`username`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Table structure for t_user_9
-- ----------------------------
DROP TABLE IF EXISTS `t_user_9`;
CREATE TABLE `t_user_9` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `real_name` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `mail` varchar(255) DEFAULT NULL,
  `delete_time` bigint DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `del_flag` tinyint(1) DEFAULT '0' COMMENT '删除标识，0：未删除，1：已删除',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_name` (`username`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

SET FOREIGN_KEY_CHECKS = 1;
