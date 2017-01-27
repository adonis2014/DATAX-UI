/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50625
 Source Host           : localhost
 Source Database       : eswrapper

 Target Server Type    : MySQL
 Target Server Version : 50625
 File Encoding         : utf-8

 Date: 08/12/2016 10:42:29 AM
*/

SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `QRTZ_BLOB_TRIGGERS`
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_BLOB_TRIGGERS`;
CREATE TABLE `QRTZ_BLOB_TRIGGERS` (
  `SCHED_NAME` varchar(120) COLLATE utf8_bin NOT NULL,
  `TRIGGER_NAME` varchar(200) COLLATE utf8_bin NOT NULL,
  `TRIGGER_GROUP` varchar(200) COLLATE utf8_bin NOT NULL,
  `BLOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `QRTZ_TRIGGERS` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=COMPACT;

-- ----------------------------
--  Table structure for `QRTZ_CALENDARS`
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_CALENDARS`;
CREATE TABLE `QRTZ_CALENDARS` (
  `SCHED_NAME` varchar(120) COLLATE utf8_bin NOT NULL,
  `CALENDAR_NAME` varchar(200) COLLATE utf8_bin NOT NULL,
  `CALENDAR` blob NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`CALENDAR_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=COMPACT;

-- ----------------------------
--  Table structure for `QRTZ_CRON_TRIGGERS`
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_CRON_TRIGGERS`;
CREATE TABLE `QRTZ_CRON_TRIGGERS` (
  `SCHED_NAME` varchar(120) COLLATE utf8_bin NOT NULL,
  `TRIGGER_NAME` varchar(200) COLLATE utf8_bin NOT NULL,
  `TRIGGER_GROUP` varchar(200) COLLATE utf8_bin NOT NULL,
  `CRON_EXPRESSION` varchar(200) COLLATE utf8_bin NOT NULL,
  `TIME_ZONE_ID` varchar(80) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `QRTZ_TRIGGERS` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=COMPACT;

-- ----------------------------
--  Records of `QRTZ_CRON_TRIGGERS`
-- ----------------------------
BEGIN;
INSERT INTO `QRTZ_CRON_TRIGGERS` VALUES ('TestScheduler', 'TestCronTrigger2AtEveryMinute', 'GroupOfTestJob2Triggers', '0 * * ? * *', 'Asia/Shanghai'), ('TestScheduler', 'TestCronTrigger2AtEveryMinuteOnThe45thSecond', 'GroupOfTestJob2Triggers', '45 * * ? * *', 'America/Los_Angeles');
COMMIT;

-- ----------------------------
--  Table structure for `QRTZ_FIRED_TRIGGERS`
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_FIRED_TRIGGERS`;
CREATE TABLE `QRTZ_FIRED_TRIGGERS` (
  `SCHED_NAME` varchar(120) COLLATE utf8_bin NOT NULL,
  `ENTRY_ID` varchar(95) COLLATE utf8_bin NOT NULL,
  `TRIGGER_NAME` varchar(200) COLLATE utf8_bin NOT NULL,
  `TRIGGER_GROUP` varchar(200) COLLATE utf8_bin NOT NULL,
  `INSTANCE_NAME` varchar(200) COLLATE utf8_bin NOT NULL,
  `FIRED_TIME` bigint(13) NOT NULL,
  `SCHED_TIME` bigint(13) NOT NULL,
  `PRIORITY` int(11) NOT NULL,
  `STATE` varchar(16) COLLATE utf8_bin NOT NULL,
  `JOB_NAME` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `JOB_GROUP` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `IS_NONCONCURRENT` varchar(1) COLLATE utf8_bin DEFAULT NULL,
  `REQUESTS_RECOVERY` varchar(1) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`ENTRY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=COMPACT;

-- ----------------------------
--  Records of `QRTZ_FIRED_TRIGGERS`
-- ----------------------------
BEGIN;
INSERT INTO `QRTZ_FIRED_TRIGGERS` VALUES ('TestScheduler', 'NON_CLUSTERED1448345478992', 'TestSimpleTrigger1AtFiveSecondInterval', 'DEFAULT', 'NON_CLUSTERED', '1448345494991', '1448345499976', '5', 'ACQUIRED', null, null, '0', '0');
COMMIT;

-- ----------------------------
--  Table structure for `QRTZ_JOB_DETAILS`
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_JOB_DETAILS`;
CREATE TABLE `QRTZ_JOB_DETAILS` (
  `SCHED_NAME` varchar(120) COLLATE utf8_bin NOT NULL,
  `JOB_NAME` varchar(200) COLLATE utf8_bin NOT NULL,
  `JOB_GROUP` varchar(200) COLLATE utf8_bin NOT NULL,
  `DESCRIPTION` varchar(250) COLLATE utf8_bin DEFAULT NULL,
  `JOB_CLASS_NAME` varchar(250) COLLATE utf8_bin NOT NULL,
  `IS_DURABLE` varchar(1) COLLATE utf8_bin NOT NULL,
  `IS_NONCONCURRENT` varchar(1) COLLATE utf8_bin NOT NULL,
  `IS_UPDATE_DATA` varchar(1) COLLATE utf8_bin NOT NULL,
  `REQUESTS_RECOVERY` varchar(1) COLLATE utf8_bin NOT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=COMPACT;

-- ----------------------------
--  Records of `QRTZ_JOB_DETAILS`
-- ----------------------------
BEGIN;
INSERT INTO `QRTZ_JOB_DETAILS` VALUES ('TestScheduler', 'JobSchedulingDataLoaderPlugin_jobInitializer_quartz_data_xml', 'JobSchedulingDataLoaderPlugin', null, 'org.quartz.jobs.FileScanJob', '0', '1', '1', '0', 0xaced0005737200156f72672e71756172747a2e4a6f62446174614d61709fb083e8bfa9b0cb020000787200266f72672e71756172747a2e7574696c732e537472696e674b65794469727479466c61674d61708208e8c3fbc55d280200015a0013616c6c6f77735472616e7369656e74446174617872001d6f72672e71756172747a2e7574696c732e4469727479466c61674d617013e62ead28760ace0200025a000564697274794c00036d617074000f4c6a6176612f7574696c2f4d61703b787001737200116a6176612e7574696c2e486173684d61700507dac1c31660d103000246000a6c6f6164466163746f724900097468726573686f6c6478703f4000000000000c7708000000100000000374000946494c455f4e414d4574000f71756172747a5f646174612e786d6c7400124c4153545f4d4f4449464945445f54494d457372000e6a6176612e6c616e672e4c6f6e673b8be490cc8f23df0200014a000576616c7565787200106a6176612e6c616e672e4e756d62657286ac951d0b94e08b0200007870000001414c0a81b874001746494c455f5343414e5f4c495354454e45525f4e414d4574002c4a6f625363686564756c696e67446174614c6f61646572506c7567696e5f6a6f62496e697469616c697a65727800), ('TestScheduler', 'TestDurableJob', 'DEFAULT', null, 'org.quartz.examples.example10.SimpleJob', '1', '0', '0', '0', 0xaced0005737200156f72672e71756172747a2e4a6f62446174614d61709fb083e8bfa9b0cb020000787200266f72672e71756172747a2e7574696c732e537472696e674b65794469727479466c61674d61708208e8c3fbc55d280200015a0013616c6c6f77735472616e7369656e74446174617872001d6f72672e71756172747a2e7574696c732e4469727479466c61674d617013e62ead28760ace0200025a000564697274794c00036d617074000f4c6a6176612f7574696c2f4d61703b787000737200116a6176612e7574696c2e486173684d61700507dac1c31660d103000246000a6c6f6164466163746f724900097468726573686f6c6478703f4000000000000f770800000010000000007800), ('TestScheduler', 'TestJob1', 'DEFAULT', null, 'org.quartz.examples.example10.SimpleJob', '0', '0', '0', '0', 0xaced0005737200156f72672e71756172747a2e4a6f62446174614d61709fb083e8bfa9b0cb020000787200266f72672e71756172747a2e7574696c732e537472696e674b65794469727479466c61674d61708208e8c3fbc55d280200015a0013616c6c6f77735472616e7369656e74446174617872001d6f72672e71756172747a2e7574696c732e4469727479466c61674d617013e62ead28760ace0200025a000564697274794c00036d617074000f4c6a6176612f7574696c2f4d61703b787000737200116a6176612e7574696c2e486173684d61700507dac1c31660d103000246000a6c6f6164466163746f724900097468726573686f6c6478703f4000000000000f770800000010000000007800), ('TestScheduler', 'TestJob2', 'GroupOfTestJob2', 'This is the description of TestJob2', 'org.quartz.examples.example10.SimpleJob', '0', '0', '0', '1', 0xaced0005737200156f72672e71756172747a2e4a6f62446174614d61709fb083e8bfa9b0cb020000787200266f72672e71756172747a2e7574696c732e537472696e674b65794469727479466c61674d61708208e8c3fbc55d280200015a0013616c6c6f77735472616e7369656e74446174617872001d6f72672e71756172747a2e7574696c732e4469727479466c61674d617013e62ead28760ace0200025a000564697274794c00036d617074000f4c6a6176612f7574696c2f4d61703b787001737200116a6176612e7574696c2e486173684d61700507dac1c31660d103000246000a6c6f6164466163746f724900097468726573686f6c6478703f4000000000000c77080000001000000002740007736f6d654b6579740009736f6d6556616c756574000c736f6d654f746865724b657974000e736f6d654f7468657256616c75657800);
COMMIT;

-- ----------------------------
--  Table structure for `QRTZ_LOCKS`
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_LOCKS`;
CREATE TABLE `QRTZ_LOCKS` (
  `SCHED_NAME` varchar(120) COLLATE utf8_bin NOT NULL,
  `LOCK_NAME` varchar(40) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`LOCK_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=COMPACT;

-- ----------------------------
--  Table structure for `QRTZ_PAUSED_TRIGGER_GRPS`
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_PAUSED_TRIGGER_GRPS`;
CREATE TABLE `QRTZ_PAUSED_TRIGGER_GRPS` (
  `SCHED_NAME` varchar(120) COLLATE utf8_bin NOT NULL,
  `TRIGGER_GROUP` varchar(200) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=COMPACT;

-- ----------------------------
--  Table structure for `QRTZ_SCHEDULER_STATE`
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_SCHEDULER_STATE`;
CREATE TABLE `QRTZ_SCHEDULER_STATE` (
  `SCHED_NAME` varchar(120) COLLATE utf8_bin NOT NULL,
  `INSTANCE_NAME` varchar(200) COLLATE utf8_bin NOT NULL,
  `LAST_CHECKIN_TIME` bigint(13) NOT NULL,
  `CHECKIN_INTERVAL` bigint(13) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`INSTANCE_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=COMPACT;

-- ----------------------------
--  Table structure for `QRTZ_SIMPLE_TRIGGERS`
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_SIMPLE_TRIGGERS`;
CREATE TABLE `QRTZ_SIMPLE_TRIGGERS` (
  `SCHED_NAME` varchar(120) COLLATE utf8_bin NOT NULL,
  `TRIGGER_NAME` varchar(200) COLLATE utf8_bin NOT NULL,
  `TRIGGER_GROUP` varchar(200) COLLATE utf8_bin NOT NULL,
  `REPEAT_COUNT` bigint(7) NOT NULL,
  `REPEAT_INTERVAL` bigint(12) NOT NULL,
  `TIMES_TRIGGERED` bigint(10) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `QRTZ_TRIGGERS` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=COMPACT;

-- ----------------------------
--  Records of `QRTZ_SIMPLE_TRIGGERS`
-- ----------------------------
BEGIN;
INSERT INTO `QRTZ_SIMPLE_TRIGGERS` VALUES ('TestScheduler', 'JobSchedulingDataLoaderPlugin_jobInitializer_quartz_data_xml', 'JobSchedulingDataLoaderPlugin', '-1', '120000', '1'), ('TestScheduler', 'TestSimpleTrigger1AtFiveSecondInterval', 'DEFAULT', '-1', '5000', '4'), ('TestScheduler', 'TestSimpleTrigger2AtTenSecondIntervalAndFiveRepeats', 'GroupOfTestJob2Triggers', '5', '10000', '0');
COMMIT;

-- ----------------------------
--  Table structure for `QRTZ_SIMPROP_TRIGGERS`
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_SIMPROP_TRIGGERS`;
CREATE TABLE `QRTZ_SIMPROP_TRIGGERS` (
  `SCHED_NAME` varchar(120) COLLATE utf8_bin NOT NULL,
  `TRIGGER_NAME` varchar(200) COLLATE utf8_bin NOT NULL,
  `TRIGGER_GROUP` varchar(200) COLLATE utf8_bin NOT NULL,
  `STR_PROP_1` varchar(512) COLLATE utf8_bin DEFAULT NULL,
  `STR_PROP_2` varchar(512) COLLATE utf8_bin DEFAULT NULL,
  `STR_PROP_3` varchar(512) COLLATE utf8_bin DEFAULT NULL,
  `INT_PROP_1` int(11) DEFAULT NULL,
  `INT_PROP_2` int(11) DEFAULT NULL,
  `LONG_PROP_1` bigint(20) DEFAULT NULL,
  `LONG_PROP_2` bigint(20) DEFAULT NULL,
  `DEC_PROP_1` decimal(13,4) DEFAULT NULL,
  `DEC_PROP_2` decimal(13,4) DEFAULT NULL,
  `BOOL_PROP_1` varchar(1) COLLATE utf8_bin DEFAULT NULL,
  `BOOL_PROP_2` varchar(1) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `QRTZ_TRIGGERS` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=COMPACT;

-- ----------------------------
--  Table structure for `QRTZ_TRIGGERS`
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_TRIGGERS`;
CREATE TABLE `QRTZ_TRIGGERS` (
  `SCHED_NAME` varchar(120) COLLATE utf8_bin NOT NULL,
  `TRIGGER_NAME` varchar(200) COLLATE utf8_bin NOT NULL,
  `TRIGGER_GROUP` varchar(200) COLLATE utf8_bin NOT NULL,
  `JOB_NAME` varchar(200) COLLATE utf8_bin NOT NULL,
  `JOB_GROUP` varchar(200) COLLATE utf8_bin NOT NULL,
  `DESCRIPTION` varchar(250) COLLATE utf8_bin DEFAULT NULL,
  `NEXT_FIRE_TIME` bigint(13) DEFAULT NULL,
  `PREV_FIRE_TIME` bigint(13) DEFAULT NULL,
  `PRIORITY` int(11) DEFAULT NULL,
  `TRIGGER_STATE` varchar(16) COLLATE utf8_bin NOT NULL,
  `TRIGGER_TYPE` varchar(8) COLLATE utf8_bin NOT NULL,
  `START_TIME` bigint(13) NOT NULL,
  `END_TIME` bigint(13) DEFAULT NULL,
  `CALENDAR_NAME` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `MISFIRE_INSTR` smallint(2) DEFAULT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `SCHED_NAME` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) REFERENCES `QRTZ_JOB_DETAILS` (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=COMPACT;

-- ----------------------------
--  Records of `QRTZ_TRIGGERS`
-- ----------------------------
BEGIN;
INSERT INTO `QRTZ_TRIGGERS` VALUES ('TestScheduler', 'JobSchedulingDataLoaderPlugin_jobInitializer_quartz_data_xml', 'JobSchedulingDataLoaderPlugin', 'JobSchedulingDataLoaderPlugin_jobInitializer_quartz_data_xml', 'JobSchedulingDataLoaderPlugin', null, '1448345599690', '1448345479690', '5', 'WAITING', 'SIMPLE', '1448345479690', '0', null, '0', ''), ('TestScheduler', 'TestCronTrigger2AtEveryMinute', 'GroupOfTestJob2Triggers', 'TestJob2', 'GroupOfTestJob2', null, '1448345520000', '-1', '5', 'WAITING', 'CRON', '1448345480000', '0', null, '0', 0xaced0005737200156f72672e71756172747a2e4a6f62446174614d61709fb083e8bfa9b0cb020000787200266f72672e71756172747a2e7574696c732e537472696e674b65794469727479466c61674d61708208e8c3fbc55d280200015a0013616c6c6f77735472616e7369656e74446174617872001d6f72672e71756172747a2e7574696c732e4469727479466c61674d617013e62ead28760ace0200025a000564697274794c00036d617074000f4c6a6176612f7574696c2f4d61703b787001737200116a6176612e7574696c2e486173684d61700507dac1c31660d103000246000a6c6f6164466163746f724900097468726573686f6c6478703f4000000000000c77080000001000000002740007736f6d654b657974000f6f76657272696464656e56616c756574000c736f6d654f746865724b6579740018736f6d654f746865724f76657272696464656e56616c75657800), ('TestScheduler', 'TestCronTrigger2AtEveryMinuteOnThe45thSecond', 'GroupOfTestJob2Triggers', 'TestJob2', 'GroupOfTestJob2', null, '1265689605000', '-1', '5', 'WAITING', 'CRON', '1265689560000', '1328761560000', null, '0', ''), ('TestScheduler', 'TestSimpleTrigger1AtFiveSecondInterval', 'DEFAULT', 'TestJob1', 'DEFAULT', null, '1448345499976', '1448345494976', '5', 'ACQUIRED', 'SIMPLE', '1448345479976', '0', null, '0', ''), ('TestScheduler', 'TestSimpleTrigger2AtTenSecondIntervalAndFiveRepeats', 'GroupOfTestJob2Triggers', 'TestJob2', 'GroupOfTestJob2', null, '1265681700000', '-1', '5', 'WAITING', 'SIMPLE', '1265681700000', '0', null, '2', '');
COMMIT;

-- ----------------------------
--  Table structure for `es_black_request`
-- ----------------------------
DROP TABLE IF EXISTS `es_black_request`;
CREATE TABLE `es_black_request` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `url` varchar(255) DEFAULT NULL,
  `requestdata` text,
  `isblack` int(11) DEFAULT NULL,
  `remark` varchar(100) DEFAULT NULL,
  `reject_num` int(11) DEFAULT NULL,
  `cluster_name` varchar(100) DEFAULT NULL,
  `method` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
--  Table structure for `es_monitor_log`
-- ----------------------------
DROP TABLE IF EXISTS `es_monitor_log`;
CREATE TABLE `es_monitor_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `log_time` varchar(255) DEFAULT NULL,
  `check_label` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7842 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
--  Table structure for `es_monitor_log_detail`
-- ----------------------------
DROP TABLE IF EXISTS `es_monitor_log_detail`;
CREATE TABLE `es_monitor_log_detail` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `cluster_name` varchar(255) DEFAULT NULL,
  `node` varchar(255) DEFAULT NULL,
  `success_count` int(11) DEFAULT NULL,
  `success_tps` double DEFAULT NULL,
  `failure_count` int(11) DEFAULT NULL,
  `failure_tps` double DEFAULT NULL,
  `concurrent_min` int(11) DEFAULT NULL,
  `concurrent_ave` double DEFAULT NULL,
  `concurrent_max` int(11) DEFAULT NULL,
  `log_id` bigint(20) DEFAULT NULL,
  `elapsed_min` int(11) DEFAULT NULL,
  `elapsed_max` int(11) DEFAULT NULL,
  `elapsed_ave` double DEFAULT NULL,
  `writequeue_min` int(11) DEFAULT NULL,
  `writequeue_max` int(11) DEFAULT NULL,
  `writequeue_ave` double DEFAULT NULL,
  `writepool_min` int(11) DEFAULT NULL,
  `writepool_max` int(11) DEFAULT NULL,
  `writepool_ave` double DEFAULT NULL,
  `searchqueue_min` int(11) DEFAULT NULL,
  `searchqueue_max` int(11) DEFAULT NULL,
  `searchqueue_ave` double DEFAULT NULL,
  `searchpool_min` int(11) DEFAULT NULL,
  `searchpool_max` int(11) DEFAULT NULL,
  `searchpool_ave` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=58701 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
--  Table structure for `es_slow_log`
-- ----------------------------
DROP TABLE IF EXISTS `es_slow_log`;
CREATE TABLE `es_slow_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `elapsed` int(11) DEFAULT NULL,
  `sourceIp` varchar(255) DEFAULT NULL,
  `hostname` varchar(255) DEFAULT NULL,
  `port` varchar(255) DEFAULT NULL,
  `method` varchar(255) DEFAULT NULL,
  `url` varchar(4000) DEFAULT NULL,
  `requestData` text,
  `response` text,
  `log_time` datetime DEFAULT NULL,
  `start_time` datetime DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `cluster_name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=83 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
--  Table structure for `meta_column`
-- ----------------------------
DROP TABLE IF EXISTS `meta_column`;
CREATE TABLE `meta_column` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字段ID',
  `table_id` bigint(20) DEFAULT NULL COMMENT '表格ID',
  `column_name` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '字段名',
  `column_pname` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '物理名',
  `type` longtext COLLATE utf8_bin COMMENT '类别',
  `store` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT 'store',
  `doc_values` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `index_type` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '分词index',
  `required` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '是否必须',
  `format` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `remark` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '备注',
  `family_name` longtext COLLATE utf8_bin,
  `index_id` bigint(20) DEFAULT NULL,
  `field_code` longtext COLLATE utf8_bin,
  `check_label` int(11) DEFAULT NULL COMMENT '生效标记',
  PRIMARY KEY (`id`),
  KEY `table_id` (`table_id`),
  CONSTRAINT `fk_column_table` FOREIGN KEY (`table_id`) REFERENCES `meta_dbtable` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5001 DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=COMPACT COMMENT='字段';

-- ----------------------------
--  Table structure for `meta_database`
-- ----------------------------
DROP TABLE IF EXISTS `meta_database`;
CREATE TABLE `meta_database` (
  `datasource_id` bigint(20) DEFAULT NULL,
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `db_name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `check_label` int(11) DEFAULT NULL,
  `schema_name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `create_date` date DEFAULT NULL,
  `update_date` date DEFAULT NULL,
  `createby_id` bigint(20) DEFAULT NULL,
  `updateby_id` bigint(20) DEFAULT NULL,
  `remark` longtext COLLATE utf8_bin,
  PRIMARY KEY (`id`),
  KEY `datasource_id` (`datasource_id`),
  CONSTRAINT `fk_database_datasource` FOREIGN KEY (`datasource_id`) REFERENCES `meta_datasource` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=140 DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=COMPACT;

-- ----------------------------
--  Table structure for `meta_datasource`
-- ----------------------------
DROP TABLE IF EXISTS `meta_datasource`;
CREATE TABLE `meta_datasource` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '数据源ID',
  `db_type` int(11) DEFAULT NULL COMMENT '数据库类别',
  `create_date` date DEFAULT NULL,
  `update_date` date DEFAULT NULL,
  `createby_id` bigint(20) DEFAULT NULL,
  `updateby_id` bigint(20) DEFAULT NULL,
  `remark` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '备注',
  `ds_name` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `schema_name` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `check_label` int(11) DEFAULT NULL COMMENT '启用标记',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_dbtype_schema` (`db_type`,`schema_name`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=COMPACT COMMENT='数据源';

-- ----------------------------
--  Records of `meta_datasource`
-- ----------------------------
BEGIN;
INSERT INTO `meta_datasource` VALUES ('4', '1', '2016-07-11', '2016-08-04', '5', '5', '测试集群', '测试集群', 'vdata-test', '1');
COMMIT;

-- ----------------------------
--  Table structure for `meta_dbindex`
-- ----------------------------
DROP TABLE IF EXISTS `meta_dbindex`;
CREATE TABLE `meta_dbindex` (
  `id` bigint(20) NOT NULL,
  `index_name` longtext COLLATE utf8_bin,
  `type_name` longtext COLLATE utf8_bin,
  `remark` longtext COLLATE utf8_bin,
  `create_date` date DEFAULT NULL,
  `update_date` date DEFAULT NULL,
  `createby_id` bigint(20) DEFAULT NULL,
  `updateby_id` bigint(20) DEFAULT NULL,
  `index_type` int(11) DEFAULT NULL,
  `check_label` int(11) DEFAULT NULL COMMENT '生效标记',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=COMPACT;

-- ----------------------------
--  Records of `meta_dbindex`
-- ----------------------------
BEGIN;
INSERT INTO `meta_dbindex` VALUES ('1', 0x6461746163656e746572, 0x555345525f464947555245, 0x6573e7b4a2e5bc95e8a1a8, '2015-12-14', '2015-12-14', '5', '5', '1', null);
COMMIT;

-- ----------------------------
--  Table structure for `meta_dbtable`
-- ----------------------------
DROP TABLE IF EXISTS `meta_dbtable`;
CREATE TABLE `meta_dbtable` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '表格ID',
  `db_id` bigint(20) DEFAULT NULL COMMENT '数据源ID',
  `table_name` varchar(100) COLLATE utf8_bin NOT NULL,
  `table_pname` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '物理名',
  `table_type` smallint(6) DEFAULT NULL,
  `remark` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '备注',
  `update_date` datetime DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `createby_id` bigint(20) DEFAULT NULL,
  `updateby_id` bigint(20) DEFAULT NULL,
  `class_name` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `check_label` int(11) DEFAULT NULL COMMENT '生效标记',
  PRIMARY KEY (`id`),
  KEY `IDX_TABLE_NAME` (`table_name`,`db_id`),
  KEY `db_id` (`db_id`),
  CONSTRAINT `fk_table_database` FOREIGN KEY (`db_id`) REFERENCES `meta_database` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=217 DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=COMPACT COMMENT='表';

-- ----------------------------
--  Table structure for `meta_property`
-- ----------------------------
DROP TABLE IF EXISTS `meta_property`;
CREATE TABLE `meta_property` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ref_id` bigint(20) DEFAULT NULL,
  `property_key` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `property_value` varchar(250) COLLATE utf8_bin DEFAULT NULL,
  `remark` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `ref_type` int(11) DEFAULT NULL,
  `sort_id` bigint(11) DEFAULT NULL,
  `group_id` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `group_name` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=COMPACT;

-- ----------------------------
--  Records of `meta_property`
-- ----------------------------
BEGIN;
INSERT INTO `meta_property` VALUES ('1', '4', 'searchConcurrentCount', '30', '读任务并发数', '1', '1', 'readwrite', '读写设置'), ('3', '4', 'syncWrapper', 'true', '是否同步', '1', '4', 'gen', '通用'), ('4', '4', 'transportNodes', '10.0.40.74:9300,10.0.40.75:9300,10.0.40.76:9300', 'transport访问端口', '1', '3', 'gen', '通用'), ('5', '4', 'writeConcurrentCount', '15', '写任务并发数', '1', '3', 'readwrite', '读写设置'), ('6', '4', 'shield_user', 'es_admin', 'shield用户名', '1', '1', 'security', '访问控制'), ('7', '4', 'httpNodes', '10.0.40.74:9200,10.0.40.75:9200,10.0.40.76:9200', 'http rest访问端口', '1', '2', 'gen', '通用'), ('8', '4', 'clustername', 'vdata-test', '集群名', '1', '1', 'gen', '通用'), ('9', '4', 'writeBufferSize', '150', '写任务队列长度', '1', '4', 'readwrite', '读写设置'), ('10', '4', 'retries', '3', '失败重试次数', '1', '6', 'gen', '通用'), ('11', '4', 'balanceType', 'ROUNDROBIN', '负载均衡策略', '1', '5', 'gen', '通用'), ('12', '4', 'searchBufferSize', '300', '读任务队列长度', '1', '2', 'readwrite', '读写设置'), ('13', '4', 'shield_password', 'dataanalyze', 'shield访问密码', '1', '2', 'security', '访问控制'), ('14', '5', 'searchConcurrentCount', '20', '读任务并发数', '1', '1', 'readwrite', '读写设置'), ('15', '5', 'syncWrapper', 'true', '是否同步', '1', '4', 'gen', '通用'), ('16', '5', 'transportNodes', '172.16.28.238:9300,172.16.28.239:9300,172.16.28.240:9300,172.16.28.241:9300,172.16.28.242:9300,172.16.28.243:9300,172.16.28.244:9300,172.16.28.245:9300', 'transport访问端口', '1', '3', 'gen', '通用'), ('17', '5', 'writeConcurrentCount', '10', '写任务并发数', '1', '3', 'readwrite', '读写设置'), ('18', '5', 'shield_user', 'es_admin', 'shield用户名', '1', '1', 'security', '访问控制'), ('19', '5', 'httpNodes', '172.16.28.238:9200,172.16.28.239:9200,172.16.28.240:9200,172.16.28.241:9200,172.16.28.242:9200,172.16.28.243:9200,172.16.28.244:9200,172.16.28.245:9200', 'http rest访问端口', '1', '2', 'gen', '通用'), ('20', '5', 'clustername', 'vdata-online', '集群名', '1', '1', 'gen', '通用'), ('21', '5', 'writeBufferSize', '100', '写任务队列长度', '1', '4', 'readwrite', '读写设置'), ('22', '5', 'retries', '3', '失败重试次数', '1', '6', 'gen', '通用'), ('23', '5', 'balanceType', 'ROUNDROBIN', '负载均衡策略', '1', '5', 'gen', '通用'), ('24', '5', 'searchBufferSize', '200', '读任务队列长度', '1', '2', 'readwrite', '读写设置'), ('25', '5', 'shield_password', 'enniu#data', 'shield访问密码', '1', '2', 'security', '访问控制'), ('26', '6', 'searchConcurrentCount', '100', '读任务并发数', '1', '1', 'readwrite', '读写设置'), ('27', '6', 'syncWrapper', 'true', '是否同步', '1', '4', 'gen', '通用'), ('28', '6', 'transportNodes', '172.16.28.81:9300,172.16.28.82:9300,172.16.28.29:9300,172.16.28.30:9300,172.16.28.84:9300,172.16.28.81:9301,172.16.28.82:9301,172.16.28.29:9301,172.16.28.30:9301,172.16.28.84:9301', 'transport访问端口', '1', '3', 'gen', '通用'), ('29', '6', 'writeConcurrentCount', '100', '写任务并发数', '1', '3', 'readwrite', '读写设置'), ('30', '6', 'shield_user', '', 'shield用户名', '1', '1', 'security', '访问控制'), ('31', '6', 'httpNodes', '172.16.28.81:9200,172.16.28.82:9200,172.16.28.29:9200,172.16.28.30:9200,172.16.28.84:9200,172.16.28.81:9201,172.16.28.82:9201,172.16.28.29:9201,172.16.28.30:9201,172.16.28.84:9201', 'http rest访问端口', '1', '2', 'gen', '通用'), ('32', '6', 'clustername', 'vdata', '集群名', '1', '1', 'gen', '通用'), ('33', '6', 'writeBufferSize', '500', '写任务队列长度', '1', '4', 'readwrite', '读写设置'), ('34', '6', 'retries', '3', '失败重试次数', '1', '6', 'gen', '通用'), ('35', '6', 'balanceType', 'ROUNDROBIN', '负载均衡策略', '1', '5', 'gen', '通用'), ('36', '6', 'searchBufferSize', '500', '读任务队列长度', '1', '2', 'readwrite', '读写设置'), ('37', '6', 'shield_password', '', 'shield访问密码', '1', '2', 'security', '访问控制'), ('38', '4', 'defaultLogDir', '/Users/admin', '监控日志路径', '1', '5', 'monitor', '日志监控'), ('39', '4', 'monitor', 'true', '是否监控', '1', '1', 'monitor', '日志监控'), ('40', '6', 'defaultLogDir', '/Users/admin', '监控日志路径', '1', '5', 'monitor', '日志监控'), ('41', '6', 'monitor', 'true', '是否监控', '1', '1', 'monitor', '日志监控'), ('42', '5', 'defaultLogDir', '/Users/admin', '监控日志路径', '1', '5', 'monitor', '日志监控'), ('43', '5', 'monitor', 'true', '是否监控', '1', '1', 'monitor', '日志监控'), ('44', '4', 'defaultTimeout', '600000', '操作超时时间', '1', '7', 'monitor', '日志监控'), ('45', '4', 'defaultSlowTimeout', '3000', '默认慢操作记录', '1', '6', 'monitor', '日志监控'), ('46', '4', 'MONITOR_MERGE_THREAD_NUM', '5', '监控线程数', '1', '4', 'monitor', '日志监控'), ('47', '4', 'MONITOR_QUEUE_SIZE', '10000', '监控队列长度', '1', '3', 'monitor', '日志监控'), ('48', '4', 'monitorInterval', '60000', '监控间隔时间', '1', '2', 'monitor', '日志监控'), ('49', '5', 'defaultTimeout', '600000', '操作超时时间', '1', '7', 'monitor', '日志监控'), ('50', '5', 'defaultSlowTimeout', '3000', '默认慢操作记录', '1', '6', 'monitor', '日志监控'), ('51', '5', 'MONITOR_MERGE_THREAD_NUM', '5', '监控线程数', '1', '4', 'monitor', '日志监控'), ('52', '5', 'MONITOR_QUEUE_SIZE', '10000', '监控队列长度', '1', '3', 'monitor', '日志监控'), ('53', '5', 'monitorInterval', '60000', '监控间隔时间', '1', '2', 'monitor', '日志监控'), ('54', '6', 'defaultTimeout', '600000', '操作超时时间', '1', '7', 'monitor', '日志监控'), ('55', '6', 'defaultSlowTimeout', '3000', '默认慢操作记录', '1', '6', 'monitor', '日志监控'), ('56', '6', 'MONITOR_MERGE_THREAD_NUM', '5', '监控线程数', '1', '4', 'monitor', '日志监控'), ('57', '6', 'MONITOR_QUEUE_SIZE', '10000', '监控队列长度', '1', '3', 'monitor', '日志监控'), ('58', '6', 'monitorInterval', '60000', '监控间隔时间', '1', '2', 'monitor', '日志监控'), ('59', '5', 'filterChain', 'monitorFilter', '拦截器设置', '1', '7', 'gen', '通用'), ('60', '4', 'filterChain', 'monitorFilter', '拦截器设置', '1', '7', 'gen', '通用'), ('61', '6', 'filterChain', 'monitorFilter', '拦截器设置', '1', '7', 'gen', '通用');
COMMIT;

-- ----------------------------
--  Table structure for `meta_table_index`
-- ----------------------------
DROP TABLE IF EXISTS `meta_table_index`;
CREATE TABLE `meta_table_index` (
  `table_id` bigint(20) NOT NULL,
  `index_id` bigint(20) NOT NULL,
  `remark` longtext COLLATE utf8_bin,
  PRIMARY KEY (`table_id`,`index_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=COMPACT;

-- ----------------------------
--  Table structure for `sys_icon`
-- ----------------------------
DROP TABLE IF EXISTS `sys_icon`;
CREATE TABLE `sys_icon` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL,
  `mark` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mark_UNIQUE` (`mark`)
) ENGINE=InnoDB AUTO_INCREMENT=364 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
--  Records of `sys_icon`
-- ----------------------------
BEGIN;
INSERT INTO `sys_icon` VALUES ('1', 'adjust', 'icon-adjust', 'css'), ('2', null, 'icon-exclamation-sign', 'css'), ('3', null, 'icon-money', 'css'), ('4', null, 'icon-signal', 'css'), ('5', null, 'icon-asterisk', 'css'), ('6', null, 'icon-external-link', 'css'), ('7', null, 'icon-move', 'css'), ('8', null, 'icon-signin', 'css'), ('9', null, 'icon-ban-circle', 'css'), ('10', null, 'icon-eye-close', 'css'), ('11', null, 'icon-music', 'css'), ('12', null, 'icon-signout', 'css'), ('13', null, 'icon-bar-chart', 'css'), ('14', null, 'icon-eye-open', 'css'), ('15', null, 'icon-off', 'css'), ('16', null, 'icon-sitemap', 'css'), ('20', null, 'icon-barcode', 'css'), ('21', null, 'icon-facetime-video', 'css'), ('22', null, 'icon-ok', 'css'), ('23', null, 'icon-sort', 'css'), ('24', null, 'icon-beaker', 'css'), ('25', null, 'icon-film', 'css'), ('26', null, 'icon-ok-circle', 'css'), ('27', null, 'icon-sort-down', 'css'), ('28', null, 'icon-bell', 'css'), ('29', null, 'icon-filter', 'css'), ('30', null, 'icon-ok-sign', 'css'), ('31', null, 'icon-sort-up', 'css'), ('32', null, ' icon-bolt', 'css'), ('33', null, 'icon-fire', 'css'), ('34', null, 'icon-pencil', 'css'), ('35', null, 'icon-star', 'css'), ('36', null, 'icon-book', 'css'), ('37', null, 'icon-flag', 'css'), ('38', null, 'icon-picture', 'css'), ('39', null, 'icon-star-empty', 'css'), ('40', null, 'icon-bookmark', 'css'), ('41', null, 'icon-folder-close', 'css'), ('42', null, 'icon-plane', 'css'), ('43', null, 'icon-star-half', 'css'), ('44', null, 'icon-bookmark-empty', 'css'), ('45', null, 'icon-folder-open', 'css'), ('46', null, 'icon-plus', 'css'), ('47', null, 'icon-tag', 'css'), ('48', null, 'icon-briefcase', 'css'), ('49', null, 'icon-gift', 'css'), ('50', null, 'icon-plus-sign', 'css'), ('51', null, 'icon-tags', 'css'), ('52', null, 'icon-bullhorn', 'css'), ('53', null, 'icon-glass', 'css'), ('54', null, 'icon-print', 'css'), ('55', null, 'icon-tasks', 'css'), ('56', null, 'icon-calendar', 'css'), ('57', null, 'icon-globe', 'css'), ('58', null, 'icon-pushpin', 'css'), ('59', null, 'icon-thumbs-down', 'css'), ('60', null, 'icon-camera', 'css'), ('61', null, 'icon-group', 'css'), ('62', null, 'icon-qrcode', 'css'), ('63', null, 'icon-thumbs-up', 'css'), ('64', null, 'icon-camera-retro', 'css'), ('65', null, 'icon-certificate', 'css'), ('66', null, 'icon-check', 'css'), ('67', null, 'icon-check-empty', 'css'), ('68', null, 'icon-cloud', 'css'), ('69', null, 'icon-cog', 'css'), ('70', null, 'icon-cogs', 'css'), ('71', null, 'icon-comment', 'css'), ('72', null, 'icon-comment-alt', 'css'), ('73', null, 'icon-comments', 'css'), ('74', null, 'icon-comments-alt', 'css'), ('75', null, 'icon-credit-card', 'css'), ('76', null, 'icon-dashboard', 'css'), ('77', null, 'icon-download', 'css'), ('78', null, 'icon-download-alt', 'css'), ('79', null, 'icon-edit', 'css'), ('80', null, 'icon-envelope', 'css'), ('81', null, 'icon-envelope-alt', 'css'), ('82', null, 'icon-hdd', 'css'), ('83', null, 'icon-headphones', 'css'), ('84', null, 'icon-heart', 'css'), ('85', null, 'icon-heart-empty', 'css'), ('86', null, 'icon-home', 'css'), ('87', null, 'icon-inbox', 'css'), ('88', null, 'icon-info-sign', 'css'), ('89', null, 'icon-key', 'css'), ('90', null, 'icon-leaf', 'css'), ('91', null, 'icon-legal', 'css'), ('92', null, 'icon-lemon', 'css'), ('93', null, 'icon-lock', 'css'), ('94', null, 'icon-unlock', 'css'), ('95', null, 'icon-magic', 'css'), ('96', null, 'icon-magnet', 'css'), ('97', null, 'icon-map-marker', 'css'), ('98', null, 'icon-minus', 'css'), ('99', null, 'icon-minus-sign', 'css'), ('100', null, 'icon-question-sign', 'css'), ('101', null, 'icon-random', 'css'), ('102', null, 'icon-refresh', 'css'), ('103', null, 'icon-remove', 'css'), ('104', null, 'icon-remove-circle', 'css'), ('105', null, 'icon-remove-sign', 'css'), ('106', null, 'icon-reorder', 'css'), ('107', null, 'icon-resize-horizontal', 'css'), ('108', null, 'icon-resize-vertical', 'css'), ('109', null, 'icon-retweet', 'css'), ('110', null, 'icon-road', 'css'), ('111', null, 'icon-rss', 'css'), ('112', null, 'icon-screenshot', 'css'), ('113', null, 'icon-search', 'css'), ('114', null, 'icon-share', 'css'), ('115', null, 'icon-share-alt', 'css'), ('116', null, 'icon-shopping-cart', 'css'), ('117', null, 'icon-time', 'css'), ('118', null, 'icon-tint', 'css'), ('119', null, 'icon-trash', 'css'), ('120', null, 'icon-trophy', 'css'), ('121', null, 'icon-truck', 'css'), ('122', null, 'icon-umbrella', 'css'), ('123', null, 'icon-upload', 'css'), ('124', null, 'icon-upload-alt', 'css'), ('125', null, 'icon-user', 'css'), ('126', null, 'icon-user-md', 'css'), ('127', null, 'icon-volume-off', 'css'), ('128', null, 'icon-volume-down', 'css'), ('129', null, 'icon-volume-up', 'css'), ('130', null, 'icon-warning-sign', 'css'), ('131', null, 'icon-wrench', 'css'), ('132', null, 'icon-zoom-in', 'css'), ('133', null, 'icon-zoom-out', 'css'), ('134', null, 'ztree_edit', 'png'), ('135', null, 'ztree_root_close', 'png'), ('136', null, 'ztree_root_open', 'png'), ('137', null, 'ztree_star', 'png'), ('138', null, 'ztree_calendar', 'png'), ('139', null, 'ztree_heart', 'png'), ('140', null, 'ztree_save', 'png'), ('141', null, 'ztree_msg', 'png'), ('142', null, 'ztree_report', 'png'), ('143', null, 'ztree_setting', 'png'), ('148', null, 'ztree_folder_open', 'png'), ('149', null, 'ztree_folder_close', 'png'), ('150', null, 'ztree_file2', 'png'), ('151', null, 'ztree_edit2', 'png'), ('152', null, 'ztree_delete', 'png'), ('153', null, 'ztree_arrow', 'png'), ('154', null, 'ztree_plus', 'png'), ('155', null, 'ztree_minus', 'png'), ('156', null, 'ztree_add', 'png'), ('157', null, 'ztree_cicle_arrow_left1', 'png'), ('158', null, 'ztree_cicle_arrow_right1', 'png'), ('159', null, 'ztree_cicle_arrow_left2', 'png'), ('160', null, 'ztree_cicle_arrow_right2', 'png'), ('161', null, 'ztree_cicle_arrow', 'png'), ('162', null, 'ztree_star_light', 'png'), ('163', null, 'ztree_star_dark', 'png'), ('164', null, 'diy_icon_01_01', 'png'), ('165', null, 'diy_icon_01_02', 'png'), ('166', null, 'diy_icon_01_03', 'png'), ('167', null, 'diy_icon_01_04', 'png'), ('168', null, 'diy_icon_01_05', 'png'), ('169', null, 'diy_icon_01_06', 'png'), ('170', null, 'diy_icon_01_07', 'png'), ('171', null, 'diy_icon_01_08', 'png'), ('172', null, 'diy_icon_01_09', 'png'), ('173', null, 'diy_icon_01_10', 'png'), ('174', null, 'diy_icon_01_11', 'png'), ('175', null, 'diy_icon_01_12', 'png'), ('176', null, 'diy_icon_01_13', 'png'), ('177', null, 'diy_icon_01_14', 'png'), ('178', null, 'diy_icon_01_15', 'png'), ('179', null, 'diy_icon_01_16', 'png'), ('180', null, 'diy_icon_01_17', 'png'), ('181', null, 'diy_icon_01_18', 'png'), ('182', null, 'diy_icon_01_19', 'png'), ('183', null, 'diy_icon_01_20', 'png'), ('184', null, 'diy_icon_01_21', 'png'), ('185', null, 'diy_icon_01_22', 'png'), ('186', null, 'diy_icon_01_23', 'png'), ('187', null, 'diy_icon_01_24', 'png'), ('188', null, 'diy_icon_01_25', 'png'), ('189', null, 'diy_icon_01_26', 'png'), ('190', null, 'diy_icon_01_27', 'png'), ('191', null, 'diy_icon_01_28', 'png'), ('192', null, 'diy_icon_01_29', 'png'), ('193', null, 'diy_icon_01_30', 'png'), ('194', null, 'diy_icon_01_31', 'png'), ('195', null, 'diy_icon_01_32', 'png'), ('196', null, 'diy_icon_01_33', 'png'), ('197', null, 'diy_icon_01_34', 'png'), ('198', null, 'diy_icon_01_35', 'png'), ('199', null, 'diy_icon_01_36', 'png'), ('200', null, 'diy_icon_01_37', 'png'), ('201', null, 'diy_icon_01_38', 'png'), ('202', null, 'diy_icon_01_39', 'png'), ('203', null, 'diy_icon_01_40', 'png'), ('204', null, 'diy_icon_01_41', 'png'), ('205', null, 'diy_icon_01_42', 'png'), ('206', null, 'diy_icon_01_43', 'png'), ('207', null, 'diy_icon_01_44', 'png'), ('208', null, 'diy_icon_01_45', 'png'), ('209', null, 'diy_icon_01_46', 'png'), ('210', null, 'diy_icon_01_47', 'png'), ('211', null, 'diy_icon_01_48', 'png'), ('212', null, 'diy_icon_01_49', 'png'), ('213', null, 'diy_icon_01_50', 'png'), ('214', null, 'diy_icon_02_01', 'png'), ('215', null, 'diy_icon_02_02', 'png'), ('216', null, 'diy_icon_02_03', 'png'), ('217', null, 'diy_icon_02_04', 'png'), ('218', null, 'diy_icon_02_05', 'png'), ('219', null, 'diy_icon_02_06', 'png'), ('220', null, 'diy_icon_02_07', 'png'), ('221', null, 'diy_icon_02_08', 'png'), ('222', null, 'diy_icon_02_09', 'png'), ('223', null, 'diy_icon_02_10', 'png'), ('224', null, 'diy_icon_02_11', 'png'), ('225', null, 'diy_icon_02_12', 'png'), ('226', null, 'diy_icon_02_13', 'png'), ('227', null, 'diy_icon_02_14', 'png'), ('228', null, 'diy_icon_02_15', 'png'), ('229', null, 'diy_icon_02_16', 'png'), ('230', null, 'diy_icon_02_17', 'png'), ('231', null, 'diy_icon_02_18', 'png'), ('232', null, 'diy_icon_02_19', 'png'), ('233', null, 'diy_icon_02_20', 'png'), ('234', null, 'diy_icon_02_21', 'png'), ('235', null, 'diy_icon_02_22', 'png'), ('236', null, 'diy_icon_02_23', 'png'), ('237', null, 'diy_icon_02_24', 'png'), ('238', null, 'diy_icon_02_25', 'png'), ('239', null, 'diy_icon_02_26', 'png'), ('240', null, 'diy_icon_02_27', 'png'), ('241', null, 'diy_icon_02_28', 'png'), ('242', null, 'diy_icon_02_29', 'png'), ('243', null, 'diy_icon_02_30', 'png'), ('244', null, 'diy_icon_02_31', 'png'), ('245', null, 'diy_icon_02_32', 'png'), ('246', null, 'diy_icon_02_33', 'png'), ('247', null, 'diy_icon_02_34', 'png'), ('248', null, 'diy_icon_02_35', 'png'), ('249', null, 'diy_icon_02_36', 'png'), ('250', null, 'diy_icon_02_37', 'png'), ('251', null, 'diy_icon_02_38', 'png'), ('252', null, 'diy_icon_02_39', 'png'), ('253', null, 'diy_icon_02_40', 'png'), ('254', null, 'diy_icon_02_41', 'png'), ('255', null, 'diy_icon_02_42', 'png'), ('256', null, 'diy_icon_02_43', 'png'), ('257', null, 'diy_icon_02_44', 'png'), ('258', null, 'diy_icon_02_45', 'png'), ('259', null, 'diy_icon_02_46', 'png'), ('260', null, 'diy_icon_02_47', 'png'), ('261', null, 'diy_icon_02_48', 'png'), ('262', null, 'diy_icon_02_49', 'png'), ('263', null, 'diy_icon_02_50', 'png'), ('264', null, 'diy_icon_03_01', 'png'), ('265', null, 'diy_icon_03_02', 'png'), ('266', null, 'diy_icon_03_03', 'png'), ('267', null, 'diy_icon_03_04', 'png'), ('268', null, 'diy_icon_03_05', 'png'), ('269', null, 'diy_icon_03_06', 'png'), ('270', null, 'diy_icon_03_07', 'png'), ('271', null, 'diy_icon_03_08', 'png'), ('272', null, 'diy_icon_03_09', 'png'), ('273', null, 'diy_icon_03_10', 'png'), ('274', null, 'diy_icon_03_11', 'png'), ('275', null, 'diy_icon_03_12', 'png'), ('276', null, 'diy_icon_03_13', 'png'), ('277', null, 'diy_icon_03_14', 'png'), ('278', null, 'diy_icon_03_15', 'png'), ('279', null, 'diy_icon_03_16', 'png'), ('280', null, 'diy_icon_03_17', 'png'), ('281', null, 'diy_icon_03_18', 'png'), ('282', null, 'diy_icon_03_19', 'png'), ('283', null, 'diy_icon_03_20', 'png'), ('284', null, 'diy_icon_03_21', 'png'), ('285', null, 'diy_icon_03_22', 'png'), ('286', null, 'diy_icon_03_23', 'png'), ('287', null, 'diy_icon_03_24', 'png'), ('288', null, 'diy_icon_03_25', 'png'), ('289', null, 'diy_icon_03_26', 'png'), ('290', null, 'diy_icon_03_27', 'png'), ('291', null, 'diy_icon_03_28', 'png'), ('292', null, 'diy_icon_03_29', 'png'), ('293', null, 'diy_icon_03_30', 'png'), ('294', null, 'diy_icon_03_31', 'png'), ('295', null, 'diy_icon_03_32', 'png'), ('296', null, 'diy_icon_03_33', 'png'), ('297', null, 'diy_icon_03_34', 'png'), ('298', null, 'diy_icon_03_35', 'png'), ('299', null, 'diy_icon_03_36', 'png'), ('300', null, 'diy_icon_03_37', 'png'), ('301', null, 'diy_icon_03_38', 'png'), ('302', null, 'diy_icon_03_39', 'png'), ('303', null, 'diy_icon_03_40', 'png'), ('304', null, 'diy_icon_03_41', 'png'), ('305', null, 'diy_icon_03_42', 'png'), ('306', null, 'diy_icon_03_43', 'png'), ('307', null, 'diy_icon_03_44', 'png'), ('308', null, 'diy_icon_03_45', 'png'), ('309', null, 'diy_icon_03_46', 'png'), ('310', null, 'diy_icon_03_47', 'png'), ('311', null, 'diy_icon_03_48', 'png'), ('312', null, 'diy_icon_03_49', 'png'), ('313', null, 'diy_icon_03_50', 'png'), ('314', null, 'diy_icon_04_01', 'png'), ('315', null, 'diy_icon_04_02', 'png'), ('316', null, 'diy_icon_04_03', 'png'), ('317', null, 'diy_icon_04_04', 'png'), ('318', null, 'diy_icon_04_05', 'png'), ('319', null, 'diy_icon_04_06', 'png'), ('320', null, 'diy_icon_04_07', 'png'), ('321', null, 'diy_icon_04_08', 'png'), ('322', null, 'diy_icon_04_09', 'png'), ('323', null, 'diy_icon_04_10', 'png'), ('324', null, 'diy_icon_04_11', 'png'), ('325', null, 'diy_icon_04_12', 'png'), ('326', null, 'diy_icon_04_13', 'png'), ('327', null, 'diy_icon_04_14', 'png'), ('328', null, 'diy_icon_04_15', 'png'), ('329', null, 'diy_icon_04_16', 'png'), ('330', null, 'diy_icon_04_17', 'png'), ('331', null, 'diy_icon_04_18', 'png'), ('332', null, 'diy_icon_04_19', 'png'), ('333', null, 'diy_icon_04_20', 'png'), ('334', null, 'diy_icon_04_21', 'png'), ('335', null, 'diy_icon_04_22', 'png'), ('336', null, 'diy_icon_04_23', 'png'), ('337', null, 'diy_icon_04_24', 'png'), ('338', null, 'diy_icon_04_25', 'png'), ('339', null, 'diy_icon_04_26', 'png'), ('340', null, 'diy_icon_04_27', 'png'), ('341', null, 'diy_icon_04_28', 'png'), ('342', null, 'diy_icon_04_29', 'png'), ('343', null, 'diy_icon_04_30', 'png'), ('344', null, 'diy_icon_04_31', 'png'), ('345', null, 'diy_icon_04_32', 'png'), ('346', null, 'diy_icon_04_33', 'png'), ('347', null, 'diy_icon_04_34', 'png'), ('348', null, 'diy_icon_04_35', 'png'), ('349', null, 'diy_icon_04_36', 'png'), ('350', null, 'diy_icon_04_37', 'png'), ('351', null, 'diy_icon_04_38', 'png'), ('352', null, 'diy_icon_04_39', 'png'), ('353', null, 'diy_icon_04_40', 'png'), ('354', null, 'diy_icon_04_41', 'png'), ('355', null, 'diy_icon_04_42', 'png'), ('356', null, 'diy_icon_04_43', 'png'), ('357', null, 'diy_icon_04_44', 'png'), ('358', null, 'diy_icon_04_45', 'png'), ('359', null, 'diy_icon_04_46', 'png'), ('360', null, 'diy_icon_04_47', 'png'), ('361', null, 'diy_icon_04_48', 'png'), ('362', null, 'diy_icon_04_49', 'png'), ('363', null, 'diy_icon_04_50', 'png');
COMMIT;

-- ----------------------------
--  Table structure for `sys_log`
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `content` varchar(255) DEFAULT NULL,
  `operName` varchar(255) DEFAULT NULL,
  `operTime` datetime DEFAULT NULL,
  `result` int(11) NOT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `ip` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKC3427A92D8327538` (`userId`),
  CONSTRAINT `sys_log_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `sys_user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=84 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
--  Table structure for `sys_res`
-- ----------------------------
DROP TABLE IF EXISTS `sys_res`;
CREATE TABLE `sys_res` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `authorize` varchar(255) DEFAULT NULL,
  `grade` int(11) NOT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `orderNo` int(11) NOT NULL,
  `permsString` varchar(255) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `resString` varchar(255) DEFAULT NULL,
  `parent_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKC3428FEED6C7D0A5` (`parent_id`),
  CONSTRAINT `sys_res_ibfk_1` FOREIGN KEY (`parent_id`) REFERENCES `sys_res` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
--  Records of `sys_res`
-- ----------------------------
BEGIN;
INSERT INTO `sys_res` VALUES ('1', null, '1', 'ztree_root_close', '系统管理', '1', 'sys', '系统管理', '/sys', '5'), ('2', null, '2', 'diy_icon_01_05', '用户管理', '1', 'sys:user', '用户管理', '/sys/user/list', '1'), ('3', null, '2', 'diy_icon_01_10', '角色管理', '2', 'sys:role', '角色管理', '/sys/role/list', '1'), ('4', null, '2', 'ztree_report', '资源菜单', '3', 'sys:resource', '资源管理', '/sys/resource/list', '1'), ('5', null, '0', '', 'system', '1', 'system', '最高的节点只能有一个', '/system', null), ('7', null, '3', 'icon-tasks', '用户列表', '1', 'sys:user:list', '用户列表', '/sys/user/list', '2'), ('8', null, '3', 'icon-plus', '添加用户', '2', 'sys:user:add', '添加用户', '/sys/user/add', '2'), ('9', null, '3', 'icon-minus', '删除用户', '3', 'sys:user:delete', '', '/sys/user/delete', '2'), ('10', null, '3', 'icon-pencil', '修改用户', '4', 'sys:user:update', '', '/sys/user/update', '2'), ('11', null, '3', 'icon-tasks', '角色列表', '1', 'sys:role:list', '', '/sys/role/list', '3'), ('12', null, '3', 'icon-plus', '添加角色', '2', 'sys:role:add', '', '/sys/role/add', '3'), ('13', null, '3', 'icon-minus', '删除角色', '3', 'sys:role:delete', '', '/sys/role/delete', '3'), ('14', null, '3', 'icon-pencil', '修改角色', '4', 'sys:role:update', '', '/sys/role/update', '3'), ('15', null, '3', 'icon-tasks', '资源列表', '1', 'sys:resource:list', '', '/sys/resource/list', '4'), ('16', null, '3', 'icon-plus', '添加资源', '2', 'sys:resource:add', '', '/sys/resource/add', '4'), ('17', null, '3', 'icon-minus', '删除资源', '3', 'sys:resource:delete', '', '/sys/resource/delete', '4'), ('18', null, '3', 'icon-pencil', '修改资源', '4', 'sys:resource:update', '', '/sys/resource/update', '4'), ('19', null, '2', 'diy_icon_01_02', '图标管理', '4', 'sys:user:list', '', '/sys/icon/list', '1'), ('20', null, '3', 'icon-tasks', '图标列表', '1', 'sys:icon:list', '', '/sys/icon/list', '19'), ('21', null, '3', 'icon-plus', '添加图标', '2', 'sys:icon:add', '', '/sys/icon/add', '19'), ('22', null, '3', 'icon-minus', '删除图标', '3', 'sys:icon:delete', '', '/sys/icon/delete', '19'), ('23', null, '3', 'icon-pencil', '修改图标', '4', 'sys:icon:update', '', '/sys/icon/update', '19'), ('24', null, '3', 'ztree_file2', '详细信息', '5', 'sys:user:show', '', '/sys/user/show', '2'), ('25', null, '3', 'ztree_file2', '详细信息', '5', 'sys:role:show', '', '/sys/role/show', '3'), ('31', null, '3', 'icon-key', '更改用户状态', '6', 'sys:user:changeUserStatus', '', '/sys/user/changeUserStatus', '2'), ('36', null, '2', 'diy_icon_04_19', '系统日志', '5', 'sys:log:list', '', '/sys/log/list', '1'), ('37', null, '3', 'icon-tasks', '日志列表', '1', 'sys:log:list', '', '/sys/log/list', '36'), ('40', null, '3', 'icon-cog', '删除日志', '2', 'sys:log:delete', '', '/sys/log/delete', '36'), ('53', null, '1', 'icon-cog', 'es管理', '0', 'es:esadmin', 'es', '/es/esadmin', '5'), ('54', null, '2', 'icon-cog', 'head', '8', 'es:head', 'head', '/esmgnt/thirdparty/head', '53'), ('55', null, '2', 'icon-cog', 'kopf', '9', 'es:kopf', 'kopf', '/esmgnt/thirdparty/kopf', '53'), ('56', null, '2', 'icon-cog', '元数据管理', '2', 'es:monitor', '', '/meta/DBTable/list', '53'), ('57', null, '2', 'icon-cog', '集群管理', '1', 'es:clustermgnt', '', '/meta/clustermgnt/list', '53'), ('59', null, '2', 'icon-cog', 'SQL查询', '4', 'es:sqlquery', '', '/commonQuery/sqlquery', '53'), ('61', null, '3', 'icon-cog', '添加集群', '1', 'es:clustermgnt:add', '', '/meta/clustermgnt/add', '57'), ('62', null, '3', 'icon-cog', '集群列表', '0', 'es:clustermgnt:list', '', '/meta/clustermgnt/list', '57'), ('63', null, '3', 'icon-cog', '删除集群', '3', 'es:clustermgnt:delete', '', '/meta/clustermgnt/del', '57'), ('64', null, '3', 'icon-cog', '修改集群', '2', 'es:clustermgnt:update', '', '/meta/clustermgnt/update', '57'), ('65', null, '3', 'icon-cog', '详细信息', '4', 'es:clustermgnt:show', '', '/meta/clustermgnt/show', '57'), ('66', null, '3', 'icon-cog', '集群监控', '5', 'es:clustermgnt:monitor', '', '/meta/clustermgnt/monitor', '57'), ('67', null, '3', 'icon-cog', '启用/停用', '6', 'es:clustermgnt:start', '', '/meta/clustermgnt/start', '57'), ('68', null, '3', 'icon-cog', '设置', '7', 'es:clustermgnt:setup', '', '/meta/clustermgnt/setup', '57'), ('69', null, '3', 'icon-cog', '监控', '8', 'es:clustermgnt:monitor', '', '/meta/clustermgnt/monitor', '57'), ('70', null, '2', 'icon-cog', 'es内存监控', '7', 'es:monitor:clusters', '', '/esMonitor/clusters', '53'), ('71', null, '2', 'icon-cog', 'es日志查询', '5', 'es:esslow', '', '/esSlowlog/list', '53'), ('72', null, '2', 'icon-cog', 'es拦截管理', '6', 'es:blackfilter', '', '/blackfilter/list', '53'), ('73', null, '2', 'icon-cog', '队列监控', '7', 'es:monitorlog', '', '/monitorLog/list', '53');
COMMIT;

-- ----------------------------
--  Table structure for `sys_role`
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `authorize` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `realName` varchar(255) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
--  Records of `sys_role`
-- ----------------------------
BEGIN;
INSERT INTO `sys_role` VALUES ('1', null, 'superAdmin', '管理员', '??????'), ('9', null, 'showcasers', '演示分配角色', '');
COMMIT;

-- ----------------------------
--  Table structure for `sys_role_res`
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_res`;
CREATE TABLE `sys_role_res` (
  `role_id` bigint(20) NOT NULL,
  `res_id` bigint(20) NOT NULL,
  PRIMARY KEY (`role_id`,`res_id`),
  KEY `FK9A255A8923AE94EF` (`res_id`),
  KEY `FK9A255A895C176D41` (`role_id`),
  CONSTRAINT `sys_role_res_ibfk_1` FOREIGN KEY (`res_id`) REFERENCES `sys_res` (`id`) ON DELETE CASCADE,
  CONSTRAINT `sys_role_res_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `sys_role` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
--  Records of `sys_role_res`
-- ----------------------------
BEGIN;
INSERT INTO `sys_role_res` VALUES ('1', '1'), ('9', '1'), ('1', '2'), ('9', '2'), ('1', '3'), ('9', '3'), ('1', '4'), ('9', '4'), ('1', '5'), ('9', '5'), ('1', '7'), ('9', '7'), ('1', '8'), ('9', '8'), ('1', '9'), ('9', '9'), ('1', '10'), ('9', '10'), ('1', '11'), ('9', '11'), ('1', '12'), ('9', '12'), ('1', '13'), ('9', '13'), ('1', '14'), ('9', '14'), ('1', '15'), ('9', '15'), ('1', '16'), ('9', '16'), ('1', '17'), ('9', '17'), ('1', '18'), ('9', '18'), ('1', '19'), ('9', '19'), ('1', '20'), ('9', '20'), ('1', '21'), ('9', '21'), ('1', '22'), ('9', '22'), ('1', '23'), ('9', '23'), ('1', '24'), ('9', '24'), ('1', '25'), ('9', '25'), ('1', '31'), ('9', '31'), ('1', '36'), ('9', '36'), ('1', '37'), ('9', '37'), ('1', '40'), ('9', '40'), ('1', '53'), ('1', '54'), ('1', '55'), ('1', '56'), ('1', '57'), ('1', '59'), ('1', '61'), ('1', '62'), ('1', '63'), ('1', '64'), ('1', '65'), ('1', '66'), ('1', '67'), ('1', '68'), ('1', '69'), ('1', '70'), ('1', '71'), ('1', '72'), ('1', '73');
COMMIT;

-- ----------------------------
--  Table structure for `sys_test`
-- ----------------------------
DROP TABLE IF EXISTS `sys_test`;
CREATE TABLE `sys_test` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `aaa` varchar(255) DEFAULT NULL,
  `bbb` varchar(255) DEFAULT NULL,
  `ccc` varchar(255) DEFAULT NULL,
  `ddd` varchar(255) DEFAULT NULL,
  `eee` varchar(255) DEFAULT NULL,
  `eight` varchar(255) DEFAULT NULL,
  `fff` varchar(255) DEFAULT NULL,
  `five` varchar(255) DEFAULT NULL,
  `four` varchar(255) DEFAULT NULL,
  `ggg` varchar(255) DEFAULT NULL,
  `hhh` varchar(255) DEFAULT NULL,
  `iii` varchar(255) DEFAULT NULL,
  `jjj` varchar(255) DEFAULT NULL,
  `kkk` varchar(255) DEFAULT NULL,
  `lll` varchar(255) DEFAULT NULL,
  `nine` varchar(255) DEFAULT NULL,
  `one` varchar(255) DEFAULT NULL,
  `seven` varchar(255) DEFAULT NULL,
  `six` varchar(255) DEFAULT NULL,
  `ten` varchar(255) DEFAULT NULL,
  `three` varchar(255) DEFAULT NULL,
  `tow` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
--  Records of `sys_test`
-- ----------------------------
BEGIN;
INSERT INTO `sys_test` VALUES ('3', 'ss', 'dd', 'ss', 'aa', 'dd', 'dd', 'aa', 'dd', 'dd', 'aa', 'dd', 'aa', 'dd', 'ssd', 'ss', 'aa', 'sss', 'dd', 'aa', 'dd', 'aa', 'aa');
COMMIT;

-- ----------------------------
--  Table structure for `sys_timetask`
-- ----------------------------
DROP TABLE IF EXISTS `sys_timetask`;
CREATE TABLE `sys_timetask` (
  `id` bigint(20) NOT NULL,
  `createby` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `createdate` datetime DEFAULT NULL,
  `createname` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `cronexpression` varchar(100) COLLATE utf8_bin NOT NULL,
  `iseffect` varchar(1) COLLATE utf8_bin NOT NULL,
  `isstart` varchar(1) COLLATE utf8_bin NOT NULL,
  `taskdescribe` varchar(50) COLLATE utf8_bin NOT NULL,
  `taskid` varchar(100) COLLATE utf8_bin NOT NULL,
  `updateby` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `updatedate` datetime DEFAULT NULL,
  `updatename` varchar(32) COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=COMPACT;

-- ----------------------------
--  Records of `sys_timetask`
-- ----------------------------
BEGIN;
INSERT INTO `sys_timetask` VALUES ('1', 'admin', '2015-04-02 19:22:49', '管理员', '0 0/1 * * * ?', '1', '0', '消息中间件定时任务', 'smsSendTaskCronTrigger', 'admin', '2015-04-02 20:03:01', '管理员'), ('2', null, null, null, '0 0/1 * * * ?', '1', '1', '测试Demo', 'taskDemoServiceTaskCronTrigger', 'admin', '2015-04-02 19:49:44', '管理员');
COMMIT;

-- ----------------------------
--  Table structure for `sys_user`
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `address` varchar(255) DEFAULT NULL,
  `createDate` datetime NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `loginId` varchar(255) NOT NULL,
  `mobilePhone` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `passwd` varchar(255) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `status` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `loginId` (`loginId`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
--  Records of `sys_user`
-- ----------------------------
BEGIN;
INSERT INTO `sys_user` VALUES ('4', 'ssss', '2013-03-07 00:00:00', 'sa@ww.cc', 'user2', '15222233426', 'joezxh', '8d2209bf7ec9ac2eec597eb378a7cbf5', '123', '1'), ('5', 'hangzhou', '2014-03-14 00:00:00', '1489123074@qq.com', 'admin', '13076001234', 'admin', 'f6fdffe48c908deb0f4c3bd36c032e72', '???', '1');
COMMIT;

-- ----------------------------
--  Table structure for `sys_user_role`
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `user_id` bigint(20) NOT NULL,
  `role_id` bigint(20) NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `FKAABB7D585C176D41` (`role_id`),
  KEY `FKAABB7D581423121` (`user_id`),
  CONSTRAINT `sys_user_role_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `sys_user` (`id`) ON DELETE CASCADE,
  CONSTRAINT `sys_user_role_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `sys_role` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
--  Records of `sys_user_role`
-- ----------------------------
BEGIN;
INSERT INTO `sys_user_role` VALUES ('5', '1');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
