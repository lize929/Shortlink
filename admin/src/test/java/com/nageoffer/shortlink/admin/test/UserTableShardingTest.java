package com.nageoffer.shortlink.admin.test;

public class UserTableShardingTest {

    public static final String SQL = "CREATE TABLE `t_link_%d` (\n" +
            "  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',\n" +
            "  `domain` varchar(128) DEFAULT NULL COMMENT '域名',\n" +
            "  `short_uri` varchar(8) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL COMMENT '短链接',\n" +
            "  `full_short_url` varchar(128) DEFAULT NULL COMMENT '完整短链接',\n" +
            "  `origin_url` varchar(1024) DEFAULT NULL COMMENT '原始链接',\n" +
            "  `click_num` int DEFAULT '0' COMMENT '点击量',\n" +
            "  `gid` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT 'default' COMMENT '短链接分组标识',\n" +
            "  `favicon` varchar(256) DEFAULT NULL COMMENT '网站图标',\n" +
            "  `enable_status` tinyint(1) DEFAULT '0' COMMENT '启用标识 0：启用，1:未启用',\n" +
            "  `create_type` tinyint(1) DEFAULT NULL COMMENT '创建类型',\n" +
            "  `valid_date_type` tinyint(1) DEFAULT NULL COMMENT '有效期类型',\n" +
            "  `valid_date` datetime DEFAULT NULL COMMENT '有效期',\n" +
            "  `describe` varchar(1024) DEFAULT NULL COMMENT '描述',\n" +
            "  `total_pv` int DEFAULT NULL COMMENT '历史PV',\n" +
            "  `total_uv` int DEFAULT NULL COMMENT '历史UV',\n" +
            "  `total_uip` int DEFAULT NULL COMMENT '历史uip',\n" +
            "  `create_time` datetime DEFAULT NULL COMMENT '创建时间',\n" +
            "  `update_time` datetime DEFAULT NULL COMMENT '修改时间',\n" +
            "  `del_time` bigint DEFAULT NULL COMMENT '删除时间戳',\n" +
            "  `del_flag` tinyint(1) DEFAULT '0' COMMENT '软删除标识',\n" +
            "  PRIMARY KEY (`id`),\n" +
            "  UNIQUE KEY `unqiue_full_short_url` (`full_short_url`,`del_time`) USING BTREE\n" +
            ") ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;";

    public static void main(String[] args) {
        for (int i =0;i < 16;i++){
            System.out.printf((SQL) + "%n",i);
        }
    }
}
