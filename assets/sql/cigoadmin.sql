-- MySQL dump 10.13  Distrib 8.0.22, for osx10.15 (x86_64)
--
-- Host: localhost    Database: cigoadmin
-- ------------------------------------------------------
-- Server version	8.0.22

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `cg_admin_log`
--

DROP TABLE IF EXISTS `cg_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cg_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '编号',
  `admin_id` int NOT NULL DEFAULT '0' COMMENT '管理员编号',
  `module` int NOT NULL DEFAULT '0' COMMENT '系统模块(区分后台)',
  `controller` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '控制器',
  `action` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '操作',
  `url` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '访问路径',
  `params` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '参数',
  `create_time` int NOT NULL DEFAULT '0' COMMENT '请求时间',
  `ip` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'IP地址',
  `client` tinyint NOT NULL DEFAULT '0' COMMENT '终端(1-PC;2-Android;3-IOS;4-微信；5-手机网页)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='管理员操作记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cg_admin_log`
--

LOCK TABLES `cg_admin_log` WRITE;
/*!40000 ALTER TABLE `cg_admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `cg_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cg_adv`
--

DROP TABLE IF EXISTS `cg_adv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cg_adv` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '编号',
  `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '标题',
  `img` int NOT NULL DEFAULT '0' COMMENT '图片',
  `position` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `target_type` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '目标数据类型',
  `target_info` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '跳转附属信息',
  `start_time` int NOT NULL DEFAULT '0' COMMENT '开始生效时间',
  `end_time` int NOT NULL DEFAULT '0' COMMENT '结束有效时间',
  `show_type` tinyint NOT NULL DEFAULT '0' COMMENT '展示类型',
  `status` tinyint NOT NULL DEFAULT '1' COMMENT '状态（-1-删除；0-不展示；1-展示）',
  `sort` int NOT NULL DEFAULT '100' COMMENT '排序',
  `create_time` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='广告表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cg_adv`
--

LOCK TABLES `cg_adv` WRITE;
/*!40000 ALTER TABLE `cg_adv` DISABLE KEYS */;
/*!40000 ALTER TABLE `cg_adv` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cg_comment`
--

DROP TABLE IF EXISTS `cg_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cg_comment` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '编号',
  `content_type` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '被评论数据类型（doc：文章；case：病例；video：视频)',
  `content_id` int NOT NULL DEFAULT '0' COMMENT '被评论数据编号',
  `link_id` int NOT NULL DEFAULT '0' COMMENT '其它关联编号：比如用于商城订单评价场景中关联订单编号',
  `score` tinyint NOT NULL DEFAULT '0' COMMENT '打分（打分详情汇总）',
  `score_info` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '打分详情（JSON字符串：key=>value形式）',
  `user_id` int NOT NULL DEFAULT '0' COMMENT '用户编号',
  `anonymous_flag` tinyint NOT NULL DEFAULT '0' COMMENT '匿名评论标识',
  `num_like` int unsigned NOT NULL DEFAULT '0' COMMENT '点赞数量',
  `num_report` int unsigned NOT NULL DEFAULT '0' COMMENT '举报数量',
  `img_show` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '[]' COMMENT '评论图片编号数组json',
  `comment` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '评论内容',
  `status` tinyint NOT NULL DEFAULT '1' COMMENT '状态（0-新发布待审核；1-已审核）',
  `create_time` int NOT NULL DEFAULT '0' COMMENT '评论时间',
  `verify_admin_id` int NOT NULL DEFAULT '0' COMMENT '审核管理员编号',
  `verify_time` int NOT NULL DEFAULT '0' COMMENT '审核时间',
  `reply_admin_id` int NOT NULL DEFAULT '0' COMMENT '回复管理员编号',
  `admin_reply_comment` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '管理员回复内容',
  `admin_reply_time` int NOT NULL DEFAULT '0' COMMENT '管理员回复时间',
  `attach_img_show` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '追评图片集合',
  `attach_comment` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '追评内容',
  `attach_status` tinyint NOT NULL DEFAULT '1' COMMENT '状态（0-新发布待审核；1-已审核）',
  `attach_time` int NOT NULL DEFAULT '1' COMMENT '追评时间',
  `attach_verify_admin_id` int NOT NULL DEFAULT '1' COMMENT '追评审核管理员编号',
  `attach_verify_time` int NOT NULL DEFAULT '1' COMMENT '追评审核时间',
  `attach_reply_admin_id` int NOT NULL DEFAULT '1' COMMENT '追评回复管理员编号',
  `attach_admin_reply_comment` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '追评管理员回复内容',
  `attach_admin_reply_time` int NOT NULL DEFAULT '0' COMMENT '追评管理员回复时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='评论表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cg_comment`
--

LOCK TABLES `cg_comment` WRITE;
/*!40000 ALTER TABLE `cg_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `cg_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cg_comment_interaction`
--

DROP TABLE IF EXISTS `cg_comment_interaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cg_comment_interaction` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '编号',
  `comment_id` int NOT NULL DEFAULT '0' COMMENT '隶属评论编号',
  `pid` int NOT NULL DEFAULT '0' COMMENT '父级编号（用于交互）',
  `user_id` int NOT NULL DEFAULT '0' COMMENT '用户编号',
  `target_user_id` int NOT NULL DEFAULT '0' COMMENT '被回复者编号',
  `comment` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '交互内容',
  `num_like` int unsigned NOT NULL DEFAULT '0' COMMENT '点赞数量',
  `num_report` int unsigned NOT NULL DEFAULT '0' COMMENT '举报数量',
  `status` tinyint NOT NULL DEFAULT '1' COMMENT '状态（0-新发布待审核；1-已审核）',
  `create_time` int NOT NULL DEFAULT '0' COMMENT '交互时间',
  `verify_admin_id` int NOT NULL DEFAULT '0' COMMENT '审核管理员编号',
  `verify_time` int NOT NULL DEFAULT '0' COMMENT '审核时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='评论下用户互动表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cg_comment_interaction`
--

LOCK TABLES `cg_comment_interaction` WRITE;
/*!40000 ALTER TABLE `cg_comment_interaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `cg_comment_interaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cg_files`
--

DROP TABLE IF EXISTS `cg_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cg_files` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id自增',
  `type` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'file' COMMENT '文件类型( file；img；video)',
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '文件全名',
  `prefix` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '文件名',
  `ext` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '文件后缀',
  `name_saved` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '保存名',
  `mime` varchar(2048) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '文件mime类型',
  `size` int NOT NULL DEFAULT '0' COMMENT '文件大小',
  `attach` varchar(2048) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '附属信息',
  `path` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '文件路径名',
  `path_cover` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '文件封面图片路径字符串',
  `thumb_small` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '图片缩略图-小',
  `thumb_middle` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '图片缩略图-中',
  `md5` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '文件md5',
  `sha1` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '文件 sha1编码',
  `hash` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '文件hash',
  `platform` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '上传平台(‘local’-本地服务器；’qiniu’-七牛云；’aliyun’-阿里云；’tencent’-腾讯云)',
  `platform_bucket` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `platform_key` varchar(2048) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '平台相关参数',
  `status` tinyint NOT NULL DEFAULT '1' COMMENT '状态(0-禁用；1-启用；-1：删除)',
  `create_time` int NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='上传文件表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cg_files`
--

LOCK TABLES `cg_files` WRITE;
/*!40000 ALTER TABLE `cg_files` DISABLE KEYS */;
/*!40000 ALTER TABLE `cg_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cg_friendly_links`
--

DROP TABLE IF EXISTS `cg_friendly_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cg_friendly_links` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `status` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '状态;1:显示;0:不显示',
  `rating` int NOT NULL DEFAULT '0' COMMENT '友情链接评级',
  `list_order` float NOT NULL DEFAULT '10000' COMMENT '排序',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '友情链接描述',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '友情链接地址',
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '友情链接名称',
  `image` varchar(100) NOT NULL DEFAULT '' COMMENT '友情链接图标',
  `target` varchar(10) NOT NULL DEFAULT '' COMMENT '友情链接打开方式',
  `rel` varchar(50) NOT NULL DEFAULT '' COMMENT '链接与网站的关系',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `status` (`status`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=COMPACT COMMENT='友情链接表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cg_friendly_links`
--

LOCK TABLES `cg_friendly_links` WRITE;
/*!40000 ALTER TABLE `cg_friendly_links` DISABLE KEYS */;
/*!40000 ALTER TABLE `cg_friendly_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cg_notice`
--

DROP TABLE IF EXISTS `cg_notice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cg_notice` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '标题',
  `content` text NOT NULL COMMENT '内容',
  `sender` varchar(25) NOT NULL DEFAULT '' COMMENT '发布者',
  `publish_time` int NOT NULL DEFAULT '0' COMMENT '发布时间',
  `create_time` int unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=COMPACT COMMENT='通知公告';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cg_notice`
--

LOCK TABLES `cg_notice` WRITE;
/*!40000 ALTER TABLE `cg_notice` DISABLE KEYS */;
/*!40000 ALTER TABLE `cg_notice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cg_notice_read`
--

DROP TABLE IF EXISTS `cg_notice_read`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cg_notice_read` (
  `id` int NOT NULL AUTO_INCREMENT,
  `msg_id` int NOT NULL DEFAULT '0' COMMENT '公告id',
  `user_id` int NOT NULL DEFAULT '0' COMMENT '用户id',
  `read_time` int NOT NULL DEFAULT '0' COMMENT '阅读时间',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态 1用户查看，2用户删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=COMPACT COMMENT='公告阅读表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cg_notice_read`
--

LOCK TABLES `cg_notice_read` WRITE;
/*!40000 ALTER TABLE `cg_notice_read` DISABLE KEYS */;
/*!40000 ALTER TABLE `cg_notice_read` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cg_plugin`
--

DROP TABLE IF EXISTS `cg_plugin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cg_plugin` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `type` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '插件类型;1:网站;8:微信',
  `has_admin` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否有后台管理,0:没有;1:有',
  `status` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '状态;1:开启;0:禁用',
  `create_time` int unsigned NOT NULL DEFAULT '0' COMMENT '插件安装时间',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '插件标识名,英文字母(惟一)',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '插件名称',
  `demo_url` varchar(50) NOT NULL DEFAULT '' COMMENT '演示地址，带协议',
  `hooks` varchar(255) NOT NULL DEFAULT '' COMMENT '实现的钩子;以“,”分隔',
  `author` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '插件作者',
  `author_url` varchar(50) NOT NULL DEFAULT '' COMMENT '作者网站链接',
  `version` varchar(20) NOT NULL DEFAULT '' COMMENT '插件版本号',
  `description` varchar(255) NOT NULL COMMENT '插件描述',
  `config` text COMMENT '插件配置',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=COMPACT COMMENT='插件表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cg_plugin`
--

LOCK TABLES `cg_plugin` WRITE;
/*!40000 ALTER TABLE `cg_plugin` DISABLE KEYS */;
/*!40000 ALTER TABLE `cg_plugin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cg_recycle_bin`
--

DROP TABLE IF EXISTS `cg_recycle_bin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cg_recycle_bin` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `object_id` int DEFAULT '0' COMMENT '删除内容 id',
  `create_time` int unsigned DEFAULT '0' COMMENT '创建时间',
  `table_name` varchar(60) DEFAULT '' COMMENT '删除内容所在表名',
  `name` varchar(255) DEFAULT '' COMMENT '删除内容名称',
  `user_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=COMPACT COMMENT=' 回收站';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cg_recycle_bin`
--

LOCK TABLES `cg_recycle_bin` WRITE;
/*!40000 ALTER TABLE `cg_recycle_bin` DISABLE KEYS */;
/*!40000 ALTER TABLE `cg_recycle_bin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cg_system_config`
--

DROP TABLE IF EXISTS `cg_system_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cg_system_config` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '编号',
  `config_file` varchar(50) NOT NULL DEFAULT 'cigo' COMMENT '配置分组（按照配置文件名）',
  `flag` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '配置项标识',
  `label` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '标签',
  `group` int NOT NULL DEFAULT '0' COMMENT '配置分组',
  `edit_type` int NOT NULL DEFAULT '0' COMMENT '编辑数据类型',
  `place_holder` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '输入提示',
  `help_block` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '帮助提示',
  `config` varchar(2048) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '配置数据',
  `value` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '配置值',
  `sort` int NOT NULL DEFAULT '100' COMMENT '排序',
  `show_flag` tinyint NOT NULL DEFAULT '1' COMMENT '允许配置标识',
  `cache_flag` tinyint(1) NOT NULL DEFAULT '0' COMMENT '缓存标识',
  `can_edit_flag` tinyint(1) NOT NULL DEFAULT '1' COMMENT '允许维护标识',
  `update_time` int NOT NULL DEFAULT '0' COMMENT '更新时间',
  `create_time` int NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_flag` (`flag`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='系统配置表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cg_system_config`
--

LOCK TABLES `cg_system_config` WRITE;
/*!40000 ALTER TABLE `cg_system_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `cg_system_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cg_third_party_user_bak`
--

DROP TABLE IF EXISTS `cg_third_party_user_bak`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cg_third_party_user_bak` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '本站用户id',
  `last_login_time` int unsigned NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  `expire_time` int unsigned NOT NULL DEFAULT '0' COMMENT 'access_token过期时间',
  `create_time` int unsigned NOT NULL DEFAULT '0' COMMENT '绑定时间',
  `login_times` int unsigned NOT NULL DEFAULT '0' COMMENT '登录次数',
  `status` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '状态;1:正常;0:禁用',
  `nickname` varchar(50) NOT NULL DEFAULT '' COMMENT '用户昵称',
  `third_party` varchar(20) NOT NULL DEFAULT '' COMMENT '第三方惟一码',
  `app_id` varchar(64) NOT NULL DEFAULT '' COMMENT '第三方应用 id',
  `last_login_ip` varchar(15) NOT NULL DEFAULT '' COMMENT '最后登录ip',
  `access_token` varchar(512) NOT NULL DEFAULT '' COMMENT '第三方授权码',
  `openid` varchar(40) NOT NULL DEFAULT '' COMMENT '第三方用户id',
  `union_id` varchar(64) NOT NULL DEFAULT '' COMMENT '第三方用户多个产品中的惟一 id,(如:微信平台)',
  `more` text COMMENT '扩展信息',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=COMPACT COMMENT='第三方用户表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cg_third_party_user_bak`
--

LOCK TABLES `cg_third_party_user_bak` WRITE;
/*!40000 ALTER TABLE `cg_third_party_user_bak` DISABLE KEYS */;
/*!40000 ALTER TABLE `cg_third_party_user_bak` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cg_upload_progress`
--

DROP TABLE IF EXISTS `cg_upload_progress`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cg_upload_progress` (
  `id` int NOT NULL AUTO_INCREMENT,
  `key_token` varchar(12) DEFAULT NULL,
  `num` varchar(6) DEFAULT '0.00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cg_upload_progress`
--

LOCK TABLES `cg_upload_progress` WRITE;
/*!40000 ALTER TABLE `cg_upload_progress` DISABLE KEYS */;
/*!40000 ALTER TABLE `cg_upload_progress` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cg_user`
--

DROP TABLE IF EXISTS `cg_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cg_user` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '编号',
  `module` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'admin' COMMENT '系统模块(区分后台)',
  `role_flag` int unsigned NOT NULL DEFAULT '1' COMMENT '用户类型\n001-1-普通用户\n010-2-管理员\n100-4-主管理员',
  `auth_group` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '[]',
  `token` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '用户token',
  `token_create_time` int NOT NULL DEFAULT '0' COMMENT 'token创建时间',
  `img` int NOT NULL DEFAULT '0' COMMENT '头像',
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '用户名',
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '手机号',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '密码',
  `realname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '姓名',
  `nickname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '昵称',
  `sex` tinyint NOT NULL DEFAULT '1' COMMENT '性别：0-保密；1-男；2-女',
  `birthday` int NOT NULL DEFAULT '0',
  `email` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '邮箱',
  `country` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `country_code` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `province` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '省份编号',
  `province_code` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `city` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '城市编号',
  `city_code` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `area` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `area_code` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `town` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `robot` tinyint NOT NULL DEFAULT '0',
  `town_code` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `path_code` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '省市级联path',
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '详细地址',
  `status` tinyint NOT NULL DEFAULT '0' COMMENT '状态(0-禁用，1启用，-1删除)',
  `is_online` tinyint NOT NULL DEFAULT '0' COMMENT '是否在线（0-否，1是）',
  `last_log_ip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '上次登陆IP',
  `last_log_time` int unsigned NOT NULL DEFAULT '0' COMMENT '上次登陆时间',
  `create_ip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '注册IP',
  `create_time` int unsigned NOT NULL DEFAULT '0' COMMENT '注册日期',
  `update_time` int unsigned NOT NULL DEFAULT '0' COMMENT '修改时间',
  `log_fail_num` tinyint NOT NULL DEFAULT '0' COMMENT '登录失败次数',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=181 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='用户表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cg_user`
--

LOCK TABLES `cg_user` WRITE;
/*!40000 ALTER TABLE `cg_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `cg_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cg_user_action`
--

DROP TABLE IF EXISTS `cg_user_action`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cg_user_action` (
  `id` int NOT NULL AUTO_INCREMENT,
  `score` int NOT NULL DEFAULT '0' COMMENT '更改积分，可以为负',
  `coin` int NOT NULL DEFAULT '0' COMMENT '更改金币，可以为负',
  `reward_number` int NOT NULL DEFAULT '0' COMMENT '奖励次数',
  `cycle_type` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '周期类型;0:不限;1:按天;2:按小时;3:永久',
  `cycle_time` int unsigned NOT NULL DEFAULT '0' COMMENT '周期时间值',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '用户操作名称',
  `action` varchar(50) NOT NULL DEFAULT '' COMMENT '用户操作名称',
  `app` varchar(50) NOT NULL DEFAULT '' COMMENT '操作所在应用名或插件名等',
  `url` text COMMENT '执行操作的url',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=COMPACT COMMENT='用户操作表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cg_user_action`
--

LOCK TABLES `cg_user_action` WRITE;
/*!40000 ALTER TABLE `cg_user_action` DISABLE KEYS */;
/*!40000 ALTER TABLE `cg_user_action` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cg_user_action_log`
--

DROP TABLE IF EXISTS `cg_user_action_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cg_user_action_log` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `count` int unsigned NOT NULL DEFAULT '0' COMMENT '访问次数',
  `last_visit_time` int unsigned NOT NULL DEFAULT '0' COMMENT '最后访问时间',
  `object` varchar(100) NOT NULL DEFAULT '' COMMENT '访问对象的id,格式:不带前缀的表名+id;如posts1表示xx_posts表里id为1的记录',
  `action` varchar(50) NOT NULL DEFAULT '' COMMENT '操作名称;格式:应用名+控制器+操作名,也可自己定义格式只要不发生冲突且惟一;',
  `ip` varchar(15) NOT NULL DEFAULT '' COMMENT '用户ip',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `user_object_action` (`user_id`,`object`,`action`) USING BTREE,
  KEY `user_object_action_ip` (`user_id`,`object`,`action`,`ip`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=COMPACT COMMENT='访问记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cg_user_action_log`
--

LOCK TABLES `cg_user_action_log` WRITE;
/*!40000 ALTER TABLE `cg_user_action_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `cg_user_action_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cg_user_balance_log`
--

DROP TABLE IF EXISTS `cg_user_balance_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cg_user_balance_log` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL DEFAULT '0' COMMENT '用户 id',
  `create_time` int unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `change` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '更改余额',
  `balance` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '更改后余额',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '描述',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=COMPACT COMMENT='用户余额变更日志表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cg_user_balance_log`
--

LOCK TABLES `cg_user_balance_log` WRITE;
/*!40000 ALTER TABLE `cg_user_balance_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `cg_user_balance_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cg_user_collection`
--

DROP TABLE IF EXISTS `cg_user_collection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cg_user_collection` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '用户 id',
  `content_type` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '内容类型',
  `content_id` int unsigned NOT NULL DEFAULT '0' COMMENT '内容编号',
  `create_time` int unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `uid` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=COMPACT COMMENT='用户收藏表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cg_user_collection`
--

LOCK TABLES `cg_user_collection` WRITE;
/*!40000 ALTER TABLE `cg_user_collection` DISABLE KEYS */;
/*!40000 ALTER TABLE `cg_user_collection` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cg_user_feedback`
--

DROP TABLE IF EXISTS `cg_user_feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cg_user_feedback` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL DEFAULT '0',
  `content` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `img_multi` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '[]',
  `status` tinyint NOT NULL DEFAULT '0' COMMENT '0-新提交；1-已读；2-已反馈；-1：删除',
  `create_time` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cg_user_feedback`
--

LOCK TABLES `cg_user_feedback` WRITE;
/*!40000 ALTER TABLE `cg_user_feedback` DISABLE KEYS */;
/*!40000 ALTER TABLE `cg_user_feedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cg_user_follow`
--

DROP TABLE IF EXISTS `cg_user_follow`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cg_user_follow` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL DEFAULT '0' COMMENT '用户id',
  `follow_id` int NOT NULL DEFAULT '0' COMMENT '关注的用户id',
  `create_time` int NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=COMPACT COMMENT='我的关注';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cg_user_follow`
--

LOCK TABLES `cg_user_follow` WRITE;
/*!40000 ALTER TABLE `cg_user_follow` DISABLE KEYS */;
/*!40000 ALTER TABLE `cg_user_follow` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cg_user_like`
--

DROP TABLE IF EXISTS `cg_user_like`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cg_user_like` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '用户 id',
  `content_type` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '内容类型',
  `content_id` int unsigned NOT NULL DEFAULT '0' COMMENT '内容编号',
  `create_time` int unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `uid` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=205 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=COMPACT COMMENT='用户点赞表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cg_user_like`
--

LOCK TABLES `cg_user_like` WRITE;
/*!40000 ALTER TABLE `cg_user_like` DISABLE KEYS */;
/*!40000 ALTER TABLE `cg_user_like` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cg_user_login_attempt`
--

DROP TABLE IF EXISTS `cg_user_login_attempt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cg_user_login_attempt` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `login_attempts` int unsigned NOT NULL DEFAULT '0' COMMENT '尝试次数',
  `attempt_time` int unsigned NOT NULL DEFAULT '0' COMMENT '尝试登录时间',
  `locked_time` int unsigned NOT NULL DEFAULT '0' COMMENT '锁定时间',
  `ip` varchar(15) NOT NULL DEFAULT '' COMMENT '用户 ip',
  `account` varchar(100) NOT NULL DEFAULT '' COMMENT '用户账号,手机号,邮箱或用户名',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=COMPACT COMMENT='用户登录尝试表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cg_user_login_attempt`
--

LOCK TABLES `cg_user_login_attempt` WRITE;
/*!40000 ALTER TABLE `cg_user_login_attempt` DISABLE KEYS */;
/*!40000 ALTER TABLE `cg_user_login_attempt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cg_user_login_record`
--

DROP TABLE IF EXISTS `cg_user_login_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cg_user_login_record` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL DEFAULT '0' COMMENT '用户编号',
  `user_agent` varchar(2048) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `client_type` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '客户端类型',
  `params` varchar(2048) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `if_success` tinyint NOT NULL DEFAULT '0' COMMENT '是否成功',
  `note` varchar(2048) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '备注',
  `create_time` int NOT NULL DEFAULT '0' COMMENT '登录时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5864 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='用户登录记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cg_user_login_record`
--

LOCK TABLES `cg_user_login_record` WRITE;
/*!40000 ALTER TABLE `cg_user_login_record` DISABLE KEYS */;
/*!40000 ALTER TABLE `cg_user_login_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cg_user_mg_auth_group`
--

DROP TABLE IF EXISTS `cg_user_mg_auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cg_user_mg_auth_group` (
  `id` mediumint unsigned NOT NULL AUTO_INCREMENT COMMENT '编号',
  `module` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'admin' COMMENT '系统模块(区分后台)',
  `pid` int NOT NULL DEFAULT '0',
  `path` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0,' COMMENT '上下级路径Path',
  `title` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '分组名称',
  `rules` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '[]' COMMENT '关联规则编号集合（以英文逗号分隔）',
  `sort` int NOT NULL DEFAULT '0' COMMENT '排序',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态（0-禁用；1-启用；-1：删除）',
  `summary` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '角色说明',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='用户权限分组表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cg_user_mg_auth_group`
--

LOCK TABLES `cg_user_mg_auth_group` WRITE;
/*!40000 ALTER TABLE `cg_user_mg_auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `cg_user_mg_auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cg_user_mg_auth_rule`
--

DROP TABLE IF EXISTS `cg_user_mg_auth_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cg_user_mg_auth_rule` (
  `id` int NOT NULL AUTO_INCREMENT,
  `module` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'admin' COMMENT '系统模块(区分后台)',
  `type` tinyint NOT NULL DEFAULT '0' COMMENT '节点类型（0-系统菜单；1-权限节点非菜单；2-按钮）',
  `pid` int NOT NULL DEFAULT '0' COMMENT '父级菜单编号',
  `path` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0,' COMMENT '上下级路径Path',
  `icon` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'cigoadmin-icon-menu' COMMENT 'ICON图标',
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '规则中文名称',
  `component_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '前端组件唯一标识名称',
  `url` varchar(2048) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '菜单path',
  `group` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '菜单分组',
  `group_sort` int NOT NULL DEFAULT '100' COMMENT '菜单分组Group排序',
  `sort` int NOT NULL DEFAULT '100' COMMENT '排序',
  `target_type` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'content-page' COMMENT '跳转类型（content-page：右侧页面；layer-win：弹窗窗口；_blank：新打开页面）',
  `can_not_close_opentab` tinyint NOT NULL DEFAULT '1' COMMENT '是否可以关闭已打开tab',
  `can_not_record_opentab` tinyint NOT NULL DEFAULT '0' COMMENT '不记录已打开tab列表',
  `can_not_cache` tinyint NOT NULL DEFAULT '1' COMMENT '是否参与页面缓存',
  `summary` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '规则说明',
  `opt_rate` int NOT NULL DEFAULT '0' COMMENT '操作频率',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态：1正常，0禁用，-1：删除',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_component_name` (`component_name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='后台用户权限规则表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cg_user_mg_auth_rule`
--

LOCK TABLES `cg_user_mg_auth_rule` WRITE;
/*!40000 ALTER TABLE `cg_user_mg_auth_rule` DISABLE KEYS */;
/*!40000 ALTER TABLE `cg_user_mg_auth_rule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cg_user_report`
--

DROP TABLE IF EXISTS `cg_user_report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cg_user_report` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '用户 id',
  `content_type` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '内容类型',
  `content_id` int unsigned NOT NULL DEFAULT '0' COMMENT '内容编号',
  `reason` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '举报原因(1:广告或垃圾信息，2:违反法律法规,3:包含侮辱性词汇,4:其他)',
  `summary` varchar(512) NOT NULL DEFAULT '' COMMENT '用户 id',
  `create_time` int unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `status` tinyint NOT NULL DEFAULT '0' COMMENT '状态（0-新提交；1-有效举报；2-无效举报）',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `uid` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=COMPACT COMMENT='用户举报表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cg_user_report`
--

LOCK TABLES `cg_user_report` WRITE;
/*!40000 ALTER TABLE `cg_user_report` DISABLE KEYS */;
/*!40000 ALTER TABLE `cg_user_report` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cg_user_score_log`
--

DROP TABLE IF EXISTS `cg_user_score_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cg_user_score_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL DEFAULT '0' COMMENT '用户 id',
  `create_time` int NOT NULL DEFAULT '0' COMMENT '创建时间',
  `action` varchar(50) NOT NULL DEFAULT '' COMMENT '用户操作名称',
  `score` int NOT NULL DEFAULT '0' COMMENT '更改积分，可以为负',
  `coin` int NOT NULL DEFAULT '0' COMMENT '更改金币，可以为负',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=COMPACT COMMENT='用户操作积分等奖励日志表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cg_user_score_log`
--

LOCK TABLES `cg_user_score_log` WRITE;
/*!40000 ALTER TABLE `cg_user_score_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `cg_user_score_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cg_user_thirdparty`
--

DROP TABLE IF EXISTS `cg_user_thirdparty`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cg_user_thirdparty` (
  `id` int NOT NULL AUTO_INCREMENT,
  `open_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `union_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `party` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '第三方类型（weixin、alipay）',
  `bind_code` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '绑定码',
  `user_agent` varchar(2048) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `client_type` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '客户端类型',
  `create_time` int NOT NULL DEFAULT '0' COMMENT '登录时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cg_user_thirdparty`
--

LOCK TABLES `cg_user_thirdparty` WRITE;
/*!40000 ALTER TABLE `cg_user_thirdparty` DISABLE KEYS */;
/*!40000 ALTER TABLE `cg_user_thirdparty` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cg_user_token`
--

DROP TABLE IF EXISTS `cg_user_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cg_user_token` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL DEFAULT '0' COMMENT '用户id',
  `expire_time` int unsigned NOT NULL DEFAULT '0' COMMENT ' 过期时间',
  `create_time` int unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `token` varchar(64) NOT NULL DEFAULT '' COMMENT 'token',
  `device_type` varchar(10) NOT NULL DEFAULT '' COMMENT '设备类型;mobile,android,iphone,ipad,web,pc,mac,wxapp',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=127 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=COMPACT COMMENT='用户客户端登录 token 表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cg_user_token`
--

LOCK TABLES `cg_user_token` WRITE;
/*!40000 ALTER TABLE `cg_user_token` DISABLE KEYS */;
/*!40000 ALTER TABLE `cg_user_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cg_user_view`
--

DROP TABLE IF EXISTS `cg_user_view`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cg_user_view` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '用户 id',
  `content_type` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '内容类型',
  `content_id` int unsigned NOT NULL DEFAULT '0' COMMENT '内容编号',
  `create_time` int unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `uid` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=115 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=COMPACT COMMENT='用户浏览表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cg_user_view`
--

LOCK TABLES `cg_user_view` WRITE;
/*!40000 ALTER TABLE `cg_user_view` DISABLE KEYS */;
/*!40000 ALTER TABLE `cg_user_view` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cg_verification_code`
--

DROP TABLE IF EXISTS `cg_verification_code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cg_verification_code` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '表id',
  `count` int unsigned NOT NULL DEFAULT '0' COMMENT '当天已经发送成功的次数',
  `send_time` int unsigned NOT NULL DEFAULT '0' COMMENT '最后发送成功时间',
  `expire_time` int unsigned NOT NULL DEFAULT '0' COMMENT '验证码过期时间',
  `code` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '最后发送成功的验证码',
  `account` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '手机号或者邮箱',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=COMPACT COMMENT='手机邮箱数字验证码表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cg_verification_code`
--

LOCK TABLES `cg_verification_code` WRITE;
/*!40000 ALTER TABLE `cg_verification_code` DISABLE KEYS */;
/*!40000 ALTER TABLE `cg_verification_code` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-01-27 14:42:39
