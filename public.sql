/*
 Navicat Premium Data Transfer

 Source Server         : localhost pqsql9.4
 Source Server Type    : PostgreSQL
 Source Server Version : 90405
 Source Host           : localhost
 Source Database       : datax
 Source Schema         : public

 Target Server Type    : PostgreSQL
 Target Server Version : 90405
 File Encoding         : utf-8

 Date: 12/14/2015 20:17:04 PM
*/

-- ----------------------------
--  Sequence structure for seq_cms_article
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."seq_cms_article";
CREATE SEQUENCE "public"."seq_cms_article" INCREMENT 1 START 45 MAXVALUE 9223372036854775807 MINVALUE 1 CACHE 1;
ALTER TABLE "public"."seq_cms_article" OWNER TO "postgres";

-- ----------------------------
--  Sequence structure for seq_cms_category
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."seq_cms_category";
CREATE SEQUENCE "public"."seq_cms_category" INCREMENT 1 START 37 MAXVALUE 9223372036854775807 MINVALUE 1 CACHE 1;
ALTER TABLE "public"."seq_cms_category" OWNER TO "postgres";

-- ----------------------------
--  Sequence structure for seq_cms_comment
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."seq_cms_comment";
CREATE SEQUENCE "public"."seq_cms_comment" INCREMENT 1 START 415 MAXVALUE 9223372036854775807 MINVALUE 1 CACHE 1;
ALTER TABLE "public"."seq_cms_comment" OWNER TO "postgres";

-- ----------------------------
--  Sequence structure for seq_cms_link
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."seq_cms_link";
CREATE SEQUENCE "public"."seq_cms_link" INCREMENT 1 START 14 MAXVALUE 9223372036854775807 MINVALUE 1 CACHE 1;
ALTER TABLE "public"."seq_cms_link" OWNER TO "postgres";

-- ----------------------------
--  Sequence structure for seq_cms_site
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."seq_cms_site";
CREATE SEQUENCE "public"."seq_cms_site" INCREMENT 1 START 2 MAXVALUE 9223372036854775807 MINVALUE 1 CACHE 1;
ALTER TABLE "public"."seq_cms_site" OWNER TO "postgres";

-- ----------------------------
--  Sequence structure for seq_finace
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."seq_finace";
CREATE SEQUENCE "public"."seq_finace" INCREMENT 1 START 1 MAXVALUE 9223372036854775807 MINVALUE 1 CACHE 1;
ALTER TABLE "public"."seq_finace" OWNER TO "postgres";

-- ----------------------------
--  Sequence structure for seq_oa_leave
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."seq_oa_leave";
CREATE SEQUENCE "public"."seq_oa_leave" INCREMENT 1 START 14 MAXVALUE 9223372036854775807 MINVALUE 1 CACHE 1;
ALTER TABLE "public"."seq_oa_leave" OWNER TO "postgres";

-- ----------------------------
--  Sequence structure for seq_sys_dict
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."seq_sys_dict";
CREATE SEQUENCE "public"."seq_sys_dict" INCREMENT 1 START 1 MAXVALUE 9223372036854775807 MINVALUE 1 CACHE 1;
ALTER TABLE "public"."seq_sys_dict" OWNER TO "postgres";

-- ----------------------------
--  Sequence structure for seq_sys_icon
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."seq_sys_icon";
CREATE SEQUENCE "public"."seq_sys_icon" INCREMENT 1 START 363 MAXVALUE 9223372036854775807 MINVALUE 1 CACHE 1;
ALTER TABLE "public"."seq_sys_icon" OWNER TO "postgres";

-- ----------------------------
--  Sequence structure for seq_sys_log
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."seq_sys_log";
CREATE SEQUENCE "public"."seq_sys_log" INCREMENT 1 START 29 MAXVALUE 9223372036854775807 MINVALUE 1 CACHE 1;
ALTER TABLE "public"."seq_sys_log" OWNER TO "postgres";

-- ----------------------------
--  Sequence structure for seq_sys_res
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."seq_sys_res";
CREATE SEQUENCE "public"."seq_sys_res" INCREMENT 1 START 65 MAXVALUE 9223372036854775807 MINVALUE 1 CACHE 1;
ALTER TABLE "public"."seq_sys_res" OWNER TO "postgres";

-- ----------------------------
--  Sequence structure for seq_sys_role
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."seq_sys_role";
CREATE SEQUENCE "public"."seq_sys_role" INCREMENT 1 START 9 MAXVALUE 9223372036854775807 MINVALUE 1 CACHE 1;
ALTER TABLE "public"."seq_sys_role" OWNER TO "postgres";

-- ----------------------------
--  Sequence structure for seq_sys_test
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."seq_sys_test";
CREATE SEQUENCE "public"."seq_sys_test" INCREMENT 1 START 3 MAXVALUE 9223372036854775807 MINVALUE 1 CACHE 1;
ALTER TABLE "public"."seq_sys_test" OWNER TO "postgres";

-- ----------------------------
--  Sequence structure for seq_sys_timetask
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."seq_sys_timetask";
CREATE SEQUENCE "public"."seq_sys_timetask" INCREMENT 1 START 1 MAXVALUE 9223372036854775807 MINVALUE 1 CACHE 1;
ALTER TABLE "public"."seq_sys_timetask" OWNER TO "postgres";

-- ----------------------------
--  Sequence structure for seq_sys_user
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."seq_sys_user";
CREATE SEQUENCE "public"."seq_sys_user" INCREMENT 1 START 9 MAXVALUE 9223372036854775807 MINVALUE 1 CACHE 1;
ALTER TABLE "public"."seq_sys_user" OWNER TO "postgres";

-- ----------------------------
--  Table structure for act_ge_property
-- ----------------------------
DROP TABLE IF EXISTS "public"."act_ge_property";
CREATE TABLE "public"."act_ge_property" (
	"name_" varchar(64) NOT NULL COLLATE "default",
	"value_" varchar(300) COLLATE "default",
	"rev_" int4
)
WITH (OIDS=FALSE);
ALTER TABLE "public"."act_ge_property" OWNER TO "postgres";

-- ----------------------------
--  Records of act_ge_property
-- ----------------------------
BEGIN;
INSERT INTO "public"."act_ge_property" VALUES ('next.dbid', '2601', '27');
INSERT INTO "public"."act_ge_property" VALUES ('schema.history', 'create(5.14)', '1');
INSERT INTO "public"."act_ge_property" VALUES ('schema.version', '5.14', '1');
COMMIT;

-- ----------------------------
--  Table structure for act_hi_actinst
-- ----------------------------
DROP TABLE IF EXISTS "public"."act_hi_actinst";
CREATE TABLE "public"."act_hi_actinst" (
	"id_" varchar(64) NOT NULL COLLATE "default",
	"proc_def_id_" varchar(64) NOT NULL COLLATE "default",
	"proc_inst_id_" varchar(64) NOT NULL COLLATE "default",
	"execution_id_" varchar(64) NOT NULL COLLATE "default",
	"act_id_" varchar(255) NOT NULL COLLATE "default",
	"task_id_" varchar(64) COLLATE "default",
	"call_proc_inst_id_" varchar(64) COLLATE "default",
	"act_name_" varchar(255) COLLATE "default",
	"act_type_" varchar(255) NOT NULL COLLATE "default",
	"assignee_" varchar(255) COLLATE "default",
	"start_time_" timestamp(6) NOT NULL,
	"end_time_" timestamp(6) NULL,
	"duration_" int8
)
WITH (OIDS=FALSE);
ALTER TABLE "public"."act_hi_actinst" OWNER TO "postgres";

-- ----------------------------
--  Records of act_hi_actinst
-- ----------------------------
BEGIN;
INSERT INTO "public"."act_hi_actinst" VALUES ('1005', 'leave:1:4', '1001', '1001', 'startevent1', null, null, 'Start', 'startEvent', null, '2014-04-05 23:18:38', '2014-04-05 23:18:38', '66');
INSERT INTO "public"."act_hi_actinst" VALUES ('1008', 'leave:1:4', '1001', '1001', 'deptLeaderAudit', '1009', null, '部门领导审批', 'userTask', 'depman', '2014-04-05 23:18:38', '2014-04-05 23:20:48', '130809');
INSERT INTO "public"."act_hi_actinst" VALUES ('1014', 'leave:1:4', '1001', '1001', 'exclusivegateway5', null, null, 'Exclusive Gateway', 'exclusiveGateway', null, '2014-04-05 23:20:48', '2014-04-05 23:20:48', '1');
INSERT INTO "public"."act_hi_actinst" VALUES ('1015', 'leave:1:4', '1001', '1001', 'hrAudit', '1016', null, '人事审批', 'userTask', 'user2', '2014-04-05 23:20:48', '2014-04-05 23:23:50', '182132');
INSERT INTO "public"."act_hi_actinst" VALUES ('1021', 'leave:1:4', '1001', '1001', 'exclusivegateway6', null, null, 'Exclusive Gateway', 'exclusiveGateway', null, '2014-04-05 23:23:50', '2014-04-05 23:23:50', '0');
INSERT INTO "public"."act_hi_actinst" VALUES ('1022', 'leave:1:4', '1001', '1001', 'modifyApply', '1023', null, '调整申请', 'userTask', 'admin', '2014-04-05 23:23:50', '2014-04-05 23:29:50', '360885');
INSERT INTO "public"."act_hi_actinst" VALUES ('1026', 'leave:1:4', '1001', '1001', 'exclusivegateway7', null, null, 'Exclusive Gateway', 'exclusiveGateway', null, '2014-04-05 23:29:50', '2014-04-05 23:29:50', '0');
INSERT INTO "public"."act_hi_actinst" VALUES ('1027', 'leave:1:4', '1001', '1001', 'deptLeaderAudit', '1028', null, '部门领导审批', 'userTask', 'depman', '2014-04-05 23:29:50', null, null);
INSERT INTO "public"."act_hi_actinst" VALUES ('103', 'leave:1:4', '15', '15', 'exclusivegateway5', null, null, 'Exclusive Gateway', 'exclusiveGateway', null, '2014-03-24 14:59:34', '2014-03-24 14:59:34', '3');
INSERT INTO "public"."act_hi_actinst" VALUES ('104', 'leave:1:4', '15', '15', 'hrAudit', '105', null, '人事审批', 'userTask', 'user2', '2014-03-24 14:59:34', '2014-03-24 21:04:20', '21886362');
INSERT INTO "public"."act_hi_actinst" VALUES ('110', 'leave:1:4', '5', '5', 'exclusivegateway5', null, null, 'Exclusive Gateway', 'exclusiveGateway', null, '2014-03-24 15:20:40', '2014-03-24 15:20:40', '0');
INSERT INTO "public"."act_hi_actinst" VALUES ('1105', 'leave:1:4', '1101', '1101', 'startevent1', null, null, 'Start', 'startEvent', null, '2014-04-11 16:20:33', '2014-04-11 16:20:33', '5');
INSERT INTO "public"."act_hi_actinst" VALUES ('1108', 'leave:1:4', '1101', '1101', 'deptLeaderAudit', '1109', null, '部门领导审批', 'userTask', 'depman', '2014-04-11 16:20:33', null, null);
INSERT INTO "public"."act_hi_actinst" VALUES ('111', 'leave:1:4', '5', '5', 'modifyApply', '112', null, '调整申请', 'userTask', 'admin', '2014-03-24 15:20:40', '2014-03-25 21:00:49', '106809427');
INSERT INTO "public"."act_hi_actinst" VALUES ('117', 'leave:1:4', '113', '113', 'startevent1', null, null, 'Start', 'startEvent', null, '2014-03-24 15:22:13', '2014-03-24 15:22:13', '0');
INSERT INTO "public"."act_hi_actinst" VALUES ('12', 'leave:1:4', '5', '5', 'deptLeaderAudit', '13', null, '部门领导审批', 'userTask', 'depman', '2014-03-24 09:57:31', '2014-03-24 15:20:40', '19389184');
INSERT INTO "public"."act_hi_actinst" VALUES ('120', 'leave:1:4', '113', '113', 'deptLeaderAudit', '121', null, '部门领导审批', 'userTask', 'depman', '2014-03-24 15:22:13', '2014-03-25 21:03:44', '106891178');
INSERT INTO "public"."act_hi_actinst" VALUES ('1205', 'leave:1:4', '1201', '1201', 'startevent1', null, null, 'Start', 'startEvent', null, '2014-04-16 09:05:12', '2014-04-16 09:05:12', '5');
INSERT INTO "public"."act_hi_actinst" VALUES ('1208', 'leave:1:4', '1201', '1201', 'deptLeaderAudit', '1209', null, '部门领导审批', 'userTask', 'depman', '2014-04-16 09:05:12', null, null);
INSERT INTO "public"."act_hi_actinst" VALUES ('1216', 'leave:1:4', '1212', '1212', 'startevent1', null, null, 'Start', 'startEvent', null, '2014-04-16 13:28:14', '2014-04-16 13:28:14', '0');
INSERT INTO "public"."act_hi_actinst" VALUES ('1219', 'leave:1:4', '1212', '1212', 'deptLeaderAudit', '1220', null, '部门领导审批', 'userTask', 'depman', '2014-04-16 13:28:14', null, null);
INSERT INTO "public"."act_hi_actinst" VALUES ('1312', 'freeLeave:1:1306', '1308', '1308', 'startevent1', null, null, 'Start', 'startEvent', null, '2014-04-23 08:42:56', '2014-04-23 08:42:56', '15');
INSERT INTO "public"."act_hi_actinst" VALUES ('1320', 'freeLeave:1:1306', '1308', '1319', 'approval', '1329', null, '自由流请假', 'userTask', 'depman', '2014-04-23 08:42:56', '2014-04-23 12:09:56', '12420473');
INSERT INTO "public"."act_hi_actinst" VALUES ('1808', 'freeLeave:1:1306', '1308', '1319', 'approval', '1809', null, '自由流请假', 'userTask', 'admin', '2014-04-23 12:09:56', '2014-04-23 12:10:48', '52949');
INSERT INTO "public"."act_hi_actinst" VALUES ('1815', 'freeLeave:1:1306', '1308', '1319', 'approval', '1816', null, '自由流请假', 'userTask', 'admin', '2014-04-23 12:10:48', null, null);
INSERT INTO "public"."act_hi_actinst" VALUES ('19', 'leave:1:4', '15', '15', 'startevent1', null, null, 'Start', 'startEvent', null, '2014-03-24 10:02:04', '2014-03-24 10:02:04', '0');
INSERT INTO "public"."act_hi_actinst" VALUES ('2005', 'freeLeave:3:1906', '2001', '2001', 'startevent1', null, null, 'Start', 'startEvent', null, '2014-04-25 09:12:54', '2014-04-25 09:12:54', '15');
INSERT INTO "public"."act_hi_actinst" VALUES ('2013', 'freeLeave:3:1906', '2001', '2012', 'approval', '2022', null, '审批', 'userTask', 'admin', '2014-04-25 09:12:54', '2014-04-25 11:54:06', '9672951');
INSERT INTO "public"."act_hi_actinst" VALUES ('2031', 'freeLeave:3:1906', '2001', '2001', 'usertask1', '2032', null, '重新调整', 'userTask', 'admin', '2014-04-25 11:54:06', null, null);
INSERT INTO "public"."act_hi_actinst" VALUES ('2037', 'freeLeave:3:1906', '2033', '2033', 'startevent1', null, null, 'Start', 'startEvent', null, '2014-04-25 12:03:17', '2014-04-25 12:03:17', '1');
INSERT INTO "public"."act_hi_actinst" VALUES ('2045', 'freeLeave:3:1906', '2033', '2044', 'approval', '2054', null, '审批', 'userTask', 'admin', '2014-04-25 12:03:17', '2014-04-25 12:03:33', '16018');
INSERT INTO "public"."act_hi_actinst" VALUES ('2063', 'freeLeave:3:1906', '2033', '2033', 'usertask1', '2064', null, '重新调整', 'userTask', 'admin', '2014-04-25 12:03:33', null, null);
INSERT INTO "public"."act_hi_actinst" VALUES ('2069', 'freeLeave:3:1906', '2065', '2065', 'startevent1', null, null, 'Start', 'startEvent', null, '2014-04-25 12:03:48', '2014-04-25 12:03:48', '0');
INSERT INTO "public"."act_hi_actinst" VALUES ('2077', 'freeLeave:3:1906', '2065', '2076', 'approval', '2086', null, '审批', 'userTask', 'user2', '2014-04-25 12:03:48', null, null);
INSERT INTO "public"."act_hi_actinst" VALUES ('2092', 'freeLeave:3:1906', '2088', '2088', 'startevent1', null, null, 'Start', 'startEvent', null, '2014-04-25 12:03:55', '2014-04-25 12:03:55', '0');
INSERT INTO "public"."act_hi_actinst" VALUES ('2100', 'freeLeave:3:1906', '2088', '2099', 'approval', '2109', null, '审批', 'userTask', 'admin', '2014-04-25 12:03:55', '2014-04-25 12:04:15', '20438');
INSERT INTO "public"."act_hi_actinst" VALUES ('2117', 'freeLeave:3:1906', '2088', '2099', 'approval', '2118', null, '审批', 'userTask', 'admin', '2014-04-25 12:04:15', '2014-04-25 17:34:25', '19810522');
INSERT INTO "public"."act_hi_actinst" VALUES ('2123', 'freeLeave:3:1906', '2119', '2119', 'startevent1', null, null, 'Start', 'startEvent', null, '2014-04-25 12:04:41', '2014-04-25 12:04:41', '0');
INSERT INTO "public"."act_hi_actinst" VALUES ('2131', 'freeLeave:3:1906', '2119', '2130', 'approval', '2140', null, '审批', 'userTask', 'admin', '2014-04-25 12:04:41', null, null);
INSERT INTO "public"."act_hi_actinst" VALUES ('22', 'leave:1:4', '15', '15', 'deptLeaderAudit', '23', null, '部门领导审批', 'userTask', 'depman', '2014-03-24 10:02:04', '2014-03-24 14:59:34', '17850464');
INSERT INTO "public"."act_hi_actinst" VALUES ('2206', 'freeLeave:3:1906', '2088', '2099', 'approval', '2207', null, '审批', 'userTask', 'depman', '2014-04-25 17:34:25', null, null);
INSERT INTO "public"."act_hi_actinst" VALUES ('2213', 'freeLeave:3:1906', '2209', '2209', 'startevent1', null, null, 'Start', 'startEvent', null, '2014-04-25 17:34:51', '2014-04-25 17:34:51', '1');
INSERT INTO "public"."act_hi_actinst" VALUES ('2221', 'freeLeave:3:1906', '2209', '2220', 'approval', '2230', null, '审批', 'userTask', 'admin', '2014-04-25 17:34:51', null, null);
INSERT INTO "public"."act_hi_actinst" VALUES ('2305', 'leave:4:1907', '2301', '2301', 'startevent1', null, null, 'Start', 'startEvent', null, '2014-05-12 10:26:00', '2014-05-12 10:26:00', '6');
INSERT INTO "public"."act_hi_actinst" VALUES ('2308', 'leave:4:1907', '2301', '2301', 'deptLeaderAudit', '2309', null, '部门领导审批', 'userTask', 'depman', '2014-05-12 10:26:00', null, null);
INSERT INTO "public"."act_hi_actinst" VALUES ('2405', 'leave:4:1907', '2401', '2401', 'startevent1', null, null, 'Start', 'startEvent', null, '2014-05-13 08:54:51', '2014-05-13 08:54:51', '6');
INSERT INTO "public"."act_hi_actinst" VALUES ('2408', 'leave:4:1907', '2401', '2401', 'deptLeaderAudit', '2409', null, '部门领导审批', 'userTask', 'depman', '2014-05-13 08:54:51', null, null);
INSERT INTO "public"."act_hi_actinst" VALUES ('2505', 'leave:4:1907', '2501', '2501', 'startevent1', null, null, 'Start', 'startEvent', null, '2014-06-04 10:55:18', '2014-06-04 10:55:18', '20');
INSERT INTO "public"."act_hi_actinst" VALUES ('2508', 'leave:4:1907', '2501', '2501', 'deptLeaderAudit', '2509', null, '部门领导审批', 'userTask', 'depman', '2014-06-04 10:55:18', null, null);
INSERT INTO "public"."act_hi_actinst" VALUES ('303', 'leave:1:4', '15', '15', 'exclusivegateway6', null, null, 'Exclusive Gateway', 'exclusiveGateway', null, '2014-03-24 21:04:20', '2014-03-24 21:04:20', '7');
INSERT INTO "public"."act_hi_actinst" VALUES ('304', 'leave:1:4', '15', '15', 'reportBack', '305', null, '销假', 'userTask', 'depman', '2014-03-24 21:04:20', null, null);
INSERT INTO "public"."act_hi_actinst" VALUES ('703', 'leave:1:4', '5', '5', 'exclusivegateway7', null, null, 'Exclusive Gateway', 'exclusiveGateway', null, '2014-03-25 21:00:49', '2014-03-25 21:00:49', '0');
INSERT INTO "public"."act_hi_actinst" VALUES ('704', 'leave:1:4', '5', '5', 'endevent1', null, null, 'End', 'endEvent', null, '2014-03-25 21:00:49', '2014-03-25 21:00:49', '0');
INSERT INTO "public"."act_hi_actinst" VALUES ('707', 'leave:1:4', '113', '113', 'exclusivegateway5', null, null, 'Exclusive Gateway', 'exclusiveGateway', null, '2014-03-25 21:03:44', '2014-03-25 21:03:44', '0');
INSERT INTO "public"."act_hi_actinst" VALUES ('708', 'leave:1:4', '113', '113', 'modifyApply', '709', null, '调整申请', 'userTask', 'admin', '2014-03-25 21:03:44', '2014-03-25 21:07:18', '214153');
INSERT INTO "public"."act_hi_actinst" VALUES ('712', 'leave:1:4', '113', '113', 'exclusivegateway7', null, null, 'Exclusive Gateway', 'exclusiveGateway', null, '2014-03-25 21:07:18', '2014-03-25 21:07:18', '1');
INSERT INTO "public"."act_hi_actinst" VALUES ('713', 'leave:1:4', '113', '113', 'endevent1', null, null, 'End', 'endEvent', null, '2014-03-25 21:07:18', '2014-03-25 21:07:18', '0');
INSERT INTO "public"."act_hi_actinst" VALUES ('805', 'leave:1:4', '801', '801', 'startevent1', null, null, 'Start', 'startEvent', null, '2014-03-25 21:20:02', '2014-03-25 21:20:02', '23');
INSERT INTO "public"."act_hi_actinst" VALUES ('808', 'leave:1:4', '801', '801', 'deptLeaderAudit', '809', null, '部门领导审批', 'userTask', 'depman', '2014-03-25 21:20:02', '2014-03-25 21:20:47', '45611');
INSERT INTO "public"."act_hi_actinst" VALUES ('814', 'leave:1:4', '801', '801', 'exclusivegateway5', null, null, 'Exclusive Gateway', 'exclusiveGateway', null, '2014-03-25 21:20:47', '2014-03-25 21:20:47', '0');
INSERT INTO "public"."act_hi_actinst" VALUES ('815', 'leave:1:4', '801', '801', 'modifyApply', '816', null, '调整申请', 'userTask', 'admin', '2014-03-25 21:20:47', '2014-03-25 21:21:53', '66536');
INSERT INTO "public"."act_hi_actinst" VALUES ('819', 'leave:1:4', '801', '801', 'exclusivegateway7', null, null, 'Exclusive Gateway', 'exclusiveGateway', null, '2014-03-25 21:21:53', '2014-03-25 21:21:53', '0');
INSERT INTO "public"."act_hi_actinst" VALUES ('820', 'leave:1:4', '801', '801', 'deptLeaderAudit', '821', null, '部门领导审批', 'userTask', 'admin', '2014-03-25 21:21:53', '2014-03-25 21:24:37', '164818');
INSERT INTO "public"."act_hi_actinst" VALUES ('824', 'leave:1:4', '801', '801', 'exclusivegateway5', null, null, 'Exclusive Gateway', 'exclusiveGateway', null, '2014-03-25 21:24:37', '2014-03-25 21:24:37', '0');
INSERT INTO "public"."act_hi_actinst" VALUES ('825', 'leave:1:4', '801', '801', 'hrAudit', '826', null, '人事审批', 'userTask', 'user2', '2014-03-25 21:24:37', '2014-03-25 21:25:09', '32429');
INSERT INTO "public"."act_hi_actinst" VALUES ('831', 'leave:1:4', '801', '801', 'exclusivegateway6', null, null, 'Exclusive Gateway', 'exclusiveGateway', null, '2014-03-25 21:25:09', '2014-03-25 21:25:09', '0');
INSERT INTO "public"."act_hi_actinst" VALUES ('832', 'leave:1:4', '801', '801', 'modifyApply', '833', null, '调整申请', 'userTask', 'admin', '2014-03-25 21:25:09', '2014-03-25 21:31:17', '368446');
INSERT INTO "public"."act_hi_actinst" VALUES ('835', 'leave:1:4', '801', '801', 'exclusivegateway7', null, null, 'Exclusive Gateway', 'exclusiveGateway', null, '2014-03-25 21:31:17', '2014-03-25 21:31:17', '0');
INSERT INTO "public"."act_hi_actinst" VALUES ('836', 'leave:1:4', '801', '801', 'deptLeaderAudit', '837', null, '部门领导审批', 'userTask', 'depman', '2014-03-25 21:31:17', '2014-03-25 21:34:24', '187683');
INSERT INTO "public"."act_hi_actinst" VALUES ('840', 'leave:1:4', '801', '801', 'exclusivegateway5', null, null, 'Exclusive Gateway', 'exclusiveGateway', null, '2014-03-25 21:34:24', '2014-03-25 21:34:24', '0');
INSERT INTO "public"."act_hi_actinst" VALUES ('841', 'leave:1:4', '801', '801', 'hrAudit', '842', null, '人事审批', 'userTask', 'user2', '2014-03-25 21:34:24', '2014-03-25 21:35:43', '79554');
INSERT INTO "public"."act_hi_actinst" VALUES ('845', 'leave:1:4', '801', '801', 'exclusivegateway6', null, null, 'Exclusive Gateway', 'exclusiveGateway', null, '2014-03-25 21:35:43', '2014-03-25 21:35:43', '0');
INSERT INTO "public"."act_hi_actinst" VALUES ('846', 'leave:1:4', '801', '801', 'reportBack', '847', null, '销假', 'userTask', 'admin', '2014-03-25 21:35:43', null, null);
INSERT INTO "public"."act_hi_actinst" VALUES ('9', 'leave:1:4', '5', '5', 'startevent1', null, null, 'Start', 'startEvent', null, '2014-03-24 09:57:30', '2014-03-24 09:57:31', '91');
INSERT INTO "public"."act_hi_actinst" VALUES ('905', 'leave:1:4', '901', '901', 'startevent1', null, null, 'Start', 'startEvent', null, '2014-03-27 13:40:14', '2014-03-27 13:40:14', '7');
INSERT INTO "public"."act_hi_actinst" VALUES ('908', 'leave:1:4', '901', '901', 'deptLeaderAudit', '909', null, '部门领导审批', 'userTask', 'depman', '2014-03-27 13:40:14', null, null);
COMMIT;

-- ----------------------------
--  Table structure for act_hi_attachment
-- ----------------------------
DROP TABLE IF EXISTS "public"."act_hi_attachment";
CREATE TABLE "public"."act_hi_attachment" (
	"id_" varchar(64) NOT NULL COLLATE "default",
	"rev_" int4,
	"user_id_" varchar(255) COLLATE "default",
	"name_" varchar(255) COLLATE "default",
	"description_" varchar(4000) COLLATE "default",
	"type_" varchar(255) COLLATE "default",
	"task_id_" varchar(64) COLLATE "default",
	"proc_inst_id_" varchar(64) COLLATE "default",
	"url_" varchar(4000) COLLATE "default",
	"content_id_" varchar(64) COLLATE "default"
)
WITH (OIDS=FALSE);
ALTER TABLE "public"."act_hi_attachment" OWNER TO "postgres";

-- ----------------------------
--  Table structure for act_hi_comment
-- ----------------------------
DROP TABLE IF EXISTS "public"."act_hi_comment";
CREATE TABLE "public"."act_hi_comment" (
	"id_" varchar(64) NOT NULL COLLATE "default",
	"type_" varchar(255) COLLATE "default",
	"time_" timestamp(6) NOT NULL,
	"user_id_" varchar(255) COLLATE "default",
	"task_id_" varchar(64) COLLATE "default",
	"proc_inst_id_" varchar(64) COLLATE "default",
	"action_" varchar(255) COLLATE "default",
	"message_" varchar(4000) COLLATE "default",
	"full_msg_" bytea
)
WITH (OIDS=FALSE);
ALTER TABLE "public"."act_hi_comment" OWNER TO "postgres";

-- ----------------------------
--  Table structure for act_hi_detail
-- ----------------------------
DROP TABLE IF EXISTS "public"."act_hi_detail";
CREATE TABLE "public"."act_hi_detail" (
	"id_" varchar(64) NOT NULL COLLATE "default",
	"type_" varchar(255) NOT NULL COLLATE "default",
	"proc_inst_id_" varchar(64) COLLATE "default",
	"execution_id_" varchar(64) COLLATE "default",
	"task_id_" varchar(64) COLLATE "default",
	"act_inst_id_" varchar(64) COLLATE "default",
	"name_" varchar(255) NOT NULL COLLATE "default",
	"var_type_" varchar(255) COLLATE "default",
	"rev_" int4,
	"time_" timestamp(6) NOT NULL,
	"bytearray_id_" varchar(64) COLLATE "default",
	"double_" float8,
	"long_" int8,
	"text_" varchar(4000) COLLATE "default",
	"text2_" varchar(4000) COLLATE "default"
)
WITH (OIDS=FALSE);
ALTER TABLE "public"."act_hi_detail" OWNER TO "postgres";

-- ----------------------------
--  Records of act_hi_detail
-- ----------------------------
BEGIN;
INSERT INTO "public"."act_hi_detail" VALUES ('1003', 'VariableUpdate', '1001', '1001', null, null, 'applyUserId', 'string', '0', '2014-04-05 23:18:38', null, null, null, 'admin', null);
INSERT INTO "public"."act_hi_detail" VALUES ('1007', 'VariableUpdate', '1001', '1001', null, '1005', 'sponsor', 'string', '0', '2014-04-05 23:18:38', null, null, null, '超级管理员', null);
INSERT INTO "public"."act_hi_detail" VALUES ('1013', 'VariableUpdate', '1001', '1001', null, '1008', 'deptLeaderPass', 'boolean', '0', '2014-04-05 23:20:48', null, null, '1', null, null);
INSERT INTO "public"."act_hi_detail" VALUES ('102', 'VariableUpdate', '15', '15', null, '22', 'deptLeaderPass', 'boolean', '0', '2014-03-24 14:59:34', null, null, '1', null, null);
INSERT INTO "public"."act_hi_detail" VALUES ('1020', 'VariableUpdate', '1001', '1001', null, '1015', 'hrPass', 'boolean', '0', '2014-04-05 23:23:50', null, null, '0', null, null);
INSERT INTO "public"."act_hi_detail" VALUES ('1025', 'VariableUpdate', '1001', '1001', null, '1022', 'reApply', 'boolean', '0', '2014-04-05 23:29:50', null, null, '1', null, null);
INSERT INTO "public"."act_hi_detail" VALUES ('109', 'VariableUpdate', '5', '5', null, '12', 'deptLeaderPass', 'boolean', '0', '2014-03-24 15:20:40', null, null, '0', null, null);
INSERT INTO "public"."act_hi_detail" VALUES ('11', 'VariableUpdate', '5', '5', null, '9', 'sponsor', 'string', '0', '2014-03-24 09:57:30', null, null, null, '超级管理员', null);
INSERT INTO "public"."act_hi_detail" VALUES ('1103', 'VariableUpdate', '1101', '1101', null, null, 'applyUserId', 'string', '0', '2014-04-11 16:20:33', null, null, null, 'admin', null);
INSERT INTO "public"."act_hi_detail" VALUES ('1107', 'VariableUpdate', '1101', '1101', null, '1105', 'sponsor', 'string', '0', '2014-04-11 16:20:33', null, null, null, '超级管理员', null);
INSERT INTO "public"."act_hi_detail" VALUES ('115', 'VariableUpdate', '113', '113', null, null, 'applyUserId', 'string', '0', '2014-03-24 15:22:13', null, null, null, 'admin', null);
INSERT INTO "public"."act_hi_detail" VALUES ('119', 'VariableUpdate', '113', '113', null, '117', 'sponsor', 'string', '0', '2014-03-24 15:22:13', null, null, null, '超级管理员', null);
INSERT INTO "public"."act_hi_detail" VALUES ('1203', 'VariableUpdate', '1201', '1201', null, null, 'applyUserId', 'string', '0', '2014-04-16 09:05:12', null, null, null, 'admin', null);
INSERT INTO "public"."act_hi_detail" VALUES ('1207', 'VariableUpdate', '1201', '1201', null, '1205', 'sponsor', 'string', '0', '2014-04-16 09:05:12', null, null, null, '超级管理员', null);
INSERT INTO "public"."act_hi_detail" VALUES ('1214', 'VariableUpdate', '1212', '1212', null, null, 'applyUserId', 'string', '0', '2014-04-16 13:28:14', null, null, null, 'depman', null);
INSERT INTO "public"."act_hi_detail" VALUES ('1218', 'VariableUpdate', '1212', '1212', null, '1216', 'sponsor', 'string', '0', '2014-04-16 13:28:14', null, null, null, '部门经理', null);
INSERT INTO "public"."act_hi_detail" VALUES ('1310', 'VariableUpdate', '1308', '1308', null, null, 'applyUser', 'string', '0', '2014-04-23 08:42:56', null, null, null, 'admin', null);
INSERT INTO "public"."act_hi_detail" VALUES ('1314', 'VariableUpdate', '1308', '1308', null, '1312', 'reason', 'string', '0', '2014-04-23 08:42:56', null, null, null, 'test1', null);
INSERT INTO "public"."act_hi_detail" VALUES ('1316', 'VariableUpdate', '1308', '1308', null, '1312', 'approvalUser', 'string', '0', '2014-04-23 08:42:56', null, null, null, 'depman', null);
INSERT INTO "public"."act_hi_detail" VALUES ('1318', 'VariableUpdate', '1308', '1308', null, '1312', 'sponsor', 'string', '0', '2014-04-23 08:42:56', null, null, null, '超级管理员', null);
INSERT INTO "public"."act_hi_detail" VALUES ('1322', 'VariableUpdate', '1308', '1319', null, '1320', 'nrOfInstances', 'integer', '0', '2014-04-23 08:42:56', null, null, '10', '10', null);
INSERT INTO "public"."act_hi_detail" VALUES ('1324', 'VariableUpdate', '1308', '1319', null, '1320', 'nrOfCompletedInstances', 'integer', '0', '2014-04-23 08:42:56', null, null, '0', '0', null);
INSERT INTO "public"."act_hi_detail" VALUES ('1326', 'VariableUpdate', '1308', '1319', null, '1320', 'loopCounter', 'integer', '0', '2014-04-23 08:42:56', null, null, '0', '0', null);
INSERT INTO "public"."act_hi_detail" VALUES ('1328', 'VariableUpdate', '1308', '1319', null, '1320', 'nrOfActiveInstances', 'integer', '0', '2014-04-23 08:42:56', null, null, '1', '1', null);
INSERT INTO "public"."act_hi_detail" VALUES ('17', 'VariableUpdate', '15', '15', null, null, 'applyUserId', 'string', '0', '2014-03-24 10:02:04', null, null, null, 'depman', null);
INSERT INTO "public"."act_hi_detail" VALUES ('1802', 'VariableUpdate', '1308', '1308', null, null, 'endTag', 'boolean', '0', '2014-04-23 12:09:56', null, null, '0', null, null);
INSERT INTO "public"."act_hi_detail" VALUES ('1803', 'VariableUpdate', '1308', '1308', null, '1320', 'approvalUser', 'string', '1', '2014-04-23 12:09:56', null, null, null, 'admin', null);
INSERT INTO "public"."act_hi_detail" VALUES ('1805', 'VariableUpdate', '1308', '1308', null, null, 'auditOpinion', 'string', '0', '2014-04-23 12:09:56', null, null, null, '22222', null);
INSERT INTO "public"."act_hi_detail" VALUES ('1806', 'VariableUpdate', '1308', '1319', null, '1320', 'loopCounter', 'integer', '1', '2014-04-23 12:09:56', null, null, '1', '1', null);
INSERT INTO "public"."act_hi_detail" VALUES ('1807', 'VariableUpdate', '1308', '1319', null, '1320', 'nrOfCompletedInstances', 'integer', '1', '2014-04-23 12:09:56', null, null, '1', '1', null);
INSERT INTO "public"."act_hi_detail" VALUES ('1810', 'VariableUpdate', '1308', '1308', null, '1808', 'endTag', 'boolean', '1', '2014-04-23 12:10:48', null, null, '0', null, null);
INSERT INTO "public"."act_hi_detail" VALUES ('1811', 'VariableUpdate', '1308', '1308', null, '1808', 'approvalUser', 'string', '2', '2014-04-23 12:10:48', null, null, null, 'admin', null);
INSERT INTO "public"."act_hi_detail" VALUES ('1812', 'VariableUpdate', '1308', '1308', null, '1808', 'auditOpinion', 'string', '1', '2014-04-23 12:10:48', null, null, null, 'hello1111111111111111', null);
INSERT INTO "public"."act_hi_detail" VALUES ('1813', 'VariableUpdate', '1308', '1319', null, '1808', 'loopCounter', 'integer', '2', '2014-04-23 12:10:48', null, null, '2', '2', null);
INSERT INTO "public"."act_hi_detail" VALUES ('1814', 'VariableUpdate', '1308', '1319', null, '1808', 'nrOfCompletedInstances', 'integer', '2', '2014-04-23 12:10:48', null, null, '2', '2', null);
INSERT INTO "public"."act_hi_detail" VALUES ('2003', 'VariableUpdate', '2001', '2001', null, null, 'applyUser', 'string', '0', '2014-04-25 09:12:54', null, null, null, 'admin', null);
INSERT INTO "public"."act_hi_detail" VALUES ('2007', 'VariableUpdate', '2001', '2001', null, '2005', 'reason', 'string', '0', '2014-04-25 09:12:54', null, null, null, '11111111111111', null);
INSERT INTO "public"."act_hi_detail" VALUES ('2009', 'VariableUpdate', '2001', '2001', null, '2005', 'approvalUser', 'string', '0', '2014-04-25 09:12:54', null, null, null, 'admin', null);
INSERT INTO "public"."act_hi_detail" VALUES ('2011', 'VariableUpdate', '2001', '2001', null, '2005', 'sponsor', 'string', '0', '2014-04-25 09:12:54', null, null, null, '超级管理员', null);
INSERT INTO "public"."act_hi_detail" VALUES ('2015', 'VariableUpdate', '2001', '2012', null, '2013', 'nrOfInstances', 'integer', '0', '2014-04-25 09:12:54', null, null, '10', '10', null);
INSERT INTO "public"."act_hi_detail" VALUES ('2017', 'VariableUpdate', '2001', '2012', null, '2013', 'nrOfCompletedInstances', 'integer', '0', '2014-04-25 09:12:54', null, null, '0', '0', null);
INSERT INTO "public"."act_hi_detail" VALUES ('2019', 'VariableUpdate', '2001', '2012', null, '2013', 'loopCounter', 'integer', '0', '2014-04-25 09:12:54', null, null, '0', '0', null);
INSERT INTO "public"."act_hi_detail" VALUES ('2021', 'VariableUpdate', '2001', '2012', null, '2013', 'nrOfActiveInstances', 'integer', '0', '2014-04-25 09:12:54', null, null, '1', '1', null);
INSERT INTO "public"."act_hi_detail" VALUES ('2024', 'VariableUpdate', '2001', '2001', null, null, 'endTag', 'boolean', '0', '2014-04-25 11:54:06', null, null, '1', null, null);
INSERT INTO "public"."act_hi_detail" VALUES ('2026', 'VariableUpdate', '2001', '2001', null, null, 'auditerPass', 'boolean', '0', '2014-04-25 11:54:06', null, null, '0', null, null);
INSERT INTO "public"."act_hi_detail" VALUES ('2028', 'VariableUpdate', '2001', '2001', null, null, 'auditOpinion', 'string', '0', '2014-04-25 11:54:06', null, null, null, '1111111', null);
INSERT INTO "public"."act_hi_detail" VALUES ('2029', 'VariableUpdate', '2001', '2012', null, '2013', 'loopCounter', 'integer', '1', '2014-04-25 11:54:06', null, null, '1', '1', null);
INSERT INTO "public"."act_hi_detail" VALUES ('2030', 'VariableUpdate', '2001', '2012', null, '2013', 'nrOfCompletedInstances', 'integer', '1', '2014-04-25 11:54:06', null, null, '1', '1', null);
INSERT INTO "public"."act_hi_detail" VALUES ('2035', 'VariableUpdate', '2033', '2033', null, null, 'applyUser', 'string', '0', '2014-04-25 12:03:17', null, null, null, 'admin', null);
INSERT INTO "public"."act_hi_detail" VALUES ('2039', 'VariableUpdate', '2033', '2033', null, '2037', 'reason', 'string', '0', '2014-04-25 12:03:17', null, null, null, '9999999999', null);
INSERT INTO "public"."act_hi_detail" VALUES ('2041', 'VariableUpdate', '2033', '2033', null, '2037', 'approvalUser', 'string', '0', '2014-04-25 12:03:17', null, null, null, 'admin', null);
INSERT INTO "public"."act_hi_detail" VALUES ('2043', 'VariableUpdate', '2033', '2033', null, '2037', 'sponsor', 'string', '0', '2014-04-25 12:03:17', null, null, null, '超级管理员', null);
INSERT INTO "public"."act_hi_detail" VALUES ('2047', 'VariableUpdate', '2033', '2044', null, '2045', 'nrOfInstances', 'integer', '0', '2014-04-25 12:03:17', null, null, '10', '10', null);
INSERT INTO "public"."act_hi_detail" VALUES ('2049', 'VariableUpdate', '2033', '2044', null, '2045', 'nrOfCompletedInstances', 'integer', '0', '2014-04-25 12:03:17', null, null, '0', '0', null);
INSERT INTO "public"."act_hi_detail" VALUES ('2051', 'VariableUpdate', '2033', '2044', null, '2045', 'loopCounter', 'integer', '0', '2014-04-25 12:03:17', null, null, '0', '0', null);
INSERT INTO "public"."act_hi_detail" VALUES ('2053', 'VariableUpdate', '2033', '2044', null, '2045', 'nrOfActiveInstances', 'integer', '0', '2014-04-25 12:03:17', null, null, '1', '1', null);
INSERT INTO "public"."act_hi_detail" VALUES ('2056', 'VariableUpdate', '2033', '2033', null, null, 'endTag', 'boolean', '0', '2014-04-25 12:03:33', null, null, '1', null, null);
INSERT INTO "public"."act_hi_detail" VALUES ('2058', 'VariableUpdate', '2033', '2033', null, null, 'auditerPass', 'boolean', '0', '2014-04-25 12:03:33', null, null, '0', null, null);
INSERT INTO "public"."act_hi_detail" VALUES ('2060', 'VariableUpdate', '2033', '2033', null, null, 'auditOpinion', 'string', '0', '2014-04-25 12:03:33', null, null, null, '888888888', null);
INSERT INTO "public"."act_hi_detail" VALUES ('2061', 'VariableUpdate', '2033', '2044', null, '2045', 'loopCounter', 'integer', '1', '2014-04-25 12:03:33', null, null, '1', '1', null);
INSERT INTO "public"."act_hi_detail" VALUES ('2062', 'VariableUpdate', '2033', '2044', null, '2045', 'nrOfCompletedInstances', 'integer', '1', '2014-04-25 12:03:33', null, null, '1', '1', null);
INSERT INTO "public"."act_hi_detail" VALUES ('2067', 'VariableUpdate', '2065', '2065', null, null, 'applyUser', 'string', '0', '2014-04-25 12:03:48', null, null, null, 'admin', null);
INSERT INTO "public"."act_hi_detail" VALUES ('2071', 'VariableUpdate', '2065', '2065', null, '2069', 'reason', 'string', '0', '2014-04-25 12:03:48', null, null, null, '-------', null);
INSERT INTO "public"."act_hi_detail" VALUES ('2073', 'VariableUpdate', '2065', '2065', null, '2069', 'approvalUser', 'string', '0', '2014-04-25 12:03:48', null, null, null, 'user2', null);
INSERT INTO "public"."act_hi_detail" VALUES ('2075', 'VariableUpdate', '2065', '2065', null, '2069', 'sponsor', 'string', '0', '2014-04-25 12:03:48', null, null, null, '超级管理员', null);
INSERT INTO "public"."act_hi_detail" VALUES ('2079', 'VariableUpdate', '2065', '2076', null, '2077', 'nrOfInstances', 'integer', '0', '2014-04-25 12:03:48', null, null, '10', '10', null);
INSERT INTO "public"."act_hi_detail" VALUES ('2081', 'VariableUpdate', '2065', '2076', null, '2077', 'nrOfCompletedInstances', 'integer', '0', '2014-04-25 12:03:48', null, null, '0', '0', null);
INSERT INTO "public"."act_hi_detail" VALUES ('2083', 'VariableUpdate', '2065', '2076', null, '2077', 'loopCounter', 'integer', '0', '2014-04-25 12:03:48', null, null, '0', '0', null);
INSERT INTO "public"."act_hi_detail" VALUES ('2085', 'VariableUpdate', '2065', '2076', null, '2077', 'nrOfActiveInstances', 'integer', '0', '2014-04-25 12:03:48', null, null, '1', '1', null);
INSERT INTO "public"."act_hi_detail" VALUES ('2090', 'VariableUpdate', '2088', '2088', null, null, 'applyUser', 'string', '0', '2014-04-25 12:03:55', null, null, null, 'admin', null);
INSERT INTO "public"."act_hi_detail" VALUES ('2094', 'VariableUpdate', '2088', '2088', null, '2092', 'reason', 'string', '0', '2014-04-25 12:03:55', null, null, null, '------------', null);
INSERT INTO "public"."act_hi_detail" VALUES ('2096', 'VariableUpdate', '2088', '2088', null, '2092', 'approvalUser', 'string', '0', '2014-04-25 12:03:55', null, null, null, 'admin', null);
INSERT INTO "public"."act_hi_detail" VALUES ('2098', 'VariableUpdate', '2088', '2088', null, '2092', 'sponsor', 'string', '0', '2014-04-25 12:03:55', null, null, null, '超级管理员', null);
INSERT INTO "public"."act_hi_detail" VALUES ('21', 'VariableUpdate', '15', '15', null, '19', 'sponsor', 'string', '0', '2014-03-24 10:02:04', null, null, null, '部门经理', null);
INSERT INTO "public"."act_hi_detail" VALUES ('2102', 'VariableUpdate', '2088', '2099', null, '2100', 'nrOfInstances', 'integer', '0', '2014-04-25 12:03:55', null, null, '10', '10', null);
INSERT INTO "public"."act_hi_detail" VALUES ('2104', 'VariableUpdate', '2088', '2099', null, '2100', 'nrOfCompletedInstances', 'integer', '0', '2014-04-25 12:03:55', null, null, '0', '0', null);
INSERT INTO "public"."act_hi_detail" VALUES ('2106', 'VariableUpdate', '2088', '2099', null, '2100', 'loopCounter', 'integer', '0', '2014-04-25 12:03:55', null, null, '0', '0', null);
INSERT INTO "public"."act_hi_detail" VALUES ('2108', 'VariableUpdate', '2088', '2099', null, '2100', 'nrOfActiveInstances', 'integer', '0', '2014-04-25 12:03:55', null, null, '1', '1', null);
INSERT INTO "public"."act_hi_detail" VALUES ('2111', 'VariableUpdate', '2088', '2088', null, null, 'endTag', 'boolean', '0', '2014-04-25 12:04:15', null, null, '0', null, null);
INSERT INTO "public"."act_hi_detail" VALUES ('2112', 'VariableUpdate', '2088', '2088', null, '2100', 'approvalUser', 'string', '1', '2014-04-25 12:04:15', null, null, null, 'admin', null);
INSERT INTO "public"."act_hi_detail" VALUES ('2114', 'VariableUpdate', '2088', '2088', null, null, 'auditOpinion', 'string', '0', '2014-04-25 12:04:15', null, null, null, '3333333333', null);
INSERT INTO "public"."act_hi_detail" VALUES ('2115', 'VariableUpdate', '2088', '2099', null, '2100', 'loopCounter', 'integer', '1', '2014-04-25 12:04:15', null, null, '1', '1', null);
INSERT INTO "public"."act_hi_detail" VALUES ('2116', 'VariableUpdate', '2088', '2099', null, '2100', 'nrOfCompletedInstances', 'integer', '1', '2014-04-25 12:04:15', null, null, '1', '1', null);
INSERT INTO "public"."act_hi_detail" VALUES ('2121', 'VariableUpdate', '2119', '2119', null, null, 'applyUser', 'string', '0', '2014-04-25 12:04:41', null, null, null, 'admin', null);
INSERT INTO "public"."act_hi_detail" VALUES ('2125', 'VariableUpdate', '2119', '2119', null, '2123', 'reason', 'string', '0', '2014-04-25 12:04:41', null, null, null, '9999999', null);
INSERT INTO "public"."act_hi_detail" VALUES ('2127', 'VariableUpdate', '2119', '2119', null, '2123', 'approvalUser', 'string', '0', '2014-04-25 12:04:41', null, null, null, 'admin', null);
INSERT INTO "public"."act_hi_detail" VALUES ('2129', 'VariableUpdate', '2119', '2119', null, '2123', 'sponsor', 'string', '0', '2014-04-25 12:04:41', null, null, null, '超级管理员', null);
INSERT INTO "public"."act_hi_detail" VALUES ('2133', 'VariableUpdate', '2119', '2130', null, '2131', 'nrOfInstances', 'integer', '0', '2014-04-25 12:04:41', null, null, '10', '10', null);
INSERT INTO "public"."act_hi_detail" VALUES ('2135', 'VariableUpdate', '2119', '2130', null, '2131', 'nrOfCompletedInstances', 'integer', '0', '2014-04-25 12:04:41', null, null, '0', '0', null);
INSERT INTO "public"."act_hi_detail" VALUES ('2137', 'VariableUpdate', '2119', '2130', null, '2131', 'loopCounter', 'integer', '0', '2014-04-25 12:04:41', null, null, '0', '0', null);
INSERT INTO "public"."act_hi_detail" VALUES ('2139', 'VariableUpdate', '2119', '2130', null, '2131', 'nrOfActiveInstances', 'integer', '0', '2014-04-25 12:04:41', null, null, '1', '1', null);
INSERT INTO "public"."act_hi_detail" VALUES ('2201', 'VariableUpdate', '2088', '2088', null, '2117', 'endTag', 'boolean', '1', '2014-04-25 17:34:25', null, null, '0', null, null);
INSERT INTO "public"."act_hi_detail" VALUES ('2202', 'VariableUpdate', '2088', '2088', null, '2117', 'approvalUser', 'string', '1', '2014-04-25 17:34:25', null, null, null, 'depman', null);
INSERT INTO "public"."act_hi_detail" VALUES ('2203', 'VariableUpdate', '2088', '2088', null, '2117', 'auditOpinion', 'string', '1', '2014-04-25 17:34:25', null, null, null, 'dsffsdf', null);
INSERT INTO "public"."act_hi_detail" VALUES ('2204', 'VariableUpdate', '2088', '2099', null, '2117', 'loopCounter', 'integer', '2', '2014-04-25 17:34:25', null, null, '2', '2', null);
INSERT INTO "public"."act_hi_detail" VALUES ('2205', 'VariableUpdate', '2088', '2099', null, '2117', 'nrOfCompletedInstances', 'integer', '2', '2014-04-25 17:34:25', null, null, '2', '2', null);
INSERT INTO "public"."act_hi_detail" VALUES ('2211', 'VariableUpdate', '2209', '2209', null, null, 'applyUser', 'string', '0', '2014-04-25 17:34:51', null, null, null, 'admin', null);
INSERT INTO "public"."act_hi_detail" VALUES ('2215', 'VariableUpdate', '2209', '2209', null, '2213', 'reason', 'string', '0', '2014-04-25 17:34:51', null, null, null, 'sadas', null);
INSERT INTO "public"."act_hi_detail" VALUES ('2217', 'VariableUpdate', '2209', '2209', null, '2213', 'approvalUser', 'string', '0', '2014-04-25 17:34:51', null, null, null, 'admin', null);
INSERT INTO "public"."act_hi_detail" VALUES ('2219', 'VariableUpdate', '2209', '2209', null, '2213', 'sponsor', 'string', '0', '2014-04-25 17:34:51', null, null, null, '超级管理员', null);
INSERT INTO "public"."act_hi_detail" VALUES ('2223', 'VariableUpdate', '2209', '2220', null, '2221', 'nrOfInstances', 'integer', '0', '2014-04-25 17:34:51', null, null, '10', '10', null);
INSERT INTO "public"."act_hi_detail" VALUES ('2225', 'VariableUpdate', '2209', '2220', null, '2221', 'nrOfCompletedInstances', 'integer', '0', '2014-04-25 17:34:51', null, null, '0', '0', null);
INSERT INTO "public"."act_hi_detail" VALUES ('2227', 'VariableUpdate', '2209', '2220', null, '2221', 'loopCounter', 'integer', '0', '2014-04-25 17:34:51', null, null, '0', '0', null);
INSERT INTO "public"."act_hi_detail" VALUES ('2229', 'VariableUpdate', '2209', '2220', null, '2221', 'nrOfActiveInstances', 'integer', '0', '2014-04-25 17:34:51', null, null, '1', '1', null);
INSERT INTO "public"."act_hi_detail" VALUES ('2303', 'VariableUpdate', '2301', '2301', null, null, 'applyUserId', 'string', '0', '2014-05-12 10:26:00', null, null, null, 'depman', null);
INSERT INTO "public"."act_hi_detail" VALUES ('2307', 'VariableUpdate', '2301', '2301', null, '2305', 'sponsor', 'string', '0', '2014-05-12 10:26:00', null, null, null, '部门经理', null);
INSERT INTO "public"."act_hi_detail" VALUES ('2403', 'VariableUpdate', '2401', '2401', null, null, 'applyUserId', 'string', '0', '2014-05-13 08:54:51', null, null, null, 'depman', null);
INSERT INTO "public"."act_hi_detail" VALUES ('2407', 'VariableUpdate', '2401', '2401', null, '2405', 'sponsor', 'string', '0', '2014-05-13 08:54:51', null, null, null, '部门经理', null);
INSERT INTO "public"."act_hi_detail" VALUES ('2503', 'VariableUpdate', '2501', '2501', null, null, 'applyUserId', 'string', '0', '2014-06-04 10:55:18', null, null, null, 'admin', null);
INSERT INTO "public"."act_hi_detail" VALUES ('2507', 'VariableUpdate', '2501', '2501', null, '2505', 'sponsor', 'string', '0', '2014-06-04 10:55:18', null, null, null, '超级管理员', null);
INSERT INTO "public"."act_hi_detail" VALUES ('302', 'VariableUpdate', '15', '15', null, '104', 'hrPass', 'boolean', '0', '2014-03-24 21:04:19', null, null, '1', null, null);
INSERT INTO "public"."act_hi_detail" VALUES ('7', 'VariableUpdate', '5', '5', null, null, 'applyUserId', 'string', '0', '2014-03-24 09:57:30', null, null, null, 'admin', null);
INSERT INTO "public"."act_hi_detail" VALUES ('702', 'VariableUpdate', '5', '5', null, '111', 'reApply', 'boolean', '0', '2014-03-25 21:00:48', null, null, '0', null, null);
INSERT INTO "public"."act_hi_detail" VALUES ('706', 'VariableUpdate', '113', '113', null, '120', 'deptLeaderPass', 'boolean', '0', '2014-03-25 21:03:44', null, null, '0', null, null);
INSERT INTO "public"."act_hi_detail" VALUES ('711', 'VariableUpdate', '113', '113', null, '708', 'reApply', 'boolean', '0', '2014-03-25 21:07:07', null, null, '0', null, null);
INSERT INTO "public"."act_hi_detail" VALUES ('803', 'VariableUpdate', '801', '801', null, null, 'applyUserId', 'string', '0', '2014-03-25 21:20:02', null, null, null, 'admin', null);
INSERT INTO "public"."act_hi_detail" VALUES ('807', 'VariableUpdate', '801', '801', null, '805', 'sponsor', 'string', '0', '2014-03-25 21:20:02', null, null, null, '超级管理员', null);
INSERT INTO "public"."act_hi_detail" VALUES ('813', 'VariableUpdate', '801', '801', null, '808', 'deptLeaderPass', 'boolean', '0', '2014-03-25 21:20:47', null, null, '0', null, null);
INSERT INTO "public"."act_hi_detail" VALUES ('818', 'VariableUpdate', '801', '801', null, '815', 'reApply', 'boolean', '0', '2014-03-25 21:21:43', null, null, '1', null, null);
INSERT INTO "public"."act_hi_detail" VALUES ('823', 'VariableUpdate', '801', '801', null, '820', 'deptLeaderPass', 'boolean', '1', '2014-03-25 21:24:37', null, null, '1', null, null);
INSERT INTO "public"."act_hi_detail" VALUES ('830', 'VariableUpdate', '801', '801', null, '825', 'hrPass', 'boolean', '0', '2014-03-25 21:25:09', null, null, '0', null, null);
INSERT INTO "public"."act_hi_detail" VALUES ('834', 'VariableUpdate', '801', '801', null, '832', 'reApply', 'boolean', '1', '2014-03-25 21:30:56', null, null, '1', null, null);
INSERT INTO "public"."act_hi_detail" VALUES ('839', 'VariableUpdate', '801', '801', null, '836', 'deptLeaderPass', 'boolean', '2', '2014-03-25 21:34:24', null, null, '1', null, null);
INSERT INTO "public"."act_hi_detail" VALUES ('844', 'VariableUpdate', '801', '801', null, '841', 'hrPass', 'boolean', '1', '2014-03-25 21:35:43', null, null, '1', null, null);
INSERT INTO "public"."act_hi_detail" VALUES ('903', 'VariableUpdate', '901', '901', null, null, 'applyUserId', 'string', '0', '2014-03-27 13:40:13', null, null, null, 'admin', null);
INSERT INTO "public"."act_hi_detail" VALUES ('907', 'VariableUpdate', '901', '901', null, '905', 'sponsor', 'string', '0', '2014-03-27 13:40:14', null, null, null, '超级管理员', null);
COMMIT;

-- ----------------------------
--  Table structure for act_hi_identitylink
-- ----------------------------
DROP TABLE IF EXISTS "public"."act_hi_identitylink";
CREATE TABLE "public"."act_hi_identitylink" (
	"id_" varchar(64) NOT NULL COLLATE "default",
	"group_id_" varchar(255) COLLATE "default",
	"type_" varchar(255) COLLATE "default",
	"user_id_" varchar(255) COLLATE "default",
	"task_id_" varchar(64) COLLATE "default",
	"proc_inst_id_" varchar(64) COLLATE "default"
)
WITH (OIDS=FALSE);
ALTER TABLE "public"."act_hi_identitylink" OWNER TO "postgres";

-- ----------------------------
--  Records of act_hi_identitylink
-- ----------------------------
BEGIN;
INSERT INTO "public"."act_hi_identitylink" VALUES ('1004', null, 'starter', 'admin', null, '1001');
INSERT INTO "public"."act_hi_identitylink" VALUES ('1010', 'deptLeader', 'candidate', null, '1009', null);
INSERT INTO "public"."act_hi_identitylink" VALUES ('1011', null, 'participant', 'depman', null, '1001');
INSERT INTO "public"."act_hi_identitylink" VALUES ('1017', 'hr', 'candidate', null, '1016', null);
INSERT INTO "public"."act_hi_identitylink" VALUES ('1018', null, 'participant', 'user2', null, '1001');
INSERT INTO "public"."act_hi_identitylink" VALUES ('1029', 'deptLeader', 'candidate', null, '1028', null);
INSERT INTO "public"."act_hi_identitylink" VALUES ('106', 'hr', 'candidate', null, '105', null);
INSERT INTO "public"."act_hi_identitylink" VALUES ('107', null, 'participant', 'user2', null, '15');
INSERT INTO "public"."act_hi_identitylink" VALUES ('1104', null, 'starter', 'admin', null, '1101');
INSERT INTO "public"."act_hi_identitylink" VALUES ('1110', 'deptLeader', 'candidate', null, '1109', null);
INSERT INTO "public"."act_hi_identitylink" VALUES ('1111', null, 'participant', 'depman', null, '1101');
INSERT INTO "public"."act_hi_identitylink" VALUES ('116', null, 'starter', 'admin', null, '113');
INSERT INTO "public"."act_hi_identitylink" VALUES ('1204', null, 'starter', 'admin', null, '1201');
INSERT INTO "public"."act_hi_identitylink" VALUES ('1210', 'deptLeader', 'candidate', null, '1209', null);
INSERT INTO "public"."act_hi_identitylink" VALUES ('1211', null, 'participant', 'depman', null, '1201');
INSERT INTO "public"."act_hi_identitylink" VALUES ('1215', null, 'starter', 'depman', null, '1212');
INSERT INTO "public"."act_hi_identitylink" VALUES ('122', 'deptLeader', 'candidate', null, '121', null);
INSERT INTO "public"."act_hi_identitylink" VALUES ('1221', 'deptLeader', 'candidate', null, '1220', null);
INSERT INTO "public"."act_hi_identitylink" VALUES ('123', null, 'participant', 'depman', null, '113');
INSERT INTO "public"."act_hi_identitylink" VALUES ('1311', null, 'starter', 'admin', null, '1308');
INSERT INTO "public"."act_hi_identitylink" VALUES ('1330', null, 'participant', 'depman', null, '1308');
INSERT INTO "public"."act_hi_identitylink" VALUES ('14', 'deptLeader', 'candidate', null, '13', null);
INSERT INTO "public"."act_hi_identitylink" VALUES ('18', null, 'starter', 'depman', null, '15');
INSERT INTO "public"."act_hi_identitylink" VALUES ('2004', null, 'starter', 'admin', null, '2001');
INSERT INTO "public"."act_hi_identitylink" VALUES ('2036', null, 'starter', 'admin', null, '2033');
INSERT INTO "public"."act_hi_identitylink" VALUES ('2068', null, 'starter', 'admin', null, '2065');
INSERT INTO "public"."act_hi_identitylink" VALUES ('2087', null, 'participant', 'user2', null, '2065');
INSERT INTO "public"."act_hi_identitylink" VALUES ('2091', null, 'starter', 'admin', null, '2088');
INSERT INTO "public"."act_hi_identitylink" VALUES ('2122', null, 'starter', 'admin', null, '2119');
INSERT INTO "public"."act_hi_identitylink" VALUES ('2208', null, 'participant', 'depman', null, '2088');
INSERT INTO "public"."act_hi_identitylink" VALUES ('2212', null, 'starter', 'admin', null, '2209');
INSERT INTO "public"."act_hi_identitylink" VALUES ('2304', null, 'starter', 'depman', null, '2301');
INSERT INTO "public"."act_hi_identitylink" VALUES ('2310', 'deptLeader', 'candidate', null, '2309', null);
INSERT INTO "public"."act_hi_identitylink" VALUES ('24', 'deptLeader', 'candidate', null, '23', null);
INSERT INTO "public"."act_hi_identitylink" VALUES ('2404', null, 'starter', 'depman', null, '2401');
INSERT INTO "public"."act_hi_identitylink" VALUES ('2410', 'deptLeader', 'candidate', null, '2409', null);
INSERT INTO "public"."act_hi_identitylink" VALUES ('25', null, 'participant', 'depman', null, '5');
INSERT INTO "public"."act_hi_identitylink" VALUES ('2504', null, 'starter', 'admin', null, '2501');
INSERT INTO "public"."act_hi_identitylink" VALUES ('2510', 'deptLeader', 'candidate', null, '2509', null);
INSERT INTO "public"."act_hi_identitylink" VALUES ('2511', null, 'participant', 'depman', null, '2501');
INSERT INTO "public"."act_hi_identitylink" VALUES ('8', null, 'starter', 'admin', null, '5');
INSERT INTO "public"."act_hi_identitylink" VALUES ('804', null, 'starter', 'admin', null, '801');
INSERT INTO "public"."act_hi_identitylink" VALUES ('810', 'deptLeader', 'candidate', null, '809', null);
INSERT INTO "public"."act_hi_identitylink" VALUES ('811', null, 'participant', 'depman', null, '801');
INSERT INTO "public"."act_hi_identitylink" VALUES ('822', 'deptLeader', 'candidate', null, '821', null);
INSERT INTO "public"."act_hi_identitylink" VALUES ('827', 'hr', 'candidate', null, '826', null);
INSERT INTO "public"."act_hi_identitylink" VALUES ('828', null, 'participant', 'user2', null, '801');
INSERT INTO "public"."act_hi_identitylink" VALUES ('838', 'deptLeader', 'candidate', null, '837', null);
INSERT INTO "public"."act_hi_identitylink" VALUES ('843', 'hr', 'candidate', null, '842', null);
INSERT INTO "public"."act_hi_identitylink" VALUES ('904', null, 'starter', 'admin', null, '901');
INSERT INTO "public"."act_hi_identitylink" VALUES ('910', 'deptLeader', 'candidate', null, '909', null);
INSERT INTO "public"."act_hi_identitylink" VALUES ('911', null, 'participant', 'depman', null, '901');
COMMIT;

-- ----------------------------
--  Table structure for act_hi_procinst
-- ----------------------------
DROP TABLE IF EXISTS "public"."act_hi_procinst";
CREATE TABLE "public"."act_hi_procinst" (
	"id_" varchar(64) NOT NULL COLLATE "default",
	"proc_inst_id_" varchar(64) NOT NULL COLLATE "default",
	"business_key_" varchar(255) COLLATE "default",
	"proc_def_id_" varchar(64) NOT NULL COLLATE "default",
	"start_time_" timestamp(6) NOT NULL,
	"end_time_" timestamp(6) NULL,
	"duration_" int8,
	"start_user_id_" varchar(255) COLLATE "default",
	"start_act_id_" varchar(255) COLLATE "default",
	"end_act_id_" varchar(255) COLLATE "default",
	"super_process_instance_id_" varchar(64) COLLATE "default",
	"delete_reason_" varchar(4000) COLLATE "default"
)
WITH (OIDS=FALSE);
ALTER TABLE "public"."act_hi_procinst" OWNER TO "postgres";

-- ----------------------------
--  Records of act_hi_procinst
-- ----------------------------
BEGIN;
INSERT INTO "public"."act_hi_procinst" VALUES ('1001', '1001', '7', 'leave:1:4', '2014-04-05 23:18:38', null, null, 'admin', 'startevent1', null, null, null);
INSERT INTO "public"."act_hi_procinst" VALUES ('1101', '1101', '8', 'leave:1:4', '2014-04-11 16:20:33', null, null, 'admin', 'startevent1', null, null, null);
INSERT INTO "public"."act_hi_procinst" VALUES ('113', '113', '4', 'leave:1:4', '2014-03-24 15:22:13', '2014-03-25 21:07:18', '107105157', 'admin', 'startevent1', 'endevent1', null, null);
INSERT INTO "public"."act_hi_procinst" VALUES ('1201', '1201', '9', 'leave:1:4', '2014-04-16 09:05:12', null, null, 'admin', 'startevent1', null, null, null);
INSERT INTO "public"."act_hi_procinst" VALUES ('1212', '1212', '10', 'leave:1:4', '2014-04-16 13:28:14', null, null, 'depman', 'startevent1', null, null, null);
INSERT INTO "public"."act_hi_procinst" VALUES ('1308', '1308', null, 'freeLeave:1:1306', '2014-04-23 08:42:56', null, null, 'admin', 'startevent1', null, null, null);
INSERT INTO "public"."act_hi_procinst" VALUES ('15', '15', '3', 'leave:1:4', '2014-03-24 10:02:04', null, null, 'depman', 'startevent1', null, null, null);
INSERT INTO "public"."act_hi_procinst" VALUES ('2001', '2001', null, 'freeLeave:3:1906', '2014-04-25 09:12:54', null, null, 'admin', 'startevent1', null, null, null);
INSERT INTO "public"."act_hi_procinst" VALUES ('2033', '2033', null, 'freeLeave:3:1906', '2014-04-25 12:03:17', null, null, 'admin', 'startevent1', null, null, null);
INSERT INTO "public"."act_hi_procinst" VALUES ('2065', '2065', null, 'freeLeave:3:1906', '2014-04-25 12:03:48', null, null, 'admin', 'startevent1', null, null, null);
INSERT INTO "public"."act_hi_procinst" VALUES ('2088', '2088', null, 'freeLeave:3:1906', '2014-04-25 12:03:55', null, null, 'admin', 'startevent1', null, null, null);
INSERT INTO "public"."act_hi_procinst" VALUES ('2119', '2119', null, 'freeLeave:3:1906', '2014-04-25 12:04:41', null, null, 'admin', 'startevent1', null, null, null);
INSERT INTO "public"."act_hi_procinst" VALUES ('2209', '2209', null, 'freeLeave:3:1906', '2014-04-25 17:34:51', null, null, 'admin', 'startevent1', null, null, null);
INSERT INTO "public"."act_hi_procinst" VALUES ('2301', '2301', '11', 'leave:4:1907', '2014-05-12 10:26:00', null, null, 'depman', 'startevent1', null, null, null);
INSERT INTO "public"."act_hi_procinst" VALUES ('2401', '2401', '12', 'leave:4:1907', '2014-05-13 08:54:51', null, null, 'depman', 'startevent1', null, null, null);
INSERT INTO "public"."act_hi_procinst" VALUES ('2501', '2501', '13', 'leave:4:1907', '2014-06-04 10:55:18', null, null, 'admin', 'startevent1', null, null, null);
INSERT INTO "public"."act_hi_procinst" VALUES ('5', '5', '2', 'leave:1:4', '2014-03-24 09:57:30', '2014-03-25 21:00:49', '126199469', 'admin', 'startevent1', 'endevent1', null, null);
INSERT INTO "public"."act_hi_procinst" VALUES ('801', '801', '5', 'leave:1:4', '2014-03-25 21:20:02', null, null, 'admin', 'startevent1', null, null, null);
INSERT INTO "public"."act_hi_procinst" VALUES ('901', '901', '6', 'leave:1:4', '2014-03-27 13:40:14', null, null, 'admin', 'startevent1', null, null, null);
COMMIT;

-- ----------------------------
--  Table structure for act_hi_taskinst
-- ----------------------------
DROP TABLE IF EXISTS "public"."act_hi_taskinst";
CREATE TABLE "public"."act_hi_taskinst" (
	"id_" varchar(64) NOT NULL COLLATE "default",
	"proc_def_id_" varchar(64) COLLATE "default",
	"task_def_key_" varchar(255) COLLATE "default",
	"proc_inst_id_" varchar(64) COLLATE "default",
	"execution_id_" varchar(64) COLLATE "default",
	"name_" varchar(255) COLLATE "default",
	"parent_task_id_" varchar(64) COLLATE "default",
	"description_" varchar(4000) COLLATE "default",
	"owner_" varchar(255) COLLATE "default",
	"assignee_" varchar(255) COLLATE "default",
	"start_time_" timestamp(6) NOT NULL,
	"claim_time_" timestamp(6) NULL,
	"end_time_" timestamp(6) NULL,
	"duration_" int8,
	"delete_reason_" varchar(4000) COLLATE "default",
	"priority_" int4,
	"due_date_" timestamp(6) NULL,
	"form_key_" varchar(255) COLLATE "default"
)
WITH (OIDS=FALSE);
ALTER TABLE "public"."act_hi_taskinst" OWNER TO "postgres";

-- ----------------------------
--  Records of act_hi_taskinst
-- ----------------------------
BEGIN;
INSERT INTO "public"."act_hi_taskinst" VALUES ('1009', 'leave:1:4', 'deptLeaderAudit', '1001', '1001', '部门领导审批', null, null, null, 'depman', '2014-04-05 23:18:38', '2014-04-05 23:20:08', '2014-04-05 23:20:48', '130806', 'completed', '50', null, null);
INSERT INTO "public"."act_hi_taskinst" VALUES ('1016', 'leave:1:4', 'hrAudit', '1001', '1001', '人事审批', null, null, null, 'user2', '2014-04-05 23:20:48', '2014-04-05 23:22:57', '2014-04-05 23:23:50', '182128', 'completed', '50', null, null);
INSERT INTO "public"."act_hi_taskinst" VALUES ('1023', 'leave:1:4', 'modifyApply', '1001', '1001', '调整申请', null, null, null, 'admin', '2014-04-05 23:23:50', null, '2014-04-05 23:29:50', '360882', 'completed', '50', null, null);
INSERT INTO "public"."act_hi_taskinst" VALUES ('1028', 'leave:1:4', 'deptLeaderAudit', '1001', '1001', '部门领导审批', null, null, null, 'depman', '2014-04-05 23:29:50', '2014-04-11 16:20:58', null, null, null, '50', null, null);
INSERT INTO "public"."act_hi_taskinst" VALUES ('105', 'leave:1:4', 'hrAudit', '15', '15', '人事审批', null, null, null, 'user2', '2014-03-24 14:59:34', '2014-03-24 15:15:35', '2014-03-24 21:04:20', '21886331', 'completed', '50', null, null);
INSERT INTO "public"."act_hi_taskinst" VALUES ('1109', 'leave:1:4', 'deptLeaderAudit', '1101', '1101', '部门领导审批', null, null, null, 'depman', '2014-04-11 16:20:33', '2014-04-11 16:21:18', null, null, null, '50', null, null);
INSERT INTO "public"."act_hi_taskinst" VALUES ('112', 'leave:1:4', 'modifyApply', '5', '5', '调整申请', null, null, null, 'admin', '2014-03-24 15:20:40', null, '2014-03-25 21:00:49', '106809394', 'completed', '50', null, null);
INSERT INTO "public"."act_hi_taskinst" VALUES ('1209', 'leave:1:4', 'deptLeaderAudit', '1201', '1201', '部门领导审批', null, null, null, 'depman', '2014-04-16 09:05:12', '2014-04-16 09:05:25', null, null, null, '50', null, null);
INSERT INTO "public"."act_hi_taskinst" VALUES ('121', 'leave:1:4', 'deptLeaderAudit', '113', '113', '部门领导审批', null, null, null, 'depman', '2014-03-24 15:22:13', '2014-03-24 15:23:55', '2014-03-25 21:03:44', '106891173', 'completed', '50', null, null);
INSERT INTO "public"."act_hi_taskinst" VALUES ('1220', 'leave:1:4', 'deptLeaderAudit', '1212', '1212', '部门领导审批', null, null, null, 'depman', '2014-04-16 13:28:14', '2014-04-16 13:29:15', null, null, null, '50', null, null);
INSERT INTO "public"."act_hi_taskinst" VALUES ('13', 'leave:1:4', 'deptLeaderAudit', '5', '5', '部门领导审批', null, null, null, 'depman', '2014-03-24 09:57:31', '2014-03-24 12:51:57', '2014-03-24 15:20:40', '19389181', 'completed', '50', null, null);
INSERT INTO "public"."act_hi_taskinst" VALUES ('1329', 'freeLeave:1:1306', 'approval', '1308', '1319', '自由流请假', null, null, null, 'depman', '2014-04-23 08:42:56', null, '2014-04-23 12:09:56', '12420470', 'completed', '50', null, null);
INSERT INTO "public"."act_hi_taskinst" VALUES ('1809', 'freeLeave:1:1306', 'approval', '1308', '1319', '自由流请假', null, null, null, 'admin', '2014-04-23 12:09:56', null, '2014-04-23 12:10:48', '52948', 'completed', '50', null, null);
INSERT INTO "public"."act_hi_taskinst" VALUES ('1816', 'freeLeave:1:1306', 'approval', '1308', '1319', '自由流请假', null, null, null, 'admin', '2014-04-23 12:10:48', null, null, null, null, '50', null, null);
INSERT INTO "public"."act_hi_taskinst" VALUES ('2022', 'freeLeave:3:1906', 'approval', '2001', '2012', '审批', null, null, null, 'admin', '2014-04-25 09:12:54', null, '2014-04-25 11:54:06', '9672895', 'completed', '50', null, null);
INSERT INTO "public"."act_hi_taskinst" VALUES ('2032', 'freeLeave:3:1906', 'usertask1', '2001', '2001', '重新调整', null, null, null, 'admin', '2014-04-25 11:54:06', null, null, null, null, '50', null, null);
INSERT INTO "public"."act_hi_taskinst" VALUES ('2054', 'freeLeave:3:1906', 'approval', '2033', '2044', '审批', null, null, null, 'admin', '2014-04-25 12:03:17', null, '2014-04-25 12:03:33', '16013', 'completed', '50', null, null);
INSERT INTO "public"."act_hi_taskinst" VALUES ('2064', 'freeLeave:3:1906', 'usertask1', '2033', '2033', '重新调整', null, null, null, 'admin', '2014-04-25 12:03:33', null, null, null, null, '50', null, null);
INSERT INTO "public"."act_hi_taskinst" VALUES ('2086', 'freeLeave:3:1906', 'approval', '2065', '2076', '审批', null, null, null, 'user2', '2014-04-25 12:03:48', null, null, null, null, '50', null, null);
INSERT INTO "public"."act_hi_taskinst" VALUES ('2109', 'freeLeave:3:1906', 'approval', '2088', '2099', '审批', null, null, null, 'admin', '2014-04-25 12:03:55', null, '2014-04-25 12:04:15', '20437', 'completed', '50', null, null);
INSERT INTO "public"."act_hi_taskinst" VALUES ('2118', 'freeLeave:3:1906', 'approval', '2088', '2099', '审批', null, null, null, 'admin', '2014-04-25 12:04:15', null, '2014-04-25 17:34:25', '19810519', 'completed', '50', null, null);
INSERT INTO "public"."act_hi_taskinst" VALUES ('2140', 'freeLeave:3:1906', 'approval', '2119', '2130', '审批', null, null, null, 'admin', '2014-04-25 12:04:41', null, null, null, null, '50', null, null);
INSERT INTO "public"."act_hi_taskinst" VALUES ('2207', 'freeLeave:3:1906', 'approval', '2088', '2099', '审批', null, null, null, 'depman', '2014-04-25 17:34:25', null, null, null, null, '50', null, null);
INSERT INTO "public"."act_hi_taskinst" VALUES ('2230', 'freeLeave:3:1906', 'approval', '2209', '2220', '审批', null, null, null, 'admin', '2014-04-25 17:34:51', null, null, null, null, '50', null, null);
INSERT INTO "public"."act_hi_taskinst" VALUES ('23', 'leave:1:4', 'deptLeaderAudit', '15', '15', '部门领导审批', null, null, null, 'depman', '2014-03-24 10:02:04', '2014-03-24 11:29:06', '2014-03-24 14:59:34', '17850455', 'completed', '50', null, null);
INSERT INTO "public"."act_hi_taskinst" VALUES ('2309', 'leave:4:1907', 'deptLeaderAudit', '2301', '2301', '部门领导审批', null, null, null, 'depman', '2014-05-12 10:26:00', '2014-05-12 10:26:08', null, null, null, '50', null, null);
INSERT INTO "public"."act_hi_taskinst" VALUES ('2409', 'leave:4:1907', 'deptLeaderAudit', '2401', '2401', '部门领导审批', null, null, null, 'depman', '2014-05-13 08:54:51', '2014-05-13 08:54:55', null, null, null, '50', null, null);
INSERT INTO "public"."act_hi_taskinst" VALUES ('2509', 'leave:4:1907', 'deptLeaderAudit', '2501', '2501', '部门领导审批', null, null, null, 'depman', '2014-06-04 10:55:18', '2014-06-04 10:56:10', null, null, null, '50', null, null);
INSERT INTO "public"."act_hi_taskinst" VALUES ('305', 'leave:1:4', 'reportBack', '15', '15', '销假', null, null, null, 'depman', '2014-03-24 21:04:20', null, null, null, null, '50', null, null);
INSERT INTO "public"."act_hi_taskinst" VALUES ('709', 'leave:1:4', 'modifyApply', '113', '113', '调整申请', null, null, null, 'admin', '2014-03-25 21:03:44', null, '2014-03-25 21:07:18', '214146', 'completed', '50', null, null);
INSERT INTO "public"."act_hi_taskinst" VALUES ('809', 'leave:1:4', 'deptLeaderAudit', '801', '801', '部门领导审批', null, null, null, 'depman', '2014-03-25 21:20:02', '2014-03-25 21:20:33', '2014-03-25 21:20:47', '45607', 'completed', '50', null, null);
INSERT INTO "public"."act_hi_taskinst" VALUES ('816', 'leave:1:4', 'modifyApply', '801', '801', '调整申请', null, null, null, 'admin', '2014-03-25 21:20:47', null, '2014-03-25 21:21:53', '66532', 'completed', '50', null, null);
INSERT INTO "public"."act_hi_taskinst" VALUES ('821', 'leave:1:4', 'deptLeaderAudit', '801', '801', '部门领导审批', null, null, null, 'admin', '2014-03-25 21:21:53', '2014-03-25 21:23:30', '2014-03-25 21:24:37', '164815', 'completed', '50', null, null);
INSERT INTO "public"."act_hi_taskinst" VALUES ('826', 'leave:1:4', 'hrAudit', '801', '801', '人事审批', null, null, null, 'user2', '2014-03-25 21:24:37', '2014-03-25 21:25:00', '2014-03-25 21:25:09', '32426', 'completed', '50', null, null);
INSERT INTO "public"."act_hi_taskinst" VALUES ('833', 'leave:1:4', 'modifyApply', '801', '801', '调整申请', null, null, null, 'admin', '2014-03-25 21:25:09', null, '2014-03-25 21:31:17', '368443', 'completed', '50', null, null);
INSERT INTO "public"."act_hi_taskinst" VALUES ('837', 'leave:1:4', 'deptLeaderAudit', '801', '801', '部门领导审批', null, null, null, 'depman', '2014-03-25 21:31:17', '2014-03-25 21:34:08', '2014-03-25 21:34:24', '187679', 'completed', '50', null, null);
INSERT INTO "public"."act_hi_taskinst" VALUES ('842', 'leave:1:4', 'hrAudit', '801', '801', '人事审批', null, null, null, 'user2', '2014-03-25 21:34:24', '2014-03-25 21:35:07', '2014-03-25 21:35:43', '79551', 'completed', '50', null, null);
INSERT INTO "public"."act_hi_taskinst" VALUES ('847', 'leave:1:4', 'reportBack', '801', '801', '销假', null, null, null, 'admin', '2014-03-25 21:35:43', null, null, null, null, '50', null, null);
INSERT INTO "public"."act_hi_taskinst" VALUES ('909', 'leave:1:4', 'deptLeaderAudit', '901', '901', '部门领导审批', null, null, null, 'depman', '2014-03-27 13:40:14', '2014-03-27 13:46:44', null, null, null, '50', null, null);
COMMIT;

-- ----------------------------
--  Table structure for act_hi_varinst
-- ----------------------------
DROP TABLE IF EXISTS "public"."act_hi_varinst";
CREATE TABLE "public"."act_hi_varinst" (
	"id_" varchar(64) NOT NULL COLLATE "default",
	"proc_inst_id_" varchar(64) COLLATE "default",
	"execution_id_" varchar(64) COLLATE "default",
	"task_id_" varchar(64) COLLATE "default",
	"name_" varchar(255) NOT NULL COLLATE "default",
	"var_type_" varchar(100) COLLATE "default",
	"rev_" int4,
	"bytearray_id_" varchar(64) COLLATE "default",
	"double_" float8,
	"long_" int8,
	"text_" varchar(4000) COLLATE "default",
	"text2_" varchar(4000) COLLATE "default"
)
WITH (OIDS=FALSE);
ALTER TABLE "public"."act_hi_varinst" OWNER TO "postgres";

-- ----------------------------
--  Records of act_hi_varinst
-- ----------------------------
BEGIN;
INSERT INTO "public"."act_hi_varinst" VALUES ('10', '5', '5', null, 'sponsor', 'string', '0', null, null, null, '超级管理员', null);
INSERT INTO "public"."act_hi_varinst" VALUES ('1002', '1001', '1001', null, 'applyUserId', 'string', '0', null, null, null, 'admin', null);
INSERT INTO "public"."act_hi_varinst" VALUES ('1006', '1001', '1001', null, 'sponsor', 'string', '0', null, null, null, '超级管理员', null);
INSERT INTO "public"."act_hi_varinst" VALUES ('101', '15', '15', null, 'deptLeaderPass', 'boolean', '0', null, null, '1', null, null);
INSERT INTO "public"."act_hi_varinst" VALUES ('1012', '1001', '1001', null, 'deptLeaderPass', 'boolean', '0', null, null, '1', null, null);
INSERT INTO "public"."act_hi_varinst" VALUES ('1019', '1001', '1001', null, 'hrPass', 'boolean', '0', null, null, '0', null, null);
INSERT INTO "public"."act_hi_varinst" VALUES ('1024', '1001', '1001', null, 'reApply', 'boolean', '0', null, null, '1', null, null);
INSERT INTO "public"."act_hi_varinst" VALUES ('108', '5', '5', null, 'deptLeaderPass', 'boolean', '0', null, null, '0', null, null);
INSERT INTO "public"."act_hi_varinst" VALUES ('1102', '1101', '1101', null, 'applyUserId', 'string', '0', null, null, null, 'admin', null);
INSERT INTO "public"."act_hi_varinst" VALUES ('1106', '1101', '1101', null, 'sponsor', 'string', '0', null, null, null, '超级管理员', null);
INSERT INTO "public"."act_hi_varinst" VALUES ('114', '113', '113', null, 'applyUserId', 'string', '0', null, null, null, 'admin', null);
INSERT INTO "public"."act_hi_varinst" VALUES ('118', '113', '113', null, 'sponsor', 'string', '0', null, null, null, '超级管理员', null);
INSERT INTO "public"."act_hi_varinst" VALUES ('1202', '1201', '1201', null, 'applyUserId', 'string', '0', null, null, null, 'admin', null);
INSERT INTO "public"."act_hi_varinst" VALUES ('1206', '1201', '1201', null, 'sponsor', 'string', '0', null, null, null, '超级管理员', null);
INSERT INTO "public"."act_hi_varinst" VALUES ('1213', '1212', '1212', null, 'applyUserId', 'string', '0', null, null, null, 'depman', null);
INSERT INTO "public"."act_hi_varinst" VALUES ('1217', '1212', '1212', null, 'sponsor', 'string', '0', null, null, null, '部门经理', null);
INSERT INTO "public"."act_hi_varinst" VALUES ('1309', '1308', '1308', null, 'applyUser', 'string', '0', null, null, null, 'admin', null);
INSERT INTO "public"."act_hi_varinst" VALUES ('1313', '1308', '1308', null, 'reason', 'string', '0', null, null, null, 'test1', null);
INSERT INTO "public"."act_hi_varinst" VALUES ('1315', '1308', '1308', null, 'approvalUser', 'string', '1', null, null, null, 'admin', null);
INSERT INTO "public"."act_hi_varinst" VALUES ('1317', '1308', '1308', null, 'sponsor', 'string', '0', null, null, null, '超级管理员', null);
INSERT INTO "public"."act_hi_varinst" VALUES ('1321', '1308', '1319', null, 'nrOfInstances', 'integer', '0', null, null, '10', '10', null);
INSERT INTO "public"."act_hi_varinst" VALUES ('1323', '1308', '1319', null, 'nrOfCompletedInstances', 'integer', '2', null, null, '2', '2', null);
INSERT INTO "public"."act_hi_varinst" VALUES ('1325', '1308', '1319', null, 'loopCounter', 'integer', '2', null, null, '2', '2', null);
INSERT INTO "public"."act_hi_varinst" VALUES ('1327', '1308', '1319', null, 'nrOfActiveInstances', 'integer', '0', null, null, '1', '1', null);
INSERT INTO "public"."act_hi_varinst" VALUES ('16', '15', '15', null, 'applyUserId', 'string', '0', null, null, null, 'depman', null);
INSERT INTO "public"."act_hi_varinst" VALUES ('1801', '1308', '1308', null, 'endTag', 'boolean', '0', null, null, '0', null, null);
INSERT INTO "public"."act_hi_varinst" VALUES ('1804', '1308', '1308', null, 'auditOpinion', 'string', '1', null, null, null, 'hello1111111111111111', null);
INSERT INTO "public"."act_hi_varinst" VALUES ('20', '15', '15', null, 'sponsor', 'string', '0', null, null, null, '部门经理', null);
INSERT INTO "public"."act_hi_varinst" VALUES ('2002', '2001', '2001', null, 'applyUser', 'string', '0', null, null, null, 'admin', null);
INSERT INTO "public"."act_hi_varinst" VALUES ('2006', '2001', '2001', null, 'reason', 'string', '0', null, null, null, '11111111111111', null);
INSERT INTO "public"."act_hi_varinst" VALUES ('2008', '2001', '2001', null, 'approvalUser', 'string', '0', null, null, null, 'admin', null);
INSERT INTO "public"."act_hi_varinst" VALUES ('2010', '2001', '2001', null, 'sponsor', 'string', '0', null, null, null, '超级管理员', null);
INSERT INTO "public"."act_hi_varinst" VALUES ('2014', '2001', '2012', null, 'nrOfInstances', 'integer', '0', null, null, '10', '10', null);
INSERT INTO "public"."act_hi_varinst" VALUES ('2016', '2001', '2012', null, 'nrOfCompletedInstances', 'integer', '1', null, null, '1', '1', null);
INSERT INTO "public"."act_hi_varinst" VALUES ('2018', '2001', '2012', null, 'loopCounter', 'integer', '1', null, null, '1', '1', null);
INSERT INTO "public"."act_hi_varinst" VALUES ('2020', '2001', '2012', null, 'nrOfActiveInstances', 'integer', '0', null, null, '1', '1', null);
INSERT INTO "public"."act_hi_varinst" VALUES ('2023', '2001', '2001', null, 'endTag', 'boolean', '0', null, null, '1', null, null);
INSERT INTO "public"."act_hi_varinst" VALUES ('2025', '2001', '2001', null, 'auditerPass', 'boolean', '0', null, null, '0', null, null);
INSERT INTO "public"."act_hi_varinst" VALUES ('2027', '2001', '2001', null, 'auditOpinion', 'string', '0', null, null, null, '1111111', null);
INSERT INTO "public"."act_hi_varinst" VALUES ('2034', '2033', '2033', null, 'applyUser', 'string', '0', null, null, null, 'admin', null);
INSERT INTO "public"."act_hi_varinst" VALUES ('2038', '2033', '2033', null, 'reason', 'string', '0', null, null, null, '9999999999', null);
INSERT INTO "public"."act_hi_varinst" VALUES ('2040', '2033', '2033', null, 'approvalUser', 'string', '0', null, null, null, 'admin', null);
INSERT INTO "public"."act_hi_varinst" VALUES ('2042', '2033', '2033', null, 'sponsor', 'string', '0', null, null, null, '超级管理员', null);
INSERT INTO "public"."act_hi_varinst" VALUES ('2046', '2033', '2044', null, 'nrOfInstances', 'integer', '0', null, null, '10', '10', null);
INSERT INTO "public"."act_hi_varinst" VALUES ('2048', '2033', '2044', null, 'nrOfCompletedInstances', 'integer', '1', null, null, '1', '1', null);
INSERT INTO "public"."act_hi_varinst" VALUES ('2050', '2033', '2044', null, 'loopCounter', 'integer', '1', null, null, '1', '1', null);
INSERT INTO "public"."act_hi_varinst" VALUES ('2052', '2033', '2044', null, 'nrOfActiveInstances', 'integer', '0', null, null, '1', '1', null);
INSERT INTO "public"."act_hi_varinst" VALUES ('2055', '2033', '2033', null, 'endTag', 'boolean', '0', null, null, '1', null, null);
INSERT INTO "public"."act_hi_varinst" VALUES ('2057', '2033', '2033', null, 'auditerPass', 'boolean', '0', null, null, '0', null, null);
INSERT INTO "public"."act_hi_varinst" VALUES ('2059', '2033', '2033', null, 'auditOpinion', 'string', '0', null, null, null, '888888888', null);
INSERT INTO "public"."act_hi_varinst" VALUES ('2066', '2065', '2065', null, 'applyUser', 'string', '0', null, null, null, 'admin', null);
INSERT INTO "public"."act_hi_varinst" VALUES ('2070', '2065', '2065', null, 'reason', 'string', '0', null, null, null, '-------', null);
INSERT INTO "public"."act_hi_varinst" VALUES ('2072', '2065', '2065', null, 'approvalUser', 'string', '0', null, null, null, 'user2', null);
INSERT INTO "public"."act_hi_varinst" VALUES ('2074', '2065', '2065', null, 'sponsor', 'string', '0', null, null, null, '超级管理员', null);
INSERT INTO "public"."act_hi_varinst" VALUES ('2078', '2065', '2076', null, 'nrOfInstances', 'integer', '0', null, null, '10', '10', null);
INSERT INTO "public"."act_hi_varinst" VALUES ('2080', '2065', '2076', null, 'nrOfCompletedInstances', 'integer', '0', null, null, '0', '0', null);
INSERT INTO "public"."act_hi_varinst" VALUES ('2082', '2065', '2076', null, 'loopCounter', 'integer', '0', null, null, '0', '0', null);
INSERT INTO "public"."act_hi_varinst" VALUES ('2084', '2065', '2076', null, 'nrOfActiveInstances', 'integer', '0', null, null, '1', '1', null);
INSERT INTO "public"."act_hi_varinst" VALUES ('2089', '2088', '2088', null, 'applyUser', 'string', '0', null, null, null, 'admin', null);
INSERT INTO "public"."act_hi_varinst" VALUES ('2093', '2088', '2088', null, 'reason', 'string', '0', null, null, null, '------------', null);
INSERT INTO "public"."act_hi_varinst" VALUES ('2095', '2088', '2088', null, 'approvalUser', 'string', '1', null, null, null, 'depman', null);
INSERT INTO "public"."act_hi_varinst" VALUES ('2097', '2088', '2088', null, 'sponsor', 'string', '0', null, null, null, '超级管理员', null);
INSERT INTO "public"."act_hi_varinst" VALUES ('2101', '2088', '2099', null, 'nrOfInstances', 'integer', '0', null, null, '10', '10', null);
INSERT INTO "public"."act_hi_varinst" VALUES ('2103', '2088', '2099', null, 'nrOfCompletedInstances', 'integer', '2', null, null, '2', '2', null);
INSERT INTO "public"."act_hi_varinst" VALUES ('2105', '2088', '2099', null, 'loopCounter', 'integer', '2', null, null, '2', '2', null);
INSERT INTO "public"."act_hi_varinst" VALUES ('2107', '2088', '2099', null, 'nrOfActiveInstances', 'integer', '0', null, null, '1', '1', null);
INSERT INTO "public"."act_hi_varinst" VALUES ('2110', '2088', '2088', null, 'endTag', 'boolean', '0', null, null, '0', null, null);
INSERT INTO "public"."act_hi_varinst" VALUES ('2113', '2088', '2088', null, 'auditOpinion', 'string', '1', null, null, null, 'dsffsdf', null);
INSERT INTO "public"."act_hi_varinst" VALUES ('2120', '2119', '2119', null, 'applyUser', 'string', '0', null, null, null, 'admin', null);
INSERT INTO "public"."act_hi_varinst" VALUES ('2124', '2119', '2119', null, 'reason', 'string', '0', null, null, null, '9999999', null);
INSERT INTO "public"."act_hi_varinst" VALUES ('2126', '2119', '2119', null, 'approvalUser', 'string', '0', null, null, null, 'admin', null);
INSERT INTO "public"."act_hi_varinst" VALUES ('2128', '2119', '2119', null, 'sponsor', 'string', '0', null, null, null, '超级管理员', null);
INSERT INTO "public"."act_hi_varinst" VALUES ('2132', '2119', '2130', null, 'nrOfInstances', 'integer', '0', null, null, '10', '10', null);
INSERT INTO "public"."act_hi_varinst" VALUES ('2134', '2119', '2130', null, 'nrOfCompletedInstances', 'integer', '0', null, null, '0', '0', null);
INSERT INTO "public"."act_hi_varinst" VALUES ('2136', '2119', '2130', null, 'loopCounter', 'integer', '0', null, null, '0', '0', null);
INSERT INTO "public"."act_hi_varinst" VALUES ('2138', '2119', '2130', null, 'nrOfActiveInstances', 'integer', '0', null, null, '1', '1', null);
INSERT INTO "public"."act_hi_varinst" VALUES ('2210', '2209', '2209', null, 'applyUser', 'string', '0', null, null, null, 'admin', null);
INSERT INTO "public"."act_hi_varinst" VALUES ('2214', '2209', '2209', null, 'reason', 'string', '0', null, null, null, 'sadas', null);
INSERT INTO "public"."act_hi_varinst" VALUES ('2216', '2209', '2209', null, 'approvalUser', 'string', '0', null, null, null, 'admin', null);
INSERT INTO "public"."act_hi_varinst" VALUES ('2218', '2209', '2209', null, 'sponsor', 'string', '0', null, null, null, '超级管理员', null);
INSERT INTO "public"."act_hi_varinst" VALUES ('2222', '2209', '2220', null, 'nrOfInstances', 'integer', '0', null, null, '10', '10', null);
INSERT INTO "public"."act_hi_varinst" VALUES ('2224', '2209', '2220', null, 'nrOfCompletedInstances', 'integer', '0', null, null, '0', '0', null);
INSERT INTO "public"."act_hi_varinst" VALUES ('2226', '2209', '2220', null, 'loopCounter', 'integer', '0', null, null, '0', '0', null);
INSERT INTO "public"."act_hi_varinst" VALUES ('2228', '2209', '2220', null, 'nrOfActiveInstances', 'integer', '0', null, null, '1', '1', null);
INSERT INTO "public"."act_hi_varinst" VALUES ('2302', '2301', '2301', null, 'applyUserId', 'string', '0', null, null, null, 'depman', null);
INSERT INTO "public"."act_hi_varinst" VALUES ('2306', '2301', '2301', null, 'sponsor', 'string', '0', null, null, null, '部门经理', null);
INSERT INTO "public"."act_hi_varinst" VALUES ('2402', '2401', '2401', null, 'applyUserId', 'string', '0', null, null, null, 'depman', null);
INSERT INTO "public"."act_hi_varinst" VALUES ('2406', '2401', '2401', null, 'sponsor', 'string', '0', null, null, null, '部门经理', null);
INSERT INTO "public"."act_hi_varinst" VALUES ('2502', '2501', '2501', null, 'applyUserId', 'string', '0', null, null, null, 'admin', null);
INSERT INTO "public"."act_hi_varinst" VALUES ('2506', '2501', '2501', null, 'sponsor', 'string', '0', null, null, null, '超级管理员', null);
INSERT INTO "public"."act_hi_varinst" VALUES ('301', '15', '15', null, 'hrPass', 'boolean', '0', null, null, '1', null, null);
INSERT INTO "public"."act_hi_varinst" VALUES ('6', '5', '5', null, 'applyUserId', 'string', '0', null, null, null, 'admin', null);
INSERT INTO "public"."act_hi_varinst" VALUES ('701', '5', '5', null, 'reApply', 'boolean', '0', null, null, '0', null, null);
INSERT INTO "public"."act_hi_varinst" VALUES ('705', '113', '113', null, 'deptLeaderPass', 'boolean', '0', null, null, '0', null, null);
INSERT INTO "public"."act_hi_varinst" VALUES ('710', '113', '113', null, 'reApply', 'boolean', '0', null, null, '0', null, null);
INSERT INTO "public"."act_hi_varinst" VALUES ('802', '801', '801', null, 'applyUserId', 'string', '0', null, null, null, 'admin', null);
INSERT INTO "public"."act_hi_varinst" VALUES ('806', '801', '801', null, 'sponsor', 'string', '0', null, null, null, '超级管理员', null);
INSERT INTO "public"."act_hi_varinst" VALUES ('812', '801', '801', null, 'deptLeaderPass', 'boolean', '1', null, null, '1', null, null);
INSERT INTO "public"."act_hi_varinst" VALUES ('817', '801', '801', null, 'reApply', 'boolean', '0', null, null, '1', null, null);
INSERT INTO "public"."act_hi_varinst" VALUES ('829', '801', '801', null, 'hrPass', 'boolean', '1', null, null, '1', null, null);
INSERT INTO "public"."act_hi_varinst" VALUES ('902', '901', '901', null, 'applyUserId', 'string', '0', null, null, null, 'admin', null);
INSERT INTO "public"."act_hi_varinst" VALUES ('906', '901', '901', null, 'sponsor', 'string', '0', null, null, null, '超级管理员', null);
COMMIT;

-- ----------------------------
--  Table structure for act_re_procdef
-- ----------------------------
DROP TABLE IF EXISTS "public"."act_re_procdef";
CREATE TABLE "public"."act_re_procdef" (
	"id_" varchar(64) NOT NULL COLLATE "default",
	"rev_" int4,
	"category_" varchar(255) COLLATE "default",
	"name_" varchar(255) COLLATE "default",
	"key_" varchar(255) NOT NULL COLLATE "default",
	"version_" int4 NOT NULL,
	"deployment_id_" varchar(64) COLLATE "default",
	"resource_name_" varchar(4000) COLLATE "default",
	"dgrm_resource_name_" varchar(4000) COLLATE "default",
	"description_" varchar(4000) COLLATE "default",
	"has_start_form_key_" int2,
	"suspension_state_" int4
)
WITH (OIDS=FALSE);
ALTER TABLE "public"."act_re_procdef" OWNER TO "postgres";

-- ----------------------------
--  Records of act_re_procdef
-- ----------------------------
BEGIN;
INSERT INTO "public"."act_re_procdef" VALUES ('freeLeave:1:1306', '1', 'http://www.rguess.org/demo/activiti/leave', '自由流请假', 'freeLeave', '1', '1301', 'freeLeave/freeLeave.bpmn', 'freeLeave/freeLeave.png', '自由流请假', '0', '1');
INSERT INTO "public"."act_re_procdef" VALUES ('freeLeave:2:1706', '1', 'http://www.rguess.org/demo/activiti/leave', '自由流请假', 'freeLeave', '2', '1701', 'freeLeave.bpmn', 'freeLeave.png', '自由流请假', '0', '1');
INSERT INTO "public"."act_re_procdef" VALUES ('freeLeave:3:1906', '1', 'http://www.rguess.org/demo/activiti/leave', '自由流请假', 'freeLeave', '3', '1901', 'freeLeave/freeLeave.bpmn', 'freeLeave/freeLeave.png', '自由流请假', '0', '1');
INSERT INTO "public"."act_re_procdef" VALUES ('leave:1:4', '1', 'http://www.rguess.org/demo/activiti/leave', '请假流程', 'leave', '1', '1', 'leave/leave.bpmn', 'leave/leave.png', '请假流程演示', '0', '1');
INSERT INTO "public"."act_re_procdef" VALUES ('leave:2:1307', '1', 'http://www.rguess.org/demo/activiti/leave', '请假流程', 'leave', '2', '1301', 'leave/leave.bpmn', 'leave/leave.png', '请假流程演示', '0', '1');
INSERT INTO "public"."act_re_procdef" VALUES ('leave:3:1707', '1', 'http://www.rguess.org/demo/activiti/leave', '请假流程', 'leave', '3', '1701', 'leave/leave.bpmn', 'leave/leave.png', '请假流程演示', '0', '1');
INSERT INTO "public"."act_re_procdef" VALUES ('leave:4:1907', '1', 'http://www.rguess.org/demo/activiti/leave', '请假流程', 'leave', '4', '1901', 'leave/leave.bpmn', 'leave/leave.png', '请假流程演示', '0', '1');
COMMIT;

-- ----------------------------
--  Table structure for act_ru_job
-- ----------------------------
DROP TABLE IF EXISTS "public"."act_ru_job";
CREATE TABLE "public"."act_ru_job" (
	"id_" varchar(64) NOT NULL COLLATE "default",
	"rev_" int4,
	"type_" varchar(255) NOT NULL COLLATE "default",
	"lock_exp_time_" timestamp(6) NULL,
	"lock_owner_" varchar(255) COLLATE "default",
	"exclusive_" int2,
	"execution_id_" varchar(64) COLLATE "default",
	"process_instance_id_" varchar(64) COLLATE "default",
	"proc_def_id_" varchar(64) COLLATE "default",
	"retries_" int4,
	"exception_stack_id_" varchar(64) COLLATE "default",
	"exception_msg_" varchar(4000) COLLATE "default",
	"duedate_" timestamp(6) NULL,
	"repeat_" varchar(255) COLLATE "default",
	"handler_type_" varchar(255) COLLATE "default",
	"handler_cfg_" varchar(4000) COLLATE "default"
)
WITH (OIDS=FALSE);
ALTER TABLE "public"."act_ru_job" OWNER TO "postgres";

-- ----------------------------
--  Table structure for act_ru_task
-- ----------------------------
DROP TABLE IF EXISTS "public"."act_ru_task";
CREATE TABLE "public"."act_ru_task" (
	"id_" varchar(64) NOT NULL COLLATE "default",
	"rev_" int4,
	"execution_id_" varchar(64) COLLATE "default",
	"proc_inst_id_" varchar(64) COLLATE "default",
	"proc_def_id_" varchar(64) COLLATE "default",
	"name_" varchar(255) COLLATE "default",
	"parent_task_id_" varchar(64) COLLATE "default",
	"description_" varchar(4000) COLLATE "default",
	"task_def_key_" varchar(255) COLLATE "default",
	"owner_" varchar(255) COLLATE "default",
	"assignee_" varchar(255) COLLATE "default",
	"delegation_" varchar(64) COLLATE "default",
	"priority_" int4,
	"create_time_" timestamp(6) NOT NULL,
	"due_date_" timestamp(6) NULL,
	"suspension_state_" int4
)
WITH (OIDS=FALSE);
ALTER TABLE "public"."act_ru_task" OWNER TO "postgres";

-- ----------------------------
--  Records of act_ru_task
-- ----------------------------
BEGIN;
INSERT INTO "public"."act_ru_task" VALUES ('1028', '2', '1001', '1001', 'leave:1:4', '部门领导审批', null, null, 'deptLeaderAudit', null, 'depman', null, '50', '2014-04-05 23:29:50', null, '1');
INSERT INTO "public"."act_ru_task" VALUES ('1109', '2', '1101', '1101', 'leave:1:4', '部门领导审批', null, null, 'deptLeaderAudit', null, 'depman', null, '50', '2014-04-11 16:20:33', null, '1');
INSERT INTO "public"."act_ru_task" VALUES ('1209', '2', '1201', '1201', 'leave:1:4', '部门领导审批', null, null, 'deptLeaderAudit', null, 'depman', null, '50', '2014-04-16 09:05:12', null, '1');
INSERT INTO "public"."act_ru_task" VALUES ('1220', '2', '1212', '1212', 'leave:1:4', '部门领导审批', null, null, 'deptLeaderAudit', null, 'depman', null, '50', '2014-04-16 13:28:14', null, '1');
INSERT INTO "public"."act_ru_task" VALUES ('1816', '1', '1319', '1308', 'freeLeave:1:1306', '自由流请假', null, null, 'approval', null, 'admin', null, '50', '2014-04-23 12:10:48', null, '1');
INSERT INTO "public"."act_ru_task" VALUES ('2032', '1', '2001', '2001', 'freeLeave:3:1906', '重新调整', null, null, 'usertask1', null, 'admin', null, '50', '2014-04-25 11:54:06', null, '1');
INSERT INTO "public"."act_ru_task" VALUES ('2064', '1', '2033', '2033', 'freeLeave:3:1906', '重新调整', null, null, 'usertask1', null, 'admin', null, '50', '2014-04-25 12:03:33', null, '1');
INSERT INTO "public"."act_ru_task" VALUES ('2086', '1', '2076', '2065', 'freeLeave:3:1906', '审批', null, null, 'approval', null, 'user2', null, '50', '2014-04-25 12:03:48', null, '1');
INSERT INTO "public"."act_ru_task" VALUES ('2140', '1', '2130', '2119', 'freeLeave:3:1906', '审批', null, null, 'approval', null, 'admin', null, '50', '2014-04-25 12:04:41', null, '1');
INSERT INTO "public"."act_ru_task" VALUES ('2207', '1', '2099', '2088', 'freeLeave:3:1906', '审批', null, null, 'approval', null, 'depman', null, '50', '2014-04-25 17:34:25', null, '1');
INSERT INTO "public"."act_ru_task" VALUES ('2230', '1', '2220', '2209', 'freeLeave:3:1906', '审批', null, null, 'approval', null, 'admin', null, '50', '2014-04-25 17:34:51', null, '1');
INSERT INTO "public"."act_ru_task" VALUES ('2309', '2', '2301', '2301', 'leave:4:1907', '部门领导审批', null, null, 'deptLeaderAudit', null, 'depman', null, '50', '2014-05-12 10:26:00', null, '1');
INSERT INTO "public"."act_ru_task" VALUES ('2409', '2', '2401', '2401', 'leave:4:1907', '部门领导审批', null, null, 'deptLeaderAudit', null, 'depman', null, '50', '2014-05-13 08:54:51', null, '1');
INSERT INTO "public"."act_ru_task" VALUES ('2509', '2', '2501', '2501', 'leave:4:1907', '部门领导审批', null, null, 'deptLeaderAudit', null, 'depman', null, '50', '2014-06-04 10:55:18', null, '1');
INSERT INTO "public"."act_ru_task" VALUES ('305', '1', '15', '15', 'leave:1:4', '销假', null, null, 'reportBack', null, 'depman', null, '50', '2014-03-24 21:04:20', null, '1');
INSERT INTO "public"."act_ru_task" VALUES ('847', '1', '801', '801', 'leave:1:4', '销假', null, null, 'reportBack', null, 'admin', null, '50', '2014-03-25 21:35:43', null, '1');
INSERT INTO "public"."act_ru_task" VALUES ('909', '2', '901', '901', 'leave:1:4', '部门领导审批', null, null, 'deptLeaderAudit', null, 'depman', null, '50', '2014-03-27 13:40:14', null, '1');
COMMIT;

-- ----------------------------
--  Table structure for act_ru_identitylink
-- ----------------------------
DROP TABLE IF EXISTS "public"."act_ru_identitylink";
CREATE TABLE "public"."act_ru_identitylink" (
	"id_" varchar(64) NOT NULL COLLATE "default",
	"rev_" int4,
	"group_id_" varchar(255) COLLATE "default",
	"type_" varchar(255) COLLATE "default",
	"user_id_" varchar(255) COLLATE "default",
	"task_id_" varchar(64) COLLATE "default",
	"proc_inst_id_" varchar(64) COLLATE "default",
	"proc_def_id_" varchar(64) COLLATE "default"
)
WITH (OIDS=FALSE);
ALTER TABLE "public"."act_ru_identitylink" OWNER TO "postgres";

-- ----------------------------
--  Records of act_ru_identitylink
-- ----------------------------
BEGIN;
INSERT INTO "public"."act_ru_identitylink" VALUES ('1004', '1', null, 'starter', 'admin', null, '1001', null);
INSERT INTO "public"."act_ru_identitylink" VALUES ('1011', '1', null, 'participant', 'depman', null, '1001', null);
INSERT INTO "public"."act_ru_identitylink" VALUES ('1018', '1', null, 'participant', 'user2', null, '1001', null);
INSERT INTO "public"."act_ru_identitylink" VALUES ('1029', '1', 'deptLeader', 'candidate', null, '1028', null, null);
INSERT INTO "public"."act_ru_identitylink" VALUES ('107', '1', null, 'participant', 'user2', null, '15', null);
INSERT INTO "public"."act_ru_identitylink" VALUES ('1104', '1', null, 'starter', 'admin', null, '1101', null);
INSERT INTO "public"."act_ru_identitylink" VALUES ('1110', '1', 'deptLeader', 'candidate', null, '1109', null, null);
INSERT INTO "public"."act_ru_identitylink" VALUES ('1111', '1', null, 'participant', 'depman', null, '1101', null);
INSERT INTO "public"."act_ru_identitylink" VALUES ('1204', '1', null, 'starter', 'admin', null, '1201', null);
INSERT INTO "public"."act_ru_identitylink" VALUES ('1210', '1', 'deptLeader', 'candidate', null, '1209', null, null);
INSERT INTO "public"."act_ru_identitylink" VALUES ('1211', '1', null, 'participant', 'depman', null, '1201', null);
INSERT INTO "public"."act_ru_identitylink" VALUES ('1215', '1', null, 'starter', 'depman', null, '1212', null);
INSERT INTO "public"."act_ru_identitylink" VALUES ('1221', '1', 'deptLeader', 'candidate', null, '1220', null, null);
INSERT INTO "public"."act_ru_identitylink" VALUES ('1311', '1', null, 'starter', 'admin', null, '1308', null);
INSERT INTO "public"."act_ru_identitylink" VALUES ('1330', '1', null, 'participant', 'depman', null, '1308', null);
INSERT INTO "public"."act_ru_identitylink" VALUES ('18', '1', null, 'starter', 'depman', null, '15', null);
INSERT INTO "public"."act_ru_identitylink" VALUES ('2004', '1', null, 'starter', 'admin', null, '2001', null);
INSERT INTO "public"."act_ru_identitylink" VALUES ('2036', '1', null, 'starter', 'admin', null, '2033', null);
INSERT INTO "public"."act_ru_identitylink" VALUES ('2068', '1', null, 'starter', 'admin', null, '2065', null);
INSERT INTO "public"."act_ru_identitylink" VALUES ('2087', '1', null, 'participant', 'user2', null, '2065', null);
INSERT INTO "public"."act_ru_identitylink" VALUES ('2091', '1', null, 'starter', 'admin', null, '2088', null);
INSERT INTO "public"."act_ru_identitylink" VALUES ('2122', '1', null, 'starter', 'admin', null, '2119', null);
INSERT INTO "public"."act_ru_identitylink" VALUES ('2208', '1', null, 'participant', 'depman', null, '2088', null);
INSERT INTO "public"."act_ru_identitylink" VALUES ('2212', '1', null, 'starter', 'admin', null, '2209', null);
INSERT INTO "public"."act_ru_identitylink" VALUES ('2304', '1', null, 'starter', 'depman', null, '2301', null);
INSERT INTO "public"."act_ru_identitylink" VALUES ('2310', '1', 'deptLeader', 'candidate', null, '2309', null, null);
INSERT INTO "public"."act_ru_identitylink" VALUES ('2404', '1', null, 'starter', 'depman', null, '2401', null);
INSERT INTO "public"."act_ru_identitylink" VALUES ('2410', '1', 'deptLeader', 'candidate', null, '2409', null, null);
INSERT INTO "public"."act_ru_identitylink" VALUES ('2504', '1', null, 'starter', 'admin', null, '2501', null);
INSERT INTO "public"."act_ru_identitylink" VALUES ('2510', '1', 'deptLeader', 'candidate', null, '2509', null, null);
INSERT INTO "public"."act_ru_identitylink" VALUES ('2511', '1', null, 'participant', 'depman', null, '2501', null);
INSERT INTO "public"."act_ru_identitylink" VALUES ('804', '1', null, 'starter', 'admin', null, '801', null);
INSERT INTO "public"."act_ru_identitylink" VALUES ('811', '1', null, 'participant', 'depman', null, '801', null);
INSERT INTO "public"."act_ru_identitylink" VALUES ('828', '1', null, 'participant', 'user2', null, '801', null);
INSERT INTO "public"."act_ru_identitylink" VALUES ('904', '1', null, 'starter', 'admin', null, '901', null);
INSERT INTO "public"."act_ru_identitylink" VALUES ('910', '1', 'deptLeader', 'candidate', null, '909', null, null);
INSERT INTO "public"."act_ru_identitylink" VALUES ('911', '1', null, 'participant', 'depman', null, '901', null);
COMMIT;

-- ----------------------------
--  Table structure for act_ru_variable
-- ----------------------------
DROP TABLE IF EXISTS "public"."act_ru_variable";
CREATE TABLE "public"."act_ru_variable" (
	"id_" varchar(64) NOT NULL COLLATE "default",
	"rev_" int4,
	"type_" varchar(255) NOT NULL COLLATE "default",
	"name_" varchar(255) NOT NULL COLLATE "default",
	"execution_id_" varchar(64) COLLATE "default",
	"proc_inst_id_" varchar(64) COLLATE "default",
	"task_id_" varchar(64) COLLATE "default",
	"bytearray_id_" varchar(64) COLLATE "default",
	"double_" float8,
	"long_" int8,
	"text_" varchar(4000) COLLATE "default",
	"text2_" varchar(4000) COLLATE "default"
)
WITH (OIDS=FALSE);
ALTER TABLE "public"."act_ru_variable" OWNER TO "postgres";

-- ----------------------------
--  Records of act_ru_variable
-- ----------------------------
BEGIN;
INSERT INTO "public"."act_ru_variable" VALUES ('1002', '1', 'string', 'applyUserId', '1001', '1001', null, null, null, null, 'admin', null);
INSERT INTO "public"."act_ru_variable" VALUES ('1006', '1', 'string', 'sponsor', '1001', '1001', null, null, null, null, '超级管理员', null);
INSERT INTO "public"."act_ru_variable" VALUES ('101', '1', 'boolean', 'deptLeaderPass', '15', '15', null, null, null, '1', null, null);
INSERT INTO "public"."act_ru_variable" VALUES ('1012', '1', 'boolean', 'deptLeaderPass', '1001', '1001', null, null, null, '1', null, null);
INSERT INTO "public"."act_ru_variable" VALUES ('1019', '1', 'boolean', 'hrPass', '1001', '1001', null, null, null, '0', null, null);
INSERT INTO "public"."act_ru_variable" VALUES ('1024', '1', 'boolean', 'reApply', '1001', '1001', null, null, null, '1', null, null);
INSERT INTO "public"."act_ru_variable" VALUES ('1102', '1', 'string', 'applyUserId', '1101', '1101', null, null, null, null, 'admin', null);
INSERT INTO "public"."act_ru_variable" VALUES ('1106', '1', 'string', 'sponsor', '1101', '1101', null, null, null, null, '超级管理员', null);
INSERT INTO "public"."act_ru_variable" VALUES ('1202', '1', 'string', 'applyUserId', '1201', '1201', null, null, null, null, 'admin', null);
INSERT INTO "public"."act_ru_variable" VALUES ('1206', '1', 'string', 'sponsor', '1201', '1201', null, null, null, null, '超级管理员', null);
INSERT INTO "public"."act_ru_variable" VALUES ('1213', '1', 'string', 'applyUserId', '1212', '1212', null, null, null, null, 'depman', null);
INSERT INTO "public"."act_ru_variable" VALUES ('1217', '1', 'string', 'sponsor', '1212', '1212', null, null, null, null, '部门经理', null);
INSERT INTO "public"."act_ru_variable" VALUES ('1309', '1', 'string', 'applyUser', '1308', '1308', null, null, null, null, 'admin', null);
INSERT INTO "public"."act_ru_variable" VALUES ('1313', '1', 'string', 'reason', '1308', '1308', null, null, null, null, 'test1', null);
INSERT INTO "public"."act_ru_variable" VALUES ('1315', '2', 'string', 'approvalUser', '1308', '1308', null, null, null, null, 'admin', null);
INSERT INTO "public"."act_ru_variable" VALUES ('1317', '1', 'string', 'sponsor', '1308', '1308', null, null, null, null, '超级管理员', null);
INSERT INTO "public"."act_ru_variable" VALUES ('1321', '1', 'integer', 'nrOfInstances', '1319', '1308', null, null, null, '10', '10', null);
INSERT INTO "public"."act_ru_variable" VALUES ('1323', '3', 'integer', 'nrOfCompletedInstances', '1319', '1308', null, null, null, '2', '2', null);
INSERT INTO "public"."act_ru_variable" VALUES ('1325', '3', 'integer', 'loopCounter', '1319', '1308', null, null, null, '2', '2', null);
INSERT INTO "public"."act_ru_variable" VALUES ('1327', '1', 'integer', 'nrOfActiveInstances', '1319', '1308', null, null, null, '1', '1', null);
INSERT INTO "public"."act_ru_variable" VALUES ('16', '1', 'string', 'applyUserId', '15', '15', null, null, null, null, 'depman', null);
INSERT INTO "public"."act_ru_variable" VALUES ('1801', '1', 'boolean', 'endTag', '1308', '1308', null, null, null, '0', null, null);
INSERT INTO "public"."act_ru_variable" VALUES ('1804', '2', 'string', 'auditOpinion', '1308', '1308', null, null, null, null, 'hello1111111111111111', null);
INSERT INTO "public"."act_ru_variable" VALUES ('20', '1', 'string', 'sponsor', '15', '15', null, null, null, null, '部门经理', null);
INSERT INTO "public"."act_ru_variable" VALUES ('2002', '1', 'string', 'applyUser', '2001', '2001', null, null, null, null, 'admin', null);
INSERT INTO "public"."act_ru_variable" VALUES ('2006', '1', 'string', 'reason', '2001', '2001', null, null, null, null, '11111111111111', null);
INSERT INTO "public"."act_ru_variable" VALUES ('2008', '1', 'string', 'approvalUser', '2001', '2001', null, null, null, null, 'admin', null);
INSERT INTO "public"."act_ru_variable" VALUES ('2010', '1', 'string', 'sponsor', '2001', '2001', null, null, null, null, '超级管理员', null);
INSERT INTO "public"."act_ru_variable" VALUES ('2023', '1', 'boolean', 'endTag', '2001', '2001', null, null, null, '1', null, null);
INSERT INTO "public"."act_ru_variable" VALUES ('2025', '1', 'boolean', 'auditerPass', '2001', '2001', null, null, null, '0', null, null);
INSERT INTO "public"."act_ru_variable" VALUES ('2027', '1', 'string', 'auditOpinion', '2001', '2001', null, null, null, null, '1111111', null);
INSERT INTO "public"."act_ru_variable" VALUES ('2034', '1', 'string', 'applyUser', '2033', '2033', null, null, null, null, 'admin', null);
INSERT INTO "public"."act_ru_variable" VALUES ('2038', '1', 'string', 'reason', '2033', '2033', null, null, null, null, '9999999999', null);
INSERT INTO "public"."act_ru_variable" VALUES ('2040', '1', 'string', 'approvalUser', '2033', '2033', null, null, null, null, 'admin', null);
INSERT INTO "public"."act_ru_variable" VALUES ('2042', '1', 'string', 'sponsor', '2033', '2033', null, null, null, null, '超级管理员', null);
INSERT INTO "public"."act_ru_variable" VALUES ('2055', '1', 'boolean', 'endTag', '2033', '2033', null, null, null, '1', null, null);
INSERT INTO "public"."act_ru_variable" VALUES ('2057', '1', 'boolean', 'auditerPass', '2033', '2033', null, null, null, '0', null, null);
INSERT INTO "public"."act_ru_variable" VALUES ('2059', '1', 'string', 'auditOpinion', '2033', '2033', null, null, null, null, '888888888', null);
INSERT INTO "public"."act_ru_variable" VALUES ('2066', '1', 'string', 'applyUser', '2065', '2065', null, null, null, null, 'admin', null);
INSERT INTO "public"."act_ru_variable" VALUES ('2070', '1', 'string', 'reason', '2065', '2065', null, null, null, null, '-------', null);
INSERT INTO "public"."act_ru_variable" VALUES ('2072', '1', 'string', 'approvalUser', '2065', '2065', null, null, null, null, 'user2', null);
INSERT INTO "public"."act_ru_variable" VALUES ('2074', '1', 'string', 'sponsor', '2065', '2065', null, null, null, null, '超级管理员', null);
INSERT INTO "public"."act_ru_variable" VALUES ('2078', '1', 'integer', 'nrOfInstances', '2076', '2065', null, null, null, '10', '10', null);
INSERT INTO "public"."act_ru_variable" VALUES ('2080', '1', 'integer', 'nrOfCompletedInstances', '2076', '2065', null, null, null, '0', '0', null);
INSERT INTO "public"."act_ru_variable" VALUES ('2082', '1', 'integer', 'loopCounter', '2076', '2065', null, null, null, '0', '0', null);
INSERT INTO "public"."act_ru_variable" VALUES ('2084', '1', 'integer', 'nrOfActiveInstances', '2076', '2065', null, null, null, '1', '1', null);
INSERT INTO "public"."act_ru_variable" VALUES ('2089', '1', 'string', 'applyUser', '2088', '2088', null, null, null, null, 'admin', null);
INSERT INTO "public"."act_ru_variable" VALUES ('2093', '1', 'string', 'reason', '2088', '2088', null, null, null, null, '------------', null);
INSERT INTO "public"."act_ru_variable" VALUES ('2095', '2', 'string', 'approvalUser', '2088', '2088', null, null, null, null, 'depman', null);
INSERT INTO "public"."act_ru_variable" VALUES ('2097', '1', 'string', 'sponsor', '2088', '2088', null, null, null, null, '超级管理员', null);
INSERT INTO "public"."act_ru_variable" VALUES ('2101', '1', 'integer', 'nrOfInstances', '2099', '2088', null, null, null, '10', '10', null);
INSERT INTO "public"."act_ru_variable" VALUES ('2103', '3', 'integer', 'nrOfCompletedInstances', '2099', '2088', null, null, null, '2', '2', null);
INSERT INTO "public"."act_ru_variable" VALUES ('2105', '3', 'integer', 'loopCounter', '2099', '2088', null, null, null, '2', '2', null);
INSERT INTO "public"."act_ru_variable" VALUES ('2107', '1', 'integer', 'nrOfActiveInstances', '2099', '2088', null, null, null, '1', '1', null);
INSERT INTO "public"."act_ru_variable" VALUES ('2110', '1', 'boolean', 'endTag', '2088', '2088', null, null, null, '0', null, null);
INSERT INTO "public"."act_ru_variable" VALUES ('2113', '2', 'string', 'auditOpinion', '2088', '2088', null, null, null, null, 'dsffsdf', null);
INSERT INTO "public"."act_ru_variable" VALUES ('2120', '1', 'string', 'applyUser', '2119', '2119', null, null, null, null, 'admin', null);
INSERT INTO "public"."act_ru_variable" VALUES ('2124', '1', 'string', 'reason', '2119', '2119', null, null, null, null, '9999999', null);
INSERT INTO "public"."act_ru_variable" VALUES ('2126', '1', 'string', 'approvalUser', '2119', '2119', null, null, null, null, 'admin', null);
INSERT INTO "public"."act_ru_variable" VALUES ('2128', '1', 'string', 'sponsor', '2119', '2119', null, null, null, null, '超级管理员', null);
INSERT INTO "public"."act_ru_variable" VALUES ('2132', '1', 'integer', 'nrOfInstances', '2130', '2119', null, null, null, '10', '10', null);
INSERT INTO "public"."act_ru_variable" VALUES ('2134', '1', 'integer', 'nrOfCompletedInstances', '2130', '2119', null, null, null, '0', '0', null);
INSERT INTO "public"."act_ru_variable" VALUES ('2136', '1', 'integer', 'loopCounter', '2130', '2119', null, null, null, '0', '0', null);
INSERT INTO "public"."act_ru_variable" VALUES ('2138', '1', 'integer', 'nrOfActiveInstances', '2130', '2119', null, null, null, '1', '1', null);
INSERT INTO "public"."act_ru_variable" VALUES ('2210', '1', 'string', 'applyUser', '2209', '2209', null, null, null, null, 'admin', null);
INSERT INTO "public"."act_ru_variable" VALUES ('2214', '1', 'string', 'reason', '2209', '2209', null, null, null, null, 'sadas', null);
INSERT INTO "public"."act_ru_variable" VALUES ('2216', '1', 'string', 'approvalUser', '2209', '2209', null, null, null, null, 'admin', null);
INSERT INTO "public"."act_ru_variable" VALUES ('2218', '1', 'string', 'sponsor', '2209', '2209', null, null, null, null, '超级管理员', null);
INSERT INTO "public"."act_ru_variable" VALUES ('2222', '1', 'integer', 'nrOfInstances', '2220', '2209', null, null, null, '10', '10', null);
INSERT INTO "public"."act_ru_variable" VALUES ('2224', '1', 'integer', 'nrOfCompletedInstances', '2220', '2209', null, null, null, '0', '0', null);
INSERT INTO "public"."act_ru_variable" VALUES ('2226', '1', 'integer', 'loopCounter', '2220', '2209', null, null, null, '0', '0', null);
INSERT INTO "public"."act_ru_variable" VALUES ('2228', '1', 'integer', 'nrOfActiveInstances', '2220', '2209', null, null, null, '1', '1', null);
INSERT INTO "public"."act_ru_variable" VALUES ('2302', '1', 'string', 'applyUserId', '2301', '2301', null, null, null, null, 'depman', null);
INSERT INTO "public"."act_ru_variable" VALUES ('2306', '1', 'string', 'sponsor', '2301', '2301', null, null, null, null, '部门经理', null);
INSERT INTO "public"."act_ru_variable" VALUES ('2402', '1', 'string', 'applyUserId', '2401', '2401', null, null, null, null, 'depman', null);
INSERT INTO "public"."act_ru_variable" VALUES ('2406', '1', 'string', 'sponsor', '2401', '2401', null, null, null, null, '部门经理', null);
INSERT INTO "public"."act_ru_variable" VALUES ('2502', '1', 'string', 'applyUserId', '2501', '2501', null, null, null, null, 'admin', null);
INSERT INTO "public"."act_ru_variable" VALUES ('2506', '1', 'string', 'sponsor', '2501', '2501', null, null, null, null, '超级管理员', null);
INSERT INTO "public"."act_ru_variable" VALUES ('301', '1', 'boolean', 'hrPass', '15', '15', null, null, null, '1', null, null);
INSERT INTO "public"."act_ru_variable" VALUES ('802', '1', 'string', 'applyUserId', '801', '801', null, null, null, null, 'admin', null);
INSERT INTO "public"."act_ru_variable" VALUES ('806', '1', 'string', 'sponsor', '801', '801', null, null, null, null, '超级管理员', null);
INSERT INTO "public"."act_ru_variable" VALUES ('812', '2', 'boolean', 'deptLeaderPass', '801', '801', null, null, null, '1', null, null);
INSERT INTO "public"."act_ru_variable" VALUES ('817', '1', 'boolean', 'reApply', '801', '801', null, null, null, '1', null, null);
INSERT INTO "public"."act_ru_variable" VALUES ('829', '2', 'boolean', 'hrPass', '801', '801', null, null, null, '1', null, null);
INSERT INTO "public"."act_ru_variable" VALUES ('902', '1', 'string', 'applyUserId', '901', '901', null, null, null, null, 'admin', null);
INSERT INTO "public"."act_ru_variable" VALUES ('906', '1', 'string', 'sponsor', '901', '901', null, null, null, null, '超级管理员', null);
COMMIT;

-- ----------------------------
--  Table structure for cms_category
-- ----------------------------
DROP TABLE IF EXISTS "public"."cms_category";
CREATE TABLE "public"."cms_category" (
	"id" int8 NOT NULL DEFAULT nextval('cms_category'::regclass),
	"description" varchar(255) COLLATE "default",
	"image" varchar(255) COLLATE "default",
	"keywords" varchar(255) COLLATE "default",
	"module" varchar(255) COLLATE "default",
	"name" varchar(255) COLLATE "default",
	"parent_id" int8,
	"grade" int4 NOT NULL,
	"isshow" int4 NOT NULL,
	"orderno" int4 NOT NULL,
	"site_id" int8,
	"url" varchar(255) COLLATE "default"
)
WITH (OIDS=FALSE);
ALTER TABLE "public"."cms_category" OWNER TO "postgres";

-- ----------------------------
--  Records of cms_category
-- ----------------------------
BEGIN;
INSERT INTO "public"."cms_category" VALUES ('1', '最高级栏目', null, null, null, '栏目', null, '0', '1', '0', '2', null);
INSERT INTO "public"."cms_category" VALUES ('7', '', null, '', 'article', '各地动态', '1', '1', '0', '0', '2', null);
INSERT INTO "public"."cms_category" VALUES ('8', '', null, '', 'article', '经侦执法', '1', '1', '0', '2', '2', null);
INSERT INTO "public"."cms_category" VALUES ('9', '', null, '', 'article', '情报研判', '1', '1', '0', '3', '2', null);
INSERT INTO "public"."cms_category" VALUES ('10', '', null, '', 'article', '案件督办', '1', '1', '0', '4', '2', null);
INSERT INTO "public"."cms_category" VALUES ('11', '', null, '', 'article', '协作追查', '1', '1', '0', '5', '2', null);
INSERT INTO "public"."cms_category" VALUES ('12', '', null, '', 'article', '法律法规', '1', '1', '0', '6', '2', null);
INSERT INTO "public"."cms_category" VALUES ('13', '', null, '', 'article', '专项工作', '1', '1', '0', '7', '2', null);
INSERT INTO "public"."cms_category" VALUES ('15', '', null, '', 'article', '队伍建设', '1', '1', '0', '8', '2', null);
INSERT INTO "public"."cms_category" VALUES ('16', '', null, '', 'link', '友情链接', '1', '1', '1', '9', '2', null);
INSERT INTO "public"."cms_category" VALUES ('17', '', null, '', 'link', '购物网站', '16', '2', '1', '10', '2', null);
INSERT INTO "public"."cms_category" VALUES ('18', '', null, '', 'link', '常用网站', '16', '2', '1', '11', '2', null);
INSERT INTO "public"."cms_category" VALUES ('19', '', null, '', 'link', '门户网站', '16', '2', '1', '0', '2', null);
INSERT INTO "public"."cms_category" VALUES ('20', '', null, '', 'link', '交友社区', '16', '2', '1', '0', '2', null);
INSERT INTO "public"."cms_category" VALUES ('21', '', null, '', 'link', '音乐视频', '16', '2', '1', '0', '2', null);
INSERT INTO "public"."cms_category" VALUES ('22', '', null, '', 'article', '各地动态1', '7', '2', '1', '0', '2', null);
INSERT INTO "public"."cms_category" VALUES ('23', '', null, '', 'article', '各地动态2', '7', '2', '1', '0', '2', null);
INSERT INTO "public"."cms_category" VALUES ('24', '', null, '', 'special', '留言薄', '1', '1', '0', '0', '2', null);
INSERT INTO "public"."cms_category" VALUES ('25', '最高级栏目', '', '', '', '栏目', null, '0', '1', '0', '1', null);
INSERT INTO "public"."cms_category" VALUES ('26', '记录日记的栏目', null, '日记', 'article', '日记', '25', '1', '0', '1', '1', '');
INSERT INTO "public"."cms_category" VALUES ('27', '说技术的', null, '技术', 'article', '技术', '25', '1', '0', '0', '1', '');
INSERT INTO "public"."cms_category" VALUES ('28', '我TM就这样', null, 'about me', 'link', '关于我', '25', '1', '0', '4', '1', 'http://www.rguess.com/blog/article/35.html');
INSERT INTO "public"."cms_category" VALUES ('29', '关于java的技术博客', null, 'java', 'article', 'java', '27', '2', '0', '0', '1', '');
INSERT INTO "public"."cms_category" VALUES ('30', 'js包含jquery相关技术博客', null, 'js', 'article', 'js', '27', '2', '0', '1', '1', '');
INSERT INTO "public"."cms_category" VALUES ('31', '想说什么说什么', null, '随意', 'article', '随意', '25', '1', '0', '3', '1', null);
INSERT INTO "public"."cms_category" VALUES ('32', 'linux相关文章', null, 'linux', 'article', 'linux', '27', '2', '0', '2', '1', '');
INSERT INTO "public"."cms_category" VALUES ('33', '', null, '', 'article', '小伙伴', '25', '1', '0', '3', '1', '');
INSERT INTO "public"."cms_category" VALUES ('34', '', null, '', 'article', 'syc', '33', '2', '0', '0', '1', '');
INSERT INTO "public"."cms_category" VALUES ('35', '', null, '', 'link', '友情链接', '25', '1', '1', '4', '1', '');
INSERT INTO "public"."cms_category" VALUES ('36', '', null, '', 'article', '其他', '27', '2', '0', '4', '1', '');
INSERT INTO "public"."cms_category" VALUES ('37', '', null, '', 'article', 'sql', '27', '2', '0', '3', '1', '');
COMMIT;

-- ----------------------------
--  Table structure for cms_article
-- ----------------------------
DROP TABLE IF EXISTS "public"."cms_article";
CREATE TABLE "public"."cms_article" (
	"id" int8 NOT NULL DEFAULT nextval('seq_cms_article'::regclass),
	"color" varchar(255) COLLATE "default",
	"content" text COLLATE "default",
	"createdate" date,
	"description" varchar(255) COLLATE "default",
	"hits" int4,
	"htmlid" varchar(255) COLLATE "default",
	"image" varchar(255) COLLATE "default",
	"isword" int4,
	"keywords" varchar(255) COLLATE "default",
	"title" varchar(255) COLLATE "default",
	"weight" int4,
	"category_id" int8,
	"delflag" int4 NOT NULL,
	"updatedate" date,
	"createby_id" int8,
	"updateby_id" int8
)
WITH (OIDS=FALSE);
ALTER TABLE "public"."cms_article" OWNER TO "postgres";

-- ----------------------------
--  Records of cms_article
-- ----------------------------
BEGIN;
INSERT INTO "public"."cms_article" VALUES ('35', 'black', '<p style="text-indent: 2em;">出生在重庆一个小山村，先后读了幼儿园、小学、初中、高中、大学。于2013年夏天毕业于一个屌丝2本大学，然后在一家屌丝公司工作。虽然专业是软件专业，但是大学前期完全没想过要走专业路线，后来因为兴趣进入这个行业。在这个过程中认识了一些牛人，受他们开源精神的影响，誓要为开源事业作出微弱的贡献。虽然现在还处于模仿阶段。。。</p><p style="text-indent: 2em;">热爱互联网，乃中国亿万网络水军分之一，游走在各大社区、微博及博客之间。在新浪微博、腾讯微博、微信、百度贴吧、百度空间、网易、人人、来往、陌陌、开源中国、iteye、instagram等都拥有统一账户“rguess”，求关注。</p><p style="text-indent: 2em;">爱分享、爱吐槽、爱内涵，关注时下高新信息技术，现专注开源、敏捷、时间管理。</p><p style="text-indent: 2em;">目前从事java,js相关开发工作，<span style="text-indent: 32px;">有什么大活儿，请联系我</span>。</p><p style="text-indent: 2em;"><span style="text-indent: 2em;">QQ：502876941</span><br/></p><p style="text-indent: 2em;">代码:&nbsp;<a href="http://git.oschina.net/rguess" target="_blank" textvalue="http://git.oschina.net/rguess">http://git.oschina.net/rguess</a>&nbsp; &nbsp;<a href="http://github.com/rguess/" target="_blank" title="http://github.com/rguess/" textvalue="http://github.com/rguess/" style="text-indent: 2em;">http://github.com/rguess/</a></p><p style="text-indent: 2em;">个人网站：<a href="http://rguess.com/" target="_blank" textvalue="http://rguess.com/">http://rguess.com/</a></p><p style="text-indent: 2em;"><br/></p><p style="text-indent: 2em;"><span style="color: rgb(192, 0, 0);">注：本网站由于是自己手工完成，没有采用wordpress等建站工具，还有很多功能不足的地方，带来不便请谅解。如要想交换友链或者有什么建议和问题的请在下方留言谢谢！</span></p><p style="text-indent: 2em;"><font color="#c00000">并非所有文章都是原创，我的朋友也会发表一些和转载网上的一些文章。</font></p><p style="text-indent: 2em;"><br/></p>', '2014-05-19', '', '842', null, null, '1', 'about me', '关于我', '0', '28', '0', '2014-06-27', null, '5');
INSERT INTO "public"."cms_article" VALUES ('37', 'black', '<p style="white-space: normal; text-indent: 2em;"><span style="font-family: Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 25.200000762939453px; background-color: rgb(255, 255, 255);">使用shiro的时候，当我们使用remember me功能登录系统的时候，我们在用户登录自定义的session已经失效，这样就会影响系统正常运行；对于这种情况，我的解决方案是在shiro中自定义一个filter检测自定义的session是否失效，如果失效就读取数据加入到session中</span></p><p style="white-space: normal; text-indent: 2em;"><span style="font-family: Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 25.200000762939453px; background-color: rgb(255, 255, 255);">shiro 配置文件：&nbsp;</span></p><pre class="brush:xml;toolbar:false">&lt;!--&nbsp;自定义加入filter，起在remember&nbsp;me&nbsp;session失效情况下刷新session作用&nbsp;--&gt;&nbsp;&nbsp;
&lt;bean&nbsp;id=&quot;userSettingFilter&quot;&nbsp;class=&quot;org.guess.security.filter.UserSetting&quot;&nbsp;/&gt;</pre><p style="white-space: normal; text-indent: 2em;"><span style="font-family: Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 25.200000762939453px; background-color: rgb(255, 255, 255);"></span><span style="font-family: Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 25.200000762939453px; background-color: rgb(255, 255, 255);">在shiroFilter中加入该filter:</span></p><pre class="brush:xml;toolbar:false">&lt;property&nbsp;name=&quot;filters&quot;&gt;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&lt;util:map&gt;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;entry&nbsp;key=&quot;userSetting&quot;&nbsp;value-ref=&quot;userSettingFilter&quot;/&gt;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&lt;/util:map&gt;&nbsp;&nbsp;
&lt;/property&gt;</pre><p style="white-space: normal; text-indent: 2em;"><span style="font-family: Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 25.200000762939453px; background-color: rgb(255, 255, 255);"></span><span style="font-family: Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 25.200000762939453px; background-color: rgb(255, 255, 255);">filter类代码：&nbsp;</span></p><pre class="brush:java;toolbar:false">public&nbsp;class&nbsp;UserSetting&nbsp;extends&nbsp;AccessControlFilter&nbsp;{&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;@Autowired&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;private&nbsp;UserService&nbsp;userService;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;@Override&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;protected&nbsp;boolean&nbsp;preHandle(ServletRequest&nbsp;request,&nbsp;ServletResponse&nbsp;response)&nbsp;throws&nbsp;Exception&nbsp;{&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Subject&nbsp;subject&nbsp;=&nbsp;getSubject(request,&nbsp;response);&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if&nbsp;(subject&nbsp;==&nbsp;null)&nbsp;{&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;return&nbsp;false;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;HttpSession&nbsp;session&nbsp;=&nbsp;((HttpServletRequest)request).getSession();&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;User&nbsp;current_user&nbsp;=&nbsp;(User)&nbsp;session.getAttribute(Constants.CURRENT_USER);&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Object&nbsp;recs&nbsp;=&nbsp;session.getAttribute(Constants.USER_MENUS);&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;//判断session是否失效，若失效刷新之&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if(current_user&nbsp;==&nbsp;null&nbsp;||&nbsp;recs&nbsp;==&nbsp;null){&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;String&nbsp;username&nbsp;=&nbsp;(String)&nbsp;subject.getPrincipal();&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;User&nbsp;user&nbsp;=&nbsp;userService.findByLoginId(username);&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;session.setAttribute(Constants.CURRENT_USER,&nbsp;user);&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;session.setAttribute(Constants.USER_MENUS,&nbsp;user.getMenus());&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;return&nbsp;true;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;}&nbsp;&nbsp;
&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;@Override&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;protected&nbsp;boolean&nbsp;isAccessAllowed(ServletRequest&nbsp;request,&nbsp;ServletResponse&nbsp;response,&nbsp;Object&nbsp;mappedValue)&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;throws&nbsp;Exception&nbsp;{&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;return&nbsp;true;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;}&nbsp;&nbsp;
&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;@Override&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;protected&nbsp;boolean&nbsp;onAccessDenied(ServletRequest&nbsp;request,&nbsp;ServletResponse&nbsp;response)&nbsp;throws&nbsp;Exception&nbsp;{&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;return&nbsp;true;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;}&nbsp;&nbsp;
&nbsp;&nbsp;
}</pre><p style="white-space: normal; text-indent: 2em;"><span style="font-family: Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 25.200000762939453px; background-color: rgb(255, 255, 255);"></span><span style="color: rgb(0, 112, 192); font-size: 20px;">基本可以解决问题<img src="http://img.baidu.com/hi/jx2/j_0063.gif"/></span><br/></p><p><span style="color: rgb(0, 112, 192); font-size: 20px;"><br/></span></p><p><br/></p>', '2014-05-21', '使用shiro的时候，当我们使用remember me功能登录系统的时候，我们在用户登录自定义的session已经失效，这样就会影响系统正常运行；对于这种情况，我的解决方案是在shiro中自定义一个filter检测自定义的session是否失效，如果失效就读取数据加入到session中 ', '328', null, null, '1', 'shiro,java', 'shiro在remember me状态下session失效解决办法 ', '0', '29', '0', '2014-06-18', null, '5');
INSERT INTO "public"."cms_article" VALUES ('38', 'black', '', '2014-05-21', '', '210', null, null, '1', 'jquery', 'jquery实现居中可拖拽窗体', '0', '30', '0', null, null, null);
INSERT INTO "public"."cms_article" VALUES ('39', 'black', '', '2014-05-21', '文件操作工具类，实现文件的创建、删除、复制、压缩、解压以及目录的创建、删除、复制、压缩解压等功能', '168', null, null, '1', 'java', 'java文件操作工具类', '0', '29', '0', null, null, null);
INSERT INTO "public"."cms_article" VALUES ('40', 'black', '<p><span style="font-family: Helvetica, Tahoma, Arial, sans-serif; font-size: 12px; line-height: 18px; background-color: rgb(255, 255, 255);">js回调函数传参数，简单代码蕴藏大智慧<img src="http://img.baidu.com/hi/jx2/j_0057.gif" width="18" height="18" border="0" hspace="0" vspace="0" title="" style="width: 18px; height: 18px;"/></span></p><pre class="brush:js;toolbar:false">function&nbsp;a(callback){&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;var&nbsp;m&nbsp;=&nbsp;1;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;var&nbsp;n&nbsp;=&nbsp;2;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;alert(callback(m,n));&nbsp;&nbsp;
}&nbsp;&nbsp;
&nbsp;&nbsp;
function&nbsp;b(m,n){&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;return&nbsp;m+n;&nbsp;&nbsp;
}&nbsp;&nbsp;
a(b);</pre><p><span style="font-family: Helvetica, Tahoma, Arial, sans-serif; font-size: 12px; line-height: 18px; background-color: rgb(255, 255, 255);"></span><br/></p>', '2014-05-21', 'js回调函数传参数，简单代码蕴藏大智慧', '138', null, null, '1', 'js', 'js回调函数传参数', '0', '30', '0', null, null, null);
INSERT INTO "public"."cms_article" VALUES ('42', 'black', '<p><span style="color: rgb(17, 17, 17); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 13px; line-height: 23.399999618530273px; background-color: rgb(255, 255, 255);">进入vi的命令&nbsp;</span><br style="margin: 0px; padding: 0px; color: rgb(17, 17, 17); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 13px; line-height: 23.399999618530273px; white-space: normal; background-color: rgb(255, 255, 255);"/><span style="color: rgb(17, 17, 17); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 13px; line-height: 23.399999618530273px; background-color: rgb(255, 255, 255);">vi filename :打开或新建文件，并将光标置于第一行首&nbsp;</span><br style="margin: 0px; padding: 0px; color: rgb(17, 17, 17); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 13px; line-height: 23.399999618530273px; white-space: normal; background-color: rgb(255, 255, 255);"/><span style="color: rgb(17, 17, 17); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 13px; line-height: 23.399999618530273px; background-color: rgb(255, 255, 255);">vi +n filename ：打开文件，并将光标置于第n行首&nbsp;</span><br style="margin: 0px; padding: 0px; color: rgb(17, 17, 17); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 13px; line-height: 23.399999618530273px; white-space: normal; background-color: rgb(255, 255, 255);"/><span style="color: rgb(17, 17, 17); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 13px; line-height: 23.399999618530273px; background-color: rgb(255, 255, 255);">vi + filename ：打开文件，并将光标置于最后一行首&nbsp;</span><br style="margin: 0px; padding: 0px; color: rgb(17, 17, 17); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 13px; line-height: 23.399999618530273px; white-space: normal; background-color: rgb(255, 255, 255);"/><span style="color: rgb(17, 17, 17); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 13px; line-height: 23.399999618530273px; background-color: rgb(255, 255, 255);">vi +/pattern filename：打开文件，并将光标置于第一个与pattern匹配的串处&nbsp;</span><br style="margin: 0px; padding: 0px; color: rgb(17, 17, 17); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 13px; line-height: 23.399999618530273px; white-space: normal; background-color: rgb(255, 255, 255);"/><span style="color: rgb(17, 17, 17); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 13px; line-height: 23.399999618530273px; background-color: rgb(255, 255, 255);">vi -r filename ：在上次正用vi编辑时发生系统崩溃，恢复filename&nbsp;</span><br style="margin: 0px; padding: 0px; color: rgb(17, 17, 17); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 13px; line-height: 23.399999618530273px; white-space: normal; background-color: rgb(255, 255, 255);"/><span style="color: rgb(17, 17, 17); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 13px; line-height: 23.399999618530273px; background-color: rgb(255, 255, 255);">vi filename....filename ：打开多个文件，依次进行编辑&nbsp;</span></p><p><span style="color: rgb(17, 17, 17); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 13px; line-height: 23.399999618530273px; background-color: rgb(255, 255, 255);">移动光标类命令</span><br style="margin: 0px; padding: 0px; color: rgb(17, 17, 17); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 13px; line-height: 23.399999618530273px; white-space: normal; background-color: rgb(255, 255, 255);"/><span style="color: rgb(17, 17, 17); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 13px; line-height: 23.399999618530273px; background-color: rgb(255, 255, 255);">h ：光标左移一个字符&nbsp;</span><br style="margin: 0px; padding: 0px; color: rgb(17, 17, 17); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 13px; line-height: 23.399999618530273px; white-space: normal; background-color: rgb(255, 255, 255);"/><span style="color: rgb(17, 17, 17); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 13px; line-height: 23.399999618530273px; background-color: rgb(255, 255, 255);">l ：光标右移一个字符&nbsp;</span><br style="margin: 0px; padding: 0px; color: rgb(17, 17, 17); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 13px; line-height: 23.399999618530273px; white-space: normal; background-color: rgb(255, 255, 255);"/><span style="color: rgb(17, 17, 17); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 13px; line-height: 23.399999618530273px; background-color: rgb(255, 255, 255);">space：光标右移一个字符&nbsp;</span><br style="margin: 0px; padding: 0px; color: rgb(17, 17, 17); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 13px; line-height: 23.399999618530273px; white-space: normal; background-color: rgb(255, 255, 255);"/><span style="color: rgb(17, 17, 17); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 13px; line-height: 23.399999618530273px; background-color: rgb(255, 255, 255);">Backspace：光标左移一个字符&nbsp;</span><br style="margin: 0px; padding: 0px; color: rgb(17, 17, 17); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 13px; line-height: 23.399999618530273px; white-space: normal; background-color: rgb(255, 255, 255);"/><span style="color: rgb(17, 17, 17); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 13px; line-height: 23.399999618530273px; background-color: rgb(255, 255, 255);">k或Ctrl+p：光标上移一行&nbsp;</span><br style="margin: 0px; padding: 0px; color: rgb(17, 17, 17); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 13px; line-height: 23.399999618530273px; white-space: normal; background-color: rgb(255, 255, 255);"/><span style="color: rgb(17, 17, 17); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 13px; line-height: 23.399999618530273px; background-color: rgb(255, 255, 255);">j或Ctrl+n ：光标下移一行&nbsp;</span><br style="margin: 0px; padding: 0px; color: rgb(17, 17, 17); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 13px; line-height: 23.399999618530273px; white-space: normal; background-color: rgb(255, 255, 255);"/><span style="color: rgb(17, 17, 17); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 13px; line-height: 23.399999618530273px; background-color: rgb(255, 255, 255);">Enter ：光标下移一行&nbsp;</span><br style="margin: 0px; padding: 0px; color: rgb(17, 17, 17); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 13px; line-height: 23.399999618530273px; white-space: normal; background-color: rgb(255, 255, 255);"/><span style="color: rgb(17, 17, 17); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 13px; line-height: 23.399999618530273px; background-color: rgb(255, 255, 255);">w或W ：光标右移一个字至字首&nbsp;</span><br style="margin: 0px; padding: 0px; color: rgb(17, 17, 17); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 13px; line-height: 23.399999618530273px; white-space: normal; background-color: rgb(255, 255, 255);"/><span style="color: rgb(17, 17, 17); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 13px; line-height: 23.399999618530273px; background-color: rgb(255, 255, 255);">b或B ：光标左移一个字至字首&nbsp;</span><br style="margin: 0px; padding: 0px; color: rgb(17, 17, 17); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 13px; line-height: 23.399999618530273px; white-space: normal; background-color: rgb(255, 255, 255);"/><span style="color: rgb(17, 17, 17); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 13px; line-height: 23.399999618530273px; background-color: rgb(255, 255, 255);">e或E ：光标右移一个字至字尾&nbsp;</span><br style="margin: 0px; padding: 0px; color: rgb(17, 17, 17); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 13px; line-height: 23.399999618530273px; white-space: normal; background-color: rgb(255, 255, 255);"/><span style="color: rgb(17, 17, 17); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 13px; line-height: 23.399999618530273px; background-color: rgb(255, 255, 255);">) ：光标移至句尾&nbsp;</span><br style="margin: 0px; padding: 0px; color: rgb(17, 17, 17); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 13px; line-height: 23.399999618530273px; white-space: normal; background-color: rgb(255, 255, 255);"/><span style="color: rgb(17, 17, 17); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 13px; line-height: 23.399999618530273px; background-color: rgb(255, 255, 255);">( ：光标移至句首&nbsp;</span><br style="margin: 0px; padding: 0px; color: rgb(17, 17, 17); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 13px; line-height: 23.399999618530273px; white-space: normal; background-color: rgb(255, 255, 255);"/><span style="color: rgb(17, 17, 17); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 13px; line-height: 23.399999618530273px; background-color: rgb(255, 255, 255);">}：光标移至段落开头&nbsp;</span><br style="margin: 0px; padding: 0px; color: rgb(17, 17, 17); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 13px; line-height: 23.399999618530273px; white-space: normal; background-color: rgb(255, 255, 255);"/><span style="color: rgb(17, 17, 17); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 13px; line-height: 23.399999618530273px; background-color: rgb(255, 255, 255);">{：光标移至段落结尾&nbsp;</span><br style="margin: 0px; padding: 0px; color: rgb(17, 17, 17); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 13px; line-height: 23.399999618530273px; white-space: normal; background-color: rgb(255, 255, 255);"/><span style="color: rgb(17, 17, 17); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 13px; line-height: 23.399999618530273px; background-color: rgb(255, 255, 255);">nG：光标移至第n行首&nbsp;</span><br style="margin: 0px; padding: 0px; color: rgb(17, 17, 17); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 13px; line-height: 23.399999618530273px; white-space: normal; background-color: rgb(255, 255, 255);"/><span style="color: rgb(17, 17, 17); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 13px; line-height: 23.399999618530273px; background-color: rgb(255, 255, 255);">n+：光标下移n行&nbsp;</span><br style="margin: 0px; padding: 0px; color: rgb(17, 17, 17); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 13px; line-height: 23.399999618530273px; white-space: normal; background-color: rgb(255, 255, 255);"/><span style="color: rgb(17, 17, 17); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 13px; line-height: 23.399999618530273px; background-color: rgb(255, 255, 255);">n-：光标上移n行&nbsp;</span><br style="margin: 0px; padding: 0px; color: rgb(17, 17, 17); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 13px; line-height: 23.399999618530273px; white-space: normal; background-color: rgb(255, 255, 255);"/><span style="color: rgb(17, 17, 17); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 13px; line-height: 23.399999618530273px; background-color: rgb(255, 255, 255);">n$：光标移至第n行尾&nbsp;</span><br style="margin: 0px; padding: 0px; color: rgb(17, 17, 17); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 13px; line-height: 23.399999618530273px; white-space: normal; background-color: rgb(255, 255, 255);"/><span style="color: rgb(17, 17, 17); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 13px; line-height: 23.399999618530273px; background-color: rgb(255, 255, 255);">H ：光标移至屏幕顶行&nbsp;</span><br style="margin: 0px; padding: 0px; color: rgb(17, 17, 17); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 13px; line-height: 23.399999618530273px; white-space: normal; background-color: rgb(255, 255, 255);"/><span style="color: rgb(17, 17, 17); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 13px; line-height: 23.399999618530273px; background-color: rgb(255, 255, 255);">M ：光标移至屏幕中间行&nbsp;</span><br style="margin: 0px; padding: 0px; color: rgb(17, 17, 17); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 13px; line-height: 23.399999618530273px; white-space: normal; background-color: rgb(255, 255, 255);"/><span style="color: rgb(17, 17, 17); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 13px; line-height: 23.399999618530273px; background-color: rgb(255, 255, 255);">L ：光标移至屏幕最后行&nbsp;</span><br style="margin: 0px; padding: 0px; color: rgb(17, 17, 17); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 13px; line-height: 23.399999618530273px; white-space: normal; background-color: rgb(255, 255, 255);"/><span style="color: rgb(17, 17, 17); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 13px; line-height: 23.399999618530273px; background-color: rgb(255, 255, 255);">0：（注意是数字零）光标移至当前行首&nbsp;</span><br style="margin: 0px; padding: 0px; color: rgb(17, 17, 17); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 13px; line-height: 23.399999618530273px; white-space: normal; background-color: rgb(255, 255, 255);"/><span style="color: rgb(17, 17, 17); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 13px; line-height: 23.399999618530273px; background-color: rgb(255, 255, 255);">$：光标移至当前行尾&nbsp;</span><br style="margin: 0px; padding: 0px; color: rgb(17, 17, 17); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 13px; line-height: 23.399999618530273px; white-space: normal; background-color: rgb(255, 255, 255);"/><br style="margin: 0px; padding: 0px; color: rgb(17, 17, 17); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 13px; line-height: 23.399999618530273px; white-space: normal; background-color: rgb(255, 255, 255);"/><span style="color: rgb(17, 17, 17); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 13px; line-height: 23.399999618530273px; background-color: rgb(255, 255, 255);">屏幕翻滚类命令&nbsp;</span><br style="margin: 0px; padding: 0px; color: rgb(17, 17, 17); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 13px; line-height: 23.399999618530273px; white-space: normal; background-color: rgb(255, 255, 255);"/><span style="color: rgb(17, 17, 17); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 13px; line-height: 23.399999618530273px; background-color: rgb(255, 255, 255);">Ctrl+u：向文件首翻半屏&nbsp;</span><br style="margin: 0px; padding: 0px; color: rgb(17, 17, 17); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 13px; line-height: 23.399999618530273px; white-space: normal; background-color: rgb(255, 255, 255);"/><span style="color: rgb(17, 17, 17); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 13px; line-height: 23.399999618530273px; background-color: rgb(255, 255, 255);">Ctrl+d：向文件尾翻半屏&nbsp;</span><br style="margin: 0px; padding: 0px; color: rgb(17, 17, 17); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 13px; line-height: 23.399999618530273px; white-space: normal; background-color: rgb(255, 255, 255);"/><span style="color: rgb(17, 17, 17); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 13px; line-height: 23.399999618530273px; background-color: rgb(255, 255, 255);">Ctrl+f：向文件尾翻一屏&nbsp;</span><br style="margin: 0px; padding: 0px; color: rgb(17, 17, 17); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 13px; line-height: 23.399999618530273px; white-space: normal; background-color: rgb(255, 255, 255);"/><span style="color: rgb(17, 17, 17); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 13px; line-height: 23.399999618530273px; background-color: rgb(255, 255, 255);">Ctrl＋b；向文件首翻一屏&nbsp;</span><br style="margin: 0px; padding: 0px; color: rgb(17, 17, 17); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 13px; line-height: 23.399999618530273px; white-space: normal; background-color: rgb(255, 255, 255);"/><span style="color: rgb(17, 17, 17); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 13px; line-height: 23.399999618530273px; background-color: rgb(255, 255, 255);">nz：将第n行滚至屏幕顶部，不指定n时将当前行滚至屏幕顶部。&nbsp;</span><br style="margin: 0px; padding: 0px; color: rgb(17, 17, 17); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 13px; line-height: 23.399999618530273px; white-space: normal; background-color: rgb(255, 255, 255);"/><br style="margin: 0px; padding: 0px; color: rgb(17, 17, 17); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 13px; line-height: 23.399999618530273px; white-space: normal; background-color: rgb(255, 255, 255);"/><span style="color: rgb(17, 17, 17); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 13px; line-height: 23.399999618530273px; background-color: rgb(255, 255, 255);">插入文本类命令&nbsp;</span><br style="margin: 0px; padding: 0px; color: rgb(17, 17, 17); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 13px; line-height: 23.399999618530273px; white-space: normal; background-color: rgb(255, 255, 255);"/><span style="color: rgb(17, 17, 17); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 13px; line-height: 23.399999618530273px; background-color: rgb(255, 255, 255);">i ：在光标前&nbsp;</span><br style="margin: 0px; padding: 0px; color: rgb(17, 17, 17); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 13px; line-height: 23.399999618530273px; white-space: normal; background-color: rgb(255, 255, 255);"/><span style="color: rgb(17, 17, 17); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 13px; line-height: 23.399999618530273px; background-color: rgb(255, 255, 255);">I ：在当前行首&nbsp;</span><br style="margin: 0px; padding: 0px; color: rgb(17, 17, 17); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 13px; line-height: 23.399999618530273px; white-space: normal; background-color: rgb(255, 255, 255);"/><span style="color: rgb(17, 17, 17); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 13px; line-height: 23.399999618530273px; background-color: rgb(255, 255, 255);">a：光标后&nbsp;</span><br style="margin: 0px; padding: 0px; color: rgb(17, 17, 17); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 13px; line-height: 23.399999618530273px; white-space: normal; background-color: rgb(255, 255, 255);"/><span style="color: rgb(17, 17, 17); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 13px; line-height: 23.399999618530273px; background-color: rgb(255, 255, 255);">A：在当前行尾&nbsp;</span><br style="margin: 0px; padding: 0px; color: rgb(17, 17, 17); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 13px; line-height: 23.399999618530273px; white-space: normal; background-color: rgb(255, 255, 255);"/><span style="color: rgb(17, 17, 17); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 13px; line-height: 23.399999618530273px; background-color: rgb(255, 255, 255);">o：在当前行之下新开一行&nbsp;</span><br style="margin: 0px; padding: 0px; color: rgb(17, 17, 17); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 13px; line-height: 23.399999618530273px; white-space: normal; background-color: rgb(255, 255, 255);"/><span style="color: rgb(17, 17, 17); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 13px; line-height: 23.399999618530273px; background-color: rgb(255, 255, 255);">O：在当前行之上新开一行&nbsp;</span><br style="margin: 0px; padding: 0px; color: rgb(17, 17, 17); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 13px; line-height: 23.399999618530273px; white-space: normal; background-color: rgb(255, 255, 255);"/><span style="color: rgb(17, 17, 17); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 13px; line-height: 23.399999618530273px; background-color: rgb(255, 255, 255);">r：替换当前字符&nbsp;</span><br style="margin: 0px; padding: 0px; color: rgb(17, 17, 17); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 13px; line-height: 23.399999618530273px; white-space: normal; background-color: rgb(255, 255, 255);"/><span style="color: rgb(17, 17, 17); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 13px; line-height: 23.399999618530273px; background-color: rgb(255, 255, 255);">R：替换当前字符及其后的字符，直至按ESC键&nbsp;</span><br style="margin: 0px; padding: 0px; color: rgb(17, 17, 17); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 13px; line-height: 23.399999618530273px; white-space: normal; background-color: rgb(255, 255, 255);"/><span style="color: rgb(17, 17, 17); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 13px; line-height: 23.399999618530273px; background-color: rgb(255, 255, 255);">s：从当前光标位置处开始，以输入的文本替代指定数目的字符&nbsp;</span><br style="margin: 0px; padding: 0px; color: rgb(17, 17, 17); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 13px; line-height: 23.399999618530273px; white-space: normal; background-color: rgb(255, 255, 255);"/><span style="color: rgb(17, 17, 17); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 13px; line-height: 23.399999618530273px; background-color: rgb(255, 255, 255);">S：删除指定数目的行，并以所输入文本代替之&nbsp;</span><br style="margin: 0px; padding: 0px; color: rgb(17, 17, 17); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 13px; line-height: 23.399999618530273px; white-space: normal; background-color: rgb(255, 255, 255);"/><span style="color: rgb(17, 17, 17); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 13px; line-height: 23.399999618530273px; background-color: rgb(255, 255, 255);">ncw或nCW：修改指定数目的字&nbsp;</span><br style="margin: 0px; padding: 0px; color: rgb(17, 17, 17); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 13px; line-height: 23.399999618530273px; white-space: normal; background-color: rgb(255, 255, 255);"/><span style="color: rgb(17, 17, 17); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 13px; line-height: 23.399999618530273px; background-color: rgb(255, 255, 255);">nCC：修改指定数目的行&nbsp;</span><br style="margin: 0px; padding: 0px; color: rgb(17, 17, 17); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 13px; line-height: 23.399999618530273px; white-space: normal; background-color: rgb(255, 255, 255);"/><br style="margin: 0px; padding: 0px; color: rgb(17, 17, 17); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 13px; line-height: 23.399999618530273px; white-space: normal; background-color: rgb(255, 255, 255);"/><span style="color: rgb(17, 17, 17); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 13px; line-height: 23.399999618530273px; background-color: rgb(255, 255, 255);">删除命令&nbsp;</span><br style="margin: 0px; padding: 0px; color: rgb(17, 17, 17); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 13px; line-height: 23.399999618530273px; white-space: normal; background-color: rgb(255, 255, 255);"/><span style="color: rgb(17, 17, 17); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 13px; line-height: 23.399999618530273px; background-color: rgb(255, 255, 255);">ndw或ndW：删除光标处开始及其后的n-1个字&nbsp;</span><br style="margin: 0px; padding: 0px; color: rgb(17, 17, 17); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 13px; line-height: 23.399999618530273px; white-space: normal; background-color: rgb(255, 255, 255);"/><span style="color: rgb(17, 17, 17); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 13px; line-height: 23.399999618530273px; background-color: rgb(255, 255, 255);">do：删至行首&nbsp;</span><br style="margin: 0px; padding: 0px; color: rgb(17, 17, 17); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 13px; line-height: 23.399999618530273px; white-space: normal; background-color: rgb(255, 255, 255);"/><span style="color: rgb(17, 17, 17); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 13px; line-height: 23.399999618530273px; background-color: rgb(255, 255, 255);">d$：删至行尾&nbsp;</span><br style="margin: 0px; padding: 0px; color: rgb(17, 17, 17); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 13px; line-height: 23.399999618530273px; white-space: normal; background-color: rgb(255, 255, 255);"/><span style="color: rgb(17, 17, 17); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 13px; line-height: 23.399999618530273px; background-color: rgb(255, 255, 255);">ndd：删除当前行及其后n-1行&nbsp;</span><br style="margin: 0px; padding: 0px; color: rgb(17, 17, 17); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 13px; line-height: 23.399999618530273px; white-space: normal; background-color: rgb(255, 255, 255);"/><span style="color: rgb(17, 17, 17); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 13px; line-height: 23.399999618530273px; background-color: rgb(255, 255, 255);">x或X：删除一个字符，x删除光标后的，而X删除光标前的&nbsp;</span><br style="margin: 0px; padding: 0px; color: rgb(17, 17, 17); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 13px; line-height: 23.399999618530273px; white-space: normal; background-color: rgb(255, 255, 255);"/><span style="color: rgb(17, 17, 17); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 13px; line-height: 23.399999618530273px; background-color: rgb(255, 255, 255);">Ctrl+u：删除输入方式下所输入的文本&nbsp;</span><br style="margin: 0px; padding: 0px; color: rgb(17, 17, 17); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 13px; line-height: 23.399999618530273px; white-space: normal; background-color: rgb(255, 255, 255);"/><br style="margin: 0px; padding: 0px; color: rgb(17, 17, 17); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 13px; line-height: 23.399999618530273px; white-space: normal; background-color: rgb(255, 255, 255);"/><span style="color: rgb(17, 17, 17); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 13px; line-height: 23.399999618530273px; background-color: rgb(255, 255, 255);">搜索及替换命令&nbsp;</span><br style="margin: 0px; padding: 0px; color: rgb(17, 17, 17); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 13px; line-height: 23.399999618530273px; white-space: normal; background-color: rgb(255, 255, 255);"/><span style="color: rgb(17, 17, 17); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 13px; line-height: 23.399999618530273px; background-color: rgb(255, 255, 255);">/pattern：从光标开始处向文件尾搜索pattern&nbsp;</span><br style="margin: 0px; padding: 0px; color: rgb(17, 17, 17); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 13px; line-height: 23.399999618530273px; white-space: normal; background-color: rgb(255, 255, 255);"/><span style="color: rgb(17, 17, 17); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 13px; line-height: 23.399999618530273px; background-color: rgb(255, 255, 255);">?pattern：从光标开始处向文件首搜索pattern&nbsp;</span><br style="margin: 0px; padding: 0px; color: rgb(17, 17, 17); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 13px; line-height: 23.399999618530273px; white-space: normal; background-color: rgb(255, 255, 255);"/><span style="color: rgb(17, 17, 17); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 13px; line-height: 23.399999618530273px; background-color: rgb(255, 255, 255);">n：在同一方向重复上一次搜索命令&nbsp;</span><br style="margin: 0px; padding: 0px; color: rgb(17, 17, 17); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 13px; line-height: 23.399999618530273px; white-space: normal; background-color: rgb(255, 255, 255);"/><span style="color: rgb(17, 17, 17); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 13px; line-height: 23.399999618530273px; background-color: rgb(255, 255, 255);">N：在反方向上重复上一次搜索命令&nbsp;</span><br style="margin: 0px; padding: 0px; color: rgb(17, 17, 17); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 13px; line-height: 23.399999618530273px; white-space: normal; background-color: rgb(255, 255, 255);"/><span style="color: rgb(17, 17, 17); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 13px; line-height: 23.399999618530273px; background-color: rgb(255, 255, 255);">：s/p1/p2/g：将当前行中所有p1均用p2替代&nbsp;</span><br style="margin: 0px; padding: 0px; color: rgb(17, 17, 17); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 13px; line-height: 23.399999618530273px; white-space: normal; background-color: rgb(255, 255, 255);"/><span style="color: rgb(17, 17, 17); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 13px; line-height: 23.399999618530273px; background-color: rgb(255, 255, 255);">：n1,n2s/p1/p2/g：将第n1至n2行中所有p1均用p2替代&nbsp;</span><br style="margin: 0px; padding: 0px; color: rgb(17, 17, 17); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 13px; line-height: 23.399999618530273px; white-space: normal; background-color: rgb(255, 255, 255);"/><span style="color: rgb(17, 17, 17); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 13px; line-height: 23.399999618530273px; background-color: rgb(255, 255, 255);">：g/p1/s//p2/g：将文件中所有p1均用p2替换&nbsp;</span><br style="margin: 0px; padding: 0px; color: rgb(17, 17, 17); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 13px; line-height: 23.399999618530273px; white-space: normal; background-color: rgb(255, 255, 255);"/><br style="margin: 0px; padding: 0px; color: rgb(17, 17, 17); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 13px; line-height: 23.399999618530273px; white-space: normal; background-color: rgb(255, 255, 255);"/><span style="color: rgb(17, 17, 17); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 13px; line-height: 23.399999618530273px; background-color: rgb(255, 255, 255);">选项设置&nbsp;</span><br style="margin: 0px; padding: 0px; color: rgb(17, 17, 17); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 13px; line-height: 23.399999618530273px; white-space: normal; background-color: rgb(255, 255, 255);"/><span style="color: rgb(17, 17, 17); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 13px; line-height: 23.399999618530273px; background-color: rgb(255, 255, 255);">all：列出所有选项设置情况&nbsp;</span><br style="margin: 0px; padding: 0px; color: rgb(17, 17, 17); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 13px; line-height: 23.399999618530273px; white-space: normal; background-color: rgb(255, 255, 255);"/><span style="color: rgb(17, 17, 17); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 13px; line-height: 23.399999618530273px; background-color: rgb(255, 255, 255);">term：设置终端类型&nbsp;</span><br style="margin: 0px; padding: 0px; color: rgb(17, 17, 17); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 13px; line-height: 23.399999618530273px; white-space: normal; background-color: rgb(255, 255, 255);"/><span style="color: rgb(17, 17, 17); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 13px; line-height: 23.399999618530273px; background-color: rgb(255, 255, 255);">ignorance：在搜索中忽略大小写&nbsp;</span><br style="margin: 0px; padding: 0px; color: rgb(17, 17, 17); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 13px; line-height: 23.399999618530273px; white-space: normal; background-color: rgb(255, 255, 255);"/><span style="color: rgb(17, 17, 17); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 13px; line-height: 23.399999618530273px; background-color: rgb(255, 255, 255);">list：显示制表位(Ctrl+I)和行尾标志（$)&nbsp;</span><br style="margin: 0px; padding: 0px; color: rgb(17, 17, 17); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 13px; line-height: 23.399999618530273px; white-space: normal; background-color: rgb(255, 255, 255);"/><span style="color: rgb(17, 17, 17); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 13px; line-height: 23.399999618530273px; background-color: rgb(255, 255, 255);">number：显示行号&nbsp;</span><br style="margin: 0px; padding: 0px; color: rgb(17, 17, 17); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 13px; line-height: 23.399999618530273px; white-space: normal; background-color: rgb(255, 255, 255);"/><span style="color: rgb(17, 17, 17); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 13px; line-height: 23.399999618530273px; background-color: rgb(255, 255, 255);">report：显示由面向行的命令修改过的数目&nbsp;</span><br style="margin: 0px; padding: 0px; color: rgb(17, 17, 17); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 13px; line-height: 23.399999618530273px; white-space: normal; background-color: rgb(255, 255, 255);"/><span style="color: rgb(17, 17, 17); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 13px; line-height: 23.399999618530273px; background-color: rgb(255, 255, 255);">terse：显示简短的警告信息&nbsp;</span><br style="margin: 0px; padding: 0px; color: rgb(17, 17, 17); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 13px; line-height: 23.399999618530273px; white-space: normal; background-color: rgb(255, 255, 255);"/><span style="color: rgb(17, 17, 17); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 13px; line-height: 23.399999618530273px; background-color: rgb(255, 255, 255);">warn：在转到别的文件时若没保存当前文件则显示NO write信息&nbsp;</span><br style="margin: 0px; padding: 0px; color: rgb(17, 17, 17); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 13px; line-height: 23.399999618530273px; white-space: normal; background-color: rgb(255, 255, 255);"/><span style="color: rgb(17, 17, 17); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 13px; line-height: 23.399999618530273px; background-color: rgb(255, 255, 255);">nomagic：允许在搜索模式中，使用前面不带“\”的特殊字符&nbsp;</span><br style="margin: 0px; padding: 0px; color: rgb(17, 17, 17); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 13px; line-height: 23.399999618530273px; white-space: normal; background-color: rgb(255, 255, 255);"/><span style="color: rgb(17, 17, 17); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 13px; line-height: 23.399999618530273px; background-color: rgb(255, 255, 255);">nowrapscan：禁止vi在搜索到达文件两端时，又从另一端开始&nbsp;</span><br style="margin: 0px; padding: 0px; color: rgb(17, 17, 17); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 13px; line-height: 23.399999618530273px; white-space: normal; background-color: rgb(255, 255, 255);"/><span style="color: rgb(17, 17, 17); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 13px; line-height: 23.399999618530273px; background-color: rgb(255, 255, 255);">mesg：允许vi显示其他用户用write写到自己终端上的信息&nbsp;</span><br style="margin: 0px; padding: 0px; color: rgb(17, 17, 17); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 13px; line-height: 23.399999618530273px; white-space: normal; background-color: rgb(255, 255, 255);"/><br style="margin: 0px; padding: 0px; color: rgb(17, 17, 17); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 13px; line-height: 23.399999618530273px; white-space: normal; background-color: rgb(255, 255, 255);"/><span style="color: rgb(17, 17, 17); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 13px; line-height: 23.399999618530273px; background-color: rgb(255, 255, 255);">最后行方式命令&nbsp;</span><br style="margin: 0px; padding: 0px; color: rgb(17, 17, 17); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 13px; line-height: 23.399999618530273px; white-space: normal; background-color: rgb(255, 255, 255);"/><span style="color: rgb(17, 17, 17); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 13px; line-height: 23.399999618530273px; background-color: rgb(255, 255, 255);">：n1,n2 co n3：将n1行到n2行之间的内容拷贝到第n3行下&nbsp;</span><br style="margin: 0px; padding: 0px; color: rgb(17, 17, 17); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 13px; line-height: 23.399999618530273px; white-space: normal; background-color: rgb(255, 255, 255);"/><span style="color: rgb(17, 17, 17); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 13px; line-height: 23.399999618530273px; background-color: rgb(255, 255, 255);">：n1,n2 m n3：将n1行到n2行之间的内容移至到第n3行下&nbsp;</span><br style="margin: 0px; padding: 0px; color: rgb(17, 17, 17); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 13px; line-height: 23.399999618530273px; white-space: normal; background-color: rgb(255, 255, 255);"/><span style="color: rgb(17, 17, 17); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 13px; line-height: 23.399999618530273px; background-color: rgb(255, 255, 255);">：n1,n2 d ：将n1行到n2行之间的内容删除&nbsp;</span><br style="margin: 0px; padding: 0px; color: rgb(17, 17, 17); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 13px; line-height: 23.399999618530273px; white-space: normal; background-color: rgb(255, 255, 255);"/><span style="color: rgb(17, 17, 17); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 13px; line-height: 23.399999618530273px; background-color: rgb(255, 255, 255);">：w ：保存当前文件&nbsp;</span><br style="margin: 0px; padding: 0px; color: rgb(17, 17, 17); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 13px; line-height: 23.399999618530273px; white-space: normal; background-color: rgb(255, 255, 255);"/><span style="color: rgb(17, 17, 17); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 13px; line-height: 23.399999618530273px; background-color: rgb(255, 255, 255);">：e filename：打开文件filename进行编辑&nbsp;</span><br style="margin: 0px; padding: 0px; color: rgb(17, 17, 17); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 13px; line-height: 23.399999618530273px; white-space: normal; background-color: rgb(255, 255, 255);"/><span style="color: rgb(17, 17, 17); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 13px; line-height: 23.399999618530273px; background-color: rgb(255, 255, 255);">：x：保存当前文件并退出&nbsp;</span><br style="margin: 0px; padding: 0px; color: rgb(17, 17, 17); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 13px; line-height: 23.399999618530273px; white-space: normal; background-color: rgb(255, 255, 255);"/><span style="color: rgb(17, 17, 17); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 13px; line-height: 23.399999618530273px; background-color: rgb(255, 255, 255);">：q：退出vi&nbsp;</span><br style="margin: 0px; padding: 0px; color: rgb(17, 17, 17); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 13px; line-height: 23.399999618530273px; white-space: normal; background-color: rgb(255, 255, 255);"/><span style="color: rgb(17, 17, 17); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 13px; line-height: 23.399999618530273px; background-color: rgb(255, 255, 255);">：q!：不保存文件并退出vi&nbsp;</span><br style="margin: 0px; padding: 0px; color: rgb(17, 17, 17); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 13px; line-height: 23.399999618530273px; white-space: normal; background-color: rgb(255, 255, 255);"/><span style="color: rgb(17, 17, 17); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 13px; line-height: 23.399999618530273px; background-color: rgb(255, 255, 255);">：!command：执行shell命令command&nbsp;</span><br style="margin: 0px; padding: 0px; color: rgb(17, 17, 17); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 13px; line-height: 23.399999618530273px; white-space: normal; background-color: rgb(255, 255, 255);"/><span style="color: rgb(17, 17, 17); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 13px; line-height: 23.399999618530273px; background-color: rgb(255, 255, 255);">：n1,n2 w!command：将文件中n1行至n2行的内容作为command的输入并执行之，若不指定n1，n2，则表示将整个文件内容作为command的输入&nbsp;</span><br style="margin: 0px; padding: 0px; color: rgb(17, 17, 17); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 13px; line-height: 23.399999618530273px; white-space: normal; background-color: rgb(255, 255, 255);"/><span style="color: rgb(17, 17, 17); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 13px; line-height: 23.399999618530273px; background-color: rgb(255, 255, 255);">：r!command：将命令command的输出结果放到当前行&nbsp;</span><br style="margin: 0px; padding: 0px; color: rgb(17, 17, 17); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 13px; line-height: 23.399999618530273px; white-space: normal; background-color: rgb(255, 255, 255);"/><br style="margin: 0px; padding: 0px; color: rgb(17, 17, 17); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 13px; line-height: 23.399999618530273px; white-space: normal; background-color: rgb(255, 255, 255);"/><span style="color: rgb(17, 17, 17); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 13px; line-height: 23.399999618530273px; background-color: rgb(255, 255, 255);">寄存器操作&nbsp;</span><br style="margin: 0px; padding: 0px; color: rgb(17, 17, 17); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 13px; line-height: 23.399999618530273px; white-space: normal; background-color: rgb(255, 255, 255);"/><span style="color: rgb(17, 17, 17); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 13px; line-height: 23.399999618530273px; background-color: rgb(255, 255, 255);">&quot;?nyy：将当前行及其下n行的内容保存到寄存器？中，其中?为一个字母，n为一个数字&nbsp;</span><br style="margin: 0px; padding: 0px; color: rgb(17, 17, 17); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 13px; line-height: 23.399999618530273px; white-space: normal; background-color: rgb(255, 255, 255);"/><span style="color: rgb(17, 17, 17); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 13px; line-height: 23.399999618530273px; background-color: rgb(255, 255, 255);">&quot;?nyw：将当前行及其下n个字保存到寄存器？中，其中?为一个字母，n为一个数字&nbsp;</span><br style="margin: 0px; padding: 0px; color: rgb(17, 17, 17); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 13px; line-height: 23.399999618530273px; white-space: normal; background-color: rgb(255, 255, 255);"/><span style="color: rgb(17, 17, 17); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 13px; line-height: 23.399999618530273px; background-color: rgb(255, 255, 255);">&quot;?nyl：将当前行及其下n个字符保存到寄存器？中，其中?为一个字母，n为一个数字&nbsp;</span><br style="margin: 0px; padding: 0px; color: rgb(17, 17, 17); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 13px; line-height: 23.399999618530273px; white-space: normal; background-color: rgb(255, 255, 255);"/><span style="color: rgb(17, 17, 17); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 13px; line-height: 23.399999618530273px; background-color: rgb(255, 255, 255);">&quot;?p：取出寄存器？中的内容并将其放到光标位置处。这里？可以是一个字母，也可以是一个数字&nbsp;</span><br style="margin: 0px; padding: 0px; color: rgb(17, 17, 17); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 13px; line-height: 23.399999618530273px; white-space: normal; background-color: rgb(255, 255, 255);"/><span style="color: rgb(17, 17, 17); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 13px; line-height: 23.399999618530273px; background-color: rgb(255, 255, 255);">ndd：将当前行及其下共n行文本删除，并将所删内容放到1号删除寄存器中。</span></p><p><font color="#111111" face="Verdana, Arial, Helvetica, sans-serif" size="2"><span style="line-height: 23.399999618530273px; background-color: rgb(255, 255, 255);">转自：<a href="http://www.cnblogs.com/88999660/articles/1581524.html" target="_blank">http://www.cnblogs.com/88999660/articles/1581524.html</a></span></font></p>', '2014-05-24', 'vi操作相关命令', '122', null, null, '1', 'vi', 'vi操作', '0', '32', '0', null, null, null);
INSERT INTO "public"."cms_article" VALUES ('45', 'black', '<ol class=" list-paddingleft-2" style="list-style-type: decimal;"><li><p><span style="color: rgb(51, 51, 51); font-size: 14px; line-height: 26px; font-family: &#39;Courier New&#39;; background-color: rgb(255, 255, 255);">机制：spring mvc的入口是servlet，而struts2是filter（这里要指出，filter和servlet是不同的。以前认为filter是servlet的一种特殊），这样就导致了二者的机制不同，</span><span style="color: rgb(51, 51, 51); font-size: 14px; line-height: 26px; font-family: &#39;Courier New&#39;; background-color: rgb(255, 255, 255);">这里就牵涉到servlet和filter的区别了。</span></p></li><li><p><span style="color: rgb(51, 51, 51); font-size: 14px; line-height: 26px; font-family: &#39;Courier New&#39;; background-color: rgb(255, 255, 255);"><span style="color: rgb(51, 51, 51); font-size: 14px; line-height: 26px; font-family: &#39;Courier New&#39;; background-color: rgb(255, 255, 255);">性能：spring会稍微比struts快。</span><span style="font-size: 14px; line-height: 26px; color: rgb(255, 0, 0); font-family: &#39;Courier New&#39;; background-color: rgb(255, 255, 255);">spring mvc是基于方法的设计</span><span style="color: rgb(51, 51, 51); font-size: 14px; line-height: 26px; font-family: &#39;Courier New&#39;; background-color: rgb(255, 255, 255);">，</span><span style="font-size: 14px; line-height: 26px; color: rgb(255, 0, 0); font-family: &#39;Courier New&#39;; background-color: rgb(255, 255, 255);">而sturts是基于类</span><span style="color: rgb(51, 51, 51); font-size: 14px; line-height: 26px; font-family: &#39;Courier New&#39;; background-color: rgb(255, 255, 255);">，每次发一次请求都会实例一个action，每个action都会被注入属性，而spring基于方法，粒度更细，但要小心把握像在servlet控制数据一样。</span><span style="color: rgb(51, 51, 51); font-size: 14px; line-height: 26px; font-family: &#39;Courier New&#39;; background-color: rgb(255, 255, 255);">spring3 mvc是方法级别的拦截，拦截到方法后根据参数上的注解，把request数据注入进去，在spring3 mvc中，一个方法对应一个request上下文。</span><span style="color: rgb(51, 51, 51); font-size: 14px; line-height: 26px; font-family: &#39;Courier New&#39;; background-color: rgb(255, 255, 255);">而struts2框架是类级别的拦截，每次来了请求就创建一个Action，然后调用setter getter方法把request中的数据注入；struts2实际上是通过setter getter方法与request打交道的；struts2中，一个Action对象对应一个request上下文。</span></span></p></li><li><p><span style="color: rgb(51, 51, 51); font-size: 14px; line-height: 26px; font-family: &#39;Courier New&#39;; background-color: rgb(255, 255, 255);"><span style="color: rgb(51, 51, 51); font-family: &#39;Courier New&#39;; font-size: 14px; line-height: 26px; background-color: rgb(255, 255, 255);">参数传递：struts是在接受参数的时候，可以用属性来接受参数，这就说明参数是让多个方法共享的。</span></span></p></li><li><p><span style="color: rgb(51, 51, 51); font-size: 14px; line-height: 26px; font-family: &#39;Courier New&#39;; background-color: rgb(255, 255, 255);"><span style="color: rgb(51, 51, 51); font-family: &#39;Courier New&#39;; font-size: 14px; line-height: 26px; background-color: rgb(255, 255, 255);">设计思想上：</span><span style="font-family: &#39;Courier New&#39;; font-size: 14px; line-height: 26px; color: rgb(255, 0, 0); background-color: rgb(255, 255, 255);">struts更加符合oop的编程思想</span><span style="color: rgb(51, 51, 51); font-family: &#39;Courier New&#39;; font-size: 14px; line-height: 26px; background-color: rgb(255, 255, 255);">， spring就比较谨慎，在servlet上扩展。</span></span></p></li><li><p><span style="color: rgb(51, 51, 51); font-size: 14px; line-height: 26px; font-family: &#39;Courier New&#39;; background-color: rgb(255, 255, 255);"><span style="color: rgb(51, 51, 51); font-size: 14px; line-height: 26px; font-family: &#39;Courier New&#39;; background-color: rgb(255, 255, 255);">intercepter的实现机制：struts有以自己的interceptor机制，</span><span style="font-size: 14px; line-height: 26px; color: rgb(255, 0, 0); font-family: &#39;Courier New&#39;; background-color: rgb(255, 255, 255);">spring mvc用的是独立的AOP方式</span><span style="color: rgb(51, 51, 51); font-size: 14px; line-height: 26px; font-family: &#39;Courier New&#39;; background-color: rgb(255, 255, 255);">。这样导致struts的配置文件量还是比spring mvc大，虽然struts的配置能继承，所以我觉得论使用上来讲，spring mvc使用更加简洁，</span><span style="color: rgb(51, 51, 51); font-size: 14px; line-height: 26px; font-family: &#39;Courier New&#39;; background-color: rgb(255, 255, 255);">开发效率Spring MVC确实比struts2高</span><span style="color: rgb(51, 51, 51); font-size: 14px; line-height: 26px; font-family: &#39;Courier New&#39;; background-color: rgb(255, 255, 255);">。</span><span style="color: rgb(51, 51, 51); font-size: 14px; line-height: 26px; font-family: &#39;Courier New&#39;; background-color: rgb(255, 255, 255);">spring mvc是方法级别的拦截，一个方法对应一个request上下文，而方法同时又跟一个url对应，所以说从架构本身上<span style="color: rgb(255, 0, 0);">spring3 mvc就容易实现restful url</span>。</span><span style="color: rgb(51, 51, 51); font-size: 14px; line-height: 26px; font-family: &#39;Courier New&#39;; background-color: rgb(255, 255, 255);">struts2是类级别的拦截，一个类对应一个request上下文；实现restful url要费劲，因为struts2 action的一个方法可以对应一个url；而其类属性却被所有方法共享，这也就无法用注解或其他方式标识其所属方法了。</span><span style="color: rgb(51, 51, 51); font-size: 14px; line-height: 26px; font-family: &#39;Courier New&#39;; background-color: rgb(255, 255, 255);">spring3 mvc的方法之间基本上独立的，独享request response数据，请求数据通过参数获取，处理结果通过ModelMap交回给框架方法之间不共享变量，</span><span style="color: rgb(51, 51, 51); font-size: 14px; line-height: 26px; font-family: &#39;Courier New&#39;; background-color: rgb(255, 255, 255);">而struts2搞的就比较乱，虽然方法之间也是独立的，但其所有Action变量是共享的，这不会影响程序运行，却给我们编码，读程序时带来麻烦。</span></span></p></li><li><p><span style="color: rgb(51, 51, 51); font-size: 14px; line-height: 26px; font-family: &#39;Courier New&#39;; background-color: rgb(255, 255, 255);"><span style="color: rgb(51, 51, 51); font-size: 14px; line-height: 26px; font-family: &#39;Courier New&#39;; background-color: rgb(255, 255, 255);">另外，spring3 mvc的验证也是一个亮点，支持JSR303，</span><span style="font-size: 14px; line-height: 26px; font-family: &#39;Courier New&#39;; color: rgb(255, 0, 0); background-color: rgb(255, 255, 255);">处理ajax的请求更是方便</span><span style="color: rgb(51, 51, 51); font-size: 14px; line-height: 26px; font-family: &#39;Courier New&#39;; background-color: rgb(255, 255, 255);">，只需一个注解</span><span style="font-size: 14px; line-height: 26px; font-family: &#39;Courier New&#39;; color: rgb(51, 51, 255); background-color: rgb(255, 255, 255);">@ResponseBody</span><span style="color: rgb(51, 51, 51); font-size: 14px; line-height: 26px; font-family: &#39;Courier New&#39;; background-color: rgb(255, 255, 255);">&nbsp;，然后直接返回响应文本即可。</span><span style="color: rgb(51, 51, 51); font-size: 14px; line-height: 26px; font-family: &#39;Courier New&#39;; background-color: rgb(255, 255, 255);">送上一段代码：</span></span></p></li></ol><pre class="brush:java;toolbar:false">RequestMapping(value=&quot;/whitelists&quot;)
public&nbsp;String&nbsp;index(ModelMap&nbsp;map)&nbsp;{
Account&nbsp;account&nbsp;=&nbsp;accountManager.getByDigitId(SecurityContextHolder.get().getDigitId());
List&lt;Group&gt;&nbsp;groupList&nbsp;=&nbsp;groupManager.findAllGroup(account.getId());
map.put(&quot;account&quot;,&nbsp;account);
map.put(&quot;groupList&quot;,&nbsp;groupList);
return&nbsp;&quot;/group/group-index&quot;;
}

//&nbsp;@ResponseBody&nbsp;ajax响应，处理Ajax请求也很方便
@RequestMapping(value=&quot;/whitelist/{whiteListId}/del&quot;)
@ResponseBody
public&nbsp;String&nbsp;delete(@PathVariable&nbsp;Integer&nbsp;whiteListId)&nbsp;{
whiteListManager.deleteWhiteList(whiteListId);
return&nbsp;&quot;success&quot;;
}</pre><p>转自：<a href="http://blog.csdn.net/ya2dan/article/details/7395458" target="_blank" title="springmvc与struts比较">http://blog.csdn.net/ya2dan/article/details/7395458</a></p><p></p>', '2014-05-26', 'springmvc与struts的比较', '172', null, null, '1', 'spring,struts', 'spring mvc与strusts比较', '0', '29', '0', null, null, null);
INSERT INTO "public"."cms_article" VALUES ('46', 'black', '<p style="text-indent: 2em;">最近在看厚黑学。脸皮要厚如城墙，心要黑如煤炭，方能干大事，按照我的理解，人要想成功，那就是一个字——“贱”。不过，看了厚黑学，在看看身边的人，的确如此。</p><p style="text-indent: 2em;">厚黑分3个阶段：</p><p style="text-indent: 2em;">1.脸皮要厚如城墙，心要黑如煤炭；</p><p style="text-indent: 2em;">2.厚而硬，黑而发亮；</p><p style="text-indent: 2em;">3.厚黑而无形...有点无剑胜有剑的感觉；</p><p style="text-indent: 2em;">看了过后，感觉自己第一个阶段都还没有达到，脸皮又不厚，心又不黑。厚黑学里说，这种人要能成功，那便奇了怪了。瞬间感觉整个人生都没希望了，要我把厚黑学练到第一个阶段都不太可能。哎，只能直接练最高阶段了，厚黑而无形。。厚黑的最高阶段---你厚黑，别人看不出来你厚黑，不告诉别人你厚黑..</p><p style="text-indent: 2em;"><br/></p>', '2014-05-27', '', '142', null, null, '1', '厚黑', '厚黑学之我见', '0', '31', '0', '2014-06-27', null, '5');
INSERT INTO "public"."cms_article" VALUES ('47', 'black', '<p style="text-indent: 2em;">maven相比其他传统项目的几大好处，在这儿总结一下<br/></p><p style="text-indent: 2em;">1.<span style="color: rgb(255, 0, 0);">maven统一管理包</span>，它把你所有的包都放在一个地方，不用像比如myeclipse项目一样需要把包都放到项目下的lib下边，统一管理包，大大减小了对包的维护成本；</p><p style="text-indent: 2em;">2.<span style="color: rgb(255, 0, 0);">对应用包的升级方便</span>，相比传统项目，要升级一类包的时候，必须要把原来的包找出来删掉，在把新的包放进去，这样很麻烦。用maven只需要改一下pom文件中相应的版本即可；</p><p style="text-indent: 2em;">3.<span style="color: rgb(255, 0, 0);">开发项目不依赖与开发工具</span>，你可以随意挑选支持maven的IDE；</p><p style="text-indent: 2em;">4.<span style="color: rgb(255, 0, 0);">集成编译，测试，打包，发布，部署，等一条龙服务</span>；</p><p style="text-indent: 2em;">5.<span style="color: rgb(255, 0, 0);">拥有各种插件</span>，例如，生成api，生成测试报告，pdf报表等功能，当然你也可以自己开发插件；</p><p style="text-indent: 2em;"><br/></p><p style="text-indent: 2em;">先总结这些，以后想到再写。。。</p><p style="text-indent: 2em;"><br/></p>', '2014-05-27', '​maven相比其他传统项目的几大好处，在这儿总结一下。。。', '150', null, null, '1', 'maven', 'maven相比传统项目的几大好处', '0', '29', '0', null, null, null);
INSERT INTO "public"."cms_article" VALUES ('48', 'black', '<p dir="ltr" style="text-indent: 2em;">nginx代理tomcat的时候，tomcat获取的客户端不是客户端传过来的ip，出现这种情况的原因很明显，nginx作为代理服务器先拦截客户端发来的请求，它再以localhost的身份转发给tomcat去处理。解决办法在nginx配置中的location节点中加入以下：<br/></p><p dir="ltr" style="text-indent: 2em;"><span style="font-size: 14px; font-family: Helvetica, Tahoma, Arial, sans-serif; background-color: rgb(255, 255, 255);">proxy_set_header Host $host;</span><br style="font-size: 14px; white-space: normal; font-family: Helvetica, Tahoma, Arial, sans-serif; background-color: rgb(255, 255, 255);"/><span style="font-size: 14px; font-family: Helvetica, Tahoma, Arial, sans-serif; background-color: rgb(255, 255, 255);">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;proxy_set_header X-Real-IP $remote_addr;</span><br style="font-size: 14px; white-space: normal; font-family: Helvetica, Tahoma, Arial, sans-serif; background-color: rgb(255, 255, 255);"/><span style="font-size: 14px; font-family: Helvetica, Tahoma, Arial, sans-serif; background-color: rgb(255, 255, 255);">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;proxy_set_header REMOTE-HOST $remote_addr;</span><br style="font-size: 14px; white-space: normal; font-family: Helvetica, Tahoma, Arial, sans-serif; background-color: rgb(255, 255, 255);"/><span style="font-size: 14px; font-family: Helvetica, Tahoma, Arial, sans-serif; background-color: rgb(255, 255, 255);">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;</span></p><p dir="ltr" style="text-indent: 2em;"><span style="font-size: 14px; font-family: Helvetica, Tahoma, Arial, sans-serif; background-color: rgb(255, 255, 255);"><br/></span></p><p dir="ltr" style="text-indent: 2em;"><span style="font-family:Helvetica, Tahoma, Arial, sans-serif"><span style="font-size: 14px; background-color: rgb(255, 255, 255);">java可以这样获取远程ip</span></span></p><pre class="brush:java;toolbar:false">public&nbsp;static&nbsp;String&nbsp;getIpAddr(HttpServletRequest&nbsp;request)&nbsp;{
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;String&nbsp;ip&nbsp;=&nbsp;request.getHeader(&quot;x-forwarded-for&quot;);
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if(ip&nbsp;==&nbsp;null&nbsp;||&nbsp;ip.length()&nbsp;==&nbsp;0&nbsp;||&nbsp;&quot;unknown&quot;.equalsIgnoreCase(ip))&nbsp;{
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ip&nbsp;=&nbsp;request.getHeader(&quot;Proxy-Client-IP&quot;);
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if(ip&nbsp;==&nbsp;null&nbsp;||&nbsp;ip.length()&nbsp;==&nbsp;0&nbsp;||&nbsp;&quot;unknown&quot;.equalsIgnoreCase(ip))&nbsp;{
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ip&nbsp;=&nbsp;request.getHeader(&quot;WL-Proxy-Client-IP&quot;);
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if(ip&nbsp;==&nbsp;null&nbsp;||&nbsp;ip.length()&nbsp;==&nbsp;0&nbsp;||&nbsp;&quot;unknown&quot;.equalsIgnoreCase(ip))&nbsp;{
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ip&nbsp;=&nbsp;request.getRemoteAddr();
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;return&nbsp;ip;
}</pre><p dir="ltr" style="text-indent: 2em;"><span style="font-family:Helvetica, Tahoma, Arial, sans-serif"><span style="font-size: 14px; background-color: rgb(255, 255, 255);"></span></span><br/></p><p dir="ltr" style="text-indent: 2em;"><span style="font-size: 14px; font-family: Helvetica, Tahoma, Arial, sans-serif; background-color: rgb(255, 255, 255);"><br/></span></p><p dir="ltr" style="text-indent: 2em;"><span style="font-size: 14px; font-family: Helvetica, Tahoma, Arial, sans-serif; background-color: rgb(255, 255, 255);">OK！</span></p><p dir="ltr" style="text-indent: 2em;"><span style="font-size: 14px; font-family: Helvetica, Tahoma, Arial, sans-serif; color: rgb(255, 192, 0); background-color: rgb(255, 255, 255);">纯属搬运</span></p><p dir="ltr" style="text-indent: 2em;"><span style="font-size: 14px; font-family: Helvetica, Tahoma, Arial, sans-serif; background-color: rgb(255, 255, 255);"><br/></span></p><p dir="ltr" style="text-indent: 2em;"><span style="font-size: 14px; font-family: Helvetica, Tahoma, Arial, sans-serif; background-color: rgb(255, 255, 255);"><br/></span></p>', '2014-05-28', 'nginx代理tomcat的时候，tomcat获取的客户端不是客户端传过来的ip，出现这种情况的原因很明显，nginx作为代理服务器先拦截客户端发来的请求。。。', '4492', null, null, '1', 'nginx', 'nginx代理tomcat系统不能获取真实ip解决办法', '0', '29', '0', null, null, null);
INSERT INTO "public"."cms_article" VALUES ('49', 'black', '<p>js原型链扩展一些很实用的方法：</p><pre class="brush:js;toolbar:false">/**
&nbsp;*&nbsp;格式化日期
&nbsp;*&nbsp;@param&nbsp;format
&nbsp;*&nbsp;@returns
&nbsp;*/
Date.prototype.format&nbsp;=&nbsp;function(format)&nbsp;{
	var&nbsp;o&nbsp;=&nbsp;{
		&quot;M+&quot;&nbsp;:&nbsp;this.getMonth()&nbsp;+&nbsp;1,&nbsp;//&nbsp;month
		&quot;d+&quot;&nbsp;:&nbsp;this.getDate(),&nbsp;//&nbsp;day
		&quot;h+&quot;&nbsp;:&nbsp;this.getHours(),&nbsp;//&nbsp;hour
		&quot;m+&quot;&nbsp;:&nbsp;this.getMinutes(),&nbsp;//&nbsp;minute
		&quot;s+&quot;&nbsp;:&nbsp;this.getSeconds(),&nbsp;//&nbsp;second
		&quot;q+&quot;&nbsp;:&nbsp;Math.floor((this.getMonth()&nbsp;+&nbsp;3)&nbsp;/&nbsp;3),&nbsp;//&nbsp;quarter
		&quot;S&quot;&nbsp;:&nbsp;this.getMilliseconds()
	//&nbsp;millisecond
	};

	if&nbsp;(/(y+)/.test(format))&nbsp;{
		format&nbsp;=&nbsp;format.replace(RegExp.$1,&nbsp;(this.getFullYear()&nbsp;+&nbsp;&quot;&quot;)
				.substr(4&nbsp;-&nbsp;RegExp.$1.length));
	}

	for&nbsp;(&nbsp;var&nbsp;k&nbsp;in&nbsp;o)&nbsp;{
		if&nbsp;(new&nbsp;RegExp(&quot;(&quot;&nbsp;+&nbsp;k&nbsp;+&nbsp;&quot;)&quot;).test(format))&nbsp;{
			format&nbsp;=&nbsp;format.replace(RegExp.$1,&nbsp;RegExp.$1.length&nbsp;==&nbsp;1&nbsp;?&nbsp;o[k]
					:&nbsp;(&quot;00&quot;&nbsp;+&nbsp;o[k]).substr((&quot;&quot;&nbsp;+&nbsp;o[k]).length));
		}
	}
	return&nbsp;format;
};
//使用
alert(new&nbsp;Date().format(&quot;yyyy-MM-dd&quot;))

/**
&nbsp;*&nbsp;js原型链实现replaceAll
&nbsp;*/
String.prototype.replaceAll&nbsp;&nbsp;=&nbsp;function(s1,s2){
&nbsp;&nbsp;&nbsp;&nbsp;return&nbsp;this.replace(new&nbsp;RegExp(s1,&quot;gm&quot;),s2);
};

/**
&nbsp;*&nbsp;js实现endWith
&nbsp;*/
String.prototype.endWith=function(str){
	if(str==null||str==&quot;&quot;||this.length==0||str.length&gt;this.length)
	&nbsp;&nbsp;return&nbsp;false;
	if(this.substring(this.length-str.length)==str)
	&nbsp;&nbsp;return&nbsp;true;
	else
	&nbsp;&nbsp;return&nbsp;false;
	return&nbsp;true;
}

/**
&nbsp;*&nbsp;js实现startWith
&nbsp;*/
String.prototype.startWith=function(str){
	if(str==null||str==&quot;&quot;||this.length==0||str.length&gt;this.length)
	&nbsp;&nbsp;return&nbsp;false;
	if(this.substr(0,str.length)==str)
	&nbsp;&nbsp;return&nbsp;true;
	else
	&nbsp;&nbsp;return&nbsp;false;
	return&nbsp;true;
}

/**
&nbsp;*&nbsp;数组扩展---根据下标删除某元素
&nbsp;*/
Array.prototype.del=function(n)&nbsp;{
	if(n&lt;0)&nbsp;return&nbsp;this;
	else
		return&nbsp;this.slice(0,n).concat(this.slice(n+1,this.length));
};

/**
&nbsp;*&nbsp;数组扩展---根据一个值删除某元素
&nbsp;*/
Array.prototype.delByValue=function(value)&nbsp;{
	for(var&nbsp;i&nbsp;=&nbsp;0;i&lt;this.length;i++){
		if(this[i]&nbsp;==&nbsp;value){
			this.del(i);
		}
	}
};

/**
&nbsp;*&nbsp;数组扩展判断某值知否在数组中
&nbsp;*/
Array.prototype.isContainsValue=function(value)&nbsp;{
	for(var&nbsp;i&nbsp;in&nbsp;this){
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if(this[i]==value){
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;return&nbsp;true;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}
&nbsp;&nbsp;&nbsp;&nbsp;}
&nbsp;&nbsp;&nbsp;&nbsp;return&nbsp;false;
};

/**
&nbsp;*&nbsp;js阻止冒泡事件
&nbsp;*/
function&nbsp;stopPropagation(e)&nbsp;{
&nbsp;&nbsp;&nbsp;&nbsp;e&nbsp;=&nbsp;e&nbsp;||&nbsp;window.event;
&nbsp;&nbsp;&nbsp;&nbsp;if(e.stopPropagation)&nbsp;{&nbsp;//W3C阻止冒泡方法
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;e.stopPropagation();
&nbsp;&nbsp;&nbsp;&nbsp;}&nbsp;else&nbsp;{
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;e.cancelBubble&nbsp;=&nbsp;true;&nbsp;//IE阻止冒泡方法
&nbsp;&nbsp;&nbsp;&nbsp;}
}</pre><p><br/></p>', '2014-05-28', 'js原型链扩展一些很实用的方法', '108', null, null, '1', 'js', 'js扩展一些比较有用的方法', '0', '30', '0', null, null, null);
INSERT INTO "public"."cms_article" VALUES ('50', 'green', '<p><span style="font-family:宋体">&nbsp;&nbsp;&nbsp;&nbsp;好久没有写博客了，还记得去年的这个时候，自己基本一周写一篇博客来梳理自己一周的生活以及所学的东西，可现在人开始慢慢的失去了当年的那些激情，开始和大多数工作人士一样，所谓的随了现实。</span></p><p>&nbsp;&nbsp;&nbsp;&nbsp;<span style="font-family:宋体">来新公司刚好两个月了，从毕业的第一份工作的天天加班到现在工作的几乎不加班，我也不知道是迷茫的开始还是对生活的态度开始变得从容了，之前一直都不太喜欢懒散的生活，而现在的自己开始变得懒散</span> <span style="font-family:宋体">，在工作上，每次领导安排任务后，我第一时间不是去想怎么完成任务，而是着手做自己的事情，不到最后</span> <span style="font-family:宋体">紧急时候是不得开始动手做工作上面的事情。也许再过两年，三年，甚至更久，我和身边的很多</span> <span style="font-family:宋体">朋友的差距就会形成了，我会变得毫无</span> <span style="font-family:宋体">竞争力可言，当他们拿着</span>1<span style="font-family:宋体">万或者</span>2<span style="font-family:宋体">万的工资时，或许我还在</span>7<span style="font-family:宋体">千，甚至还在为工作而发愁。</span></p><p>&nbsp;&nbsp;&nbsp;&nbsp;<span style="font-family:宋体">每当人在忙的时候，总闲着如何清闲，但是这时是拥有很强烈的安全感的，但是当自己</span> <span style="font-family:宋体">长时间清闲时，自己的危机感随时产生。我不知道自己还能这样多久，或许我的迷茫是我根本不知道</span> <span style="font-family:宋体">自己该做什么，自己能做什么</span> <span style="font-family:宋体">，自己</span> <span style="font-family:宋体">在做什么。</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;<span style="font-family:宋体">我的同学，朋友，他们在想什么，他们在做什么，他们迷茫吗，好想和他们一起喝场酒，谈谈自己的人生，听听他们的人生，可是感觉这一切好难好难。</span></p><p>&nbsp;&nbsp;&nbsp;&nbsp;<span style="font-family:宋体">距离毕业也快一年了，毕业的之前的迷茫现在开始浮现在我的头脑里面，看着身边的同学开着各式各样的车，听着某些同学的生活经历以及各种晒，才发现生活是随着时间在拉开差距，上学的时候大家的起跑线和终点都一样，可是在毕业后，才发现我们已经输在了起跑线上面了，而且感觉我们起跑都很困难，难道我们真的差那么一截吗？</span></p><p>&nbsp;&nbsp;&nbsp;&nbsp;<span style="font-family:宋体">又到了夜深人静的时候了，今天暂时写到这儿，后面给大家谈谈我的工作经历以及</span> <span style="font-family:宋体">生活。</span></p><p><br/></p>', '2014-05-28', '生活是不公平的，但你得适应它', '155', null, null, '1', '生活,迷茫,工作,第一次', '开始迷茫的生活', '0', '34', '0', null, null, null);
INSERT INTO "public"."cms_article" VALUES ('51', 'black', '<p>后台代码：</p><pre class="brush:java;toolbar:false">@RequestMapping(value=&quot;/jsonp.json&quot;)
@ResponseBody
public&nbsp;JSONPObject&nbsp;getJsonp(ModelMap&nbsp;map,@RequestParam&nbsp;String&nbsp;callback){
&nbsp;&nbsp;&nbsp;&nbsp;map.put(&quot;msg&quot;,&nbsp;&quot;hello,jsonp&quot;);
&nbsp;&nbsp;&nbsp;&nbsp;return&nbsp;new&nbsp;JSONPObject(callback,&nbsp;map);
}</pre><p>这里应用的JSONPObject为com.fasterxml.jackson.databind.util.JSONPObject</p><p><br/></p><p>前端代码：<br/></p><pre class="brush:js;toolbar:false">&lt;script&nbsp;type=&quot;text/javascript&quot;&nbsp;src=&quot;http://libs.baidu.com/jquery/1.9.0/jquery.js&quot;&gt;&lt;/script&gt;
&lt;script&nbsp;type=&quot;text/javascript&quot;&gt;
	$(function(){
		$.getJSON(&quot;http://127.0.0.1:8084/thinker/finance/jsonp.json?callback=?&quot;,
			function(data){
			&nbsp;&nbsp;alert(data.msg);
		});
	})
&lt;/script&gt;</pre><p><br/></p><p><br/></p>', '2014-06-03', 'jquery springmvc实现跨域', '211', null, null, '1', '跨域,jquery,java', 'jquery springmvc实现跨域', '0', '29', '0', '2014-06-03', '5', null);
INSERT INTO "public"."cms_article" VALUES ('52', 'black', '<p dir="ltr" style="text-indent: 2em;"><strong>实例说明</strong></p><p dir="ltr" style="text-indent: 2em;">什么是适配器（Adapter）设计模式？笔者先通过一个实际生活中的例子进行介绍。</p><p style="text-indent: 2em;">例如，一般的家用电器要求的电压是 220V，有个别电器则要求使用110V 电压，这样就必须有一个能把 220V 电压转换成 110V 电压的变压器，这个变压器就是一个适配器。</p><p dir="ltr" style="text-indent: 2em;"><strong>关键技术</strong></p><p dir="ltr" style="text-indent: 2em;">适配器模式把一个类的接口变换成客户端所期待的另一种接口，从而使原本接口不匹配而无法在一起工作的两个类能够在一起工作。</p><p style="text-indent: 2em;">在以下情况下可以使用适配器模式：</p><ul class=" list-paddingleft-2" style="list-style-type: disc;"><ul class=" list-paddingleft-2" style="list-style-type: square;"><li><p style="text-indent: 0em;"><span style="text-indent: 2em;">系统需要使用现有的类，而此类的接口不符合系统的要求。</span></p></li><li><p style="white-space: normal;">要建立一个可以重复使用的类，用于与该类之间关联不大的一些类，包括工作中引进的类。这些基类不一定存在复杂的接口。</p></li></ul></ul><p style="text-indent: 2em;">类的适配器模式使用起来有点像多重继承机制，利用接口的特性，把一些零散类组织到一起，成为一个新的类来实现调用，并且看起来像是对一个类的操作。实际上，适配器模式更多的是强调对代码的组织，而不是功能的实现。</p><p style="text-indent: 2em;">用通俗的语言来说，为了方便代码的组织与模型的准确表示，该模式在组织代码中的作用是可以把一个类中的成员插到另一个类的继承子类中，从而让这个继承的子类看起来像一个新类，同时可以对父类减少依赖。</p><p style="text-indent: 2em;">举一个例子，类 1：虎；类 2：鸟。</p><p style="text-indent: 2em;">继承一个虎，然后用适配器模式把鸟的翅膀成员拿过来，成为一个有翅膀的虎类，故有成语“如虎添翼”。如何将翅膀成员拿过来呢？这就是适配器的作用。</p><p style="text-indent: 2em;"><strong>设计过程</strong></p><ol class="custom_num list-paddingleft-1"><p style="text-indent: 0em;"><span style="text-indent: 0em;">&nbsp;&nbsp;&nbsp;&nbsp;(1)定义适配器接口。代码如下：</span><span style="text-indent: 0em;">&nbsp; </span></p><pre class="brush:java;toolbar:false">public&nbsp;interface&nbsp;IAdapter&nbsp;&nbsp;&nbsp;&nbsp;
//适配器接口
{
String&nbsp;Drive();
}</pre><p style="text-indent: 0em;"><span style="text-indent: 0em;">&nbsp;&nbsp;&nbsp;&nbsp;(2)定义适配器类 Adapter，实现 IAdapter 接口。代码如下：</span></p><p style="text-indent: 0em;"><span style="text-indent: 0em;"></span></p><pre class="brush:java;toolbar:false">public&nbsp;class&nbsp;Adapter&nbsp;implements&nbsp;IAdapter
//适配器类
{
public&nbsp;String&nbsp;Drive()
{
return&nbsp;&quot;变压器&quot;;
}
}</pre><p style="text-indent: 0em;"><span style="text-indent: 0em;">&nbsp;&nbsp;&nbsp;&nbsp;(3)定义改变适配器类，该类主要实现将变压器的电压从 110V 改变为 220V。代码如下：</span></p><p style="text-indent: 0em;"><span style="text-indent: 0em;"></span></p><pre class="brush:java;toolbar:false">public&nbsp;class&nbsp;ChangeAdapter
//改变适配器类
{
public&nbsp;String&nbsp;Web(String&nbsp;str)
{
return&nbsp;str;
}
}</pre><p style="text-indent: 0em;"><span style="text-indent: 0em;">&nbsp;&nbsp;&nbsp;&nbsp;(4)定义输出电压为 110V 的变压器类。代码如下：</span></p><pre class="brush:java;toolbar:false">public&nbsp;class&nbsp;CClass&nbsp;extends&nbsp;ChangeAdapter&nbsp;implements&nbsp;IAdapter
//实现类适配器
{
public&nbsp;String&nbsp;Drive()
{
return&nbsp;this.Web(&quot;（1）输出电压：110V&quot;);
}
}</pre><p style="text-indent: 0em;"><span style="text-indent: 0em;">&nbsp;&nbsp;&nbsp;&nbsp;(5)定义输出电压为 220V 的变压器类。代码如下：</span></p><p style="text-indent: 0em;"><span style="text-indent: 0em;"></span></p><pre class="brush:java;toolbar:false">public&nbsp;class&nbsp;CObject&nbsp;implements&nbsp;IAdapter&nbsp;&nbsp;&nbsp;&nbsp;
//实现对象适配器
{
private&nbsp;ChangeAdapter&nbsp;changeAdapter;
public&nbsp;CObject()
{
changeAdapter&nbsp;=&nbsp;new&nbsp;ChangeAdapter();
}
public&nbsp;String&nbsp;Drive()
{
return&nbsp;changeAdapter.Web(&quot;（2）输出电压：220V&quot;);
}
}</pre><p style="text-indent: 0em;"><span style="text-indent: 0em;"></span><br/></p><p style="text-indent: 0em;"><span style="text-indent: 0em;">&nbsp;&nbsp;&nbsp;&nbsp;(6)在 main()方法中使用变压器将 110V 的电压变压为 220V。代码如下：</span></p><p style="text-indent: 0em;"><span style="text-indent: 0em;"></span></p><pre class="brush:java;toolbar:false">class&nbsp;Program&nbsp;&nbsp;&nbsp;&nbsp;
{
public&nbsp;static&nbsp;void&nbsp;main(String[]&nbsp;args)
{
IAdapter&nbsp;dap&nbsp;=&nbsp;new&nbsp;Adapter();
System.out.println((dap.Drive()));
dap&nbsp;=&nbsp;new&nbsp;CClass();
//调用第一个适配器
System.out.println((dap.Drive()));
dap&nbsp;=&nbsp;new&nbsp;CObject();
//调用第二个适配器
System.out.println((dap.Drive()));
}
}</pre><p style="text-indent: 0em;"><span style="text-indent: 0em;"></span><strong>&nbsp;&nbsp;&nbsp;&nbsp;秘笈心法</strong></p></ol>', '2014-06-06', '例如，一般的家用电器要求的电压是 220V，有个别电器则要求使用
110V 电压，这样就必须有一个能把 220V 电压转换成 110V 电压的变压器，
这个变压器就是一个适配器。', '153', null, null, '1', '设计模式', '设计模式-接口型模式-适配器模式', '0', '29', '0', '2014-06-06', '5', '5');
INSERT INTO "public"."cms_article" VALUES ('53', 'black', '<p><strong>实例说明</strong></p><p style="text-indent: 2em;">什么是外观（Facade）模式？笔者先通过一个实际生活中的例子进行介绍。</p><p style="text-indent: 2em;">例如，打开电脑时，在电脑的内部需要执行以下几步，即启动电源、主板、硬盘，最后启动操作系统；关闭电脑时需要执行的步骤与之正好相反。</p><p><strong style="white-space: normal;">实例说明</strong></p><p style="text-indent: 2em;">下面详细介绍外观模式的意图、动机和适用性。</p><p>（1）意图</p><p style="text-indent: 2em;"><span style="text-indent: 2em;">为子系统中的一组接口提供一个一致的界面。此模式定义了一个高层接口，</span><span style="text-indent: 2em;">该接口使得这一子系统更易使用。</span></p><p>（2）动机</p><p style="text-indent: 2em;">将一个系统划分为若干个子系统有利于降低系统的复杂性。在实际开发中，一种比较常见的设计目标是使子系统间的通信和相互依赖关系达到最小。达到该目标的途径之一就是引入一个外观对象，为各个子系统提供一个单一而简单的界面。</p><p>（3）适用性</p><p>在以下情况下可以使用外观模式:</p><ul class=" list-paddingleft-2" style="list-style-type: disc;"><li><p>要为一个复杂子系统提供一个简单接口时。子系统往往因为不断演化而变得越来越复杂。大多数模式使用时都会产生更多更小的类，这使得子系统更具可重用性，也更容易对子系统进行定制，但这也给那些不需要定制子系统的用户带来一些使用上的困难。Facade 可以提供一个简单的默认视图，这一视图对大多数用户来说已经足够，而那些需要更多可定制性的用户可以越过Facade 层。</p></li><li><p>客户程序与抽象类的实现部分之间存在着很大的依赖性。引入 Facade 将这个子系统与客户以及其他的子系统分离，可以提高子系统的独立性和可移植性。</p></li><li><p>当需要构建一个层次结构的子系统时，可以使用 Facade 模式定义子系统中每层的入口点。如果子系统之间是相互依赖的，可以让它们仅通过 Facade 进行通信，从而简化它们之间的依赖关系。</p></li></ul><p><strong>设计过程</strong></p><p>（1）定义电源类 Power，并实现启动电源和关闭电源的方法。代码如下：</p><pre class="brush:java;toolbar:false">public&nbsp;class&nbsp;Power&nbsp;{
	public&nbsp;void&nbsp;Connect()&nbsp;{
		System.out.println(&quot;Power&nbsp;Connect&quot;);
	}

	public&nbsp;void&nbsp;Disconnect()&nbsp;{
		System.out.println(&quot;Power&nbsp;Disconnect&quot;);
	}
}</pre><p>（2）定义主板类 MainBoard。代码如下：</p><pre class="brush:java;toolbar:false">public&nbsp;class&nbsp;MainBoard
//&nbsp;主板
{
	public&nbsp;void&nbsp;On()&nbsp;{
		System.out.println(&quot;MainBoard&nbsp;On&quot;);
	}

	public&nbsp;void&nbsp;Off()&nbsp;{
		System.out.println(&quot;MainBoard&nbsp;Off&quot;);
	}
}</pre><p>（3）定义硬盘类 HardDisk。代码如下：</p><pre class="brush:java;toolbar:false">public&nbsp;class&nbsp;HardDisk
//&nbsp;硬盘
{
	public&nbsp;void&nbsp;Run()&nbsp;{
		System.out.println(&quot;HardDisk&nbsp;Run&quot;);
	}

	public&nbsp;void&nbsp;Stop()&nbsp;{
		System.out.println(&quot;HardDisk&nbsp;Stop&quot;);
	}
}</pre><p>（4）定义操作系统类 OperateionSystem。代码如下：</p><pre class="brush:java;toolbar:false">public&nbsp;class&nbsp;OperateionSystem
//&nbsp;操作系统
{
	public&nbsp;void&nbsp;Startup()&nbsp;{
		System.out.println(&quot;OperateionSystem&nbsp;Startup&quot;);
	}

	public&nbsp;void&nbsp;Shutdown()&nbsp;{
		System.out.println(&quot;OperateionSystem&nbsp;Shutdown&quot;);
	}
}</pre><p>（5）定义计算机类 Computer，并实现打开电脑和关闭电脑的方法。代码如下：</p><pre class="brush:java;toolbar:false">public&nbsp;class&nbsp;Computer&nbsp;{
	Power&nbsp;power;
	MainBoard&nbsp;mainBoard;
	HardDisk&nbsp;hardDisk;
	OperateionSystem&nbsp;operateionSystem;

	public&nbsp;Computer(Power&nbsp;power,&nbsp;MainBoard&nbsp;mainBoard,&nbsp;HardDisk&nbsp;hardDisk,
			OperateionSystem&nbsp;operateionSystem)&nbsp;{
		this.power&nbsp;=&nbsp;power;
		this.mainBoard&nbsp;=&nbsp;mainBoard;
		this.hardDisk&nbsp;=&nbsp;hardDisk;
		this.operateionSystem&nbsp;=&nbsp;operateionSystem;
	}

	public&nbsp;void&nbsp;Startup()
	//&nbsp;启动计算机
	{
		this.power.Connect();
		this.mainBoard.On();
		this.hardDisk.Run();
		this.operateionSystem.Startup();
	}

	public&nbsp;void&nbsp;Shutdown()
	//&nbsp;关闭计算机
	{
		this.operateionSystem.Shutdown();
		this.hardDisk.Stop();
		this.mainBoard.Off();
		this.power.Disconnect();
	}
}</pre><p>（6）在 main()方法中，分别创建电源、主板、硬盘、操作系统及计算机类的实例，然后执行打开电脑和关闭电脑的操作。代码如下：</p><pre class="brush:java;toolbar:false">public&nbsp;class&nbsp;Program&nbsp;{
	public&nbsp;static&nbsp;void&nbsp;main(String[]&nbsp;args)&nbsp;{
		Power&nbsp;power&nbsp;=&nbsp;new&nbsp;Power();
		//&nbsp;创建电源对象
		MainBoard&nbsp;mainBoard&nbsp;=&nbsp;new&nbsp;MainBoard();
		//&nbsp;创建主板对象
		HardDisk&nbsp;hardDisk&nbsp;=&nbsp;new&nbsp;HardDisk();
		//&nbsp;创建硬盘对象
		OperateionSystem&nbsp;operationSystem&nbsp;=&nbsp;new&nbsp;OperateionSystem();
		//&nbsp;创建操作系统对象
		Computer&nbsp;computer&nbsp;=&nbsp;new&nbsp;Computer(power,&nbsp;mainBoard,&nbsp;hardDisk,
				operationSystem);
		//&nbsp;创建计算机对象
		computer.Startup();
		//&nbsp;启动电脑
		System.out.println(&quot;关闭电脑&quot;);
		computer.Shutdown();
		//&nbsp;关闭电脑
	}
}</pre>', '2014-06-06', '用户要打开电脑，首先得启动电源，接着启动主板，然后启动硬盘，最后启动操作系统。', '106', null, null, '1', '设计模式', '设计模式-接口型模式-外观模式', '0', '29', '0', '2014-06-06', '5', '5');
INSERT INTO "public"."cms_article" VALUES ('54', 'black', '<p><strong>实例说明</strong></p><p>组合（Composite）模式有时又称部分－整体模式，它将对象组织到树形结构中，可以用来描述整体与部分的关系。组合模式可以使客户端将单纯元素与复合元素同等看待。文件夹与文件就是组合模式的典型应用。</p><p><strong>关键技术</strong></p><p>根据所实现接口的不同，组合模式可分为两种，即透明模式和安全模式。组合模式可以不提供父对象的管理方法，但它必须在合适的地方提供子对象的管理方法（例如 Add()方法、Remove()方法等）。</p><ul class=" list-paddingleft-2" style="list-style-type: disc;"><li><p>透明模式</p></li></ul><p style="text-indent: 2em;">在组合结构中声明所有用来管理子类对象的方法，包括 Add()方法和 Remove()方法。这样做的好处是所有的构件类都有相同的接口。在客户端看来，树叶类对象与组合类对象的区别起码在接口层次上消失了，客户端可以等同地对待所有对象。这就是透明形式的组合模式。</p><p style="text-indent: 2em;">透明模式的缺点是不够安全，因为树叶类对象和组合类对象在本质上是有所区别的。树叶类对象不可能有下一个层次的对象，因此 Add()方法、Remove()方法没有意义，但在编译时不会出错，而只会在运行时才会出错。</p><ul class=" list-paddingleft-2" style="list-style-type: disc;"><li><p style="text-indent: 0em;">安全模式</p></li></ul><p style="text-indent: 2em;">在组合结构类中声明所有用来管理子类对象的方法。这样做比较安全，因为树叶类型的对象根本就没有管理子类对象的方法，因此如果客户端对树叶类对象使用这些方法，程序会在编译时出错。</p><p style="text-indent: 2em;">安全模式的缺点是不够透明，因为树叶类和组合类将具有不同的接口。</p><p style="text-indent: 2em;">这两种形式各有优缺点，需要根据软件的具体情况作出取舍决定。</p><p style="text-indent: 0em;"><strong>设计过程</strong></p><p style="text-indent: 0em;">（1）定义一个抽象类 AComponent，并声明相关接口。代码如下：</p><pre class="brush:java;toolbar:false">public&nbsp;abstract&nbsp;class&nbsp;AComponent&nbsp;{
	protected&nbsp;String&nbsp;name;

	public&nbsp;AComponent(String&nbsp;name)&nbsp;{
		System.out.println(name);
	}

	abstract&nbsp;public&nbsp;void&nbsp;Add(AComponent&nbsp;c);

	//&nbsp;添加节点
	abstract&nbsp;public&nbsp;void&nbsp;Remove(AComponent&nbsp;c);

	//&nbsp;移除节点
	abstract&nbsp;public&nbsp;void&nbsp;Display(int&nbsp;AComponent);
	//&nbsp;输出节点结构
}</pre><p>（2）定义一个类 Composite，继承抽象类 AComponent，该类用来实现组合设计模式的核心功能（本例为组合树状结构的子节点）。代码如下</p><pre class="brush:java;toolbar:false">public&nbsp;class&nbsp;Composite&nbsp;extends&nbsp;AComponent&nbsp;{
	static&nbsp;AComponent&nbsp;component;
	private&nbsp;ArrayList&nbsp;children&nbsp;=&nbsp;new&nbsp;ArrayList();

	public&nbsp;Composite(String&nbsp;name)&nbsp;{
		super(name);
	}

	public&nbsp;void&nbsp;Add(AComponent&nbsp;component)&nbsp;{
		this.component&nbsp;=&nbsp;component;
		children.add(component);
	}

	public&nbsp;void&nbsp;Remove(AComponent&nbsp;component)&nbsp;{
		children.remove(component);
	}

	public&nbsp;void&nbsp;Display(int&nbsp;i)&nbsp;{
		Iterator&nbsp;iter&nbsp;=&nbsp;children.iterator();
		AComponent&nbsp;ac&nbsp;=&nbsp;null;
		ac&nbsp;=&nbsp;(AComponent)&nbsp;iter.next();
		while&nbsp;(iter.hasNext()&nbsp;&amp;&amp;&nbsp;iter.next().equals(null))&nbsp;{
			System.out.println(ac.name);
		}
	}
}</pre><p>（3）定义一个类 Leaf，用来向树状结构中添加子项。代码如下：</p><pre class="brush:java;toolbar:false">public&nbsp;class&nbsp;Leaf&nbsp;extends&nbsp;AComponent&nbsp;{
	public&nbsp;Leaf(String&nbsp;name)&nbsp;{
		super(name);
	}

	public&nbsp;void&nbsp;Add(AComponent&nbsp;c)&nbsp;{
		System.out.println(&quot;不能添加子项！&quot;);
	}

	public&nbsp;void&nbsp;Remove(AComponent&nbsp;c)&nbsp;{
		System.out.println(&quot;不能移出子项！&quot;);
	}

	public&nbsp;void&nbsp;Display(int&nbsp;AComponent)&nbsp;{
		System.out.println(new&nbsp;String()&nbsp;+&nbsp;name);
	}
}</pre><p style="margin-top: 5px;">（4）在 main()方法中利用透明形式的组合模式生成一个树状结构，实现代码如下：<br/></p><pre class="brush:java;toolbar:false">public&nbsp;class&nbsp;Program&nbsp;{
	public&nbsp;static&nbsp;void&nbsp;main(String[]&nbsp;args)&nbsp;{
		//&nbsp;建立一个树形结构
		Composite&nbsp;root&nbsp;=&nbsp;new&nbsp;Composite(&quot;根目录&quot;);
		//&nbsp;创建一个根元素（根元素也是复合元素）
		root.Add(new&nbsp;Leaf(&quot;----子项&nbsp;A&quot;));
		root.Add(new&nbsp;Leaf(&quot;----子项&nbsp;B&quot;));
		Composite&nbsp;comp&nbsp;=&nbsp;new&nbsp;Composite(&quot;组合&nbsp;X&quot;);
		//&nbsp;创建一个复合元素
		comp.Add(new&nbsp;Leaf(&quot;---子项&nbsp;XA&quot;));
		//&nbsp;为复合元素添加单纯元素
		comp.Add(new&nbsp;Leaf(&quot;---子项&nbsp;XB&quot;));
		root.Add(comp);
		//&nbsp;将复合元素添加到根元素
		root.Add(new&nbsp;Leaf(&quot;--子项&nbsp;C&quot;));
		//&nbsp;将单纯元素添加到根元素
		//&nbsp;添加和移出一个子项
		Leaf&nbsp;l&nbsp;=&nbsp;new&nbsp;Leaf(&quot;--子项&nbsp;D&quot;);
		root.Add(l);
		root.Remove(l);
		//&nbsp;递归输出子节点
		root.Display(1);
	}
}</pre><p><strong><br/></strong><br/></p>', '2014-06-06', '组合（Composite）模式有时又称部分－整体模式，它将对象组织到树形结构中，可以用来描述整体与部分的关系。组合模式可以使客户端将单纯元素与复合元素同等看待。文件夹与文件就是组合模式的典型应用', '119', null, null, '1', '设计模式', '设计模式-接口型模式-组合模式', '0', '29', '0', '2014-06-06', '5', null);
INSERT INTO "public"."cms_article" VALUES ('55', 'black', '<p><strong>实例说明</strong></p><p>什么是桥接设计模式，笔者先通过一个实际生活中的例子进行介绍。<strong><br/></strong></p><p>通讯录和游戏是每款手机必备的软件，假设手机品牌 A 和品牌 B 中都包含这两款软件，如果这两款手机中又增加了计算器软件或再增加一款品牌为 C 的手机，每次变化都需要添加许多类，而且越往后需要添加的类就越多，按照此种状况发展下去，就会出现类爆炸（增长为不可控制的庞然大物）。</p><p><strong>关键技术</strong></p><p style="text-indent: 2em;">在面向对象的设计中，有一个很重要的设计原则，那就是合成/聚合复用原则，即设计类的层次结构时优先使用对象合成/聚合，而不是类继承。</p><p style="text-indent: 2em;">合成（Composition，也可称为组合）和聚合（Aggregation）都是关联的特殊类型。合成是一种强的“拥有”关系，体现了严格的部分和整体的关系，部分和整体的生命周期一样；聚合表示弱的“拥有”关系，体现的是A 对象可以包含 B 对象，但 B 对象不是 A 对象的一部分。</p><p> 说明：例如，一个类中包含一个子类，类和子类之间便是合成关系；两个互不包含的平行类，但一个类中</p><p>的数据成员引用另一个类的类型，那么这两个类之间是聚合关系。</p><p style="text-indent: 2em;">合成/聚合复用原则的好处是：优先使用对象的合成/聚合将有助于保持每个类被封装，并被集中在单个任务上。这样类和类继承层次会保持较小规模，并且不太可能出现类爆炸。本实例中对象有“手机品牌”和“手机软件”两个职责，首先分别定义“手机品牌”和“手机软件”两个抽象类，让不同的品牌和功能分别继承于它们，这样要增加新的品牌或新的功能就不用影响其他类了。最后还要确认手机品牌和手机软件的关系，手机品牌包含有手机软件，但软件并不是品牌的一部分，所以它们之间是聚合关系。</p><p style="text-indent: 2em;"><br/></p><p style="text-align:center"><img src="/upload/20140606/30771402043252030.png" title="QQ截图20140606162722.png"/></p><p style="text-indent: 2em;"><strong><br/></strong><strong>设计过程</strong></p><p style="text-indent: 0em; text-align: left;">（1）定义手机软件的抽象类。代码如下：<strong><br/></strong></p><pre class="brush:java;toolbar:false">public&nbsp;abstract&nbsp;class&nbsp;HandsetSoft
//&nbsp;手机软件抽象类
{
	public&nbsp;abstract&nbsp;void&nbsp;Run();
}</pre><p style="text-indent: 0em; text-align: left;">（2）定义游戏、通讯录的具体类，继承 HandsetSoft 类，然后实现 Run()方法。代码如下：</p><pre class="brush:java;toolbar:false">public&nbsp;class&nbsp;HandsetGame&nbsp;extends&nbsp;HandsetSoft
//&nbsp;手机游戏
{
	public&nbsp;void&nbsp;Run()&nbsp;{
		System.out.println(&quot;运行手机游戏&quot;);
	}
}

public&nbsp;class&nbsp;HandsetAddressList&nbsp;extends&nbsp;HandsetSoft&nbsp;//&nbsp;手机通讯录
{
	public&nbsp;void&nbsp;Run()&nbsp;{
		System.out.println(&quot;打开手机通讯录&quot;);
	}
}</pre><p style="text-indent: 0em; text-align: left;">（3）定义手机品牌的抽象类，其中聚合手机软件抽象类。代码如下：</p><pre class="brush:java;toolbar:false">public&nbsp;abstract&nbsp;class&nbsp;HandsetBrand
//&nbsp;手机品牌
{
	protected&nbsp;HandsetSoft&nbsp;soft;

	//&nbsp;设置手机软件
	public&nbsp;void&nbsp;SetHandsetSoft(HandsetSoft&nbsp;soft)&nbsp;{
		this.soft&nbsp;=&nbsp;soft;
	}

	public&nbsp;abstract&nbsp;void&nbsp;Run();
}</pre><p style="text-indent: 0em; text-align: left;">（4）定义手机品牌 A、手机品牌 B 的具体类，继承 HandsetBrand 类，然后实现 Run()方法。代码如下：</p><pre class="brush:java;toolbar:false">public&nbsp;class&nbsp;HandsetBrandA&nbsp;extends&nbsp;HandsetBrand
//&nbsp;手机品牌&nbsp;A
{
	public&nbsp;void&nbsp;Run()&nbsp;{
		soft.Run();
	}
}

public&nbsp;class&nbsp;HandsetBrandB&nbsp;extends&nbsp;HandsetBrand
//&nbsp;手机品牌&nbsp;B
{
	public&nbsp;void&nbsp;Run()&nbsp;{
		soft.Run();
	}
}</pre><p>（5）在 main()方法中应用桥接模式，分别运行品牌 A 和品牌 B 中的通讯录和游戏。代码如下</p><pre class="brush:java;toolbar:false">public&nbsp;class&nbsp;Program&nbsp;{
	public&nbsp;static&nbsp;void&nbsp;main(String[]&nbsp;args)&nbsp;{
		HandsetBrand&nbsp;hb;
		hb&nbsp;=&nbsp;new&nbsp;HandsetBrandA();
		hb.SetHandsetSoft(new&nbsp;HandsetAddressList());
		hb.Run();
		hb.SetHandsetSoft(new&nbsp;HandsetGame());
		hb.Run();
		hb&nbsp;=&nbsp;new&nbsp;HandsetBrandB();
		hb.SetHandsetSoft(new&nbsp;HandsetAddressList());
		hb.Run();
		hb.SetHandsetSoft(new&nbsp;HandsetGame());
		hb.Run();
	}
}</pre><p><br/></p>', '2014-06-06', '通讯录和游戏是每款手机必备的软件，假设手机品牌 A 和品牌 B 中都包含这两款软件，类的继承结构通常。。。', '97', null, null, '1', '设计模式', '设计模式-接口型模式-桥接模式', '0', '29', '0', '2014-06-06', '5', null);
INSERT INTO "public"."cms_article" VALUES ('56', 'black', '<p><strong>实例说明</strong></p><p>在某种程度上，单例（Singleton）模式是限制而不是改进类的创建。单例模式可以保证一个类有且只有一个实例，并提供一个访问它的全局访问点。在程序设计过程中，有很多情况需要保证一个类只有一个实例。</p><p>单例模式的特点：</p><ul class=" list-paddingleft-2" style="list-style-type: disc;"><li><p>单例类只能有一个实例。</p></li><li><p>单例类必须自己创建其唯一实例。</p></li><li><p>单例类必须给所有其他对象提供这一实例</p></li></ul><p>使用单例模式需要注意以下几点：</p><ul class=" list-paddingleft-2" style="list-style-type: disc;"><li><p>使用 Singleton 模式有一个必要条件，即在一个系统要求一个类只有一个实例时才应当使用单例模式；反过来，如果一个类可以有几个实例共存，就不要使用单例模式。</p></li><li><p>不要使用单例模式存取全局变量。这违背了单例模式的用意，最好放到对应类的静态成员中。</p></li><li><p>不要将数据库连接做成单例，因为一个系统可能会与数据库有多个连接，并且在有连接池的情况下，应当尽可能及时释放连接。Singleton 模式由于使用静态成员存储类实例，所以可能会造成资源无法及时释放的问题。</p></li></ul><p>本实例中实现服务器负载均衡的功能时应用了单例模式，以保证每次都使用唯一的任务分配实例挑选服务器并分配任务。</p><p><strong>关键技术</strong></p><p>（1）在 LoadBalancer 类中创建一个类型为 LoadBalancer 的静态变量 Balancer，代码如下：</p><pre class="brush:java;toolbar:false">private&nbsp;static&nbsp;LoadBalancer&nbsp;Balancer;</pre><p>（2）在 LoadBalancer 类中创建一个返回类型为 LoadBalancer 引用类型的静态方法 GetLoadBalancer()，在该方法中，首先判断静态变量 Balancer 是否为空。如果为空，调用 LoadBalancer 类的构造函数创建 LoadBalancer类的实例对象；如果静态变量 Balancer 不为空，则在方法中直接返回该变量。代码如下：</p><pre class="brush:java;toolbar:false">public&nbsp;static&nbsp;synchronized&nbsp;LoadBalancer&nbsp;GetLoadBalancer()
{
if&nbsp;(Balancer==null)
Balancer&nbsp;=&nbsp;new&nbsp;LoadBalancer();
return&nbsp;Balancer;
}</pre><p>（3）隐藏 LoadBalancer 类的构造函数，即将构造函数的成员访问修饰符更改为 protected，强制用户只能通过 GetLoadBalancer()方法这个唯一的入口创建 LoadBalancer 类的实例对象。代码如下：</p><pre class="brush:java;toolbar:false">protected&nbsp;LoadBalancer()
//构造函数
{
ArrayList_Server.add(&quot;服务器&nbsp;I&quot;);
ArrayList_Server.add(&quot;服务器&nbsp;II&quot;);
ArrayList_Server.add(&quot;服务器&nbsp;III&quot;);
ArrayList_Server.add(&quot;服务器&nbsp;IV&quot;);
ArrayList_Server.add(&quot;服务器&nbsp;V&quot;);
}</pre><p><strong>设计过程</strong></p><p>下面利用 Singleton 模式实现负载均衡实例对象。在负载均衡模型中，有多台服务器可提供服务，任务分配器随机挑选一台服务器提供服务，以确保任务均衡（实际情况比这个复杂得多）。这里，任务分配实例只能有一个，负责挑选服务器并分配任务。</p><p>程序主要代码如下：</p><pre class="brush:java;toolbar:false">import&nbsp;java.util.*;
class&nbsp;LoadBalancer
{
private&nbsp;static&nbsp;LoadBalancer&nbsp;Balancer;
private&nbsp;ArrayList&nbsp;ArrayList_Server&nbsp;=&nbsp;new&nbsp;ArrayList();
private&nbsp;Random&nbsp;random&nbsp;=&nbsp;new&nbsp;Random();
protected&nbsp;LoadBalancer()
//构造函数
{
ArrayList_Server.add(&quot;服务器&nbsp;I&quot;);
ArrayList_Server.add(&quot;服务器&nbsp;II&quot;);
ArrayList_Server.add(&quot;服务器&nbsp;III&quot;);
ArrayList_Server.add(&quot;服务器&nbsp;IV&quot;);
ArrayList_Server.add(&quot;服务器&nbsp;V&quot;);
}
//创建实例的唯一入口
public&nbsp;static&nbsp;synchronized&nbsp;LoadBalancer&nbsp;GetLoadBalancer()
{
if&nbsp;(Balancer==null)
Balancer&nbsp;=&nbsp;new&nbsp;LoadBalancer();
return&nbsp;Balancer;
}
public&nbsp;String&nbsp;Server()
{
Object&nbsp;array[]&nbsp;=&nbsp;ArrayList_Server.toArray();
return&nbsp;array[random.nextInt(array.length)].toString();
}
}
public&nbsp;class&nbsp;SingletonApp
{
public&nbsp;static&nbsp;void&nbsp;main(String[]&nbsp;args)
{
LoadBalancer&nbsp;b1&nbsp;=&nbsp;LoadBalancer.GetLoadBalancer();
//创建类的实例
LoadBalancer&nbsp;b2&nbsp;=&nbsp;LoadBalancer.GetLoadBalancer();
LoadBalancer&nbsp;b3&nbsp;=&nbsp;LoadBalancer.GetLoadBalancer();
LoadBalancer&nbsp;b4&nbsp;=&nbsp;LoadBalancer.GetLoadBalancer();
if&nbsp;((b1&nbsp;==&nbsp;b2)&nbsp;&amp;&amp;&nbsp;(b2&nbsp;==&nbsp;b3)&nbsp;&amp;&amp;&nbsp;(b3&nbsp;==&nbsp;b4))
//判断实例是否相同
System.out.println(&quot;同步运行相同的实例对象&quot;);
System.out.println(b1.Server());
System.out.println(b2.Server());
System.out.println(b3.Server());
System.out.println(b4.Server());
}
}</pre><p><br/></p><p><strong><br/></strong><br/></p>', '2014-06-06', '在某种程度上，单例（Singleton）模式是限制而不是改进类的创建。单例模式可以保证一个类有且只有一个实例，并提供一个访问它的全局访问点。在程序设计过程中，有很多情况需要保证一个类只有一个实例。', '103', null, null, '1', '设计模式', '设计模式-责任型模式-单例模式', '0', '29', '0', '2014-06-06', '5', null);
INSERT INTO "public"."cms_article" VALUES ('57', 'black', '<p><strong>实例说明</strong></p><p>建造者（Builder）模式可以将一个产品的内部表象与产品的生成过程分割开来，从而可以使一个建造过程生成具有不同内部表象的产品对象。</p><p>建造者模式的性质：</p><p>&nbsp;&nbsp;&nbsp;&nbsp;1.一个对象都会有一些比较重要的性质，在它们没有恰当的值之前，对象不能作为一个完整的产品使用。</p><p>&nbsp;&nbsp;&nbsp;&nbsp;例如，一个 Email 有发件人地址、收件人地址、主题、内容和附件等部分，如果收件人地址未被赋值，那么这个 Email 是不能发出的。</p><p>&nbsp;&nbsp;&nbsp;&nbsp;2.一个对象的一些性质必须按照某个顺序赋值才有意义。在某个性质没有赋值之前，另一个性质无法赋值，这样性质本身的建造涉及到复杂的商业逻辑。</p><p>因此，对象相当于一个待建造的产品，而对象的这些性质相当于产品的零件，建造产品的过程就是组合零</p><p>件的过程。由于组合零件的过程很复杂，因此这些“零件”的组合过程往往被“外部化”到一个称为建造者的</p><p>对象中，建造者返还给客户端的是一个全部零件都建造完毕的产品对象。</p><p>在以下情况下应当使用建造者模式：<br/></p><p>&nbsp;&nbsp;&nbsp;&nbsp;1.需要生成的产品对象有复杂的内部结构。</p><p>&nbsp;&nbsp;&nbsp;&nbsp;2.需要生成的产品对象的属性相互依赖，建造者模式可以强迫生成顺序。</p><p>&nbsp;&nbsp;&nbsp;&nbsp;3.在对象创建过程中会用到系统中的一些其他对象，这些对象在产品对象的创建过程中不易得到。</p><p>&nbsp;&nbsp;&nbsp;&nbsp;4.建造者模式的使用使得产品的内部表象可以独立地变化，客户端不必知道产品内部组成的细节。</p><p>&nbsp;&nbsp;&nbsp;&nbsp;5.每一个“建造者”都相对独立，而与其他的“建造者”无关。</p><p>&nbsp;&nbsp;&nbsp;&nbsp;6.使用该模式建造的最终产品更易于控制。本实例将应用建造者模式分别建造小汽车对象和摩托车对象，并显示建造的内容。</p><p><strong>关键技术</strong></p><p>应用建造者模式之前，必须知道建造者模式的优点。该模式具有以下优点：</p><p>&nbsp;&nbsp;&nbsp;&nbsp;1.可以使得产品内部的表象独立变化。在原来的工厂方法模式中，产品内部的表象是由产品自身来决定的；而在建造者模式中，则“外部化”为由建造者来负责。这样定义一个新的具体建造者角 &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;色就可以改变产品的内部表象，符合“开闭原则”。</p><p>&nbsp;&nbsp;&nbsp;&nbsp;2.使得客户不需要知道太多产品内部的细节。它将复杂对象的组建和表示方式封装在一个具体的建造者角色中，而且由指导者协调建造者角色来得到具体的产品实例。</p><p>&nbsp;&nbsp;&nbsp;&nbsp;3.每一个具体建造者角色是毫无关系的。</p><p>&nbsp;&nbsp;&nbsp;&nbsp;4.建造者模式可以对复杂产品的创建进行更加精细的控制。产品的组成是由指导者角色调用具体建造者角色来逐步完成的，所以比起其他创建型模式，能够更好地反映产品的构造过程。</p><p><strong>设计过程</strong></p><p>（1）在 main()方法中分别创建工厂类、小汽车建造类和摩托车建造类的实例对象，使用工厂对象分别建造</p><p>小汽车对象和摩托车对象，并显示建造的内容。代码如下：</p><pre class="brush:java;toolbar:false">public&nbsp;class&nbsp;BuilderApp
{
public&nbsp;static&nbsp;void&nbsp;main(String[]&nbsp;args)
{
//创建摩托车
MotorCycleBuilder&nbsp;builder1&nbsp;=&nbsp;new&nbsp;MotorCycleBuilder();
Vehicle&nbsp;director1&nbsp;=&nbsp;new&nbsp;Vehicle(builder1);
//创建小汽车
CarBuilder&nbsp;builder2&nbsp;=&nbsp;new&nbsp;CarBuilder();
Vehicle&nbsp;director2&nbsp;=&nbsp;new&nbsp;Vehicle(builder2);
director1.construct();
director2.construct();
//显示创建产品
builder1.shop.show();
builder2.shop.show();
}
}</pre><p>（2）定义交通工具建造的接口（包含 Vehicle 属性），声明实现建造过程的各个方法。代码如下：</p><pre class="brush:java;toolbar:false">interface&nbsp;VehicleBuilder
//建造者
{
void&nbsp;BuildFrame();
void&nbsp;BuildEngine();
void&nbsp;BuildWheels();
void&nbsp;BuildDoors();
void&nbsp;Buider();
}</pre><p>（3）定义摩托车建造类，继承交通工具建造抽象类，并实现抽象类中定义的方法。代码如下：</p><pre class="brush:java;toolbar:false">class&nbsp;MotorCycleBuilder&nbsp;implements&nbsp;VehicleBuilder
//具体建造者&nbsp;1
{
Shop&nbsp;shop&nbsp;=&nbsp;new&nbsp;Shop();
public&nbsp;void&nbsp;Buider()
{
shop.object(&quot;type&quot;,&nbsp;&quot;摩托车&quot;);
}
public&nbsp;void&nbsp;BuildFrame()
{
shop.object(&quot;frame&quot;,&quot;摩托车&nbsp;框架&quot;);
}
public&nbsp;void&nbsp;BuildEngine()
{
shop.object(&quot;engine&quot;,&quot;500&nbsp;毫升&quot;);
}
public&nbsp;void&nbsp;BuildWheels()
{
shop.object(&quot;wheels&quot;,&nbsp;&quot;2&nbsp;个车轮&quot;);
}
public&nbsp;void&nbsp;BuildDoors()
{
shop.object(&quot;doors&quot;,&quot;没有车门&quot;);
}
}</pre><p>（4）定义小汽车建造类，继承交通工具建造抽象类，并实现抽象类中定义的方法。代码如下：</p><pre class="brush:java;toolbar:false">class&nbsp;CarBuilder&nbsp;implements&nbsp;VehicleBuilder
//具体建造者&nbsp;2
{
Shop&nbsp;shop&nbsp;=&nbsp;new&nbsp;Shop();
public&nbsp;void&nbsp;Buider(){
shop.object(&quot;type&quot;,&quot;轿车&quot;);
}
public&nbsp;void&nbsp;BuildFrame()
{
shop.object(&quot;frame&quot;,&quot;轿车&nbsp;框架&quot;);
}
public&nbsp;void&nbsp;BuildEngine()
{
shop.object(&quot;engine&quot;,&quot;2500&nbsp;毫升&quot;);
}
public&nbsp;void&nbsp;BuildWheels()
{
shop.object(&quot;wheels&quot;,&nbsp;&quot;4&nbsp;个车轮&quot;);
}
public&nbsp;void&nbsp;BuildDoors()
{
shop.object(&quot;doors&quot;,&quot;4&nbsp;个车门&quot;);
}
}</pre><p>（5）定义交通工具类，该类主要实现记录并显示交通工具的建造内容。代码如下：<br/></p><pre class="brush:java;toolbar:false">class&nbsp;Vehicle
{
private&nbsp;VehicleBuilder&nbsp;builder;
public&nbsp;Vehicle(&nbsp;VehicleBuilder&nbsp;builder&nbsp;)
{
this.builder&nbsp;=&nbsp;builder;
}
//这是将部件装成汽车的过程
public&nbsp;void&nbsp;construct()
{
builder.BuildFrame();
builder.BuildEngine();
builder.BuildDoors();
builder.BuildWheels();
builder.Buider();
}
}</pre><p>（6）定义建造交通工具的工厂类，在工厂类中规定交通工具的建造步骤。代码如下：</p><pre class="brush:java;toolbar:false">class&nbsp;Shop
{
String&nbsp;type;
Hashtable&nbsp;parts&nbsp;=&nbsp;new&nbsp;Hashtable();
public&nbsp;void&nbsp;object&nbsp;(String&nbsp;key,&nbsp;String&nbsp;value)
{
parts.put(key&nbsp;,&nbsp;value);
}
public&nbsp;void&nbsp;show()&nbsp;{
System.out.println(&quot;--------&quot;&nbsp;+&nbsp;parts.get(&quot;type&quot;)+&quot;--------&quot;);
System.out.println(&quot;框架&nbsp;：&nbsp;&quot;&nbsp;+&nbsp;parts.get(&quot;frame&quot;));
System.out.println(&quot;发动机&nbsp;：&nbsp;&quot;&nbsp;+&nbsp;parts.get(&quot;engine&quot;));
System.out.println(&quot;车轮数量：&nbsp;&quot;&nbsp;+&nbsp;parts.get(&quot;wheels&quot;));
System.out.println(&quot;车门数量：&nbsp;&quot;&nbsp;+&nbsp;parts.get(&quot;doors&quot;));
}
}</pre><p><br/></p>', '2014-06-06', '建造者（Builder）模式可以将一个产品的内部表象与产品的生成过程分割开来，从而可以使一个建造过程生成具有不同内部表象的产品对象。', '106', null, null, '1', '设计模式', '设计模式-责任型模式-建造者模式', '0', '29', '0', '2014-06-06', '5', '5');
INSERT INTO "public"."cms_article" VALUES ('58', 'black', '<p><span style="font-family:宋体">&nbsp; &nbsp; 在大学的时候，天天学习着一些基本的技术知识，总想有一天成为所谓的“高手”，但是学到最后才发现，之前学的很多东西怎么不会用，或者是该用到哪儿，在迷迷糊糊中知道了很多技术，但是就是不知道技术的具体内容，所以感觉我们知道很多，其实我们什么都不会。</span></p><p>&nbsp; &nbsp;&nbsp;<span style="font-family:宋体">到了开始工作的时候，我们开始回忆以前学习的东西，总认为之前学习的知识是很牛逼的知识，总想在工作之余把那些技术拿出来倒腾一下，然后倒腾出一些自认为很有成就感的技术成果，等到一段时间过后，我们才反省过来，我做出来的这个东西有用吗？</span> </p><p>&nbsp; &nbsp;&nbsp;<span style="font-family:宋体">我高中有一个同学，在读高中的时候对计算机非常痴迷，天天除了看课本就是关注电脑杂志以及电脑有关的书籍，每天活在计算机的世界里面。在大家都会认为他大学一定会学习计算机相关的专业时，他却没有选择计算机专业，而是转向了法律。在一次同学聚会上面，问起缘由时，他说：“计算机是他当时的爱好，如果他当时继续选择学习计算机相关专业，他有一天终会因为它而没有啥子兴趣的。”当时听到这个我心里顿生不屑之意，用鄙视的心里打量了一下他。在回来寂静的环境里面一个人思考的时候，我在想，我喜欢什么，我该做什么，我现在所做的技术能给我带来什么。再仔细想想那位同学，他有着一份很好的律师事务的工作，然后偶尔在电脑旁折腾一下个人的网站，并且把自己所知道的法律纠纷用普通的语言放在的网络里面，让更多的法律爱好者通过他的博客了解到法律。</span></p><p>&nbsp; &nbsp;&nbsp;<span style="font-family:宋体">而我们呢？天天和计算机共处事，假如有一天，我们的朋友问及我们现在的工作时，问起我们平时一般做什么时，我们能拿出什么东西来告诉他们我们做过什么？我们在公司敲了代码？我们在公司学习了很多新奇的技术？可到了他们眼里，他们能知道什么？他们会问：“代码是什么？什么是新奇的技术？”其实只要你说了几句，你便和他们没有共同的语言了。因为很多不懂技术的人只会考虑事情的结果，而技术人员往往很在意过程，结果只是一个产物而已，技术与人打交道时完全不同，技术人员注重过程，喜欢专研，而非技术人员注重事情结果，过程只针对他们做人。</span></p><p>&nbsp; &nbsp;&nbsp;<span style="font-family:宋体">我们在技术上面遇到过很多棘手的问题，有时解决的头疼，解决的很疲惫，我们只在乎解决了那一刻的轻松，我们会完全忘了解决的那种痛苦。在解决中，我们有时会思考，技术到底能给我们带来什么。我该从事技术工作，还是从事非技术工作，我们该转行吗？</span></p><p>&nbsp; &nbsp;&nbsp;<span style="font-family:宋体">我身边的很多同学总认为很多优秀的同学拿着高工资是因为他的技术很牛逼，然后自己平时拼命的学习技术，但是学完了发现自己还是不如别人，自己的工资还是没有别人的高。</span></p><p><span style="font-family:宋体">很多同学可以做出很多东西，可以运用很多新颖的技术做出很多很炫的东西，但是他们却不知道技术的精度和深度。我有一个同学，高深技术之类的什么都不会，但是他就会</span>seo<span style="font-family:宋体">，而且做</span>seo<span style="font-family:宋体">也就一年的时间，但是他每个月能拿到</span>8k<span style="font-family:宋体">的样子，而且还是在成都一个二流的公司，正是因为他只会</span>seo<span style="font-family:宋体">，同时其他技术都不做，每天就研究一些如何让自己的网站做到百度搜索头条，想着用户怎么输入才会找到自己的关键词，更神奇的是，他大学学的是心理学专业。从这里我们不难看出，技术只是一门工具，真正要我们使用好这个工具的是我们能拿这个工具来做什么，工具可以产生任何东西，但是工具能否精雕细琢出一个产物还得看我们个人的修为。</span></p><p>&nbsp; &nbsp;&nbsp;<span style="font-family:宋体">技术到底是什么，我一直在思考。我拿技术来做什么，我也在思考。夜已深，</span>session<span style="font-family:宋体">多半过时了，明天来发表吧</span>~~~</p><p style="text-align: center;">&nbsp; &nbsp;&nbsp;<img src="/upload/20140609/35551402293458435.gif" title="meileche.gif"/></p><p><br/></p>', '2014-06-09', '技术到底是什么，我一直在思考。我拿技术来做什么，我也在思考。', '173', null, null, '1', '技术,程序员,思考,技术是什么', '技术到底该是什么', '0', '34', '0', '2014-06-09', '8', null);
INSERT INTO "public"."cms_article" VALUES ('59', 'black', '<p><strong>实例说明</strong></p><p style="text-indent: 2em;">什么是中介者（Mediator）模式？笔者先通过一个实际生活中的例子进行介绍。例如，卖房者和买房者一般都通过房屋中介公司进行房产交易，卖房者先到中介公司进行售房登记，买房者到中介公司查询到满意的房源信息后，通知中介公司看房，中介公司再通知卖房者……，在整个房屋买卖的过程中，买房者和卖房者不直接联系，而是通过中介公司。通过中介公司进行房屋买卖是一种标准的中介者模式。</p><p style="text-indent: 0em;"><strong>关键技术</strong></p><p style="text-indent: 2em;">应用中介者模式之前必须掌握中介者模式的概念及适用性，下面分别介绍。</p><p style="text-indent: 2em;">(1).中介者模式的概念</p><p style="text-indent: 2em;">用一个中介对象来封装一系列的对象交互。中介者使各对象不需要显式地相互引用，从而使其耦合松散，而且可以独立地改变它们之间的交互。</p><p style="text-indent: 2em;"><span style="text-indent: 32px;">(2).</span><span style="text-indent: 32px;">中介者模式的适用性,在下列情况下使用中介者模式</span></p><ul class=" list-paddingleft-2" style="list-style-type: disc;"><ul class=" list-paddingleft-2" style="list-style-type: square;"><li><p dir="ltr" style="text-indent: 0em;"><span style="text-indent: 32px;">一组对象以定义良好但是复杂的方式进行通信，产生的相互依赖关系结构混乱且难以理解。</span></p></li><li><p dir="ltr" style="text-indent: 0em;"><span style="text-indent: 32px;">一个对象引用其他很多对象并且直接与这些对象通信，导致难以复用该对象。</span></p></li><li><p dir="ltr" style="text-indent: 0em;"><span style="text-indent: 32px;">想定制一个分布在多个类中的行为，而又不想生成太多的子类。</span></p></li></ul></ul><p style="text-indent: 0em;"><strong><span style="text-indent: 32px;">设计过程</span></strong></p><p style="text-indent: 2em;"><span style="text-indent: 32px;">(1).定义中介者的抽象类 Mediator，并声明发送消息方法 Send()。代码如下:</span></p><pre class="brush:java;toolbar:false">abstract&nbsp;class&nbsp;Mediator
//中介者抽象类
{
public&nbsp;abstract&nbsp;void&nbsp;Send(String&nbsp;message,&nbsp;Colleague&nbsp;colleague);&nbsp;//发送消息的方法
}</pre><p style="text-indent: 2em;"><span style="text-indent: 32px;"><span style="text-indent: 32px;">(2).</span><span style="text-indent: 32px;">定义具体的中介者类 ConcreteMediator，继承 Mediator 类。代码如下：</span></span></p><pre class="brush:java;toolbar:false">class&nbsp;ConcreteMediator&nbsp;extends&nbsp;Mediator
//具体的中介者类
{
ConcreteColleague1&nbsp;colleague1;
ConcreteColleague2&nbsp;colleague2;
public&nbsp;void&nbsp;Send(String&nbsp;message,Colleague&nbsp;colleague)
//重写发送消息的方法，根据对象作出选择判断，通知对象
{
if&nbsp;(colleague&nbsp;==&nbsp;colleague1)
{
colleague2.Notify(message);
}
else
{
colleague1.Notify(message);
}
}
}</pre><p style="text-indent: 2em;"><span style="text-indent: 32px;"><span style="text-indent: 32px;"><span style="text-indent: 32px;">(3).</span><span style="text-indent: 32px;">定义同事抽象类 Colleague，主要实现在构造函数中获得中介者类。代码如下：</span></span></span></p><pre class="brush:java;toolbar:false">abstract&nbsp;class&nbsp;Colleague
//同事抽象类
{
protected&nbsp;Mediator&nbsp;mediator;
public&nbsp;Colleague(Mediator&nbsp;mediator)
//构造函数，得到中介者
{
this.mediator&nbsp;=&nbsp;mediator;
}
}</pre><p style="text-indent: 2em;"><span style="text-indent: 32px;"><span style="text-indent: 32px;"><span style="text-indent: 32px;"><span style="text-indent: 32px;">(4).</span><span style="text-indent: 32px;">定义第 1 个具体的同事类，并实现发送消息和接收消息的方法。代码如下：</span></span></span></span></p><pre class="brush:java;toolbar:false">class&nbsp;ConcreteColleague1&nbsp;extends&nbsp;Colleague
//具体的同事类&nbsp;1
{
public&nbsp;ConcreteColleague1(Mediator&nbsp;mediator)
{super(mediator);}
public&nbsp;void&nbsp;Send(String&nbsp;message)
{
mediator.Send(message,&nbsp;this);
//发送消息时通常是中介者发送出去的
}
public&nbsp;void&nbsp;Notify(String&nbsp;message)
{
System.out.println(&quot;同事&nbsp;A&nbsp;收到消息：&quot;&nbsp;+&nbsp;message);
}
}</pre><p style="text-indent: 2em;"><span style="text-indent: 32px;"><span style="text-indent: 32px;"><span style="text-indent: 32px;"><span style="text-indent: 32px;"><span style="text-indent: 32px;">(5).</span><span style="text-indent: 32px;">定义第 2 个具体的同事类，并实现发送消息和接收消息的方法。代码如下：</span></span></span></span></span></p><p style="text-indent: 2em;"><span style="text-indent: 32px;"><span style="text-indent: 32px;"><span style="text-indent: 32px;"><span style="text-indent: 32px;"><span style="text-indent: 32px;"></span></span></span></span></span></p><pre class="brush:java;toolbar:false">class&nbsp;ConcreteColleague2&nbsp;extends&nbsp;Colleague
//具体的同事类&nbsp;2
{
public&nbsp;ConcreteColleague2(Mediator&nbsp;mediator)
{super(mediator);}
public&nbsp;void&nbsp;Send(String&nbsp;message)
{
mediator.Send(message,&nbsp;this);
}
public&nbsp;void&nbsp;Notify(String&nbsp;message)
{
System.out.println(&quot;同事&nbsp;B&nbsp;收到消息：&nbsp;&quot;&nbsp;+&nbsp;message);
}
}</pre><p style="text-indent: 2em;"><span style="text-indent: 32px;"><span style="text-indent: 32px;"><span style="text-indent: 32px;"><span style="text-indent: 32px;"><span style="text-indent: 32px;">(6).</span></span></span></span></span>在 main()方法中，分别创建中介对象和两个同事对象，然后让两个同事对象与中介对象互相了解，最后同事 B 发送消息，同事 A 回复消息（都是通过中介对象转发）。代码如下：</p><p style="text-indent: 2em;"><span style="text-indent: 32px;"><span style="text-indent: 32px;"><span style="text-indent: 32px;"><span style="text-indent: 32px;"><span style="text-indent: 32px;"></span></span></span></span></span></p><pre class="brush:java;toolbar:false">class&nbsp;Program
{
public&nbsp;static&nbsp;void&nbsp;main(String[]&nbsp;args)
{
ConcreteMediator&nbsp;m&nbsp;=&nbsp;new&nbsp;ConcreteMediator();
//创建具体中介者对象
ConcreteColleague1&nbsp;c1&nbsp;=&nbsp;new&nbsp;ConcreteColleague1(m);
//让两个具体的同事类认识中介者对象
ConcreteColleague2&nbsp;c2&nbsp;=&nbsp;new&nbsp;ConcreteColleague2(m);
m.colleague1&nbsp;=&nbsp;c1;
//让中介者对象认识同事对象
m.colleague2&nbsp;=&nbsp;c2;
c1.Send(&quot;How&nbsp;are&nbsp;you?&quot;);
//具体同事对象的发送信息都是通过中介者转发的
c2.Send(&quot;Fine,&nbsp;thanks&quot;);
}
}</pre><p style="text-indent: 2em;"><br/></p>', '2014-06-10', '什么是中介者（Mediator）模式？笔者先通过一个实际生活中的例子进行介绍。例如，卖房者和买房者一般
都通过房屋中介公司进行房产交易，卖房者先到中介公司进行售房登记，买房者到中介公司查询到满意的房源
信息后，通知中介公司看房，中介公司再通知卖房者……，在整个房屋买卖的过程中，买房者和卖房者不直接联系，而是通过中介公司。通过中介公司进行房屋买卖是一种标准的中介者模式。', '234', null, null, '1', '设计模式', '设计模式-责任型模式-中介者模式', '0', '29', '0', '2014-06-10', '5', null);
INSERT INTO "public"."cms_article" VALUES ('60', 'black', '<p><strong>实例说明</strong></p><p style="text-indent: 2em;">什么是责任链模式？笔者先通过一个实际生活中的例子进行介绍。</p><p dir="ltr" style="text-indent: 2em;">例如，笔者为明日公司的一名员工，由于特殊原因需要请 7 天假。首先到 Java 部门经理那去请，部门经理说我只有权准许你请一天假；于是笔者又到总监那去请，总监说我只有权准许你请 3 天假；最后没办法，只能到总经理那去请，结果总经理同意了。</p><p style="text-indent: 2em;">以上的请假流程可以使用责任链模式来实现，部门经理、总监、总经理都是责任链中的一环，他们都有自己的责任（如总监只有权准许下属请 3 天假），如果在自己责任范围内可以直接处理，如果不在自己责任范围内可以报送上级处理。</p><p dir="ltr" style="text-indent: 2em;">本实例主要演示应用责任链模式实现笔者的请假流程，</p><p style="text-indent: 0em;"><strong>关键技术</strong></p><p style="text-indent: 2em;">应用责任链模式之前必须掌握责任链模式的概念和适用性，下面分别介绍。<strong><br/></strong></p><p style="text-indent: 2em;">（1）责任链模式的概念</p><p style="text-indent: 2em;">责任链模式是使多个对象都有机会处理请求，从而避免请求的发送者和接收者之间的耦合关系。将这些对象连成一条链，并沿着这条链传递该请求，直到有一个对象处理它为止。</p><p style="text-indent: 2em;">（2）责任链模式的适用性，满足以下条件时可以使用责任链模式：</p><ul class=" list-paddingleft-2" style="list-style-type: disc;"><ul class=" list-paddingleft-2" style="list-style-type: square;"><li><p style="text-indent: 0em;">有多个对象可以处理一个请求，哪个对象处理该请求运行时自动确定。</p></li><li><p style="text-indent: 0em;">想在不明确指定接收者的情况下，向多个对象中的一个提交一个请求。</p></li><li><p style="text-indent: 0em;">可处理一个请求的对象集合应被动态指定。</p></li></ul></ul><p style="text-indent: 0em;"><strong style="white-space: normal;">设计过程</strong></p><p style="text-indent: 2em;"><strong style="white-space: normal;"></strong></p><p style="text-indent: 2em;">（1）定义申请类 Request，包含申请类别（如请假）、申请内容和申请数量（如请假天数）3 个属性。代码如下：</p><pre class="brush:java;toolbar:false">class&nbsp;Request
//申请
{
public&nbsp;String&nbsp;RequestType&nbsp;;
//申请类别
public&nbsp;String&nbsp;RequestContent;
//申请内容
public&nbsp;int&nbsp;RequestNumber;
//申请数量
public&nbsp;Request(String&nbsp;requestType,&nbsp;String&nbsp;requestContent,&nbsp;int&nbsp;requestNumber)
{
this.RequestType&nbsp;=&nbsp;requestType;
this.RequestContent&nbsp;=&nbsp;requestContent;
this.RequestNumber&nbsp;=&nbsp;requestNumber;
}
}</pre><p style="text-indent: 2em;">（2）定义管理者抽象类，该类主要实现设置管理者的上级和处理请求。代码如下：</p><pre class="brush:java;toolbar:false">abstract&nbsp;class&nbsp;Manager
//管理者抽象类
{
protected&nbsp;String&nbsp;name;
protected&nbsp;Manager&nbsp;superior;
public&nbsp;Manager(String&nbsp;name)
{&nbsp;this.name&nbsp;=&nbsp;name;&nbsp;}
public&nbsp;void&nbsp;SetSuperior(Manager&nbsp;superior)
//设置管理者的上级
{
this.superior&nbsp;=&nbsp;superior;
}
abstract&nbsp;public&nbsp;void&nbsp;RequestApplications(Request&nbsp;request);</pre><p style="text-indent: 2em;">（3）定义部门经理类 CommonManager，继承 Manager 类，并实现 RequestApplications()方法。代码如下：</p><pre class="brush:java;toolbar:false">class&nbsp;CommonManager&nbsp;extends&nbsp;Manager
//部门经理
{
public&nbsp;CommonManager(String&nbsp;name)
{
super(name);
}
public&nbsp;void&nbsp;RequestApplications(Request&nbsp;request)
{
if&nbsp;(request.RequestType&nbsp;==&nbsp;&quot;请假&quot;&nbsp;&amp;&amp;&nbsp;request.RequestNumber&nbsp;&lt;=&nbsp;1)
//部门经理有权准许下属&nbsp;1&nbsp;天内的假期
{
System.out.println(&nbsp;name&nbsp;+&quot;:&quot;+&nbsp;request.RequestContent+&nbsp;&quot;&nbsp;数量&quot;+&nbsp;request.RequestNumber+&quot;&nbsp;被批准&quot;);
}
else
{
if&nbsp;(superior&nbsp;!=&nbsp;null)
{
superior.RequestApplications(request);
//其余的申请需转到上级
}
}
}
}</pre><p style="text-indent: 2em;">（4）定义总监类 Majordomo，继承 Manager 类，并实现 RequestApplications()方法。代码如下：</p><pre class="brush:java;toolbar:false">class&nbsp;Majordomo&nbsp;extends&nbsp;Manager
//总监
{
public&nbsp;Majordomo(String&nbsp;name)
{
super(name);
}
public&nbsp;void&nbsp;RequestApplications(Request&nbsp;request)
{
if&nbsp;(request.RequestType&nbsp;==&nbsp;&quot;请假&quot;&nbsp;&amp;&amp;&nbsp;request.RequestNumber&nbsp;&lt;=&nbsp;3)
//总监有权准许下属&nbsp;3&nbsp;天内的假期
{
System.out.println(&nbsp;name&nbsp;+&quot;:&quot;+&nbsp;request.RequestContent+&nbsp;&quot;&nbsp;数量&quot;+&nbsp;request.RequestNumber+&quot;&nbsp;被批准&quot;);
}
else
{
if&nbsp;(superior&nbsp;!=&nbsp;null)
{
superior.RequestApplications(request);
//其余的申请需转到上级
}
}
}
}</pre><p style="text-indent: 2em;">（5）定义总经理类 GeneralManager，继承 Manager 类，并实现 RequestApplications()方法。代码如下：</p><pre class="brush:java;toolbar:false">class&nbsp;GeneralManager&nbsp;extends&nbsp;Manager
//总经理
{
public&nbsp;GeneralManager(String&nbsp;name)
{
super(name);
}
public&nbsp;void&nbsp;RequestApplications(Request&nbsp;request)
{
if&nbsp;(request.RequestType&nbsp;==&nbsp;&quot;请假&quot;)
//总经理有权准许下属任意天的假期
{
System.out.println(&nbsp;name&nbsp;+&quot;:&quot;+&nbsp;request.RequestContent+&nbsp;&quot;&nbsp;数量&quot;+&nbsp;request.RequestNumber+&quot;&nbsp;被批准&quot;);
}
else&nbsp;if&nbsp;(request.RequestType&nbsp;==&nbsp;&quot;加薪&quot;&nbsp;&amp;&amp;&nbsp;request.RequestNumber&nbsp;&lt;=&nbsp;1000)&nbsp;//加薪在&nbsp;1000&nbsp;以内,经理不心疼
{
System.out.println(&nbsp;name&nbsp;+&quot;:&quot;+&nbsp;request.RequestContent+&nbsp;&quot;&nbsp;数量&quot;+&nbsp;request.RequestNumber+&quot;&nbsp;被批准&quot;);
}
else
//要求太高，不能批准
{
System.out.println(&nbsp;name&nbsp;+&quot;:&quot;+&nbsp;request.RequestContent+&nbsp;&quot;&nbsp;数量&quot;+&nbsp;request.RequestNumber+&quot;&nbsp;被批准&quot;);
}
}
}</pre><p style="text-indent: 2em;">（6）在 main()方法中，分别创建部门经理、总监和总经理类的实例，然后设置部门经理的上级是总监，总监的上级是总经理，最后分别申请 1 天、3 天和 7 天假。代码如下：</p><pre class="brush:java;toolbar:false">class&nbsp;Program
{
public&nbsp;static&nbsp;void&nbsp;main(String[]&nbsp;args)
{
CommonManager&nbsp;com&nbsp;=&nbsp;new&nbsp;CommonManager(&quot;房大伟&quot;);
//部门经理类
Majordomo&nbsp;maj&nbsp;=&nbsp;new&nbsp;Majordomo(&quot;宋坤&quot;);
//总监类
GeneralManager&nbsp;gen&nbsp;=&nbsp;new&nbsp;GeneralManager(&quot;赛奎春&quot;);
//总经理类
com.SetSuperior(maj);
//设置部门经理的上级是总监，可根据实际情况更改设置
maj.SetSuperior(gen);
//设置总监的上级是总经理
Request&nbsp;req1&nbsp;=&nbsp;new&nbsp;Request(&quot;请假&quot;,&nbsp;&quot;云峰要请假&quot;,&nbsp;1);
//申请&nbsp;1&nbsp;天假
com.RequestApplications(req1);
//上级领导处理
Request&nbsp;req2&nbsp;=&nbsp;new&nbsp;Request(&quot;请假&quot;,&nbsp;&quot;云峰要请假&quot;,&nbsp;3);
com.RequestApplications(req2);
Request&nbsp;req3&nbsp;=&nbsp;new&nbsp;Request(&quot;请假&quot;,&nbsp;&quot;云峰要请假&quot;,&nbsp;7);
com.RequestApplications(req3);
}
}</pre>', '2014-06-10', '例如，笔者为明日公司的一名员工，由于特殊原因需要请 7 天假。首先到 Java 部门经理那去请，部门经理说我只有权准许你请一天假；于是笔者又到总监那去请，总监说我只有权准许你请 3 天假；最后没办法，只能到总经理那去请，结果总经理同意了。', '154', null, null, '1', '设计模式', '设计模式-责任型模式-责任链模式', '0', '29', '0', '2014-06-10', '5', null);
INSERT INTO "public"."cms_article" VALUES ('62', 'black', '<p style="text-indent: 2em;">tomcat在运行过程中，可能会出现宕机的情况，可以写一些shell脚本来定时监控tomcat的运行情况，如果挂了自动重启</p><p style="text-indent: 2em;">1.写一个脚本监控tomcat的运行情况</p><pre class="brush:bash;toolbar:false">#!/bin/sh
TomcatID=$(ps&nbsp;-ef&nbsp;|grep&nbsp;tomcat&nbsp;|grep&nbsp;-w&nbsp;&#39;tomcat7&#39;|grep&nbsp;-v&nbsp;&#39;grep&#39;|awk&nbsp;&#39;{print&nbsp;$2}&#39;)
if&nbsp;[&nbsp;$TomcatID&nbsp;-gt&nbsp;1&nbsp;]&nbsp;;&nbsp;then	#ff
echo&nbsp;&quot;tomcat&nbsp;isrunning&quot;&nbsp;
else&nbsp;
/etc/init.d/tomcat7&nbsp;restart;&nbsp;
fi&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#ifend</pre><p style="text-indent: 2em;">借鉴网上的被我简化了很多，另存为xxx.sh</p><p style="text-indent: 2em;">2.加入定时任务 crontab，运行命令<span style="color: rgb(255, 0, 0);">crontab -e</span> 在下边加入<span style="text-indent: 32px;">中加入以下<span style="text-indent: 32px; color: rgb(255, 0, 0);">*/5 *<span class="Apple-tab-span" style="white-space: pre;"></span> * * *&nbsp;/usr/ps/s1.sh</span>&nbsp;&nbsp;&nbsp;&nbsp;<span style="text-indent: 32px;">/usr/ps/s1.sh为你脚本的路径和名称<span style="text-indent: 32px;">*/5 *</span><span class="Apple-tab-span" style="text-indent: 32px; white-space: pre;"></span><span style="text-indent: 32px;">&nbsp;* * *表示没5分钟运行一次这个脚本，更多定时任务的了解请看<a href="http://my.oschina.net/junn/blog/138055" target="_blank" title="http://my.oschina.net/junn/blog/138055">http://my.oschina.net/junn/blog/138055</a>，然后重启cron ubantu下命令：sudo service cron restart</span></span></span></p>', '2014-06-25', 'tomcat在运行过程中，可能会出现宕机的情况，可以写一些shell脚本来定时监控tomcat的运行情况，如果挂了自动重启', '180', null, null, '1', 'linux,shell', 'linux监控tomcat运行情况如果宕机自动重启', '0', '32', '0', '2014-06-25', '5', '5');
INSERT INTO "public"."cms_article" VALUES ('63', 'black', '<p>&nbsp;&nbsp;&nbsp;&nbsp;生活充满了很多诱惑，我们身在一个风景区，却想着另外一个风景区。</p><p>&nbsp;&nbsp;&nbsp;&nbsp;我，一个普通大学毕业的程序员，在快毕业的时候，我很想找到一份工作，并且只想找到一份工作，一份关于计算机编程的工作，而且只能是Java编程的工作。现实却告诉我，我什么都不会，我很难找到一份3000块钱的工作。当学校在毕业的时候为了提升就业率，引进了很多技术培训机构，表面是以培训包就业的方式来吸引学生，当时的我也很心动，但是高昂的培训费用让我止步了，虽然口口声声说工作后每个月扣除一点工资就可以了，但是工资不是钱吗？于是我进入了一家很不入流的外包公司，进入公司不会查资料，不会开发工具的使用，基本属于啥都不会，但是正是因为这个不入流的公司，把我带进了程序员的行列，让我开始对编程有一些概括性的了解，同时这个公司使用的很多技术在以后的职业生涯中都用到过，当走过这么一段经历的时候，我才知道，那个不入流的公司是我的启蒙导师。<br/></p><p style="text-align: center;">&nbsp;&nbsp;&nbsp;&nbsp;<img src="/upload/20140627/21301403846232384.jpg" title="u=4266275130,2444578228&amp;fm=90&amp;gp=0.jpg"/></p><p>&nbsp;&nbsp;&nbsp;&nbsp;直到现在，我依然在想一个问题：我知道自己在做什么吗？<br/></p><p>&nbsp;&nbsp;&nbsp;&nbsp;我快毕业的时候，我很想找到一份程序员的工作，当我找到了一份程序员的工作的时候，我很想找一个大公司，大公司有我想要的东西，但是当我进入了一个大公司的时候，我发现生活很现实。当你有一份耕耘，但是得不到一份收获的时候，说明你已经进入了职场。什么叫做职场，就是当你有8000块钱的能力的时候，你只能拿着4000块钱的工资，当老板发现你的能力超过8000块钱的时候，他希望你的能力在16000块钱的时候给你8000块钱的工资，这就叫做职场。而我们只会闷着头做自己的事情，然后每天抱怨工作的不顺心，工资如何如何的低，但是每天早上醒来的时候，我们却发现我们不能离开这份工作，离开了我们的明天就很难度过。<br/></p><p>&nbsp;&nbsp;&nbsp;&nbsp;我每天敲着代码，但是我并不喜欢敲代码，我很想自己创业，但是我知道自己是没有这份能力。一个好的老板不会让你成为全才，当你成为全才的时候，就是老板失去你的时候，并且他又多了一个竞争对手，同时多了一分危机感。你说，哪个老板会干这么愚蠢的事情？<br/></p><p>&nbsp;&nbsp;&nbsp;&nbsp;我敲代码的时候喜欢思考，同时也是瞎想，我到底在做什么，我在敲代码？但是我又在偷懒，我不想敲代码。我想搞点别点，但是我又没有资源，假如我有资源我该多好，我可以慢慢做自己手头的资源，然后做多了自己就可以利用这些资源创业。但是当我有部分资源的时候，我发现创业也是打工，创业比给别人打工更累。这时，我又反思，我自己在做什么？<br/></p><p>&nbsp;&nbsp;&nbsp;&nbsp;我每天抱怨同事如何如何的不给力，公司如何如何的不好，工资如何如何的低。当我们自己开公司的时候，这些问题会存在吗？往往抱怨什么，说明自己缺什么，自己的能力在这些方面欠缺了。工资低说明你没体现出来，也可以说明你的能力不行，公司好不好不是你说了算，是客户说了算，客户给了钱就觉得公司好，客户不给钱可以说公司好，也可以说公司不好，客户只要结果，不需要过程，你生活在公司中，你做的事过程，客户不关心过程，客户只关心你的结果，所以你的抱怨对于公司来说很正常，并不是很重要。</p><p>&nbsp;&nbsp;&nbsp;&nbsp;生活怎样，我们能知道自己该做什么吗？在做什么吗？<br/></p>', '2014-06-27', '生活充满了很多诱惑，我们身在一个风景区，却想着另外一个风景区。', '164', null, null, '1', '生活,做什么,行业,it', '我们知道自己在做什么吗', '0', '34', '0', '2014-06-27', '8', null);
INSERT INTO "public"."cms_article" VALUES ('64', 'black', '<p style="text-indent: 2em;">在IE中使用window.location.href = &quot;xxx&quot;，会清空掉http中header[referer]的值，服务器端没法获取，解决办法动态创建一个a标签，再模拟一个点击事件：</p><pre class="brush:js;toolbar:false">function&nbsp;gotoUrl(url){&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;if(document.all){&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;var&nbsp;gotoLink&nbsp;=&nbsp;document.createElement(&#39;a&#39;);&nbsp;&nbsp;
&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;gotoLink&nbsp;.href&nbsp;=&nbsp;url;&nbsp;&nbsp;
&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;document.body.appendChild(gotoLink);&nbsp;&nbsp;
&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;gotoLink&nbsp;.click();&nbsp;&nbsp;
&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;}&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;else&nbsp;window.location.href&nbsp;=&nbsp;url;&nbsp;&nbsp;
}</pre><p style="text-indent: 2em;">万恶的IE<img src="/assets/comp/ueditor/dialogs/emotion/images/tsj/t_0004.gif"/></p>', '2014-07-08', '在IE中使用window.location.href = "xxx"，会清空掉http中header[referer]的值，服务器端没法获取，解决办法动态创建一个a标签，再。。', '130', null, null, '1', 'js', 'location.href在IE下清空header[referer]解决办法', '0', '30', '0', '2014-07-08', '5', '5');
INSERT INTO "public"."cms_article" VALUES ('65', 'black', '<p style="text-indent: 2em;">用nginx代理的时候，可能会配置多域名多项目的配置，往往就会出现location与proxy_pass路劲不一致的情况，如：</p><pre class="brush:bash;toolbar:false">location&nbsp;/&nbsp;{
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;proxy_pass&nbsp;&nbsp;&nbsp;http://127.0.0.1:8080/test1/;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;proxy_set_header&nbsp;&nbsp;&nbsp;Host&nbsp;&nbsp;&nbsp;&nbsp;$host;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;proxy_set_header&nbsp;&nbsp;&nbsp;Remote_Addr&nbsp;&nbsp;&nbsp;&nbsp;$remote_addr;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;proxy_set_header&nbsp;&nbsp;&nbsp;X-Real-IP&nbsp;&nbsp;&nbsp;&nbsp;$remote_addr;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;proxy_set_header&nbsp;&nbsp;&nbsp;X-Forwarded-For&nbsp;&nbsp;&nbsp;&nbsp;$proxy_add_x_forwarded_for;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}</pre><p style="text-indent: 2em;">这样配置过后代理问题，但是程序不能设置session，需要加入一个<span style="color: rgb(255, 0, 0); font-family: tahoma, helvetica, arial; font-size: 14px; line-height: 21px; background-color: rgb(255, 255, 255);">proxy_cookie_path</span>以下配置：</p><pre class="brush:bash;toolbar:false">location&nbsp;/&nbsp;{
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;proxy_pass&nbsp;&nbsp;&nbsp;http://127.0.0.1:8080/test1/;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;proxy_cookie_path&nbsp;/test1/&nbsp;/;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;proxy_set_header&nbsp;&nbsp;&nbsp;Host&nbsp;&nbsp;&nbsp;&nbsp;$host;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;proxy_set_header&nbsp;&nbsp;&nbsp;Remote_Addr&nbsp;&nbsp;&nbsp;&nbsp;$remote_addr;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;proxy_set_header&nbsp;&nbsp;&nbsp;X-Real-IP&nbsp;&nbsp;&nbsp;&nbsp;$remote_addr;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;proxy_set_header&nbsp;&nbsp;&nbsp;X-Forwarded-For&nbsp;&nbsp;&nbsp;&nbsp;$proxy_add_x_forwarded_for;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}</pre><p style="text-indent: 2em;">OK！</p>', '2014-07-08', '用nginx代理的时候，可能会配置多域名多项目的配置，往往就会出现location与proxy_pass路劲不一致的情况。。。', '142', null, null, '1', 'nginx', 'nginx反向代理配置location与proxy_pass路径不一致问题', '0', '29', '0', '2014-07-08', '5', '5');
INSERT INTO "public"."cms_article" VALUES ('66', 'black', '<ol class="custom_num list-paddingleft-1"><li class="list-num-1-1 list-num-paddingleft-1"><p><span style="font-family: 微软雅黑; font-size: 14px;">找出占用8080端口的进程ID（PID），运行cmd--&gt;输入:</span><span style="color:#ff0000;font-family: 微软雅黑; font-size: 14px;">netstat -ano|findstr <span style="color: rgb(192, 0, 0); font-family: 微软雅黑; font-size: 14px;">8080</span></span><span style="font-family: 微软雅黑; font-size: 14px;">&nbsp;--&gt;&quot;Enter&quot;。显示相应的进程ID</span></p></li><li class="list-num-1-2 list-num-paddingleft-1"><p><span style="font-family: 微软雅黑; font-size: 14px;"><span style="font-family: 微软雅黑; font-size: 14px;">输入:</span><span style="color:#ff0000;font-family: 微软雅黑; font-size: 14px;">tasklist /fi &quot;PID eq <span style="font-family: 微软雅黑; font-size: 14px; color: rgb(192, 0, 0);">440</span>&quot;</span><span style="font-family: 微软雅黑; font-size: 14px;">&nbsp;--&gt;&quot;Enter&quot;,这里/fi&nbsp;为筛选，&quot;PID eq 440&quot;为筛选条件，440为该进程的PID，马上就会显示该PID对应的进程名</span></span></p></li><li class="list-num-1-3 list-num-paddingleft-1"><p><span style="font-family: 微软雅黑; font-size: 14px;"><span style="font-family: 微软雅黑; font-size: 14px;"><span style="font-family: 微软雅黑; font-size: 14px;">输入:</span><span style="color:#ff0000;font-family: 微软雅黑; font-size: 14px; white-space: normal;">taskkill /fi &quot;PID eq <span style="font-family: 微软雅黑; font-size: 14px; color: rgb(192, 0, 0); white-space: normal;">440</span>&quot; /f</span><span style="font-family: 微软雅黑; font-size: 14px;">&nbsp;--&gt;&quot;Enter&quot;</span></span></span></p></li></ol><p><span style="font-family: 微软雅黑; font-size: 14px;"><span style="font-family: 微软雅黑; font-size: 14px;"></span></span><br/></p>', '2014-07-08', '找出占用8080端口的进程ID（PID），运行cmd', '139', null, null, '1', '', 'windows系统杀死某个端口的进程', '0', '36', '0', '2014-07-08', '5', '5');
INSERT INTO "public"."cms_article" VALUES ('67', 'black', '<p>&nbsp;&nbsp;&nbsp;&nbsp;又是一个寂静的夜晚，我的朋友们已经睡了，而我，却沉思的不能入睡。<br/></p><p>&nbsp;&nbsp;&nbsp;&nbsp;晚上看了新闻，虎扑三轮融资，准备赴创业板上市了。从一开始就关注虎扑，觉得虎扑起初就是一个不起眼的体育论坛。当意识到它快要去上市的时候，回过头来去看虎扑时，发现虎扑已经不再是当年自己熟悉的虎扑了。<br/></p><p>&nbsp;&nbsp;&nbsp;&nbsp;又说了闲话一大堆，今天一直在改自己的网站（美乐车<a href="http://www.meileche.com" target="_self">www.meileche.com），感觉自己的网站的代码永远是敲不完的，同时，网站的内容成了现在最大的困境，是到其他网站去爬取数据还是自己模拟数据，现在这是我遇到最大的困境。我想做一个差异化的网站，但是如何差异化我却一无所知。我想有一篇内容，哪怕是一篇很不真实的内容，我都想拥有，但是生活总是现实的，内容即王，我却没有这样的王者风范。</a></p><p>&nbsp;&nbsp;&nbsp;&nbsp;我是一名程序员，我想创业，但是我又畏惧创业，我畏惧我每一次的踏步。我每天敲代码都是沉思。我想做一个独一无二的程序员，但是程序员太多了，我不能独一无二，我根本没有独一无二的一点理由。<br/></p><p>&nbsp;&nbsp;&nbsp;&nbsp;现在已经是凌晨，我睡不着，想我这样睡不着的人在干什么呢？<br/></p><p>&nbsp;&nbsp;&nbsp;&nbsp;我想创业，我理解的创业就是干着想干的事情，然后过着穷困潦倒的生活，但是这种滋味我觉得挺好，穷困潦倒很无所谓，我二十多年都穷过了，还怕穷后面几年吗或者几十年吗？<br/></p>', '2014-07-09', '我是一名程序员，我为自己代言', '181', null, null, '1', '程序员,美乐车,思考,rguess', '程序员的思考', '0', '34', '0', '2014-07-09', '8', null);
INSERT INTO "public"."cms_article" VALUES ('68', 'black', '<p style="text-indent: 2em;">题：有两个数组如a[1,2,3,4,5],b[5,4,2,3,1]。那么[2,3]就是这两个数组的公共子数组。求任意两个数组的最大公共子数组长度。<br/></p><pre class="brush:java;toolbar:false">public&nbsp;class&nbsp;ArrayTest&nbsp;{
	
	int[]&nbsp;a&nbsp;=&nbsp;{1,2,3,4,5,6,9};
	int[]&nbsp;b&nbsp;=&nbsp;{3,3,3,4,5,6,9};
	int&nbsp;n&nbsp;=&nbsp;0;
	int&nbsp;m&nbsp;=&nbsp;0;

	@Test
	public&nbsp;void&nbsp;test(){
		for&nbsp;(int&nbsp;i&nbsp;=&nbsp;0;&nbsp;i&nbsp;&lt;&nbsp;a.length;&nbsp;i++)&nbsp;{
			
			for&nbsp;(int&nbsp;j&nbsp;=&nbsp;0;&nbsp;j&nbsp;&lt;&nbsp;b.length;&nbsp;j++)&nbsp;{
				nextEq(i,j);
			}
		}
		System.out.println(m);
	}
	
	private&nbsp;void&nbsp;nextEq(int&nbsp;ai&nbsp;,int&nbsp;bi){
		if((ai&nbsp;&lt;&nbsp;a.length&nbsp;||&nbsp;bi&nbsp;&lt;&nbsp;b.length)&nbsp;&amp;&amp;&nbsp;a[ai]&nbsp;==&nbsp;b[bi]){
			n++;
			nextEq(ai+1,bi+1);
		}else{
			if(n&gt;m){
				m&nbsp;=&nbsp;n;
			}
			n=0;
		}
	}
}</pre><p style="text-indent: 2em;"><br/></p>', '2014-07-12', '题：有两个数组如a[1,2,3,4,5],b[5,4,2,3,1]。那么[2,3]就是这两个数组的公共子数组。求任意两个数组的最大公共子数组长度。', '154', null, null, '1', '算法', '取两个数组最大公共子数组长度', '0', '36', '0', '2014-07-12', '5', '5');
INSERT INTO "public"."cms_article" VALUES ('69', 'black', '', '2014-08-07', '作为对象的创建模式，单例模式确保某一个类只有一个实例，而且自行实例化并向整个系统提供这个实例。这个类称为单例类。', '108', null, null, '1', '设计模式', '设计模式-责任型模式-单例模式', '0', '29', '0', '2014-08-07', '5', null);
INSERT INTO "public"."cms_article" VALUES ('70', 'black', '<p>&nbsp; &nbsp; 作为一个站长的我，每天都在想着自己网站的发展模式，借鉴国美有佣金模式，淘宝有广告、平台、流量入口模式，红旗连锁有连锁、加盟、佣金、快卖模式，而一个好的报价网站该怎样发展一个模式使其能成为一个好的网站？<br/></p><p>&nbsp;&nbsp;&nbsp;&nbsp;美乐车（www.meileche.com），作为我开发的第一个报价网站，发布版本的速度很慢&nbsp;，究其原因是没有一个良好的发展模式。<br/></p><p>&nbsp;&nbsp;&nbsp;&nbsp;今天，作为美乐车站长的我，暂时回忆一下当初构想的报价模式，现在依然在沿着这个模式进行开发以及推广。<br/></p><p>&nbsp;&nbsp;&nbsp;&nbsp;我起初只想做报价网站，只需要把电动车、自行车的采购以及批发价格放到该网站上面，然后用户通过该网站查找到最实惠，性价比最高的电动车或者自行车，然后联系卖家，然后根据这类信息到卖家的店铺进行采购，形成交易。然而，问题来了，如果只是做报价，内容太单一，并且报价信息可能不准确，商家为了吸引客户的眼球，可以把电动车或者自行车的报价压的极低，然后把客户骗到店铺位置，然后进行自己的营销，这样美乐车的所起到的作用是一种带有欺骗的作用，不利于网站的发展。解决网站内容的单一很简单，比如可以添加一些租车，资讯或者骑游类的栏目，以便网站的用户粘度更高，浏览的信息更加丰富。最大的解决难题无非在于欺骗这个问题，客户跑了一大圈，知道的就是美乐车网站所报价的车辆信息是假的，那么后果可想而知，不只是失去一位客户这样简单的问题。</p><p>&nbsp;&nbsp;&nbsp;&nbsp;还有一个很重要的原因，美乐车在商家报价的时候，美乐车是不产生交易的，美乐车定位为一家信息提供商，是平台，不产生任何交易，只提供信息服务，所以对商家的限制就减弱了。这对美乐车的报价平台是极为不利的，不产生交易，任何商家就可以随意发布虚假信息，当账号被封存的时候，商家可以注册新账号。美乐车为了解决这个问题，美乐车进行了商家认证，但是有些商家是没有能力认证的，美乐车目前还是需要这部分商家的流量，未认证的这部分商家是一个潜在的风险，同时这样的风险是极大的。未认证的商家的风险的控制是美乐车目前面临的最大的问题，国内目前58同城，赶集网这些分类信息网站同样面临这类问题，目前也没有一个良好的解决方案。</p><p>&nbsp;&nbsp;&nbsp;&nbsp;如果你有什么好的解决方案，可以再下面评论中提出你的建议，如果建议够好，我们会汲取的。<br/></p><p style="text-align: center;">&nbsp;&nbsp;&nbsp;&nbsp;<img src="/upload/20140812/39141407824741136.jpg" title="ylc_logo.jpg"/></p>', '2014-08-12', '    ​每天都在想着发展模式，国美有佣金模式，淘宝有广告、平台、流量入口模式，红旗连锁有连锁、加盟、佣金、快卖模式，而一个好的报价网站该怎样发展一个模式使其能成为一个好的网站？', '137', null, null, '1', '美乐车,报价网站,发展模式', '一个站长回忆自己的报价网站的发展模式（一）之报价信息模式', '0', '34', '0', '2014-08-12', '8', '8');
INSERT INTO "public"."cms_article" VALUES ('71', 'black', '<p>css的兼容性写法：</p><pre class="brush:css;toolbar:false">position:fixed;&nbsp;_position:absolute;&nbsp;_top:expression(offsetParent.scrollTop);&nbsp;_left:expression(offsetParent.scrollLeft);</pre><p></p>', '2014-08-21', 'IE8连fixed都不支持。。。', '127', null, null, '1', 'css,ie8', 'css兼容IE8不支持position:fixed情况', '0', '30', '0', '2014-08-21', '5', null);
INSERT INTO "public"."cms_article" VALUES ('72', 'black', '<p style="text-indent: 2em;">现在正坐在公司加着班，才发现加班也可以如此惬意。静静的边听歌，边敲着代码。累了就看看新闻，浏览博客。虽然面对公司项目这些乱七八糟的代码以及很多欠考虑的安排，心里还是有点不爽的。但是也不能哥的整体心情。</p><p style="text-indent: 2em;">最近几个月，自己的开源项目<a href="http://git.oschina.net/rguess/thinker" target="_blank" title="thinker">thinker</a>也很久没有更新了，网上还有一些朋友对这个项目感兴趣的，也没太用心去关注，为他们解决问题。最近也很少写自己的代码。博客也很久没有写了。哎，人的懒惰心理还真是非常难战胜啊，对于一个一心想投入到技术的海洋的我，这样是不行的。。。</p>', '2014-09-27', '现在正坐在公司加着班，才发现加班也可以如此惬意。静静的边听歌，边敲着代码。', '41', null, null, '1', '随意', '好久没写博客了', '0', '31', '0', '2014-09-27', '5', '5');
COMMIT;

-- ----------------------------
--  Table structure for cms_link
-- ----------------------------
DROP TABLE IF EXISTS "public"."cms_link";
CREATE TABLE "public"."cms_link" (
	"id" int8 NOT NULL DEFAULT nextval('seq_cms_link'::regclass),
	"color" varchar(255) COLLATE "default",
	"href" varchar(255) COLLATE "default",
	"image" varchar(255) COLLATE "default",
	"title" varchar(255) COLLATE "default",
	"weight" int4,
	"weightdate" date,
	"category_id" int8
)
WITH (OIDS=FALSE);
ALTER TABLE "public"."cms_link" OWNER TO "postgres";

-- ----------------------------
--  Records of cms_link
-- ----------------------------
BEGIN;
INSERT INTO "public"."cms_link" VALUES ('1', 'red', 'http://www.baidu.com', 'img', '百度', '999', null, '18');
INSERT INTO "public"."cms_link" VALUES ('2', 'black', 'http://www.taobao.com/', 'img', '淘宝网', '999', null, '17');
INSERT INTO "public"."cms_link" VALUES ('3', 'black', 'http://www.aipp.me/', 'http://www.aipp.me/favicon.ico', 'b0y''s blog', '1', null, '35');
INSERT INTO "public"."cms_link" VALUES ('5', 'black', 'http://www.super-man.cc/', 'http://www.super-man.cc/content/templates/loper/images/favicon.ico', '陌小染''s blog', '1', null, '35');
INSERT INTO "public"."cms_link" VALUES ('6', 'black', 'http://www.hackerr.org/', 'http://www.hackerr.org/favicon.ico', '苏晨‘s Blog', '1', null, '35');
INSERT INTO "public"."cms_link" VALUES ('7', 'black', 'http://www.meileche.com', 'http://www.meileche.com/image/meileche.jpg', '美乐车', '1', null, '35');
INSERT INTO "public"."cms_link" VALUES ('8', 'black', 'http://www.tiejiang.org/', 'http://www.google.com/s2/favicons?domain=www.tiejiang.org', '铁匠运维网', '1', null, '35');
INSERT INTO "public"."cms_link" VALUES ('9', 'black', 'http://www.duoluosb.com/', 'http://www.duoluosb.com/Favicon.ico', '堕络s Blog', '1', null, '35');
INSERT INTO "public"."cms_link" VALUES ('10', 'black', 'http://0ol.org/', 'http://www.google.com/s2/favicons?domain=0ol.org', '星少S Blog', '1', null, '35');
INSERT INTO "public"."cms_link" VALUES ('11', 'black', 'http://www.bccsafe.com/', 'http://www.bccsafe.com/wp-content/themes/20130801171447/images/favicon.ico', 'BccSafes Blog', '1', null, '35');
INSERT INTO "public"."cms_link" VALUES ('12', 'black', 'http://www.hkzn.cn/', 'http://www.hkzn.cn/wp-content/themes/fengying/images/favicon.ico', '指南针Sec', '1', null, '35');
INSERT INTO "public"."cms_link" VALUES ('13', 'black', 'http://prsec.ml/', 'http://www.google.com/s2/favicons?domain=www.prsec.ml', 'Passers Blog', '1', null, '35');
INSERT INTO "public"."cms_link" VALUES ('14', 'black', 'http://www.78786866.com', 'http://www.78786866.com/wp-content/uploads/2014/05/favicon.ico', '立欣社', '1', null, '35');
COMMIT;

-- ----------------------------
--  Table structure for cms_comment
-- ----------------------------
DROP TABLE IF EXISTS "public"."cms_comment";
CREATE TABLE "public"."cms_comment" (
	"id" int8 NOT NULL DEFAULT nextval('seq_cms_comment'::regclass),
	"auditdate" date,
	"content" varchar(255) COLLATE "default",
	"createdate" timestamp(6) NULL,
	"delflag" int4 NOT NULL,
	"email" varchar(255) COLLATE "default",
	"ip" varchar(255) COLLATE "default",
	"name" varchar(255) COLLATE "default",
	"url" varchar(255) COLLATE "default",
	"article_id" int8,
	"auditer_id" int8,
	"headpath" varchar(255) COLLATE "default"
)
WITH (OIDS=FALSE);
ALTER TABLE "public"."cms_comment" OWNER TO "postgres";

-- ----------------------------
--  Records of cms_comment
-- ----------------------------
BEGIN;
INSERT INTO "public"."cms_comment" VALUES ('13', null, '测试头像。。。', '2014-06-13 11:45:03', '0', '', '118.113.170.115', 'haha', '', '59', null, '/assets/img/face/6.png');
INSERT INTO "public"."cms_comment" VALUES ('14', null, '<img alt="哭" src="/assets/comp/xheditor/xheditor_emot/default/cry.gif" />哈哈', '2014-06-13 12:13:01', '0', '', '118.113.170.115', 'hello', '', '59', null, '/assets/img/face/6.png');
INSERT INTO "public"."cms_comment" VALUES ('15', null, '<img alt="微笑" src="/assets/comp/xheditor/xheditor_emot/default/smile.gif" /><img alt="大哭" src="/assets/comp/xheditor/xheditor_emot/default/wail.gif" /><img alt="敲打" src="/assets/comp/xheditor/xheditor_emot/default/knock.gif" />', '2014-06-13 12:14:19', '0', '', '118.113.170.115', '匿名', '', '59', null, '/assets/img/face/5.png');
INSERT INTO "public"."cms_comment" VALUES ('16', null, '&nbsp;&nbsp;不好意思&nbsp;找遍你的网站&nbsp;我都没有看到本站链接&nbsp;麻烦加上去', '2014-06-15 21:19:41', '0', '', '59.55.14.121', '星少·', '', '35', null, '/assets/img/face/5.png');
INSERT INTO "public"."cms_comment" VALUES ('17', null, '您好，贵站好像没有把我站添加上去，处理好后，邮件可以直接通知我！', '2014-06-16 09:55:07', '0', 'youqinglianjie@tiejiang.org', '101.231.214.242', '铁匠运维网', 'www.tiejiang.org', '35', null, '/assets/img/face/12.png');
INSERT INTO "public"."cms_comment" VALUES ('18', null, '<img alt="敲打" src="/assets/comp/xheditor/xheditor_emot/default/knock.gif" /><img alt="惊讶" src="/assets/comp/xheditor/xheditor_emot/default/ohmy.gif" />', '2014-06-16 14:26:38', '0', '', '171.216.78.13', 'cy', '', '48', null, '/assets/img/face/3.png');
INSERT INTO "public"."cms_comment" VALUES ('20', null, '支持一下', '2014-06-22 18:33:57', '0', 'qanlgeokdcw@gmail.com', '86.51.26.18', '博彩网', 'http://www.7bocai8.com', '59', null, '/assets/img/face/1.png');
INSERT INTO "public"."cms_comment" VALUES ('21', null, '好凶', '2014-06-25 19:06:40', '0', '123123', '171.212.145.135', '32123', '123231', '62', null, '/assets/img/face/6.png');
INSERT INTO "public"."cms_comment" VALUES ('22', null, '立欣社 &nbsp; &nbsp; &nbsp; &nbsp;www.78786866.com &nbsp; &nbsp;申请友链 &nbsp; &nbsp; &nbsp;已加贵站链接', '2014-06-27 14:25:00', '0', '2278786866@qq.com', '115.58.98.218', '立欣社', 'www.78786866.com', '35', null, '/assets/img/face/2.png');
INSERT INTO "public"."cms_comment" VALUES ('23', null, '平兄，可以哦~&nbsp;', '2014-07-04 18:15:36', '0', '', '112.193.56.158', 'hewk', '', '35', null, '/assets/img/face/8.png');
INSERT INTO "public"."cms_comment" VALUES ('24', null, '网站启用新域名：http://www.hackerr.org/<br />原站点名不变：苏晨s Blog', '2014-07-05 14:28:19', '0', '1142428579@qq.com', '112.5.236.67', '苏晨', 'www.hackerr.org', '35', null, '/assets/img/face/2.png');
INSERT INTO "public"."cms_comment" VALUES ('25', null, '<p>小平 可以哦~ <br /></p><p>猜我是谁 哈哈<br /></p>', '2014-07-16 17:20:21', '0', '', '125.69.127.54', '~~~~', '', '35', null, '/assets/img/face/1.png');
INSERT INTO "public"."cms_comment" VALUES ('75', null, '平平 &nbsp;顶一个', '2014-08-18 16:59:34', '0', '', '175.152.118.30', '昵称', '', '35', null, '/assets/img/face/1.png');
INSERT INTO "public"."cms_comment" VALUES ('256', null, '谢谢分享<img alt="奋斗" src="/assets/comp/xheditor/xheditor_emot/default/struggle.gif" />', '2014-09-18 15:59:38', '0', '2100103948@qq.com', '58.19.46.154', '武汉装饰公司', 'http://www.rkzs.com/', '71', null, '/assets/img/face/10.png');
INSERT INTO "public"."cms_comment" VALUES ('257', null, '学习了不错', '2014-09-18 16:00:28', '0', '2100103948@qq.com', '58.19.46.154', '武汉装饰公司', 'http：//www.rkzs.com/', '69', null, '/assets/img/face/8.png');
INSERT INTO "public"."cms_comment" VALUES ('412', null, '<img alt="微笑" src="/assets/comp/xheditor/xheditor_emot/default/smile.gif" />', '2014-09-22 13:12:14', '0', '', '218.249.133.163', '11', '', '71', null, '/assets/img/face/1.png');
INSERT INTO "public"."cms_comment" VALUES ('413', null, null, '2014-09-24 09:02:48', '0', null, '50.57.190.90', null, null, null, null, null);
INSERT INTO "public"."cms_comment" VALUES ('414', null, null, '2014-09-28 21:39:04', '0', null, '69.84.207.246', null, null, null, null, null);
COMMIT;

-- ----------------------------
--  Table structure for act_re_model
-- ----------------------------
DROP TABLE IF EXISTS "public"."act_re_model";
CREATE TABLE "public"."act_re_model" (
	"id_" varchar(64) NOT NULL COLLATE "default",
	"rev_" int4,
	"name_" varchar(255) COLLATE "default",
	"key_" varchar(255) COLLATE "default",
	"category_" varchar(255) COLLATE "default",
	"create_time_" timestamp(6) NULL,
	"last_update_time_" timestamp(6) NULL,
	"version_" int4,
	"meta_info_" varchar(4000) COLLATE "default",
	"deployment_id_" varchar(64) COLLATE "default",
	"editor_source_value_id_" varchar(64) COLLATE "default",
	"editor_source_extra_value_id_" varchar(64) COLLATE "default"
)
WITH (OIDS=FALSE);
ALTER TABLE "public"."act_re_model" OWNER TO "postgres";

-- ----------------------------
--  Table structure for etl_job
-- ----------------------------
DROP TABLE IF EXISTS "public"."etl_job";
CREATE TABLE "public"."etl_job" (
	"id" int8 NOT NULL,
	"job_name" varchar(50) COLLATE "default",
	"next_exe_date" date,
	"cron_trigger" varchar(100) COLLATE "default",
	"status" int2,
	"create_date" date,
	"update_date" date,
	"createby_id" int8,
	"updateby_id" int8,
	"remark" varchar(200) COLLATE "default"
)
WITH (OIDS=FALSE);
ALTER TABLE "public"."etl_job" OWNER TO "postgres";

COMMENT ON TABLE "public"."etl_job" IS 'etl调度任务';
COMMENT ON COLUMN "public"."etl_job"."id" IS 'job_id';
COMMENT ON COLUMN "public"."etl_job"."job_name" IS '调度名称';
COMMENT ON COLUMN "public"."etl_job"."remark" IS '备注';

-- ----------------------------
--  Table structure for etl_job_log
-- ----------------------------
DROP TABLE IF EXISTS "public"."etl_job_log";
CREATE TABLE "public"."etl_job_log" (
	"id" int8 NOT NULL,
	"task_id" int8,
	"log_content" text COLLATE "default",
	"log_time" timestamp(6) NULL,
	"createby_id" int8
)
WITH (OIDS=FALSE);
ALTER TABLE "public"."etl_job_log" OWNER TO "postgres";

COMMENT ON COLUMN "public"."etl_job_log"."id" IS 'log_id';

-- ----------------------------
--  Table structure for etl_param_column
-- ----------------------------
DROP TABLE IF EXISTS "public"."etl_param_column";
CREATE TABLE "public"."etl_param_column" (
	"id" int8 NOT NULL,
	"task_param_id" int8,
	"task_id" int8,
	"column_name" varchar(50) COLLATE "default",
	"column_value_index" int4,
	"remark" varchar(200) COLLATE "default"
)
WITH (OIDS=FALSE);
ALTER TABLE "public"."etl_param_column" OWNER TO "postgres";

COMMENT ON COLUMN "public"."etl_param_column"."task_param_id" IS '参数ID';

-- ----------------------------
--  Table structure for etl_plugin
-- ----------------------------
DROP TABLE IF EXISTS "public"."etl_plugin";
CREATE TABLE "public"."etl_plugin" (
	"id" int8 NOT NULL,
	"plugin_name" varchar(100) COLLATE "default",
	"plugin_type" int2,
	"class_name" varchar(200) COLLATE "default",
	"version" varchar(20) COLLATE "default",
	"target" varchar(50) COLLATE "default",
	"jar_name" varchar(200) COLLATE "default",
	"maxthreadnum" int4,
	"remark" varchar(200) COLLATE "default"
)
WITH (OIDS=FALSE);
ALTER TABLE "public"."etl_plugin" OWNER TO "postgres";

COMMENT ON COLUMN "public"."etl_plugin"."id" IS 'plugin 序号';
COMMENT ON COLUMN "public"."etl_plugin"."plugin_name" IS 'plugin名称';
COMMENT ON COLUMN "public"."etl_plugin"."plugin_type" IS 'plugin类别';
COMMENT ON COLUMN "public"."etl_plugin"."jar_name" IS 'jar名称';
COMMENT ON COLUMN "public"."etl_plugin"."remark" IS '备注';

-- ----------------------------
--  Table structure for etl_plugin_param
-- ----------------------------
DROP TABLE IF EXISTS "public"."etl_plugin_param";
CREATE TABLE "public"."etl_plugin_param" (
	"id" int8 NOT NULL,
	"plugin_id" int8 NOT NULL,
	"name" varchar(50) COLLATE "default",
	"range" varchar(200) COLLATE "default",
	"mandatory" int2,
	"default" varchar(200) COLLATE "default",
	"is_column" int2,
	"description" varchar(200) COLLATE "default"
)
WITH (OIDS=FALSE);
ALTER TABLE "public"."etl_plugin_param" OWNER TO "postgres";

COMMENT ON COLUMN "public"."etl_plugin_param"."id" IS '参数ID';
COMMENT ON COLUMN "public"."etl_plugin_param"."plugin_id" IS 'plugin 序号';
COMMENT ON COLUMN "public"."etl_plugin_param"."name" IS '名称';
COMMENT ON COLUMN "public"."etl_plugin_param"."range" IS '范围';
COMMENT ON COLUMN "public"."etl_plugin_param"."default" IS '默认值';
COMMENT ON COLUMN "public"."etl_plugin_param"."is_column" IS '是否字段 0-否 1-是';
COMMENT ON COLUMN "public"."etl_plugin_param"."description" IS '备注';

-- ----------------------------
--  Table structure for etl_task
-- ----------------------------
DROP TABLE IF EXISTS "public"."etl_task";
CREATE TABLE "public"."etl_task" (
	"id" int8 NOT NULL,
	"task_name" varchar(200) COLLATE "default",
	"job_id" int8,
	"plugin_id" int8,
	"create_date" date,
	"update_date" date,
	"createby_id" int8,
	"updateby_id" int8,
	"remark" varchar(200) COLLATE "default"
)
WITH (OIDS=FALSE);
ALTER TABLE "public"."etl_task" OWNER TO "postgres";

COMMENT ON TABLE "public"."etl_task" IS 'ETL任务';
COMMENT ON COLUMN "public"."etl_task"."id" IS 'task_id';
COMMENT ON COLUMN "public"."etl_task"."plugin_id" IS 'plugin 序号';

-- ----------------------------
--  Table structure for etl_task_param
-- ----------------------------
DROP TABLE IF EXISTS "public"."etl_task_param";
CREATE TABLE "public"."etl_task_param" (
	"id" int8 NOT NULL,
	"task_id" int8,
	"plugin_param_id" int8,
	"param_key" varchar(50) COLLATE "default",
	"param_value" varchar(200) COLLATE "default",
	"remark" varchar(200) COLLATE "default"
)
WITH (OIDS=FALSE);
ALTER TABLE "public"."etl_task_param" OWNER TO "postgres";

COMMENT ON TABLE "public"."etl_task_param" IS '任务参数值';
COMMENT ON COLUMN "public"."etl_task_param"."id" IS '参数ID';
COMMENT ON COLUMN "public"."etl_task_param"."plugin_param_id" IS '参数ID';

-- ----------------------------
--  Table structure for meta_case_info
-- ----------------------------
DROP TABLE IF EXISTS "public"."meta_case_info";
CREATE TABLE "public"."meta_case_info" (
	"id" int8 NOT NULL,
	"case_code" varchar(50) NOT NULL COLLATE "default",
	"project_id" int8,
	"case_type" int2,
	"check_label" int2,
	"create_date" date,
	"update_date" date,
	"createby_id" int8,
	"updateby_id" int8,
	"remark" varchar(200) COLLATE "default"
)
WITH (OIDS=FALSE);
ALTER TABLE "public"."meta_case_info" OWNER TO "postgres";

COMMENT ON COLUMN "public"."meta_case_info"."id" IS 'case id';
COMMENT ON COLUMN "public"."meta_case_info"."remark" IS '备注';

-- ----------------------------
--  Table structure for meta_datasource
-- ----------------------------
DROP TABLE IF EXISTS "public"."meta_datasource";
CREATE TABLE "public"."meta_datasource" (
	"id" int8 NOT NULL,
	"project_id" int8,
	"driver_class_name" varchar(200) COLLATE "default",
	"jdbc_url" varchar(250) COLLATE "default",
	"jdbc_user" varchar(50) COLLATE "default",
	"jdbc_password" varchar(50) COLLATE "default",
	"db_type" int4,
	"create_date" date,
	"update_date" date,
	"createby_id" int8,
	"updateby_id" int8,
	"remark" varchar(200) COLLATE "default"
)
WITH (OIDS=FALSE);
ALTER TABLE "public"."meta_datasource" OWNER TO "postgres";

COMMENT ON TABLE "public"."meta_datasource" IS '数据源';
COMMENT ON COLUMN "public"."meta_datasource"."id" IS '数据源ID';
COMMENT ON COLUMN "public"."meta_datasource"."project_id" IS 'project_id';
COMMENT ON COLUMN "public"."meta_datasource"."db_type" IS '数据库类别';
COMMENT ON COLUMN "public"."meta_datasource"."remark" IS '备注';

-- ----------------------------
--  Records of meta_datasource
-- ----------------------------
BEGIN;
INSERT INTO "public"."meta_datasource" VALUES ('1', '1', null, null, null, null, '1', '2015-12-14', '2015-12-14', '5', '5', 'eshbase数据库');
INSERT INTO "public"."meta_datasource" VALUES ('2', '2', 'org.postgresql.Driver', 'jdbc:postgresql://localhost/datax', 'postgres', 'iharding', '2', '2015-12-14', '2015-12-14', '5', '5', 'postgresql元数据库');
COMMIT;

-- ----------------------------
--  Table structure for meta_dbtable
-- ----------------------------
DROP TABLE IF EXISTS "public"."meta_dbtable";
CREATE TABLE "public"."meta_dbtable" (
	"id" int8 NOT NULL,
	"datasource_id" int8,
	"table_name" varchar(100) NOT NULL COLLATE "default",
	"table_pname" varchar(200) COLLATE "default",
	"table_type" int2,
	"remark" varchar(200) COLLATE "default"
)
WITH (OIDS=FALSE);
ALTER TABLE "public"."meta_dbtable" OWNER TO "postgres";

COMMENT ON TABLE "public"."meta_dbtable" IS '表';
COMMENT ON COLUMN "public"."meta_dbtable"."id" IS '表格ID';
COMMENT ON COLUMN "public"."meta_dbtable"."datasource_id" IS '数据源ID';
COMMENT ON COLUMN "public"."meta_dbtable"."table_pname" IS '物理名';
COMMENT ON COLUMN "public"."meta_dbtable"."remark" IS '备注';

-- ----------------------------
--  Records of meta_dbtable
-- ----------------------------
BEGIN;
INSERT INTO "public"."meta_dbtable" VALUES ('1', '1', 'T_User_Figure', '用户标签表', '5', 'hbase用户标签表');
COMMIT;

-- ----------------------------
--  Table structure for meta_module
-- ----------------------------
DROP TABLE IF EXISTS "public"."meta_module";
CREATE TABLE "public"."meta_module" (
	"id" int8 NOT NULL,
	"datasource_id" int8,
	"package_name" varchar(200) COLLATE "default",
	"create_date" date,
	"update_date" date,
	"createby_id" int8,
	"updateby_id" int8,
	"remark" varchar(200) COLLATE "default",
	"project_id" int8,
	"module_name" varchar(255) COLLATE "default",
	"module_code" varchar(255) COLLATE "default"
)
WITH (OIDS=FALSE);
ALTER TABLE "public"."meta_module" OWNER TO "postgres";

COMMENT ON COLUMN "public"."meta_module"."id" IS '模块编号';
COMMENT ON COLUMN "public"."meta_module"."datasource_id" IS '数据源ID';
COMMENT ON COLUMN "public"."meta_module"."package_name" IS '模块名';
COMMENT ON COLUMN "public"."meta_module"."remark" IS '备注';

-- ----------------------------
--  Records of meta_module
-- ----------------------------
BEGIN;
INSERT INTO "public"."meta_module" VALUES ('2', '2', 'net.iharding.modules.meta', '2015-12-14', '2015-12-14', '5', '5', 'postgres', '1', 'postgresql', 'meta');
INSERT INTO "public"."meta_module" VALUES ('1', '1', 'net.iharding.showcase.user', '2015-12-14', '2015-12-14', '5', '5', 'ehbase', '1', 'EHBASE用户表范例', 'user');
COMMIT;

-- ----------------------------
--  Table structure for meta_module_table
-- ----------------------------
DROP TABLE IF EXISTS "public"."meta_module_table";
CREATE TABLE "public"."meta_module_table" (
	"module_id" int8 NOT NULL,
	"table_id" int8 NOT NULL
)
WITH (OIDS=FALSE);
ALTER TABLE "public"."meta_module_table" OWNER TO "postgres";

COMMENT ON COLUMN "public"."meta_module_table"."module_id" IS '模块编号';
COMMENT ON COLUMN "public"."meta_module_table"."table_id" IS '表格ID';

-- ----------------------------
--  Records of meta_module_table
-- ----------------------------
BEGIN;
INSERT INTO "public"."meta_module_table" VALUES ('1', '1');
COMMIT;

-- ----------------------------
--  Table structure for meta_poject
-- ----------------------------
DROP TABLE IF EXISTS "public"."meta_poject";
CREATE TABLE "public"."meta_poject" (
	"id" int8 NOT NULL,
	"project_code" varchar(50) NOT NULL COLLATE "default",
	"project_name" varchar(100) COLLATE "default",
	"create_date" date,
	"update_date" date,
	"createby_id" int8,
	"updateby_id" int8,
	"remark" varchar(200) COLLATE "default"
)
WITH (OIDS=FALSE);
ALTER TABLE "public"."meta_poject" OWNER TO "postgres";

-- ----------------------------
--  Records of meta_poject
-- ----------------------------
BEGIN;
INSERT INTO "public"."meta_poject" VALUES ('1', 'ehdbms', 'eshbase数据库', '2015-12-14', '2015-12-14', '5', '5', 'hbase,phoenix,elasticsearch数据库');
INSERT INTO "public"."meta_poject" VALUES ('2', 'MetaDBMS', '元数据库管理控制台', '2015-12-14', '2015-12-14', '5', '5', '元数据数据库');
COMMIT;

-- ----------------------------
--  Table structure for sys_dict
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys_dict";
CREATE TABLE "public"."sys_dict" (
	"id" int4 NOT NULL,
	"code_type" int4,
	"code_value" varchar(200) COLLATE "default",
	"code_name" varchar(200) COLLATE "default",
	"sort_id" int4,
	"remark" varchar(200) COLLATE "default"
)
WITH (OIDS=FALSE);
ALTER TABLE "public"."sys_dict" OWNER TO "postgres";

COMMENT ON TABLE "public"."sys_dict" IS '数据字典表';

-- ----------------------------
--  Table structure for sys_icon
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys_icon";
CREATE TABLE "public"."sys_icon" (
	"id" int8 NOT NULL DEFAULT nextval('seq_sys_icon'::regclass),
	"description" varchar(255) COLLATE "default",
	"mark" varchar(255) COLLATE "default",
	"type" varchar(255) COLLATE "default"
)
WITH (OIDS=FALSE);
ALTER TABLE "public"."sys_icon" OWNER TO "postgres";

-- ----------------------------
--  Records of sys_icon
-- ----------------------------
BEGIN;
INSERT INTO "public"."sys_icon" VALUES ('1', null, 'icon-adjust', 'css');
INSERT INTO "public"."sys_icon" VALUES ('2', null, 'icon-exclamation-sign', 'css');
INSERT INTO "public"."sys_icon" VALUES ('3', null, 'icon-money', 'css');
INSERT INTO "public"."sys_icon" VALUES ('4', null, 'icon-signal', 'css');
INSERT INTO "public"."sys_icon" VALUES ('5', null, 'icon-asterisk', 'css');
INSERT INTO "public"."sys_icon" VALUES ('6', null, 'icon-external-link', 'css');
INSERT INTO "public"."sys_icon" VALUES ('7', null, 'icon-move', 'css');
INSERT INTO "public"."sys_icon" VALUES ('8', null, 'icon-signin', 'css');
INSERT INTO "public"."sys_icon" VALUES ('9', null, 'icon-ban-circle', 'css');
INSERT INTO "public"."sys_icon" VALUES ('10', null, 'icon-eye-close', 'css');
INSERT INTO "public"."sys_icon" VALUES ('11', null, 'icon-music', 'css');
INSERT INTO "public"."sys_icon" VALUES ('12', null, 'icon-signout', 'css');
INSERT INTO "public"."sys_icon" VALUES ('13', null, 'icon-bar-chart', 'css');
INSERT INTO "public"."sys_icon" VALUES ('14', null, 'icon-eye-open', 'css');
INSERT INTO "public"."sys_icon" VALUES ('15', null, 'icon-off', 'css');
INSERT INTO "public"."sys_icon" VALUES ('16', null, 'icon-sitemap', 'css');
INSERT INTO "public"."sys_icon" VALUES ('20', null, 'icon-barcode', 'css');
INSERT INTO "public"."sys_icon" VALUES ('21', null, 'icon-facetime-video', 'css');
INSERT INTO "public"."sys_icon" VALUES ('22', null, 'icon-ok', 'css');
INSERT INTO "public"."sys_icon" VALUES ('23', null, 'icon-sort', 'css');
INSERT INTO "public"."sys_icon" VALUES ('24', null, 'icon-beaker', 'css');
INSERT INTO "public"."sys_icon" VALUES ('25', null, 'icon-film', 'css');
INSERT INTO "public"."sys_icon" VALUES ('26', null, 'icon-ok-circle', 'css');
INSERT INTO "public"."sys_icon" VALUES ('27', null, 'icon-sort-down', 'css');
INSERT INTO "public"."sys_icon" VALUES ('28', null, 'icon-bell', 'css');
INSERT INTO "public"."sys_icon" VALUES ('29', null, 'icon-filter', 'css');
INSERT INTO "public"."sys_icon" VALUES ('30', null, 'icon-ok-sign', 'css');
INSERT INTO "public"."sys_icon" VALUES ('31', null, 'icon-sort-up', 'css');
INSERT INTO "public"."sys_icon" VALUES ('32', null, ' icon-bolt', 'css');
INSERT INTO "public"."sys_icon" VALUES ('33', null, 'icon-fire', 'css');
INSERT INTO "public"."sys_icon" VALUES ('34', null, 'icon-pencil', 'css');
INSERT INTO "public"."sys_icon" VALUES ('35', null, 'icon-star', 'css');
INSERT INTO "public"."sys_icon" VALUES ('36', null, 'icon-book', 'css');
INSERT INTO "public"."sys_icon" VALUES ('37', null, 'icon-flag', 'css');
INSERT INTO "public"."sys_icon" VALUES ('38', null, 'icon-picture', 'css');
INSERT INTO "public"."sys_icon" VALUES ('39', null, 'icon-star-empty', 'css');
INSERT INTO "public"."sys_icon" VALUES ('40', null, 'icon-bookmark', 'css');
INSERT INTO "public"."sys_icon" VALUES ('41', null, 'icon-folder-close', 'css');
INSERT INTO "public"."sys_icon" VALUES ('42', null, 'icon-plane', 'css');
INSERT INTO "public"."sys_icon" VALUES ('43', null, 'icon-star-half', 'css');
INSERT INTO "public"."sys_icon" VALUES ('44', null, 'icon-bookmark-empty', 'css');
INSERT INTO "public"."sys_icon" VALUES ('45', null, 'icon-folder-open', 'css');
INSERT INTO "public"."sys_icon" VALUES ('46', null, 'icon-plus', 'css');
INSERT INTO "public"."sys_icon" VALUES ('47', null, 'icon-tag', 'css');
INSERT INTO "public"."sys_icon" VALUES ('48', null, 'icon-briefcase', 'css');
INSERT INTO "public"."sys_icon" VALUES ('49', null, 'icon-gift', 'css');
INSERT INTO "public"."sys_icon" VALUES ('50', null, 'icon-plus-sign', 'css');
INSERT INTO "public"."sys_icon" VALUES ('51', null, 'icon-tags', 'css');
INSERT INTO "public"."sys_icon" VALUES ('52', null, 'icon-bullhorn', 'css');
INSERT INTO "public"."sys_icon" VALUES ('53', null, 'icon-glass', 'css');
INSERT INTO "public"."sys_icon" VALUES ('54', null, 'icon-print', 'css');
INSERT INTO "public"."sys_icon" VALUES ('55', null, 'icon-tasks', 'css');
INSERT INTO "public"."sys_icon" VALUES ('56', null, 'icon-calendar', 'css');
INSERT INTO "public"."sys_icon" VALUES ('57', null, 'icon-globe', 'css');
INSERT INTO "public"."sys_icon" VALUES ('58', null, 'icon-pushpin', 'css');
INSERT INTO "public"."sys_icon" VALUES ('59', null, 'icon-thumbs-down', 'css');
INSERT INTO "public"."sys_icon" VALUES ('60', null, 'icon-camera', 'css');
INSERT INTO "public"."sys_icon" VALUES ('61', null, 'icon-group', 'css');
INSERT INTO "public"."sys_icon" VALUES ('62', null, 'icon-qrcode', 'css');
INSERT INTO "public"."sys_icon" VALUES ('63', null, 'icon-thumbs-up', 'css');
INSERT INTO "public"."sys_icon" VALUES ('64', null, 'icon-camera-retro', 'css');
INSERT INTO "public"."sys_icon" VALUES ('65', null, 'icon-certificate', 'css');
INSERT INTO "public"."sys_icon" VALUES ('66', null, 'icon-check', 'css');
INSERT INTO "public"."sys_icon" VALUES ('67', null, 'icon-check-empty', 'css');
INSERT INTO "public"."sys_icon" VALUES ('68', null, 'icon-cloud', 'css');
INSERT INTO "public"."sys_icon" VALUES ('69', null, 'icon-cog', 'css');
INSERT INTO "public"."sys_icon" VALUES ('70', null, 'icon-cogs', 'css');
INSERT INTO "public"."sys_icon" VALUES ('71', null, 'icon-comment', 'css');
INSERT INTO "public"."sys_icon" VALUES ('72', null, 'icon-comment-alt', 'css');
INSERT INTO "public"."sys_icon" VALUES ('73', null, 'icon-comments', 'css');
INSERT INTO "public"."sys_icon" VALUES ('74', null, 'icon-comments-alt', 'css');
INSERT INTO "public"."sys_icon" VALUES ('75', null, 'icon-credit-card', 'css');
INSERT INTO "public"."sys_icon" VALUES ('76', null, 'icon-dashboard', 'css');
INSERT INTO "public"."sys_icon" VALUES ('77', null, 'icon-download', 'css');
INSERT INTO "public"."sys_icon" VALUES ('78', null, 'icon-download-alt', 'css');
INSERT INTO "public"."sys_icon" VALUES ('79', null, 'icon-edit', 'css');
INSERT INTO "public"."sys_icon" VALUES ('80', null, 'icon-envelope', 'css');
INSERT INTO "public"."sys_icon" VALUES ('81', null, 'icon-envelope-alt', 'css');
INSERT INTO "public"."sys_icon" VALUES ('82', null, 'icon-hdd', 'css');
INSERT INTO "public"."sys_icon" VALUES ('83', null, 'icon-headphones', 'css');
INSERT INTO "public"."sys_icon" VALUES ('84', null, 'icon-heart', 'css');
INSERT INTO "public"."sys_icon" VALUES ('85', null, 'icon-heart-empty', 'css');
INSERT INTO "public"."sys_icon" VALUES ('86', null, 'icon-home', 'css');
INSERT INTO "public"."sys_icon" VALUES ('87', null, 'icon-inbox', 'css');
INSERT INTO "public"."sys_icon" VALUES ('88', null, 'icon-info-sign', 'css');
INSERT INTO "public"."sys_icon" VALUES ('89', null, 'icon-key', 'css');
INSERT INTO "public"."sys_icon" VALUES ('90', null, 'icon-leaf', 'css');
INSERT INTO "public"."sys_icon" VALUES ('91', null, 'icon-legal', 'css');
INSERT INTO "public"."sys_icon" VALUES ('92', null, 'icon-lemon', 'css');
INSERT INTO "public"."sys_icon" VALUES ('93', null, 'icon-lock', 'css');
INSERT INTO "public"."sys_icon" VALUES ('94', null, 'icon-unlock', 'css');
INSERT INTO "public"."sys_icon" VALUES ('95', null, 'icon-magic', 'css');
INSERT INTO "public"."sys_icon" VALUES ('96', null, 'icon-magnet', 'css');
INSERT INTO "public"."sys_icon" VALUES ('97', null, 'icon-map-marker', 'css');
INSERT INTO "public"."sys_icon" VALUES ('98', null, 'icon-minus', 'css');
INSERT INTO "public"."sys_icon" VALUES ('99', null, 'icon-minus-sign', 'css');
INSERT INTO "public"."sys_icon" VALUES ('100', null, 'icon-question-sign', 'css');
INSERT INTO "public"."sys_icon" VALUES ('101', null, 'icon-random', 'css');
INSERT INTO "public"."sys_icon" VALUES ('102', null, 'icon-refresh', 'css');
INSERT INTO "public"."sys_icon" VALUES ('103', null, 'icon-remove', 'css');
INSERT INTO "public"."sys_icon" VALUES ('104', null, 'icon-remove-circle', 'css');
INSERT INTO "public"."sys_icon" VALUES ('105', null, 'icon-remove-sign', 'css');
INSERT INTO "public"."sys_icon" VALUES ('106', null, 'icon-reorder', 'css');
INSERT INTO "public"."sys_icon" VALUES ('107', null, 'icon-resize-horizontal', 'css');
INSERT INTO "public"."sys_icon" VALUES ('108', null, 'icon-resize-vertical', 'css');
INSERT INTO "public"."sys_icon" VALUES ('109', null, 'icon-retweet', 'css');
INSERT INTO "public"."sys_icon" VALUES ('110', null, 'icon-road', 'css');
INSERT INTO "public"."sys_icon" VALUES ('111', null, 'icon-rss', 'css');
INSERT INTO "public"."sys_icon" VALUES ('112', null, 'icon-screenshot', 'css');
INSERT INTO "public"."sys_icon" VALUES ('113', null, 'icon-search', 'css');
INSERT INTO "public"."sys_icon" VALUES ('114', null, 'icon-share', 'css');
INSERT INTO "public"."sys_icon" VALUES ('115', null, 'icon-share-alt', 'css');
INSERT INTO "public"."sys_icon" VALUES ('116', null, 'icon-shopping-cart', 'css');
INSERT INTO "public"."sys_icon" VALUES ('117', null, 'icon-time', 'css');
INSERT INTO "public"."sys_icon" VALUES ('118', null, 'icon-tint', 'css');
INSERT INTO "public"."sys_icon" VALUES ('119', null, 'icon-trash', 'css');
INSERT INTO "public"."sys_icon" VALUES ('120', null, 'icon-trophy', 'css');
INSERT INTO "public"."sys_icon" VALUES ('121', null, 'icon-truck', 'css');
INSERT INTO "public"."sys_icon" VALUES ('122', null, 'icon-umbrella', 'css');
INSERT INTO "public"."sys_icon" VALUES ('123', null, 'icon-upload', 'css');
INSERT INTO "public"."sys_icon" VALUES ('124', null, 'icon-upload-alt', 'css');
INSERT INTO "public"."sys_icon" VALUES ('125', null, 'icon-user', 'css');
INSERT INTO "public"."sys_icon" VALUES ('126', null, 'icon-user-md', 'css');
INSERT INTO "public"."sys_icon" VALUES ('127', null, 'icon-volume-off', 'css');
INSERT INTO "public"."sys_icon" VALUES ('128', null, 'icon-volume-down', 'css');
INSERT INTO "public"."sys_icon" VALUES ('129', null, 'icon-volume-up', 'css');
INSERT INTO "public"."sys_icon" VALUES ('130', null, 'icon-warning-sign', 'css');
INSERT INTO "public"."sys_icon" VALUES ('131', null, 'icon-wrench', 'css');
INSERT INTO "public"."sys_icon" VALUES ('132', null, 'icon-zoom-in', 'css');
INSERT INTO "public"."sys_icon" VALUES ('133', null, 'icon-zoom-out', 'css');
INSERT INTO "public"."sys_icon" VALUES ('134', null, 'ztree_edit', 'png');
INSERT INTO "public"."sys_icon" VALUES ('135', null, 'ztree_root_close', 'png');
INSERT INTO "public"."sys_icon" VALUES ('136', null, 'ztree_root_open', 'png');
INSERT INTO "public"."sys_icon" VALUES ('137', null, 'ztree_star', 'png');
INSERT INTO "public"."sys_icon" VALUES ('138', null, 'ztree_calendar', 'png');
INSERT INTO "public"."sys_icon" VALUES ('139', null, 'ztree_heart', 'png');
INSERT INTO "public"."sys_icon" VALUES ('140', null, 'ztree_save', 'png');
INSERT INTO "public"."sys_icon" VALUES ('141', null, 'ztree_msg', 'png');
INSERT INTO "public"."sys_icon" VALUES ('142', null, 'ztree_report', 'png');
INSERT INTO "public"."sys_icon" VALUES ('143', null, 'ztree_setting', 'png');
INSERT INTO "public"."sys_icon" VALUES ('148', null, 'ztree_folder_open', 'png');
INSERT INTO "public"."sys_icon" VALUES ('149', null, 'ztree_folder_close', 'png');
INSERT INTO "public"."sys_icon" VALUES ('150', null, 'ztree_file2', 'png');
INSERT INTO "public"."sys_icon" VALUES ('151', null, 'ztree_edit2', 'png');
INSERT INTO "public"."sys_icon" VALUES ('152', null, 'ztree_delete', 'png');
INSERT INTO "public"."sys_icon" VALUES ('153', null, 'ztree_arrow', 'png');
INSERT INTO "public"."sys_icon" VALUES ('154', null, 'ztree_plus', 'png');
INSERT INTO "public"."sys_icon" VALUES ('155', null, 'ztree_minus', 'png');
INSERT INTO "public"."sys_icon" VALUES ('156', null, 'ztree_add', 'png');
INSERT INTO "public"."sys_icon" VALUES ('157', null, 'ztree_cicle_arrow_left1', 'png');
INSERT INTO "public"."sys_icon" VALUES ('158', null, 'ztree_cicle_arrow_right1', 'png');
INSERT INTO "public"."sys_icon" VALUES ('159', null, 'ztree_cicle_arrow_left2', 'png');
INSERT INTO "public"."sys_icon" VALUES ('160', null, 'ztree_cicle_arrow_right2', 'png');
INSERT INTO "public"."sys_icon" VALUES ('161', null, 'ztree_cicle_arrow', 'png');
INSERT INTO "public"."sys_icon" VALUES ('162', null, 'ztree_star_light', 'png');
INSERT INTO "public"."sys_icon" VALUES ('163', null, 'ztree_star_dark', 'png');
INSERT INTO "public"."sys_icon" VALUES ('164', null, 'diy_icon_01_01', 'png');
INSERT INTO "public"."sys_icon" VALUES ('165', null, 'diy_icon_01_02', 'png');
INSERT INTO "public"."sys_icon" VALUES ('166', null, 'diy_icon_01_03', 'png');
INSERT INTO "public"."sys_icon" VALUES ('167', null, 'diy_icon_01_04', 'png');
INSERT INTO "public"."sys_icon" VALUES ('168', null, 'diy_icon_01_05', 'png');
INSERT INTO "public"."sys_icon" VALUES ('169', null, 'diy_icon_01_06', 'png');
INSERT INTO "public"."sys_icon" VALUES ('170', null, 'diy_icon_01_07', 'png');
INSERT INTO "public"."sys_icon" VALUES ('171', null, 'diy_icon_01_08', 'png');
INSERT INTO "public"."sys_icon" VALUES ('172', null, 'diy_icon_01_09', 'png');
INSERT INTO "public"."sys_icon" VALUES ('173', null, 'diy_icon_01_10', 'png');
INSERT INTO "public"."sys_icon" VALUES ('174', null, 'diy_icon_01_11', 'png');
INSERT INTO "public"."sys_icon" VALUES ('175', null, 'diy_icon_01_12', 'png');
INSERT INTO "public"."sys_icon" VALUES ('176', null, 'diy_icon_01_13', 'png');
INSERT INTO "public"."sys_icon" VALUES ('177', null, 'diy_icon_01_14', 'png');
INSERT INTO "public"."sys_icon" VALUES ('178', null, 'diy_icon_01_15', 'png');
INSERT INTO "public"."sys_icon" VALUES ('179', null, 'diy_icon_01_16', 'png');
INSERT INTO "public"."sys_icon" VALUES ('180', null, 'diy_icon_01_17', 'png');
INSERT INTO "public"."sys_icon" VALUES ('181', null, 'diy_icon_01_18', 'png');
INSERT INTO "public"."sys_icon" VALUES ('182', null, 'diy_icon_01_19', 'png');
INSERT INTO "public"."sys_icon" VALUES ('183', null, 'diy_icon_01_20', 'png');
INSERT INTO "public"."sys_icon" VALUES ('184', null, 'diy_icon_01_21', 'png');
INSERT INTO "public"."sys_icon" VALUES ('185', null, 'diy_icon_01_22', 'png');
INSERT INTO "public"."sys_icon" VALUES ('186', null, 'diy_icon_01_23', 'png');
INSERT INTO "public"."sys_icon" VALUES ('187', null, 'diy_icon_01_24', 'png');
INSERT INTO "public"."sys_icon" VALUES ('188', null, 'diy_icon_01_25', 'png');
INSERT INTO "public"."sys_icon" VALUES ('189', null, 'diy_icon_01_26', 'png');
INSERT INTO "public"."sys_icon" VALUES ('190', null, 'diy_icon_01_27', 'png');
INSERT INTO "public"."sys_icon" VALUES ('191', null, 'diy_icon_01_28', 'png');
INSERT INTO "public"."sys_icon" VALUES ('192', null, 'diy_icon_01_29', 'png');
INSERT INTO "public"."sys_icon" VALUES ('193', null, 'diy_icon_01_30', 'png');
INSERT INTO "public"."sys_icon" VALUES ('194', null, 'diy_icon_01_31', 'png');
INSERT INTO "public"."sys_icon" VALUES ('195', null, 'diy_icon_01_32', 'png');
INSERT INTO "public"."sys_icon" VALUES ('196', null, 'diy_icon_01_33', 'png');
INSERT INTO "public"."sys_icon" VALUES ('197', null, 'diy_icon_01_34', 'png');
INSERT INTO "public"."sys_icon" VALUES ('198', null, 'diy_icon_01_35', 'png');
INSERT INTO "public"."sys_icon" VALUES ('199', null, 'diy_icon_01_36', 'png');
INSERT INTO "public"."sys_icon" VALUES ('200', null, 'diy_icon_01_37', 'png');
INSERT INTO "public"."sys_icon" VALUES ('201', null, 'diy_icon_01_38', 'png');
INSERT INTO "public"."sys_icon" VALUES ('202', null, 'diy_icon_01_39', 'png');
INSERT INTO "public"."sys_icon" VALUES ('203', null, 'diy_icon_01_40', 'png');
INSERT INTO "public"."sys_icon" VALUES ('204', null, 'diy_icon_01_41', 'png');
INSERT INTO "public"."sys_icon" VALUES ('205', null, 'diy_icon_01_42', 'png');
INSERT INTO "public"."sys_icon" VALUES ('206', null, 'diy_icon_01_43', 'png');
INSERT INTO "public"."sys_icon" VALUES ('207', null, 'diy_icon_01_44', 'png');
INSERT INTO "public"."sys_icon" VALUES ('208', null, 'diy_icon_01_45', 'png');
INSERT INTO "public"."sys_icon" VALUES ('209', null, 'diy_icon_01_46', 'png');
INSERT INTO "public"."sys_icon" VALUES ('210', null, 'diy_icon_01_47', 'png');
INSERT INTO "public"."sys_icon" VALUES ('211', null, 'diy_icon_01_48', 'png');
INSERT INTO "public"."sys_icon" VALUES ('212', null, 'diy_icon_01_49', 'png');
INSERT INTO "public"."sys_icon" VALUES ('213', null, 'diy_icon_01_50', 'png');
INSERT INTO "public"."sys_icon" VALUES ('214', null, 'diy_icon_02_01', 'png');
INSERT INTO "public"."sys_icon" VALUES ('215', null, 'diy_icon_02_02', 'png');
INSERT INTO "public"."sys_icon" VALUES ('216', null, 'diy_icon_02_03', 'png');
INSERT INTO "public"."sys_icon" VALUES ('217', null, 'diy_icon_02_04', 'png');
INSERT INTO "public"."sys_icon" VALUES ('218', null, 'diy_icon_02_05', 'png');
INSERT INTO "public"."sys_icon" VALUES ('219', null, 'diy_icon_02_06', 'png');
INSERT INTO "public"."sys_icon" VALUES ('220', null, 'diy_icon_02_07', 'png');
INSERT INTO "public"."sys_icon" VALUES ('221', null, 'diy_icon_02_08', 'png');
INSERT INTO "public"."sys_icon" VALUES ('222', null, 'diy_icon_02_09', 'png');
INSERT INTO "public"."sys_icon" VALUES ('223', null, 'diy_icon_02_10', 'png');
INSERT INTO "public"."sys_icon" VALUES ('224', null, 'diy_icon_02_11', 'png');
INSERT INTO "public"."sys_icon" VALUES ('225', null, 'diy_icon_02_12', 'png');
INSERT INTO "public"."sys_icon" VALUES ('226', null, 'diy_icon_02_13', 'png');
INSERT INTO "public"."sys_icon" VALUES ('227', null, 'diy_icon_02_14', 'png');
INSERT INTO "public"."sys_icon" VALUES ('228', null, 'diy_icon_02_15', 'png');
INSERT INTO "public"."sys_icon" VALUES ('229', null, 'diy_icon_02_16', 'png');
INSERT INTO "public"."sys_icon" VALUES ('230', null, 'diy_icon_02_17', 'png');
INSERT INTO "public"."sys_icon" VALUES ('231', null, 'diy_icon_02_18', 'png');
INSERT INTO "public"."sys_icon" VALUES ('232', null, 'diy_icon_02_19', 'png');
INSERT INTO "public"."sys_icon" VALUES ('233', null, 'diy_icon_02_20', 'png');
INSERT INTO "public"."sys_icon" VALUES ('234', null, 'diy_icon_02_21', 'png');
INSERT INTO "public"."sys_icon" VALUES ('235', null, 'diy_icon_02_22', 'png');
INSERT INTO "public"."sys_icon" VALUES ('236', null, 'diy_icon_02_23', 'png');
INSERT INTO "public"."sys_icon" VALUES ('237', null, 'diy_icon_02_24', 'png');
INSERT INTO "public"."sys_icon" VALUES ('238', null, 'diy_icon_02_25', 'png');
INSERT INTO "public"."sys_icon" VALUES ('239', null, 'diy_icon_02_26', 'png');
INSERT INTO "public"."sys_icon" VALUES ('240', null, 'diy_icon_02_27', 'png');
INSERT INTO "public"."sys_icon" VALUES ('241', null, 'diy_icon_02_28', 'png');
INSERT INTO "public"."sys_icon" VALUES ('242', null, 'diy_icon_02_29', 'png');
INSERT INTO "public"."sys_icon" VALUES ('243', null, 'diy_icon_02_30', 'png');
INSERT INTO "public"."sys_icon" VALUES ('244', null, 'diy_icon_02_31', 'png');
INSERT INTO "public"."sys_icon" VALUES ('245', null, 'diy_icon_02_32', 'png');
INSERT INTO "public"."sys_icon" VALUES ('246', null, 'diy_icon_02_33', 'png');
INSERT INTO "public"."sys_icon" VALUES ('247', null, 'diy_icon_02_34', 'png');
INSERT INTO "public"."sys_icon" VALUES ('248', null, 'diy_icon_02_35', 'png');
INSERT INTO "public"."sys_icon" VALUES ('249', null, 'diy_icon_02_36', 'png');
INSERT INTO "public"."sys_icon" VALUES ('250', null, 'diy_icon_02_37', 'png');
INSERT INTO "public"."sys_icon" VALUES ('251', null, 'diy_icon_02_38', 'png');
INSERT INTO "public"."sys_icon" VALUES ('252', null, 'diy_icon_02_39', 'png');
INSERT INTO "public"."sys_icon" VALUES ('253', null, 'diy_icon_02_40', 'png');
INSERT INTO "public"."sys_icon" VALUES ('254', null, 'diy_icon_02_41', 'png');
INSERT INTO "public"."sys_icon" VALUES ('255', null, 'diy_icon_02_42', 'png');
INSERT INTO "public"."sys_icon" VALUES ('256', null, 'diy_icon_02_43', 'png');
INSERT INTO "public"."sys_icon" VALUES ('257', null, 'diy_icon_02_44', 'png');
INSERT INTO "public"."sys_icon" VALUES ('258', null, 'diy_icon_02_45', 'png');
INSERT INTO "public"."sys_icon" VALUES ('259', null, 'diy_icon_02_46', 'png');
INSERT INTO "public"."sys_icon" VALUES ('260', null, 'diy_icon_02_47', 'png');
INSERT INTO "public"."sys_icon" VALUES ('261', null, 'diy_icon_02_48', 'png');
INSERT INTO "public"."sys_icon" VALUES ('262', null, 'diy_icon_02_49', 'png');
INSERT INTO "public"."sys_icon" VALUES ('263', null, 'diy_icon_02_50', 'png');
INSERT INTO "public"."sys_icon" VALUES ('264', null, 'diy_icon_03_01', 'png');
INSERT INTO "public"."sys_icon" VALUES ('265', null, 'diy_icon_03_02', 'png');
INSERT INTO "public"."sys_icon" VALUES ('266', null, 'diy_icon_03_03', 'png');
INSERT INTO "public"."sys_icon" VALUES ('267', null, 'diy_icon_03_04', 'png');
INSERT INTO "public"."sys_icon" VALUES ('268', null, 'diy_icon_03_05', 'png');
INSERT INTO "public"."sys_icon" VALUES ('269', null, 'diy_icon_03_06', 'png');
INSERT INTO "public"."sys_icon" VALUES ('270', null, 'diy_icon_03_07', 'png');
INSERT INTO "public"."sys_icon" VALUES ('271', null, 'diy_icon_03_08', 'png');
INSERT INTO "public"."sys_icon" VALUES ('272', null, 'diy_icon_03_09', 'png');
INSERT INTO "public"."sys_icon" VALUES ('273', null, 'diy_icon_03_10', 'png');
INSERT INTO "public"."sys_icon" VALUES ('274', null, 'diy_icon_03_11', 'png');
INSERT INTO "public"."sys_icon" VALUES ('275', null, 'diy_icon_03_12', 'png');
INSERT INTO "public"."sys_icon" VALUES ('276', null, 'diy_icon_03_13', 'png');
INSERT INTO "public"."sys_icon" VALUES ('277', null, 'diy_icon_03_14', 'png');
INSERT INTO "public"."sys_icon" VALUES ('278', null, 'diy_icon_03_15', 'png');
INSERT INTO "public"."sys_icon" VALUES ('279', null, 'diy_icon_03_16', 'png');
INSERT INTO "public"."sys_icon" VALUES ('280', null, 'diy_icon_03_17', 'png');
INSERT INTO "public"."sys_icon" VALUES ('281', null, 'diy_icon_03_18', 'png');
INSERT INTO "public"."sys_icon" VALUES ('282', null, 'diy_icon_03_19', 'png');
INSERT INTO "public"."sys_icon" VALUES ('283', null, 'diy_icon_03_20', 'png');
INSERT INTO "public"."sys_icon" VALUES ('284', null, 'diy_icon_03_21', 'png');
INSERT INTO "public"."sys_icon" VALUES ('285', null, 'diy_icon_03_22', 'png');
INSERT INTO "public"."sys_icon" VALUES ('286', null, 'diy_icon_03_23', 'png');
INSERT INTO "public"."sys_icon" VALUES ('287', null, 'diy_icon_03_24', 'png');
INSERT INTO "public"."sys_icon" VALUES ('288', null, 'diy_icon_03_25', 'png');
INSERT INTO "public"."sys_icon" VALUES ('289', null, 'diy_icon_03_26', 'png');
INSERT INTO "public"."sys_icon" VALUES ('290', null, 'diy_icon_03_27', 'png');
INSERT INTO "public"."sys_icon" VALUES ('291', null, 'diy_icon_03_28', 'png');
INSERT INTO "public"."sys_icon" VALUES ('292', null, 'diy_icon_03_29', 'png');
INSERT INTO "public"."sys_icon" VALUES ('293', null, 'diy_icon_03_30', 'png');
INSERT INTO "public"."sys_icon" VALUES ('294', null, 'diy_icon_03_31', 'png');
INSERT INTO "public"."sys_icon" VALUES ('295', null, 'diy_icon_03_32', 'png');
INSERT INTO "public"."sys_icon" VALUES ('296', null, 'diy_icon_03_33', 'png');
INSERT INTO "public"."sys_icon" VALUES ('297', null, 'diy_icon_03_34', 'png');
INSERT INTO "public"."sys_icon" VALUES ('298', null, 'diy_icon_03_35', 'png');
INSERT INTO "public"."sys_icon" VALUES ('299', null, 'diy_icon_03_36', 'png');
INSERT INTO "public"."sys_icon" VALUES ('300', null, 'diy_icon_03_37', 'png');
INSERT INTO "public"."sys_icon" VALUES ('301', null, 'diy_icon_03_38', 'png');
INSERT INTO "public"."sys_icon" VALUES ('302', null, 'diy_icon_03_39', 'png');
INSERT INTO "public"."sys_icon" VALUES ('303', null, 'diy_icon_03_40', 'png');
INSERT INTO "public"."sys_icon" VALUES ('304', null, 'diy_icon_03_41', 'png');
INSERT INTO "public"."sys_icon" VALUES ('305', null, 'diy_icon_03_42', 'png');
INSERT INTO "public"."sys_icon" VALUES ('306', null, 'diy_icon_03_43', 'png');
INSERT INTO "public"."sys_icon" VALUES ('307', null, 'diy_icon_03_44', 'png');
INSERT INTO "public"."sys_icon" VALUES ('308', null, 'diy_icon_03_45', 'png');
INSERT INTO "public"."sys_icon" VALUES ('309', null, 'diy_icon_03_46', 'png');
INSERT INTO "public"."sys_icon" VALUES ('310', null, 'diy_icon_03_47', 'png');
INSERT INTO "public"."sys_icon" VALUES ('311', null, 'diy_icon_03_48', 'png');
INSERT INTO "public"."sys_icon" VALUES ('312', null, 'diy_icon_03_49', 'png');
INSERT INTO "public"."sys_icon" VALUES ('313', null, 'diy_icon_03_50', 'png');
INSERT INTO "public"."sys_icon" VALUES ('314', null, 'diy_icon_04_01', 'png');
INSERT INTO "public"."sys_icon" VALUES ('315', null, 'diy_icon_04_02', 'png');
INSERT INTO "public"."sys_icon" VALUES ('316', null, 'diy_icon_04_03', 'png');
INSERT INTO "public"."sys_icon" VALUES ('317', null, 'diy_icon_04_04', 'png');
INSERT INTO "public"."sys_icon" VALUES ('318', null, 'diy_icon_04_05', 'png');
INSERT INTO "public"."sys_icon" VALUES ('319', null, 'diy_icon_04_06', 'png');
INSERT INTO "public"."sys_icon" VALUES ('320', null, 'diy_icon_04_07', 'png');
INSERT INTO "public"."sys_icon" VALUES ('321', null, 'diy_icon_04_08', 'png');
INSERT INTO "public"."sys_icon" VALUES ('322', null, 'diy_icon_04_09', 'png');
INSERT INTO "public"."sys_icon" VALUES ('323', null, 'diy_icon_04_10', 'png');
INSERT INTO "public"."sys_icon" VALUES ('324', null, 'diy_icon_04_11', 'png');
INSERT INTO "public"."sys_icon" VALUES ('325', null, 'diy_icon_04_12', 'png');
INSERT INTO "public"."sys_icon" VALUES ('326', null, 'diy_icon_04_13', 'png');
INSERT INTO "public"."sys_icon" VALUES ('327', null, 'diy_icon_04_14', 'png');
INSERT INTO "public"."sys_icon" VALUES ('328', null, 'diy_icon_04_15', 'png');
INSERT INTO "public"."sys_icon" VALUES ('329', null, 'diy_icon_04_16', 'png');
INSERT INTO "public"."sys_icon" VALUES ('330', null, 'diy_icon_04_17', 'png');
INSERT INTO "public"."sys_icon" VALUES ('331', null, 'diy_icon_04_18', 'png');
INSERT INTO "public"."sys_icon" VALUES ('332', null, 'diy_icon_04_19', 'png');
INSERT INTO "public"."sys_icon" VALUES ('333', null, 'diy_icon_04_20', 'png');
INSERT INTO "public"."sys_icon" VALUES ('334', null, 'diy_icon_04_21', 'png');
INSERT INTO "public"."sys_icon" VALUES ('335', null, 'diy_icon_04_22', 'png');
INSERT INTO "public"."sys_icon" VALUES ('336', null, 'diy_icon_04_23', 'png');
INSERT INTO "public"."sys_icon" VALUES ('337', null, 'diy_icon_04_24', 'png');
INSERT INTO "public"."sys_icon" VALUES ('338', null, 'diy_icon_04_25', 'png');
INSERT INTO "public"."sys_icon" VALUES ('339', null, 'diy_icon_04_26', 'png');
INSERT INTO "public"."sys_icon" VALUES ('340', null, 'diy_icon_04_27', 'png');
INSERT INTO "public"."sys_icon" VALUES ('341', null, 'diy_icon_04_28', 'png');
INSERT INTO "public"."sys_icon" VALUES ('342', null, 'diy_icon_04_29', 'png');
INSERT INTO "public"."sys_icon" VALUES ('343', null, 'diy_icon_04_30', 'png');
INSERT INTO "public"."sys_icon" VALUES ('344', null, 'diy_icon_04_31', 'png');
INSERT INTO "public"."sys_icon" VALUES ('345', null, 'diy_icon_04_32', 'png');
INSERT INTO "public"."sys_icon" VALUES ('346', null, 'diy_icon_04_33', 'png');
INSERT INTO "public"."sys_icon" VALUES ('347', null, 'diy_icon_04_34', 'png');
INSERT INTO "public"."sys_icon" VALUES ('348', null, 'diy_icon_04_35', 'png');
INSERT INTO "public"."sys_icon" VALUES ('349', null, 'diy_icon_04_36', 'png');
INSERT INTO "public"."sys_icon" VALUES ('350', null, 'diy_icon_04_37', 'png');
INSERT INTO "public"."sys_icon" VALUES ('351', null, 'diy_icon_04_38', 'png');
INSERT INTO "public"."sys_icon" VALUES ('352', null, 'diy_icon_04_39', 'png');
INSERT INTO "public"."sys_icon" VALUES ('353', null, 'diy_icon_04_40', 'png');
INSERT INTO "public"."sys_icon" VALUES ('354', null, 'diy_icon_04_41', 'png');
INSERT INTO "public"."sys_icon" VALUES ('355', null, 'diy_icon_04_42', 'png');
INSERT INTO "public"."sys_icon" VALUES ('356', null, 'diy_icon_04_43', 'png');
INSERT INTO "public"."sys_icon" VALUES ('357', null, 'diy_icon_04_44', 'png');
INSERT INTO "public"."sys_icon" VALUES ('358', null, 'diy_icon_04_45', 'png');
INSERT INTO "public"."sys_icon" VALUES ('359', null, 'diy_icon_04_46', 'png');
INSERT INTO "public"."sys_icon" VALUES ('360', null, 'diy_icon_04_47', 'png');
INSERT INTO "public"."sys_icon" VALUES ('361', null, 'diy_icon_04_48', 'png');
INSERT INTO "public"."sys_icon" VALUES ('362', null, 'diy_icon_04_49', 'png');
INSERT INTO "public"."sys_icon" VALUES ('363', null, 'diy_icon_04_50', 'png');
COMMIT;

-- ----------------------------
--  Table structure for sys_muti_lang
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys_muti_lang";
CREATE TABLE "public"."sys_muti_lang" (
	"id" varchar(32) NOT NULL COLLATE "default",
	"lang_key" varchar(50) NOT NULL COLLATE "default",
	"lang_context" varchar(500) NOT NULL COLLATE "default",
	"lang_code" varchar(50) NOT NULL COLLATE "default"
)
WITH (OIDS=FALSE);
ALTER TABLE "public"."sys_muti_lang" OWNER TO "postgres";

COMMENT ON TABLE "public"."sys_muti_lang" IS '多国语言字典';
COMMENT ON COLUMN "public"."sys_muti_lang"."id" IS '主键';
COMMENT ON COLUMN "public"."sys_muti_lang"."lang_key" IS '语言主键';
COMMENT ON COLUMN "public"."sys_muti_lang"."lang_context" IS '内容';
COMMENT ON COLUMN "public"."sys_muti_lang"."lang_code" IS '语言';

-- ----------------------------
--  Table structure for meta_column
-- ----------------------------
DROP TABLE IF EXISTS "public"."meta_column";
CREATE TABLE "public"."meta_column" (
	"id" int8 NOT NULL,
	"table_id" int8,
	"column_name" varchar(100) COLLATE "default",
	"column_pname" varchar(200) COLLATE "default",
	"type" int4,
	"store" varchar(20) COLLATE "default",
	"doc_values" varchar(20) COLLATE "default",
	"index" varchar(50) COLLATE "default",
	"required" varchar(20) COLLATE "default",
	"format" varchar(100) COLLATE "default",
	"remark" varchar(200) COLLATE "default",
	"family_name" varchar COLLATE "default",
	"index_id" int8
)
WITH (OIDS=FALSE);
ALTER TABLE "public"."meta_column" OWNER TO "postgres";

COMMENT ON TABLE "public"."meta_column" IS '字段';
COMMENT ON COLUMN "public"."meta_column"."id" IS '字段ID';
COMMENT ON COLUMN "public"."meta_column"."table_id" IS '表格ID';
COMMENT ON COLUMN "public"."meta_column"."column_name" IS '字段名';
COMMENT ON COLUMN "public"."meta_column"."column_pname" IS '物理名';
COMMENT ON COLUMN "public"."meta_column"."type" IS '类别';
COMMENT ON COLUMN "public"."meta_column"."store" IS 'store';
COMMENT ON COLUMN "public"."meta_column"."index" IS '分词index';
COMMENT ON COLUMN "public"."meta_column"."required" IS '是否必须';
COMMENT ON COLUMN "public"."meta_column"."remark" IS '备注';

-- ----------------------------
--  Records of meta_column
-- ----------------------------
BEGIN;
INSERT INTO "public"."meta_column" VALUES ('1', '1', 'userId', '用户ID', '1', 'false', 'true', 'true', 'false', null, '用户ID', 'profile', '1');
COMMIT;

-- ----------------------------
--  Table structure for sys_log
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys_log";
CREATE TABLE "public"."sys_log" (
	"id" int8 NOT NULL DEFAULT nextval('seq_sys_log'::regclass),
	"content" varchar(255) COLLATE "default",
	"opername" varchar(255) COLLATE "default",
	"opertime" timestamp(6) NULL,
	"result" int4 NOT NULL,
	"userid" int8,
	"ip" varchar(255) COLLATE "default"
)
WITH (OIDS=FALSE);
ALTER TABLE "public"."sys_log" OWNER TO "postgres";

-- ----------------------------
--  Records of sys_log
-- ----------------------------
BEGIN;
INSERT INTO "public"."sys_log" VALUES ('1', '退出系统', '系统登出', '2015-09-20 14:13:13.798', '1', '5', '0:0:0:0:0:0:0:1');
INSERT INTO "public"."sys_log" VALUES ('2', '登录系统', '系统登录', '2015-09-20 14:13:25.823', '1', '5', '0:0:0:0:0:0:0:1');
INSERT INTO "public"."sys_log" VALUES ('3', '退出系统', '系统登出', '2015-09-20 14:14:55.553', '1', '5', '0:0:0:0:0:0:0:1');
INSERT INTO "public"."sys_log" VALUES ('4', '登录系统', '系统登录', '2015-09-20 14:15:18.818', '1', '5', '0:0:0:0:0:0:0:1');
INSERT INTO "public"."sys_log" VALUES ('5', '登录系统', '系统登录', '2015-09-20 14:15:31.693', '1', '5', '0:0:0:0:0:0:0:1');
INSERT INTO "public"."sys_log" VALUES ('6', '登录系统', '系统登录', '2015-09-20 14:16:14.335', '1', '5', '0:0:0:0:0:0:0:1');
INSERT INTO "public"."sys_log" VALUES ('7', '登录系统', '系统登录', '2015-09-20 21:24:55.535', '1', '5', '0:0:0:0:0:0:0:1');
INSERT INTO "public"."sys_log" VALUES ('8', '登录系统', '系统登录', '2015-09-21 23:27:53.789', '1', '5', '0:0:0:0:0:0:0:1');
INSERT INTO "public"."sys_log" VALUES ('9', '退出系统', '系统登出', '2015-09-21 23:36:52.221', '1', '5', '0:0:0:0:0:0:0:1');
INSERT INTO "public"."sys_log" VALUES ('10', '登录系统', '系统登录', '2015-09-21 23:36:53.636', '1', '5', '0:0:0:0:0:0:0:1');
INSERT INTO "public"."sys_log" VALUES ('11', '退出系统', '系统登出', '2015-10-02 00:12:25.01', '1', '5', '0:0:0:0:0:0:0:1');
INSERT INTO "public"."sys_log" VALUES ('12', '登录系统', '系统登录', '2015-10-02 00:12:27.011', '1', '5', '0:0:0:0:0:0:0:1');
INSERT INTO "public"."sys_log" VALUES ('13', '退出系统', '系统登出', '2015-10-02 23:50:53.175', '1', '5', '0:0:0:0:0:0:0:1');
INSERT INTO "public"."sys_log" VALUES ('14', '登录系统', '系统登录', '2015-10-02 23:50:55.251', '1', '5', '0:0:0:0:0:0:0:1');
INSERT INTO "public"."sys_log" VALUES ('15', '退出系统', '系统登出', '2015-10-02 23:52:07.715', '1', '5', '0:0:0:0:0:0:0:1');
INSERT INTO "public"."sys_log" VALUES ('16', '登录系统', '系统登录', '2015-10-02 23:52:09.192', '1', '5', '0:0:0:0:0:0:0:1');
INSERT INTO "public"."sys_log" VALUES ('17', '退出系统', '系统登出', '2015-10-19 22:45:47.787', '1', '5', '0:0:0:0:0:0:0:1');
INSERT INTO "public"."sys_log" VALUES ('18', '登录系统', '系统登录', '2015-10-19 22:45:49.616', '1', '5', '0:0:0:0:0:0:0:1');
INSERT INTO "public"."sys_log" VALUES ('19', '退出系统', '系统登出', '2015-10-19 22:46:43.887', '1', '5', '0:0:0:0:0:0:0:1');
INSERT INTO "public"."sys_log" VALUES ('20', '登录系统', '系统登录', '2015-10-19 22:46:45.395', '1', '5', '0:0:0:0:0:0:0:1');
INSERT INTO "public"."sys_log" VALUES ('21', '退出系统', '系统登出', '2015-10-26 23:49:08.241', '1', '5', '0:0:0:0:0:0:0:1');
INSERT INTO "public"."sys_log" VALUES ('22', '登录系统', '系统登录', '2015-10-26 23:49:10.114', '1', '5', '0:0:0:0:0:0:0:1');
INSERT INTO "public"."sys_log" VALUES ('23', '退出系统', '系统登出', '2015-10-29 22:47:41.648', '1', '5', '0:0:0:0:0:0:0:1');
INSERT INTO "public"."sys_log" VALUES ('24', '登录系统', '系统登录', '2015-10-29 22:47:43.346', '1', '5', '0:0:0:0:0:0:0:1');
INSERT INTO "public"."sys_log" VALUES ('25', '退出系统', '系统登出', '2015-11-30 23:00:25.644', '1', '5', '0:0:0:0:0:0:0:1');
INSERT INTO "public"."sys_log" VALUES ('26', '登录系统', '系统登录', '2015-11-30 23:00:27.544', '1', '5', '0:0:0:0:0:0:0:1');
INSERT INTO "public"."sys_log" VALUES ('27', '登录系统', '系统登录', '2015-12-02 00:09:45.802', '1', '5', '0:0:0:0:0:0:0:1');
INSERT INTO "public"."sys_log" VALUES ('28', '退出系统', '系统登出', '2015-12-03 23:53:33.122', '1', '5', '0:0:0:0:0:0:0:1');
INSERT INTO "public"."sys_log" VALUES ('29', '登录系统', '系统登录', '2015-12-03 23:53:34.571', '1', '5', '0:0:0:0:0:0:0:1');
COMMIT;

-- ----------------------------
--  Table structure for sys_test
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys_test";
CREATE TABLE "public"."sys_test" (
	"id" int8 NOT NULL DEFAULT nextval('seq_sys_test'::regclass),
	"aaa" varchar(255) COLLATE "default",
	"bbb" varchar(255) COLLATE "default",
	"ccc" varchar(255) COLLATE "default",
	"ddd" varchar(255) COLLATE "default",
	"eee" varchar(255) COLLATE "default",
	"eight" varchar(255) COLLATE "default",
	"fff" varchar(255) COLLATE "default",
	"five" varchar(255) COLLATE "default",
	"four" varchar(255) COLLATE "default",
	"ggg" varchar(255) COLLATE "default",
	"hhh" varchar(255) COLLATE "default",
	"iii" varchar(255) COLLATE "default",
	"jjj" varchar(255) COLLATE "default",
	"kkk" varchar(255) COLLATE "default",
	"lll" varchar(255) COLLATE "default",
	"nine" varchar(255) COLLATE "default",
	"one" varchar(255) COLLATE "default",
	"seven" varchar(255) COLLATE "default",
	"six" varchar(255) COLLATE "default",
	"ten" varchar(255) COLLATE "default",
	"three" varchar(255) COLLATE "default",
	"tow" varchar(255) COLLATE "default"
)
WITH (OIDS=FALSE);
ALTER TABLE "public"."sys_test" OWNER TO "postgres";

-- ----------------------------
--  Records of sys_test
-- ----------------------------
BEGIN;
INSERT INTO "public"."sys_test" VALUES ('3', 'ss', 'dd', 'ss', 'aa', 'dd', 'dd', 'aa', 'dd', 'dd', 'aa', 'dd', 'aa', 'dd', 'ssd', 'ss', 'aa', 'sss', 'dd', 'aa', 'dd', 'aa', 'aa');
COMMIT;

-- ----------------------------
--  Table structure for sys_timetask
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys_timetask";
CREATE TABLE "public"."sys_timetask" (
	"id" int8 NOT NULL,
	"createby" varchar(32) COLLATE "default",
	"createdate" timestamp(6) NULL,
	"createname" varchar(32) COLLATE "default",
	"cronexpression" varchar(100) NOT NULL COLLATE "default",
	"iseffect" varchar(1) NOT NULL COLLATE "default",
	"isstart" varchar(1) NOT NULL COLLATE "default",
	"taskdescribe" varchar(50) NOT NULL COLLATE "default",
	"taskid" varchar(100) NOT NULL COLLATE "default",
	"updateby" varchar(32) COLLATE "default",
	"updatedate" timestamp(6) NULL,
	"updatename" varchar(32) COLLATE "default"
)
WITH (OIDS=FALSE);
ALTER TABLE "public"."sys_timetask" OWNER TO "postgres";

-- ----------------------------
--  Records of sys_timetask
-- ----------------------------
BEGIN;
INSERT INTO "public"."sys_timetask" VALUES ('1', 'admin', '2015-04-02 19:22:49', '管理员', '0 0/1 * * * ?', '1', '0', '消息中间件定时任务', 'smsSendTaskCronTrigger', 'admin', '2015-04-02 20:03:01', '管理员');
INSERT INTO "public"."sys_timetask" VALUES ('2', null, null, null, '0 0/1 * * * ?', '1', '1', '测试Demo', 'taskDemoServiceTaskCronTrigger', 'admin', '2015-04-02 19:49:44', '管理员');
COMMIT;

-- ----------------------------
--  Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys_user_role";
CREATE TABLE "public"."sys_user_role" (
	"user_id" int8 NOT NULL,
	"role_id" int8 NOT NULL
)
WITH (OIDS=FALSE);
ALTER TABLE "public"."sys_user_role" OWNER TO "postgres";

-- ----------------------------
--  Records of sys_user_role
-- ----------------------------
BEGIN;
INSERT INTO "public"."sys_user_role" VALUES ('4', '7');
INSERT INTO "public"."sys_user_role" VALUES ('5', '1');
INSERT INTO "public"."sys_user_role" VALUES ('7', '6');
INSERT INTO "public"."sys_user_role" VALUES ('8', '1');
INSERT INTO "public"."sys_user_role" VALUES ('9', '9');
COMMIT;

-- ----------------------------
--  Table structure for sys_role_res
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys_role_res";
CREATE TABLE "public"."sys_role_res" (
	"role_id" int8 NOT NULL,
	"res_id" int8 NOT NULL
)
WITH (OIDS=FALSE);
ALTER TABLE "public"."sys_role_res" OWNER TO "postgres";

-- ----------------------------
--  Records of sys_role_res
-- ----------------------------
BEGIN;
INSERT INTO "public"."sys_role_res" VALUES ('1', '1');
INSERT INTO "public"."sys_role_res" VALUES ('1', '2');
INSERT INTO "public"."sys_role_res" VALUES ('1', '3');
INSERT INTO "public"."sys_role_res" VALUES ('1', '4');
INSERT INTO "public"."sys_role_res" VALUES ('1', '5');
INSERT INTO "public"."sys_role_res" VALUES ('1', '7');
INSERT INTO "public"."sys_role_res" VALUES ('1', '8');
INSERT INTO "public"."sys_role_res" VALUES ('1', '9');
INSERT INTO "public"."sys_role_res" VALUES ('1', '10');
INSERT INTO "public"."sys_role_res" VALUES ('1', '11');
INSERT INTO "public"."sys_role_res" VALUES ('1', '12');
INSERT INTO "public"."sys_role_res" VALUES ('1', '13');
INSERT INTO "public"."sys_role_res" VALUES ('1', '14');
INSERT INTO "public"."sys_role_res" VALUES ('1', '15');
INSERT INTO "public"."sys_role_res" VALUES ('1', '16');
INSERT INTO "public"."sys_role_res" VALUES ('1', '17');
INSERT INTO "public"."sys_role_res" VALUES ('1', '18');
INSERT INTO "public"."sys_role_res" VALUES ('1', '19');
INSERT INTO "public"."sys_role_res" VALUES ('1', '20');
INSERT INTO "public"."sys_role_res" VALUES ('1', '21');
INSERT INTO "public"."sys_role_res" VALUES ('1', '22');
INSERT INTO "public"."sys_role_res" VALUES ('1', '23');
INSERT INTO "public"."sys_role_res" VALUES ('1', '24');
INSERT INTO "public"."sys_role_res" VALUES ('1', '25');
INSERT INTO "public"."sys_role_res" VALUES ('1', '28');
INSERT INTO "public"."sys_role_res" VALUES ('1', '29');
INSERT INTO "public"."sys_role_res" VALUES ('1', '30');
INSERT INTO "public"."sys_role_res" VALUES ('1', '31');
INSERT INTO "public"."sys_role_res" VALUES ('1', '32');
INSERT INTO "public"."sys_role_res" VALUES ('1', '33');
INSERT INTO "public"."sys_role_res" VALUES ('1', '34');
INSERT INTO "public"."sys_role_res" VALUES ('1', '35');
INSERT INTO "public"."sys_role_res" VALUES ('1', '36');
INSERT INTO "public"."sys_role_res" VALUES ('1', '37');
INSERT INTO "public"."sys_role_res" VALUES ('1', '39');
INSERT INTO "public"."sys_role_res" VALUES ('1', '40');
INSERT INTO "public"."sys_role_res" VALUES ('1', '41');
INSERT INTO "public"."sys_role_res" VALUES ('1', '42');
INSERT INTO "public"."sys_role_res" VALUES ('1', '43');
INSERT INTO "public"."sys_role_res" VALUES ('1', '44');
INSERT INTO "public"."sys_role_res" VALUES ('1', '45');
INSERT INTO "public"."sys_role_res" VALUES ('1', '46');
INSERT INTO "public"."sys_role_res" VALUES ('1', '47');
INSERT INTO "public"."sys_role_res" VALUES ('1', '49');
INSERT INTO "public"."sys_role_res" VALUES ('1', '50');
INSERT INTO "public"."sys_role_res" VALUES ('1', '51');
INSERT INTO "public"."sys_role_res" VALUES ('1', '52');
INSERT INTO "public"."sys_role_res" VALUES ('1', '53');
INSERT INTO "public"."sys_role_res" VALUES ('1', '54');
INSERT INTO "public"."sys_role_res" VALUES ('1', '55');
INSERT INTO "public"."sys_role_res" VALUES ('1', '57');
INSERT INTO "public"."sys_role_res" VALUES ('1', '58');
INSERT INTO "public"."sys_role_res" VALUES ('1', '59');
INSERT INTO "public"."sys_role_res" VALUES ('1', '60');
INSERT INTO "public"."sys_role_res" VALUES ('1', '61');
INSERT INTO "public"."sys_role_res" VALUES ('1', '62');
INSERT INTO "public"."sys_role_res" VALUES ('1', '63');
INSERT INTO "public"."sys_role_res" VALUES ('1', '64');
INSERT INTO "public"."sys_role_res" VALUES ('6', '5');
INSERT INTO "public"."sys_role_res" VALUES ('6', '28');
INSERT INTO "public"."sys_role_res" VALUES ('6', '29');
INSERT INTO "public"."sys_role_res" VALUES ('6', '30');
INSERT INTO "public"."sys_role_res" VALUES ('6', '32');
INSERT INTO "public"."sys_role_res" VALUES ('6', '33');
INSERT INTO "public"."sys_role_res" VALUES ('6', '34');
INSERT INTO "public"."sys_role_res" VALUES ('6', '35');
INSERT INTO "public"."sys_role_res" VALUES ('6', '41');
INSERT INTO "public"."sys_role_res" VALUES ('6', '52');
INSERT INTO "public"."sys_role_res" VALUES ('7', '5');
INSERT INTO "public"."sys_role_res" VALUES ('7', '28');
INSERT INTO "public"."sys_role_res" VALUES ('7', '29');
INSERT INTO "public"."sys_role_res" VALUES ('7', '30');
INSERT INTO "public"."sys_role_res" VALUES ('7', '32');
INSERT INTO "public"."sys_role_res" VALUES ('7', '33');
INSERT INTO "public"."sys_role_res" VALUES ('7', '34');
INSERT INTO "public"."sys_role_res" VALUES ('7', '35');
INSERT INTO "public"."sys_role_res" VALUES ('7', '41');
INSERT INTO "public"."sys_role_res" VALUES ('7', '52');
INSERT INTO "public"."sys_role_res" VALUES ('8', '5');
INSERT INTO "public"."sys_role_res" VALUES ('8', '46');
INSERT INTO "public"."sys_role_res" VALUES ('8', '47');
INSERT INTO "public"."sys_role_res" VALUES ('9', '1');
INSERT INTO "public"."sys_role_res" VALUES ('9', '2');
INSERT INTO "public"."sys_role_res" VALUES ('9', '3');
INSERT INTO "public"."sys_role_res" VALUES ('9', '4');
INSERT INTO "public"."sys_role_res" VALUES ('9', '5');
INSERT INTO "public"."sys_role_res" VALUES ('9', '7');
INSERT INTO "public"."sys_role_res" VALUES ('9', '8');
INSERT INTO "public"."sys_role_res" VALUES ('9', '9');
INSERT INTO "public"."sys_role_res" VALUES ('9', '10');
INSERT INTO "public"."sys_role_res" VALUES ('9', '11');
INSERT INTO "public"."sys_role_res" VALUES ('9', '12');
INSERT INTO "public"."sys_role_res" VALUES ('9', '13');
INSERT INTO "public"."sys_role_res" VALUES ('9', '14');
INSERT INTO "public"."sys_role_res" VALUES ('9', '15');
INSERT INTO "public"."sys_role_res" VALUES ('9', '16');
INSERT INTO "public"."sys_role_res" VALUES ('9', '17');
INSERT INTO "public"."sys_role_res" VALUES ('9', '18');
INSERT INTO "public"."sys_role_res" VALUES ('9', '19');
INSERT INTO "public"."sys_role_res" VALUES ('9', '20');
INSERT INTO "public"."sys_role_res" VALUES ('9', '21');
INSERT INTO "public"."sys_role_res" VALUES ('9', '22');
INSERT INTO "public"."sys_role_res" VALUES ('9', '23');
INSERT INTO "public"."sys_role_res" VALUES ('9', '24');
INSERT INTO "public"."sys_role_res" VALUES ('9', '25');
INSERT INTO "public"."sys_role_res" VALUES ('9', '28');
INSERT INTO "public"."sys_role_res" VALUES ('9', '29');
INSERT INTO "public"."sys_role_res" VALUES ('9', '30');
INSERT INTO "public"."sys_role_res" VALUES ('9', '31');
INSERT INTO "public"."sys_role_res" VALUES ('9', '32');
INSERT INTO "public"."sys_role_res" VALUES ('9', '33');
INSERT INTO "public"."sys_role_res" VALUES ('9', '34');
INSERT INTO "public"."sys_role_res" VALUES ('9', '35');
INSERT INTO "public"."sys_role_res" VALUES ('9', '36');
INSERT INTO "public"."sys_role_res" VALUES ('9', '37');
INSERT INTO "public"."sys_role_res" VALUES ('9', '39');
INSERT INTO "public"."sys_role_res" VALUES ('9', '40');
INSERT INTO "public"."sys_role_res" VALUES ('9', '41');
INSERT INTO "public"."sys_role_res" VALUES ('9', '42');
INSERT INTO "public"."sys_role_res" VALUES ('9', '43');
INSERT INTO "public"."sys_role_res" VALUES ('9', '44');
INSERT INTO "public"."sys_role_res" VALUES ('9', '45');
INSERT INTO "public"."sys_role_res" VALUES ('9', '46');
INSERT INTO "public"."sys_role_res" VALUES ('9', '47');
INSERT INTO "public"."sys_role_res" VALUES ('9', '49');
INSERT INTO "public"."sys_role_res" VALUES ('9', '50');
INSERT INTO "public"."sys_role_res" VALUES ('9', '51');
INSERT INTO "public"."sys_role_res" VALUES ('9', '52');
COMMIT;

-- ----------------------------
--  Table structure for act_ru_execution
-- ----------------------------
DROP TABLE IF EXISTS "public"."act_ru_execution";
CREATE TABLE "public"."act_ru_execution" (
	"id_" varchar(64) NOT NULL COLLATE "default",
	"rev_" int4,
	"proc_inst_id_" varchar(64) COLLATE "default",
	"business_key_" varchar(255) COLLATE "default",
	"parent_id_" varchar(64) COLLATE "default",
	"proc_def_id_" varchar(64) COLLATE "default",
	"super_exec_" varchar(64) COLLATE "default",
	"act_id_" varchar(255) COLLATE "default",
	"is_active_" int2,
	"is_concurrent_" int2,
	"is_scope_" int2,
	"is_event_scope_" int2,
	"suspension_state_" int4,
	"cached_ent_state_" int4
)
WITH (OIDS=FALSE);
ALTER TABLE "public"."act_ru_execution" OWNER TO "postgres";

-- ----------------------------
--  Records of act_ru_execution
-- ----------------------------
BEGIN;
INSERT INTO "public"."act_ru_execution" VALUES ('1001', '4', '1001', '7', null, 'leave:1:4', null, 'deptLeaderAudit', '1', '0', '1', '0', '1', '2');
INSERT INTO "public"."act_ru_execution" VALUES ('1101', '1', '1101', '8', null, 'leave:1:4', null, 'deptLeaderAudit', '1', '0', '1', '0', '1', '2');
INSERT INTO "public"."act_ru_execution" VALUES ('1201', '1', '1201', '9', null, 'leave:1:4', null, 'deptLeaderAudit', '1', '0', '1', '0', '1', '2');
INSERT INTO "public"."act_ru_execution" VALUES ('1212', '1', '1212', '10', null, 'leave:1:4', null, 'deptLeaderAudit', '1', '0', '1', '0', '1', '2');
INSERT INTO "public"."act_ru_execution" VALUES ('1308', '1', '1308', null, null, 'freeLeave:1:1306', null, null, '0', '0', '1', '0', '1', '0');
INSERT INTO "public"."act_ru_execution" VALUES ('1319', '1', '1308', null, '1308', 'freeLeave:1:1306', null, 'approval', '1', '0', '1', '0', '1', '2');
INSERT INTO "public"."act_ru_execution" VALUES ('15', '3', '15', '3', null, 'leave:1:4', null, 'reportBack', '1', '0', '1', '0', '1', '2');
INSERT INTO "public"."act_ru_execution" VALUES ('2001', '2', '2001', null, null, 'freeLeave:3:1906', null, 'usertask1', '1', '0', '1', '0', '1', '2');
INSERT INTO "public"."act_ru_execution" VALUES ('2033', '2', '2033', null, null, 'freeLeave:3:1906', null, 'usertask1', '1', '0', '1', '0', '1', '2');
INSERT INTO "public"."act_ru_execution" VALUES ('2065', '1', '2065', null, null, 'freeLeave:3:1906', null, null, '0', '0', '1', '0', '1', '0');
INSERT INTO "public"."act_ru_execution" VALUES ('2076', '1', '2065', null, '2065', 'freeLeave:3:1906', null, 'approval', '1', '0', '1', '0', '1', '2');
INSERT INTO "public"."act_ru_execution" VALUES ('2088', '1', '2088', null, null, 'freeLeave:3:1906', null, null, '0', '0', '1', '0', '1', '0');
INSERT INTO "public"."act_ru_execution" VALUES ('2099', '1', '2088', null, '2088', 'freeLeave:3:1906', null, 'approval', '1', '0', '1', '0', '1', '2');
INSERT INTO "public"."act_ru_execution" VALUES ('2119', '1', '2119', null, null, 'freeLeave:3:1906', null, null, '0', '0', '1', '0', '1', '0');
INSERT INTO "public"."act_ru_execution" VALUES ('2130', '1', '2119', null, '2119', 'freeLeave:3:1906', null, 'approval', '1', '0', '1', '0', '1', '2');
INSERT INTO "public"."act_ru_execution" VALUES ('2209', '1', '2209', null, null, 'freeLeave:3:1906', null, null, '0', '0', '1', '0', '1', '0');
INSERT INTO "public"."act_ru_execution" VALUES ('2220', '1', '2209', null, '2209', 'freeLeave:3:1906', null, 'approval', '1', '0', '1', '0', '1', '2');
INSERT INTO "public"."act_ru_execution" VALUES ('2301', '1', '2301', '11', null, 'leave:4:1907', null, 'deptLeaderAudit', '1', '0', '1', '0', '1', '2');
INSERT INTO "public"."act_ru_execution" VALUES ('2401', '1', '2401', '12', null, 'leave:4:1907', null, 'deptLeaderAudit', '1', '0', '1', '0', '1', '2');
INSERT INTO "public"."act_ru_execution" VALUES ('2501', '1', '2501', '13', null, 'leave:4:1907', null, 'deptLeaderAudit', '1', '0', '1', '0', '1', '2');
INSERT INTO "public"."act_ru_execution" VALUES ('801', '8', '801', '5', null, 'leave:1:4', null, 'reportBack', '1', '0', '1', '0', '1', '2');
INSERT INTO "public"."act_ru_execution" VALUES ('901', '1', '901', '6', null, 'leave:1:4', null, 'deptLeaderAudit', '1', '0', '1', '0', '1', '2');
COMMIT;

-- ----------------------------
--  Table structure for act_re_deployment
-- ----------------------------
DROP TABLE IF EXISTS "public"."act_re_deployment";
CREATE TABLE "public"."act_re_deployment" (
	"id_" varchar(64) NOT NULL COLLATE "default",
	"name_" varchar(255) COLLATE "default",
	"category_" varchar(255) COLLATE "default",
	"deploy_time_" timestamp(6) NOT NULL
)
WITH (OIDS=FALSE);
ALTER TABLE "public"."act_re_deployment" OWNER TO "postgres";

-- ----------------------------
--  Records of act_re_deployment
-- ----------------------------
BEGIN;
INSERT INTO "public"."act_re_deployment" VALUES ('1', 'SpringAutoDeployment', null, '2014-03-24 09:57:01');
INSERT INTO "public"."act_re_deployment" VALUES ('1301', 'SpringAutoDeployment', null, '2014-04-23 08:39:10');
INSERT INTO "public"."act_re_deployment" VALUES ('1701', 'SpringAutoDeployment', null, '2014-04-23 12:07:53');
INSERT INTO "public"."act_re_deployment" VALUES ('1901', 'SpringAutoDeployment', null, '2014-04-25 08:48:30');
COMMIT;

-- ----------------------------
--  Table structure for act_ru_event_subscr
-- ----------------------------
DROP TABLE IF EXISTS "public"."act_ru_event_subscr";
CREATE TABLE "public"."act_ru_event_subscr" (
	"id_" varchar(64) NOT NULL COLLATE "default",
	"rev_" int4,
	"event_type_" varchar(255) NOT NULL COLLATE "default",
	"event_name_" varchar(255) COLLATE "default",
	"execution_id_" varchar(64) COLLATE "default",
	"proc_inst_id_" varchar(64) COLLATE "default",
	"activity_id_" varchar(64) COLLATE "default",
	"configuration_" varchar(255) COLLATE "default",
	"created_" timestamp(6) NOT NULL
)
WITH (OIDS=FALSE);
ALTER TABLE "public"."act_ru_event_subscr" OWNER TO "postgres";

-- ----------------------------
--  Table structure for act_ge_bytearray
-- ----------------------------
DROP TABLE IF EXISTS "public"."act_ge_bytearray";
CREATE TABLE "public"."act_ge_bytearray" (
	"id_" varchar(64) NOT NULL COLLATE "default",
	"rev_" int4,
	"name_" varchar(255) COLLATE "default",
	"deployment_id_" varchar(64) COLLATE "default",
	"bytes_" bytea,
	"generated_" int2
)
WITH (OIDS=FALSE);
ALTER TABLE "public"."act_ge_bytearray" OWNER TO "postgres";

-- ----------------------------
--  Records of act_ge_bytearray
-- ----------------------------
BEGIN;
INSERT INTO "public"."act_ge_bytearray" VALUES ('1302', '1', 'leave/leave.png', '1301', '\211PNG\015\012\032\012\000\000\000\015IHDR\000\000\002\327\000\000\002E\010\002\000\000\000\231BLB\000\000T`IDATx\234\354\335\011x\024U\272\377q\006\227\341\177\237\231+\314\205Q\034\307{\021G\346\336q\003\361\252w\034QPF\331\004\221E6A\366}M\330\222\260\313"\012n#\233\002\016\002\303&\210\022\300\010\204-\011IX\302\222\004\022 !\010\030\004b\200,\335\235\376\277]\2254M\002\241\003iNW\237\357\347\251\247\236\323\325''\225:Uo\235\376\321\351\204\012N\000\000\000\025*\250>\000\000\000\240)R\010\000\000P\203\024\002\000\000\324 \205\000\000\0005H!\000\000@\015R\010\000\000P\203\024\002\000\000\324 \205\000\000\0005H!\000\000@\015R\010\000\000P\203\024\002\000\000\324 \205\000\000\0005H!\000\000@\015R\010\000\000P\203\024\002\000\000\324 \205\000\000\0005H!\000\000@\015R\010\000\000P\203\024\002\000\000\324 \205\000\000\0005H!\000\000@\015R\010\000\000P\203\024\002\000\000\324 \205\000\000\0005H!\000\000@\015R\010\000\000P\203\024\002\000\000\324 \205\000\000\0005H!\000\000@\015R\010\000\000P\203\024\002\000\000\324 \205\000\000\0005H!\000\000@\015R\010\000\000P\203\024\002\000\000\324 \205\000\000\0005H!\000\000@\015R\010\000\000P\203\024\002\000\000\324 \205\000\000\0005H!\000\000@\015R\010\000\000P\203\024\002\000\000\324 \205\000\000\0005H!\000\000@\015R\010\000\000P\203\024\002\000\000\324 \205\000\000\0005H!\000\000@\015R\010\000\000P\203\024\002\000\000\324 \205\000\000\0005H!\000\000@\015R\010\000\000P\203\024\002\000\000\324 \205\000\000\0005H!\000\000@\015R\010\000\000P\203\024\002\000\000\324 \205\000\000\0005H!\000\000@\015R\010\000\000P\203\024\002\000\000\324 \205\000\000\0005H!\000\000@\015R\010\000\000P\203\024\002\000\000\324 \205\000\000\0005H!\000\000@\015R\010\000\000P\203\024\002\000\000\324 \205\000\000\0005H!\000\000@\015R\010\000\000P\203\024\002\000\000\324 \205\000\000\0005H!\000\000@\015R\010\000\000P\203\024\002\000\000\324 \205\334@tt\364\350\321\243k\327\256}\337}\367\335q\307\035\025t%c\2273 \347A\316\206\234\023\325\227\005~\204{\304\304=b-\324\255Iy\335\222B\256+))\251E\213\026\017?\374\360\360\341\303w\356\214:\236\226\236\227o\313\267\311b7\026w\343\232\017Kn\267v\377\274\374|9\003r\036\206\005\005\3119i\336\274ybb\242\352K\004\305\270G\270G\254\210\272\365\253\272%\205\\\333\356\335\273+U\2524y\362\344\31399R\237\306\005s\255m6\263X\257\261\330\354\356v\200\367\227s2e\312\224j\325\252\255[\267N\365\205\2022\334#\334#VD\335\372[\335\222B\256A.@\205\012\025"##\215\253\225o\244d\327%+j\033k\273-\377\352-\236\213\016\3757l\334 gIni\325\227\013\012p\217p\217X\021u\353\207uK\012).))\351\367\277\377\375\306\215\353\363my6[^\276-W\026\263Q\354\241\253\203=\317\354\346nh\325?2r\313\257\177\375k\336v\326\015\367\010\367\210\025Q\267\376Y\267\244\220\342Z\264h1y\362$\343\362\310\265\311q5\354\271E\027\254\260]\264%\307\334^\330M\313\376S\246Ln\366zS\325\027\015\267\025\367\010\367\210\025Q\267\376Y\267\244\220\253\304\304\304<\364\320C9\271\027\345\032\330dq]!Y\347\344\027\265\315\305f\256\355\356F\256\266\375/\347d\327\254\371\020\277\021\240\017\356\021\356\021+\242n\375\266nI!W\011\011\011\011\016\016\266\331.\033W\353\262,\365\376\336\330\313\337w2\373\273\256_\321\227_i\330\215\215f\007{\216\347\376\003\240\177P\320\220\321\243G\253\276t\270M\270G\270G\254\210\272\365\333\272%\205\\\245v\355\332;vD\346\333.\031W\345\322\213/7\374\321\351<\356p\036\2669\017\3469\367\3469c\263\3553V\376\260!\343BL\2763:\307\031\223\343\334v\311\2711\327\371\341\266\204\356=z\032\227\360\262\373\313=\333\346\303+m[\341S\001\320\177\347\316\255O>\371\204\352K\347[\221\221\221\377\361\037\377\261e\313\026\325\007\242\036\367H\340\335#:\2247u\353\267uK\012\271J\365\352\325\217\037?b\263_2\027I\301\331N\347\305\002\347\005\273\363\347|\347%\247s\310\250\260\012\025\177\363l\303\346\0316gz\2363=\327y,\307y\304\356\\\266s\257t\266\271\256\342E\363k]\015\233\261\037\333%\263\221\357~X\264\377\300\350\237\226\236r\357\275\367\252\276t>$\263\363\357~\367\273\025+W\312L\275y\363f\325\207\243\030\367H\200\335#\232\2247u\353\267u[\016)d\317\236=c\306\214i\322\244I\235:u\356\273\357\276\273\356\272K\326\322n\334\270\261l\227go\375[\3346w\334qG^~\266\315u\221.\3125\220\342\273\344p\3469\\O\331\013\\\353o\276[\177\177\315GGO\234nw:\177\261;/\330\234?\333\234\347\235\316\215\273\366\271*\325n\\f\327\305\276h\\\362\302\375\024>\364l\024m\017\200\376\371\371\331\025+VT{\341|\307\234\243#"~\310\267\331\177\370a\223\217f\352\224\224\224\035;v\354\332\265+...\336\020\033\033\033\025\025\225\234\234\\\254\247<\025\026\026V\356\007\340=\356\221@\272G|T\336~X\317\324\255\337\326\355\315\247\220\013\027.\214\0301\342\301\007\037\254Y\263\346\320\241C\327\256]\033\025\025}<-=7\317\365\207\330\244\275z\315\032\331.\317\376\361\217\177\224\236\322\277\034\217\333G\214\314\373\213\315.\305\232-kyx\321\356<{\331\231\357(\354p\376\374\371\017>\2365\341\275\217\323O\236\222\207\266\002g\276Q\301;\342\366\026~\255\361\205\205;)\331pu\270\262\377\200\351/cWw\321|\310s\2166\027\037\005\221\341\303\207\317\2325k\365\325\346\314\231\323\257_?\367\221\214\0349\262K\227.\357\275\367\2364&M\232\324\250Q\243\340\340\340\333\377\231G\356\221\200\271G|W\336~X\317\324\255\337\326\355\315|\203\234\234\234\0313fT\253V\255g\317\236{\366\356\273\316_\207\275\262\354\335\227\320\255{w\351\377\301\007\037\310\327\226\373\030\312\221\221y\345\354g\231kW\245:\234?]r\236\316v\332\234\316\374\274\274?\327\252U\241\302\035\025*Tz\363\255N\236_\030\033\277\373\312\327\026^N\367~<\032v\317\355Y\001\323\337\017g\330[Wr\216v\317\324\262\275|\177\210.\023\361\326\255[e\246^\277~\375\306\215\033e-\355m\333\266\015\0336L\236\315\314\314\224\1772\356\337\277\277u\353\326\362}\023\023\023\247L\231"\023\367\201\003\007\366\354\331s\356\334\271r<\222\033\342\036\011\214{\304\247\345\355\207\365L\335\372m\335\226\371\033ddd\324\255[\267I\223&\222-n\230?\212e\221\306\215\233<\375\364\323\262\007_\214\244\\\030\325\226e\234}\271\014Y\346\273v\222\227O\376\342<\223\353\214=\220z\357\275\367\336q\347\335\377\357\236\252m\333]U\251\273\342\342\245\263\335u!\263\354\366,\317\235\330\355\205\015Y\233\035<\236\012\220\376\3766\303\336\272\353\315\321\346"\333\313\367\323|2k\307\304\304DEE\311,\274o\337>Y\313\303\330\330X\371\327\241\323x\177{\311\222%c\306\214\221\177b\216."\355\261c\307.^\2748--\255\274\016\303\033\334#\001p\217\370\272\274\375\260\236\251[\277\255\333\262}\203\364\364\364j\325\252\275\367\336{e\312\037\236\313\344\311S\252W\257\356\267\277:o\274\363v\301u1\354\027\314\013p\271\300\371s\216+/\377\224\353\214\330\225\370\330\023OU\255\366\373{*W\231\265pY\256\323\231\235\347\274\224\347\372\302mQ\273\012\277\326\365\345\205k\343\222_\331b\\\362\013\236\373\017\230\376~5\303\336\272\322\347h_\004\021\231\265SSS\227.]:j\324\250\260\2600\231\224\227/_~\374\370qs\3266\265k\327n\243\007\371\367e\373\366\355\313\345\273\227\011\367\210\325\357\221\333P\336~X\317\324\255\337\326m\031\276\201D\0079 )\246\233\216 \346\262b\345J\331\217\004\032\337\215\352\246\031\325v\336\356\2720\347e1/\200\024\353\005\233\363\\\276\244f\333\216\204cO\324\251\373\322+\257\235\311s\236\316q\236\311q\236\315sJ\255n\2131*\325n^`\327b\\]cW\366\302\265\315s\243\261\377\200\351\357?3\354\255\363f\216.\367 b\316\332\203\007\017\316\314\314t\032\037\272\032:th\311Y\373]\017\223&M\352\330\261\343\255\177\353\262\342\036\261\364=r{\312\333\017\353\231\272\365\333\272\365\366\033dddT\257^}\365\352\325\267\030A\314e\311\322\245\325\252U\363\303\037\315\030\325v\336\2706r%\316\275P\357\205}\207\016\307&$F\355I\334\036\237\270}w\362\216})\233b\016\356L8\032\031\237\2745>i\373\356\244\250\275\311\011\207\323>\235\375\371\233\255Z\231_e3\327\266\363\236\017\215v\321\303\242\375\007L\177?\231ao\235\367st\371\006\021s\326\016\012\012*e\326\0360`\300\204\011\023\334\263\366\370\361\343e\226\277\305\357{\023\270G\254{\217\334\266\362\366\303z\246n\375\266n\275\372\006999u\353\326\275\225\037\304\224\\&O\236\362\364\323O\373\333\207U\215\237\377\311\0058g\\\006\271\006\347\372\366\355\351\315\037\327{\343\215\226f\177{\321b\363\330\217g\243\330\376\003\243\277?\314\260\267\256\254st9\006\021s\326\2367o\336\270q\343\314\031y\376\374\371\236\263vzz\372\252U\253BCCsss{\366\354i\276\225(\317&%%\225\303\310\313\202{\304\242\367\310\355,o?\254g\352\326o\353\326\253o0c\306\214&M\232\224c\0041\227\306\215\233|\360\301\007\276\036a\231\030\225\372\263\315~\326\356Z~6\3336\233\253m\254\315\215\205[\\\015c\013\375\225\317\260\267\256\344\034}\372\314O\245T\257\347\263\267\036Dd\376MII)\266Qf\344\021#F\230\355\016\035:$''''\233oY\237={6<<|\356\334\271\021\021\021\257\276\372\352\311\223''o\372\373\336\004\356\021+\336#\267\271\274\375\260\236\251[\277\255\333\033\177\203\254\254\254\252U\253\226\3657b\274Yd\237\262g\277\372;"\306\273v\231\306e\220\253\222i\263\025\266\335[<\037\032\2270\223\376\262X=\205\224\234\243CBC\357\277\377\376C\211I\327,]\331.\317J\237\362\012"C\206\014IHH\360\334"\363u\275z\365\314\277\334\220\221\221\361\311''\237HCR{\237>}\344\037\232\303\206\015\353\334\271\363\345\313\227O\235:e\263\331n\371\004\224\001\367\210\345\356\221\333_\336~X\317\324\255\337\326\355\215\277\201\224H\317\236=\313=\202\230K\267\356\335\335\351\330\037\030y9\363\232\213\315\335\260]\273\203\316\375-\235B\2569G\233o\306^s\2466\347h\263C9\006\021\253\340\036\261\326=By\233\250[\277\255\333\033\177\203?\376\361\217\276x#\304\375v\310\003\017<\340\353Az\317\250\324\237l\266\237d\355j\330\315F\246\275\260\341ng^\325M\373\376\326M!\245\314\321\327\234\251=\347\350\300\233\251\275\301=b\241{\204\362v\243n\375\266no\360\015\366\354\331S\263fM\037E\020sy\350\241\207\374\347\377\2321*\365\214q\366\317\024]\2523\306%qo<s\315\016\232\367\267h\012\271\346\017\313\213\315\302\2363u\3119\332|\266|?#\342\347\270G\254r\217P\336\236\250[\277\255\333\033|\2031c\306\014\035:\324\247)d\320\340\301\362]|=N7\233\3156u\352\324\005\013\026\230\277BVLQ\245\232\313ic\361|x\246\304r\232\376\262\370U\012)\375\022\273]\357W\006\2567\027\207\257\337P\312\014\356\271Xw\2466q\217\370\363=By_\017u\353\317u[\212\033|\203&M\232\254]\273\326\247)d\365\2325\215\0337\366\3658\335V\032\1773M\334y\347\235\203\007\017\316\313\313\363|\326\250\324SE\327\300\335(\271\270\236r8\212u\323\267\277_\245\220\322/\261\251\364\337Z\274\346L]\261bEo\346h?\237\251\275\301=\342\317\367\010\345}=\324\255?\327m)n\360\015\236z\352\251\235;\243|\232B\242\242\242k\327\256\355\353q\272eee\271\3577iT\251Re\315\2325\356g\215J\375Q\256\201\303q\312\341\272\022?\232\213<,\3360\236-\352\243{\177\277J!\245_b\247w\1778\341\2323\265\227s\264?\317\324\336\340\036\361\347{\204\362\276\036\352\326\237\353\266\0247\370\006\325\253W?v<\315\247)\344xZ\372\275\367\336\353\353qz\252\345\372\277\023\257\220\340\374\354\263\317\232\377\205\222Q\251''\215\263/\353\223\016\327\245\372\321\275\305\341\261\335\334\350nh\336\337\257R\210\263\324K\354\375\337n*e\246\276\341\034\355\2673\265\227\270G\374\371\036\241\274\257\207\272\365\347\272\275\236\033|\203\273\356\272+7/\337\247)D\366/\2652v\354\330R\202\371\355\344\272\000\016\3632\234,\274\036%\036:\256l\317\240\277<\224\363\346?W\260te\372\363\221\341\3537\224|\247Z\266\310v/\367\360\303\017\233d\246\266\312\311\361\222%j\322\337\372W\270-\367\010\345]\012K\324\211\277\365\257\240<\205\004\344{!\225+W6\213\262R\245J\355\333\267\177\350\241\207Z\264h\341\316\313\016\207\\\214\214\302\265\353\302\024.\305\2668\212\326\364\227\3456Tj\231\224r\211###e\246\376>"\342\206\225\031\220\377X\364\022\367\210?\337#\224\367\365P\267\376\\\267\327\243\335\347B\366\354\331c\226i\303\206\015_y\345\225\2325k\206\207\207\273\237uU\252\375\204\335X\244!\327\303\275.\334\3500/\2224\212\036z\364\277p!i\360\240\356\346\306\314\314\375II[\217\036\215NL\334\232\235}X\372\237>\275\257u\353\246\347\317\035\262\331\32232\3423\177J\370\371\347\203\262>{\366\200{''\262\275}\3737\244\261s\3477\0337.\335\274y\305\346M\313\245\021\037\277A\372\034<\270e\324\310\376aa\203\307\214\031"\2134BC\007M\235\032R\362x\276\375\366\313i\323BJ\036\377\2313\011\035;\276)\215o\276Yp\350P\244<%\373\221\303\273\271\361\272\373\373U\012)\375\022;\275\233\251\003\362\007\347^\362\351=\342}\377\036=:\344\346\034-\245\377\213/>W\312\376\2773n\201\222\373w\335\002\035ZJc\315\232\005\211E\267\300\305\213G\312\375\370}t\217P\336\327\343''u{\275\376\275{w\222\227\203K\227RRRv\310\303\277\377\375\305\234\313\251G\216\354p\275:\030={\365\354\030\021\361\257\235;\276\221\311_\266\313\234\277w\357\367\007\016l\366\321\361\370\317\334~\343\337\221\371\272\234\376\037\335\353-\262\377F\215n\337\357\310DDD\310i\255[\267\356=\367\3343q\342\304k}\216:]\256\212\243\360\332\244\273\036\026\256O\030\333\013\333E\335\322\315\206\335\226\336\243G\373\221#\373\277\362\312\013\022\024z\366\354\370\217\177Ln\337\276\305\364\351\241\217=\366\347\213\256\227\371\364\334\334\2431\321ken\315\311I\355\337\257Kpp\357\021#\372\365\353\327E\212\317\275\377aC{\266k\327\342\330\321h)\307\225+\3476l\370\302\322\245\377X\261b\316\216\355k\344\331\015\033\026\177\374\361\304\374\274cyy\307\362\363\216\347\347\037\227\366\233o66\217\347\344\311\370\372\365\377:`@\327a\303z\005\007\365n\336\374\325\240\240\336\322\0362\270{\275z\317\236\314\210\227=\330\362\217\313\376\245\377\350\321\003RSw\312\361\267i\323\354&\306[\254\277_\245\220\322/\261\251\364\231:P\177\211\300K>\272G\312\332\377\205\027\236-\326\377\340\201\315-[6\222\373e\310\220\036#\206\367\255U\253\346\360\341}\244\274\345v\223\355\311I[\257\334\002C{\006\031\267\200\334eA\303z\0156n\201\214\214\270+\267\200\343D\310\350\201r\013\330\315[\300\007\307\357\243{\204\362\276\036?\251\333k\366\317\314L\370\313_\036Y\270p\346\017\021\313\2324y\371\347\237\017\274\361\306k\362\212 %z`\377&WY\332\322\2326}e}\370"\251\355\345\313\346\214\034\331o\345\212\271_}\365\311[m\233\373\342x\374jn\277\3017\030;v\354\300A\203|\232B\006\015\036\034\022\032\352\353qzZ\267n\335\254Y\263\316\236=[\362)#/\2479\034ivY\033\215\302\265\303\243]l]\324?=-f\316\234\251\362p\356\334i\337~\273`\355\332\371\213\026}t\376\374\201\036\335\333\231=\373\367\357\262;>\274\330\3763N\354\222\355\346\376#\276_2qbp\326\205C2\245\356\212\371v\357\336\015M\233\276\234\260\357\373\335\273\303/_\226\177\253\245m\334\370U\203\006\317\017\031\322\275p\031\334}\320\240\256\222B\362\363\217\312\263\351\3511\375\372vv\357\277K\347\326\356\343\354\332\265\255<\373\315\232/\302\302\006=\361\304\377\214\036\335?,tPj\352vy\266\255+\205\310\327\356*\353x=\267\373U\012q\226z\211\335d\246\256R\245\212V\177P\301{>\272G\312\324\277q\343\006%\373''''E\016\034\370\316\264i\243g\314\030#\225,)\177\362\344\021C\207\364p\337\203\375\372uv\367\357\322\245\265{\017\256[ -\346\233o\276\220\3127o\201P\271\005R\266\313\263\346-p\342\304\256\362=~\337\335#\224\367\365\370C\335^\263\277D\341\345\313gE\355\\\223\222\262-v\327\267;v|-\223\274d\216\255[W\230\375en\227W\212M\233\376\265`\301\007\347\316\355\037=\252\277\271\207\036=\332\371\342x\374jn\347o\247^\305\250\324\343\256\305a\256\323\012\037\026m\264_i\273\236\362x\350Z\207\206\016\374%\353\320\333\235\336\264\345\037]\373\315\027\213\026}\370\341\207\343\266l^f\366\227\320`\274\360_\265\177W\012q\315\233\307\267o[\331\266m3)\301U+\347d\376\264w\305\212\331\257\275\366\322\227_\316\224\245Q\243\227\322\322\242\244\317\367\337/\2369sl\311\343\351\324\261\345\341\303[\245!\301\245\353;m\206\007\367\0369\262\357\237\377\374\260\254\245\335\371\355V\011\3736\312!ee\035\314\316N\222\303\373\371\354>\211#K\226|\262}\373\252\326\255\232\310\204\336\252U\343\223\031\273\312:^w\177\177K!^\342\217K\336\204[\274G\274\354\1771;\351\361\307\377\273d\377\270\270o\273u{+r\313rY\352\325{V\326[\266,o\330\360\005\367\376\367\355\333Xx\013\214(\274\005\202\335\267\200\355X\326\005\317[`\240\334\002\362zPx\013\274i\336\002\345s\374\376p\217P\336\236nO\335^\263\177|\334w\377\363?\177\222W\2071c\006\313<\337\274\371\337CF\367o\335\272iX\350\300W^\371\333/\277\034\222>\222\271])\344\207\245\215\033\327\0376\264\207\374\2036(\250\227\324p\367no\225\373\361\370[\335*\376\177d\366\354\335''\373\367\365 \275\347\252T\207y\031\2169\034\307\214\365qW\243pK\321v\317\206\261l\215\\\336\263g\273\240a=\207\017\357\335\257\337\333\275zu\350\333\247\223\244\220\267\3326KJ\332d\366\0372\244\333\321\243\333\213\355?#cW\377\376\235eK\312\221\255\247N\305\311\226Y\263\336\265\331\216\246\035\3379th\367\210\210\305_\177=w\330\260\036\351\222B\034\307d\226\354\324\251\245\364\227o\321\257\357\333\262\226\011\267C\207\0262\207\232;\214\215\375v\334\270\241\346\376\333\266mj\036\263t;~|\247\373\370\337~\273\345\312\225\263\207\007\367\232={\362\206\015\213\244\350w\354XU\326\361\026\353o\321\024\342\344?\332(\273\233\276G\312\324_*\377O\177\252\021\031\271\254X\377\230\230o\346\315\233&\005\374\3157_\374\337\377=\265j\325\354\257\276\372\350\323O''fg''\026\336\002\273\326\032\267\200\253\177\3336M\315\257\362\270\005\\\333\337~\373\315+\267\300\372\177\026\336\002\345z\374~r\217P\336n\267\247n\257\327\377\314\231\335owjy\350P\304\271s\011M\233\276\234\223\223\234\223sX\226f\315^\261\333\216.^\374\321\2301\203z\364h\267i\323\022\371\207\250\364\377\351\247=\207\223\267\244\246nKJ\332l\313O-\367\343\361\253\272\365\352\377\324\355\326\275\273\217R\210\3549(8\330\327\203\364\236Q\251r\001\216\312\272\300q\254\260m<\364h\034+\261\305\265\336\273g\335\214\031a\237|2^\326;w\256Z\373\315\347\213\026\315<\177>\241E\213\277\347\346$K\207!\203\273\035M\335Vl\377\031''\242\373\367{\333\3348p@\027\011\034\301A\275\036|\360\376\365\353\277\034:\244\333\272\357\026,_\376\331\260\241\335\323\323\243N\244Gm\337\2762>\356[\371F{\367\206\273\326{\326M\237\036"\273\335\271c\225t\220=\304\356\372\346\305\027\237\015\015\351\037\032:\340/\177yD\326\322\256[\367q\363Y\331\303\264i\243j\326\374\317\317?\2376jT\337\324\224\255\262\321\010+73^\317\376\326M!N\376\323\3212\272\225{\304\373\376]:\267\332\277\177c\2336Ml\266T\317\376\341\353\026J\354X\276\354\263U+g?\367\\\235\325_\317\221\245u\353&G\016o1\367\037\033\273\366\252[\300h\270n\201\264\235\322\301\270\005F\272o\001\363~t\205\225\362>~\377\271G(o\323\355\251\333k\366\277|)q\322\244\240\277\376\265\356\304\211A\337\256\375\342\205\027\236\2310a\250\261\014\373\357\377~X:\330m\251\362J\321\243\373[\233~X\322\260\341\013}zw\2343gr\203\006\177\235?\177\372\013/\374o\271\037\217\277\325\355\215\277AVVV\325\252U}\361v\210\354S\366|\341\302\005_\017\322{\306\273v\022<\217\026^\025\263\3558Z`\254\215+d\264\355\356-\251\356\3762\257-X0==}\347\206\015_N\177o\324\332\265\256\024"O}\362\361\270\365\341\013\245\277\353\275\220\324\255\305\366\237\221\021\335\277\377\333\236\373_\367\335\374O?\235\360\343\311\230\241C\273\315\235;e\307\366\025\303\206uO;\276#a\337\372Y\263&M\236<|\374\370!\013\346O\237o,\362\265]\273\266\231=\373\335\375\011\353\345kcw\255\0317n\260\271+cnu}\257~\375:\235H\227)\370\350\326\310e\341\341\013\273ti%\317\206\205\015H5\016\306\370\367\342\315\214\327\263\277\245S\210\363:3u)\237\3163g\352@\232\243\275w+\367\210\227\375\267o[>h\320;\262e\315\352\271c\306\014t\367\377\346\233y!\243\373M\235:\362\275i#%L<\366\330\237\247\031\215\227_\376\353\200\001\235e~7\202\270\334\002C\314\376E\011\333u\013H\012\221-[\267.\013_\267\240K\3477ecX\350\000#\210\247\272\272\225\353\361\373\333=By;oK\335^\257\277\315\226r\350`D\307\216-\366\356\371Nr\360+\257<\377\355\267_|\273\366sY$I\233\375\263\1779\320\243\307[\2336-Y\270\340}s''\3620\361P\204Ti\271\037\217\277\325\255W\337`\306\214\031\215\0325.\367\024"\373\234>\375}_\217\260L\214\274,g?\265\300X\273\226\302k\343\261\366x\350\356&\215/\276\230\366\355\267\237\313\366=\273\277\233>}\364\332o\346-Z4C\346\304\267\3326\333\265k\265l\0372\244\353\261\243[\213\355?\343D\224\361^\210k\207+V\374\343\263\317&v\354\320\302nO9s:V\342\260\374[0.\356\233\371\363\337;sz\227\331?5%\362\265\327^\334\270\361K\363\000V\255\234%\317\272\217''j\347\312z\365\236\011\015\225\177\377\3657\336\013\351o\274\027\362\330\221#\233\335\207mL\301\251\256)85\362\347\263\273\215)85\347\362\241_~\331_\246\361z\236\037\253\247\020\347u~\210^J\365\006\306\017\313o\302\255\334#\336\364\337\263\373\333\246M\033dg\0370\373\217\032\325GB\266\273\303\207\037\216\0319\242\267\374\313R\302\307\343\217\377\371\375\367G\177\360\376h\231\326\217\035\333f\366\337i\336\002!\327\275\005\244[\227.\306-\340\012\342\221g\345\0260\362\372e\271\005\262\256q\013\224\365\370\375\363\036\241\274}]\2677\354\337\247w\207s?\357=zt\353\253\257\326\213\211\371zW\314\327\262\226Z5\373K\301\033\357\205,\226\351}\330\320\356\362jr`\377\206Z\265\036\222\372\364\321\361\370O\335z\365\015rrr\352<\365\324\224)S\3131\202\310\336d\237\277d_\364\365\010\313\304\250\324\024\207=E\326\256\213\341n8R\314\305l\027n\261\027n4\033\237\317\233\362V\333\246\241\241\375$\303N\235:|\315\2329\222B\306\204\015X\267\356\013\263\377\340A\357\034=\032Yl\377''N\354\350\337\377m\367\376\347\272\222G\343_\262\022rr\016\015\034\3209<|\376\264i#d\272\264\331\016\273\217\347\362\245C\275{\267\317\313K\222\366\362e\237\316\237?\315}<\247O\307\034:\264\321\354\366\346\233\257\231\215\324\224-\331\331\373\335\307\337\271sKY\017\036\374\216\304\235\340\340\036\322\315n;\262i\323W\023\306\017)\323x=\317O\000\244\020gY\376\372\265\347\022\030s\264\367n\345\036)\275\277\335~d\366\354I\215\032\275x\356\334\036w7)\316\267\337~#$\244\237\334\021\305\3727o\376\212\331m\333\266\177e\376\024gn<}\312u\013\230}\\\267\200\2611%e\363\305\354\003\356\303\220[@\032\256[\240c\213\340\240\036\346\235"\267\300\370\361\203o\345\370\375\374\036\321\274\274}W\267^\366\357\320\241\371\353\257\277\362\317/?\220\265\273\277\253mt;\367\363\236\036=\332\376\020\261h\301\002\371We\312/\277$t\352\364F\257^\355\006\015\352\222\233\233\350\213\343\361\237\272\365\366\033dddT\255Zu\311\322\245\345\022AV\254\\y\337}\367\035;\236\346\323\261\335\004\243R\345\365\376\210\303\356Z\273\033\205k\243Q\274C\321\303o\327\316\215\335\365\2654~<\2713\342\373/\027\375\363\375E\213>\360\354\337\275{\233cG\267x~\371\332o\346\274\370\3423\013\346O\363\334\177T\324\362\245K>|\365\325\027\242\243V\230\373_\276\354\3439s&\025;\236S?F=\363\314\223O>\371\337\273w\257\271\346\361\324\257\377\\\261\343\377\345\227}\177\377\373\337>\372(L\332\203\007u\331\237\260N\032\377\374\347\373]\273\266\352\325\363-9\3542\215\327\363x\224\317\260\345\245\2543u\300\314\321\336\273\225{\244\364\376[#\227\004\005u\317\313=T\254\277\335\226<&\254\377\366m\377r\367\377\344\223\261\365\352\375oXX\377\322\367/\267@\261\343\311\276\321-p+\307\357\377\367\210\316\345\355\273\272\365\246\277\335~\270K\347\226\307\217GJ\273E\213\206\262\316\317K\354\330\261\371\323O?nvH;\276\265G\367\266\253\277\2365\177\376\324M?,z\355\265z{v\177#;\374\342\363)\313\376\365q\271\037\217_\325m\031\276Az\272\353\017\230H\200\270\305\010"QF\366\263}\373\016\337\215\352\246\311\201\025\270\256\204kq8\314\213T\264\266_\331^rc\311\376\2719\007\363\363\016y\366\277t1A\346S\317\376\271\271\007m\371\211\327\334\177N\316\201\322\367oL\251{K9\236#G"n\345\370\313\324\337\037f\330\362\342\375L\035Hs\264\367\312\361\036\271\351\376\027/&\310\335t\303\376G\016G\334\236\343\261\320=\242my\373C\335\226\322???1\353\302n\363)[~\222\303\236\254O\335\226\355\033DGG\337w\337}\267\362\243\031\371\332\252U\253\246\036=\346\223\321\3342\343\023L\311\016\207T@\262Q\007F\243\344\272\260\317a\217\266\326\375\375d\206-/\336\314\324\0016G{\217{\304\352\367\210\236\345M\335\372m\335\226\371\033ddd\324y\352\251F\215\032\227\365\267f\244\277|\225|\255\037\376 \306\315\310\313I\306b^\006\311\244\205\017\335\015w\007\307\325\017u\356\357?3ly)}\246\016\2749\332{\334#\001p\217hX\336\324\255\337\326\355\315|\203\234\234\234\351\323\337\2272\355\326\275\2737YD\372HO\351/_\345o\037G-\306\370\331a\242q%\022\213\032If\243\330\366b\317j\336\337\257f\330\362r\275\231: \347h\357q\217\004\306=\242[yS\267~[\2677\377\015\262\262\262F\216\034\371\300\003\017<\364\320C\003\007\015\372z\365\352\235;\243\216\035O\313\315\313\227\265\264e\313\240\301\203\345Y\351\023<|\270\364/\307\343\366\021#/''z\2778\034\207\350_\340\1773ly)9S\007\352\034\355=\356\221\200\271G\264*o\352\326o\353\266\034\276\301\236={\306\216\035\353\372iK\235:\367\335w\337\235w\336)ki\313\226\220\320P\377\371?b\274q\307\035w8\354\007\013\\\327\343\220\303Q\330p/\356-%\237\322\271\277\234\261\212\025+\252\276t\276\3429S\007\360\034\355=\356\221@\272G\364)o\352\326o\353\326\357\342\271Z\325\253W?\221\276\251\300q\300\\\234\005\007\215\306Ac9pu\373`Q\207\203\232\367\3178\261\371\336{\253\252\276t>d\316\324+V\256\014\3409\332{\334#\001v\217hR\336\324\255\337\326-)\344*\265k\327\216\211^\342\276\022\005\216\375\036\213\\\030\367F\327\332y\245\203\326\375\345\214=\371\344\237U_:\337\212\214\214\2249Z\326\252\017D=\356\221\300\273G:w\356\034\360\345M\335\372m\335\222B\256\022\022\022\022\024\324\305Y \027 \301}\315\234\262\024x^\302b\017\0234\357?<\370\235\321\243\272\253\276t>7v\354X\325\207\340\027\270G\002\357\036\361\303\317\254\224;\352\326o\3536\360\213\257Lbbbj\324x ?o\267\323u%\344\222$\030\227\244p\361|X\374)]\373\313\271\252Y\363\217Q;\027\251\276t>\247\303L\355\015\356\221\300\273Gt\250m\352\326o\3536\360\213\257\254Z\264h1m\352\340\002\307>\247c\237k]\340j\030\327\251h\213\261\261\240\360\331\004c\331\247m\1779W-\232\327W}\321n\007\035fj/q\217\004\330=\242ImS\267\376Y\267Z\024_\231$%%\375\372\327w\357\330\266\300u\315\\\227d\257,Nc\355j\270\267\\yj\237\331A\303\376?D\314\251V\255\312\241\203_\253\276h\267\203&3\2657\270G\312z\217$\036Z\255\372\242\225F\223\332\246n\375sn\327\242\370\312j\367\356\335r[F|?\273\300\261\307Y`^\025\327\342z\350(j\024m1\333fC\253\376\333\267\315\227\263\264\356\273OT_\256\333D\223\231\332K\334#\201t\217\350S\333\324\255\037\326\255.\305WV\353\326\255\373}\265*\323\246\016\264\345\355*p\354v\026\3546\327N\307\356\253\036\032[\256j\024\353\020\210\375m\371\273\344\314T\372\365\335\273\343\027\253\276P\267\217>3\265\227\270G\002\346\036\321\252\266\251[\177\253[\215\212\257\254\222\222\222\2327\177\351\241\032\177\010\016z{W\364\227\031\351\341\005\2168\343R\305\233\353\002i\270\332W7\012\012\237uz\266\255\337\277\300\036w"=<&japP\247\0325\376\320\242\371KI\211+U_\242\333J\253\231\332K\334#\201q\217\350V\333\324\255_\325\255^\305w\023bbbBFw}\362\311Z\325\357\253zG\305\212\025t%c\2273P\373\311Zr6b\242\027\252\276,\012T\320l\246\366\036\367\210\311\272\367H\005-k\233\2725)\257[\035\213\317\242\370{\025jU\320r\246\206\016\250m\2654\237\333)>k\370\374\363\317e\246HKKS} \372b\246F\240\242\266\325\322\374\374k=x\253\310\311\311\371\267\177\3737\251\324\246M\233\252>\026}i>S \200Q\333ji~\376\265\036\274U\264o\337\336\374\001^\225*U\302\303\303U\037\216\2464\237)\020\300\250m\2654?\377Z\017\336\022\022\023\023\177\365\253_\231)\344\256\273\356z\360\301\007\363\362\362T\037\224\2164\237)\020\300\250m\2654?\377Z\017\336\022j\325\252\345\371y\346\373\356\273o\302\204\011\252\017JG\232\317\024\010`\324\266Z\232\237\177\255\007\357\377\314\277\364W\314o\177\373\333\314\314L\325\207\246\035\315g\012\0040j[-\315\317\277\326\203\367\177\023''N\224\002}\354\261\307\0324h \215\007\036x@\326\217>\372\350g\237}\246\372\320\264\243\371L\201\000Fm\253\245\371\371\327z\360\376/""B\012\364\337\377\375\337\315\017\250\312\3727\277\371\2154\326\255[\247\372\320\264\243\371L\201\000Fm\253\245\371\371\327z\360\226\020\023\023\223\225\225\345,\252Tio\336\274Y\3611iI\363\231\002\001\214\332VK\363\363\257\365\340\255E\363JU\216\363\217@Em\253\245\371\371\327z\360\326\242y\245*\307\371G\240\242\266\325\322\374\374k=xk\321\274R\225\343\374#PQ\333ji~\376\265\036\274\265h^\251\312q\376\021\250\250m\2654?\377Z\017\336Z4\257T\3458\377\010T\324\266Z\232\237\177\255\007o-\277\372\325\257T\037\202\3264\237)\020\300\250m\2654?\377Z\017\336Z4\257T\3458\377\010T\324\266Z\232\237\177\255\007o-\232W\252r\234\177\004*j[-\315\317\277\326\203\267\026\315+U9\316?\002\025\265\255\226\346\347_\353\301[\213\346\225\252\034\347\037\201\212\332VK\363\363\257\365\340\255E\363JU\216\363\217@Em\253\245\371\371\327z\360\326\242y\245*\307\371G\240\242\266\325\322\374\374k=xk\321\274R\225\343\374#PQ\333ji~\376\265\036\274\265h^\251\312\335\372\371OII\331\261c\307\256]\273\342\342\342\342\015\261\261\261QQQ\311\311\311\305z\312Saaa\267\370\355\000/1\267\250\245\371\371\327z\360\326\242y\245*W\372\371\317\316\316n\332\264i\227.]z\365\352\325\247O\237\327_\177\275M\2336\275{\367\356\326\255[\353\326\255\327\254Y#}\206\017\037>k\326\254\325W\2333gN\277~\375\314\235l\331\262e\344\310\221\262\223\367\336{O\032\223&Mj\324\250Qppptt\364\355\030!t\305\334\242\226\346\347_\353\301[\213\346\225\252\234\367\347\277\240\240\340\371\347\237?\177\376|\261\355\022,\266n\335*\311c\375\372\365\0337n\224\265\264\267m\3336l\3300y6333>>~\377\376\375\222Z$\216$&&N\2312E\202\310\201\003\007\366\354\331s\356\334\271r\036\017P\204\271E-\315\317\277\326\203\267\026\315+U9\357\317\377\204\011\023\376\360\207?dee%$$xn\227\024\022\023\023\023\025\025%\251b\337\276}\262\226\207\261\261\261\301\301\301N\343\3475K\226,\0313f\314\360\341\303G\027\221\366\330\261c\027/^\234\226\226V\376C\002\014\314-ji~\376\265\036\274\265h^\251\312yy\376\247M\233\326\247O\237\026-Z\2349s\346\205\027^\210\210\210p?%)$55u\351\322\245\243F\215\012\013\013\223\220\261|\371\362\343\307\217\233)\304\324\256]\273\215\036\326\257_\337\276}\373\362\037\014\340\201\271E-\315\317\277\326\203\267\026\315+U\271\033\236\177\311\023\315\2325\223HQPP )D\266dee\325\257__\222\204\331\301L!\203\007\017\316\314\314\224\207\027.\\\030:th\311\024\362\256\207I\223&u\354\330\321gc\002\\\230[\324\322\374\374k=xk\321\274R\225+\375\374\247\245\245=\362\310#k\327\2565\037\232)D\234;w\256n\335\272\031\031\031\316\242\024\022\024\024TJ\012\0310`\300\204\011\023\334)d\374\370\361\222Z|5$\300\300\334\242\226\346\347_\353\301[\213\346\225\252\334\015\317\177~~\276\273\355N!\342\342\305\213f\303L!\363\346\315\0337n\234\2310\346\317\237\357\231B\322\323\323W\255Z\025\032\032\232\233\233\333\263gOy(\033\345\331\244\244\244r\036\014\340\201\271E-\315\317\277\326\203\267\026\315+U\2712\235\377\327_\177\275\344F\311\023)))\3056J\302\0301b\204\331\356\320\241Crr\262\371#\230\263g\317\206\207\207\317\235;7""\342\325W_=y\362\344\315\0368p\003\314-ji~\376\265\036\274\265h^\251\312\225\351\374?\367\334s%7\016\0312\244\330o\315H\376\250W\257\336\346\315\233\245\235\221\221\361\311''\237H\343\203\017>\350\323\247\317\310\221#\207\015\033\326\271s\347\313\227/\237:u\312f\263\335\322\321\003\327\307\334\242\226\346\347_\353\301[\213\346\225\252\034\347\037\201\212\332VK\363\363\257\365\340\255E\363JU\216\363\217@Em\253\245\371\371\327z\360\326\242y\245*\307\371G\240\242\266\325\322\374\374k=xk\321\274R\225\343\374#PQ\333ji~\376\265\036\274\265h^\251\312q\376\021\250\250m\2654?\377Z\017\336Z4\257T\3458\377\010T\324\266Z\232\237\177\255\007o-\232W\252r\234\177\004*j[-\315\317\277\326\203\267\026\315+U9\316?\002\025\265\255\226\346\347_\353\301[\213\346\225\252\034\347\037\201\212\332VK\363\363\257\365\340\255E\363JU\216\363\217@Em\253\245\371\371\327z\360\326\242y\245*\307\371G\240\242\266\325\322\374\374k=xk\321\274R\225\343\374#PQ\333ji~\376\265\036\274\265h^\251J\330l\266E\213\026eee9\213\316\377\236={v\354\330\241\372\270\200\362\304\334\242\226\346\347_\353\301[\213\346\225\252\304\370\361\343\345\264W\254X\261V\255Z\322\250\\\271r\005\203\371\277\340\002\201\201\271E-\315\317\277\326\203\267\026\315+U\211\211\023''V(\341\231g\236\011\017\017W}h@\271anQK\363\363\257\365\340\255E\363JU\342\354\331\263w\336y\247g\004i\330\260\341=\367\334\223\231\231\251\372\320\200r\303\334\242\226\346\347_\353\301[\213\346\225\252\312\220!C*V\254hF\220J\225*I\012\2310a\202\352\203\002\312\023s\213Z\232\237\177\255\007o-\232W\252*yyyU\252T1SH\373\366\355\037~\370\341\334\334\\\325\007\005\224''\346\026\2654?\377Z\017\336Z4\257T\205\326\254Yc\376\\\246F\215\032|"\004\201\207\271E-\315\317\277\326\203\267\026\315+U\255g\237}V\316\177\363\346\315U\037\010P\376\230[\324\322\374\374k=xk\321\274R\325JKK\223\363/k\325\007\002\224?\346\026\2654?\377Z\017\336Z4\257T\3458\377\010T\324\266Z\232\237\177\255\007o-zVjtt\364\350\321\243k\327\256}\337}\367\335q\307\035%\377z\207&d\354r\006\344<\310\331\220s\242\372\262 \240T\320rn\361\037\232\237\177\255\007o-\272UjRRR\213\026-\036~\370\341\341\303\207\357\334\031u<-=/\337\226o\223\305n,\356\3065\037\226\334n\355\376y\371\371r\006\344<\014\013\012\222s\322\274y\363\304\304D\325\227\010\001B\267\271\305\337h~\376\265\036\274\265hU\251\273w\357\256T\251\322\344\311\223/\347\344H\3660^\214]k\233\315\014"\327Xlvw;\300\373\3139\2312eJ\265j\325\326\255[\247\372B!\020h5\267\370!\315\317\277\326\203\267\026}*U^\\e\260\221\221\221\306+q\276\361\016\210\353\345\270\250m\254\355\266\374\253\267x.:\364\337\260q\203\234%\211k\252/\027,O\237\271\305?i~\376\265\036\274\265hR\251III\277\377\375\3577n\\\237o\313\263\331\362\362m\271\262\230\215b\017]\035\354yf7wC\253\376\221\221[~\375\353_\363\243\031\334"M\346\026\277\245\371\371\327z\360\326\242I\245\266h\321b\362\344I\306K\257\274\356\346\270\032\366\334\242\027\343\302v\321\226\034s{a7-\373O\2312\271\331\353MU_4X\233&s\213\337\322\374\374k=xk\321\241Rcbb\036z\350\241\234\334\213\362\372j\223\305\365\352+\353\234\374\242\266\271\330\314\265\335\335\310\325\266\377\345\234\354\2325\037\342\267fp+t\230[\374\231\346\347_\353\301[\213\016\225\032\022\022\022\034\034l\263]6^\211/\313R\357\357\215\275\374]V\263\277\353\265\271\350\313\2574\354\306F\263\203=\307s\377\001\320?(h\310\350\321\243U_:X\230\016s\213?\323\374\374k=xk\321\241Rk\327\256\275cGd\276\355\222\361\212{\351\305\227\033\376\350t\036w8\017\333\234\007\363\234{\363\234\261\331\366\031+\177\330\220q!&\337\031\235\343\214\311qn\273\344\334\230\353\374p[B\367\036=\215\227\347\313\356/\367l\233\017\257\264m\205O\005@\377\235;\267>\371\344\023\252/\035,L\207\271\305\237i~\376\265\036\274\265\350P\251\325\253W?~\374\210\315~\311\\d\310\331N\347\305\002\347\005\273\363\347|\347%\247s\310\250\260\012\025\177\363l\303\346\0316gz\2363=\327y,\307y\304\356\\\266s\257t\266\271^\241/\232_\353j\330\214\375\330.\231\215|\367\303\242\375\007F\377\264\364\224{\357\275W\365\245\203\205\3510\267\3703\315\317\277\326\203\267\026\035*\365\216;\356\310\313\317\266\271^\200/\312\353\253\014\371\222\303\231\347p=e/p\255\277\371n\375\3755\037\035=q\272\335\351\374\305\356\274`s\376ls\236w:7\356\332\347J!v\343%\334\365B~\321x9/\334O\341C\317F\321\366\000\350\237\237\237]\261bE\265\027\016\226\246\303\334\342\3174?\377Z\017\336Zt\250T\343\375\214_lv\011"\331\262\226\207\027\355\316\263\227\235\371\216\302\016\347\317\237\377\340\343Y\023\336\3738\375\344)yh+p\346\033\351dG\334\336\302\2575\276\260p''%\033\256\016W\366\0370\375u\250\015\370\016\365\243\226\346\347_\353\301[\213\016\225j\274\237!\257\254Y\346\332\225B\034\316\237.9Og;mNg~^\336\237k\325\252P\341\216\012\025*\275\371V''\317/\214\215\337}\345k\013_\252\335\373\361h\330=\267g\005L\177\035j\003\276\363\253_\375J\365!hM\363\373W\353\301[\213\016\225j$\211,\343\225U^b\263\314\237\310\234\275\354<\371\213\363L\2563\366@\352\275\367\336{\307\235w\377\277{\252\266mwU\012\331\025\027/\235\355\256\027\351,\273=\313s''v{aC\326f\007\217\247\002\244\277\016\265\001\0379w\356\\\345\312\225U\037\205\3264\277\177\265\036\274\265\350P\251\306OU.\270^h\355\027\314\027\327\313\005\316\237s\\\357\205\374\224\353\214\330\225\370\330\023OU\255\366\373{*W\231\265pY\256\323\231\235\347\274\224\347\372\302mQ\273\012\277\326\365\345\205k\343\345\374\312\026\343\345\374\202\347\376\003\246\277\016\265\001\037IMM\255Q\243\206\352\243\320\232\346\367\257\326\203\267\026\035*\325H\022\347\355\256\027\335\363\262\230C\226 r\301\346<\227\357<\371\213mG\302\261''\352\324}\351\225\327\316\3449O\3478\317\3448\317\3469%\207l\2131R\210\335|\361v-\306+\267\261+{\341\332\346\271\321\330\177\300\364\327\2416\340#qqqu\352\324Q}\024Z\323\374\376\325z\360\326\242C\245\032I\342\274\361\272+\257\262\347^\250\367\302\276C\207c\023\022\243\366$n\217O\334\276;y\307\276\224M1\007w&\034\215\214O\336\032\237\264}wR\324\336\344\204\303i\237\316\376\374\315V\255\314\257\262\231k\333y\317\207F\273\350a\321\376\003\246\277\016\265\001\037Y\264hQ\353\326\255U\037\205\3264\277\177\265\036\274\265\350P\251\306g;\344\305\365\234\361\022+\257\257\347\372\366\355\351\315\037N}\343\215\226f\177{\321b\363\330\217g\243\330\376\003\243\277\016\265\001\037\351\325\253\327\314\2313U\037\205\3264\277\177\265\036\274\265\350P\251F\012\371\331f?kw-?\233m\233\315\3256\326\346\306\302-\256\206\261\205\376:\324\006|\344\261\307\036\213\215\215U}\024Z\323\374\376\325z\360\326\242C\245\032?\221\3114^b\345\0257\323f+l\273\267x>4^\2363\351/\213\016\265\001_\330\277\177\377\375\367\337o\263\331T\037\210\3264\277\177\265\036\274\265\350P\251\306{!\231\327\\l\356\206\355\332\035t\356\257Cm\300\027:t\3500u\352T\325G\241;\315\357_\255\007o-:T\252\221B~\262\331~\222\265\253a7\033\231\366\302\206\273\235yU7\355\373\353P\033(w\307\216\035\373\335\357~w\372\364i\325\007\242;\315\357_\255\007o-:T\252\221B\316\030\257\254g\212^\206\317\030/\267\356\215g\256\331A\363\376:\324\006\312WVV\326\335w\337\375\325W_\251>\020h1\267\227B\353\301[\213\016\225Z\224B\314\345\264\261x><Sb9M\177Y\256Y\033\361\361\361\375\372\365[\273v\355\355\277\216\360s\022A\236x\342\211\267\337~[\365\201\300E\207\271\275\024Z\017\336Zt\250T#\205\234*z}u7J.\256\247\034\216b\335\364\355_\2546\016\035:T\313\365\037\356\024\332\274y\263\242\353\011\177t\354\330\261\2325k\366\355\333\267\240\240@\365\261\300E\207\271\275\024Z\017\336Zt\250T#\205\374(\257\257\016\307)\207\353U\366Gs\221\207\305\033\306\263E}t\357\357\256\215\234\234\234\366\355\333\377\352W\2772\363\307\243\217>\372\357\377\376\357\362\017_\265\227\025~b\377\376\375R\036\277\373\335\357\370A\214_\321an/\205\326\203\267\026\035*\325H!''\215WVY\237t\270^\206\177toqxl77\272\033\232\3677k\343\363\317?\377\267\177\3737\317?\346\326\240A\203v\355\332\251\276\252P\343\334\271s\251\251\251qqq\2229z\367\356\375\370\343\217\337\177\377\375\323\246M\343\343\250\376F\207\271\275\024Z\017\336Zt\250T3\2058\034\346K\354\311\302\327\332\022\017\035W\266g\320_\036\312y\033;v\2547\177d\326\344~\263\004\201J.\361o~\363\233\312\225+\327\251S\247U\253V3f\314\330\265k\027\177\027\304?U\320`n/\205\326\203\267\026\035*U\306\350p\310\013mF\341\332\365\242[\270\024\333\342(Z\323_\026\2636\322\322\322\2325kV\245J\225\273\356\272\313|)z\340\201\007x/\304B\262\263\263\2336m\332\245K\227^\275z\365\351\323\347\365\327_o\323\246M\357\336\275\273u\353\326\272u\3535k\326H\237\341\303\207\317\2325k\365\325\346\314\231\323\257_?s''[\266l\0319r\244\354\344\275\367\336\223\306\244I\223\0325j\024\034\034\034\035\035\255tp\270.\035\346\366Rh=xk\321\241R])\304~\302n,\322\220\327Z\367\272p\243\303|\001\226F\321C\257\373\317\2349n\343\306\245\362TZ\332\256\370\370\015\011\373"\016\034\330,\353\270\270\365?\237=\340\356\337\263g\207\334\334c\346\376;v|\363z\373\177\372\351''\363\363\323\212\035\317\307\037O:\234\274\315\335?<\374\253\017?\034_^\307_J\177\317\332\010\017\017\177\360\301\007\357\275\367^3\210\310?\210\371\\\210\025\025\024\024<\377\374\363\347\317\237/\266]\202\305\326\255[%y\254_\277~\343\306\215\262\226\366\266m\333\206\015\033&\317fff\306\307\307\357\337\277_R\213\304\221\304\304\304)S\246H\0209p\340\300\236={\316\235;\247b(\270\001\035\346\366Rh=xk\321\241R+\270~"\223.\257\270\216\302\327\335t\327\303\302\365\011c{a\273\250[\272\367\375\363\362\216u}\247\355\326\255\253\302\302\006O\2348\374\363\317\337\0376\254\327\202\0053:vh\271a\303\342\350\250\265\203\006u\013\013\035T\267\356\343c\306\014\011\016\3563n\334\260\372\365\377:aB\320\330\261C%[\310\336\216\037\217\331\261c\315\356\370\365{\367~/O\355\335\2731>.|\347\316o\216\037\2131\017\343\2473\373\376\376\367zg\316\354\013\015\031\024\0222\260S\247VM\233\276\022\0322p\300\200\256\267~\374\245\364/V\033yyy\023''N\374\355o\177\373\350\243\217\312S111\252.(n\332\204\011\023\376\360\207?H\202LHH\360\334.)D.hTT\224\244\212}\373\366\311Z\036\306\306\306\006\007\007\313\263)))K\226,\0313f\314\360\341\303G\027\221\366\330\261c\027/^\234\226\226\246h4(\215\016s{)\264\036\274\265\350P\251\306{!i\016G\232]\326F\243p\355\360h\027[\227\245\277\335v\\\032aa\203\276\373\356\313\365\341\213^x\341\231o\327.\370\350\243\361\2337/\223g\337}w\304\270qC\237~\372\211\361\343\207\005\007\365\356\330\361\215\314\237\366}\263\346\213\345\313g\345\346\246\312\027\316\235;m\360\240ns\346L\225\245N\235\307\314F\277\276\235?\373l\262\373\273\244\247\305\344\347\037\335\264iY\320\260^\262\207&M\032\214\036\335\177\331\262\317\312\345\370\257\327\377\232\265q\366\354Y\371\2072\277\246kE\323\246M\353\323\247O\213\026-\316\2349\363\302\013/DDD\270\237\222\024\222\232\232\272t\351\322Q\243F\205\205\205I\310X\276|\371\361\343\307\315\024bj\327\256\335F\017R\006\355\333\267W1\016xE\207\271\275\024Z\017\336Zt\250T#\205\034w-\016s\235V\370\260h\243\375J\333\365\224\307\303\033\364\337\266me\307\016ot\355\332V\332a\241\003\277\373n\301\272\357\0266jT_\326\222B\266H\012\261\037\357\324\251\345\017?,m\332\364\345M?,m\335\272\311\217''c\203\202zId9\365c\234\271\377/\276x\177\303\372E\346\016[\266|\315\334\377\232\325\237\177\361\305t\371\326q\261\337\316\236=e\331\277>;\367s\302\2325\237\257\017\377\347\324\251\243\006\364\357"\215\265\337|\221xh\323\255\034\177\351\375u\250\015MH\236h\326\254\231D\212\202\202\002I!N\343/\214\325\257__\222\204\331\301L!\203\007\017\316\314\314\224\207\027.\\\030:th\311\024\362\256\207I\223&u\354\330Q\311p\340\015\315\357_\255\007o-:T\252\361\351T\363%\366\230\303q\314X\037w5\012\267\024m\367l\224\245\277d\013i\207\205\015\2344)x\350\320\356o\274\361\352\200\001]\006\017\356\272e\213\244\220cqq\3376i\322\340\245\227\236\223\215\253V\316\226\376!!\375_{\355\245\234\234\303\346\227\177\361\305{\255Z5\016\012\352)\313\237\376T\303\325\030\326\263E\213\277\273R\210\375Xr\362\346\335\273\327\311>\263\262\016J\354X\265j\366:\311:\353\026\256Y3OB\311\261\243\333o\375\370\257\327_\207\332\320AZZ\332#\217<\342\376s\267f\012q\032\277s[\267n\335\214\214\014gQ\012\011\012\012*%\205\014\0300`\302\204\011\356\0242~\374xI-\267}4\360\226\346\367\257\326\203\267\026\035*\325H!\362\342zT\326\005\216c\205m\343\241G\343X\211-\336\366o\333\246\2514\202\206\365\210\215];bDo\311"\357\276\033\374\321Gc\267l\371W|\334\267-[\276v\350P\304\353\257\277r\346t\334\302\205\037\364\356\325axp\257\257\277\236\363\374\363OK\377\002#\205lX\377\245\2717\327{!Fc\315\352y\262\335\375\035\333\266m*\353E\213>|\347\235\326\037\177<\376\343\217\307\205\206\364\0375\252o\271\034\377\365\372\353P\033\232\310\317\317w\267\335)D\\\274x\321l\230)d\336\274y\343\306\2153\023\306\374\371\363=SHzz\372\252U\253BCCsss{\366\354)\017e\243<\233\224\224t\033\307\2012\320\374\376\325z\360\326\242C\245\032?\221Iu8\216\026\276\342\232m\307\321\002cm\274\372\032m\273{Kj\231\372K\012\311\315I\352\326\255\315\241\203\021C\207t\223\376\222\025$\205DnY*\317\256Y=\267O\237\216\375\372u\012\013\035\320\245K\253\341\303{\215\036\325w\320\300.3g\216\311\313=,;\371\342\213iC\206t\2333g\362\3349\223\353\324yT\032\262\364\357\377\266\244\020\367\361\030A\347\350\262\177}\372\346\233\215\306\214\0318f\314 \327\016\303\006\224\313\361_\257\277\016\265\241\241\327_\177\275\344F\311\023)))\3056J\302\0301b\204\331\356\320\241Crr\262\371#\230\263g\317\206\207\207\317\235;7""\342\325W_=y\362\244\257\217\0317A\363\373W\353\301[\213\016\225j\274\027"\257\254\251\005\306\332\265\024\276\356z\254=\036\272\273y\323?//\371\311''\377\247w\357\366/\277\374\327\323\247b\2324\251?zt\337\267\33263\336\013YjvKJ\214X\276\354Si\264n\325x\315\232\271_\257\232\265z\365\034\367\376?\371d\374\354\331\357\356\333\273n\337\276u\365\353\377\237\254\245\375\351\247\343g\315\232\344>\236\266m\233~\371\345\007\262\023I''\377\374\347\014Y\246N\035\341J!\267|\374\245\364\327\24164\364\334s\317\225\3348d\310\220b\2775#\371\243^\275z\346\307\220322>\371\344\023i|\360\301\007}\372\364\0319r\344\260a\303:w\356|\371\362\345S\247N\361W\313\374\223\346\367\257\326\203\267\026\035*\325H!)\016{\212\254]/\264\356\206#\305\\\314v\341\026{\341F/\373\307\305\256i\320\340\377\242\242V\266z\263\221g\377\217>\034\263e\313\022\263\277\244\212\351\323G\311Sm\3324\216\216Z%\235e\271\346\376\0337~\251\344\361\244\246n\271\347\236\337~\366\331\304e\313>\371pfXrRDrr\304\372\360\005\241\241\375n\375\370K\351\257Cm\000\201J\363\373W\353\301[\213\016\225j\244\220\303\005\216#\016\273k\355n\024\256\215F\361\016e\351\237\233s\260w\357v\373\366~\353\356\337\245s\313\207\037\376\317cG\267,_\366q\307\216\315{to\333\271\363\033\301\301=\332\266i\022\024\324}\360\340.\322_\022\311\232\325\263\213\355\377\231g\236,\271\377\204}\337-[\366\2614\346\317\237\372\257\245\037I\343\302\371\335/\275\364\354\342\3053\312\345\370\257\327_\207\332\000\002\225\346\367\257\326\203\267\026\035*U\306X\340z\225u-\016\207\371\002\\\264\266_\331^r\343M\367w\330\223on\377I\211\033K\351\237\233s /\357\220\271\321fK\362\335\361\233\015\035j\003\010T\232\337\277Z\017\336Zt\250T\343\323\251\022\013\222\013\034\311\322(0\033%\327\205}\016{\264\265\356\257Cm\000\201J\363\373W\353\301[\213\016\225j\274\027\222d,\346Kl\222\303^\370\320\335pwp\\\375P\347\376:\324\006\020\2504\277\177\265\036\274\265\350P\251\306\347B\022\215W\331\304\242F\222\331(\266\275\330\263\232\367\327\2416\200@\245\371\375\253\365\340\255E\207J5\336\013I\364~q8\016\321\277\200\024\002X\231\346\367\257\326\203\267\026\035*\365\216;\356p\330\017\026\270^k\0179\034\205\015\367\342\336R\362)\235\373\313\031\253X\261\242\352K\007\340&\3510\267\227B\353\301[\213\016\225Z\275z\365\023\351\233\012\034\007\314\305Yp\320h\0344\226\003W\267\017\026u8\250y\377\214\023\233\357\275\267\252\352K\007\340&\3510\267\227B\353\301[\213\016\225Z\273v\355\230\350%\356W\331\002\307~\217E^t\335\033]k\347\225\016Z\367\2273\366\344\223\177V}\351\000\334$\035\346\366Rh=xk\321\241RCBB\202\202\2728\013\344\3055\301\375z\354\224\245\300\363\345\271\330\303\004\315\373\017\017~g\364\250\356\252/\035\200\233\244\303\334^\012\255\007o-:TjLLL\215\032\017\344\347\355v\272^e\345\3456\301x\271-\\<\037\026\177J\327\376r\256j\326\374c\324\316E\252/\035\200\233\244\303\334^\012\255\007o-\232Tj\213\026-\246M\035\\\340\330\347t\354s\255\013\\\015\3435\270h\213\261\261\240\360\331\004c\331\247m\1779W-\232\327W}\321\000\334<M\346\366\353\321z\360\326\242I\245&%%\375\372\327w\357\330\266\300\365z\354z\271\335+\213\323X\273\032\356-W\236\332gv\320\260\377\017\021s\252U\253\222xh\265\352\213\006\340\346i2\267_\217\326\203\267\026}*u\367\356\3352\330\210\357g\0278\3668\013\314W\\\327\342z\350(j\024m1\333fC\253\376\333\267\315\227\263\264\356\273OT_.\000\267D\237\271\375\232\264\036\274\265hU\251\353\326\255\373}\265*\323\246\016\264\345\355*p\354v\026\3546\327N\307\356\253\036\032[\256j\024\353\020\210\375m\371\273\344\314T\372\365\335\273\343\027\253\276P\000n\225Vs{IZ\017\336Zt\253\324\244\244\244\346\315_z\250\306\037\202\203\336\336\025\375eFzx\201#\316x\031\2167\327\005\322p\265\257n\024\024>\353\364l[\277\177\201=\356DzxL\324\302\340\240N5j\374\241E\363\227\222\022W\252\276D\000\312\201ns{1Z\017\336Z\364\254\324\230\230\230\220\321]\237|\262V\365\373\252\336Q\261b\005]\311\330\345\014\324~\262\226\234\215\230\350\205\252/\013\200rSA\313\271\335M\353\301[\213\346\225\252\334\330\261cU\037\002\200\000\244\371\334\256\365\340\255E\363JU\216\363\017\300\0274\237[\264\036\274\265h^\251\312q\376\001\370\202\346s\213\326\203\267\026\315+U9\316?\000_\320|n\321z\360\326\242y\245*\307\371\007\340\013\232\317-Z\017\336Z4\257T\3458\377\000|A\363\271E\353\301[\213\346\225\252\034\347\037\200/h>\267h=xk\321\274R\225\343\374\003\360\005\315\347\026\255\007o-\232W\252r\234\177\000\276\240\371\334\242\365\340\255E\363JU\216\363\017\300\0274\237[\264\036\274\265h^\251\312q\376\001\370\202\346s\213\326\203\267\026\315+U9\316?\000_\320|n\321z\360\326\242y\245*\307\371\007\340\013\232\317-Z\017\336Z4\257T\3458\377\000|A\363\271E\353\301[\213\346\225\252\034\347\037\200/h>\267h=xk\321\274R\225\343\374\003\360\005\315\347\026\255\007o-\232W\252r\234\177\000\276\240\371\334\242\365\340\255E\363JU\216\363\017\300\0274\237[\264\036\274\265h^\251\312q\376\001\370\202\346s\213\326\203\267\026\315+U9\316?\000_\320|n\321z\360\326\242y\245*\307\371\007\340\013\232\317-Z\017\336Z4\257T\3458\377\000|A\363\271E\353\301[\213\346\225\252\034\347\037\200/h>\267h=xk\321\274R\225\343\374\003\360\005\315\347\026\255\007o-\232W\252r\234\177\000\276\240\371\334\242\365\340\255E\363JU\216\363\017\300\0274\237[\264\036\274\265\334\260RSSS\243\243\243\343\343\343e\275i\323\246\025+VL\237>\275g\317\236\331\331\331\356>\343\307\217\227\355\356\207\231\231\231\377\374\347?\273u\353Vro\377\373\277\377\353p8\212m\374\364\323OSRR\334\0177l\330\360\361\307\037\337\314`,\302f\263-Z\264(++\313Yt\376\367\354\331\263c\307\016\325\307\005 p\220B`\0157\254\324\243G\217\316\236={\341\302\205\313\227/\377\333\337\376&YD\266\374\374\363\317v\273]\236=x\360`\277~\375BCC\273t\351\022\022\0222x\360\340\326\255[K(\221\327T\263\2038q\342\204|\325\336\275{\367\357\337\337\240A\203\204\204\004y\321\215\211\211IOO7;\234={\366\325W_\225\354\022\026\026&\273\352\334\271s\263f\315\244=h\320 \237\216]\0259?r\332+V\254X\253V-iT\256\\\271\202a\363\346\315\252\017\015@\200 \205\300\032J\257\324\330\330\330\267\337~;88X2\301\270q\343\036}\364QYKP\010\012\012\222\355qqq\005\005\005\021\021\021III\322y\340\300\201\347\317\237\2278\222\233\233\353\271\223\317?\377|\310\220!\363\014O=\365\224\331\350\337\277\277\204\033w\237\214\214\014I-\221\221\221\362\275:u\352\324\264iS\3114\236\357\257\004\222\211\023''V(\341\231g\236\011\017\017W}h\000,\214\367Y\335H!\226\341M^~\343\2157$y\214\0313FR\310\330\261c%\221\264o\337\376\342\305\213\362\324\345\313\227%y\214\036=:>>\376\275\367\336\223\352\357\335\273\367\316\235;%\276\230\357\232H\237\005\013\026|\377\375\367\346\256\336|\363M\263\261v\355Z\331.\215\335\273w\317\235;W\002\307\205\013\027d\343\306\215\033e?\022h\244\361\335w\337%''''\373j\344\352\234={\366\316;\357\364\214 \015\0336\274\347\236{233U\037\032\000\013\343}V7R\210ex\223B\3445r\247\241A\203\006fCr\311\245K\227\344))\356I\223&M\2336\355\351\247\237\2362e\212$\225\036=z|\375\365\327/\277\374\362\252U\253\366\356\335\3534RH\353\326\255\203\015\217<\362\210\331\220=\230)\344\310\221#\322\255e\313\226\331\331\331\022;V\257^\275\336\260\326\220\226\226\346\3533\240\304\220!Cd\2460''\210J\225*\311\031\2360a\202\352\203\002`m\274\317\352F\012\261\014/S\3106C\375\372\365\315F\363\346\315\315O\247feeIV\330\264i\323k\257\275\366\375\367\337K\214\350\336\275\273l\357\322\245\213\373S\250\245\277\027bz\353\255\267d\275x\361\342\256]\273~j\010\013\013\033=zt\271\216\325\217\344\345\345U\251R\305\234#\332\267o\377\360\303\017\027\3731\026\000\224\025\357\263\272\221B,\303\233\024\322\255[7\311\004c\307\216\375\313_\376b\376D\246G\217\036\347\317\237w\032)d\366\354\331\253W\257n\324\250\221\254\327\255[''\371\303Y"\205\014\035:\264\330\347B\006\014\030P2\205\254X\261\242U\253V\343\014\375\373\367\0373f\214/\206\354''\326\254Yc\316\0275j\324\320\360_*\000|\201\367YM\244\020\313\270a\0129x\360\240$\217\311\223''O\235:\365\361\307\037\2372e\312\273\357\276+[\016\0348`v\350\325\253\327\261c\307\336y\347\235\341\303\207GEE\265n\335\332yu\012\371\307?\3761w\356\334\375\206\006\015\032\230\215\317>\373l\316\2349\356\357")d\321\242E\222B$\235|ex\357\275\367\002;\205\210g\237}V\316\177\363\346\315U\037\010\200\000\301\373\254&R\210e\224\236B$I\374\362\313/\231\231\231YYY\027/^l\331\262\245\254\245-[\262\263\263\345\331\355\333\267\233aBRHNN\216d\210y\363\3469\215\024\342\376M]OM\2324)\271QBL\345\312\225g\317\236-)\344\243\217>:b\330\260aCXXX9\215\322O\245\245\245\311\371\017\324\317\276\000P\202\367Y\235\244\020\013)=\205$$$\364\355\3337((h\324\250Q!!!#F\214\220\365\310\221#\207\016\035j\276\005\3424~M\246u\353\326\023&LHIIi\330\260a~~\276lt\377\022M1\362\257\377\222\033\367\357\337o\376R\356\302\205\013\227-[&\015\211>\365\353\327_\272tiy\014\321\257i\376;\375\000|\201\367Y\231X-\243|_\005\363\362\362\314\206\304\210\202\202\202\222\035\016\037>\\\372\227\333l6\263]\362O\254\006\236\310\310\310\377\370\217\377\330\262e\213\352\003\001\020Px\237\225\024b\031\374[\\\025\011\037\277\373\335\357V\254\\)AD\303\337\346\007\340S\232\317\355Z\017\336Z4\257TU\314\010\022\021\361C\276\315\376\303\017\233\010"\000n\321\336\275{\307\216\035\333\264i\323\247\236z\252z\365\352w\337}\267\254\245-[d\273\371\327\233\364\301\013\233eT\254X\361\232?:\201\357xF\020s!\210\000\2709YYY\241\241\241\377\371\237\377Y\362\357\225\025#}\244\247\371\367\335\003\036)\3042*W\256|\356\3349\325G\241\221\222\021\304\035Dd;\237\021\001\340\245\274\274\274\2313gV\255Z\365\206\371\303\223\364\227\257r\177\206/P\221B,\243F\215\032\251\251\251\252\217B\027\327\213 \346"\333\371\260*\000oddd<\365\324S\236\361Bf\217N\235:}\265xIttLZ\372\211\213\227.\313Z\332\262\245C\207\016\362\254g\347\272u\353\312\036T\017\302\207H!\226Q\247N\235\270\2708\325G\241\205\322#\010A\004\200\227\242\243\243\253W\257\356\216\024\017?\374\360\342%Ksr\363J\231[\344Y\351S\263fM\367W\311\036d?\252\207\342+\244\020\313h\335\272\365\242E\213T\037E\340\363&\202\020D\000\334\220D\207J\225*\231I\342\356\273\357\2361c\306\245\31397\234X\314EzN\237\376\276|\225\371\345\262\237@\015"\244\020\313\2309sf\257^\275T\037E\200\363>\202\020D\000\224"##\303\375.H\265j\3256o\336\342\345\254\342\271\310W\271?M"{\013\310\037\315\220B,#66\366\261\307\036S}\024\201\254\254\021\204 \002\340\232\362\362\362\334\237\005\221\010\222\224|\370&"\210\271\310\327\272\203H\335\272u\003\357\303\252\244\020\313\260\331l\367\337\177\377\376\375\373U\037H`*\031AN\237\371\251\224\251\301\363Y\202\010\000O3g\316t\377 \346\346\336\005)\366\216\310]w\335e\356P\366\254zp\345\214\024b%\323\246Mk\337\276\275\352\243\010@%#HHh\250d\276C\211I\327\234\024d\273<+}\010"\000\212\311\312\312r\377\236\313\214\0313n1\202\230\313\364\351\357\273\177}7\300\376\216\010)\304JN\237>-/\226\346\177M\207\362r\315\010b\336\360\327\014"f\0041;\020D\000\024\023\022\022b\316\017\177\372\323\237\274\3778j\351\213\354\307\375[3\241\241\241\252\207X\236H!\026\363\325W_I-\006X\026V\250\224\010r\315 \342\031A\010"\000Jr\377u\324\305K\226\226K\0041\027\331\233\271[\331\277\352!\226''R\210\365\364\355\333\367\211''\236 \210\334\272k~\026\244X\310\360\014"%#\210\371,\237\021\001`\332\263g\21793\310<P\372\337\005)\353"{\223\371\312\334y \375_3\244\020\353)((\350\324\251\323\335w\337\315\217fn\305\365~#\346zQ#|\375\206R\002\212\347B\020\001\002\230\315f\233:u\352\202\005\013233K>;v\354Xsr\220Y\272\034#\210\271t\350\320\301\334\271|\227\333?p\037!\205X\325W_}%/\242\355\333\267\347\267fnB\351\277\224{\315 R\261bEo"\010A\004\010l+W\2564g\200;\357\274s\360\340\301\305~u\266i\323\246\346\263_-^R\356)D\366i\356\\\276\213\252\341\227;R\210\205\235>}z\332\264i\362Z\370\330c\217\365\352\325k\321\242Eqqq\251\251\251\347\316\235\343\177\337-\2057\177\027\344\232A\304\313\010B\020\001\002XVV\226\373\337$\322\250R\245\312\2325k\334\317\272\377LHttL\271\247\020\331\247\271s\371.\012\317@\371"\205X\236\315f\213\215\215\2359sf\353\326\255\353\324\251S\243F\215\312\225+\227\374\207;L\336\377i\262R\202\310\015#\010A\004\010`\265j\325\362\234\020\356\274\363\316g\237}6--M\236r\377\275\324\264\364\023\345\236Bd\237\346\316\345\273\250>\007\345\206\024\002\275\224\351\257\243\206\257\337P2\317\311\026\331\356\345\036~\370a\223\004\021\367\217\212\001\0046\367\377\374r\361\322\345rO!\262O\367wQ=\225\226\033R\010\364\022\031\031)A\344\373\210\010\336\013\201Z\307\216\035\353\332\265\2534\366\031\242\242\242\336|\363\315\304\304\304\335\273wgdd\234;w\356\255\267\336\352\327\257\337\360\341\303CBB\344\037\337\243G\217\016\016\016\0368p`\307\216\035\315\317E~\377\375\367\215\0337\376\360\303\017\245[\337\276}k\327\256-}\202\202\202\272u\353v\362\344\311\213\027/\266o\337\376\321G\037\2357o\336\321\243G\2335k\266\272\310\253\257\276\252z\364\326V\271res*\250T\251\222\234\344\207\036z\250E\213\026\274\027rsH!\320\2167A\204\317\205\300\327z\367\356}\352\324\251\257\277\376Z\262\305''\237|2s\346\314\347\237\177~\316\2349\222*v\355\332\3454\376/\222\344\344\344\023''N\374\370\343\217\257\275\366\232t\226\366\341\303\207srr\334;\371\345\227_\034\016G~~~\217\036=l6[zz\272\264=\277\313\340\301\203%\320H\243s\347\316\356\215\374\011\346[\341\376]\334\206\015\033\276\362\312+5k\326\014\017\017w?\313\347B\312\212\024\002\035\225\036D\370\035\031\370\332\206\015\033\036\177\374\361\221#G6k\326\314L\025\222\025\314\267F\334N\237>\375\334s\317\375\303\360\304\023O\230\215\027_|\361\310\221#\362lBB\302\260a\303\262\263\263\245=z\364\350\304\304Di\304\304\304\310N\314\017\247\307\307\307\367\351\323\247v\355\332}\373\366\375\370\343\217\2337o.\335BCCe\315{!\267"""\242\202\361\037\313\335s\317=\023''N\344wdn\021)\004\232\222 R\245J\025\376^\010\224\270x\361\342\217?\3768|\370\360\344\344\344\331\263gw\353\326m\320\240A\335\273w\0370`@\2336mN\235:%}233\273t\351b\366o\321\242\205\331\350\337\277\377\361\343\307\315vttt\277~\3756m\332\364\3143\317Hc\350\320\241\022k$y\214\0313\306\375\215\376\374\347?GEE\311\267;|\370\360\211\023''N\236<)\353\224\224\224\013\027.\334\326\001\007\226u\353\326\315\2325\353\354\331\263%\237r\177\010\254C\207\016\345\236B\370{!@@\341o\247B\241\255[\267~\366\331g\322\270|\371r||\374\376\375\373\017\0348\220\220\220\220\224\224dv8s\346L\223&M\202\203\203_\177\375\365G\036yD\202HPPP\243F\215RSS\335;9v\354\230\303\341X\261b\305\321\243G?\370\340\003\371\222/\276\370B\332\346\263k\326\254\221\177\262w\355\332u\351\322\2453f\314\220\027Ny8g\316\234\217>\372\350\320\241C\267\177\310:\330\273w\25793\360\267S\275D\012\201\326\370\177d\240\304\211\023''\036|\360\301\276}\373\366\352\325Kb\207d\213\177\026i\325\252\225g\317\310\310\310\211\023''J\004\221\350\360\365\327_\027\333\217l\277t\351\322\320\241Ce\207]\272t9}\372tXX\230\371Tvvv\2336m\006\015\032\224\221\221q\374\370\361\270\270\270\203\007\017\276\366\332k\222ubbbn\3238\265\344\353\377G\346\277\376\353\277T\017\261<\221B\240;\376O](a\267\333\035\016\307\376\375\373%\023\014\0336\314\275\275C\207\016\356\366\312\225+\273w\357.\335\314\237\310\204\204\204L\236<Y\276\320|6<<\374\037\377\370\207\323\370\264i~~\376;\357\274#)\304\375\343\230E\213\026m\337\276\335\375\351\324y\363\346}\365\325W\317=\367\334\222%K\346\316\235{\273F\251\243\320\242\011\244f\315\232\374\237\2727D\012\001\256\035DJ\371\360\251\031D\210 \270i\207\016\035\252W\257\236\004\216i\323\246\355\330\261\343o\177\373\333\273EZ\267n-\035\022\023\023\333\265k7a\302\004\363\243\246\356O#.\\\270\360\257\177\375kTTTnnn\203\006\015\362\362\362RSS\333\264i\3434~\013\346\314\2313\362\022%\351d\335\272uf\377\201\003\007\236={V\322\311\311\223''333\2337o.ki\233\037=\201/deeU\255Z\325L\014\323\247\277_.)D\366c\356P\366\034`\377\225))\004p\271\346gDJ\231\024\370,\010n\205\303\341p\277\245!\201c\370\360\341\347\213\364\356\335[6\376\364\323O\007\016\034p\367\177\376\371\347\335m\311\020\322-66v\316\2349\011\011\011\365\353\327\317\310\310\220\355\303\206\015\313\317\317o\331\262\245\344\030s\213\350\336\275\373\211\023''\226,Y"\371\346\375\367\337\2371c\206\254\245\275h\321\242\3337Z\375\314\2349\323\014\015w\337}\367\346\315[n1\202\310\036\356\272\353.s\207\262g\325\203+g\244\020\240\220\367\177\334\335s!\202\3406p\177\340\264$w\232\271\246\323\247O\027\373\013"\270\015\362\362\362\334\1778\244j\325\252I\311\207o:\202\310\327\272\337Y\251[\267n\261_\014\016\000\244\020\340\212\262\006\021"\010\200k\312\310\310p\377\035U\211\0217\367\216\210|\225;\202\310\336\334oq\005\022R\010p\025\357\203\010\021\004@)\242\243\243+U\252df\210\273\356\272k\372\364\367\275\377\260\252\364\224\376\356\037\304\310~do\252\007\344\023\244\020\2408o\202\010\021\004\300\015Itp\277#"\036~\370\341\305K\226\226\376wD\344Y\351\343\376\215\030\363]\220@\215 NR\010pM\245\007\021"\010\000/edd\324\255[\327\363\217\014\311\334\322\241C\207\257\026/\211\216\216IK?q\361\322eYK[\266\310v\367\237&s\177\026$ \177\020\343F\012\001\256\355zA\204\010\002\240L\362\362\362f\316\234\351\376\204\207\227\244\277|U\340}\034\265\030R\010p]%\203\010\021\004\300\315\311\312\312\012\015\015u\377e\325RH\037\351\031`\177\027\344zH!@i<\203\010\021\004\300\255\333\263g\317\330\261c\2336m\372\324SOU\257^\375\356\273\357\226\265\264e\213l\227gU\037\340mE\012\001n\300\014"+V\256$\202\000@\371"\205\0007\026\031\031)\021D\326\252\017\004\000\002\012)\004\000\000\250A\012\001\000\000j\220B\000\000\200\032\244\020\000\000\240\006)\004\000\000\250A\012\001\000\000j\220B\000\000\200\032\244\020\000\000\240\006)\004\000\000\250A\012\001\000\000j\220B\000\000\200\032\244\020\000\000\240\006)\004\000\000\250A\012\001\000\000j\220B\000\000\200\032\244\020\000\000\240\006)\004\000\000\250A\012\001\000\000j\220B\000\000\200\032\244\020\000\000\240\006)\004\000\000\250A\012\001\000\000j\220B\000\000\200\032\244\020\000\000\240\006)\004\000\000\250A\012\001\000\000j\220B\000\000\200\032\244\020\000\000\240\006)\004\000\000\250A\012\001\000\000j\220B\000\000\200\032\244\020\000\000\240\006)\004\000\000\250A\012\001\000\000j\220B\000\000\200\032\244\020\000\000\240\006)\004\000\000\250A\012\001\000\000j\220B\000\000\200\032\244\020\000\000\240\006)\004\000\000\250A\012\001\000\000j\220B\000\000\200\032\244\020\000\000\240\006)\004\000\000\250A\012\001\000\000j\220B\000\000\200\032\244\020\000\000\240\006)\004\000\000\250A\012\001\000\000j\220B\000\000\200\032\244\020\000\000\240\006)\004\000\000\250A\012\001\000\000j\220B\000\000\200\032\244\020\000\000\240\006)\004\000\000\250A\012\001\000\000j\220B\000\000\200\032\244\020\000\000\240\006)\004\000\000\250A\012\001\000\000j\220B\000\000\200\032\244\020\000\000\240\006)\004\000\000\250A\012\001\000\000j\220B\000\000\200\032\244\020\000\000\240\006)\004\000\000\250A\012\001\000\000j\220B\000\000\200\032\244\020\000\000\240\006)\004\000\000\250A\012\001\000\000j\220B\000\000\200\032\244\020\000\000\240\006)\004\000\000\250A\012\001\000\000j\220B\000\000\200\032\244\020\000\000\240\006)\004\000\000\250A\012\001\000\000j\220B\000\000\200\032\244\020\000\000\240\006)\004\000\000\250A\012\001\000\000j\220B\000\000\200\032\244\020\000\000\240\006)\004\000\000\250A\012\001\000\000j\220B\000\000\200\032\244\020\000\000\240\006)\004\000\000\250A\012\001\000\000j\220B\000\000\200\032\244\020\000\000\240\006)\004\000\000\250A\012\001\000\000j\220B\000\000\200\032\244\020\000\000\240\006)\004\000\000\250A\012\001\000\000j\220B\000\000\200\032\244\020\000\000\240\006)\004\000\000\250A\012\001\000\000j\220B\000\000\200\032\244\020\000\000\240\006)\004\000\000\250A\012\001\000\000j\220B\000\000\200\032\244\020\000\000\240\006)\004\000\000\250A\012\001\000\000j\220B\000\000\200\032\244\020\000\000\240\006)\004\000\000\250A\012\001\000\000j\220B\000\000\200\032\244\020\000\000\240\006)\004\000\000\250A\012\001\000\000j\220B\000\000\200\032\244\020\000\000\240\006)\004\000\000\250A\012\001\000\000j\220B\000\000\200\032\244\020\000\000\240\006)\004\000\000\250A\012\001\000\000j\220B\000\000\200\032\244\020\000\000\240\006)\004\000\000\250A\012\001\000\000j\220B\000\000\200\032\244\020\000\000\240\006)\004\000\000\250A\012\001\000\000j\220B\000\000\200\032\244\020\000\000\240\006)\004\000\000\250A\012\001\000\000j\220B\000\000\200\032\244\020\000\000\240\006)\004\000\000\250A\012\001\000\000j\220B\000\000\200\032\244\020\000\000\240\006)\004\000\000\250A\012\001\000\000j\220B\000\000\200\032\244\020\000\000\240\006)\004\000\000\250A\012\001\000\000j\220B\000\000\200\032\244\020\000\000\240\006)\004\000\000\250A\012\001\000\000j\220B\000\000\200\032\244\020\000\000\240\006)\004\000\000\250A\012\001\000\000j\220B\000\000\200\032\244\020\000\000\240\006)\004\000\000\250A\012\001\000\000j\220B\000\000\200\032\244\020\000\000\240\006)\004\000\000\250A\012\001\000\000j\220B\000\000\200\032\244\020\000\000\240\006)\004\000\000\250A\012\001\000\000j\220B\000\000\200\032\244\020\000\000\240\006)\004\000\000\250A\012\001\000\000j\220B\000\000\200\032\244\020\000\000\240\006)\004\000\000\250A\012\001\000\000j\220B\000\000\200\032\244\020\000\000\240\006)\004\000\000\250A\012\001\000\000j\220B\000\000\200\032\244\020\000\000\240\006)\004\000\000\250A\012\001\000\000j\220B\000\000\200\032\244\020\000\000\240\006)\004\000\000\250A\012\001\000\000j\220B\000\000\200\032\244\020\000\000\240\006)\004\000\000\250A\012\001\000\000j\220B\000\000\200\032\244\020\000\000\240\006)\004\000\000\250A\012\001\000\000j\220B\000\000\200\032\244\020\000\000\240\006)\004\000\000\250A\012\001\000\000j\220B\000\000\200\032\244\020\000\000\240\006)\004\000\000\250A\012\001\000\000j\220B\000\000\200\032\244\020\000\000\240\006)\004\000\000\250A\012\001\000\000j\220B\000\000\200\032\244\020\000\000\240\006)\004\000\000\250A\012\001\000\000j\220B\000\000\200\032\244\020\000\000\240\006)\004\000\000\250A\012\001\000\000j\220B\000\000\200\032\244\020\000\000\240\006)\004\000\000\250A\012\001\000\000j\220B\000\000\200\032\244\020\000\000\240\006)\004\000\000\250A\012\001\000\000j\220B\000\000\200\032\244\020\000\000\240\006)\004\000\000\250A\012\001\000\000j\220B\000\000\200\032\244\020\000\000\240\006)\004\000\000\250A\012\001\000\000j\220B\000\000\200\032\244\020\000\000\240\006)\004\000\000\250A\012\001\000\000j\220B\000\000\200\032\244\020\000\000\240\006)\344\377\267[\307\002\000\000\000\000\203\374\255\207\261\247(\002\000\036\026\002\000<,\004\000xX\010\000\360\260\020\000\340a!\000\300\303B\000\200\207\205\000\000\017\013\001\000\036\026\002\000<,\004\000xX\010\000\360\260\020\000\340a!\000\300\303B\000\200\207\205\000\000\017\013\001\000\036\001\035A\366wF\341\2444\000\000\000\000IEND\256B`\202', '0');
INSERT INTO "public"."act_ge_bytearray" VALUES ('1303', '1', 'freeLeave/freeLeave.png', '1301', '\211PNG\015\012\032\012\000\000\000\015IHDR\000\000\003\002\000\000\001\237\010\002\000\000\000c\271\362[\000\000\025AIDATx\234\355\335\177l\234\367]\300\361\2500\344JT5b\260\210\177\342\211?ji@,6\224\374E<$j#Ac\211\2511\374\221Y\252\226eLt\025B\233\005J\215X\203\205X\211\320\026y\260f\006\224a4\245\262\264\266\204\265\351\002$\231\351\217\324\375\221\315K\2335]\232.k\222\316%IsM\354\370\341\233\273\356z\263c\307W\337s\217\235\317\353\245\257\254\363\371\356\361=~\356\361\367}\277We\000\000!\255*\372\002\000\000\024C\006\001\000A\311 \000 (\031\004\000\004%\203\000\200\240d\020\000\020\224\014\002\000\202\222A\000@P2\010\000\010J\006\001\000A\311 \000 (\031\004\000\004%\203\000\200\240d\020\000\020\224\014\002\000\202\222A\000@P2\010\000\010J\006\001\000A\311 \000 (\031\004\000\004%\203\000\200\240d\020\000\020\224\014\002\000\202\222A\000@P2\010\000\010J\006\001\000A\311 \000 (\031\004\000\004%\203\000\200\240d\020\000\020\224\014\002\000\202\222A\000@P2\010\000\010J\006\001\000A\311 \000 (\031\004\000\004%\203\000\200\240d\020\000\020\224\014\002\000\202\222A\000@P2\010\000\010J\006\001\000A\311 \000 (\031\004\000\004%\203\000\200\240d\020\000\020\224\014\002\000\202\222A\000@P2\010\000\010J\006\001\000A\311 \000 (\031\004\000\004%\203\000\200\240d\020\000\020\224\014\002\000\202\222A\000@P2\010\000\010J\006\001\000A\311 \000 (\031\004\000\004%\203\000\200\240d\020\000\020\224\014\002\000\202\222A\000@P2\010\000\010J\006\001\000A\311 \000 (\031\004\000\004%\203\000\200\240d\020\000\020\224\014\002\000\202\222A\000@P2\010\000\010J\006\001\000A\311 \000 (\031\004\000\004%\203\000\200\240d\020\000\020\224\014\002\000\202\222A\000@P2\010\000\010J\006\001\000A\311 \000 (\031\004\000\004%\203\000\200\240d\020\000\020\224\014\002\000\202\222A\000@P2\010\000\010J\006\001\000A\311 \000 (\031\004\000\004%\203\000\200\240d\020\000\020\224\014\002\000\202\222A\000@P2\010\000\010J\006\001\000A\311 \000 (\031\004\000\004%\203\000\200\240d\020\000\020\224\014\002\000\202\222A\000@P2\010\000\010J\006\001\000A\311 \000 (\031\004\000\004%\203\000\200\240dP\216J\245\322\310\310Hoooggg[[\333\252\250\322\272\247\277@OO\317\360\360\360\344\344d\321\233\005\000\336!\203\362\262w\357\3364\375\247\006\332\275{\367c\373\366\275t\354\330\345\251\251\230#\255{\372\013\354\331\263g\363\346\315\351o\222b\250\350\215\003\000W\311\240\306\233\234\234\354\353\353\353\352\352:\361\352\211\313S\227\215\332q\372\314\351\024C\351\217s\352\324\251\2427\024\000\321\311\240\006K\015\324\321\321\361\300\256\257\\\236\272d\3147\036z\370\241u\353\326\035?~\274\350\315\005@h2\250\301\372\372\372\312\015\364\266\261\360xl\337\243\0336\374v\321\233\013\200\320dP#\355\335\273\267\253\353\366\251\351\222\261\230\361\331\317\375\371\366\355\237/z\243\001\020\227\014j\230R\251\324\326\326\366\352\311\343S\323\027\215\305\214\363\027~\274v\355oLLL\024\275\351\000\010J\0065\314\360\360p__\337\324\364[\325\361\321\356\337_\344K\312k\317\025jl\337\376\327\375\375\375Eo:\000\202\222A\015\323\323\323\263\347\301\177\177\267\201n\357\372a\226\275r%{q*\373\316\245\354\331K\331S\347\247w<\370\3707O\276\371\304\345\354\177K\331\023\245\354\300[\331\243og\377p\340\371-[?Yx\221\0242\236><\326\321\321Q\364\246\003 (\031\3240\355\355\355G\216<35}\2412V\255Zu>\313.\314doNgo\\\316\336\312\262?\373\213{W\335\364\363\353o\35799\225\235\270\224\235x;;^\312^\232\316\276\376\355g\313w\010]\0108\316_8\333\322\322R\364\246\003 \250\2023\250T*\215\216\216\016\014\014\364\364\364t\376Dwww:fddde\275\343pkk\353\231\263''\247\246\317WF*\233\267\256d\227\256\\\375\321\364\314\325\257\337x\344?\177\345W\177\355/\357\373\302t\226\235\233\316\336\234\312\336\230\312\322\032>\372\344s\345\014:\037s\244u/v\303-\023\013\354\013\303\303\303\336f\011 \017\205\315@\351?~\372\027\337\322\322\222\376\351\247\177\364{\366<\370\330\276\307+\343\241\207\037\331\266\355\336\336\336\336\024\026\353\327\257_)o:\\N\231s\325\221\276\2750\235\235\275\230]\276\362\316\011R\325\375\375\027\277\374\371\277\373\342\211\327\256NiS3\331\345r\036\035z\372\331Y\347\0155dP\332\027\322^p\335''\220utt\014\015\015\245Z*\372\362\002\3348\012\230\201\306\307\307+\2370\225r\347\362\324\364\302\343\300\301C\2337\177<M\000\373\367\357o\376E\255K9e\376\257:\256f\320\225\354\364[\331\217\316gSYv\371\322\245\366\333n[\265\352gV\255j\371\330\037m\256=\343S\207\237\231u\336P#r\006\245ku\012\375z?\240-eS\321\027\034\340\006\321\354\031hpp05\315c\373\036\277n\000\325\216\247\236>\274a\303\206\255[\267.\347\233\302\345\224y\263:*\017\212\235\275\230\275v.{\375\355\354\251#\337\377\300\007>\3603?\373s7\337\372\376\336?\376\251\014z\362\351\303\263\316\033j\304\314\240tM\356\353\353\233{\177\317g?\373\271\332{F\323\330\266\355\336\256\256\256Y\247L\267"V\326C\306\000\313S\363f\240\364\177\277\267\267\267\277\277\277\256\000\252\035_\332\271\263\263\263s\331>I\242\2342\223\325\221\276\2758\223\275Q\272zo\320\351\267\263}ON\374\372\332\017\277\377\227~\371\326\326_\370\362\277|\375\355,;\177){\353\322\3253\036\030{r\326yC\215\200\031\224\256\303\263\356\004\272\373\356\317\224?|w\336+\377\3513g\323\365\177\365\352\325\265w\013\215\217\217\027\275*\000+[\223f\240\324@\351\377\376\310\310\310{n\240\352cdi9\313\363\263\250\322\3144=\375\343\352\250\314\356\251\204\336\234\312~|9{\355\334\324\241\347\217\257\375\315\217|\364w\177\357\365K\331\217J\331\353\245\354\354\245,\205\320\201''\236\234u\336P#Z\006\245ko*\230j\315tww/\034@\263bh\333\266{\253\347mii\031\033\033+z\205\000V\260&\315@\275\275\275Ko\240\352\003d\251\204\226\341\243c\263R\246\363\243\033\236\373\356\213O=?16>q\360\360\304\301g\216\036z\356\330\267\236\370\316\267\237\177\371\277\017\037\375\237\303\337;\370\314\367\306\236=\372\374\213?\330\371\217\273\356\334tg\3419"\203\232\240r{\240\3321\367m\337\376\036v\201\335\273\277\226\002\250z\237\320\262\275\177\024`\371k\306\014488\270\224\307\302\346\216={\036\354\351\351i\302%\257K9\203\336\250\035\237\376\364''\027\363\244\327?\374\330\307f\2351\324\010\225A\351\366@u\273\247\253\361Rn\014\264\266\266V\226\323\331\331Y\364j\001\254T\271\317@\343\343\343\035\035\035\015l\240\312\330\262\345\223CCCy_\370\272\2243\350\254Q\357\210\223A\243\243\243K\274\037\250v<\364\360#\325\245\355\330\261\243\350\225\003X\221r\237\201R\003\245[\256\015\317\240\023\257\236\\\263\246mY=4v5\203\256\2341\352\035q2(\355\013\325\347\0035d/\250>Oh\365\352\325\313j_\000X)\362\235\201*\357\013\327\360\006\252\214\273\357\376\314\262\272\021\\\316\240\323F\275#H\006\215\214\214T\237\327\234"\276!\273\300\271\363\027\252\257\035\273\347\236{\212^E\200\225''\337\031\250\263\263\263\336\267\010\252\353\016\2414\007\344z\371\353R\316\240\327\215zG\220\014J\373B\245WR\2767p/x`\327\256\312b[[[\213^E\200\225''\307\031hrr2\375k\316\251\201*c\335\272u\313\347\005\303\345\014\372\221Q\357\210\220Ai_\250>\217\247Qw\005U\307\2325m\225%/\377wZ\007Xnr\234\201\206\207\207\373\372\372r\315\240\373\266o\357\357\357\317o\025\346\032\031\031\231\357]\213\312\031t\312\250w\3340\031\264\300u#\355\013\325Wu5|/\330\262\345\235\027$6y_\000\270\001\3448\003m\335\272uhh(\327\014zl\337\343\315|\265\360\321\243G+\363\315-\267\334\262g\317\236Y?\225A\2213h\341\353F\332\027\032\365\002\261k\356\005\225\205\257_\277\276\220u\007X\271r\234\201\272\273\273\027\363\341\251K\031/\035;\266fM[~\2530K\251T\272\351\246\233*S\316\373\336\367\276\017}\350C\265\267\376\313\031\364\303\006\216\305,p\221\277t\356\311\026sL]\277b)\253\331\264-\230\237\205\257\033i_\250\374(\217="\355\005\225\205\267\2655o_\000\2701\3448\003\345\364R\371\332q\356\374\205\226\226\226\374Va\256\332\017uJn\276\371\346\273\356\272\253\362Z\345\364\355\225+\2575j,ri\327<\331"\217\254\034\263j\036\265''\253=\362\232\247Y\342\2326s\013\346g\201\353F\365\245\3629\355\021\325_Z\364\337\000`\205\311\361\377f\232\025\032\376l\320kN\000\325\327\340\024\356\312\225\223K\034\213Y\370"O\263\300)\347\373\325\363\035Y\373u\341\323\277\267U^>[0''\325BZ\374\307\207\3255\252\313\317ow\006\270!\345\370\177\263\275\275\375\205#G\232\220A\371\255\302\\\267\336zkun\353)KS\370\304\304D\366\316\275A\257.q\314\267\220\332\343\027sx1\313\254=\301,\263\316[\373u\361\213]\374*7s\013\346g\201\353F\332\027*\307\347\264GT?b\254\350\277\001\300\012\223\343\377\315\\\3374\2502\232\374\334\240\352\313\236\323\254\366\211O|"}\035\031\031\251\376\264\234\005''\2268\346[H\355\361\2139<\337\221\325o\177\222;\013\375\352\352ij\362\350\335\303\015Y\337\312\002\233\266\005\363\263\360u\243zwW\036{\304\3513g+\013\367\326A\000\365\312q\006\352\353\353{`\327\256\\3\350\300\301C\353\326\255\313o\025fy\345\225W\322\315\356\356\356\356\266\266\266\376\376\3764\363\325\376\264\234\005?X\342\230{\307LMs\274{\232\205\017\327\036X`Q\225\003\213<\315\322Wm\201Un\332\026\314\317\302\327\215\264/T\376\252_\332\271\263\341{\301\013G\216T\026\336\321\321Q\324\352\003\254P9\316@;v\354h\354\033\346\316\035)\2636o\376x~\2530\327\350\350\350\360\360\3605\337\036\246Q\031t\335\343\353M\245\371\0265\367\300|iU\273\374k\376:\031\224-x\335\030\034\034\254\374\305\322\325\265\341{\301}\333\267W\026\336\333\333\333\364\225\006X\331r\234\201\322|\220n\031\347\232A]]]{\367\356\315o\025\352R\316\202W\2268\346[H\355\361\2139<\353\310\332\257sO\177\255\234\272\306\331\347\236k\351\353[YN\321\233.w\023\023\023\225?lkk\353\271\363\027\032\273\027l\330\260\241\262\360\024aE\257(\300\012\223\357\014\224\353\263\244\323t\222&\225\345\363\301\332W\263`\346\370\022\307B\367\364\324\234\346\272\207g\035Y\373u\356\351\347;\276\366\214\325\3130\337\271\226\262\312Eo\272fH7\011*\177\303={\036l\340^P}\323\240d\326#q\000\\W\2763P\256\217\213}\341\376\373\323\302s\275\374u)g\301\313K\034\363-\244\366\370\272\016W\016\314\375:\353\300\234\344zy\356\331k\217l\310\312V\227V\364\246k\206\376\376\376\312\337m\355\332\265\015\274C\350\216\215\033+\213\355\351\351)z\025\001V\236|g\240R\251\224n\004\347\361\356Ai"Y\263\246\355\324\251S\271^\376\272\224\313\340\373K\034\363-\244\366\370\005\3571\372\251\023\317:P\373\265\272\234\271\277t\326\357\272\3561K_\345\2427]3LNNV\337\335\247Q\037\251q\340\340\241\352\246\037\037\037/z\025\001V\236\334g\240\221\221\221;7m\272\341\357\012\312\336\311\240cK\034\013&\316\273\247\231\357\274\363}[=\\\273\250\271\007f\235\240\372\243\371N\271\364\365\255,\247\350M\327$;v\354\250\374y[ZZ\226\376\312\371\227\216\035\253v\325\326\255[\213^9\200\025\251\0313\320\035\03376\366\371\020/\0349Ryd\241\011\027~\361\312Y\360\222Q\357\210\223A\311\372\365\353+\341\222\012f)\357(\235\256\374i\027\250.jY\335-\012\260\2024c\006\232\234\234\\\267n]\243\236+}\372\314\3314\001\244)\244\011\227\274.\345\014z\321\250w\204\312\240\343\307\217\267\266\266V\363\345\275}\304\330\211WOV\033\250\245\245e\377\376\375E\257\026\300J\325\244\031hbb"\225\320\322?P)5\320\035\0337>\364\360#\315\271\330u\221A2h1R\265T\037\350L\021S\357\033*\0368x\250\3663\\w\354\330Q\364\012\001\254`\315\233\201\306\307\307\323M\330\364O|)\217\205\245\226Z\236\015\224\2253hf\346\250Q\357\210\226AY\371\215\026\253\367\011\255*\277v,]\253\027s''\320\235\2336\325>]L\003\001,QSg\240\311\311\311\015\0336l\333v\357\3513g\353}&\304\027\356\277\277\362\310Z3/p]\312\031\364=\243\336\0210\203\262\362\375\243\325\317[\255\306P\3325\346>v\234\352\347K;wvuu\325\2368U\224\307\302\000\226\256\3313P\251TJ\377\353o\273\255=e\315"\337=\345\201]\273\322\351\357\276\3733)\236\232|i\353R\316\240\011\243\336\0213\203\262\362\255\202\201\201\201\352\207\303\317\222\242\177\276\037\365\366\366zN4@C\0243\003\245\177\342\367\334sO\272E{\307\306\215\251r\346>Q4\035\263{\367\327\356\334\264)\235f\363\346\217_\363s\232\226\233r\006}w9\214o}\353\237\007\006>}\315\221~T\370\305\2335\302fPE\332\027\252\037\274z]\235\235\235cccE_d\200\033G\2213P\251T\032\035\035Ms@\365e/\265\017\020\244\006\032\031\031YA\237\017\220n\273_\274\370\314\314\314w\012\037\003\003\1772\337<\232~T\370\305\2335\202gPE\332\027\322\265=\355\013\035\035\035\2636Y[[[OO\317\320\320\220{\200\000\032\316\014\3240i\272z\371\345o\316\314\034)||\365\253\367uv\376\3265G\372Q\341\027o\326\220A\000\024\305\014\3240\335\335\335\377\261wh&{\301X\374\370\356\3047\332\333\333\213\336t\000\004%\203\032fpp\260\277\377\256\302\303be\215\257\016\337\327\327\327W\364\246\003 (\031\3240\307\217\037oo\377\340\305\322S3\331\363\305\216\201\201O\315\377\334\240O\025~\361jGO\317\357\214\216\216\026\275\351\000\010J\0065\322\300U[g\262\347\212\035\3512\314\237A\305_\274\352\370\267\221\277\355\355\355.z\243\001\020\227\014j\244R\251\324\331\371\221\261\261\177\315\262g\215\205\307\251S\373\332\333?89y\240\350\215\006@\\2\250\301&&&::n\233\230\030\315\262qc\276\221\032(\365\342\376\375_)zs\001\020\232\014j\274\261\261\261TB\203\203\177\232e\317\0242\206\207\377*E\3065G\372QQ\227\252:FG\357ooo\333\277\377\237\212\336P\000D''\203rQ*\225\372\373\373:;?\234\262\343\324\251G\263\354p3\307\300\300\226\371\237\033\264\245\311\027\246:&''\377kd\344oz{\273zz:\323\341\2427\021\000\310\240<\355\337\277\277\257\357\017V\257\376\305\371\242$\224\326\326[z{oO%T\364f\001\200w\310 \000 (\031\004\000\004%\203\000\200\240d\020\000\020\224\014\002\000\202\222A\000@P2\010\000\010J\006\001\000A\311 \000 (\031\004\000\004%\203\000\200\240d\020\000\020\224\014\002\000\202\222A\000@P2\010\000\010J\006\001\000A\311 \000 (\031\004\000\004%\203\000\200\240d\020\000\020\224\014\002\000\202\222A\000@P2\010\000\010J\006\001\000A\311 \000 (\031\004\000\004%\203\000\200\240d\020\000\020\224\014\002\000\202\222A\000@P2\010\000\010J\006\001\000A\311 \000 (\031\004\000\004%\203\000\200\240d\020\000\020\224\014\002\000\202\222A\000@P2\010\000\010J\006\001\000A\311 \000 (\031\004\000\004%\203\000\200\240d\020\000\020\224\014\002\000\202\222A\000@P2\010\000\010J\006\001\000A\311 \000 (\031\004\000\004%\203\000\200\240d\020\000\020\224\014\002\000\202\222A\000@P2\010\000\010J\006\001\000A\311 \000 (\031\004\000\004%\203\000\200\240d\020\000\020\224\014\002\000\202\222A\000@P2\010\000\010J\006\001\000A\311 \000 (\031\004\000\004%\203\000\200\240d\020\000\020\224\014\002\000\202\222A\000@P2\010\000\010J\006\001\000A\311 \000 (\031\004\000\004%\203\000\200\240d\020\000\020\224\014\002\000\202\222A\000@P2\010\000\010J\006\001\000A\311 \000 (\031\004\000\004%\203\000\200\240d\020\000\020\224\014\002\000\202\222A\000@P2\010\000\010J\006\001\000A\311 \000 (\031\004\000\004%\203\000\200\240d\020\000\020\224\014\002\000\202\222A\000@P2\010\000\010J\006\001\000A\311 \000 (\031\004\000\004%\203\000\200\240d\020\000\020\224\014\002\000\202\222A\000@P2\010\000\010J\006\001\000A\311 \000 (\031\004\000\004%\203\000\200\240d\020\000\020\224\014\002\000\202\222A\000@P2\010\000\010J\006\001\000A\311 \000 (\031\004\000\004%\203\000\200\240d\020\000\020\224\014\002\000\202\222A\000@P2\010\000\010J\006\001\000A\311 \000 (\031\004\000\004%\203\000\200\240d\020\000\020\224\014\002\000\202\222A\000@P2\010\000\010J\006\001\000A\311 \000 (\031\004\000\004%\203\000\200\240d\020\000\020\224\014\002\000\202\222A\000@P2\010\000\010J\006\001\000A\311 \000 (\031\004\000\004%\203\000\200\240d\020\000\020\224\014\002\000\202\222A\000@P2\010\000\010J\006\001\000A\311 \000 (\031\004\000\004%\203\000\200\240d\020\000\020\224\014\002\000\202\222A\000@P2\010\000\010J\006\001\000A\311 \000 (\031\004\000\004%\203\000\200\240d\020\000\020\224\014\002\000\202\222A\000@P2\010\000\010J\006\001\000A\311 \000 (\031\004\000\004%\203\000\200\240d\020\000\020\224\014\002\000\202\222A\000@P2\010\000\010J\006\001\000A\311 \000 (\031\004\000\004%\203\000\200\240d\020\000\020\224\014\002\000\202\222A\000@P2\010\000\010J\006\001\000A\311 \000 (\031\004\000\004%\203\000\200\240d\020\000\020\224\014\002\000\202\222A\000@P2\010\000\010J\006\001\000A\311 \000 (\031\004\000\004%\203\000\200\240d\020\000\020\224\014\002\000\202\222A\000@P2\010\000\010J\006\001\000A\311 \000 (\031\004\000\004%\203\000\200\240d\020\000\020\224\014\002\000\202\222A\000@P2\010\000\010J\006\001\000A\311 \000 (\031\004\000\004%\203\000\200\240d\020\000\020\224\014\002\000\202\222A\000@P2\010\000\010J\006\001\000A\311 \000 (\031\004\000\004%\203\000\200\240d\020\000\020\224\014\002\000\202\222A\000@P2\010\000\010J\006\001\000A\311 \000 (\031\004\000\004%\203\000\200\240d\020\000\020\224\014\002\000\202\222A\000@P2\010\000\010J\006\001\000A\311 \000 (\031\004\000\004%\203\000\200\240d\020\000\020\224\014\002\000\202\222A\000@P2\010\000\010J\006\001\000A\311 \000 (\031\004\000\004%\203\000\200\240d\020\000\020\224\014\002\000\202\222A\000@P2\010\000\010J\006\001\000A\311 \000 (\031\004\000\004%\203\000\200\240d\020\000\020\224\014\002\000\202\222A\000@P2\010\000\010J\006\001\000A\311 \000 (\031\004\000\004\365\377\316e\263\220\305p\345\236\000\000\000\000IEND\256B`\202', '0');
INSERT INTO "public"."act_ge_bytearray" VALUES ('1304', '1', 'freeLeave/freeLeave.bpmn', '1301', '<?xml version="1.0" encoding="UTF-8"?>\015\012<definitions xmlns="http://www.omg.org/spec/BPMN/20100524/MODEL"\015\012\011xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:activiti="http://activiti.org/bpmn"\015\012\011xmlns:bpmndi="http://www.omg.org/spec/BPMN/20100524/DI" xmlns:omgdc="http://www.omg.org/spec/DD/20100524/DC"\015\012\011xmlns:omgdi="http://www.omg.org/spec/DD/20100524/DI" typeLanguage="http://www.w3.org/2001/XMLSchema"\015\012\011expressionLanguage="http://www.w3.org/1999/XPath" targetNamespace="http://www.rguess.org/demo/activiti/leave">\015\012\011<process id="freeLeave" name="\350\207\252\347\224\261\346\265\201\350\257\267\345\201\207" isExecutable="true">\015\012\011\011<documentation>\350\207\252\347\224\261\346\265\201\350\257\267\345\201\207</documentation>\015\012\011\011<startEvent id="startevent1" name="Start" activiti:initiator="applyUser"></startEvent>\015\012\011\011<userTask id="approval" name="\350\207\252\347\224\261\346\265\201\350\257\267\345\201\207" activiti:assignee="${approvalUser}">\015\012\011\011\011<multiInstanceLoopCharacteristics isSequential="true">\015\012\011\011\011\011<loopCardinality>10</loopCardinality>\015\012\011\011\011\011<completionCondition>${endTag}</completionCondition>\015\012\011\011\011</multiInstanceLoopCharacteristics>\015\012\011\011</userTask>\015\012\011\011<endEvent id="endevent1" name="End"></endEvent>\015\012\011\011<sequenceFlow id="flow1" sourceRef="startevent1" targetRef="approval"></sequenceFlow>\015\012\011\011<sequenceFlow id="flow2" sourceRef="approval" targetRef="endevent1"></sequenceFlow>\015\012\011</process>\015\012\011<bpmndi:BPMNDiagram id="BPMNDiagram_freeLeave">\015\012\011\011<bpmndi:BPMNPlane bpmnElement="freeLeave" id="BPMNPlane_freeLeave">\015\012\011\011\011<bpmndi:BPMNShape bpmnElement="startevent1"\015\012\011\011\011\011id="BPMNShape_startevent1">\015\012\011\011\011\011<omgdc:Bounds height="35.0" width="35.0" x="30.0" y="120.0"></omgdc:Bounds>\015\012\011\011\011</bpmndi:BPMNShape>\015\012\011\011\011<bpmndi:BPMNShape bpmnElement="approval" id="BPMNShape_approval">\015\012\011\011\011\011<omgdc:Bounds height="55.0" width="105.0" x="110.0" y="110.0"></omgdc:Bounds>\015\012\011\011\011</bpmndi:BPMNShape>\015\012\011\011\011<bpmndi:BPMNShape bpmnElement="endevent1" id="BPMNShape_endevent1">\015\012\011\011\011\011<omgdc:Bounds height="35.0" width="35.0" x="290.0" y="120.0"></omgdc:Bounds>\015\012\011\011\011</bpmndi:BPMNShape>\015\012\011\011\011<bpmndi:BPMNEdge bpmnElement="flow1" id="BPMNEdge_flow1">\015\012\011\011\011\011<omgdi:waypoint x="65.0" y="137.0"></omgdi:waypoint>\015\012\011\011\011\011<omgdi:waypoint x="110.0" y="137.0"></omgdi:waypoint>\015\012\011\011\011</bpmndi:BPMNEdge>\015\012\011\011\011<bpmndi:BPMNEdge bpmnElement="flow2" id="BPMNEdge_flow2">\015\012\011\011\011\011<omgdi:waypoint x="215.0" y="137.0"></omgdi:waypoint>\015\012\011\011\011\011<omgdi:waypoint x="290.0" y="137.0"></omgdi:waypoint>\015\012\011\011\011</bpmndi:BPMNEdge>\015\012\011\011</bpmndi:BPMNPlane>\015\012\011</bpmndi:BPMNDiagram>\015\012</definitions>', '0');
INSERT INTO "public"."act_ge_bytearray" VALUES ('1305', '1', 'leave/leave.bpmn', '1301', '<?xml version="1.0" encoding="UTF-8"?>\015\012<definitions xmlns="http://www.omg.org/spec/BPMN/20100524/MODEL"\015\012\011xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:activiti="http://activiti.org/bpmn"\015\012\011xmlns:bpmndi="http://www.omg.org/spec/BPMN/20100524/DI" xmlns:omgdc="http://www.omg.org/spec/DD/20100524/DC"\015\012\011xmlns:omgdi="http://www.omg.org/spec/DD/20100524/DI" typeLanguage="http://www.w3.org/2001/XMLSchema"\015\012\011expressionLanguage="http://www.w3.org/1999/XPath" targetNamespace="http://www.rguess.org/demo/activiti/leave">\015\012\011<process id="leave" name="\350\257\267\345\201\207\346\265\201\347\250\213">\015\012\011\011<documentation>\350\257\267\345\201\207\346\265\201\347\250\213\346\274\224\347\244\272</documentation>\015\012\011\011<startEvent id="startevent1" name="Start"\015\012\011\011\011activiti:initiator="applyUserId"></startEvent>\015\012\011\011<userTask id="deptLeaderAudit" name="\351\203\250\351\227\250\351\242\206\345\257\274\345\256\241\346\211\271"\015\012\011\011\011activiti:candidateGroups="deptLeader"></userTask>\015\012\011\011<exclusiveGateway id="exclusivegateway5" name="Exclusive Gateway"></exclusiveGateway>\015\012\011\011<userTask id="modifyApply" name="\350\260\203\346\225\264\347\224\263\350\257\267" activiti:assignee="${applyUserId}">\015\012\011\011\011<extensionElements>\015\012\011\011\011\011<activiti:taskListener event="complete"\015\012\011\011\011\011\011delegateExpression="${afterModifyApplyContentProcessor}"></activiti:taskListener>\015\012\011\011\011</extensionElements>\015\012\011\011</userTask>\015\012\011\011<userTask id="hrAudit" name="\344\272\272\344\272\213\345\256\241\346\211\271" activiti:candidateGroups="hr"></userTask>\015\012\011\011<exclusiveGateway id="exclusivegateway6" name="Exclusive Gateway"></exclusiveGateway>\015\012\011\011<userTask id="reportBack" name="\351\224\200\345\201\207" activiti:assignee="${applyUserId}">\015\012\011\011\011<extensionElements>\015\012\011\011\011\011<activiti:taskListener event="complete"\015\012\011\011\011\011\011delegateExpression="${reportBackEndProcessor}"></activiti:taskListener>\015\012\011\011\011</extensionElements>\015\012\011\011</userTask>\015\012\011\011<endEvent id="endevent1" name="End"></endEvent>\015\012\011\011<exclusiveGateway id="exclusivegateway7" name="Exclusive Gateway"></exclusiveGateway>\015\012\011\011<sequenceFlow id="flow2" name="" sourceRef="startevent1"\015\012\011\011\011targetRef="deptLeaderAudit"></sequenceFlow>\015\012\011\011<sequenceFlow id="flow3" name="" sourceRef="deptLeaderAudit"\015\012\011\011\011targetRef="exclusivegateway5"></sequenceFlow>\015\012\011\011<sequenceFlow id="flow4" name="\344\270\215\345\220\214\346\204\217" sourceRef="exclusivegateway5"\015\012\011\011\011targetRef="modifyApply">\015\012\011\011\011<conditionExpression xsi:type="tFormalExpression"><![CDATA[${!deptLeaderPass}]]></conditionExpression>\015\012\011\011</sequenceFlow>\015\012\011\011<sequenceFlow id="flow5" name="\345\220\214\346\204\217" sourceRef="exclusivegateway5"\015\012\011\011\011targetRef="hrAudit">\015\012\011\011\011<conditionExpression xsi:type="tFormalExpression"><![CDATA[${deptLeaderPass}]]></conditionExpression>\015\012\011\011</sequenceFlow>\015\012\011\011<sequenceFlow id="flow6" name="" sourceRef="hrAudit"\015\012\011\011\011targetRef="exclusivegateway6"></sequenceFlow>\015\012\011\011<sequenceFlow id="flow7" name="\345\220\214\346\204\217" sourceRef="exclusivegateway6"\015\012\011\011\011targetRef="reportBack">\015\012\011\011\011<conditionExpression xsi:type="tFormalExpression"><![CDATA[${hrPass}]]></conditionExpression>\015\012\011\011</sequenceFlow>\015\012\011\011<sequenceFlow id="flow8" name="" sourceRef="reportBack"\015\012\011\011\011targetRef="endevent1"></sequenceFlow>\015\012\011\011<sequenceFlow id="flow9" name="\344\270\215\345\220\214\346\204\217" sourceRef="exclusivegateway6"\015\012\011\011\011targetRef="modifyApply">\015\012\011\011\011<conditionExpression xsi:type="tFormalExpression"><![CDATA[${!hrPass}]]></conditionExpression>\015\012\011\011</sequenceFlow>\015\012\011\011<sequenceFlow id="flow10" name="\351\207\215\346\226\260\347\224\263\350\257\267" sourceRef="exclusivegateway7"\015\012\011\011\011targetRef="deptLeaderAudit">\015\012\011\011\011<conditionExpression xsi:type="tFormalExpression"><![CDATA[${reApply}]]></conditionExpression>\015\012\011\011</sequenceFlow>\015\012\011\011<sequenceFlow id="flow11" name="" sourceRef="modifyApply"\015\012\011\011\011targetRef="exclusivegateway7"></sequenceFlow>\015\012\011\011<sequenceFlow id="flow12" name="\347\273\223\346\235\237\346\265\201\347\250\213" sourceRef="exclusivegateway7"\015\012\011\011\011targetRef="endevent1">\015\012\011\011\011<conditionExpression xsi:type="tFormalExpression"><![CDATA[${!reApply}]]></conditionExpression>\015\012\011\011</sequenceFlow>\015\012\011</process>\015\012\011<bpmndi:BPMNDiagram id="BPMNDiagram_leave">\015\012\011\011<bpmndi:BPMNPlane bpmnElement="leave" id="BPMNPlane_leave">\015\012\011\011\011<bpmndi:BPMNShape bpmnElement="startevent1"\015\012\011\011\011\011id="BPMNShape_startevent1">\015\012\011\011\011\011<omgdc:Bounds height="35" width="35" x="10" y="90"></omgdc:Bounds>\015\012\011\011\011</bpmndi:BPMNShape>\015\012\011\011\011<bpmndi:BPMNShape bpmnElement="deptLeaderAudit"\015\012\011\011\011\011id="BPMNShape_deptLeaderAudit">\015\012\011\011\011\011<omgdc:Bounds height="55" width="105" x="90" y="80"></omgdc:Bounds>\015\012\011\011\011</bpmndi:BPMNShape>\015\012\011\011\011<bpmndi:BPMNShape bpmnElement="exclusivegateway5"\015\012\011\011\011\011id="BPMNShape_exclusivegateway5">\015\012\011\011\011\011<omgdc:Bounds height="40" width="40" x="250" y="87"></omgdc:Bounds>\015\012\011\011\011</bpmndi:BPMNShape>\015\012\011\011\011<bpmndi:BPMNShape bpmnElement="modifyApply"\015\012\011\011\011\011id="BPMNShape_modifyApply">\015\012\011\011\011\011<omgdc:Bounds height="55" width="105" x="218" y="190"></omgdc:Bounds>\015\012\011\011\011</bpmndi:BPMNShape>\015\012\011\011\011<bpmndi:BPMNShape bpmnElement="hrAudit" id="BPMNShape_hrAudit">\015\012\011\011\011\011<omgdc:Bounds height="55" width="105" x="358" y="80"></omgdc:Bounds>\015\012\011\011\011</bpmndi:BPMNShape>\015\012\011\011\011<bpmndi:BPMNShape bpmnElement="exclusivegateway6"\015\012\011\011\011\011id="BPMNShape_exclusivegateway6">\015\012\011\011\011\011<omgdc:Bounds height="40" width="40" x="495" y="87"></omgdc:Bounds>\015\012\011\011\011</bpmndi:BPMNShape>\015\012\011\011\011<bpmndi:BPMNShape bpmnElement="reportBack" id="BPMNShape_reportBack">\015\012\011\011\011\011<omgdc:Bounds height="55" width="105" x="590" y="80"></omgdc:Bounds>\015\012\011\011\011</bpmndi:BPMNShape>\015\012\011\011\011<bpmndi:BPMNShape bpmnElement="endevent1" id="BPMNShape_endevent1">\015\012\011\011\011\011<omgdc:Bounds height="35" width="35" x="625" y="283"></omgdc:Bounds>\015\012\011\011\011</bpmndi:BPMNShape>\015\012\011\011\011<bpmndi:BPMNShape bpmnElement="exclusivegateway7"\015\012\011\011\011\011id="BPMNShape_exclusivegateway7">\015\012\011\011\011\011<omgdc:Bounds height="40" width="40" x="250" y="280"></omgdc:Bounds>\015\012\011\011\011</bpmndi:BPMNShape>\015\012\011\011\011<bpmndi:BPMNEdge bpmnElement="flow2" id="BPMNEdge_flow2">\015\012\011\011\011\011<omgdi:waypoint x="45" y="107"></omgdi:waypoint>\015\012\011\011\011\011<omgdi:waypoint x="90" y="107"></omgdi:waypoint>\015\012\011\011\011</bpmndi:BPMNEdge>\015\012\011\011\011<bpmndi:BPMNEdge bpmnElement="flow3" id="BPMNEdge_flow3">\015\012\011\011\011\011<omgdi:waypoint x="195" y="107"></omgdi:waypoint>\015\012\011\011\011\011<omgdi:waypoint x="250" y="107"></omgdi:waypoint>\015\012\011\011\011</bpmndi:BPMNEdge>\015\012\011\011\011<bpmndi:BPMNEdge bpmnElement="flow4" id="BPMNEdge_flow4">\015\012\011\011\011\011<omgdi:waypoint x="270" y="127"></omgdi:waypoint>\015\012\011\011\011\011<omgdi:waypoint x="270" y="190"></omgdi:waypoint>\015\012\011\011\011\011<bpmndi:BPMNLabel>\015\012\011\011\011\011\011<omgdc:Bounds height="11" width="100" x="10" y="0"></omgdc:Bounds>\015\012\011\011\011\011</bpmndi:BPMNLabel>\015\012\011\011\011</bpmndi:BPMNEdge>\015\012\011\011\011<bpmndi:BPMNEdge bpmnElement="flow5" id="BPMNEdge_flow5">\015\012\011\011\011\011<omgdi:waypoint x="290" y="107"></omgdi:waypoint>\015\012\011\011\011\011<omgdi:waypoint x="358" y="107"></omgdi:waypoint>\015\012\011\011\011\011<bpmndi:BPMNLabel>\015\012\011\011\011\011\011<omgdc:Bounds height="11" width="100" x="-24" y="-17"></omgdc:Bounds>\015\012\011\011\011\011</bpmndi:BPMNLabel>\015\012\011\011\011</bpmndi:BPMNEdge>\015\012\011\011\011<bpmndi:BPMNEdge bpmnElement="flow6" id="BPMNEdge_flow6">\015\012\011\011\011\011<omgdi:waypoint x="463" y="107"></omgdi:waypoint>\015\012\011\011\011\011<omgdi:waypoint x="495" y="107"></omgdi:waypoint>\015\012\011\011\011</bpmndi:BPMNEdge>\015\012\011\011\011<bpmndi:BPMNEdge bpmnElement="flow7" id="BPMNEdge_flow7">\015\012\011\011\011\011<omgdi:waypoint x="535" y="107"></omgdi:waypoint>\015\012\011\011\011\011<omgdi:waypoint x="590" y="107"></omgdi:waypoint>\015\012\011\011\011\011<bpmndi:BPMNLabel>\015\012\011\011\011\011\011<omgdc:Bounds height="11" width="100" x="-22" y="-17"></omgdc:Bounds>\015\012\011\011\011\011</bpmndi:BPMNLabel>\015\012\011\011\011</bpmndi:BPMNEdge>\015\012\011\011\011<bpmndi:BPMNEdge bpmnElement="flow8" id="BPMNEdge_flow8">\015\012\011\011\011\011<omgdi:waypoint x="642" y="135"></omgdi:waypoint>\015\012\011\011\011\011<omgdi:waypoint x="642" y="283"></omgdi:waypoint>\015\012\011\011\011</bpmndi:BPMNEdge>\015\012\011\011\011<bpmndi:BPMNEdge bpmnElement="flow9" id="BPMNEdge_flow9">\015\012\011\011\011\011<omgdi:waypoint x="515" y="127"></omgdi:waypoint>\015\012\011\011\011\011<omgdi:waypoint x="514" y="217"></omgdi:waypoint>\015\012\011\011\011\011<omgdi:waypoint x="323" y="217"></omgdi:waypoint>\015\012\011\011\011\011<bpmndi:BPMNLabel>\015\012\011\011\011\011\011<omgdc:Bounds height="11" width="100" x="10" y="0"></omgdc:Bounds>\015\012\011\011\011\011</bpmndi:BPMNLabel>\015\012\011\011\011</bpmndi:BPMNEdge>\015\012\011\011\011<bpmndi:BPMNEdge bpmnElement="flow10" id="BPMNEdge_flow10">\015\012\011\011\011\011<omgdi:waypoint x="250" y="300"></omgdi:waypoint>\015\012\011\011\011\011<omgdi:waypoint x="142" y="299"></omgdi:waypoint>\015\012\011\011\011\011<omgdi:waypoint x="142" y="135"></omgdi:waypoint>\015\012\011\011\011\011<bpmndi:BPMNLabel>\015\012\011\011\011\011\011<omgdc:Bounds height="11" width="100" x="10" y="0"></omgdc:Bounds>\015\012\011\011\011\011</bpmndi:BPMNLabel>\015\012\011\011\011</bpmndi:BPMNEdge>\015\012\011\011\011<bpmndi:BPMNEdge bpmnElement="flow11" id="BPMNEdge_flow11">\015\012\011\011\011\011<omgdi:waypoint x="270" y="245"></omgdi:waypoint>\015\012\011\011\011\011<omgdi:waypoint x="270" y="280"></omgdi:waypoint>\015\012\011\011\011</bpmndi:BPMNEdge>\015\012\011\011\011<bpmndi:BPMNEdge bpmnElement="flow12" id="BPMNEdge_flow12">\015\012\011\011\011\011<omgdi:waypoint x="290" y="300"></omgdi:waypoint>\015\012\011\011\011\011<omgdi:waypoint x="625" y="300"></omgdi:waypoint>\015\012\011\011\011\011<bpmndi:BPMNLabel>\015\012\011\011\011\011\011<omgdc:Bounds height="11" width="100" x="10" y="0"></omgdc:Bounds>\015\012\011\011\011\011</bpmndi:BPMNLabel>\015\012\011\011\011</bpmndi:BPMNEdge>\015\012\011\011</bpmndi:BPMNPlane>\015\012\011</bpmndi:BPMNDiagram>\015\012</definitions>', '0');
INSERT INTO "public"."act_ge_bytearray" VALUES ('1702', '1', 'leave/leave.png', '1701', '\211PNG\015\012\032\012\000\000\000\015IHDR\000\000\002\327\000\000\002E\010\002\000\000\000\231BLB\000\000T`IDATx\234\354\335\011x\024U\272\377q\006\227\341\177\237\231+\314\205Q\034\307{\021G\346\336q\003\361\252w\034QPF\331\004\221E6A\366}M\330\222\260\313"\012n#\233\002\016\002\303&\210\022\300\010\204-\011IX\302\222\004\022 !\010\030\004b\200,\335\235\376\277]\2254M\002\241\003iNW\237\357\347\251\247\236\323\325''\225:Uo\235\376\321\351\204\012N\000\000\000\025*\250>\000\000\000\240)R\010\000\000P\203\024\002\000\000\324 \205\000\000\0005H!\000\000@\015R\010\000\000P\203\024\002\000\000\324 \205\000\000\0005H!\000\000@\015R\010\000\000P\203\024\002\000\000\324 \205\000\000\0005H!\000\000@\015R\010\000\000P\203\024\002\000\000\324 \205\000\000\0005H!\000\000@\015R\010\000\000P\203\024\002\000\000\324 \205\000\000\0005H!\000\000@\015R\010\000\000P\203\024\002\000\000\324 \205\000\000\0005H!\000\000@\015R\010\000\000P\203\024\002\000\000\324 \205\000\000\0005H!\000\000@\015R\010\000\000P\203\024\002\000\000\324 \205\000\000\0005H!\000\000@\015R\010\000\000P\203\024\002\000\000\324 \205\000\000\0005H!\000\000@\015R\010\000\000P\203\024\002\000\000\324 \205\000\000\0005H!\000\000@\015R\010\000\000P\203\024\002\000\000\324 \205\000\000\0005H!\000\000@\015R\010\000\000P\203\024\002\000\000\324 \205\000\000\0005H!\000\000@\015R\010\000\000P\203\024\002\000\000\324 \205\000\000\0005H!\000\000@\015R\010\000\000P\203\024\002\000\000\324 \205\000\000\0005H!\000\000@\015R\010\000\000P\203\024\002\000\000\324 \205\000\000\0005H!\000\000@\015R\010\000\000P\203\024\002\000\000\324 \205\000\000\0005H!\000\000@\015R\010\000\000P\203\024\002\000\000\324 \205\000\000\0005H!\000\000@\015R\010\000\000P\203\024\002\000\000\324 \205\000\000\0005H!\000\000@\015R\010\000\000P\203\024\002\000\000\324 \205\000\000\0005H!\000\000@\015R\010\000\000P\203\024\002\000\000\324 \205\334@tt\364\350\321\243k\327\256}\337}\367\335q\307\035\025t%c\2273 \347A\316\206\234\023\325\227\005~\204{\304\304=b-\324\255Iy\335\222B\256+))\251E\213\026\017?\374\360\360\341\303w\356\214:\236\226\236\227o\313\267\311b7\026w\343\232\017Kn\267v\377\274\374|9\003r\036\206\005\005\3119i\336\274ybb\242\352K\004\305\270G\270G\254\210\272\365\253\272%\205\\\333\356\335\273+U\2524y\362\344\31399R\237\306\005s\255m6\263X\257\261\330\354\356v\200\367\227s2e\312\224j\325\252\255[\267N\365\205\2022\334#\334#VD\335\372[\335\222B\256A.@\205\012\025"##\215\253\225o\244d\327%+j\033k\273-\377\352-\236\213\016\3757l\334 gIni\325\227\013\012p\217p\217X\021u\353\207uK\012).))\351\367\277\377\375\306\215\353\363my6[^\276-W\026\263Q\354\241\253\203=\317\354\346nh\325?2r\313\257\177\375k\336v\326\015\367\010\367\210\025Q\267\376Y\267\244\220\342Z\264h1y\362$\343\362\310\265\311q5\354\271E\027\254\260]\264%\307\334^\330M\313\376S\246Ln\366zS\325\027\015\267\025\367\010\367\210\025Q\267\376Y\267\244\220\253\304\304\304<\364\320C9\271\027\345\032\330dq]!Y\347\344\027\265\315\305f\256\355\356F\256\266\375/\347d\327\254\371\020\277\021\240\017\356\021\356\021+\242n\375\266nI!W\011\011\011\011\016\016\266\331.\033W\353\262,\365\376\336\330\313\337w2\373\273\256_\321\227_i\330\215\215f\007{\216\347\376\003\240\177P\320\220\321\243G\253\276t\270M\270G\270G\254\210\272\365\333\272%\205\\\245v\355\332;vD\346\333.\031W\345\322\213/7\374\321\351<\356p\036\2669\017\3469\367\3469c\263\3553V\376\260!\343BL\2763:\307\031\223\343\334v\311\2711\327\371\341\266\204\356=z\032\227\360\262\373\313=\333\346\303+m[\341S\001\320\177\347\316\255O>\371\204\352K\347[\221\221\221\377\361\037\377\261e\313\026\325\007\242\036\367H\340\335#:\2247u\353\267uK\012\271J\365\352\325\217\037?b\263_2\027I\301\331N\347\305\002\347\005\273\363\347|\347%\247s\310\250\260\012\025\177\363l\303\346\0316gz\2363=\327y,\307y\304\356\\\266s\257t\266\271\256\342E\363k]\015\233\261\037\333%\263\221\357~X\264\377\300\350\237\226\236r\357\275\367\252\276t>$\263\363\357~\367\273\025+W\312L\275y\363f\325\207\243\030\367H\200\335#\232\2247u\353\267u[\016)d\317\236=c\306\214i\322\244I\235:u\356\273\357\276\273\356\272K\326\322n\334\270\261l\227go\375[\3346w\334qG^~\266\315u\221.\3125\220\342\273\344p\3469\\O\331\013\\\353o\276[\177\177\315GGO\234nw:\177\261;/\330\234?\333\234\347\235\316\215\273\366\271*\325n\\f\327\305\276h\\\362\302\375\024>\364l\024m\017\200\376\371\371\331\025+VT{\341|\307\234\243#"~\310\267\331\177\370a\223\217f\352\224\224\224\035;v\354\332\265+...\336\020\033\033\033\025\025\225\234\234\\\254\247<\025\026\026V\356\007\340=\356\221@\272G|T\336~X\317\324\255\337\326\355\315\247\220\013\027.\214\0301\342\301\007\037\254Y\263\346\320\241C\327\256]\033\025\025}<-=7\317\365\207\330\244\275z\315\032\331.\317\376\361\217\177\224\236\322\277\034\217\333G\214\314\373\213\315.\305\232-kyx\321\356<{\331\231\357(\354p\376\374\371\017>\2365\341\275\217\323O\236\222\207\266\002g\276Q\301;\342\366\026~\255\361\205\205;)\331pu\270\262\377\200\351/cWw\321|\310s\2166\027\037\005\221\341\303\207\317\2325k\365\325\346\314\231\323\257_?\367\221\214\0349\262K\227.\357\275\367\2364&M\232\324\250Q\243\340\340\340\333\377\231G\356\221\200\271G|W\336~X\317\324\255\337\326\355\315|\203\234\234\234\0313fT\253V\255g\317\236{\366\356\273\316_\207\275\262\354\335\227\320\255{w\351\377\301\007\037\310\327\226\373\030\312\221\221y\345\354g\231kW\245:\234?]r\236\316v\332\234\316\374\274\274?\327\252U\241\302\035\025*Tz\363\255N\236_\030\033\277\373\312\327\026^N\367~<\032v\317\355Y\001\323\337\017g\330[Wr\216v\317\324\262\275|\177\210.\023\361\326\255[e\246^\277~\375\306\215\033e-\355m\333\266\015\0336L\236\315\314\314\224\1772\356\337\277\277u\353\326\362}\023\023\023\247L\231"\023\367\201\003\007\366\354\331s\356\334\271r<\222\033\342\036\011\214{\304\247\345\355\207\365L\335\372m\335\226\371\033ddd\324\255[\267I\223&\222-n\230?\212e\221\306\215\233<\375\364\323\262\007_\214\244\\\030\325\226e\234}\271\014Y\346\273v\222\227O\376\342<\223\353\214=\220z\357\275\367\336q\347\335\377\357\236\252m\333]U\251\273\342\342\245\263\335u!\263\354\366,\317\235\330\355\205\015Y\233\035<\236\012\220\376\3766\303\336\272\353\315\321\346"\333\313\367\323|2k\307\304\304DEE\311,\274o\337>Y\313\303\330\330X\371\327\241\323x\177{\311\222%c\306\214\221\177b\216."\355\261c\307.^\2748--\255\274\016\303\033\334#\001p\217\370\272\274\375\260\236\251[\277\255\333\262}\203\364\364\364j\325\252\275\367\336{e\312\037\236\313\344\311S\252W\257\356\267\277:o\274\363v\301u1\354\027\314\013p\271\300\371s\216+/\377\224\353\214\330\225\370\330\023OU\255\366\373{*W\231\265pY\256\323\231\235\347\274\224\347\372\302mQ\273\012\277\326\365\345\205k\343\222_\331b\\\362\013\236\373\017\230\376~5\303\336\272\322\347h_\004\021\231\265SSS\227.]:j\324\250\260\2600\231\224\227/_~\374\370qs\3266\265k\327n\243\007\371\367e\373\366\355\313\345\273\227\011\367\210\325\357\221\333P\336~X\317\324\255\337\326m\031\276\201D\0079 )\246\233\216 \346\262b\345J\331\217\004\032\337\215\352\246\031\325v\336\356\2720\347e1/\200\024\353\005\233\363\\\276\244f\333\216\204cO\324\251\373\322+\257\235\311s\236\316q\236\311q\236\315sJ\255n\2131*\325n^`\327b\\]cW\366\302\265\315s\243\261\377\200\351\357?3\354\255\363f\216.\367 b\316\332\203\007\017\316\314\314t\032\037\272\032:th\311Y\373]\017\223&M\352\330\261\343\255\177\353\262\342\036\261\364=r{\312\333\017\353\231\272\365\333\272\365\366\033dddT\257^}\365\352\325\267\030A\314e\311\322\245\325\252U\363\303\037\315\030\325v\336\2706r%\316\275P\357\205}\207\016\307&$F\355I\334\036\237\270}w\362\216})\233b\016\356L8\032\031\237\2745>i\373\356\244\250\275\311\011\207\323>\235\375\371\233\255Z\231_e3\327\266\363\236\017\215v\321\303\242\375\007L\177?\231ao\235\367st\371\006\021s\326\016\012\012*e\326\0360`\300\204\011\023\334\263\366\370\361\343e\226\277\305\357{\023\270G\254{\217\334\266\362\366\303z\246n\375\266n\275\372\006999u\353\326\275\225\037\304\224\\&O\236\362\364\323O\373\333\207U\215\237\377\311\0058g\\\006\271\006\347\372\366\355\351\315\037\327{\343\215\226f\177{\321b\363\330\217g\243\330\376\003\243\277?\314\260\267\256\254st9\006\021s\326\2367o\336\270q\343\314\031y\376\374\371\236\263vzz\372\252U\253BCCsss{\366\354i\276\225(\317&%%\225\303\310\313\202{\304\242\367\310\355,o?\254g\352\326o\353\326\253o0c\306\214&M\232\224c\0041\227\306\215\233|\360\301\007\276\036a\231\030\225\372\263\315~\326\356Z~6\3336\233\253m\254\315\215\205[\\\015c\013\375\225\317\260\267\256\344\034}\372\314O\245T\257\347\263\267\036Dd\376MII)\266Qf\344\021#F\230\355\016\035:$''''\233oY\237={6<<|\356\334\271\021\021\021\257\276\372\352\311\223''o\372\373\336\004\356\021+\336#\267\271\274\375\260\236\251[\277\255\333\033\177\203\254\254\254\252U\253\226\3657b\274Yd\237\262g\277\372;"\306\273v\231\306e\220\253\222i\263\025\266\335[<\037\032\2270\223\376\262X=\205\224\234\243CBC\357\277\377\376C\211I\327,]\331.\317J\237\362\012"C\206\014IHH\360\334"\363u\275z\365\314\277\334\220\221\221\361\311''\237HCR{\237>}\344\037\232\303\206\015\353\334\271\363\345\313\227O\235:e\263\331n\371\004\224\001\367\210\345\356\221\333_\336~X\317\324\255\337\326\355\215\277\201\224H\317\236=\313=\202\230K\267\356\335\335\351\330\037\030y9\363\232\213\315\335\260]\273\203\316\375-\235B\2569G\233o\306^s\2466\347h\263C9\006\021\253\340\036\261\326=By\233\250[\277\255\333\033\177\203?\376\361\217\276x#\304\375v\310\003\017<\340\353Az\317\250\324\237l\266\237d\355j\330\315F\246\275\260\341ng^\325M\373\376\326M!\245\314\321\327\234\251=\347\350\300\233\251\275\301=b\241{\204\362v\243n\375\266no\360\015\366\354\331S\263fM\037E\020sy\350\241\207\374\347\377\2321*\365\214q\366\317\024]\2523\306%qo<s\315\016\232\367\267h\012\271\346\017\313\213\315\302\2363u\3119\332|\266|?#\342\347\270G\254r\217P\336\236\250[\277\255\333\033|\2031c\306\014\035:\324\247)d\320\340\301\362]|=N7\233\3156u\352\324\005\013\026\230\277BVLQ\245\232\313ic\361|x\246\304r\232\376\262\370U\012)\375\022\273]\357W\006\2567\027\207\257\337P\312\014\356\271Xw\2466q\217\370\363=By_\017u\353\317u[\212\033|\203&M\232\254]\273\326\247)d\365\2325\215\0337\366\3658\335V\032\1773M\334y\347\235\203\007\017\316\313\313\363|\326\250\324SE\327\300\335(\271\270\236r8\212u\323\267\277_\245\220\322/\261\251\364\337Z\274\346L]\261bEo\346h?\237\251\275\301=\342\317\367\010\345}=\324\255?\327m)n\360\015\236z\352\251\235;\243|\232B\242\242\242k\327\256\355\353q\272eee\271\3577iT\251Re\315\2325\356g\215J\375Q\256\201\303q\312\341\272\022?\232\213<,\3360\236-\352\243{\177\277J!\245_b\247w\1778\341\2323\265\227s\264?\317\324\336\340\036\361\347{\204\362\276\036\352\326\237\353\266\0247\370\006\325\253W?v<\315\247)\344xZ\372\275\367\336\353\353qz\252\345\372\277\023\257\220\340\374\354\263\317\232\377\205\222Q\251''\215\263/\353\223\016\327\245\372\321\275\305\341\261\335\334\350nh\336\337\257R\210\263\324K\354\375\337n*e\246\276\341\034\355\2673\265\227\270G\374\371\036\241\274\257\207\272\365\347\272\275\236\033|\203\273\356\272+7/\337\247)D\366/\2652v\354\330R\202\371\355\344\272\000\016\3632\234,\274\036%\036:\256l\317\240\277<\224\363\346?W\260te\372\363\221\341\3537\224|\247Z\266\310v/\367\360\303\017\233d\246\266\312\311\361\222%j\322\337\372W\270-\367\010\345]\012K\324\211\277\365\257\240<\205\004\344{!\225+W6\213\262R\245J\355\333\267\177\350\241\207Z\264h\341\316\313\016\207\\\214\214\302\265\353\302\024.\305\2668\212\326\364\227\3456Tj\231\224r\211###e\246\376>"\342\206\225\031\220\377X\364\022\367\210?\337#\224\367\365P\267\376\\\267\327\243\335\347B\366\354\331c\226i\303\206\015_y\345\225\2325k\206\207\207\273\237uU\252\375\204\335X\244!\327\303\275.\334\3500/\2224\212\036z\364\277p!i\360\240\356\346\306\314\314\375II[\217\036\215NL\334\232\235}X\372\237>\275\257u\353\246\347\317\035\262\331\32232\3423\177J\370\371\347\203\262>{\366\200{''\262\275}\3737\244\261s\3477\0337.\335\274y\305\346M\313\245\021\037\277A\372\034<\270e\324\310\376aa\203\307\214\031"\2134BC\007M\235\032R\362x\276\375\366\313i\323BJ\036\377\2313\011\035;\276)\215o\276Yp\350P\244<%\373\221\303\273\271\361\272\373\373U\012)\375\022;\275\233\251\003\362\007\347^\362\351=\342}\377\036=:\344\346\034-\245\377\213/>W\312\376\2773n\201\222\373w\335\002\035ZJc\315\232\005\211E\267\300\305\213G\312\375\370}t\217P\336\327\343''u{\275\376\275{w\222\227\203K\227RRRv\310\303\277\377\375\305\234\313\251G\216\354p\275:\030={\365\354\030\021\361\257\235;\276\221\311_\266\313\234\277w\357\367\007\016l\366\321\361\370\317\334~\343\337\221\371\272\234\376\037\335\353-\262\377F\215n\337\357\310DDD\310i\255[\267\356=\367\3343q\342\304k}\216:]\256\212\243\360\332\244\273\036\026\256O\030\333\013\333E\335\322\315\206\335\226\336\243G\373\221#\373\277\362\312\013\022\024z\366\354\370\217\177Ln\337\276\305\364\351\241\217=\366\347\213\256\227\371\364\334\334\2431\321ken\315\311I\355\337\257Kpp\357\021#\372\365\353\327E\212\317\275\377aC{\266k\327\342\330\321h)\307\225+\3476l\370\302\322\245\377X\261b\316\216\355k\344\331\015\033\026\177\374\361\304\374\274cyy\307\362\363\216\347\347\037\227\366\233o66\217\347\344\311\370\372\365\377:`@\327a\303z\005\007\365n\336\374\325\240\240\336\322\0362\270{\275z\317\236\314\210\227=\330\362\217\313\376\245\377\350\321\003RSw\312\361\267i\323\354&\306[\254\277_\245\220\322/\261\251\364\231:P\177\211\300K>\272G\312\332\377\205\027\236-\326\377\340\201\315-[6\222\373e\310\220\036#\206\367\255U\253\346\360\341}\244\274\345v\223\355\311I[\257\334\002C{\006\031\267\200\334eA\303z\0156n\201\214\214\270+\267\200\343D\310\350\201r\013\330\315[\300\007\307\357\243{\204\362\276\036?\251\333k\366\317\314L\370\313_\036Y\270p\346\017\021\313\2324y\371\347\237\017\274\361\306k\362\212 %z`\377&WY\332\322\2326}e}\370"\251\355\345\313\346\214\034\331o\345\212\271_}\365\311[m\233\373\342x\374jn\277\3017\030;v\354\300A\203|\232B\006\015\036\034\022\032\352\353qzZ\267n\335\254Y\263\316\236=[\362)#/\2479\034ivY\033\215\302\265\303\243]l]\324?=-f\316\234\251\362p\356\334i\337~\273`\355\332\371\213\026}t\376\374\201\036\335\333\231=\373\367\357\262;>\274\330\3763N\354\222\355\346\376#\276_2qbp\326\205C2\245\356\212\371v\357\336\015M\233\276\234\260\357\373\335\273\303/_\226\177\253\245m\334\370U\203\006\317\017\031\322\275p\031\334}\320\240\256\222B\362\363\217\312\263\351\3511\375\372vv\357\277K\347\326\356\343\354\332\265\255<\373\315\232/\302\302\006=\361\304\377\214\036\335?,tPj\352vy\266\255+\205\310\327\356*\353x=\267\373U\012q\226z\211\335d\246\256R\245\212V\177P\301{>\272G\312\324\277q\343\006%\373''''E\016\034\370\316\264i\243g\314\030#\225,)\177\362\344\021C\207\364p\337\203\375\372uv\367\357\322\245\265{\017\256[ -\346\233o\276\220\3127o\201P\271\005R\266\313\263\346-p\342\304\256\362=~\337\335#\224\367\365\370C\335^\263\277D\341\345\313gE\355\\\223\222\262-v\327\267;v|-\223\274d\216\255[W\230\375en\227W\212M\233\376\265`\301\007\347\316\355\037=\252\277\271\207\036=\332\371\342x\374jn\347o\247^\305\250\324\343\256\305a\256\323\012\037\026m\264_i\273\236\362x\350Z\207\206\016\374%\353\320\333\235\336\264\345\037]\373\315\027\213\026}\370\341\207\343\266l^f\366\227\320`\274\360_\265\177W\012q\315\233\307\267o[\331\266m3)\301U+\347d\376\264w\305\212\331\257\275\366\322\227_\316\224\245Q\243\227\322\322\242\244\317\367\337/\2369sl\311\343\351\324\261\345\341\303[\245!\301\245\353;m\206\007\367\0369\262\357\237\377\374\260\254\245\335\371\355V\011\3736\312!ee\035\314\316N\222\303\373\371\354>\211#K\226|\262}\373\252\326\255\232\310\204\336\252U\343\223\031\273\312:^w\177\177K!^\342\217K\336\204[\274G\274\354\1771;\351\361\307\377\273d\377\270\270o\273u{+r\313rY\352\325{V\326[\266,o\330\360\005\367\376\367\355\333Xx\013\214(\274\005\202\335\267\200\355X\326\005\317[`\240\334\002\362zPx\013\274i\336\002\345s\374\376p\217P\336\236nO\335^\263\177|\334w\377\363?\177\222W\2071c\006\313<\337\274\371\337CF\367o\335\272iX\350\300W^\371\333/\277\034\222>\222\271])\344\207\245\215\033\327\0376\264\207\374\2036(\250\227\324p\367no\225\373\361\370[\335*\376\177d\366\354\335''\373\367\365 \275\347\252T\207y\031\2169\034\307\214\365qW\243pK\321v\317\206\261l\215\\\336\263g\273\240a=\207\017\357\335\257\337\333\275zu\350\333\247\223\244\220\267\3326KJ\332d\366\0372\244\333\321\243\333\213\355?#cW\377\376\235eK\312\221\255\247N\305\311\226Y\263\336\265\331\216\246\035\3379th\367\210\210\305_\177=w\330\260\036\351\222B\034\307d\226\354\324\251\245\364\227o\321\257\357\333\262\226\011\267C\207\0262\207\232;\214\215\375v\334\270\241\346\376\333\266mj\036\263t;~|\247\373\370\337~\273\345\312\225\263\207\007\367\232={\362\206\015\213\244\350w\354XU\326\361\026\353o\321\024\342\344?\332(\273\233\276G\312\324_*\377O\177\252\021\031\271\254X\377\230\230o\346\315\233&\005\374\3157_\374\337\377=\265j\325\354\257\276\372\350\323O''fg''\026\336\002\273\326\032\267\200\253\177\3336M\315\257\362\270\005\\\333\337~\373\315+\267\300\372\177\026\336\002\345z\374~r\217P\336n\267\247n\257\327\377\314\231\335owjy\350P\304\271s\011M\233\276\234\223\223\234\223sX\226f\315^\261\333\216.^\374\321\2301\203z\364h\267i\323\022\371\207\250\364\377\351\247=\207\223\267\244\246nKJ\332l\313O-\367\343\361\253\272\365\352\377\324\355\326\275\273\217R\210\3549(8\330\327\203\364\236Q\251r\001\216\312\272\300q\254\260m<\364h\034+\261\305\265\336\273g\335\214\031a\237|2^\326;w\256Z\373\315\347\213\026\315<\177>\241E\213\277\347\346$K\207!\203\273\035M\335Vl\377\031''\242\373\367{\333\3348p@\027\011\034\301A\275\036|\360\376\365\353\277\034:\244\333\272\357\026,_\376\331\260\241\335\323\323\243N\244Gm\337\2762>\356[\371F{\367\206\273\326{\326M\237\036"\273\335\271c\225t\220=\304\356\372\346\305\027\237\015\015\351\037\032:\340/\177yD\326\322\256[\367q\363Y\331\303\264i\243j\326\374\317\317?\2376jT\337\324\224\255\262\321\010+73^\317\376\326M!N\376\323\3212\272\225{\304\373\376]:\267\332\277\177c\2336Ml\266T\317\376\341\353\026J\354X\276\354\263U+g?\367\\\235\325_\317\221\245u\353&G\016o1\367\037\033\273\366\252[\300h\270n\201\264\235\322\301\270\005F\272o\001\363~t\205\225\362>~\377\271G(o\323\355\251\333k\366\277|)q\322\244\240\277\376\265\356\304\211A\337\256\375\342\205\027\236\2310a\250\261\014\373\357\377~X:\330m\251\362J\321\243\373[\233~X\322\260\341\013}zw\2343gr\203\006\177\235?\177\372\013/\374o\271\037\217\277\325\355\215\277AVVV\325\252U}\361v\210\354S\366|\341\302\005_\017\322{\306\273v\022<\217\026^\025\263\3558Z`\254\215+d\264\355\356-\251\356\3762\257-X0==}\347\206\015_N\177o\324\332\265\256\024"O}\362\361\270\365\341\013\245\277\353\275\220\324\255\305\366\237\221\021\335\277\377\333\236\373_\367\335\374O?\235\360\343\311\230\241C\273\315\235;e\307\366\025\303\206uO;\276#a\337\372Y\263&M\236<|\374\370!\013\346O\237o,\362\265]\273\266\231=\373\335\375\011\353\345kcw\255\0317n\260\271+cnu}\257~\375:\235H\227)\370\350\326\310e\341\341\013\273ti%\317\206\205\015H5\016\306\370\367\342\315\214\327\263\277\245S\210\363:3u)\237\3163g\352@\232\243\275w+\367\210\227\375\267o[>h\320;\262e\315\352\271c\306\014t\367\377\346\233y!\243\373M\235:\362\275i#%L<\366\330\237\247\031\215\227_\376\353\200\001\235e~7\202\270\334\002C\314\376E\011\333u\013H\012\221-[\267.\013_\267\240K\3477ecX\350\000#\210\247\272\272\225\353\361\373\333=By;oK\335^\257\277\315\226r\350`D\307\216-\366\356\371Nr\360+\257<\377\355\267_|\273\366sY$I\233\375\263\1779\320\243\307[\2336-Y\270\340}s''\3620\361P\204Ti\271\037\217\277\325\255W\337`\306\214\031\215\0325.\367\024"\373\234>\375}_\217\260L\214\274,g?\265\300X\273\226\302k\343\261\366x\350\356&\215/\276\230\366\355\267\237\313\366=\273\277\233>}\364\332o\346-Z4C\346\304\267\3326\333\265k\265l\0372\244\353\261\243[\213\355?\343D\224\361^\210k\207+V\374\343\263\317&v\354\320\302nO9s:V\342\260\374[0.\356\233\371\363\337;sz\227\331?5%\362\265\327^\334\270\361K\363\000V\255\234%\317\272\217''j\347\312z\365\236\011\015\225\177\377\3657\336\013\351o\274\027\362\330\221#\233\335\207mL\301\251\256)85\362\347\263\273\215)85\347\362\241_~\331_\246\361z\236\037\253\247\020\347u~\210^J\365\006\306\017\313o\302\255\334#\336\364\337\263\373\333\246M\033dg\0370\373\217\032\325GB\266\273\303\207\037\216\0319\242\267\374\313R\302\307\343\217\377\371\375\367G\177\360\376h\231\326\217\035\333f\366\337i\336\002!\327\275\005\244[\227.\306-\340\012\342\221g\345\0260\362\372e\271\005\262\256q\013\224\365\370\375\363\036\241\274}]\2677\354\337\247w\207s?\357=zt\353\253\257\326\213\211\371zW\314\327\262\226Z5\373K\301\033\357\205,\226\351}\330\320\356\362jr`\377\206Z\265\036\222\372\364\321\361\370O\335z\365\015rrr\352<\365\324\224)S\3131\202\310\336d\237\277d_\364\365\010\313\304\250\324\024\207=E\326\256\213\341n8R\314\305l\027n\261\027n4\033\237\317\233\362V\333\246\241\241\375$\303N\235:|\315\2329\222B\306\204\015X\267\356\013\263\377\340A\357\034=\032Yl\377''N\354\350\337\377m\367\376\347\272\222G\343_\262\022rr\016\015\034\3209<|\376\264i#d\272\264\331\016\273\217\347\362\245C\275{\267\317\313K\222\366\362e\237\316\237?\315}<\247O\307\034:\264\321\354\366\346\233\257\231\215\324\224-\331\331\373\335\307\337\271sKY\017\036\374\216\304\235\340\340\036\322\315n;\262i\323W\023\306\017)\323x=\317O\000\244\020gY\376\372\265\347\022\030s\264\367n\345\036)\275\277\335~d\366\354I\215\032\275x\356\334\036w7)\316\267\337~#$\244\237\334\021\305\3727o\376\212\331m\333\266\177e\376\024gn<}\312u\013\230}\\\267\200\2611%e\363\305\354\003\356\303\220[@\032\256[\240c\213\340\240\036\346\235"\267\300\370\361\203o\345\370\375\374\036\321\274\274}W\267^\366\357\320\241\371\353\257\277\362\317/?\220\265\273\277\253mt;\367\363\236\036=\332\376\020\261h\301\002\371We\312/\277$t\352\364F\257^\355\006\015\352\222\233\233\350\213\343\361\237\272\365\366\033dddT\255Zu\311\322\245\345\022AV\254\\y\337}\367\035;\236\346\323\261\335\004\243R\345\365\376\210\303\356Z\273\033\205k\243Q\274C\321\303o\327\316\215\335\365\2654~<\2713\342\373/\027\375\363\375E\213>\360\354\337\275{\233cG\267x~\371\332o\346\274\370\3423\013\346O\363\334\177T\324\362\245K>|\365\325\027\242\243V\230\373_\276\354\3439s&\025;\236S?F=\363\314\223O>\371\337\273w\257\271\346\361\324\257\377\\\261\343\377\345\227}\177\377\373\337>\372(L\332\203\007u\331\237\260N\032\377\374\347\373]\273\266\352\325\363-9\3542\215\327\363x\224\317\260\345\245\2543u\300\314\321\336\273\225{\244\364\376[#\227\004\005u\317\313=T\254\277\335\226<&\254\377\366m\377r\367\377\344\223\261\365\352\375oXX\377\322\367/\267@\261\343\311\276\321-p+\307\357\377\367\210\316\345\355\273\272\365\246\277\335~\270K\347\226\307\217GJ\273E\213\206\262\316\317K\354\330\261\371\323O?nvH;\276\265G\367\266\253\277\2365\177\376\324M?,z\355\265z{v\177#;\374\342\363)\313\376\365q\271\037\217_\325m\031\276Az\272\353\017\230H\200\270\305\010"QF\366\263}\373\016\337\215\352\246\311\201\025\270\256\204kq8\314\213T\264\266_\331^rc\311\376\2719\007\363\363\016y\366\277t1A\346S\317\376\271\271\007m\371\211\327\334\177N\316\201\322\367oL\251{K9\236#G"n\345\370\313\324\337\037f\330\362\342\375L\035Hs\264\367\312\361\036\271\351\376\027/&\310\335t\303\376G\016G\334\236\343\261\320=\242my\373C\335\226\322???1\353\302n\363)[~\222\303\236\254O\335\226\355\033DGG\337w\337}\267\362\243\031\371\332\252U\253\246\036=\346\223\321\3342\343\023L\311\016\207T@\262Q\007F\243\344\272\260\317a\217\266\326\375\375d\206-/\336\314\324\0016G{\217{\304\352\367\210\236\345M\335\372m\335\226\371\033ddd\324y\352\251F\215\032\227\365\267f\244\277|\225|\255\037\376 \306\315\310\313I\306b^\006\311\244\205\017\335\015w\007\307\325\017u\356\357?3ly)}\246\016\2749\332{\334#\001p\217hX\336\324\255\337\326\355\315|\203\234\234\234\351\323\337\2272\355\326\275\2737YD\372HO\351/_\345o\037G-\306\370\331a\242q%\022\213\032If\243\330\366b\317j\336\337\257f\330\362r\275\231: \347h\357q\217\004\306=\242[yS\267~[\2677\377\015\262\262\262F\216\034\371\300\003\017<\364\320C\003\007\015\372z\365\352\235;\243\216\035O\313\315\313\227\265\264e\313\240\301\203\345Y\351\023<|\270\364/\307\343\366\021#/''z\2778\034\207\350_\340\1773ly)9S\007\352\034\355=\356\221\200\271G\264*o\352\326o\353\266\034\276\301\236={\306\216\035\353\372iK\235:\367\335w\337\235w\336)ki\313\226\220\320P\377\371?b\274q\307\035w8\354\007\013\\\327\343\220\303Q\330p/\356-%\237\322\271\277\234\261\212\025+\252\276t\276\3429S\007\360\034\355=\356\221@\272G\364)o\352\326o\353\326\357\342\271Z\325\253W?\221\276\251\300q\300\\\234\005\007\215\306Ac9pu\373`Q\207\203\232\367\3178\261\371\336{\253\252\276t>d\316\324+V\256\014\3409\332{\334#\001v\217hR\336\324\255\337\326-)\344*\265k\327\216\211^\342\276\022\005\216\375\036\213\\\030\367F\327\332y\245\203\326\375\345\214=\371\344\237U_:\337\212\214\214\2249Z\326\252\017D=\356\221\300\273G:w\356\034\360\345M\335\372m\335\222B\256\022\022\022\022\024\324\305Y \027 \301}\315\234\262\024x^\302b\017\0234\357?<\370\235\321\243\272\253\276t>7v\354X\325\207\340\027\270G\002\357\036\361\303\317\254\224;\352\326o\3536\360\213\257Lbbbj\324x ?o\267\323u%\344\222$\030\227\244p\361|X\374)]\373\313\271\252Y\363\217Q;\027\251\276t>\247\303L\355\015\356\221\300\273Gt\250m\352\326o\3536\360\213\257\254Z\264h1m\352\340\002\307>\247c\237k]\340j\030\327\251h\213\261\261\240\360\331\004c\331\247m\1779W-\232\327W}\321n\007\035fj/q\217\004\330=\242ImS\267\376Y\267Z\024_\231$%%\375\372\327w\357\330\266\300u\315\\\227d\257,Nc\355j\270\267\\yj\237\331A\303\376?D\314\251V\255\312\241\203_\253\276h\267\203&3\2657\270G\312z\217$\036Z\255\372\242\225F\223\332\246n\375sn\327\242\370\312j\367\356\335r[F|?\273\300\261\307Y`^\025\327\342z\350(j\024m1\333fC\253\376\333\267\315\227\263\264\356\273OT_\256\333D\223\231\332K\334#\201t\217\350S\333\324\255\037\326\255.\305WV\353\326\255\373}\265*\323\246\016\264\345\355*p\354v\026\3546\327N\307\356\253\036\032[\256j\024\353\020\210\375m\371\273\344\314T\372\365\335\273\343\027\253\276P\267\217>3\265\227\270G\002\346\036\321\252\266\251[\177\253[\215\212\257\254\222\222\222\2327\177\351\241\032\177\010\016z{W\364\227\031\351\341\005\2168\343R\305\233\353\002i\270\332W7\012\012\237uz\266\255\337\277\300\036w"=<&japP\247\0325\376\320\242\371KI\211+U_\242\333J\253\231\332K\334#\201q\217\350V\333\324\255_\325\255^\305w\023bbbBFw}\362\311Z\325\357\253zG\305\212\025t%c\2273P\373\311Zr6b\242\027\252\276,\012T\320l\246\366\036\367\210\311\272\367H\005-k\233\2725)\257[\035\213\317\242\370{\025jU\320r\246\206\016\250m\2654\237\333)>k\370\374\363\317e\246HKKS} \372b\246F\240\242\266\325\322\374\374k=x\253\310\311\311\371\267\177\3737\251\324\246M\233\252>\026}i>S \200Q\333ji~\376\265\036\274U\264o\337\336\374\001^\225*U\302\303\303U\037\216\2464\237)\020\300\250m\2654?\377Z\017\336\022\022\023\023\177\365\253_\231)\344\256\273\356z\360\301\007\363\362\362T\037\224\2164\237)\020\300\250m\2654?\377Z\017\336\022j\325\252\345\371y\346\373\356\273o\302\204\011\252\017JG\232\317\024\010`\324\266Z\232\237\177\255\007\357\377\314\277\364W\314o\177\373\333\314\314L\325\207\246\035\315g\012\0040j[-\315\317\277\326\203\367\177\023''N\224\002}\354\261\307\0324h \215\007\036x@\326\217>\372\350g\237}\246\372\320\264\243\371L\201\000Fm\253\245\371\371\327z\360\376/""B\012\364\337\377\375\337\315\017\250\312\3727\277\371\2154\326\255[\247\372\320\264\243\371L\201\000Fm\253\245\371\371\327z\360\226\020\023\023\223\225\225\345,\252Tio\336\274Y\3611iI\363\231\002\001\214\332VK\363\363\257\365\340\255E\363JU\216\363\217@Em\253\245\371\371\327z\360\326\242y\245*\307\371G\240\242\266\325\322\374\374k=xk\321\274R\225\343\374#PQ\333ji~\376\265\036\274\265h^\251\312q\376\021\250\250m\2654?\377Z\017\336Z4\257T\3458\377\010T\324\266Z\232\237\177\255\007o-\277\372\325\257T\037\202\3264\237)\020\300\250m\2654?\377Z\017\336Z4\257T\3458\377\010T\324\266Z\232\237\177\255\007o-\232W\252r\234\177\004*j[-\315\317\277\326\203\267\026\315+U9\316?\002\025\265\255\226\346\347_\353\301[\213\346\225\252\034\347\037\201\212\332VK\363\363\257\365\340\255E\363JU\216\363\217@Em\253\245\371\371\327z\360\326\242y\245*\307\371G\240\242\266\325\322\374\374k=xk\321\274R\225\343\374#PQ\333ji~\376\265\036\274\265h^\251\312\335\372\371OII\331\261c\307\256]\273\342\342\342\342\015\261\261\261QQQ\311\311\311\305z\312Saaa\267\370\355\000/1\267\250\245\371\371\327z\360\326\242y\245*W\372\371\317\316\316n\332\264i\227.]z\365\352\325\247O\237\327_\177\275M\2336\275{\367\356\326\255[\353\326\255\327\254Y#}\206\017\037>k\326\254\325W\2333gN\277~\375\314\235l\331\262e\344\310\221\262\223\367\336{O\032\223&Mj\324\250Qppptt\364\355\030!t\305\334\242\226\346\347_\353\301[\213\346\225\252\234\367\347\277\240\240\340\371\347\237?\177\376|\261\355\022,\266n\335*\311c\375\372\365\0337n\224\265\264\267m\3336l\3300y6333>>~\377\376\375\222Z$\216$&&N\2312E\202\310\201\003\007\366\354\331s\356\334\271r\036\017P\204\271E-\315\317\277\326\203\267\026\315+U9\357\317\377\204\011\023\376\360\207?dee%$$xn\227\024\022\023\023\023\025\025%\251b\337\276}\262\226\207\261\261\261\301\301\301N\343\3475K\226,\0313f\314\360\341\303G\027\221\366\330\261c\027/^\234\226\226V\376C\002\014\314-ji~\376\265\036\274\265h^\251\312yy\376\247M\233\326\247O\237\026-Z\2349s\346\205\027^\210\210\210p?%)$55u\351\322\245\243F\215\012\013\013\223\220\261|\371\362\343\307\217\233)\304\324\256]\273\215\036\326\257_\337\276}\373\362\037\014\340\201\271E-\315\317\277\326\203\267\026\315+U\271\033\236\177\311\023\315\2325\223HQPP )D\266dee\325\257__\222\204\331\301L!\203\007\017\316\314\314\224\207\027.\\\030:th\311\024\362\256\207I\223&u\354\330\321gc\002\\\230[\324\322\374\374k=xk\321\274R\225+\375\374\247\245\245=\362\310#k\327\2565\037\232)D\234;w\256n\335\272\031\031\031\316\242\024\022\024\024TJ\012\0310`\300\204\011\023\334)d\374\370\361\222Z|5$\300\300\334\242\226\346\347_\353\301[\213\346\225\252\334\015\317\177~~\276\273\355N!\342\342\305\213f\303L!\363\346\315\0337n\234\2310\346\317\237\357\231B\322\323\323W\255Z\025\032\032\232\233\233\333\263gOy(\033\345\331\244\244\244r\036\014\340\201\271E-\315\317\277\326\203\267\026\315+U\2712\235\377\327_\177\275\344F\311\023)))\3056J\302\0301b\204\331\356\320\241Crr\262\371#\230\263g\317\206\207\207\317\235;7""\342\325W_=y\362\344\315\0368p\003\314-ji~\376\265\036\274\265h^\251\312\225\351\374?\367\334s%7\016\0312\244\330o\315H\376\250W\257\336\346\315\233\245\235\221\221\361\311''\237H\343\203\017>\350\323\247\317\310\221#\207\015\033\326\271s\347\313\227/\237:u\312f\263\335\322\321\003\327\307\334\242\226\346\347_\353\301[\213\346\225\252\034\347\037\201\212\332VK\363\363\257\365\340\255E\363JU\216\363\217@Em\253\245\371\371\327z\360\326\242y\245*\307\371G\240\242\266\325\322\374\374k=xk\321\274R\225\343\374#PQ\333ji~\376\265\036\274\265h^\251\312q\376\021\250\250m\2654?\377Z\017\336Z4\257T\3458\377\010T\324\266Z\232\237\177\255\007o-\232W\252r\234\177\004*j[-\315\317\277\326\203\267\026\315+U9\316?\002\025\265\255\226\346\347_\353\301[\213\346\225\252\034\347\037\201\212\332VK\363\363\257\365\340\255E\363JU\216\363\217@Em\253\245\371\371\327z\360\326\242y\245*\307\371G\240\242\266\325\322\374\374k=xk\321\274R\225\343\374#PQ\333ji~\376\265\036\274\265h^\251J\330l\266E\213\026eee9\213\316\377\236={v\354\330\241\372\270\200\362\304\334\242\226\346\347_\353\301[\213\346\225\252\304\370\361\343\345\264W\254X\261V\255Z\322\250\\\271r\005\203\371\277\340\002\201\201\271E-\315\317\277\326\203\267\026\315+U\211\211\023''V(\341\231g\236\011\017\017W}h@\271anQK\363\363\257\365\340\255E\363JU\342\354\331\263w\336y\247g\004i\330\260\341=\367\334\223\231\231\251\372\320\200r\303\334\242\226\346\347_\353\301[\213\346\225\252\312\220!C*V\254hF\220J\225*I\012\2310a\202\352\203\002\312\023s\213Z\232\237\177\255\007o-\232W\252*yyyU\252T1SH\373\366\355\037~\370\341\334\334\\\325\007\005\224''\346\026\2654?\377Z\017\336Z4\257T\205\326\254Yc\376\\\246F\215\032|"\004\201\207\271E-\315\317\277\326\203\267\026\315+U\255g\237}V\316\177\363\346\315U\037\010P\376\230[\324\322\374\374k=xk\321\274R\325JKK\223\363/k\325\007\002\224?\346\026\2654?\377Z\017\336Z4\257T\3458\377\010T\324\266Z\232\237\177\255\007o-zVjtt\364\350\321\243k\327\256}\337}\367\335q\307\035%\377z\207&d\354r\006\344<\310\331\220s\242\372\262 \240T\320rn\361\037\232\237\177\255\007o-\272UjRRR\213\026-\036~\370\341\341\303\207\357\334\031u<-=/\337\226o\223\305n,\356\3065\037\226\334n\355\376y\371\371r\006\344<\014\013\012\222s\322\274y\363\304\304D\325\227\010\001B\267\271\305\337h~\376\265\036\274\265hU\251\273w\357\256T\251\322\344\311\223/\347\344H\3660^\214]k\233\315\014"\327Xlvw;\300\373\3139\2312eJ\265j\325\326\255[\247\372B!\020h5\267\370!\315\317\277\326\203\267\026}*U^\\e\260\221\221\221\306+q\276\361\016\210\353\345\270\250m\254\355\266\374\253\267x.:\364\337\260q\203\234%\211k\252/\027,O\237\271\305?i~\376\265\036\274\265hR\251III\277\377\375\3577n\\\237o\313\263\331\362\362m\271\262\230\215b\017]\035\354yf7wC\253\376\221\221[~\375\353_\363\243\031\334"M\346\026\277\245\371\371\327z\360\326\242I\245\266h\321b\362\344I\306K\257\274\356\346\270\032\366\334\242\027\343\302v\321\226\034s{a7-\373O\2312\271\331\353MU_4X\233&s\213\337\322\374\374k=xk\321\241Rcbb\036z\350\241\234\334\213\362\372j\223\305\365\352+\353\234\374\242\266\271\330\314\265\335\335\310\325\266\377\345\234\354\2325\037\342\267fp+t\230[\374\231\346\347_\353\301[\213\016\225\032\022\022\022\034\034l\263]6^\211/\313R\357\357\215\275\374]V\263\277\353\265\271\350\313\2574\354\306F\263\203=\307s\377\001\320?(h\310\350\321\243U_:X\230\016s\213?\323\374\374k=xk\321\241Rk\327\256\275cGd\276\355\222\361\212{\351\305\227\033\376\350t\036w8\017\333\234\007\363\234{\363\234\261\331\366\031+\177\330\220q!&\337\031\235\343\214\311qn\273\344\334\230\353\374p[B\367\036=\215\227\347\313\356/\367l\233\017\257\264m\205O\005@\377\235;\267>\371\344\023\252/\035,L\207\271\305\237i~\376\265\036\274\265\350P\251\325\253W?~\374\210\315~\311\\d\310\331N\347\305\002\347\005\273\363\347|\347%\247s\310\250\260\012\025\177\363l\303\346\0316gz\2363=\327y,\307y\304\356\\\266s\257t\266\271^\241/\232_\353j\330\214\375\330.\231\215|\367\303\242\375\007F\377\264\364\224{\357\275W\365\245\203\205\3510\267\3703\315\317\277\326\203\267\026\035*\365\216;\356\310\313\317\266\271^\200/\312\353\253\014\371\222\303\231\347p=e/p\255\277\371n\375\3755\037\035=q\272\335\351\374\305\356\274`s\376ls\236w:7\356\332\347J!v\343%\334\365B~\321x9/\334O\341C\317F\321\366\000\350\237\237\237]\261bE\265\027\016\226\246\303\334\342\3174?\377Z\017\336Zt\250T\343\375\214_lv\011"\331\262\226\207\027\355\316\263\227\235\371\216\302\016\347\317\237\377\340\343Y\023\336\3738\375\344)yh+p\346\033\351dG\334\336\302\2575\276\260p''%\033\256\016W\366\0370\375u\250\015\370\016\365\243\226\346\347_\353\301[\213\016\225j\274\237!\257\254Y\346\332\225B\034\316\237.9Og;mNg~^\336\237k\325\252P\341\216\012\025*\275\371V''\317/\214\215\337}\345k\013_\252\335\373\361h\330=\267g\005L\177\035j\003\276\363\253_\375J\365!hM\363\373W\353\301[\213\016\225j$\211,\343\225U^b\263\314\237\310\234\275\354<\371\213\363L\2563\366@\352\275\367\336{\307\235w\377\277{\252\266mwU\012\331\025\027/\235\355\256\027\351,\273=\313s''v{aC\326f\007\217\247\002\244\277\016\265\001\0379w\356\\\345\312\225U\037\205\3264\277\177\265\036\274\265\350P\251\306OU.\270^h\355\027\314\027\327\313\005\316\237s\\\357\205\374\224\353\214\330\225\370\330\023OU\255\366\373{*W\231\265pY\256\323\231\235\347\274\224\347\372\302mQ\273\012\277\326\365\345\205k\343\345\374\312\026\343\345\374\202\347\376\003\246\277\016\265\001\037IMM\255Q\243\206\352\243\320\232\346\367\257\326\203\267\026\035*\325H\022\347\355\256\027\335\363\262\230C\226 r\301\346<\227\357<\371\213mG\302\261''\352\324}\351\225\327\316\3449O\3478\317\3448\317\3469%\207l\2131R\210\335|\361v-\306+\267\261+{\341\332\346\271\321\330\177\300\364\327\2416\340#qqqu\352\324Q}\024Z\323\374\376\325z\360\326\242C\245\032I\342\274\361\272+\257\262\347^\250\367\302\276C\207c\023\022\243\366$n\217O\334\276;y\307\276\224M1\007w&\034\215\214O\336\032\237\264}wR\324\336\344\204\303i\237\316\376\374\315V\255\314\257\262\231k\333y\317\207F\273\350a\321\376\003\246\277\016\265\001\037Y\264hQ\353\326\255U\037\205\3264\277\177\265\036\274\265\350P\251\306g;\344\305\365\234\361\022+\257\257\347\372\366\355\351\315\037N}\343\215\226f\177{\321b\363\330\217g\243\330\376\003\243\277\016\265\001\037\351\325\253\327\314\2313U\037\205\3264\277\177\265\036\274\265\350P\251F\012\371\331f?kw-?\233m\233\315\3256\326\346\306\302-\256\206\261\205\376:\324\006|\344\261\307\036\213\215\215U}\024Z\323\374\376\325z\360\326\242C\245\032?\221\3114^b\345\0257\323f+l\273\267x>4^\2363\351/\213\016\265\001_\330\277\177\377\375\367\337o\263\331T\037\210\3264\277\177\265\036\274\265\350P\251\306{!\231\327\\l\356\206\355\332\035t\356\257Cm\300\027:t\3500u\352T\325G\241;\315\357_\255\007o-:T\252\221B~\262\331~\222\265\253a7\033\231\366\302\206\273\235yU7\355\373\353P\033(w\307\216\035\373\335\357~w\372\364i\325\007\242;\315\357_\255\007o-:T\252\221B\316\030\257\254g\212^\206\317\030/\267\356\215g\256\331A\363\376:\324\006\312WVV\326\335w\337\375\325W_\251>\020h1\267\227B\353\301[\213\016\225Z\224B\314\345\264\261x><Sb9M\177Y\256Y\033\361\361\361\375\372\365[\273v\355\355\277\216\360s\022A\236x\342\211\267\337~[\365\201\300E\207\271\275\024Z\017\336Zt\250T#\205\234*z}u7J.\256\247\034\216b\335\364\355_\2546\016\035:T\313\365\037\356\024\332\274y\263\242\353\011\177t\354\330\261\2325k\366\355\333\267\240\240@\365\261\300E\207\271\275\024Z\017\336Zt\250T#\205\374(\257\257\016\307)\207\353U\366Gs\221\207\305\033\306\263E}t\357\357\256\215\234\234\234\366\355\333\377\352W\2772\363\307\243\217>\372\357\377\376\357\362\017_\265\227\025~b\377\376\375R\036\277\373\335\357\370A\214_\321an/\205\326\203\267\026\035*\325H!''\215WVY\237t\270^\206\177toqxl77\272\033\232\3677k\343\363\317?\377\267\177\3737\317?\346\326\240A\203v\355\332\251\276\252P\343\334\271s\251\251\251qqq\2229z\367\356\375\370\343\217\337\177\377\375\323\246M\343\343\250\376F\207\271\275\024Z\017\336Zt\250T3\2058\034\346K\354\311\302\327\332\022\017\035W\266g\320_\036\312y\033;v\2547\177d\326\344~\263\004\201J.\361o~\363\233\312\225+\327\251S\247U\253V3f\314\330\265k\027\177\027\304?U\320`n/\205\326\203\267\026\035*U\306\350p\310\013mF\341\332\365\242[\270\024\333\342(Z\323_\026\2636\322\322\322\2325kV\245J\225\273\356\272\313|)z\340\201\007x/\304B\262\263\263\2336m\332\245K\227^\275z\365\351\323\347\365\327_o\323\246M\357\336\275\273u\353\326\272u\3535k\326H\237\341\303\207\317\2325k\365\325\346\314\231\323\257_?s''[\266l\0319r\244\354\344\275\367\336\223\306\244I\223\0325j\024\034\034\034\035\035\255tp\270.\035\346\366Rh=xk\321\241R])\304~\302n,\322\220\327Z\367\272p\243\303|\001\226F\321C\257\373\317\2349n\343\306\245\362TZ\332\256\370\370\015\011\373"\016\034\330,\353\270\270\365?\237=\340\356\337\263g\207\334\334c\346\376;v|\363z\373\177\372\351''\363\363\323\212\035\317\307\037O:\234\274\315\335?<\374\253\017?\034_^\307_J\177\317\332\010\017\017\177\360\301\007\357\275\367^3\210\310?\210\371\\\210\025\025\024\024<\377\374\363\347\317\237/\266]\202\305\326\255[%y\254_\277~\343\306\215\262\226\366\266m\333\206\015\033&\317fff\306\307\307\357\337\277_R\213\304\221\304\304\304)S\246H\0209p\340\300\236={\316\235;\247b(\270\001\035\346\366Rh=xk\321\241R+\270~"\223.\257\270\216\302\327\335t\327\303\302\365\011c{a\273\250[\272\367\375\363\362\216u}\247\355\326\255\253\302\302\006O\2348\374\363\317\337\0376\254\327\202\0053:vh\271a\303\342\350\250\265\203\006u\013\013\035T\267\356\343c\306\014\011\016\3563n\334\260\372\365\377:aB\320\330\261C%[\310\336\216\037\217\331\261c\315\356\370\365{\367~/O\355\335\2731>.|\347\316o\216\037\2131\017\343\2473\373\376\376\367zg\316\354\013\015\031\024\0222\260S\247VM\233\276\022\0322p\300\200\256\267~\374\245\364/V\033yyy\023''N\374\355o\177\373\350\243\217\312S111\252.(n\332\204\011\023\376\360\207?H\202LHH\360\334.)D.hTT\224\244\212}\373\366\311Z\036\306\306\306\006\007\007\313\263)))K\226,\0313f\314\360\341\303G\027\221\366\330\261c\027/^\234\226\226\246h4(\215\016s{)\264\036\274\265\350P\251\306{!i\016G\232]\326F\243p\355\360h\027[\227\245\277\335v\\\032aa\203\276\373\356\313\365\341\213^x\341\231o\327.\370\350\243\361\2337/\223g\337}w\304\270qC\237~\372\211\361\343\207\005\007\365\356\330\361\215\314\237\366}\263\346\213\345\313g\345\346\246\312\027\316\235;m\360\240ns\346L\225\245N\235\307\314F\277\276\235?\373l\262\373\273\244\247\305\344\347\037\335\264iY\320\260^\262\207&M\032\214\036\335\177\331\262\317\312\345\370\257\327\377\232\265q\366\354Y\371\2072\277\246kE\323\246M\353\323\247O\213\026-\316\2349\363\302\013/DDD\270\237\222\024\222\232\232\272t\351\322Q\243F\205\205\205I\310X\276|\371\361\343\307\315\024bj\327\256\335F\017R\006\355\333\267W1\016xE\207\271\275\024Z\017\336Zt\250T#\205\034w-\016s\235V\370\260h\243\375J\333\365\224\307\303\033\364\337\266me\307\016ot\355\332V\332a\241\003\277\373n\301\272\357\0266jT_\326\222B\266H\012\261\037\357\324\251\345\017?,m\332\364\345M?,m\335\272\311\217''c\203\202zId9\365c\234\271\377/\276x\177\303\372E\346\016[\266|\315\334\377\232\325\237\177\361\305t\371\326q\261\337\316\236=e\331\277>;\367s\302\2325\237\257\017\377\347\324\251\243\006\364\357"\215\265\337|\221xh\323\255\034\177\351\375u\250\015MH\236h\326\254\231D\212\202\202\002I!N\343/\214\325\257__\222\204\331\301L!\203\007\017\316\314\314\224\207\027.\\\030:th\311\024\362\256\207I\223&u\354\330Q\311p\340\015\315\357_\255\007o-:T\252\361\351T\363%\366\230\303q\314X\037w5\012\267\024m\367l\224\245\277d\013i\207\205\015\2344)x\350\320\356o\274\361\352\200\001]\006\017\356\272e\213\244\220cqq\3376i\322\340\245\227\236\223\215\253V\316\226\376!!\375_{\355\245\234\234\303\346\227\177\361\305{\255Z5\016\012\352)\313\237\376T\303\325\030\326\263E\213\277\273R\210\375Xr\362\346\335\273\327\311>\263\262\016J\354X\265j\366:\311:\353\026\256Y3OB\311\261\243\333o\375\370\257\327_\207\332\320AZZ\332#\217<\342\376s\267f\012q\032\277s[\267n\335\214\214\014gQ\012\011\012\012*%\205\014\0300`\302\204\011\356\0242~\374xI-\267}4\360\226\346\367\257\326\203\267\026\035*\325H!\362\342zT\326\005\216c\205m\343\241G\343X\211-\336\366o\333\246\2514\202\206\365\210\215];bDo\311"\357\276\033\374\321Gc\267l\371W|\334\267-[\276v\350P\304\353\257\277r\346t\334\302\205\037\364\356\325axp\257\257\277\236\363\374\363OK\377\002#\205lX\377\245\2717\327{!Fc\315\352y\262\335\375\035\333\266m*\353E\213>|\347\235\326\037\177<\376\343\217\307\205\206\364\0375\252o\271\034\377\365\372\353P\033\232\310\317\317w\267\335)D\\\274x\321l\230)d\336\274y\343\306\2153\023\306\374\371\363=SHzz\372\252U\253BCCsss{\366\354)\017e\243<\233\224\224t\033\307\2012\320\374\376\325z\360\326\242C\245\032?\221Iu8\216\026\276\342\232m\307\321\002cm\274\372\032m\273{Kj\231\372K\012\311\315I\352\326\255\315\241\203\021C\207t\223\376\222\025$\205DnY*\317\256Y=\267O\237\216\375\372u\012\013\035\320\245K\253\341\303{\215\036\325w\320\300.3g\216\311\313=,;\371\342\213iC\206t\2333g\362\3349\223\353\324yT\032\262\364\357\377\266\244\020\367\361\030A\347\350\262\177}\372\346\233\215\306\214\0318f\314 \327\016\303\006\224\313\361_\257\277\016\265\241\241\327_\177\275\344F\311\023)))\3056J\302\0301b\204\331\356\320\241Crr\262\371#\230\263g\317\206\207\207\317\235;7""\342\325W_=y\362\244\257\217\0317A\363\373W\353\301[\213\016\225j\274\027"\257\254\251\005\306\332\265\024\276\356z\254=\036\272\273y\323?//\371\311''\377\247w\357\366/\277\374\327\323\247b\2324\251?zt\337\267\33263\336\013YjvKJ\214X\276\354Si\264n\325x\315\232\271_\257\232\265z\365\034\367\376?\371d\374\354\331\357\356\333\273n\337\276u\365\353\377\237\254\245\375\351\247\343g\315\232\344>\236\266m\233~\371\345\007\262\023I''\377\374\347\014Y\246N\035\341J!\267|\374\245\364\327\24164\364\334s\317\225\3348d\310\220b\2775#\371\243^\275z\346\307\220322>\371\344\023i|\360\301\007}\372\364\0319r\344\260a\303:w\356|\371\362\345S\247N\361W\313\374\223\346\367\257\326\203\267\026\035*\325H!)\016{\212\254]/\264\356\206#\305\\\314v\341\026{\341F/\373\307\305\256i\320\340\377\242\242V\266z\263\221g\377\217>\034\263e\313\022\263\277\244\212\351\323G\311Sm\3324\216\216Z%\235e\271\346\376\0337~\251\344\361\244\246n\271\347\236\337~\366\331\304e\313>\371pfXrRDrr\304\372\360\005\241\241\375n\375\370K\351\257Cm\000\201J\363\373W\353\301[\213\016\225j\244\220\303\005\216#\016\273k\355n\024\256\215F\361\016e\351\237\233s\260w\357v\373\366~\353\356\337\245s\313\207\037\376\317cG\267,_\366q\307\216\315{to\333\271\363\033\301\301=\332\266i\022\024\324}\360\340.\322_\022\311\232\325\263\213\355\377\231g\236,\271\377\204}\337-[\366\2614\346\317\237\372\257\245\037I\343\302\371\335/\275\364\354\342\3053\312\345\370\257\327_\207\332\000\002\225\346\367\257\326\203\267\026\035*U\306X\340z\225u-\016\207\371\002\\\264\266_\331^r\343M\367w\330\223on\377I\211\033K\351\237\233s /\357\220\271\321fK\362\335\361\233\015\035j\003\010T\232\337\277Z\017\336Zt\250T\343\323\251\022\013\222\013\034\311\322(0\033%\327\205}\016{\264\265\356\257Cm\000\201J\363\373W\353\301[\213\016\225j\274\027\222d,\346Kl\222\303^\370\320\335pwp\\\375P\347\376:\324\006\020\2504\277\177\265\036\274\265\350P\251\306\347B\022\215W\331\304\242F\222\331(\266\275\330\263\232\367\327\2416\200@\245\371\375\253\365\340\255E\207J5\336\013I\364~q8\016\321\277\200\024\002X\231\346\367\257\326\203\267\026\035*\365\216;\356p\330\017\026\270^k\0179\034\205\015\367\342\336R\362)\235\373\313\031\253X\261\242\352K\007\340&\3510\267\227B\353\301[\213\016\225Z\275z\365\023\351\233\012\034\007\314\305Yp\320h\0344\226\003W\267\017\026u8\250y\377\214\023\233\357\275\267\252\352K\007\340&\3510\267\227B\353\301[\213\016\225Z\273v\355\230\350%\356W\331\002\307~\217E^t\335\033]k\347\225\016Z\367\2273\366\344\223\177V}\351\000\334$\035\346\366Rh=xk\321\241RCBB\202\202\2728\013\344\3055\301\375z\354\224\245\300\363\345\271\330\303\004\315\373\017\017~g\364\250\356\252/\035\200\233\244\303\334^\012\255\007o-:TjLLL\215\032\017\344\347\355v\272^e\345\3456\301x\271-\\<\037\026\177J\327\376r\256j\326\374c\324\316E\252/\035\200\233\244\303\334^\012\255\007o-\232Tj\213\026-\246M\035\\\340\330\347t\354s\255\013\\\015\3435\270h\213\261\261\240\360\331\004c\331\247m\1779W-\232\327W}\321\000\334<M\346\366\353\321z\360\326\242I\245&%%\375\372\327w\357\330\266\300\365z\354z\271\335+\213\323X\273\032\356-W\236\332gv\320\260\377\017\021s\252U\253\222xh\265\352\213\006\340\346i2\267_\217\326\203\267\026}*u\367\356\3352\330\210\357g\0278\3668\013\314W\\\327\342z\350(j\024m1\333fC\253\376\333\267\315\227\263\264\356\273OT_.\000\267D\237\271\375\232\264\036\274\265hU\251\353\326\255\373}\265*\323\246\016\264\345\355*p\354v\026\3546\327N\307\356\253\036\032[\256j\024\353\020\210\375m\371\273\344\314T\372\365\335\273\343\027\253\276P\000n\225Vs{IZ\017\336Zt\253\324\244\244\244\346\315_z\250\306\037\202\203\336\336\025\375eFzx\201#\316x\031\2167\327\005\322p\265\257n\024\024>\353\364l[\277\177\201=\356DzxL\324\302\340\240N5j\374\241E\363\227\222\022W\252\276D\000\312\201ns{1Z\017\336Z\364\254\324\230\230\230\220\321]\237|\262V\365\373\252\336Q\261b\005]\311\330\345\014\324~\262\226\234\215\230\350\205\252/\013\200rSA\313\271\335M\353\301[\213\346\225\252\334\330\261cU\037\002\200\000\244\371\334\256\365\340\255E\363JU\216\363\017\300\0274\237[\264\036\274\265h^\251\312q\376\001\370\202\346s\213\326\203\267\026\315+U9\316?\000_\320|n\321z\360\326\242y\245*\307\371\007\340\013\232\317-Z\017\336Z4\257T\3458\377\000|A\363\271E\353\301[\213\346\225\252\034\347\037\200/h>\267h=xk\321\274R\225\343\374\003\360\005\315\347\026\255\007o-\232W\252r\234\177\000\276\240\371\334\242\365\340\255E\363JU\216\363\017\300\0274\237[\264\036\274\265h^\251\312q\376\001\370\202\346s\213\326\203\267\026\315+U9\316?\000_\320|n\321z\360\326\242y\245*\307\371\007\340\013\232\317-Z\017\336Z4\257T\3458\377\000|A\363\271E\353\301[\213\346\225\252\034\347\037\200/h>\267h=xk\321\274R\225\343\374\003\360\005\315\347\026\255\007o-\232W\252r\234\177\000\276\240\371\334\242\365\340\255E\363JU\216\363\017\300\0274\237[\264\036\274\265h^\251\312q\376\001\370\202\346s\213\326\203\267\026\315+U9\316?\000_\320|n\321z\360\326\242y\245*\307\371\007\340\013\232\317-Z\017\336Z4\257T\3458\377\000|A\363\271E\353\301[\213\346\225\252\034\347\037\200/h>\267h=xk\321\274R\225\343\374\003\360\005\315\347\026\255\007o-\232W\252r\234\177\000\276\240\371\334\242\365\340\255E\363JU\216\363\017\300\0274\237[\264\036\274\265\334\260RSSS\243\243\243\343\343\343e\275i\323\246\025+VL\237>\275g\317\236\331\331\331\356>\343\307\217\227\355\356\207\231\231\231\377\374\347?\273u\353Vro\377\373\277\377\353p8\212m\374\364\323OSRR\334\0177l\330\360\361\307\037\337\314`,\302f\263-Z\264(++\313Yt\376\367\354\331\263c\307\016\325\307\005 p\220B`\0157\254\324\243G\217\316\236={\341\302\205\313\227/\377\333\337\376&YD\266\374\374\363\317v\273]\236=x\360`\277~\375BCC\273t\351\022\022\0222x\360\340\326\255[K(\221\327T\263\2038q\342\204|\325\336\275{\367\357\337\337\240A\203\204\204\004y\321\215\211\211IOO7;\234={\366\325W_\225\354\022\026\026&\273\352\334\271s\263f\315\244=h\320 \237\216]\0259?r\332+V\254X\253V-iT\256\\\271\202a\363\346\315\252\017\015@\200 \205\300\032J\257\324\330\330\330\267\337~;88X2\301\270q\343\036}\364QYKP\010\012\012\222\355qqq\005\005\005\021\021\021III\322y\340\300\201\347\317\237\2278\222\233\233\353\271\223\317?\377|\310\220!\363\014O=\365\224\331\350\337\277\277\204\033w\237\214\214\014I-\221\221\221\362\275:u\352\324\264iS\3114\236\357\257\004\222\211\023''V(\341\231g\236\011\017\017W}h\000,\214\367Y\335H!\226\341M^~\343\2157$y\214\0313FR\310\330\261c%\221\264o\337\376\342\305\213\362\324\345\313\227%y\214\036=:>>\376\275\367\336\223\352\357\335\273\367\316\235;%\276\230\357\232H\237\005\013\026|\377\375\367\346\256\336|\363M\263\261v\355Z\331.\215\335\273w\317\235;W\002\307\205\013\027d\343\306\215\033e?\022h\244\361\335w\337%''''\373j\344\352\234={\366\316;\357\364\214 \015\0336\274\347\236{233U\037\032\000\013\343}V7R\210ex\223B\3445r\247\241A\203\006fCr\311\245K\227\344))\356I\223&M\2336\355\351\247\237\2362e\212$\225\036=z|\375\365\327/\277\374\362\252U\253\366\356\335\3534RH\353\326\255\203\015\217<\362\210\331\220=\230)\344\310\221#\322\255e\313\226\331\331\331\022;V\257^\275\336\260\326\220\226\226\346\3533\240\304\220!Cd\2460''\210J\225*\311\031\2360a\202\352\203\002`m\274\317\352F\012\261\014/S\3106C\375\372\365\315F\363\346\315\315O\247feeIV\330\264i\323k\257\275\366\375\367\337K\214\350\336\275\273l\357\322\245\213\373S\250\245\277\027bz\353\255\267d\275x\361\342\256]\273~j\010\013\013\033=zt\271\216\325\217\344\345\345U\251R\305\234#\332\267o\377\360\303\017\027\3731\026\000\224\025\357\263\272\221B,\303\233\024\322\255[7\311\004c\307\216\375\313_\376b\376D\246G\217\036\347\317\237w\032)d\366\354\331\253W\257n\324\250\221\254\327\255[''\371\303Y"\205\014\035:\264\330\347B\006\014\030P2\205\254X\261\242U\253V\343\014\375\373\367\0373f\214/\206\354''\326\254Yc\316\0275j\324\320\360_*\000|\201\367YM\244\020\313\270a\0129x\360\240$\217\311\223''O\235:\365\361\307\037\2372e\312\273\357\276+[\016\0348`v\350\325\253\327\261c\307\336y\347\235\341\303\207GEE\265n\335\332yu\012\371\307?\3761w\356\334\375\206\006\015\032\230\215\317>\373l\316\2349\356\357")d\321\242E\222B$\235|ex\357\275\367\002;\205\210g\237}V\316\177\363\346\315U\037\010\200\000\301\373\254&R\210e\224\236B$I\374\362\313/\231\231\231YYY\027/^l\331\262\245\254\245-[\262\263\263\345\331\355\333\267\233aBRHNN\216d\210y\363\3469\215\024\342\376M]OM\2324)\271QBL\345\312\225g\317\236-)\344\243\217>:b\330\260aCXXX9\215\322O\245\245\245\311\371\017\324\317\276\000P\202\367Y\235\244\020\013)=\205$$$\364\355\3337((h\324\250Q!!!#F\214\220\365\310\221#\207\016\035j\276\005\3424~M\246u\353\326\023&LHIIi\330\260a~~\276lt\377\022M1\362\257\377\222\033\367\357\337o\376R\356\302\205\013\227-[&\015\211>\365\353\327_\272tiy\014\321\257i\376;\375\000|\201\367Y\231X-\243|_\005\363\362\362\314\206\304\210\202\202\202\222\035\016\037>\\\372\227\333l6\263]\362O\254\006\236\310\310\310\377\370\217\377\330\262e\213\352\003\001\020Px\237\225\024b\031\374[\\\025\011\037\277\373\335\357V\254\\)AD\303\337\346\007\340S\232\317\355Z\017\336Z4\257TU\314\010\022\021\361C\276\315\376\303\017\233\010"\000n\321\336\275{\307\216\035\333\264i\323\247\236z\252z\365\352w\337}\267\254\245-[d\273\371\327\233\364\301\013\233eT\254X\361\232?:\201\357xF\020s!\210\000\2709YYY\241\241\241\377\371\237\377Y\362\357\225\025#}\244\247\371\367\335\003\036)\3042*W\256|\356\3349\325G\241\221\222\021\304\035Dd;\237\021\001\340\245\274\274\274\2313gV\255Z\365\206\371\303\223\364\227\257r\177\206/P\221B,\243F\215\032\251\251\251\252\217B\027\327\213 \346"\333\371\260*\000oddd<\365\324S\236\361Bf\217N\235:}\265xIttLZ\372\211\213\227.\313Z\332\262\245C\207\016\362\254g\347\272u\353\312\036T\017\302\207H!\226Q\247N\235\270\2708\325G\241\205\322#\010A\004\200\227\242\243\243\253W\257\356\216\024\017?\374\360\342%Ksr\363J\231[\344Y\351S\263fM\367W\311\036d?\252\207\342+\244\020\313h\335\272\365\242E\213T\037E\340\363&\202\020D\000\334\220D\207J\225*\231I\342\356\273\357\2361c\306\245\31397\234X\314EzN\237\376\276|\225\371\345\262\237@\015"\244\020\313\2309sf\257^\275T\037E\200\363>\202\020D\000\224"##\303\375.H\265j\3256o\336\342\345\254\342\271\310W\271?M"{\013\310\037\315\220B,#66\366\261\307\036S}\024\201\254\254\021\204 \002\340\232\362\362\362\334\237\005\221\010\222\224|\370&"\210\271\310\327\272\203H\335\272u\003\357\303\252\244\020\313\260\331l\367\337\177\377\376\375\373U\037H`*\031AN\237\371\251\224\251\301\363Y\202\010\000O3g\316t\377 \346\346\336\005)\366\216\310]w\335e\356P\366\254zp\345\214\024b%\323\246Mk\337\276\275\352\243\010@%#HHh\250d\276C\211I\327\234\024d\273<+}\010"\000\212\311\312\312r\377\236\313\214\0313n1\202\230\313\364\351\357\273\177}7\300\376\216\010)\304JN\237>-/\226\346\177M\207\362r\315\010b\336\360\327\014"f\0041;\020D\000\024\023\022\022b\316\017\177\372\323\237\274\3778j\351\213\354\307\375[3\241\241\241\252\207X\236H!\026\363\325W_I-\006X\026V\250\224\010r\315 \342\031A\010"\000Jr\377u\324\305K\226\226K\0041\027\331\233\271[\331\277\352!\226''R\210\365\364\355\333\367\211''\236 \210\334\272k~\026\244X\310\360\014"%#\210\371,\237\021\001`\332\263g\21793\310<P\372\337\005)\353"{\223\371\312\334y \375_3\244\020\353)((\350\324\251\323\335w\337\315\217fn\305\365~#\346zQ#|\375\206R\002\212\347B\020\001\002\230\315f\233:u\352\202\005\013233K>;v\354Xsr\220Y\272\034#\210\271t\350\320\301\334\271|\227\333?p\037!\205X\325W_}%/\242\355\333\267\347\267fnB\351\277\224{\315 R\261bEo"\010A\004\010l+W\2564g\200;\357\274s\360\340\301\305~u\266i\323\246\346\263_-^R\356)D\366i\356\\\276\213\252\341\227;R\210\205\235>}z\332\264i\362Z\370\330c\217\365\352\325k\321\242Eqqq\251\251\251\347\316\235\343\177\337-\2057\177\027\344\232A\304\313\010B\020\001\002XVV\226\373\337$\322\250R\245\312\2325k\334\317\272\377LHttL\271\247\020\331\247\271s\371.\012\317@\371"\205X\236\315f\213\215\215\2359sf\353\326\255\353\324\251S\243F\215\312\225+\227\374\207;L\336\377i\262R\202\310\015#\010A\004\010`\265j\325\362\234\020\356\274\363\316g\237}6--M\236r\377\275\324\264\364\023\345\236Bd\237\346\316\345\273\250>\007\345\206\024\002\275\224\351\257\243\206\257\337P2\317\311\026\331\356\345\036~\370a\223\004\021\367\217\212\001\0046\367\377\374r\361\322\345rO!\262O\367wQ=\225\226\033R\010\364\022\031\031)A\344\373\210\010\336\013\201Z\307\216\035\353\332\265\2534\366\031\242\242\242\336|\363\315\304\304\304\335\273wgdd\234;w\356\255\267\336\352\327\257\337\360\341\303CBB\344\037\337\243G\217\016\016\016\0368p`\307\216\035\315\317E~\377\375\367\215\0337\376\360\303\017\245[\337\276}k\327\256-}\202\202\202\272u\353v\362\344\311\213\027/\266o\337\376\321G\037\2357o\336\321\243G\2335k\266\272\310\253\257\276\252z\364\326V\271res*\250T\251\222\234\344\207\036z\250E\213\026\274\027rsH!\320\2167A\204\317\205\300\327z\367\356}\352\324\251\257\277\376Z\262\305''\237|2s\346\314\347\237\177~\316\2349\222*v\355\332\3454\376/\222\344\344\344\023''N\374\370\343\217\257\275\366\232t\226\366\341\303\207srr\334;\371\345\227_\034\016G~~~\217\036=l6[zz\272\264=\277\313\340\301\203%\320H\243s\347\316\356\215\374\011\346[\341\376]\334\206\015\033\276\362\312+5k\326\014\017\017w?\313\347B\312\212\024\002\035\225\036D\370\035\031\370\332\206\015\033\036\177\374\361\221#G6k\326\314L\025\222\025\314\267F\334N\237>\375\334s\317\375\303\360\304\023O\230\215\027_|\361\310\221#\362lBB\302\260a\303\262\263\263\245=z\364\350\304\304Di\304\304\304\310N\314\017\247\307\307\307\367\351\323\247v\355\332}\373\366\375\370\343\217\2337o.\335BCCe\315{!\267"""\242\202\361\037\313\335s\317=\023''N\344wdn\021)\004\232\222 R\245J\025\376^\010\224\270x\361\342\217?\3768|\370\360\344\344\344\331\263gw\353\326m\320\240A\335\273w\0370`@\2336mN\235:%}233\273t\351b\366o\321\242\205\331\350\337\277\377\361\343\307\315vttt\277~\3756m\332\364\3143\317Hc\350\320\241\022k$y\214\0313\306\375\215\376\374\347?GEE\311\267;|\370\360\211\023''N\236<)\353\224\224\224\013\027.\334\326\001\007\226u\353\326\315\2325\353\354\331\263%\237r\177\010\254C\207\016\345\236B\370{!@@\341o\247B\241\255[\267~\366\331g\322\270|\371r||\374\376\375\373\017\0348\220\220\220\220\224\224dv8s\346L\223&M\202\203\203_\177\375\365G\036yD\202HPPP\243F\215RSS\335;9v\354\230\303\341X\261b\305\321\243G?\370\340\003\371\222/\276\370B\332\346\263k\326\254\221\177\262w\355\332u\351\322\2453f\314\220\027Ny8g\316\234\217>\372\350\320\241C\267\177\310:\330\273w\25793\360\267S\275D\012\201\326\370\177d\240\304\211\023''\036|\360\301\276}\373\366\352\325Kb\207d\213\177\026i\325\252\225g\317\310\310\310\211\023''J\004\221\350\360\365\327_\027\333\217l\277t\351\322\320\241Ce\207]\272t9}\372tXX\230\371Tvvv\2336m\006\015\032\224\221\221q\374\370\361\270\270\270\203\007\017\276\366\332k\222ubbbn\3238\265\344\353\377G\346\277\376\353\277T\017\261<\221B\240;\376O](a\267\333\035\016\307\376\375\373%\023\014\0336\314\275\275C\207\016\356\366\312\225+\273w\357.\335\314\237\310\204\204\204L\236<Y\276\320|6<<\374\037\377\370\207\323\370\264i~~\376;\357\274#)\304\375\343\230E\213\026m\337\276\335\375\351\324y\363\346}\365\325W\317=\367\334\222%K\346\316\235{\273F\251\243\320\242\011\244f\315\232\374\237\2727D\012\001\256\035DJ\371\360\251\031D\210 \270i\207\016\035\252W\257\236\004\216i\323\246\355\330\261\343o\177\373\333\273EZ\267n-\035\022\023\023\333\265k7a\302\004\363\243\246\356O#.\\\270\360\257\177\375kTTTnnn\203\006\015\362\362\362RSS\333\264i\3434~\013\346\314\2313\362\022%\351d\335\272uf\377\201\003\007\236={V\322\311\311\223''333\2337o.ki\233\037=\201/deeU\255Z\325L\014\323\247\277_.)D\366c\356P\366\034`\377\225))\004p\271\346gDJ\231\024\370,\010n\205\303\341p\277\245!\201c\370\360\341\347\213\364\356\335[6\376\364\323O\007\016\034p\367\177\376\371\347\335m\311\020\322-66v\316\2349\011\011\011\365\353\327\317\310\310\220\355\303\206\015\313\317\317o\331\262\245\344\030s\213\350\336\275\373\211\023''\226,Y"\371\346\375\367\337\2371c\206\254\245\275h\321\242\3337Z\375\314\2349\323\014\015w\337}\367\346\315[n1\202\310\036\356\272\353.s\207\262g\325\203+g\244\020\240\220\367\177\334\335s!\202\3406p\177\340\264$w\232\271\246\323\247O\027\373\013"\270\015\362\362\362\334\1778\244j\325\252I\311\207o:\202\310\327\272\337Y\251[\267n\261_\014\016\000\244\020\340\212\262\006\021"\010\200k\312\310\310p\377\035U\211\0217\367\216\210|\225;\202\310\336\334oq\005\022R\010p\025\357\203\010\021\004@)\242\243\243+U\252df\210\273\356\272k\372\364\367\275\377\260\252\364\224\376\356\037\304\310~do\252\007\344\023\244\020\2408o\202\010\021\004\300\015Itp\277#"\036~\370\341\305K\226\226\376wD\344Y\351\343\376\215\030\363]\220@\215 NR\010pM\245\007\021"\010\000/edd\324\255[\327\363\217\014\311\334\322\241C\207\257\026/\211\216\216IK?q\361\322eYK[\266\310v\367\237&s\177\026$ \177\020\343F\012\001\256\355zA\204\010\002\240L\362\362\362f\316\234\351\376\204\207\227\244\277|U\340}\034\265\030R\010p]%\203\010\021\004\300\315\311\312\312\012\015\015u\377e\325RH\037\351\031`\177\027\344zH!@i<\203\010\021\004\300\255\333\263g\317\330\261c\2336m\372\324SOU\257^\375\356\273\357\226\265\264e\213l\227gU\037\340mE\012\001n\300\014"+V\256$\202\000@\371"\205\0007\026\031\031)\021D\326\252\017\004\000\002\012)\004\000\000\250A\012\001\000\000j\220B\000\000\200\032\244\020\000\000\240\006)\004\000\000\250A\012\001\000\000j\220B\000\000\200\032\244\020\000\000\240\006)\004\000\000\250A\012\001\000\000j\220B\000\000\200\032\244\020\000\000\240\006)\004\000\000\250A\012\001\000\000j\220B\000\000\200\032\244\020\000\000\240\006)\004\000\000\250A\012\001\000\000j\220B\000\000\200\032\244\020\000\000\240\006)\004\000\000\250A\012\001\000\000j\220B\000\000\200\032\244\020\000\000\240\006)\004\000\000\250A\012\001\000\000j\220B\000\000\200\032\244\020\000\000\240\006)\004\000\000\250A\012\001\000\000j\220B\000\000\200\032\244\020\000\000\240\006)\004\000\000\250A\012\001\000\000j\220B\000\000\200\032\244\020\000\000\240\006)\004\000\000\250A\012\001\000\000j\220B\000\000\200\032\244\020\000\000\240\006)\004\000\000\250A\012\001\000\000j\220B\000\000\200\032\244\020\000\000\240\006)\004\000\000\250A\012\001\000\000j\220B\000\000\200\032\244\020\000\000\240\006)\004\000\000\250A\012\001\000\000j\220B\000\000\200\032\244\020\000\000\240\006)\004\000\000\250A\012\001\000\000j\220B\000\000\200\032\244\020\000\000\240\006)\004\000\000\250A\012\001\000\000j\220B\000\000\200\032\244\020\000\000\240\006)\004\000\000\250A\012\001\000\000j\220B\000\000\200\032\244\020\000\000\240\006)\004\000\000\250A\012\001\000\000j\220B\000\000\200\032\244\020\000\000\240\006)\004\000\000\250A\012\001\000\000j\220B\000\000\200\032\244\020\000\000\240\006)\004\000\000\250A\012\001\000\000j\220B\000\000\200\032\244\020\000\000\240\006)\004\000\000\250A\012\001\000\000j\220B\000\000\200\032\244\020\000\000\240\006)\004\000\000\250A\012\001\000\000j\220B\000\000\200\032\244\020\000\000\240\006)\004\000\000\250A\012\001\000\000j\220B\000\000\200\032\244\020\000\000\240\006)\004\000\000\250A\012\001\000\000j\220B\000\000\200\032\244\020\000\000\240\006)\004\000\000\250A\012\001\000\000j\220B\000\000\200\032\244\020\000\000\240\006)\004\000\000\250A\012\001\000\000j\220B\000\000\200\032\244\020\000\000\240\006)\004\000\000\250A\012\001\000\000j\220B\000\000\200\032\244\020\000\000\240\006)\004\000\000\250A\012\001\000\000j\220B\000\000\200\032\244\020\000\000\240\006)\004\000\000\250A\012\001\000\000j\220B\000\000\200\032\244\020\000\000\240\006)\004\000\000\250A\012\001\000\000j\220B\000\000\200\032\244\020\000\000\240\006)\004\000\000\250A\012\001\000\000j\220B\000\000\200\032\244\020\000\000\240\006)\004\000\000\250A\012\001\000\000j\220B\000\000\200\032\244\020\000\000\240\006)\004\000\000\250A\012\001\000\000j\220B\000\000\200\032\244\020\000\000\240\006)\004\000\000\250A\012\001\000\000j\220B\000\000\200\032\244\020\000\000\240\006)\004\000\000\250A\012\001\000\000j\220B\000\000\200\032\244\020\000\000\240\006)\004\000\000\250A\012\001\000\000j\220B\000\000\200\032\244\020\000\000\240\006)\004\000\000\250A\012\001\000\000j\220B\000\000\200\032\244\020\000\000\240\006)\004\000\000\250A\012\001\000\000j\220B\000\000\200\032\244\020\000\000\240\006)\004\000\000\250A\012\001\000\000j\220B\000\000\200\032\244\020\000\000\240\006)\004\000\000\250A\012\001\000\000j\220B\000\000\200\032\244\020\000\000\240\006)\004\000\000\250A\012\001\000\000j\220B\000\000\200\032\244\020\000\000\240\006)\004\000\000\250A\012\001\000\000j\220B\000\000\200\032\244\020\000\000\240\006)\004\000\000\250A\012\001\000\000j\220B\000\000\200\032\244\020\000\000\240\006)\004\000\000\250A\012\001\000\000j\220B\000\000\200\032\244\020\000\000\240\006)\004\000\000\250A\012\001\000\000j\220B\000\000\200\032\244\020\000\000\240\006)\004\000\000\250A\012\001\000\000j\220B\000\000\200\032\244\020\000\000\240\006)\004\000\000\250A\012\001\000\000j\220B\000\000\200\032\244\020\000\000\240\006)\004\000\000\250A\012\001\000\000j\220B\000\000\200\032\244\020\000\000\240\006)\004\000\000\250A\012\001\000\000j\220B\000\000\200\032\244\020\000\000\240\006)\004\000\000\250A\012\001\000\000j\220B\000\000\200\032\244\020\000\000\240\006)\004\000\000\250A\012\001\000\000j\220B\000\000\200\032\244\020\000\000\240\006)\004\000\000\250A\012\001\000\000j\220B\000\000\200\032\244\020\000\000\240\006)\004\000\000\250A\012\001\000\000j\220B\000\000\200\032\244\020\000\000\240\006)\004\000\000\250A\012\001\000\000j\220B\000\000\200\032\244\020\000\000\240\006)\004\000\000\250A\012\001\000\000j\220B\000\000\200\032\244\020\000\000\240\006)\004\000\000\250A\012\001\000\000j\220B\000\000\200\032\244\020\000\000\240\006)\004\000\000\250A\012\001\000\000j\220B\000\000\200\032\244\020\000\000\240\006)\004\000\000\250A\012\001\000\000j\220B\000\000\200\032\244\020\000\000\240\006)\004\000\000\250A\012\001\000\000j\220B\000\000\200\032\244\020\000\000\240\006)\004\000\000\250A\012\001\000\000j\220B\000\000\200\032\244\020\000\000\240\006)\004\000\000\250A\012\001\000\000j\220B\000\000\200\032\244\020\000\000\240\006)\004\000\000\250A\012\001\000\000j\220B\000\000\200\032\244\020\000\000\240\006)\344\377\267[\307\002\000\000\000\000\203\374\255\207\261\247(\002\000\036\026\002\000<,\004\000xX\010\000\360\260\020\000\340a!\000\300\303B\000\200\207\205\000\000\017\013\001\000\036\026\002\000<,\004\000xX\010\000\360\260\020\000\340a!\000\300\303B\000\200\207\205\000\000\017\013\001\000\036\001\035A\366wF\341\2444\000\000\000\000IEND\256B`\202', '0');
INSERT INTO "public"."act_ge_bytearray" VALUES ('1703', '1', 'freeLeave.bpmn', '1701', '<?xml version="1.0" encoding="UTF-8"?>\015\012<definitions xmlns="http://www.omg.org/spec/BPMN/20100524/MODEL"\015\012\011xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:activiti="http://activiti.org/bpmn"\015\012\011xmlns:bpmndi="http://www.omg.org/spec/BPMN/20100524/DI" xmlns:omgdc="http://www.omg.org/spec/DD/20100524/DC"\015\012\011xmlns:omgdi="http://www.omg.org/spec/DD/20100524/DI" typeLanguage="http://www.w3.org/2001/XMLSchema"\015\012\011expressionLanguage="http://www.w3.org/1999/XPath" targetNamespace="http://www.rguess.org/demo/activiti/leave">\015\012\011<process id="freeLeave" name="\350\207\252\347\224\261\346\265\201\350\257\267\345\201\207" isExecutable="true">\015\012\011\011<documentation>\350\207\252\347\224\261\346\265\201\350\257\267\345\201\207</documentation>\015\012\011\011<startEvent id="startevent1" name="Start" activiti:initiator="applyUser"></startEvent>\015\012\011\011<userTask id="approval" name="\350\207\252\347\224\261\346\265\201\350\257\267\345\201\207" activiti:assignee="${approvalUser}">\015\012\011\011\011<multiInstanceLoopCharacteristics isSequential="true">\015\012\011\011\011\011<loopCardinality>10</loopCardinality>\015\012\011\011\011\011<completionCondition>${endTag}</completionCondition>\015\012\011\011\011</multiInstanceLoopCharacteristics>\015\012\011\011</userTask>\015\012\011\011<endEvent id="endevent1" name="End"></endEvent>\015\012\011\011<sequenceFlow id="flow1" sourceRef="startevent1" targetRef="approval"></sequenceFlow>\015\012\011\011<sequenceFlow id="flow2" sourceRef="approval" targetRef="endevent1"></sequenceFlow>\015\012\011</process>\015\012\011<bpmndi:BPMNDiagram id="BPMNDiagram_freeLeave">\015\012\011\011<bpmndi:BPMNPlane bpmnElement="freeLeave" id="BPMNPlane_freeLeave">\015\012\011\011\011<bpmndi:BPMNShape bpmnElement="startevent1"\015\012\011\011\011\011id="BPMNShape_startevent1">\015\012\011\011\011\011<omgdc:Bounds height="35.0" width="35.0" x="30.0" y="120.0"></omgdc:Bounds>\015\012\011\011\011</bpmndi:BPMNShape>\015\012\011\011\011<bpmndi:BPMNShape bpmnElement="approval" id="BPMNShape_approval">\015\012\011\011\011\011<omgdc:Bounds height="55.0" width="105.0" x="110.0" y="110.0"></omgdc:Bounds>\015\012\011\011\011</bpmndi:BPMNShape>\015\012\011\011\011<bpmndi:BPMNShape bpmnElement="endevent1" id="BPMNShape_endevent1">\015\012\011\011\011\011<omgdc:Bounds height="35.0" width="35.0" x="290.0" y="120.0"></omgdc:Bounds>\015\012\011\011\011</bpmndi:BPMNShape>\015\012\011\011\011<bpmndi:BPMNEdge bpmnElement="flow1" id="BPMNEdge_flow1">\015\012\011\011\011\011<omgdi:waypoint x="65.0" y="137.0"></omgdi:waypoint>\015\012\011\011\011\011<omgdi:waypoint x="110.0" y="137.0"></omgdi:waypoint>\015\012\011\011\011</bpmndi:BPMNEdge>\015\012\011\011\011<bpmndi:BPMNEdge bpmnElement="flow2" id="BPMNEdge_flow2">\015\012\011\011\011\011<omgdi:waypoint x="215.0" y="137.0"></omgdi:waypoint>\015\012\011\011\011\011<omgdi:waypoint x="290.0" y="137.0"></omgdi:waypoint>\015\012\011\011\011</bpmndi:BPMNEdge>\015\012\011\011</bpmndi:BPMNPlane>\015\012\011</bpmndi:BPMNDiagram>\015\012</definitions>', '0');
INSERT INTO "public"."act_ge_bytearray" VALUES ('1704', '1', 'freeLeave.png', '1701', '\211PNG\015\012\032\012\000\000\000\015IHDR\000\000\003\002\000\000\001\237\010\002\000\000\000c\271\362[\000\000\025AIDATx\234\355\335\177l\234\367]\300\361\2500\344JT5b\260\210\177\342\211?ji@,6\224\374E<$j#Ac\211\2511\374\221Y\252\226eLt\025B\233\005J\215X\203\205X\211\320\026y\260f\006\224a4\245\262\264\266\204\265\351\002$\231\351\217\324\375\221\315K\2335]\232.k\222\316%IsM\354\370\341\233\273\356z\263c\307W\337s\217\235\317\353\245\257\254\363\371\356\361=~\356\361\367}\277We\000\000!\255*\372\002\000\000\024C\006\001\000A\311 \000 (\031\004\000\004%\203\000\200\240d\020\000\020\224\014\002\000\202\222A\000@P2\010\000\010J\006\001\000A\311 \000 (\031\004\000\004%\203\000\200\240d\020\000\020\224\014\002\000\202\222A\000@P2\010\000\010J\006\001\000A\311 \000 (\031\004\000\004%\203\000\200\240d\020\000\020\224\014\002\000\202\222A\000@P2\010\000\010J\006\001\000A\311 \000 (\031\004\000\004%\203\000\200\240d\020\000\020\224\014\002\000\202\222A\000@P2\010\000\010J\006\001\000A\311 \000 (\031\004\000\004%\203\000\200\240d\020\000\020\224\014\002\000\202\222A\000@P2\010\000\010J\006\001\000A\311 \000 (\031\004\000\004%\203\000\200\240d\020\000\020\224\014\002\000\202\222A\000@P2\010\000\010J\006\001\000A\311 \000 (\031\004\000\004%\203\000\200\240d\020\000\020\224\014\002\000\202\222A\000@P2\010\000\010J\006\001\000A\311 \000 (\031\004\000\004%\203\000\200\240d\020\000\020\224\014\002\000\202\222A\000@P2\010\000\010J\006\001\000A\311 \000 (\031\004\000\004%\203\000\200\240d\020\000\020\224\014\002\000\202\222A\000@P2\010\000\010J\006\001\000A\311 \000 (\031\004\000\004%\203\000\200\240d\020\000\020\224\014\002\000\202\222A\000@P2\010\000\010J\006\001\000A\311 \000 (\031\004\000\004%\203\000\200\240d\020\000\020\224\014\002\000\202\222A\000@P2\010\000\010J\006\001\000A\311 \000 (\031\004\000\004%\203\000\200\240d\020\000\020\224\014\002\000\202\222A\000@P2\010\000\010J\006\001\000A\311 \000 (\031\004\000\004%\203\000\200\240d\020\000\020\224\014\002\000\202\222A\000@P2\010\000\010J\006\001\000A\311 \000 (\031\004\000\004%\203\000\200\240dP\216J\245\322\310\310Hoooggg[[\333\252\250\322\272\247\277@OO\317\360\360\360\344\344d\321\233\005\000\336!\203\362\262w\357\3364\375\247\006\332\275{\367c\373\366\275t\354\330\345\251\251\230#\255{\372\013\354\331\263g\363\346\315\351o\222b\250\350\215\003\000W\311\240\306\233\234\234\354\353\353\353\352\352:\361\352\211\313S\227\215\332q\372\314\351\024C\351\217s\352\324\251\2427\024\000\321\311\240\006K\015\324\321\321\361\300\256\257\\\236\272d\3147\036z\370\241u\353\326\035?~\274\350\315\005@h2\250\301\372\372\372\312\015\364\266\261\360xl\337\243\0336\374v\321\233\013\200\320dP#\355\335\273\267\253\353\366\251\351\222\261\230\361\331\317\375\371\366\355\237/z\243\001\020\227\014j\230R\251\324\326\326\366\352\311\343S\323\027\215\305\214\363\027~\274v\355oLLL\024\275\351\000\010J\0065\314\360\360p__\337\324\364[\325\361\321\356\337_\344K\312k\317\025jl\337\376\327\375\375\375Eo:\000\202\222A\015\323\323\323\263\347\301\177\177\267\201n\357\372a\226\275r%{q*\373\316\245\354\331K\331S\347\247w<\370\3707O\276\371\304\345\354\177K\331\023\245\354\300[\331\243og\377p\340\371-[?Yx\221\0242\236><\326\321\321Q\364\246\003 (\031\3240\355\355\355G\216<35}\2412V\255Zu>\313.\314doNgo\\\316\336\312\262?\373\213{W\335\364\363\353o\35799\225\235\270\224\235x;;^\312^\232\316\276\376\355g\313w\010]\0108\316_8\333\322\322R\364\246\003 \250\2023\250T*\215\216\216\016\014\014\364\364\364t\376Dwww:fddde\275\343pkk\353\231\263''\247\246\317WF*\233\267\256d\227\256\\\375\321\364\314\325\257\337x\344?\177\345W\177\355/\357\373\302t\226\235\233\316\336\234\312\336\230\312\322\032>\372\344s\345\014:\037s\244u/v\303-\023\013\354\013\303\303\303\336f\011 \017\205\315@\351?~\372\027\337\322\322\222\376\351\247\177\364{\366<\370\330\276\307+\343\241\207\037\331\266\355\336\336\336\336\024\026\353\327\257_)o:\\N\231s\325\221\276\2750\235\235\275\230]\276\362\316\011R\325\375\375\027\277\374\371\277\373\342\211\327\256NiS3\331\345r\036\035z\372\331Y\347\0155dP\332\027\322^p\335''\220utt\014\015\015\245Z*\372\362\002\3348\012\230\201\306\307\307+\2370\225r\347\362\324\364\302\343\300\301C\2337\177<M\000\373\367\357o\376E\255K9e\376\257:\256f\320\225\354\364[\331\217\316gSYv\371\322\245\366\333n[\265\352gV\255j\371\330\037m\256=\343S\207\237\231u\336P#r\006\245ku\012\375z?\240-eS\321\027\034\340\006\321\354\031hpp05\315c\373\036\277n\000\325\216\247\236>\274a\303\206\255[\267.\347\233\302\345\224y\263:*\017\212\235\275\230\275v.{\375\355\354\251#\337\377\300\007>\3603?\373s7\337\372\376\336?\376\251\014z\362\351\303\263\316\033j\304\314\240tM\356\353\353\233{\177\317g?\373\271\332{F\323\330\266\355\336\256\256\256Y\247L\267"V\326C\306\000\313S\363f\240\364\177\277\267\267\267\277\277\277\256\000\252\035_\332\271\263\263\263s\331>I\242\2342\223\325\221\276\2758\223\275Q\272zo\320\351\267\263}ON\374\372\332\017\277\377\227~\371\326\326_\370\362\277|\375\355,;\177){\353\322\3253\036\030{r\326yC\215\200\031\224\256\303\263\356\004\272\373\356\317\224?|w\336+\377\3513g\323\365\177\365\352\325\265w\013\215\217\217\027\275*\000+[\223f\240\324@\351\377\376\310\310\310{n\240\352cdi9\313\363\263\250\322\3144=\375\343\352\250\314\356\251\204\336\234\312~|9{\355\334\324\241\347\217\257\375\315\217|\364w\177\357\365K\331\217J\331\353\245\354\354\245,\205\320\201''\236\234u\336P#Z\006\245ko*\230j\315tww/\034@\263bh\333\266{\253\347mii\031\033\033+z\205\000V\260&\315@\275\275\275Ko\240\352\003d\251\204\226\341\243c\263R\246\363\243\033\236\373\356\213O=?16>q\360\360\304\301g\216\036z\356\330\267\236\370\316\267\237\177\371\277\017\037\375\237\303\337;\370\314\367\306\236=\372\374\213?\330\371\217\273\356\334tg\3419"\203\232\240r{\240\3321\367m\337\376\036v\201\335\273\277\226\002\250z\237\320\262\275\177\024`\371k\306\014488\270\224\307\302\346\216={\036\354\351\351i\302%\257K9\203\336\250\035\237\376\364''\027\363\244\327?\374\330\307f\2351\324\010\225A\351\366@u\273\247\253\361Rn\014\264\266\266V\226\323\331\331Y\364j\001\254T\271\317@\343\343\343\035\035\035\015l\240\312\330\262\345\223CCCy_\370\272\2243\350\254Q\357\210\223A\243\243\243K\274\037\250v<\364\360#\325\245\355\330\261\243\350\225\003X\221r\237\201R\003\245[\256\015\317\240\023\257\236\\\263\246mY=4v5\203\256\2341\352\035q2(\355\013\325\347\0035d/\250>Oh\365\352\325\313j_\000X)\362\235\201*\357\013\327\360\006\252\214\273\357\376\314\262\272\021\\\316\240\323F\275#H\006\215\214\214T\237\327\234"\276!\273\300\271\363\027\252\257\035\273\347\236{\212^E\200\225''\337\031\250\263\263\263\336\267\010\252\353\016\2414\007\344z\371\353R\316\240\327\215zG\220\014J\373B\245WR\2767p/x`\327\256\312b[[[\213^E\200\225''\307\031hrr2\375k\316\251\201*c\335\272u\313\347\005\303\345\014\372\221Q\357\210\220Ai_\250>\217\247Qw\005U\307\2325m\225%/\377wZ\007Xnr\234\201\206\207\207\373\372\372r\315\240\373\266o\357\357\357\317o\025\346\032\031\031\231\357]\213\312\031t\312\250w\3340\031\264\300u#\355\013\325Wu5|/\330\262\345\235\027$6y_\000\270\001\3448\003m\335\272uhh(\327\014zl\337\343\315|\265\360\321\243G+\363\315-\267\334\262g\317\236Y?\225A\2213h\341\353F\332\027\032\365\002\261k\356\005\225\205\257_\277\276\220u\007X\271r\234\201\272\273\273\027\363\341\251K\031/\035;\266fM[~\2530K\251T\272\351\246\233*S\316\373\336\367\276\017}\350C\265\267\376\313\031\364\303\006\216\305,p\221\277t\356\311\026sL]\277b)\253\331\264-\230\237\205\257\033i_\250\374(\217="\355\005\225\205\267\2655o_\000\2701\3448\003\345\364R\371\332q\356\374\205\226\226\226\374Va\256\332\017uJn\276\371\346\273\356\272\253\362Z\345\364\355\225+\2575j,ri\327<\331"\217\254\034\263j\036\265''\253=\362\232\247Y\342\2326s\013\346g\201\353F\365\245\3629\355\021\325_Z\364\337\000`\205\311\361\377f\232\025\032\376l\320kN\000\325\327\340\024\356\312\225\223K\034\213Y\370"O\263\300)\347\373\325\363\035Y\373u\341\323\277\267U^>[0''\325BZ\374\307\207\3255\252\313\317ow\006\270!\345\370\177\263\275\275\375\205#G\232\220A\371\255\302\\\267\336zkun\353)KS\370\304\304D\366\316\275A\257.q\314\267\220\332\343\027sx1\313\254=\301,\263\316[\373u\361\213]\374*7s\013\346g\201\353F\332\027*\307\347\264GT?b\254\350\277\001\300\012\223\343\377\315\\\3374\2502\232\374\334\240\352\313\236\323\254\366\211O|"}\035\031\031\251\376\264\234\005''\2268\346[H\355\361\2139<\337\221\325o\177\222;\013\375\352\352ij\362\350\335\303\015Y\337\312\002\233\266\005\363\263\360u\243zwW\036{\304\3513g+\013\367\326A\000\365\312q\006\352\353\353{`\327\256\\3\350\300\301C\353\326\255\313o\025fy\345\225W\322\315\356\356\356\356\266\266\266\376\376\3764\363\325\376\264\234\005?X\342\230{\307LMs\274{\232\205\017\327\036X`Q\225\003\213<\315\322Wm\201Un\332\026\314\317\302\327\215\264/T\376\252_\332\271\263\341{\301\013G\216T\026\336\321\321Q\324\352\003\254P9\316@;v\354h\354\033\346\316\035)\2636o\376x~\2530\327\350\350\350\360\360\3605\337\036\246Q\031t\335\343\353M\245\371\0265\367\300|iU\273\374k\376:\031\224-x\335\030\034\034\254\374\305\322\325\265\341{\301}\333\267W\026\336\333\333\333\364\225\006X\331r\234\201\322|\220n\031\347\232A]]]{\367\356\315o\025\352R\316\202W\2268\346[H\355\361\2139<\353\310\332\257sO\177\255\234\272\306\331\347\236k\351\353[YN\321\233.w\023\023\023\225?lkk\353\271\363\027\032\273\027l\330\260\241\262\360\024aE\257(\300\012\223\357\014\224\353\263\244\323t\222&\225\345\363\301\332W\263`\346\370\022\307B\367\364\324\234\346\272\207g\035Y\373u\356\351\347;\276\366\214\325\3130\337\271\226\262\312Eo\272fH7\011*\177\303={\036l\340^P}\323\240d\326#q\000\\W\2763P\256\217\213}\341\376\373\323\302s\275\374u)g\301\313K\034\363-\244\366\370\272\016W\016\314\375:\353\300\234\344zy\356\331k\217l\310\312V\227V\364\246k\206\376\376\376\312\337m\355\332\265\015\274C\350\216\215\033+\213\355\351\351)z\025\001V\236|g\240R\251\224n\004\347\361\356Ai"Y\263\246\355\324\251S\271^\376\272\224\313\340\373K\034\363-\244\366\370\005\3571\372\251\023\317:P\373\265\272\234\271\277t\326\357\272\3561K_\345\2427]3LNNV\337\335\247Q\037\251q\340\340\241\352\246\037\037\037/z\025\001V\236\334g\240\221\221\221;7m\272\341\357\012\312\336\311\240cK\034\013&\316\273\247\231\357\274\363}[=\\\273\250\271\007f\235\240\372\243\371N\271\364\365\255,\247\350M\327$;v\354\250\374y[ZZ\226\376\312\371\227\216\035\253v\325\326\255[\213^9\200\025\251\0313\320\035\03376\366\371\020/\0349Ryd\241\011\027~\361\312Y\360\222Q\357\210\223A\311\372\365\353+\341\222\012f)\357(\235\256\374i\027\250.jY\335-\012\260\2024c\006\232\234\234\\\267n]\243\236+}\372\314\3314\001\244)\244\011\227\274.\345\014z\321\250w\204\312\240\343\307\217\267\266\266V\363\345\275}\304\330\211WOV\033\250\245\245e\377\376\375E\257\026\300J\325\244\031hbb"\225\320\322?P)5\320\035\0337>\364\360#\315\271\330u\221A2h1R\265T\037\350L\021S\357\033*\0368x\250\3663\\w\354\330Q\364\012\001\254`\315\233\201\306\307\307\323M\330\364O|)\217\205\245\226Z\236\015\224\2253hf\346\250Q\357\210\226AY\371\215\026\253\367\011\255*\277v,]\253\027s''\320\235\2336\325>]L\003\001,QSg\240\311\311\311\015\0336l\333v\357\3513g\353}&\304\027\356\277\277\362\310Z3/p]\312\031\364=\243\336\0210\203\262\362\375\243\325\317[\255\306P\3325\346>v\234\352\347K;wvuu\325\2368U\224\307\302\000\226\256\3313P\251TJ\377\353o\273\255=e\315"\337=\345\201]\273\322\351\357\276\3733)\236\232|i\353R\316\240\011\243\336\0213\203\262\362\255\202\201\201\201\352\207\303\317\222\242\177\276\037\365\366\366zN4@C\0243\003\245\177\342\367\334sO\272E{\307\306\215\251r\346>Q4\035\263{\367\327\356\334\264)\235f\363\346\217_\363s\232\226\233r\006}w9\214o}\353\237\007\006>}\315\221~T\370\305\2335\302fPE\332\027\252\037\274z]\235\235\235cccE_d\200\033G\2213P\251T\032\035\035Ms@\365e/\265\017\020\244\006\032\031\031YA\237\017\220n\273_\274\370\314\314\314w\012\037\003\003\1772\337<\232~T\370\305\2335\202gPE\332\027\322\265=\355\013\035\035\035\2636Y[[[OO\317\320\320\220{\200\000\032\316\014\3240i\272z\371\345o\316\314\034)||\365\253\367uv\376\3265G\372Q\341\027o\326\220A\000\024\305\014\3240\335\335\335\377\261wh&{\301X\374\370\356\3047\332\333\333\213\336t\000\004%\203\032fpp\260\277\377\256\302\303be\215\257\016\337\327\327\327W\364\246\003 (\031\3240\307\217\037oo\377\340\305\322S3\331\363\305\216\201\201O\315\377\334\240O\025~\361jGO\317\357\214\216\216\026\275\351\000\010J\0065\322\300U[g\262\347\212\035\3512\314\237A\305_\274\352\370\267\221\277\355\355\355.z\243\001\020\227\014j\244R\251\324\331\371\221\261\261\177\315\262g\215\205\307\251S\373\332\333?89y\240\350\215\006@\\2\250\301&&&::n\233\230\030\315\262qc\276\221\032(\365\342\376\375_)zs\001\020\232\014j\274\261\261\261TB\203\203\177\232e\317\0242\206\207\377*E\3065G\372QQ\227\252:FG\357ooo\333\277\377\237\212\336P\000D''\203rQ*\225\372\373\373:;?\234\262\343\324\251G\263\354p3\307\300\300\226\371\237\033\264\245\311\027\246:&''\377kd\344oz{\273zz:\323\341\2427\021\000\310\240<\355\337\277\277\257\357\017V\257\376\305\371\242$\224\326\326[z{oO%T\364f\001\200w\310 \000 (\031\004\000\004%\203\000\200\240d\020\000\020\224\014\002\000\202\222A\000@P2\010\000\010J\006\001\000A\311 \000 (\031\004\000\004%\203\000\200\240d\020\000\020\224\014\002\000\202\222A\000@P2\010\000\010J\006\001\000A\311 \000 (\031\004\000\004%\203\000\200\240d\020\000\020\224\014\002\000\202\222A\000@P2\010\000\010J\006\001\000A\311 \000 (\031\004\000\004%\203\000\200\240d\020\000\020\224\014\002\000\202\222A\000@P2\010\000\010J\006\001\000A\311 \000 (\031\004\000\004%\203\000\200\240d\020\000\020\224\014\002\000\202\222A\000@P2\010\000\010J\006\001\000A\311 \000 (\031\004\000\004%\203\000\200\240d\020\000\020\224\014\002\000\202\222A\000@P2\010\000\010J\006\001\000A\311 \000 (\031\004\000\004%\203\000\200\240d\020\000\020\224\014\002\000\202\222A\000@P2\010\000\010J\006\001\000A\311 \000 (\031\004\000\004%\203\000\200\240d\020\000\020\224\014\002\000\202\222A\000@P2\010\000\010J\006\001\000A\311 \000 (\031\004\000\004%\203\000\200\240d\020\000\020\224\014\002\000\202\222A\000@P2\010\000\010J\006\001\000A\311 \000 (\031\004\000\004%\203\000\200\240d\020\000\020\224\014\002\000\202\222A\000@P2\010\000\010J\006\001\000A\311 \000 (\031\004\000\004%\203\000\200\240d\020\000\020\224\014\002\000\202\222A\000@P2\010\000\010J\006\001\000A\311 \000 (\031\004\000\004%\203\000\200\240d\020\000\020\224\014\002\000\202\222A\000@P2\010\000\010J\006\001\000A\311 \000 (\031\004\000\004%\203\000\200\240d\020\000\020\224\014\002\000\202\222A\000@P2\010\000\010J\006\001\000A\311 \000 (\031\004\000\004%\203\000\200\240d\020\000\020\224\014\002\000\202\222A\000@P2\010\000\010J\006\001\000A\311 \000 (\031\004\000\004%\203\000\200\240d\020\000\020\224\014\002\000\202\222A\000@P2\010\000\010J\006\001\000A\311 \000 (\031\004\000\004%\203\000\200\240d\020\000\020\224\014\002\000\202\222A\000@P2\010\000\010J\006\001\000A\311 \000 (\031\004\000\004%\203\000\200\240d\020\000\020\224\014\002\000\202\222A\000@P2\010\000\010J\006\001\000A\311 \000 (\031\004\000\004%\203\000\200\240d\020\000\020\224\014\002\000\202\222A\000@P2\010\000\010J\006\001\000A\311 \000 (\031\004\000\004%\203\000\200\240d\020\000\020\224\014\002\000\202\222A\000@P2\010\000\010J\006\001\000A\311 \000 (\031\004\000\004%\203\000\200\240d\020\000\020\224\014\002\000\202\222A\000@P2\010\000\010J\006\001\000A\311 \000 (\031\004\000\004%\203\000\200\240d\020\000\020\224\014\002\000\202\222A\000@P2\010\000\010J\006\001\000A\311 \000 (\031\004\000\004%\203\000\200\240d\020\000\020\224\014\002\000\202\222A\000@P2\010\000\010J\006\001\000A\311 \000 (\031\004\000\004%\203\000\200\240d\020\000\020\224\014\002\000\202\222A\000@P2\010\000\010J\006\001\000A\311 \000 (\031\004\000\004%\203\000\200\240d\020\000\020\224\014\002\000\202\222A\000@P2\010\000\010J\006\001\000A\311 \000 (\031\004\000\004%\203\000\200\240d\020\000\020\224\014\002\000\202\222A\000@P2\010\000\010J\006\001\000A\311 \000 (\031\004\000\004%\203\000\200\240d\020\000\020\224\014\002\000\202\222A\000@P2\010\000\010J\006\001\000A\311 \000 (\031\004\000\004%\203\000\200\240d\020\000\020\224\014\002\000\202\222A\000@P2\010\000\010J\006\001\000A\311 \000 (\031\004\000\004%\203\000\200\240d\020\000\020\224\014\002\000\202\222A\000@P2\010\000\010J\006\001\000A\311 \000 (\031\004\000\004%\203\000\200\240d\020\000\020\224\014\002\000\202\222A\000@P2\010\000\010J\006\001\000A\311 \000 (\031\004\000\004%\203\000\200\240d\020\000\020\224\014\002\000\202\222A\000@P2\010\000\010J\006\001\000A\311 \000 (\031\004\000\004%\203\000\200\240d\020\000\020\224\014\002\000\202\222A\000@P2\010\000\010J\006\001\000A\311 \000 (\031\004\000\004\365\377\316e\263\220\305p\345\236\000\000\000\000IEND\256B`\202', '0');
INSERT INTO "public"."act_ge_bytearray" VALUES ('1705', '1', 'leave/leave.bpmn', '1701', '<?xml version="1.0" encoding="UTF-8"?>\015\012<definitions xmlns="http://www.omg.org/spec/BPMN/20100524/MODEL"\015\012\011xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:activiti="http://activiti.org/bpmn"\015\012\011xmlns:bpmndi="http://www.omg.org/spec/BPMN/20100524/DI" xmlns:omgdc="http://www.omg.org/spec/DD/20100524/DC"\015\012\011xmlns:omgdi="http://www.omg.org/spec/DD/20100524/DI" typeLanguage="http://www.w3.org/2001/XMLSchema"\015\012\011expressionLanguage="http://www.w3.org/1999/XPath" targetNamespace="http://www.rguess.org/demo/activiti/leave">\015\012\011<process id="leave" name="\350\257\267\345\201\207\346\265\201\347\250\213">\015\012\011\011<documentation>\350\257\267\345\201\207\346\265\201\347\250\213\346\274\224\347\244\272</documentation>\015\012\011\011<startEvent id="startevent1" name="Start"\015\012\011\011\011activiti:initiator="applyUserId"></startEvent>\015\012\011\011<userTask id="deptLeaderAudit" name="\351\203\250\351\227\250\351\242\206\345\257\274\345\256\241\346\211\271"\015\012\011\011\011activiti:candidateGroups="deptLeader"></userTask>\015\012\011\011<exclusiveGateway id="exclusivegateway5" name="Exclusive Gateway"></exclusiveGateway>\015\012\011\011<userTask id="modifyApply" name="\350\260\203\346\225\264\347\224\263\350\257\267" activiti:assignee="${applyUserId}">\015\012\011\011\011<extensionElements>\015\012\011\011\011\011<activiti:taskListener event="complete"\015\012\011\011\011\011\011delegateExpression="${afterModifyApplyContentProcessor}"></activiti:taskListener>\015\012\011\011\011</extensionElements>\015\012\011\011</userTask>\015\012\011\011<userTask id="hrAudit" name="\344\272\272\344\272\213\345\256\241\346\211\271" activiti:candidateGroups="hr"></userTask>\015\012\011\011<exclusiveGateway id="exclusivegateway6" name="Exclusive Gateway"></exclusiveGateway>\015\012\011\011<userTask id="reportBack" name="\351\224\200\345\201\207" activiti:assignee="${applyUserId}">\015\012\011\011\011<extensionElements>\015\012\011\011\011\011<activiti:taskListener event="complete"\015\012\011\011\011\011\011delegateExpression="${reportBackEndProcessor}"></activiti:taskListener>\015\012\011\011\011</extensionElements>\015\012\011\011</userTask>\015\012\011\011<endEvent id="endevent1" name="End"></endEvent>\015\012\011\011<exclusiveGateway id="exclusivegateway7" name="Exclusive Gateway"></exclusiveGateway>\015\012\011\011<sequenceFlow id="flow2" name="" sourceRef="startevent1"\015\012\011\011\011targetRef="deptLeaderAudit"></sequenceFlow>\015\012\011\011<sequenceFlow id="flow3" name="" sourceRef="deptLeaderAudit"\015\012\011\011\011targetRef="exclusivegateway5"></sequenceFlow>\015\012\011\011<sequenceFlow id="flow4" name="\344\270\215\345\220\214\346\204\217" sourceRef="exclusivegateway5"\015\012\011\011\011targetRef="modifyApply">\015\012\011\011\011<conditionExpression xsi:type="tFormalExpression"><![CDATA[${!deptLeaderPass}]]></conditionExpression>\015\012\011\011</sequenceFlow>\015\012\011\011<sequenceFlow id="flow5" name="\345\220\214\346\204\217" sourceRef="exclusivegateway5"\015\012\011\011\011targetRef="hrAudit">\015\012\011\011\011<conditionExpression xsi:type="tFormalExpression"><![CDATA[${deptLeaderPass}]]></conditionExpression>\015\012\011\011</sequenceFlow>\015\012\011\011<sequenceFlow id="flow6" name="" sourceRef="hrAudit"\015\012\011\011\011targetRef="exclusivegateway6"></sequenceFlow>\015\012\011\011<sequenceFlow id="flow7" name="\345\220\214\346\204\217" sourceRef="exclusivegateway6"\015\012\011\011\011targetRef="reportBack">\015\012\011\011\011<conditionExpression xsi:type="tFormalExpression"><![CDATA[${hrPass}]]></conditionExpression>\015\012\011\011</sequenceFlow>\015\012\011\011<sequenceFlow id="flow8" name="" sourceRef="reportBack"\015\012\011\011\011targetRef="endevent1"></sequenceFlow>\015\012\011\011<sequenceFlow id="flow9" name="\344\270\215\345\220\214\346\204\217" sourceRef="exclusivegateway6"\015\012\011\011\011targetRef="modifyApply">\015\012\011\011\011<conditionExpression xsi:type="tFormalExpression"><![CDATA[${!hrPass}]]></conditionExpression>\015\012\011\011</sequenceFlow>\015\012\011\011<sequenceFlow id="flow10" name="\351\207\215\346\226\260\347\224\263\350\257\267" sourceRef="exclusivegateway7"\015\012\011\011\011targetRef="deptLeaderAudit">\015\012\011\011\011<conditionExpression xsi:type="tFormalExpression"><![CDATA[${reApply}]]></conditionExpression>\015\012\011\011</sequenceFlow>\015\012\011\011<sequenceFlow id="flow11" name="" sourceRef="modifyApply"\015\012\011\011\011targetRef="exclusivegateway7"></sequenceFlow>\015\012\011\011<sequenceFlow id="flow12" name="\347\273\223\346\235\237\346\265\201\347\250\213" sourceRef="exclusivegateway7"\015\012\011\011\011targetRef="endevent1">\015\012\011\011\011<conditionExpression xsi:type="tFormalExpression"><![CDATA[${!reApply}]]></conditionExpression>\015\012\011\011</sequenceFlow>\015\012\011</process>\015\012\011<bpmndi:BPMNDiagram id="BPMNDiagram_leave">\015\012\011\011<bpmndi:BPMNPlane bpmnElement="leave" id="BPMNPlane_leave">\015\012\011\011\011<bpmndi:BPMNShape bpmnElement="startevent1"\015\012\011\011\011\011id="BPMNShape_startevent1">\015\012\011\011\011\011<omgdc:Bounds height="35" width="35" x="10" y="90"></omgdc:Bounds>\015\012\011\011\011</bpmndi:BPMNShape>\015\012\011\011\011<bpmndi:BPMNShape bpmnElement="deptLeaderAudit"\015\012\011\011\011\011id="BPMNShape_deptLeaderAudit">\015\012\011\011\011\011<omgdc:Bounds height="55" width="105" x="90" y="80"></omgdc:Bounds>\015\012\011\011\011</bpmndi:BPMNShape>\015\012\011\011\011<bpmndi:BPMNShape bpmnElement="exclusivegateway5"\015\012\011\011\011\011id="BPMNShape_exclusivegateway5">\015\012\011\011\011\011<omgdc:Bounds height="40" width="40" x="250" y="87"></omgdc:Bounds>\015\012\011\011\011</bpmndi:BPMNShape>\015\012\011\011\011<bpmndi:BPMNShape bpmnElement="modifyApply"\015\012\011\011\011\011id="BPMNShape_modifyApply">\015\012\011\011\011\011<omgdc:Bounds height="55" width="105" x="218" y="190"></omgdc:Bounds>\015\012\011\011\011</bpmndi:BPMNShape>\015\012\011\011\011<bpmndi:BPMNShape bpmnElement="hrAudit" id="BPMNShape_hrAudit">\015\012\011\011\011\011<omgdc:Bounds height="55" width="105" x="358" y="80"></omgdc:Bounds>\015\012\011\011\011</bpmndi:BPMNShape>\015\012\011\011\011<bpmndi:BPMNShape bpmnElement="exclusivegateway6"\015\012\011\011\011\011id="BPMNShape_exclusivegateway6">\015\012\011\011\011\011<omgdc:Bounds height="40" width="40" x="495" y="87"></omgdc:Bounds>\015\012\011\011\011</bpmndi:BPMNShape>\015\012\011\011\011<bpmndi:BPMNShape bpmnElement="reportBack" id="BPMNShape_reportBack">\015\012\011\011\011\011<omgdc:Bounds height="55" width="105" x="590" y="80"></omgdc:Bounds>\015\012\011\011\011</bpmndi:BPMNShape>\015\012\011\011\011<bpmndi:BPMNShape bpmnElement="endevent1" id="BPMNShape_endevent1">\015\012\011\011\011\011<omgdc:Bounds height="35" width="35" x="625" y="283"></omgdc:Bounds>\015\012\011\011\011</bpmndi:BPMNShape>\015\012\011\011\011<bpmndi:BPMNShape bpmnElement="exclusivegateway7"\015\012\011\011\011\011id="BPMNShape_exclusivegateway7">\015\012\011\011\011\011<omgdc:Bounds height="40" width="40" x="250" y="280"></omgdc:Bounds>\015\012\011\011\011</bpmndi:BPMNShape>\015\012\011\011\011<bpmndi:BPMNEdge bpmnElement="flow2" id="BPMNEdge_flow2">\015\012\011\011\011\011<omgdi:waypoint x="45" y="107"></omgdi:waypoint>\015\012\011\011\011\011<omgdi:waypoint x="90" y="107"></omgdi:waypoint>\015\012\011\011\011</bpmndi:BPMNEdge>\015\012\011\011\011<bpmndi:BPMNEdge bpmnElement="flow3" id="BPMNEdge_flow3">\015\012\011\011\011\011<omgdi:waypoint x="195" y="107"></omgdi:waypoint>\015\012\011\011\011\011<omgdi:waypoint x="250" y="107"></omgdi:waypoint>\015\012\011\011\011</bpmndi:BPMNEdge>\015\012\011\011\011<bpmndi:BPMNEdge bpmnElement="flow4" id="BPMNEdge_flow4">\015\012\011\011\011\011<omgdi:waypoint x="270" y="127"></omgdi:waypoint>\015\012\011\011\011\011<omgdi:waypoint x="270" y="190"></omgdi:waypoint>\015\012\011\011\011\011<bpmndi:BPMNLabel>\015\012\011\011\011\011\011<omgdc:Bounds height="11" width="100" x="10" y="0"></omgdc:Bounds>\015\012\011\011\011\011</bpmndi:BPMNLabel>\015\012\011\011\011</bpmndi:BPMNEdge>\015\012\011\011\011<bpmndi:BPMNEdge bpmnElement="flow5" id="BPMNEdge_flow5">\015\012\011\011\011\011<omgdi:waypoint x="290" y="107"></omgdi:waypoint>\015\012\011\011\011\011<omgdi:waypoint x="358" y="107"></omgdi:waypoint>\015\012\011\011\011\011<bpmndi:BPMNLabel>\015\012\011\011\011\011\011<omgdc:Bounds height="11" width="100" x="-24" y="-17"></omgdc:Bounds>\015\012\011\011\011\011</bpmndi:BPMNLabel>\015\012\011\011\011</bpmndi:BPMNEdge>\015\012\011\011\011<bpmndi:BPMNEdge bpmnElement="flow6" id="BPMNEdge_flow6">\015\012\011\011\011\011<omgdi:waypoint x="463" y="107"></omgdi:waypoint>\015\012\011\011\011\011<omgdi:waypoint x="495" y="107"></omgdi:waypoint>\015\012\011\011\011</bpmndi:BPMNEdge>\015\012\011\011\011<bpmndi:BPMNEdge bpmnElement="flow7" id="BPMNEdge_flow7">\015\012\011\011\011\011<omgdi:waypoint x="535" y="107"></omgdi:waypoint>\015\012\011\011\011\011<omgdi:waypoint x="590" y="107"></omgdi:waypoint>\015\012\011\011\011\011<bpmndi:BPMNLabel>\015\012\011\011\011\011\011<omgdc:Bounds height="11" width="100" x="-22" y="-17"></omgdc:Bounds>\015\012\011\011\011\011</bpmndi:BPMNLabel>\015\012\011\011\011</bpmndi:BPMNEdge>\015\012\011\011\011<bpmndi:BPMNEdge bpmnElement="flow8" id="BPMNEdge_flow8">\015\012\011\011\011\011<omgdi:waypoint x="642" y="135"></omgdi:waypoint>\015\012\011\011\011\011<omgdi:waypoint x="642" y="283"></omgdi:waypoint>\015\012\011\011\011</bpmndi:BPMNEdge>\015\012\011\011\011<bpmndi:BPMNEdge bpmnElement="flow9" id="BPMNEdge_flow9">\015\012\011\011\011\011<omgdi:waypoint x="515" y="127"></omgdi:waypoint>\015\012\011\011\011\011<omgdi:waypoint x="514" y="217"></omgdi:waypoint>\015\012\011\011\011\011<omgdi:waypoint x="323" y="217"></omgdi:waypoint>\015\012\011\011\011\011<bpmndi:BPMNLabel>\015\012\011\011\011\011\011<omgdc:Bounds height="11" width="100" x="10" y="0"></omgdc:Bounds>\015\012\011\011\011\011</bpmndi:BPMNLabel>\015\012\011\011\011</bpmndi:BPMNEdge>\015\012\011\011\011<bpmndi:BPMNEdge bpmnElement="flow10" id="BPMNEdge_flow10">\015\012\011\011\011\011<omgdi:waypoint x="250" y="300"></omgdi:waypoint>\015\012\011\011\011\011<omgdi:waypoint x="142" y="299"></omgdi:waypoint>\015\012\011\011\011\011<omgdi:waypoint x="142" y="135"></omgdi:waypoint>\015\012\011\011\011\011<bpmndi:BPMNLabel>\015\012\011\011\011\011\011<omgdc:Bounds height="11" width="100" x="10" y="0"></omgdc:Bounds>\015\012\011\011\011\011</bpmndi:BPMNLabel>\015\012\011\011\011</bpmndi:BPMNEdge>\015\012\011\011\011<bpmndi:BPMNEdge bpmnElement="flow11" id="BPMNEdge_flow11">\015\012\011\011\011\011<omgdi:waypoint x="270" y="245"></omgdi:waypoint>\015\012\011\011\011\011<omgdi:waypoint x="270" y="280"></omgdi:waypoint>\015\012\011\011\011</bpmndi:BPMNEdge>\015\012\011\011\011<bpmndi:BPMNEdge bpmnElement="flow12" id="BPMNEdge_flow12">\015\012\011\011\011\011<omgdi:waypoint x="290" y="300"></omgdi:waypoint>\015\012\011\011\011\011<omgdi:waypoint x="625" y="300"></omgdi:waypoint>\015\012\011\011\011\011<bpmndi:BPMNLabel>\015\012\011\011\011\011\011<omgdc:Bounds height="11" width="100" x="10" y="0"></omgdc:Bounds>\015\012\011\011\011\011</bpmndi:BPMNLabel>\015\012\011\011\011</bpmndi:BPMNEdge>\015\012\011\011</bpmndi:BPMNPlane>\015\012\011</bpmndi:BPMNDiagram>\015\012</definitions>', '0');
INSERT INTO "public"."act_ge_bytearray" VALUES ('1902', '1', 'leave/leave.png', '1901', '\211PNG\015\012\032\012\000\000\000\015IHDR\000\000\002\327\000\000\002E\010\002\000\000\000\231BLB\000\000T`IDATx\234\354\335\011x\024U\272\377q\006\227\341\177\237\231+\314\205Q\034\307{\021G\346\336q\003\361\252w\034QPF\331\004\221E6A\366}M\330\222\260\313"\012n#\233\002\016\002\303&\210\022\300\010\204-\011IX\302\222\004\022 !\010\030\004b\200,\335\235\376\277]\2254M\002\241\003iNW\237\357\347\251\247\236\323\325''\225:Uo\235\376\321\351\204\012N\000\000\000\025*\250>\000\000\000\240)R\010\000\000P\203\024\002\000\000\324 \205\000\000\0005H!\000\000@\015R\010\000\000P\203\024\002\000\000\324 \205\000\000\0005H!\000\000@\015R\010\000\000P\203\024\002\000\000\324 \205\000\000\0005H!\000\000@\015R\010\000\000P\203\024\002\000\000\324 \205\000\000\0005H!\000\000@\015R\010\000\000P\203\024\002\000\000\324 \205\000\000\0005H!\000\000@\015R\010\000\000P\203\024\002\000\000\324 \205\000\000\0005H!\000\000@\015R\010\000\000P\203\024\002\000\000\324 \205\000\000\0005H!\000\000@\015R\010\000\000P\203\024\002\000\000\324 \205\000\000\0005H!\000\000@\015R\010\000\000P\203\024\002\000\000\324 \205\000\000\0005H!\000\000@\015R\010\000\000P\203\024\002\000\000\324 \205\000\000\0005H!\000\000@\015R\010\000\000P\203\024\002\000\000\324 \205\000\000\0005H!\000\000@\015R\010\000\000P\203\024\002\000\000\324 \205\000\000\0005H!\000\000@\015R\010\000\000P\203\024\002\000\000\324 \205\000\000\0005H!\000\000@\015R\010\000\000P\203\024\002\000\000\324 \205\000\000\0005H!\000\000@\015R\010\000\000P\203\024\002\000\000\324 \205\000\000\0005H!\000\000@\015R\010\000\000P\203\024\002\000\000\324 \205\000\000\0005H!\000\000@\015R\010\000\000P\203\024\002\000\000\324 \205\000\000\0005H!\000\000@\015R\010\000\000P\203\024\002\000\000\324 \205\000\000\0005H!\000\000@\015R\010\000\000P\203\024\002\000\000\324 \205\000\000\0005H!\000\000@\015R\010\000\000P\203\024\002\000\000\324 \205\334@tt\364\350\321\243k\327\256}\337}\367\335q\307\035\025t%c\2273 \347A\316\206\234\023\325\227\005~\204{\304\304=b-\324\255Iy\335\222B\256+))\251E\213\026\017?\374\360\360\341\303w\356\214:\236\226\236\227o\313\267\311b7\026w\343\232\017Kn\267v\377\274\374|9\003r\036\206\005\005\3119i\336\274ybb\242\352K\004\305\270G\270G\254\210\272\365\253\272%\205\\\333\356\335\273+U\2524y\362\344\31399R\237\306\005s\255m6\263X\257\261\330\354\356v\200\367\227s2e\312\224j\325\252\255[\267N\365\205\2022\334#\334#VD\335\372[\335\222B\256A.@\205\012\025"##\215\253\225o\244d\327%+j\033k\273-\377\352-\236\213\016\3757l\334 gIni\325\227\013\012p\217p\217X\021u\353\207uK\012).))\351\367\277\377\375\306\215\353\363my6[^\276-W\026\263Q\354\241\253\203=\317\354\346nh\325?2r\313\257\177\375k\336v\326\015\367\010\367\210\025Q\267\376Y\267\244\220\342Z\264h1y\362$\343\362\310\265\311q5\354\271E\027\254\260]\264%\307\334^\330M\313\376S\246Ln\366zS\325\027\015\267\025\367\010\367\210\025Q\267\376Y\267\244\220\253\304\304\304<\364\320C9\271\027\345\032\330dq]!Y\347\344\027\265\315\305f\256\355\356F\256\266\375/\347d\327\254\371\020\277\021\240\017\356\021\356\021+\242n\375\266nI!W\011\011\011\011\016\016\266\331.\033W\353\262,\365\376\336\330\313\337w2\373\273\256_\321\227_i\330\215\215f\007{\216\347\376\003\240\177P\320\220\321\243G\253\276t\270M\270G\270G\254\210\272\365\333\272%\205\\\245v\355\332;vD\346\333.\031W\345\322\213/7\374\321\351<\356p\036\2669\017\3469\367\3469c\263\3553V\376\260!\343BL\2763:\307\031\223\343\334v\311\2711\327\371\341\266\204\356=z\032\227\360\262\373\313=\333\346\303+m[\341S\001\320\177\347\316\255O>\371\204\352K\347[\221\221\221\377\361\037\377\261e\313\026\325\007\242\036\367H\340\335#:\2247u\353\267uK\012\271J\365\352\325\217\037?b\263_2\027I\301\331N\347\305\002\347\005\273\363\347|\347%\247s\310\250\260\012\025\177\363l\303\346\0316gz\2363=\327y,\307y\304\356\\\266s\257t\266\271\256\342E\363k]\015\233\261\037\333%\263\221\357~X\264\377\300\350\237\226\236r\357\275\367\252\276t>$\263\363\357~\367\273\025+W\312L\275y\363f\325\207\243\030\367H\200\335#\232\2247u\353\267u[\016)d\317\236=c\306\214i\322\244I\235:u\356\273\357\276\273\356\272K\326\322n\334\270\261l\227go\375[\3346w\334qG^~\266\315u\221.\3125\220\342\273\344p\3469\\O\331\013\\\353o\276[\177\177\315GGO\234nw:\177\261;/\330\234?\333\234\347\235\316\215\273\366\271*\325n\\f\327\305\276h\\\362\302\375\024>\364l\024m\017\200\376\371\371\331\025+VT{\341|\307\234\243#"~\310\267\331\177\370a\223\217f\352\224\224\224\035;v\354\332\265+...\336\020\033\033\033\025\025\225\234\234\\\254\247<\025\026\026V\356\007\340=\356\221@\272G|T\336~X\317\324\255\337\326\355\315\247\220\013\027.\214\0301\342\301\007\037\254Y\263\346\320\241C\327\256]\033\025\025}<-=7\317\365\207\330\244\275z\315\032\331.\317\376\361\217\177\224\236\322\277\034\217\333G\214\314\373\213\315.\305\232-kyx\321\356<{\331\231\357(\354p\376\374\371\017>\2365\341\275\217\323O\236\222\207\266\002g\276Q\301;\342\366\026~\255\361\205\205;)\331pu\270\262\377\200\351/cWw\321|\310s\2166\027\037\005\221\341\303\207\317\2325k\365\325\346\314\231\323\257_?\367\221\214\0349\262K\227.\357\275\367\2364&M\232\324\250Q\243\340\340\340\333\377\231G\356\221\200\271G|W\336~X\317\324\255\337\326\355\315|\203\234\234\234\0313fT\253V\255g\317\236{\366\356\273\316_\207\275\262\354\335\227\320\255{w\351\377\301\007\037\310\327\226\373\030\312\221\221y\345\354g\231kW\245:\234?]r\236\316v\332\234\316\374\274\274?\327\252U\241\302\035\025*Tz\363\255N\236_\030\033\277\373\312\327\026^N\367~<\032v\317\355Y\001\323\337\017g\330[Wr\216v\317\324\262\275|\177\210.\023\361\326\255[e\246^\277~\375\306\215\033e-\355m\333\266\015\0336L\236\315\314\314\224\1772\356\337\277\277u\353\326\362}\023\023\023\247L\231"\023\367\201\003\007\366\354\331s\356\334\271r<\222\033\342\036\011\214{\304\247\345\355\207\365L\335\372m\335\226\371\033ddd\324\255[\267I\223&\222-n\230?\212e\221\306\215\233<\375\364\323\262\007_\214\244\\\030\325\226e\234}\271\014Y\346\273v\222\227O\376\342<\223\353\214=\220z\357\275\367\336q\347\335\377\357\236\252m\333]U\251\273\342\342\245\263\335u!\263\354\366,\317\235\330\355\205\015Y\233\035<\236\012\220\376\3766\303\336\272\353\315\321\346"\333\313\367\323|2k\307\304\304DEE\311,\274o\337>Y\313\303\330\330X\371\327\241\323x\177{\311\222%c\306\214\221\177b\216."\355\261c\307.^\2748--\255\274\016\303\033\334#\001p\217\370\272\274\375\260\236\251[\277\255\333\262}\203\364\364\364j\325\252\275\367\336{e\312\037\236\313\344\311S\252W\257\356\267\277:o\274\363v\301u1\354\027\314\013p\271\300\371s\216+/\377\224\353\214\330\225\370\330\023OU\255\366\373{*W\231\265pY\256\323\231\235\347\274\224\347\372\302mQ\273\012\277\326\365\345\205k\343\222_\331b\\\362\013\236\373\017\230\376~5\303\336\272\322\347h_\004\021\231\265SSS\227.]:j\324\250\260\2600\231\224\227/_~\374\370qs\3266\265k\327n\243\007\371\367e\373\366\355\313\345\273\227\011\367\210\325\357\221\333P\336~X\317\324\255\337\326m\031\276\201D\0079 )\246\233\216 \346\262b\345J\331\217\004\032\337\215\352\246\031\325v\336\356\2720\347e1/\200\024\353\005\233\363\\\276\244f\333\216\204cO\324\251\373\322+\257\235\311s\236\316q\236\311q\236\315sJ\255n\2131*\325n^`\327b\\]cW\366\302\265\315s\243\261\377\200\351\357?3\354\255\363f\216.\367 b\316\332\203\007\017\316\314\314t\032\037\272\032:th\311Y\373]\017\223&M\352\330\261\343\255\177\353\262\342\036\261\364=r{\312\333\017\353\231\272\365\333\272\365\366\033dddT\257^}\365\352\325\267\030A\314e\311\322\245\325\252U\363\303\037\315\030\325v\336\2706r%\316\275P\357\205}\207\016\307&$F\355I\334\036\237\270}w\362\216})\233b\016\356L8\032\031\237\2745>i\373\356\244\250\275\311\011\207\323>\235\375\371\233\255Z\231_e3\327\266\363\236\017\215v\321\303\242\375\007L\177?\231ao\235\367st\371\006\021s\326\016\012\012*e\326\0360`\300\204\011\023\334\263\366\370\361\343e\226\277\305\357{\023\270G\254{\217\334\266\362\366\303z\246n\375\266n\275\372\006999u\353\326\275\225\037\304\224\\&O\236\362\364\323O\373\333\207U\215\237\377\311\0058g\\\006\271\006\347\372\366\355\351\315\037\327{\343\215\226f\177{\321b\363\330\217g\243\330\376\003\243\277?\314\260\267\256\254st9\006\021s\326\2367o\336\270q\343\314\031y\376\374\371\236\263vzz\372\252U\253BCCsss{\366\354i\276\225(\317&%%\225\303\310\313\202{\304\242\367\310\355,o?\254g\352\326o\353\326\253o0c\306\214&M\232\224c\0041\227\306\215\233|\360\301\007\276\036a\231\030\225\372\263\315~\326\356Z~6\3336\233\253m\254\315\215\205[\\\015c\013\375\225\317\260\267\256\344\034}\372\314O\245T\257\347\263\267\036Dd\376MII)\266Qf\344\021#F\230\355\016\035:$''''\233oY\237={6<<|\356\334\271\021\021\021\257\276\372\352\311\223''o\372\373\336\004\356\021+\336#\267\271\274\375\260\236\251[\277\255\333\033\177\203\254\254\254\252U\253\226\3657b\274Yd\237\262g\277\372;"\306\273v\231\306e\220\253\222i\263\025\266\335[<\037\032\2270\223\376\262X=\205\224\234\243CBC\357\277\377\376C\211I\327,]\331.\317J\237\362\012"C\206\014IHH\360\334"\363u\275z\365\314\277\334\220\221\221\361\311''\237HCR{\237>}\344\037\232\303\206\015\353\334\271\363\345\313\227O\235:e\263\331n\371\004\224\001\367\210\345\356\221\333_\336~X\317\324\255\337\326\355\215\277\201\224H\317\236=\313=\202\230K\267\356\335\335\351\330\037\030y9\363\232\213\315\335\260]\273\203\316\375-\235B\2569G\233o\306^s\2466\347h\263C9\006\021\253\340\036\261\326=By\233\250[\277\255\333\033\177\203?\376\361\217\276x#\304\375v\310\003\017<\340\353Az\317\250\324\237l\266\237d\355j\330\315F\246\275\260\341ng^\325M\373\376\326M!\245\314\321\327\234\251=\347\350\300\233\251\275\301=b\241{\204\362v\243n\375\266no\360\015\366\354\331S\263fM\037E\020sy\350\241\207\374\347\377\2321*\365\214q\366\317\024]\2523\306%qo<s\315\016\232\367\267h\012\271\346\017\313\213\315\302\2363u\3119\332|\266|?#\342\347\270G\254r\217P\336\236\250[\277\255\333\033|\2031c\306\014\035:\324\247)d\320\340\301\362]|=N7\233\3156u\352\324\005\013\026\230\277BVLQ\245\232\313ic\361|x\246\304r\232\376\262\370U\012)\375\022\273]\357W\006\2567\027\207\257\337P\312\014\356\271Xw\2466q\217\370\363=By_\017u\353\317u[\212\033|\203&M\232\254]\273\326\247)d\365\2325\215\0337\366\3658\335V\032\1773M\334y\347\235\203\007\017\316\313\313\363|\326\250\324SE\327\300\335(\271\270\236r8\212u\323\267\277_\245\220\322/\261\251\364\337Z\274\346L]\261bEo\346h?\237\251\275\301=\342\317\367\010\345}=\324\255?\327m)n\360\015\236z\352\251\235;\243|\232B\242\242\242k\327\256\355\353q\272eee\271\3577iT\251Re\315\2325\356g\215J\375Q\256\201\303q\312\341\272\022?\232\213<,\3360\236-\352\243{\177\277J!\245_b\247w\1778\341\2323\265\227s\264?\317\324\336\340\036\361\347{\204\362\276\036\352\326\237\353\266\0247\370\006\325\253W?v<\315\247)\344xZ\372\275\367\336\353\353qz\252\345\372\277\023\257\220\340\374\354\263\317\232\377\205\222Q\251''\215\263/\353\223\016\327\245\372\321\275\305\341\261\335\334\350nh\336\337\257R\210\263\324K\354\375\337n*e\246\276\341\034\355\2673\265\227\270G\374\371\036\241\274\257\207\272\365\347\272\275\236\033|\203\273\356\272+7/\337\247)D\366/\2652v\354\330R\202\371\355\344\272\000\016\3632\234,\274\036%\036:\256l\317\240\277<\224\363\346?W\260te\372\363\221\341\3537\224|\247Z\266\310v/\367\360\303\017\233d\246\266\312\311\361\222%j\322\337\372W\270-\367\010\345]\012K\324\211\277\365\257\240<\205\004\344{!\225+W6\213\262R\245J\355\333\267\177\350\241\207Z\264h\341\316\313\016\207\\\214\214\302\265\353\302\024.\305\2668\212\326\364\227\3456Tj\231\224r\211###e\246\376>"\342\206\225\031\220\377X\364\022\367\210?\337#\224\367\365P\267\376\\\267\327\243\335\347B\366\354\331c\226i\303\206\015_y\345\225\2325k\206\207\207\273\237uU\252\375\204\335X\244!\327\303\275.\334\3500/\2224\212\036z\364\277p!i\360\240\356\346\306\314\314\375II[\217\036\215NL\334\232\235}X\372\237>\275\257u\353\246\347\317\035\262\331\32232\3423\177J\370\371\347\203\262>{\366\200{''\262\275}\3737\244\261s\3477\0337.\335\274y\305\346M\313\245\021\037\277A\372\034<\270e\324\310\376aa\203\307\214\031"\2134BC\007M\235\032R\362x\276\375\366\313i\323BJ\036\377\2313\011\035;\276)\215o\276Yp\350P\244<%\373\221\303\273\271\361\272\373\373U\012)\375\022;\275\233\251\003\362\007\347^\362\351=\342}\377\036=:\344\346\034-\245\377\213/>W\312\376\2773n\201\222\373w\335\002\035ZJc\315\232\005\211E\267\300\305\213G\312\375\370}t\217P\336\327\343''u{\275\376\275{w\222\227\203K\227RRRv\310\303\277\377\375\305\234\313\251G\216\354p\275:\030={\365\354\030\021\361\257\235;\276\221\311_\266\313\234\277w\357\367\007\016l\366\321\361\370\317\334~\343\337\221\371\272\234\376\037\335\353-\262\377F\215n\337\357\310DDD\310i\255[\267\356=\367\3343q\342\304k}\216:]\256\212\243\360\332\244\273\036\026\256O\030\333\013\333E\335\322\315\206\335\226\336\243G\373\221#\373\277\362\312\013\022\024z\366\354\370\217\177Ln\337\276\305\364\351\241\217=\366\347\213\256\227\371\364\334\334\2431\321ken\315\311I\355\337\257Kpp\357\021#\372\365\353\327E\212\317\275\377aC{\266k\327\342\330\321h)\307\225+\3476l\370\302\322\245\377X\261b\316\216\355k\344\331\015\033\026\177\374\361\304\374\274cyy\307\362\363\216\347\347\037\227\366\233o66\217\347\344\311\370\372\365\377:`@\327a\303z\005\007\365n\336\374\325\240\240\336\322\0362\270{\275z\317\236\314\210\227=\330\362\217\313\376\245\377\350\321\003RSw\312\361\267i\323\354&\306[\254\277_\245\220\322/\261\251\364\231:P\177\211\300K>\272G\312\332\377\205\027\236-\326\377\340\201\315-[6\222\373e\310\220\036#\206\367\255U\253\346\360\341}\244\274\345v\223\355\311I[\257\334\002C{\006\031\267\200\334eA\303z\0156n\201\214\214\270+\267\200\343D\310\350\201r\013\330\315[\300\007\307\357\243{\204\362\276\036?\251\333k\366\317\314L\370\313_\036Y\270p\346\017\021\313\2324y\371\347\237\017\274\361\306k\362\212 %z`\377&WY\332\322\2326}e}\370"\251\355\345\313\346\214\034\331o\345\212\271_}\365\311[m\233\373\342x\374jn\277\3017\030;v\354\300A\203|\232B\006\015\036\034\022\032\352\353qzZ\267n\335\254Y\263\316\236=[\362)#/\2479\034ivY\033\215\302\265\303\243]l]\324?=-f\316\234\251\362p\356\334i\337~\273`\355\332\371\213\026}t\376\374\201\036\335\333\231=\373\367\357\262;>\274\330\3763N\354\222\355\346\376#\276_2qbp\326\205C2\245\356\212\371v\357\336\015M\233\276\234\260\357\373\335\273\303/_\226\177\253\245m\334\370U\203\006\317\017\031\322\275p\031\334}\320\240\256\222B\362\363\217\312\263\351\3511\375\372vv\357\277K\347\326\356\343\354\332\265\255<\373\315\232/\302\302\006=\361\304\377\214\036\335?,tPj\352vy\266\255+\205\310\327\356*\353x=\267\373U\012q\226z\211\335d\246\256R\245\212V\177P\301{>\272G\312\324\277q\343\006%\373''''E\016\034\370\316\264i\243g\314\030#\225,)\177\362\344\021C\207\364p\337\203\375\372uv\367\357\322\245\265{\017\256[ -\346\233o\276\220\3127o\201P\271\005R\266\313\263\346-p\342\304\256\362=~\337\335#\224\367\365\370C\335^\263\277D\341\345\313gE\355\\\223\222\262-v\327\267;v|-\223\274d\216\255[W\230\375en\227W\212M\233\376\265`\301\007\347\316\355\037=\252\277\271\207\036=\332\371\342x\374jn\347o\247^\305\250\324\343\256\305a\256\323\012\037\026m\264_i\273\236\362x\350Z\207\206\016\374%\353\320\333\235\336\264\345\037]\373\315\027\213\026}\370\341\207\343\266l^f\366\227\320`\274\360_\265\177W\012q\315\233\307\267o[\331\266m3)\301U+\347d\376\264w\305\212\331\257\275\366\322\227_\316\224\245Q\243\227\322\322\242\244\317\367\337/\2369sl\311\343\351\324\261\345\341\303[\245!\301\245\353;m\206\007\367\0369\262\357\237\377\374\260\254\245\335\371\355V\011\3736\312!ee\035\314\316N\222\303\373\371\354>\211#K\226|\262}\373\252\326\255\232\310\204\336\252U\343\223\031\273\312:^w\177\177K!^\342\217K\336\204[\274G\274\354\1771;\351\361\307\377\273d\377\270\270o\273u{+r\313rY\352\325{V\326[\266,o\330\360\005\367\376\367\355\333Xx\013\214(\274\005\202\335\267\200\355X\326\005\317[`\240\334\002\362zPx\013\274i\336\002\345s\374\376p\217P\336\236nO\335^\263\177|\334w\377\363?\177\222W\2071c\006\313<\337\274\371\337CF\367o\335\272iX\350\300W^\371\333/\277\034\222>\222\271])\344\207\245\215\033\327\0376\264\207\374\2036(\250\227\324p\367no\225\373\361\370[\335*\376\177d\366\354\335''\373\367\365 \275\347\252T\207y\031\2169\034\307\214\365qW\243pK\321v\317\206\261l\215\\\336\263g\273\240a=\207\017\357\335\257\337\333\275zu\350\333\247\223\244\220\267\3326KJ\332d\366\0372\244\333\321\243\333\213\355?#cW\377\376\235eK\312\221\255\247N\305\311\226Y\263\336\265\331\216\246\035\3379th\367\210\210\305_\177=w\330\260\036\351\222B\034\307d\226\354\324\251\245\364\227o\321\257\357\333\262\226\011\267C\207\0262\207\232;\214\215\375v\334\270\241\346\376\333\266mj\036\263t;~|\247\373\370\337~\273\345\312\225\263\207\007\367\232={\362\206\015\213\244\350w\354XU\326\361\026\353o\321\024\342\344?\332(\273\233\276G\312\324_*\377O\177\252\021\031\271\254X\377\230\230o\346\315\233&\005\374\3157_\374\337\377=\265j\325\354\257\276\372\350\323O''fg''\026\336\002\273\326\032\267\200\253\177\3336M\315\257\362\270\005\\\333\337~\373\315+\267\300\372\177\026\336\002\345z\374~r\217P\336n\267\247n\257\327\377\314\231\335owjy\350P\304\271s\011M\233\276\234\223\223\234\223sX\226f\315^\261\333\216.^\374\321\2301\203z\364h\267i\323\022\371\207\250\364\377\351\247=\207\223\267\244\246nKJ\332l\313O-\367\343\361\253\272\365\352\377\324\355\326\275\273\217R\210\3549(8\330\327\203\364\236Q\251r\001\216\312\272\300q\254\260m<\364h\034+\261\305\265\336\273g\335\214\031a\237|2^\326;w\256Z\373\315\347\213\026\315<\177>\241E\213\277\347\346$K\207!\203\273\035M\335Vl\377\031''\242\373\367{\333\3348p@\027\011\034\301A\275\036|\360\376\365\353\277\034:\244\333\272\357\026,_\376\331\260\241\335\323\323\243N\244Gm\337\2762>\356[\371F{\367\206\273\326{\326M\237\036"\273\335\271c\225t\220=\304\356\372\346\305\027\237\015\015\351\037\032:\340/\177yD\326\322\256[\367q\363Y\331\303\264i\243j\326\374\317\317?\2376jT\337\324\224\255\262\321\010+73^\317\376\326M!N\376\323\3212\272\225{\304\373\376]:\267\332\277\177c\2336Ml\266T\317\376\341\353\026J\354X\276\354\263U+g?\367\\\235\325_\317\221\245u\353&G\016o1\367\037\033\273\366\252[\300h\270n\201\264\235\322\301\270\005F\272o\001\363~t\205\225\362>~\377\271G(o\323\355\251\333k\366\277|)q\322\244\240\277\376\265\356\304\211A\337\256\375\342\205\027\236\2310a\250\261\014\373\357\377~X:\330m\251\362J\321\243\373[\233~X\322\260\341\013}zw\2343gr\203\006\177\235?\177\372\013/\374o\271\037\217\277\325\355\215\277AVVV\325\252U}\361v\210\354S\366|\341\302\005_\017\322{\306\273v\022<\217\026^\025\263\3558Z`\254\215+d\264\355\356-\251\356\3762\257-X0==}\347\206\015_N\177o\324\332\265\256\024"O}\362\361\270\365\341\013\245\277\353\275\220\324\255\305\366\237\221\021\335\277\377\333\236\373_\367\335\374O?\235\360\343\311\230\241C\273\315\235;e\307\366\025\303\206uO;\276#a\337\372Y\263&M\236<|\374\370!\013\346O\237o,\362\265]\273\266\231=\373\335\375\011\353\345kcw\255\0317n\260\271+cnu}\257~\375:\235H\227)\370\350\326\310e\341\341\013\273ti%\317\206\205\015H5\016\306\370\367\342\315\214\327\263\277\245S\210\363:3u)\237\3163g\352@\232\243\275w+\367\210\227\375\267o[>h\320;\262e\315\352\271c\306\014t\367\377\346\233y!\243\373M\235:\362\275i#%L<\366\330\237\247\031\215\227_\376\353\200\001\235e~7\202\270\334\002C\314\376E\011\333u\013H\012\221-[\267.\013_\267\240K\3477ecX\350\000#\210\247\272\272\225\353\361\373\333=By;oK\335^\257\277\315\226r\350`D\307\216-\366\356\371Nr\360+\257<\377\355\267_|\273\366sY$I\233\375\263\1779\320\243\307[\2336-Y\270\340}s''\3620\361P\204Ti\271\037\217\277\325\255W\337`\306\214\031\215\0325.\367\024"\373\234>\375}_\217\260L\214\274,g?\265\300X\273\226\302k\343\261\366x\350\356&\215/\276\230\366\355\267\237\313\366=\273\277\233>}\364\332o\346-Z4C\346\304\267\3326\333\265k\265l\0372\244\353\261\243[\213\355?\343D\224\361^\210k\207+V\374\343\263\317&v\354\320\302nO9s:V\342\260\374[0.\356\233\371\363\337;sz\227\331?5%\362\265\327^\334\270\361K\363\000V\255\234%\317\272\217''j\347\312z\365\236\011\015\225\177\377\3657\336\013\351o\274\027\362\330\221#\233\335\207mL\301\251\256)85\362\347\263\273\215)85\347\362\241_~\331_\246\361z\236\037\253\247\020\347u~\210^J\365\006\306\017\313o\302\255\334#\336\364\337\263\373\333\246M\033dg\0370\373\217\032\325GB\266\273\303\207\037\216\0319\242\267\374\313R\302\307\343\217\377\371\375\367G\177\360\376h\231\326\217\035\333f\366\337i\336\002!\327\275\005\244[\227.\306-\340\012\342\221g\345\0260\362\372e\271\005\262\256q\013\224\365\370\375\363\036\241\274}]\2677\354\337\247w\207s?\357=zt\353\253\257\326\213\211\371zW\314\327\262\226Z5\373K\301\033\357\205,\226\351}\330\320\356\362jr`\377\206Z\265\036\222\372\364\321\361\370O\335z\365\015rrr\352<\365\324\224)S\3131\202\310\336d\237\277d_\364\365\010\313\304\250\324\024\207=E\326\256\213\341n8R\314\305l\027n\261\027n4\033\237\317\233\362V\333\246\241\241\375$\303N\235:|\315\2329\222B\306\204\015X\267\356\013\263\377\340A\357\034=\032Yl\377''N\354\350\337\377m\367\376\347\272\222G\343_\262\022rr\016\015\034\3209<|\376\264i#d\272\264\331\016\273\217\347\362\245C\275{\267\317\313K\222\366\362e\237\316\237?\315}<\247O\307\034:\264\321\354\366\346\233\257\231\215\324\224-\331\331\373\335\307\337\271sKY\017\036\374\216\304\235\340\340\036\322\315n;\262i\323W\023\306\017)\323x=\317O\000\244\020gY\376\372\265\347\022\030s\264\367n\345\036)\275\277\335~d\366\354I\215\032\275x\356\334\036w7)\316\267\337~#$\244\237\334\021\305\3727o\376\212\331m\333\266\177e\376\024gn<}\312u\013\230}\\\267\200\2611%e\363\305\354\003\356\303\220[@\032\256[\240c\213\340\240\036\346\235"\267\300\370\361\203o\345\370\375\374\036\321\274\274}W\267^\366\357\320\241\371\353\257\277\362\317/?\220\265\273\277\253mt;\367\363\236\036=\332\376\020\261h\301\002\371We\312/\277$t\352\364F\257^\355\006\015\352\222\233\233\350\213\343\361\237\272\365\366\033dddT\255Zu\311\322\245\345\022AV\254\\y\337}\367\035;\236\346\323\261\335\004\243R\345\365\376\210\303\356Z\273\033\205k\243Q\274C\321\303o\327\316\215\335\365\2654~<\2713\342\373/\027\375\363\375E\213>\360\354\337\275{\233cG\267x~\371\332o\346\274\370\3423\013\346O\363\334\177T\324\362\245K>|\365\325\027\242\243V\230\373_\276\354\3439s&\025;\236S?F=\363\314\223O>\371\337\273w\257\271\346\361\324\257\377\\\261\343\377\345\227}\177\377\373\337>\372(L\332\203\007u\331\237\260N\032\377\374\347\373]\273\266\352\325\363-9\3542\215\327\363x\224\317\260\345\245\2543u\300\314\321\336\273\225{\244\364\376[#\227\004\005u\317\313=T\254\277\335\226<&\254\377\366m\377r\367\377\344\223\261\365\352\375oXX\377\322\367/\267@\261\343\311\276\321-p+\307\357\377\367\210\316\345\355\273\272\365\246\277\335~\270K\347\226\307\217GJ\273E\213\206\262\316\317K\354\330\261\371\323O?nvH;\276\265G\367\266\253\277\2365\177\376\324M?,z\355\265z{v\177#;\374\342\363)\313\376\365q\271\037\217_\325m\031\276Az\272\353\017\230H\200\270\305\010"QF\366\263}\373\016\337\215\352\246\311\201\025\270\256\204kq8\314\213T\264\266_\331^rc\311\376\2719\007\363\363\016y\366\277t1A\346S\317\376\271\271\007m\371\211\327\334\177N\316\201\322\367oL\251{K9\236#G"n\345\370\313\324\337\037f\330\362\342\375L\035Hs\264\367\312\361\036\271\351\376\027/&\310\335t\303\376G\016G\334\236\343\261\320=\242my\373C\335\226\322???1\353\302n\363)[~\222\303\236\254O\335\226\355\033DGG\337w\337}\267\362\243\031\371\332\252U\253\246\036=\346\223\321\3342\343\023L\311\016\207T@\262Q\007F\243\344\272\260\317a\217\266\326\375\375d\206-/\336\314\324\0016G{\217{\304\352\367\210\236\345M\335\372m\335\226\371\033ddd\324y\352\251F\215\032\227\365\267f\244\277|\225|\255\037\376 \306\315\310\313I\306b^\006\311\244\205\017\335\015w\007\307\325\017u\356\357?3ly)}\246\016\2749\332{\334#\001p\217hX\336\324\255\337\326\355\315|\203\234\234\234\351\323\337\2272\355\326\275\2737YD\372HO\351/_\345o\037G-\306\370\331a\242q%\022\213\032If\243\330\366b\317j\336\337\257f\330\362r\275\231: \347h\357q\217\004\306=\242[yS\267~[\2677\377\015\262\262\262F\216\034\371\300\003\017<\364\320C\003\007\015\372z\365\352\235;\243\216\035O\313\315\313\227\265\264e\313\240\301\203\345Y\351\023<|\270\364/\307\343\366\021#/''z\2778\034\207\350_\340\1773ly)9S\007\352\034\355=\356\221\200\271G\264*o\352\326o\353\266\034\276\301\236={\306\216\035\353\372iK\235:\367\335w\337\235w\336)ki\313\226\220\320P\377\371?b\274q\307\035w8\354\007\013\\\327\343\220\303Q\330p/\356-%\237\322\271\277\234\261\212\025+\252\276t\276\3429S\007\360\034\355=\356\221@\272G\364)o\352\326o\353\326\357\342\271Z\325\253W?\221\276\251\300q\300\\\234\005\007\215\306Ac9pu\373`Q\207\203\232\367\3178\261\371\336{\253\252\276t>d\316\324+V\256\014\3409\332{\334#\001v\217hR\336\324\255\337\326-)\344*\265k\327\216\211^\342\276\022\005\216\375\036\213\\\030\367F\327\332y\245\203\326\375\345\214=\371\344\237U_:\337\212\214\214\2249Z\326\252\017D=\356\221\300\273G:w\356\034\360\345M\335\372m\335\222B\256\022\022\022\022\024\324\305Y \027 \301}\315\234\262\024x^\302b\017\0234\357?<\370\235\321\243\272\253\276t>7v\354X\325\207\340\027\270G\002\357\036\361\303\317\254\224;\352\326o\3536\360\213\257Lbbbj\324x ?o\267\323u%\344\222$\030\227\244p\361|X\374)]\373\313\271\252Y\363\217Q;\027\251\276t>\247\303L\355\015\356\221\300\273Gt\250m\352\326o\3536\360\213\257\254Z\264h1m\352\340\002\307>\247c\237k]\340j\030\327\251h\213\261\261\240\360\331\004c\331\247m\1779W-\232\327W}\321n\007\035fj/q\217\004\330=\242ImS\267\376Y\267Z\024_\231$%%\375\372\327w\357\330\266\300u\315\\\227d\257,Nc\355j\270\267\\yj\237\331A\303\376?D\314\251V\255\312\241\203_\253\276h\267\203&3\2657\270G\312z\217$\036Z\255\372\242\225F\223\332\246n\375sn\327\242\370\312j\367\356\335r[F|?\273\300\261\307Y`^\025\327\342z\350(j\024m1\333fC\253\376\333\267\315\227\263\264\356\273OT_\256\333D\223\231\332K\334#\201t\217\350S\333\324\255\037\326\255.\305WV\353\326\255\373}\265*\323\246\016\264\345\355*p\354v\026\3546\327N\307\356\253\036\032[\256j\024\353\020\210\375m\371\273\344\314T\372\365\335\273\343\027\253\276P\267\217>3\265\227\270G\002\346\036\321\252\266\251[\177\253[\215\212\257\254\222\222\222\2327\177\351\241\032\177\010\016z{W\364\227\031\351\341\005\2168\343R\305\233\353\002i\270\332W7\012\012\237uz\266\255\337\277\300\036w"=<&japP\247\0325\376\320\242\371KI\211+U_\242\333J\253\231\332K\334#\201q\217\350V\333\324\255_\325\255^\305w\023bbbBFw}\362\311Z\325\357\253zG\305\212\025t%c\2273P\373\311Zr6b\242\027\252\276,\012T\320l\246\366\036\367\210\311\272\367H\005-k\233\2725)\257[\035\213\317\242\370{\025jU\320r\246\206\016\250m\2654\237\333)>k\370\374\363\317e\246HKKS} \372b\246F\240\242\266\325\322\374\374k=x\253\310\311\311\371\267\177\3737\251\324\246M\233\252>\026}i>S \200Q\333ji~\376\265\036\274U\264o\337\336\374\001^\225*U\302\303\303U\037\216\2464\237)\020\300\250m\2654?\377Z\017\336\022\022\023\023\177\365\253_\231)\344\256\273\356z\360\301\007\363\362\362T\037\224\2164\237)\020\300\250m\2654?\377Z\017\336\022j\325\252\345\371y\346\373\356\273o\302\204\011\252\017JG\232\317\024\010`\324\266Z\232\237\177\255\007\357\377\314\277\364W\314o\177\373\333\314\314L\325\207\246\035\315g\012\0040j[-\315\317\277\326\203\367\177\023''N\224\002}\354\261\307\0324h \215\007\036x@\326\217>\372\350g\237}\246\372\320\264\243\371L\201\000Fm\253\245\371\371\327z\360\376/""B\012\364\337\377\375\337\315\017\250\312\3727\277\371\2154\326\255[\247\372\320\264\243\371L\201\000Fm\253\245\371\371\327z\360\226\020\023\023\223\225\225\345,\252Tio\336\274Y\3611iI\363\231\002\001\214\332VK\363\363\257\365\340\255E\363JU\216\363\217@Em\253\245\371\371\327z\360\326\242y\245*\307\371G\240\242\266\325\322\374\374k=xk\321\274R\225\343\374#PQ\333ji~\376\265\036\274\265h^\251\312q\376\021\250\250m\2654?\377Z\017\336Z4\257T\3458\377\010T\324\266Z\232\237\177\255\007o-\277\372\325\257T\037\202\3264\237)\020\300\250m\2654?\377Z\017\336Z4\257T\3458\377\010T\324\266Z\232\237\177\255\007o-\232W\252r\234\177\004*j[-\315\317\277\326\203\267\026\315+U9\316?\002\025\265\255\226\346\347_\353\301[\213\346\225\252\034\347\037\201\212\332VK\363\363\257\365\340\255E\363JU\216\363\217@Em\253\245\371\371\327z\360\326\242y\245*\307\371G\240\242\266\325\322\374\374k=xk\321\274R\225\343\374#PQ\333ji~\376\265\036\274\265h^\251\312\335\372\371OII\331\261c\307\256]\273\342\342\342\342\015\261\261\261QQQ\311\311\311\305z\312Saaa\267\370\355\000/1\267\250\245\371\371\327z\360\326\242y\245*W\372\371\317\316\316n\332\264i\227.]z\365\352\325\247O\237\327_\177\275M\2336\275{\367\356\326\255[\353\326\255\327\254Y#}\206\017\037>k\326\254\325W\2333gN\277~\375\314\235l\331\262e\344\310\221\262\223\367\336{O\032\223&Mj\324\250Qppptt\364\355\030!t\305\334\242\226\346\347_\353\301[\213\346\225\252\234\367\347\277\240\240\340\371\347\237?\177\376|\261\355\022,\266n\335*\311c\375\372\365\0337n\224\265\264\267m\3336l\3300y6333>>~\377\376\375\222Z$\216$&&N\2312E\202\310\201\003\007\366\354\331s\356\334\271r\036\017P\204\271E-\315\317\277\326\203\267\026\315+U9\357\317\377\204\011\023\376\360\207?dee%$$xn\227\024\022\023\023\023\025\025%\251b\337\276}\262\226\207\261\261\261\301\301\301N\343\3475K\226,\0313f\314\360\341\303G\027\221\366\330\261c\027/^\234\226\226V\376C\002\014\314-ji~\376\265\036\274\265h^\251\312yy\376\247M\233\326\247O\237\026-Z\2349s\346\205\027^\210\210\210p?%)$55u\351\322\245\243F\215\012\013\013\223\220\261|\371\362\343\307\217\233)\304\324\256]\273\215\036\326\257_\337\276}\373\362\037\014\340\201\271E-\315\317\277\326\203\267\026\315+U\271\033\236\177\311\023\315\2325\223HQPP )D\266dee\325\257__\222\204\331\301L!\203\007\017\316\314\314\224\207\027.\\\030:th\311\024\362\256\207I\223&u\354\330\321gc\002\\\230[\324\322\374\374k=xk\321\274R\225+\375\374\247\245\245=\362\310#k\327\2565\037\232)D\234;w\256n\335\272\031\031\031\316\242\024\022\024\024TJ\012\0310`\300\204\011\023\334)d\374\370\361\222Z|5$\300\300\334\242\226\346\347_\353\301[\213\346\225\252\334\015\317\177~~\276\273\355N!\342\342\305\213f\303L!\363\346\315\0337n\234\2310\346\317\237\357\231B\322\323\323W\255Z\025\032\032\232\233\233\333\263gOy(\033\345\331\244\244\244r\036\014\340\201\271E-\315\317\277\326\203\267\026\315+U\2712\235\377\327_\177\275\344F\311\023)))\3056J\302\0301b\204\331\356\320\241Crr\262\371#\230\263g\317\206\207\207\317\235;7""\342\325W_=y\362\344\315\0368p\003\314-ji~\376\265\036\274\265h^\251\312\225\351\374?\367\334s%7\016\0312\244\330o\315H\376\250W\257\336\346\315\233\245\235\221\221\361\311''\237H\343\203\017>\350\323\247\317\310\221#\207\015\033\326\271s\347\313\227/\237:u\312f\263\335\322\321\003\327\307\334\242\226\346\347_\353\301[\213\346\225\252\034\347\037\201\212\332VK\363\363\257\365\340\255E\363JU\216\363\217@Em\253\245\371\371\327z\360\326\242y\245*\307\371G\240\242\266\325\322\374\374k=xk\321\274R\225\343\374#PQ\333ji~\376\265\036\274\265h^\251\312q\376\021\250\250m\2654?\377Z\017\336Z4\257T\3458\377\010T\324\266Z\232\237\177\255\007o-\232W\252r\234\177\004*j[-\315\317\277\326\203\267\026\315+U9\316?\002\025\265\255\226\346\347_\353\301[\213\346\225\252\034\347\037\201\212\332VK\363\363\257\365\340\255E\363JU\216\363\217@Em\253\245\371\371\327z\360\326\242y\245*\307\371G\240\242\266\325\322\374\374k=xk\321\274R\225\343\374#PQ\333ji~\376\265\036\274\265h^\251J\330l\266E\213\026eee9\213\316\377\236={v\354\330\241\372\270\200\362\304\334\242\226\346\347_\353\301[\213\346\225\252\304\370\361\343\345\264W\254X\261V\255Z\322\250\\\271r\005\203\371\277\340\002\201\201\271E-\315\317\277\326\203\267\026\315+U\211\211\023''V(\341\231g\236\011\017\017W}h@\271anQK\363\363\257\365\340\255E\363JU\342\354\331\263w\336y\247g\004i\330\260\341=\367\334\223\231\231\251\372\320\200r\303\334\242\226\346\347_\353\301[\213\346\225\252\312\220!C*V\254hF\220J\225*I\012\2310a\202\352\203\002\312\023s\213Z\232\237\177\255\007o-\232W\252*yyyU\252T1SH\373\366\355\037~\370\341\334\334\\\325\007\005\224''\346\026\2654?\377Z\017\336Z4\257T\205\326\254Yc\376\\\246F\215\032|"\004\201\207\271E-\315\317\277\326\203\267\026\315+U\255g\237}V\316\177\363\346\315U\037\010P\376\230[\324\322\374\374k=xk\321\274R\325JKK\223\363/k\325\007\002\224?\346\026\2654?\377Z\017\336Z4\257T\3458\377\010T\324\266Z\232\237\177\255\007o-zVjtt\364\350\321\243k\327\256}\337}\367\335q\307\035%\377z\207&d\354r\006\344<\310\331\220s\242\372\262 \240T\320rn\361\037\232\237\177\255\007o-\272UjRRR\213\026-\036~\370\341\341\303\207\357\334\031u<-=/\337\226o\223\305n,\356\3065\037\226\334n\355\376y\371\371r\006\344<\014\013\012\222s\322\274y\363\304\304D\325\227\010\001B\267\271\305\337h~\376\265\036\274\265hU\251\273w\357\256T\251\322\344\311\223/\347\344H\3660^\214]k\233\315\014"\327Xlvw;\300\373\3139\2312eJ\265j\325\326\255[\247\372B!\020h5\267\370!\315\317\277\326\203\267\026}*U^\\e\260\221\221\221\306+q\276\361\016\210\353\345\270\250m\254\355\266\374\253\267x.:\364\337\260q\203\234%\211k\252/\027,O\237\271\305?i~\376\265\036\274\265hR\251III\277\377\375\3577n\\\237o\313\263\331\362\362m\271\262\230\215b\017]\035\354yf7wC\253\376\221\221[~\375\353_\363\243\031\334"M\346\026\277\245\371\371\327z\360\326\242I\245\266h\321b\362\344I\306K\257\274\356\346\270\032\366\334\242\027\343\302v\321\226\034s{a7-\373O\2312\271\331\353MU_4X\233&s\213\337\322\374\374k=xk\321\241Rcbb\036z\350\241\234\334\213\362\372j\223\305\365\352+\353\234\374\242\266\271\330\314\265\335\335\310\325\266\377\345\234\354\2325\037\342\267fp+t\230[\374\231\346\347_\353\301[\213\016\225\032\022\022\022\034\034l\263]6^\211/\313R\357\357\215\275\374]V\263\277\353\265\271\350\313\2574\354\306F\263\203=\307s\377\001\320?(h\310\350\321\243U_:X\230\016s\213?\323\374\374k=xk\321\241Rk\327\256\275cGd\276\355\222\361\212{\351\305\227\033\376\350t\036w8\017\333\234\007\363\234{\363\234\261\331\366\031+\177\330\220q!&\337\031\235\343\214\311qn\273\344\334\230\353\374p[B\367\036=\215\227\347\313\356/\367l\233\017\257\264m\205O\005@\377\235;\267>\371\344\023\252/\035,L\207\271\305\237i~\376\265\036\274\265\350P\251\325\253W?~\374\210\315~\311\\d\310\331N\347\305\002\347\005\273\363\347|\347%\247s\310\250\260\012\025\177\363l\303\346\0316gz\2363=\327y,\307y\304\356\\\266s\257t\266\271^\241/\232_\353j\330\214\375\330.\231\215|\367\303\242\375\007F\377\264\364\224{\357\275W\365\245\203\205\3510\267\3703\315\317\277\326\203\267\026\035*\365\216;\356\310\313\317\266\271^\200/\312\353\253\014\371\222\303\231\347p=e/p\255\277\371n\375\3755\037\035=q\272\335\351\374\305\356\274`s\376ls\236w:7\356\332\347J!v\343%\334\365B~\321x9/\334O\341C\317F\321\366\000\350\237\237\237]\261bE\265\027\016\226\246\303\334\342\3174?\377Z\017\336Zt\250T\343\375\214_lv\011"\331\262\226\207\027\355\316\263\227\235\371\216\302\016\347\317\237\377\340\343Y\023\336\3738\375\344)yh+p\346\033\351dG\334\336\302\2575\276\260p''%\033\256\016W\366\0370\375u\250\015\370\016\365\243\226\346\347_\353\301[\213\016\225j\274\237!\257\254Y\346\332\225B\034\316\237.9Og;mNg~^\336\237k\325\252P\341\216\012\025*\275\371V''\317/\214\215\337}\345k\013_\252\335\373\361h\330=\267g\005L\177\035j\003\276\363\253_\375J\365!hM\363\373W\353\301[\213\016\225j$\211,\343\225U^b\263\314\237\310\234\275\354<\371\213\363L\2563\366@\352\275\367\336{\307\235w\377\277{\252\266mwU\012\331\025\027/\235\355\256\027\351,\273=\313s''v{aC\326f\007\217\247\002\244\277\016\265\001\0379w\356\\\345\312\225U\037\205\3264\277\177\265\036\274\265\350P\251\306OU.\270^h\355\027\314\027\327\313\005\316\237s\\\357\205\374\224\353\214\330\225\370\330\023OU\255\366\373{*W\231\265pY\256\323\231\235\347\274\224\347\372\302mQ\273\012\277\326\365\345\205k\343\345\374\312\026\343\345\374\202\347\376\003\246\277\016\265\001\037IMM\255Q\243\206\352\243\320\232\346\367\257\326\203\267\026\035*\325H\022\347\355\256\027\335\363\262\230C\226 r\301\346<\227\357<\371\213mG\302\261''\352\324}\351\225\327\316\3449O\3478\317\3448\317\3469%\207l\2131R\210\335|\361v-\306+\267\261+{\341\332\346\271\321\330\177\300\364\327\2416\340#qqqu\352\324Q}\024Z\323\374\376\325z\360\326\242C\245\032I\342\274\361\272+\257\262\347^\250\367\302\276C\207c\023\022\243\366$n\217O\334\276;y\307\276\224M1\007w&\034\215\214O\336\032\237\264}wR\324\336\344\204\303i\237\316\376\374\315V\255\314\257\262\231k\333y\317\207F\273\350a\321\376\003\246\277\016\265\001\037Y\264hQ\353\326\255U\037\205\3264\277\177\265\036\274\265\350P\251\306g;\344\305\365\234\361\022+\257\257\347\372\366\355\351\315\037N}\343\215\226f\177{\321b\363\330\217g\243\330\376\003\243\277\016\265\001\037\351\325\253\327\314\2313U\037\205\3264\277\177\265\036\274\265\350P\251F\012\371\331f?kw-?\233m\233\315\3256\326\346\306\302-\256\206\261\205\376:\324\006|\344\261\307\036\213\215\215U}\024Z\323\374\376\325z\360\326\242C\245\032?\221\3114^b\345\0257\323f+l\273\267x>4^\2363\351/\213\016\265\001_\330\277\177\377\375\367\337o\263\331T\037\210\3264\277\177\265\036\274\265\350P\251\306{!\231\327\\l\356\206\355\332\035t\356\257Cm\300\027:t\3500u\352T\325G\241;\315\357_\255\007o-:T\252\221B~\262\331~\222\265\253a7\033\231\366\302\206\273\235yU7\355\373\353P\033(w\307\216\035\373\335\357~w\372\364i\325\007\242;\315\357_\255\007o-:T\252\221B\316\030\257\254g\212^\206\317\030/\267\356\215g\256\331A\363\376:\324\006\312WVV\326\335w\337\375\325W_\251>\020h1\267\227B\353\301[\213\016\225Z\224B\314\345\264\261x><Sb9M\177Y\256Y\033\361\361\361\375\372\365[\273v\355\355\277\216\360s\022A\236x\342\211\267\337~[\365\201\300E\207\271\275\024Z\017\336Zt\250T#\205\234*z}u7J.\256\247\034\216b\335\364\355_\2546\016\035:T\313\365\037\356\024\332\274y\263\242\353\011\177t\354\330\261\2325k\366\355\333\267\240\240@\365\261\300E\207\271\275\024Z\017\336Zt\250T#\205\374(\257\257\016\307)\207\353U\366Gs\221\207\305\033\306\263E}t\357\357\256\215\234\234\234\366\355\333\377\352W\2772\363\307\243\217>\372\357\377\376\357\362\017_\265\227\025~b\377\376\375R\036\277\373\335\357\370A\214_\321an/\205\326\203\267\026\035*\325H!''\215WVY\237t\270^\206\177toqxl77\272\033\232\3677k\343\363\317?\377\267\177\3737\317?\346\326\240A\203v\355\332\251\276\252P\343\334\271s\251\251\251qqq\2229z\367\356\375\370\343\217\337\177\377\375\323\246M\343\343\250\376F\207\271\275\024Z\017\336Zt\250T3\2058\034\346K\354\311\302\327\332\022\017\035W\266g\320_\036\312y\033;v\2547\177d\326\344~\263\004\201J.\361o~\363\233\312\225+\327\251S\247U\253V3f\314\330\265k\027\177\027\304?U\320`n/\205\326\203\267\026\035*U\306\350p\310\013mF\341\332\365\242[\270\024\333\342(Z\323_\026\2636\322\322\322\2325kV\245J\225\273\356\272\313|)z\340\201\007x/\304B\262\263\263\2336m\332\245K\227^\275z\365\351\323\347\365\327_o\323\246M\357\336\275\273u\353\326\272u\3535k\326H\237\341\303\207\317\2325k\365\325\346\314\231\323\257_?s''[\266l\0319r\244\354\344\275\367\336\223\306\244I\223\0325j\024\034\034\034\035\035\255tp\270.\035\346\366Rh=xk\321\241R])\304~\302n,\322\220\327Z\367\272p\243\303|\001\226F\321C\257\373\317\2349n\343\306\245\362TZ\332\256\370\370\015\011\373"\016\034\330,\353\270\270\365?\237=\340\356\337\263g\207\334\334c\346\376;v|\363z\373\177\372\351''\363\363\323\212\035\317\307\037O:\234\274\315\335?<\374\253\017?\034_^\307_J\177\317\332\010\017\017\177\360\301\007\357\275\367^3\210\310?\210\371\\\210\025\025\024\024<\377\374\363\347\317\237/\266]\202\305\326\255[%y\254_\277~\343\306\215\262\226\366\266m\333\206\015\033&\317fff\306\307\307\357\337\277_R\213\304\221\304\304\304)S\246H\0209p\340\300\236={\316\235;\247b(\270\001\035\346\366Rh=xk\321\241R+\270~"\223.\257\270\216\302\327\335t\327\303\302\365\011c{a\273\250[\272\367\375\363\362\216u}\247\355\326\255\253\302\302\006O\2348\374\363\317\337\0376\254\327\202\0053:vh\271a\303\342\350\250\265\203\006u\013\013\035T\267\356\343c\306\014\011\016\3563n\334\260\372\365\377:aB\320\330\261C%[\310\336\216\037\217\331\261c\315\356\370\365{\367~/O\355\335\2731>.|\347\316o\216\037\2131\017\343\2473\373\376\376\367zg\316\354\013\015\031\024\0222\260S\247VM\233\276\022\0322p\300\200\256\267~\374\245\364/V\033yyy\023''N\374\355o\177\373\350\243\217\312S111\252.(n\332\204\011\023\376\360\207?H\202LHH\360\334.)D.hTT\224\244\212}\373\366\311Z\036\306\306\306\006\007\007\313\263)))K\226,\0313f\314\360\341\303G\027\221\366\330\261c\027/^\234\226\226\246h4(\215\016s{)\264\036\274\265\350P\251\306{!i\016G\232]\326F\243p\355\360h\027[\227\245\277\335v\\\032aa\203\276\373\356\313\365\341\213^x\341\231o\327.\370\350\243\361\2337/\223g\337}w\304\270qC\237~\372\211\361\343\207\005\007\365\356\330\361\215\314\237\366}\263\346\213\345\313g\345\346\246\312\027\316\235;m\360\240ns\346L\225\245N\235\307\314F\277\276\235?\373l\262\373\273\244\247\305\344\347\037\335\264iY\320\260^\262\207&M\032\214\036\335\177\331\262\317\312\345\370\257\327\377\232\265q\366\354Y\371\2072\277\246kE\323\246M\353\323\247O\213\026-\316\2349\363\302\013/DDD\270\237\222\024\222\232\232\272t\351\322Q\243F\205\205\205I\310X\276|\371\361\343\307\315\024bj\327\256\335F\017R\006\355\333\267W1\016xE\207\271\275\024Z\017\336Zt\250T#\205\034w-\016s\235V\370\260h\243\375J\333\365\224\307\303\033\364\337\266me\307\016ot\355\332V\332a\241\003\277\373n\301\272\357\0266jT_\326\222B\266H\012\261\037\357\324\251\345\017?,m\332\364\345M?,m\335\272\311\217''c\203\202zId9\365c\234\271\377/\276x\177\303\372E\346\016[\266|\315\334\377\232\325\237\177\361\305t\371\326q\261\337\316\236=e\331\277>;\367s\302\2325\237\257\017\377\347\324\251\243\006\364\357"\215\265\337|\221xh\323\255\034\177\351\375u\250\015MH\236h\326\254\231D\212\202\202\002I!N\343/\214\325\257__\222\204\331\301L!\203\007\017\316\314\314\224\207\027.\\\030:th\311\024\362\256\207I\223&u\354\330Q\311p\340\015\315\357_\255\007o-:T\252\361\351T\363%\366\230\303q\314X\037w5\012\267\024m\367l\224\245\277d\013i\207\205\015\2344)x\350\320\356o\274\361\352\200\001]\006\017\356\272e\213\244\220cqq\3376i\322\340\245\227\236\223\215\253V\316\226\376!!\375_{\355\245\234\234\303\346\227\177\361\305{\255Z5\016\012\352)\313\237\376T\303\325\030\326\263E\213\277\273R\210\375Xr\362\346\335\273\327\311>\263\262\016J\354X\265j\366:\311:\353\026\256Y3OB\311\261\243\333o\375\370\257\327_\207\332\320AZZ\332#\217<\342\376s\267f\012q\032\277s[\267n\335\214\214\014gQ\012\011\012\012*%\205\014\0300`\302\204\011\356\0242~\374xI-\267}4\360\226\346\367\257\326\203\267\026\035*\325H!\362\342zT\326\005\216c\205m\343\241G\343X\211-\336\366o\333\246\2514\202\206\365\210\215];bDo\311"\357\276\033\374\321Gc\267l\371W|\334\267-[\276v\350P\304\353\257\277r\346t\334\302\205\037\364\356\325axp\257\257\277\236\363\374\363OK\377\002#\205lX\377\245\2717\327{!Fc\315\352y\262\335\375\035\333\266m*\353E\213>|\347\235\326\037\177<\376\343\217\307\205\206\364\0375\252o\271\034\377\365\372\353P\033\232\310\317\317w\267\335)D\\\274x\321l\230)d\336\274y\343\306\2153\023\306\374\371\363=SHzz\372\252U\253BCCsss{\366\354)\017e\243<\233\224\224t\033\307\2012\320\374\376\325z\360\326\242C\245\032?\221Iu8\216\026\276\342\232m\307\321\002cm\274\372\032m\273{Kj\231\372K\012\311\315I\352\326\255\315\241\203\021C\207t\223\376\222\025$\205DnY*\317\256Y=\267O\237\216\375\372u\012\013\035\320\245K\253\341\303{\215\036\325w\320\300.3g\216\311\313=,;\371\342\213iC\206t\2333g\362\3349\223\353\324yT\032\262\364\357\377\266\244\020\367\361\030A\347\350\262\177}\372\346\233\215\306\214\0318f\314 \327\016\303\006\224\313\361_\257\277\016\265\241\241\327_\177\275\344F\311\023)))\3056J\302\0301b\204\331\356\320\241Crr\262\371#\230\263g\317\206\207\207\317\235;7""\342\325W_=y\362\244\257\217\0317A\363\373W\353\301[\213\016\225j\274\027"\257\254\251\005\306\332\265\024\276\356z\254=\036\272\273y\323?//\371\311''\377\247w\357\366/\277\374\327\323\247b\2324\251?zt\337\267\33263\336\013YjvKJ\214X\276\354Si\264n\325x\315\232\271_\257\232\265z\365\034\367\376?\371d\374\354\331\357\356\333\273n\337\276u\365\353\377\237\254\245\375\351\247\343g\315\232\344>\236\266m\233~\371\345\007\262\023I''\377\374\347\014Y\246N\035\341J!\267|\374\245\364\327\24164\364\334s\317\225\3348d\310\220b\2775#\371\243^\275z\346\307\220322>\371\344\023i|\360\301\007}\372\364\0319r\344\260a\303:w\356|\371\362\345S\247N\361W\313\374\223\346\367\257\326\203\267\026\035*\325H!)\016{\212\254]/\264\356\206#\305\\\314v\341\026{\341F/\373\307\305\256i\320\340\377\242\242V\266z\263\221g\377\217>\034\263e\313\022\263\277\244\212\351\323G\311Sm\3324\216\216Z%\235e\271\346\376\0337~\251\344\361\244\246n\271\347\236\337~\366\331\304e\313>\371pfXrRDrr\304\372\360\005\241\241\375n\375\370K\351\257Cm\000\201J\363\373W\353\301[\213\016\225j\244\220\303\005\216#\016\273k\355n\024\256\215F\361\016e\351\237\233s\260w\357v\373\366~\353\356\337\245s\313\207\037\376\317cG\267,_\366q\307\216\315{to\333\271\363\033\301\301=\332\266i\022\024\324}\360\340.\322_\022\311\232\325\263\213\355\377\231g\236,\271\377\204}\337-[\366\2614\346\317\237\372\257\245\037I\343\302\371\335/\275\364\354\342\3053\312\345\370\257\327_\207\332\000\002\225\346\367\257\326\203\267\026\035*U\306X\340z\225u-\016\207\371\002\\\264\266_\331^r\343M\367w\330\223on\377I\211\033K\351\237\233s /\357\220\271\321fK\362\335\361\233\015\035j\003\010T\232\337\277Z\017\336Zt\250T\343\323\251\022\013\222\013\034\311\322(0\033%\327\205}\016{\264\265\356\257Cm\000\201J\363\373W\353\301[\213\016\225j\274\027\222d,\346Kl\222\303^\370\320\335pwp\\\375P\347\376:\324\006\020\2504\277\177\265\036\274\265\350P\251\306\347B\022\215W\331\304\242F\222\331(\266\275\330\263\232\367\327\2416\200@\245\371\375\253\365\340\255E\207J5\336\013I\364~q8\016\321\277\200\024\002X\231\346\367\257\326\203\267\026\035*\365\216;\356p\330\017\026\270^k\0179\034\205\015\367\342\336R\362)\235\373\313\031\253X\261\242\352K\007\340&\3510\267\227B\353\301[\213\016\225Z\275z\365\023\351\233\012\034\007\314\305Yp\320h\0344\226\003W\267\017\026u8\250y\377\214\023\233\357\275\267\252\352K\007\340&\3510\267\227B\353\301[\213\016\225Z\273v\355\230\350%\356W\331\002\307~\217E^t\335\033]k\347\225\016Z\367\2273\366\344\223\177V}\351\000\334$\035\346\366Rh=xk\321\241RCBB\202\202\2728\013\344\3055\301\375z\354\224\245\300\363\345\271\330\303\004\315\373\017\017~g\364\250\356\252/\035\200\233\244\303\334^\012\255\007o-:TjLLL\215\032\017\344\347\355v\272^e\345\3456\301x\271-\\<\037\026\177J\327\376r\256j\326\374c\324\316E\252/\035\200\233\244\303\334^\012\255\007o-\232Tj\213\026-\246M\035\\\340\330\347t\354s\255\013\\\015\3435\270h\213\261\261\240\360\331\004c\331\247m\1779W-\232\327W}\321\000\334<M\346\366\353\321z\360\326\242I\245&%%\375\372\327w\357\330\266\300\365z\354z\271\335+\213\323X\273\032\356-W\236\332gv\320\260\377\017\021s\252U\253\222xh\265\352\213\006\340\346i2\267_\217\326\203\267\026}*u\367\356\3352\330\210\357g\0278\3668\013\314W\\\327\342z\350(j\024m1\333fC\253\376\333\267\315\227\263\264\356\273OT_.\000\267D\237\271\375\232\264\036\274\265hU\251\353\326\255\373}\265*\323\246\016\264\345\355*p\354v\026\3546\327N\307\356\253\036\032[\256j\024\353\020\210\375m\371\273\344\314T\372\365\335\273\343\027\253\276P\000n\225Vs{IZ\017\336Zt\253\324\244\244\244\346\315_z\250\306\037\202\203\336\336\025\375eFzx\201#\316x\031\2167\327\005\322p\265\257n\024\024>\353\364l[\277\177\201=\356DzxL\324\302\340\240N5j\374\241E\363\227\222\022W\252\276D\000\312\201ns{1Z\017\336Z\364\254\324\230\230\230\220\321]\237|\262V\365\373\252\336Q\261b\005]\311\330\345\014\324~\262\226\234\215\230\350\205\252/\013\200rSA\313\271\335M\353\301[\213\346\225\252\334\330\261cU\037\002\200\000\244\371\334\256\365\340\255E\363JU\216\363\017\300\0274\237[\264\036\274\265h^\251\312q\376\001\370\202\346s\213\326\203\267\026\315+U9\316?\000_\320|n\321z\360\326\242y\245*\307\371\007\340\013\232\317-Z\017\336Z4\257T\3458\377\000|A\363\271E\353\301[\213\346\225\252\034\347\037\200/h>\267h=xk\321\274R\225\343\374\003\360\005\315\347\026\255\007o-\232W\252r\234\177\000\276\240\371\334\242\365\340\255E\363JU\216\363\017\300\0274\237[\264\036\274\265h^\251\312q\376\001\370\202\346s\213\326\203\267\026\315+U9\316?\000_\320|n\321z\360\326\242y\245*\307\371\007\340\013\232\317-Z\017\336Z4\257T\3458\377\000|A\363\271E\353\301[\213\346\225\252\034\347\037\200/h>\267h=xk\321\274R\225\343\374\003\360\005\315\347\026\255\007o-\232W\252r\234\177\000\276\240\371\334\242\365\340\255E\363JU\216\363\017\300\0274\237[\264\036\274\265h^\251\312q\376\001\370\202\346s\213\326\203\267\026\315+U9\316?\000_\320|n\321z\360\326\242y\245*\307\371\007\340\013\232\317-Z\017\336Z4\257T\3458\377\000|A\363\271E\353\301[\213\346\225\252\034\347\037\200/h>\267h=xk\321\274R\225\343\374\003\360\005\315\347\026\255\007o-\232W\252r\234\177\000\276\240\371\334\242\365\340\255E\363JU\216\363\017\300\0274\237[\264\036\274\265\334\260RSSS\243\243\243\343\343\343e\275i\323\246\025+VL\237>\275g\317\236\331\331\331\356>\343\307\217\227\355\356\207\231\231\231\377\374\347?\273u\353Vro\377\373\277\377\353p8\212m\374\364\323OSRR\334\0177l\330\360\361\307\037\337\314`,\302f\263-Z\264(++\313Yt\376\367\354\331\263c\307\016\325\307\005 p\220B`\0157\254\324\243G\217\316\236={\341\302\205\313\227/\377\333\337\376&YD\266\374\374\363\317v\273]\236=x\360`\277~\375BCC\273t\351\022\022\0222x\360\340\326\255[K(\221\327T\263\2038q\342\204|\325\336\275{\367\357\337\337\240A\203\204\204\004y\321\215\211\211IOO7;\234={\366\325W_\225\354\022\026\026&\273\352\334\271s\263f\315\244=h\320 \237\216]\0259?r\332+V\254X\253V-iT\256\\\271\202a\363\346\315\252\017\015@\200 \205\300\032J\257\324\330\330\330\267\337~;88X2\301\270q\343\036}\364QYKP\010\012\012\222\355qqq\005\005\005\021\021\021III\322y\340\300\201\347\317\237\2278\222\233\233\353\271\223\317?\377|\310\220!\363\014O=\365\224\331\350\337\277\277\204\033w\237\214\214\014I-\221\221\221\362\275:u\352\324\264iS\3114\236\357\257\004\222\211\023''V(\341\231g\236\011\017\017W}h\000,\214\367Y\335H!\226\341M^~\343\2157$y\214\0313FR\310\330\261c%\221\264o\337\376\342\305\213\362\324\345\313\227%y\214\036=:>>\376\275\367\336\223\352\357\335\273\367\316\235;%\276\230\357\232H\237\005\013\026|\377\375\367\346\256\336|\363M\263\261v\355Z\331.\215\335\273w\317\235;W\002\307\205\013\027d\343\306\215\033e?\022h\244\361\335w\337%''''\373j\344\352\234={\366\316;\357\364\214 \015\0336\274\347\236{233U\037\032\000\013\343}V7R\210ex\223B\3445r\247\241A\203\006fCr\311\245K\227\344))\356I\223&M\2336\355\351\247\237\2362e\212$\225\036=z|\375\365\327/\277\374\362\252U\253\366\356\335\3534RH\353\326\255\203\015\217<\362\210\331\220=\230)\344\310\221#\322\255e\313\226\331\331\331\022;V\257^\275\336\260\326\220\226\226\346\3533\240\304\220!Cd\2460''\210J\225*\311\031\2360a\202\352\203\002`m\274\317\352F\012\261\014/S\3106C\375\372\365\315F\363\346\315\315O\247feeIV\330\264i\323k\257\275\366\375\367\337K\214\350\336\275\273l\357\322\245\213\373S\250\245\277\027bz\353\255\267d\275x\361\342\256]\273~j\010\013\013\033=zt\271\216\325\217\344\345\345U\251R\305\234#\332\267o\377\360\303\017\027\3731\026\000\224\025\357\263\272\221B,\303\233\024\322\255[7\311\004c\307\216\375\313_\376b\376D\246G\217\036\347\317\237w\032)d\366\354\331\253W\257n\324\250\221\254\327\255[''\371\303Y"\205\014\035:\264\330\347B\006\014\030P2\205\254X\261\242U\253V\343\014\375\373\367\0373f\214/\206\354''\326\254Yc\316\0275j\324\320\360_*\000|\201\367YM\244\020\313\270a\0129x\360\240$\217\311\223''O\235:\365\361\307\037\2372e\312\273\357\276+[\016\0348`v\350\325\253\327\261c\307\336y\347\235\341\303\207GEE\265n\335\332yu\012\371\307?\3761w\356\334\375\206\006\015\032\230\215\317>\373l\316\2349\356\357")d\321\242E\222B$\235|ex\357\275\367\002;\205\210g\237}V\316\177\363\346\315U\037\010\200\000\301\373\254&R\210e\224\236B$I\374\362\313/\231\231\231YYY\027/^l\331\262\245\254\245-[\262\263\263\345\331\355\333\267\233aBRHNN\216d\210y\363\3469\215\024\342\376M]OM\2324)\271QBL\345\312\225g\317\236-)\344\243\217>:b\330\260aCXXX9\215\322O\245\245\245\311\371\017\324\317\276\000P\202\367Y\235\244\020\013)=\205$$$\364\355\3337((h\324\250Q!!!#F\214\220\365\310\221#\207\016\035j\276\005\3424~M\246u\353\326\023&LHIIi\330\260a~~\276lt\377\022M1\362\257\377\222\033\367\357\337o\376R\356\302\205\013\227-[&\015\211>\365\353\327_\272tiy\014\321\257i\376;\375\000|\201\367Y\231X-\243|_\005\363\362\362\314\206\304\210\202\202\202\222\035\016\037>\\\372\227\333l6\263]\362O\254\006\236\310\310\310\377\370\217\377\330\262e\213\352\003\001\020Px\237\225\024b\031\374[\\\025\011\037\277\373\335\357V\254\\)AD\303\337\346\007\340S\232\317\355Z\017\336Z4\257TU\314\010\022\021\361C\276\315\376\303\017\233\010"\000n\321\336\275{\307\216\035\333\264i\323\247\236z\252z\365\352w\337}\267\254\245-[d\273\371\327\233\364\301\013\233eT\254X\361\232?:\201\357xF\020s!\210\000\2709YYY\241\241\241\377\371\237\377Y\362\357\225\025#}\244\247\371\367\335\003\036)\3042*W\256|\356\3349\325G\241\221\222\021\304\035Dd;\237\021\001\340\245\274\274\274\2313gV\255Z\365\206\371\303\223\364\227\257r\177\206/P\221B,\243F\215\032\251\251\251\252\217B\027\327\213 \346"\333\371\260*\000oddd<\365\324S\236\361Bf\217N\235:}\265xIttLZ\372\211\213\227.\313Z\332\262\245C\207\016\362\254g\347\272u\353\312\036T\017\302\207H!\226Q\247N\235\270\2708\325G\241\205\322#\010A\004\200\227\242\243\243\253W\257\356\216\024\017?\374\360\342%Ksr\363J\231[\344Y\351S\263fM\367W\311\036d?\252\207\342+\244\020\313h\335\272\365\242E\213T\037E\340\363&\202\020D\000\334\220D\207J\225*\231I\342\356\273\357\2361c\306\245\31397\234X\314EzN\237\376\276|\225\371\345\262\237@\015"\244\020\313\2309sf\257^\275T\037E\200\363>\202\020D\000\224"##\303\375.H\265j\3256o\336\342\345\254\342\271\310W\271?M"{\013\310\037\315\220B,#66\366\261\307\036S}\024\201\254\254\021\204 \002\340\232\362\362\362\334\237\005\221\010\222\224|\370&"\210\271\310\327\272\203H\335\272u\003\357\303\252\244\020\313\260\331l\367\337\177\377\376\375\373U\037H`*\031AN\237\371\251\224\251\301\363Y\202\010\000O3g\316t\377 \346\346\336\005)\366\216\310]w\335e\356P\366\254zp\345\214\024b%\323\246Mk\337\276\275\352\243\010@%#HHh\250d\276C\211I\327\234\024d\273<+}\010"\000\212\311\312\312r\377\236\313\214\0313n1\202\230\313\364\351\357\273\177}7\300\376\216\010)\304JN\237>-/\226\346\177M\207\362r\315\010b\336\360\327\014"f\0041;\020D\000\024\023\022\022b\316\017\177\372\323\237\274\3778j\351\213\354\307\375[3\241\241\241\252\207X\236H!\026\363\325W_I-\006X\026V\250\224\010r\315 \342\031A\010"\000Jr\377u\324\305K\226\226K\0041\027\331\233\271[\331\277\352!\226''R\210\365\364\355\333\367\211''\236 \210\334\272k~\026\244X\310\360\014"%#\210\371,\237\021\001`\332\263g\21793\310<P\372\337\005)\353"{\223\371\312\334y \375_3\244\020\353)((\350\324\251\323\335w\337\315\217fn\305\365~#\346zQ#|\375\206R\002\212\347B\020\001\002\230\315f\233:u\352\202\005\013233K>;v\354Xsr\220Y\272\034#\210\271t\350\320\301\334\271|\227\333?p\037!\205X\325W_}%/\242\355\333\267\347\267fnB\351\277\224{\315 R\261bEo"\010A\004\010l+W\2564g\200;\357\274s\360\340\301\305~u\266i\323\246\346\263_-^R\356)D\366i\356\\\276\213\252\341\227;R\210\205\235>}z\332\264i\362Z\370\330c\217\365\352\325k\321\242Eqqq\251\251\251\347\316\235\343\177\337-\2057\177\027\344\232A\304\313\010B\020\001\002XVV\226\373\337$\322\250R\245\312\2325k\334\317\272\377LHttL\271\247\020\331\247\271s\371.\012\317@\371"\205X\236\315f\213\215\215\2359sf\353\326\255\353\324\251S\243F\215\312\225+\227\374\207;L\336\377i\262R\202\310\015#\010A\004\010`\265j\325\362\234\020\356\274\363\316g\237}6--M\236r\377\275\324\264\364\023\345\236Bd\237\346\316\345\273\250>\007\345\206\024\002\275\224\351\257\243\206\257\337P2\317\311\026\331\356\345\036~\370a\223\004\021\367\217\212\001\0046\367\377\374r\361\322\345rO!\262O\367wQ=\225\226\033R\010\364\022\031\031)A\344\373\210\010\336\013\201Z\307\216\035\353\332\265\2534\366\031\242\242\242\336|\363\315\304\304\304\335\273wgdd\234;w\356\255\267\336\352\327\257\337\360\341\303CBB\344\037\337\243G\217\016\016\016\0368p`\307\216\035\315\317E~\377\375\367\215\0337\376\360\303\017\245[\337\276}k\327\256-}\202\202\202\272u\353v\362\344\311\213\027/\266o\337\376\321G\037\2357o\336\321\243G\2335k\266\272\310\253\257\276\252z\364\326V\271res*\250T\251\222\234\344\207\036z\250E\213\026\274\027rsH!\320\2167A\204\317\205\300\327z\367\356}\352\324\251\257\277\376Z\262\305''\237|2s\346\314\347\237\177~\316\2349\222*v\355\332\3454\376/\222\344\344\344\023''N\374\370\343\217\257\275\366\232t\226\366\341\303\207srr\334;\371\345\227_\034\016G~~~\217\036=l6[zz\272\264=\277\313\340\301\203%\320H\243s\347\316\356\215\374\011\346[\341\376]\334\206\015\033\276\362\312+5k\326\014\017\017w?\313\347B\312\212\024\002\035\225\036D\370\035\031\370\332\206\015\033\036\177\374\361\221#G6k\326\314L\025\222\025\314\267F\334N\237>\375\334s\317\375\303\360\304\023O\230\215\027_|\361\310\221#\362lBB\302\260a\303\262\263\263\245=z\364\350\304\304Di\304\304\304\310N\314\017\247\307\307\307\367\351\323\247v\355\332}\373\366\375\370\343\217\2337o.\335BCCe\315{!\267"""\242\202\361\037\313\335s\317=\023''N\344wdn\021)\004\232\222 R\245J\025\376^\010\224\270x\361\342\217?\3768|\370\360\344\344\344\331\263gw\353\326m\320\240A\335\273w\0370`@\2336mN\235:%}233\273t\351b\366o\321\242\205\331\350\337\277\377\361\343\307\315vttt\277~\3756m\332\364\3143\317Hc\350\320\241\022k$y\214\0313\306\375\215\376\374\347?GEE\311\267;|\370\360\211\023''N\236<)\353\224\224\224\013\027.\334\326\001\007\226u\353\326\315\2325\353\354\331\263%\237r\177\010\254C\207\016\345\236B\370{!@@\341o\247B\241\255[\267~\366\331g\322\270|\371r||\374\376\375\373\017\0348\220\220\220\220\224\224dv8s\346L\223&M\202\203\203_\177\375\365G\036yD\202HPPP\243F\215RSS\335;9v\354\230\303\341X\261b\305\321\243G?\370\340\003\371\222/\276\370B\332\346\263k\326\254\221\177\262w\355\332u\351\322\2453f\314\220\027Ny8g\316\234\217>\372\350\320\241C\267\177\310:\330\273w\25793\360\267S\275D\012\201\326\370\177d\240\304\211\023''\036|\360\301\276}\373\366\352\325Kb\207d\213\177\026i\325\252\225g\317\310\310\310\211\023''J\004\221\350\360\365\327_\027\333\217l\277t\351\322\320\241Ce\207]\272t9}\372tXX\230\371Tvvv\2336m\006\015\032\224\221\221q\374\370\361\270\270\270\203\007\017\276\366\332k\222ubbbn\3238\265\344\353\377G\346\277\376\353\277T\017\261<\221B\240;\376O](a\267\333\035\016\307\376\375\373%\023\014\0336\314\275\275C\207\016\356\366\312\225+\273w\357.\335\314\237\310\204\204\204L\236<Y\276\320|6<<\374\037\377\370\207\323\370\264i~~\376;\357\274#)\304\375\343\230E\213\026m\337\276\335\375\351\324y\363\346}\365\325W\317=\367\334\222%K\346\316\235{\273F\251\243\320\242\011\244f\315\232\374\237\2727D\012\001\256\035DJ\371\360\251\031D\210 \270i\207\016\035\252W\257\236\004\216i\323\246\355\330\261\343o\177\373\333\273EZ\267n-\035\022\023\023\333\265k7a\302\004\363\243\246\356O#.\\\270\360\257\177\375kTTTnnn\203\006\015\362\362\362RSS\333\264i\3434~\013\346\314\2313\362\022%\351d\335\272uf\377\201\003\007\236={V\322\311\311\223''333\2337o.ki\233\037=\201/deeU\255Z\325L\014\323\247\277_.)D\366c\356P\366\034`\377\225))\004p\271\346gDJ\231\024\370,\010n\205\303\341p\277\245!\201c\370\360\341\347\213\364\356\335[6\376\364\323O\007\016\034p\367\177\376\371\347\335m\311\020\322-66v\316\2349\011\011\011\365\353\327\317\310\310\220\355\303\206\015\313\317\317o\331\262\245\344\030s\213\350\336\275\373\211\023''\226,Y"\371\346\375\367\337\2371c\206\254\245\275h\321\242\3337Z\375\314\2349\323\014\015w\337}\367\346\315[n1\202\310\036\356\272\353.s\207\262g\325\203+g\244\020\240\220\367\177\334\335s!\202\3406p\177\340\264$w\232\271\246\323\247O\027\373\013"\270\015\362\362\362\334\1778\244j\325\252I\311\207o:\202\310\327\272\337Y\251[\267n\261_\014\016\000\244\020\340\212\262\006\021"\010\200k\312\310\310p\377\035U\211\0217\367\216\210|\225;\202\310\336\334oq\005\022R\010p\025\357\203\010\021\004@)\242\243\243+U\252df\210\273\356\272k\372\364\367\275\377\260\252\364\224\376\356\037\304\310~do\252\007\344\023\244\020\2408o\202\010\021\004\300\015Itp\277#"\036~\370\341\305K\226\226\376wD\344Y\351\343\376\215\030\363]\220@\215 NR\010pM\245\007\021"\010\000/edd\324\255[\327\363\217\014\311\334\322\241C\207\257\026/\211\216\216IK?q\361\322eYK[\266\310v\367\237&s\177\026$ \177\020\343F\012\001\256\355zA\204\010\002\240L\362\362\362f\316\234\351\376\204\207\227\244\277|U\340}\034\265\030R\010p]%\203\010\021\004\300\315\311\312\312\012\015\015u\377e\325RH\037\351\031`\177\027\344zH!@i<\203\010\021\004\300\255\333\263g\317\330\261c\2336m\372\324SOU\257^\375\356\273\357\226\265\264e\213l\227gU\037\340mE\012\001n\300\014"+V\256$\202\000@\371"\205\0007\026\031\031)\021D\326\252\017\004\000\002\012)\004\000\000\250A\012\001\000\000j\220B\000\000\200\032\244\020\000\000\240\006)\004\000\000\250A\012\001\000\000j\220B\000\000\200\032\244\020\000\000\240\006)\004\000\000\250A\012\001\000\000j\220B\000\000\200\032\244\020\000\000\240\006)\004\000\000\250A\012\001\000\000j\220B\000\000\200\032\244\020\000\000\240\006)\004\000\000\250A\012\001\000\000j\220B\000\000\200\032\244\020\000\000\240\006)\004\000\000\250A\012\001\000\000j\220B\000\000\200\032\244\020\000\000\240\006)\004\000\000\250A\012\001\000\000j\220B\000\000\200\032\244\020\000\000\240\006)\004\000\000\250A\012\001\000\000j\220B\000\000\200\032\244\020\000\000\240\006)\004\000\000\250A\012\001\000\000j\220B\000\000\200\032\244\020\000\000\240\006)\004\000\000\250A\012\001\000\000j\220B\000\000\200\032\244\020\000\000\240\006)\004\000\000\250A\012\001\000\000j\220B\000\000\200\032\244\020\000\000\240\006)\004\000\000\250A\012\001\000\000j\220B\000\000\200\032\244\020\000\000\240\006)\004\000\000\250A\012\001\000\000j\220B\000\000\200\032\244\020\000\000\240\006)\004\000\000\250A\012\001\000\000j\220B\000\000\200\032\244\020\000\000\240\006)\004\000\000\250A\012\001\000\000j\220B\000\000\200\032\244\020\000\000\240\006)\004\000\000\250A\012\001\000\000j\220B\000\000\200\032\244\020\000\000\240\006)\004\000\000\250A\012\001\000\000j\220B\000\000\200\032\244\020\000\000\240\006)\004\000\000\250A\012\001\000\000j\220B\000\000\200\032\244\020\000\000\240\006)\004\000\000\250A\012\001\000\000j\220B\000\000\200\032\244\020\000\000\240\006)\004\000\000\250A\012\001\000\000j\220B\000\000\200\032\244\020\000\000\240\006)\004\000\000\250A\012\001\000\000j\220B\000\000\200\032\244\020\000\000\240\006)\004\000\000\250A\012\001\000\000j\220B\000\000\200\032\244\020\000\000\240\006)\004\000\000\250A\012\001\000\000j\220B\000\000\200\032\244\020\000\000\240\006)\004\000\000\250A\012\001\000\000j\220B\000\000\200\032\244\020\000\000\240\006)\004\000\000\250A\012\001\000\000j\220B\000\000\200\032\244\020\000\000\240\006)\004\000\000\250A\012\001\000\000j\220B\000\000\200\032\244\020\000\000\240\006)\004\000\000\250A\012\001\000\000j\220B\000\000\200\032\244\020\000\000\240\006)\004\000\000\250A\012\001\000\000j\220B\000\000\200\032\244\020\000\000\240\006)\004\000\000\250A\012\001\000\000j\220B\000\000\200\032\244\020\000\000\240\006)\004\000\000\250A\012\001\000\000j\220B\000\000\200\032\244\020\000\000\240\006)\004\000\000\250A\012\001\000\000j\220B\000\000\200\032\244\020\000\000\240\006)\004\000\000\250A\012\001\000\000j\220B\000\000\200\032\244\020\000\000\240\006)\004\000\000\250A\012\001\000\000j\220B\000\000\200\032\244\020\000\000\240\006)\004\000\000\250A\012\001\000\000j\220B\000\000\200\032\244\020\000\000\240\006)\004\000\000\250A\012\001\000\000j\220B\000\000\200\032\244\020\000\000\240\006)\004\000\000\250A\012\001\000\000j\220B\000\000\200\032\244\020\000\000\240\006)\004\000\000\250A\012\001\000\000j\220B\000\000\200\032\244\020\000\000\240\006)\004\000\000\250A\012\001\000\000j\220B\000\000\200\032\244\020\000\000\240\006)\004\000\000\250A\012\001\000\000j\220B\000\000\200\032\244\020\000\000\240\006)\004\000\000\250A\012\001\000\000j\220B\000\000\200\032\244\020\000\000\240\006)\004\000\000\250A\012\001\000\000j\220B\000\000\200\032\244\020\000\000\240\006)\004\000\000\250A\012\001\000\000j\220B\000\000\200\032\244\020\000\000\240\006)\004\000\000\250A\012\001\000\000j\220B\000\000\200\032\244\020\000\000\240\006)\004\000\000\250A\012\001\000\000j\220B\000\000\200\032\244\020\000\000\240\006)\004\000\000\250A\012\001\000\000j\220B\000\000\200\032\244\020\000\000\240\006)\004\000\000\250A\012\001\000\000j\220B\000\000\200\032\244\020\000\000\240\006)\004\000\000\250A\012\001\000\000j\220B\000\000\200\032\244\020\000\000\240\006)\004\000\000\250A\012\001\000\000j\220B\000\000\200\032\244\020\000\000\240\006)\004\000\000\250A\012\001\000\000j\220B\000\000\200\032\244\020\000\000\240\006)\004\000\000\250A\012\001\000\000j\220B\000\000\200\032\244\020\000\000\240\006)\004\000\000\250A\012\001\000\000j\220B\000\000\200\032\244\020\000\000\240\006)\004\000\000\250A\012\001\000\000j\220B\000\000\200\032\244\020\000\000\240\006)\004\000\000\250A\012\001\000\000j\220B\000\000\200\032\244\020\000\000\240\006)\004\000\000\250A\012\001\000\000j\220B\000\000\200\032\244\020\000\000\240\006)\004\000\000\250A\012\001\000\000j\220B\000\000\200\032\244\020\000\000\240\006)\004\000\000\250A\012\001\000\000j\220B\000\000\200\032\244\020\000\000\240\006)\004\000\000\250A\012\001\000\000j\220B\000\000\200\032\244\020\000\000\240\006)\004\000\000\250A\012\001\000\000j\220B\000\000\200\032\244\020\000\000\240\006)\004\000\000\250A\012\001\000\000j\220B\000\000\200\032\244\020\000\000\240\006)\004\000\000\250A\012\001\000\000j\220B\000\000\200\032\244\020\000\000\240\006)\004\000\000\250A\012\001\000\000j\220B\000\000\200\032\244\020\000\000\240\006)\344\377\267[\307\002\000\000\000\000\203\374\255\207\261\247(\002\000\036\026\002\000<,\004\000xX\010\000\360\260\020\000\340a!\000\300\303B\000\200\207\205\000\000\017\013\001\000\036\026\002\000<,\004\000xX\010\000\360\260\020\000\340a!\000\300\303B\000\200\207\205\000\000\017\013\001\000\036\001\035A\366wF\341\2444\000\000\000\000IEND\256B`\202', '0');
INSERT INTO "public"."act_ge_bytearray" VALUES ('1903', '1', 'freeLeave/freeLeave.png', '1901', '\211PNG\015\012\032\012\000\000\000\015IHDR\000\000\002\342\000\000\001\231\010\002\000\000\000C\214\303\367\000\000"vIDATx\234\355\335\177l\334\365}\370q\003Mq\266R2\225\025\013U\315U\323\026k]\033o\364\253\344\257\305 \015{\322V,\255\002o\177\004K\2504]\2656\232\246\316\335D3\255d\326\264v\336\276\035J7H\375\335\304\346\251\012\263T`Y!mJ\003\365\370\221\030h\332k \3054\204\272\204P\263$\344H\354\370\363}\347\256\334\256\376\025\037\371\334}\336\366\347\361\320K\221c\237\317\237\363\307w\357\347\235\357>nI\000\000\242\324\222\365\006\000\000\314O\246\000\000\221\222)\000@\244d\012\000\020)\231\002\000DJ\246\000\000\221\222)\000@\244d\012\000\020)\231\002\000DJ\246\000\000\221\222)\000@\244d\012\000\020)\231\002\000DJ\246\000\000\221\222)\000@\244d\012\000\020)\231\002\000DJ\246\000\000\221\222)\000@\244d\012\000\020)\231\002\000DJ\246\000\000\221\222)\000@\244d\012\000\020)\231\002\000DJ\246\000\000\221\222)\000@\244d\012\000\020)\231\002\000DJ\246\000\000\221\222)\000@\244d\012\000\020)\231\002\000DJ\246\000\000\221\222)\000@\244d\012\000\020)\231\002\000DJ\246\000\000\221\222)\000@\244d\012\000\020)\231\002\000DJ\246\000\000\221\222)\000@\244d\012\000\020)\231\002\000DJ\246\000\000\221\222)\000@\244d\012\000\020)\231\002\000DJ\246\000\000\221\222)\000@\244d\012\000\020)\231\002\000DJ\246\000\000\221\222)\000@\244d\012\000\020)\231\002\000DJ\246\000\000\221\222)\000@\244d\012\000\020)\231\002\000DJ\246\000\000\221\222)\000@\244d\012\000\020)\231\002\000DJ\246\000\000\221\222)\000@\244d\012\000\020)\231\002\000DJ\246\000\000\221\222)\000@\244d\012\000\020)\231\002\000DJ\246\000\000\221\222)\000@\244d\012\000\020)\231\002\000DJ\246\000\000\221\222)\000@\244d\012\000\020)\231\002\000DJ\246\000\000\221\222)\000@\244d\012\000\020)\231\002\000DJ\246\000\000\221\222)\000@\244d\012\000\020)\231\002\000DJ\246\000\000\221\222)\000@\244d\012\000\020)\231\002\000DJ\246\000\000\221\222)\000@\244d\012\000\020)\231\002\000DJ\246\000\000\221\222)\000@\244d\012\000\020)\231\002\000DJ\246\000\000\221\222)\000@\244d\012\000\020)\231\002\000DJ\246\000\000\221\222)\000@\244d\012\000\020)\231\002\000DJ\2464P\251T\032\036\036\356\355\355\355\354\354,\024\012-y\025.{\370\016\364\364\364\014\015\015MNNf\275[\000X6dJ\243\354\336\275;,\317\241Q\356\271\347\236\207\366\354y\356\360\341\263SS\371\234p\331\303w`\327\256]\2337o\016\337\223\020+Y\357\034\000\226\007\231\222\276\311\311\311\276\276\276\256\256\256#/\0369;u\326\324\316\261W\216\205X\011\337\234\211\211\211\254w\024\000\261\223))\013\215\322\321\321q\367\316\273\316N\2351\013\315}\367\337\267a\303\206\361\361\361\254w\027\000Q\223))\353\353\353+7\312\033f\361yh\317\203\2336\375f\326\273\013\200\250\311\2244\355\336\275\273\253\353\206\251\351\222Y\312|\372O\377d\373\366\317e\275\323\000\210\227LIM\251T*\024\012/\036\035\237\232>m\2262''O\375d\375\372\017\026\213\305\254w\035\000\221\222)\251\031\032\032\352\353\353\233\232~\275:\327u\377\316\022_\262[\373Y\271\232\355\333\377\262\277\277?\353]\007@\244dJjzzzv\335\373\357\377\333(7t\375(I^8\227<;\225|\367L\362\324\231\344\211\223\323\203\367~\375kG_{\354l\362\337\245\344\261R\262\357\365\344\3017\222\277\337\367\314m[>\226y1d2O\356\037\355\350\350\310z\327\001\020)\231\222\232\366\366\366\203\007\017LM\237\252LKK\313\311$95\223\2746\235\274z6y=I\376\370\317>\333r\351;6\336\320st*9r&9\362F2^J\236\233N\276\362\355\247\312\017\250\234\312\341\234<u\274\265\2655\353]\007@\2442\316\224R\251422\262m\333\266\236\236\236\3167uww\207\367\014\017\017/\257#\226\256Y\263\346\225\343G\247\246OV&\224\307\353\347\2223\347\316\177hz\346\374\277_}\340\277\256\371\245_\373\363;>?\235$''\246\223\327\246\222W\247\222p\011\037|\374\351r\246\234\314\347\204\313\236\355\216c\021\213\\C\207\206\206\034\374\006h\264\314V\210p\333\027n\354\302=\351p\363\027n\362v\355\272\367\241=_\257\314}\367?p\373\355\237\355\355\355\015\013\377\306\215\033\227\313AK\313\251q\242:\341\277\247\246\223\343\247\223\263\347~z\202P]\177\373\305/}\356o\276x\344\245\3637\356S3\311\331r\276<\372\344S\263>7W#S\342\024\256\241\341\272y\301\247Uutt\354\330\261#\324L\326\333\013\254L\031\254\020ccc\225\277\360\022r\344\354\324\364\342\263\357\221G7o\276%\334\024\356\335\273\267\371\233Z\227rj\374Ou\316g\312\271\344\330\353\311\217O&SIr\366\314\231\366u\353ZZ.kii\375\310\357o\256\375\304''\366\037\230\365\271\271\032\231\022\233p]\013w\017\352\375\263M!k\262\336p`\005j\366\012100\020\232\343\241=_\277`\240\324\316\023O\356\337\264i\323\226-[b\276\323VN\215\327\252S\371\245\317\361\323\311K''\222\227\337H\2368\370\203\253\257\276\372\262\267\275}\365\225W\365\376\301\317d\312\343O\356\237\365\271\271\032\231\022\217p\375\352\353\353\233\373x\311\247?\375\247\265\217w\206\271\375\366\317vuu\315:e\270\357\261\274~Q\013\304\257y+D\270\005\354\355\355\355\357\357\257+Pj\347\037\356\274\263\263\2633\332_\207\227Sc\262:\341\277\247g\222WK\347\037M9\366F\262\347\361\342\007\326_{\325/\276\373\3125\277\360\245\177\376\312\033Ir\362L\362\372\231\363\237\270o\364\361Y\237\233\253\221)\221\010\327\254Y\017\242|\362\223\237*\377\311\314\005\257\222\307^9\036\256\225mmm\265\017\253\214\215\215e}Q\200\225\243I+Dh\224p\0138<<\374\226\033\245\372;\240p>q\376-\230p\033==\375\223\352TV\337P*\257M%?9\233\274tb\352\321g\306\327\377\306\207\256\373\255\337~\371L\362\343R\362r)9~&\011\241\262\357\261\307g}n\256F\246\304 \\\247BaTk\243\273\273{\361@\231\025+\267\337\376\331\352\347\266\266\266\216\216\216f}\201\200\025\242I+Doo\357\3057J\365\027@\241T"\374\355\317\254\324\350\274n\323\323\337{\366\211g\212\243c\305G\366\027\0379p\350\321\247\017\177\343\261\357~\373\231\347\037\336\177\350[\373\277\377\310\201\357\217>u\350\231g\177x\347?\356\274\351\346\2332\317\005\231\222[\225{\021\325\316\270c\373\366\267p\305\274\347\236\177\015\201R}L%\332G=\201\345\245\031+\304\300\300\300\305\374\256g\356\354\332uoOOO\023\266\274.\345Ly\265v>\361\211\217-\345\351\207\277\367\221\217\314\372\304\\\215L\311\\\270\027Q\375i\014W\256\213\271\013\261f\315\232\312\371tvvf}\261\200\225\240\341+\304\330\330XGGG\212\215R\231\333n\373\330\216\035;\032\275\361u)g\312qS\357\310\224l\215\214\214\\\344\343(\265s\337\375\017T\317mpp0\353\013\007,{\015_!B\243\204\373X\251g\312\221\027\217\256][\210\352W?\3473\345\334+\246\336\221)\331\012\327\320\352\363QR\271nV\237\247\322\326\326\026\3255\024X\216\032\273BT\216\020\225z\243T\346\223\237\374TTw\327\312\231r\314\324;2%C\303\303\303\325\347\275\206\364O\345\212y\342\344\251\352k\177\266n\335\232\365E\004\226\267\306\256\020\235\235\235\365\036"\245\256\007T\302\255aC\267\277.\345Ly\331\324;2%C\341\032Z\351\211\020\375)^7\357\336\271\263r\266k\326\254\311\372"\002\313[\003W\210\311\311\311p#\325\240F\251\314\206\015\033\342y\351c9S~l\352\035\231\222\225p\015\255>\217$\255\207R\252\263vm\241r\316\361\037?\032\210Y\003W\210\241\241\241\276\276\276\206f\312\035\333\267\367\367\3677\356"\3145<<\274\320Q[\312\2312a\352\035\231\322P\213\374\304\206kh\365U9\251_7o\273\355\247/sk\3625\024Xa\032\270Bl\331\262e\307\216\035\015\315\224\207\366|\275\231\257{<t\350P\345\226\367\212+\256\330\265k\327\254\217\312\024\231\022\233\305\177b\30354\255\027\370\314{\335\254\234\371\306\215\0333\271\354\300\312\320\300\025\242\273\273{)\177\\\360b\346\271\303\207\327\256-4\356"\314R*\225.\275\364\322\312\215\357\252U\253\336\377\376\367\327\336O-g\312\2172\237\2056\243\372\376\271od\276\301M\333\203y\263\370Ol\270\206V>\324\210\353i\270nV\316\274Ph\3365\024Xy\032\270B4\350\245\310\265s\342\344\251\326\326\326\306]\204\271j\377|I\260z\365\352[o\275\265\362\252\313\360\337s\347^j\376\264\\H\365d\013\275\221\355\310\224\206Z\344''\266\372R\344\006]O\253_4\353\357\001\260\2145\360\026$\334>\246\376\274\274yo\012\253\257V\310\334\271sG\233?\213\177\335\352G\227\362FV\333\037\317\036\314\225j\301,\375\317\367\3245\325\363o\334\215\014\260\3425\360\026\244\275\275\375;\007\0176!S\032w\021\346\272\362\312+\253\267\362=ea\211-\026\213\311O\037My1\363\231w3\252\333\\{\202\271od\265\301\315\334\203y\263\310Ol\270\206V\336\337\240\353i\365O\374d\375=\000\226\261\006\336\2024\364\240)\225i\362sS\252/\340\014\267\357\037\375\350G\303\277\303\303\303\325\217\226\027\373#\231\314"\367\230kO3\367\304\265\357\317p\343\233\266\007\363f\361\237\330\352\203X\215\270\236\036{\345x\345\314\035:\005\270\030\015\\!\372\372\372\356\336\271\263\241\231\262\357\221G7l\330\320\270\2130\313\013/\274\020\356 vww\027\012\205\376\376\376\260\006\324~\264\274\336\3770\223\251\375\322\027|\273\366\215\014\267\271v\303\232\266\007\363f\361\237\330p\015\255\374\014\374\303\235w\246~\335\374\316\301\203\2253\357\350\350\310\352\342\003+@\003W\210\301\301\301t\017m9wB\006m\336|K\343.\302\\###CCC\363\036\210"\333LY\370\321\224\2379\315\274\275"SV\260E~b\007\006\006*?\025\341J\224\372u\363\216\355\333+g\336\333\333\333\364\013\015\254\034\015\\!\302-c\270\017\327\320L\351\352\352\332\275{w\343.B]\312\253\376\013\231L\355\227\236\367\3557\033e\366;\263\332\340Y\033\237\365\256\313\251b\261X\375\275\314\211\223\247\322\275nn\332\264\251r\346!\222\262\276\240\3002\326\330\025\242\241\317\242\0157\254\341\3465\236?\301z~\325\237\031\317d\026{4\245\3464\013\275\221\355\310\224\014\205;\022\225\237\223]\273\356M\361\272Y=hJ0\3537M\000ui\354\012\321\320\337\373|\376\013_\010g\336\320\355\257Ky\325\177>\223\251\375\322\027|\273\362\306\233\0213\373d\231l|\326\273.\277\372\373\373+?\011\353\327\257O\361\001\225\017\337xc\345l{zz\262\276\210\300\362\326\330\025\242T*\205\273k\2158zJ\270I]\273\266011\321\320\355\257Ky\261\377A\346\263\320fT\337\377f\240\374\314{\262\335\340\254w]~MNNV\217n\222\326!\363\367=\362h\365\241\224\261\261\261\254/"\260\2745|\205\030\036\036\276\351\346\233W\374C)\311O3\345p\3463\357f\274\231&\263OP\363\273\241,78\353]\227k\203\203\203\225\237\201\326\326\326\213\177e\362s\207\017W\273g\313\226-Y_8`\331k\306\012\361\341\033oL\3677\337\3379x\260\362\030u\0236~\351\312\213\375s\246\336\221)\231\333\270qc%,Ba\\\314\021i\303U2\\1\253g\025\325\203\235\3002\325\214\025brrr\303\206\015i=\227\366\330+\307\303Ma\2701m\302\226\327\245\234)\317\232zG\246dn|||\315\2325\325\274xk\177\342\347\310\213G\253\215\322\332\332\272w\357\336\254/\026\260\0224i\205(\026\213\241T.\376O\207\204F\371\360\2157\336w\377\003\315\331\354\272\310\024\231\262|\205\252\250\376\0060DF\275\007|\333\367\310\243\265\177\343ppp0\353\013\004\254\020\315[!\306\306\306\302\235\255psv1\277\353\011\255\023g\243$\345L\231\2319d\352\035\231\022\211\221\221\221\352c*\225\327\376\204\353\332R\036D\271\351\346\233[jh\024 EM]!&''''7m\332t\373\355\237=\366\312\361z\177\347\375\371/|\241\362\233\243fnp]\312\231\362}S\357\310\224x\024\213\305\352\337#\254\306J\270\302\316\375\215m\250\223\177\270\363\316\256\256\256\332\023\207\312\361\273\036 ]\315^!J\245R\270\325[\267\256=d\307\022\217\323p\367\316\235\341\364\237\374\344\247B\3344yk\353R\316\224\242\251wdJT\302}\211m\333\266U\377\270\361,\341\256\302B\037\352\355\355\365\234Y u\331\254\020\341\346l\353\326\255\341\276\327\207o\2741T\310\334\247\354\205\367\334s\317\277\336t\363\315\3414\2337\3372\357_$\211M9S\276\027\303|\343\033\377o\333\266O\314;\341C\231o\336\254\221)\021\012\327\320\352\037&\274\240\316\316\316\321\321\321\2547\031X\231\262\\!J\245\322\310\310H\2705\254\276@\240\366\241\346\320(\303\303\303\313\350H\333\341^\346\351\323\007ff\276\233\371l\333\366\207\013\255(\341C\231o\336\254\221)\321\012\327\320p\035\014\327\320\216\216\216Y?H\205B\241\247\247g\307\216\035\036A\001\032\312\012\221\232p\303\375\374\363_\233\2319\230\371|\371\313wtv\376\237y''|(\363\315\23352e\271x\354\261\307V\257^\375\364\323Og\275!@\216X!R\323\335\335\375\237\273w\314$\3371K\237\357\025\277\332\336\336\236\365\256cI\336\373\336\367^r\311%\267\334rK\326\033\002\344\210LI\315\300\300@\177\377\255\231/\374\313k\276<tG___\326\273\216\013\373\273\277\373\273\312\257{\256\272\352*\177\251\007h\032\231\222\232\361\361\361\366\366\367\235.=1\223<\223\355l\333\366\361\205\237\233\362\361\3147\257vzz\256\037\031\031\311z\327q\001\223\223\223\325\027\370\254Z\265\352\332k\257\315z\213\200\274\220)i\332v\336\226\231\344\351l''l\303\302\231\222\375\346U\347\337\206\377\272\267\267;\353\235\306\205\365\364\364\324\376\024\275\367\275\357\035\032\032\312z\243\200\\\220)i*\225J\235\235\037\032\035\375\227$y\312,>\023\023{\332\333\33779\271/\353\235\306\005LNN\316\355\335\367\274\347=\341\247=\353M\003V>\231\222\262b\261\330\321\261\256X\034I\2221\263\320\204F\011=\267w\357]Y\357..\354\256\273\356\252\244\311\007>\360\201\352\321\364\177\365W\177\325\001g\201&\220)\351\033\035\035\015\24520\360GIr \223\031\032\372\213\020\001\363N\370PV[U\235\221\221/\264\267\027\366\356\375\247\254w\024K\362\255o}\353\035\357xG\241P\010\215r\3155\327\274\363\235\357lkk{\367\273\337-S\200&\220)\015Q*\225\372\373\373:;\257\015Y01\361`\222\354o\346l\333v\333\302\317M\271\255\311\033S\235\311\311o\016\017\377UooWOOgx;\353]D\035\306\306\306*G\202.?\373j[x\333\213}\200\346\220)\015\024\356n\366\365\375n[\333\273\026\212\206\\Y\263\346\212\336\336\033B\251\314\375F\365\365\365yJ\346\262P\311\224\254\267\002\310\021\231\222\027[\266l\211\3669\217\341\336\371\345\227_>+kZ[[\177\345W~\305\275\366\250\354\330\261#\374 e\275\025@\216\310\224\274(\024\0121\377\005\307\317|\3463\227]v\331\254R\351\354\354\354\356\366\212\345\210\014\015\0159\034\037\320L2%/"\317\224\340\352\253\257\256m\224u\353\326m\334\270\321\243)Q\221)@\223\311\224\274\350\350\350\210|\311\177\370\341\207W\255ZUi\224\367\274\347=k\327\256\275\346\232k\034\2436*{\367\356\355\354\354\314z+\200\034\221)y\021V\227\370_Az\375\365\327W2eKY\261X\354\351\351\011\201%V"!S\200&\223)y\261,2ebb\342]\357z\327\345\227_\336\326\326\026\336\256\274sllL\254Dbttt\343\306\215Yo\005\220#2%/z{{\207\207\207\263\336\212\013+\026\213\277\374\313\277<\367\231\263b%\006\343\343\343\205B!\353\255\000rD\246\344\3052:6I\251l\336\017Uc%\376G\206V$\231\0024\231L\311\213e\224)\027\024b\245\263L\2544Y\310\307\326\326\326\254\267\002\310\021\231\222\027+\357\370\241\225\247s\212\225&kiq\243\0014\217[\234\274Xy\231R!V\232L\246\000\315\344\026''/Vj\246TTcett4\353mY\341\342?N \260\222\310\224\274\310\303\361CC\254l\334\270\261\247\247''\362\003\331-k2\005h&\231\222\027y\310\224\212\221\221\221\216\216\016\261\322 \355\355\355\305b1\353\255\000\362B\246\344\305\360\360pooo\326[\321<b\245A<\015\010h&\231\222\027\371<\314y5V<\000\220\026\231\0024\223L\311\213|fJE\210\225\366\366\366\276\276>O\252\270x\313\345p\306\300\312 S\362bll\254\243\243#\353\255\310\322\320\320P\241P\020+\027i%\035''\020\210\237L\311\013\2079\257\020+\027I\246\000\315$S\362B\246\324\022+o\331\312>\000\017\020\033\231\222\027\376\032\313\\!V\332\333\333\267n\335:11\221\365\266,\0332\005h&\231\222#\016s>W\250\267\301\301\301B\241 V\226h``\240\277\277?\353\255\000\362\302\272\225#2e!be\351\362s\234@ \006\326\255\034ikk\263\006/B\254,\205L\001\232I\246\344\210\277\306\262\024\325X\331\266m\333\344\344d\326\233\023\235\335\273wwwwg\275\025@^\310\224\034\221)K\027b%d\212X\231+\317\307\011\004\232O\246\344\210\303\234\327+\004\212X\231E\246\000\315$SrD\246\2745b\245\226\003\360\000\315$Sr\244\273\273{\367\356\335Yo\305rU\215\225\201\201\201R\251\224\365\346dF\246\000\315$Sr\304a\316/^\210\225\376\376\376\260N\017\016\016\3463V&&&\332\332\332\262\336\012 /dJ\216\310\224\264\204\245z\353\326\255\271\215\025\007\340\001\232\306\315M\216\204\2255,\253Yo\305\312\221\333X\221)@\323\270\271\311\021\177\215\245\021\252\261\262c\307\216\254\267\245I\034''\020h\032\231\222#2\245q\302\262\275e\313\226\020+y\370\265\232\003\360\000M#Srdpp0\334\357\317z+V\262\260x\367\365\365\255\370X\221)@\323\310\224\034\361\327X\232c\305\307\212\003\360\000M#SV\270\341\341\341\226\226\226\326\326\326\216\216\216u\353\326\255^\275:\374\367\347~\356\347\212\305b\326\233\266\302Uc%\354\202\254\267%e2\005h\032\231\262\302\375\307\177\374G\313\034\327]w\335\310\310H\326\233\226\013!Vz{{C#\256\244o\270\343\004\002M#SV\270R\251t\371\345\227\3276\312\007?\370\301\266\2666\007}o\246\261\261\261\236\236\236\025\023+\016\300\0034\215LY\371>\363\231\317\274\355mo\253f\312\307?\376\361\376\376\376\2547*\217VL\254\310\024\240idJ.\\}\365\325\225F\371\371\237\377\371B\241\220\253c\221\305f\005\304J\310\334\201\201\201\254\267\002\310\005\231\222\013\017?\374\360\252U\253\336\371\316w\256^\275z\371\256\216+I%V\226\351sQ\035\200\007h\032\231\222\027\327_\177\375\257\377\372\257_~\371\345Yo\010\377+4Jg\331\362\212\025\231\0024\215L\311\213\211\211\211B\241\340\257\261Dh\331\305\212\003\360\000Mc\321\312\027\231\022\255e\024+2\005h\032\213V3\224J\245\341\341\341\336\336\336\260\010U\036\322\310\247p\331\303w\240\247\247''\254s^\021=\257J\254tww\217\215\215e\275-\013\252\3740g\275\025@.\310\224\206\333\275{wX\236\303\315\372=\367\334\363\320\236=\317\035>|vj*\237\023.{\370\016\354\332\265k\363\346\315+\370X\362\027/\374\314ttt\204\236\2133V*-\225\365V\000\271 S\032hrr\262\257\257\257\253\253\353\310\213G\316N\2355\265s\354\225c!V\3027gbb"\353\035\025\251\221\221\2218cE\246\000M#S\032%4JXc\356\336y\327\331\2513f\241\271\357\376\3736l\330\340\317\355."\302X)\026\213\355\355\355Yo\005\220\0132\245Q\372\372\372\312\215\362\206Y|\036\332\363\340\246M\277\231\365\356\212]%Vz{{cH\272\260\015\205B!\353\255\000rA\2464\304\356\335\273\273\272n\230\232.\231\245\314\247\377\364O\266o\377\\\326;m\031\030\036\036\016}\020\0128\333X\221)@\323\310\224\364\225J\245p#\376\342\321\361\251\351\323f)s\362\324O\326\257\377`\261X\314z\327-\017CCC\231\307J\213W\266\003M\341\266&}\225\243JLM\277^\235\353\272\177g\211/\331\255\375\254\\\315\366\355\177\351\017"\326%\333X\221)@s\270\255I_OO\317\256{\377\375\177\033\345\206\256\037%\311\013\347\222g\247\222\357\236I\236:\223<qrz\360\336\257\177\355\350k\217\235M\376\273\224<VJ\366\275\236<\370F\362\367\373\236\271m\313\3072/\206L\346\311\375\243\035\035\035Y\357\272\345\247\022+[\266li\346\013\246*/as\344\033\240\011dJ\372\332\333\333\017\036<05}\2522\341~\347\311$95\223\2746\235\274z6y=I\376\370\317>\333r\351;6\336\320st*9r&9\362F2^J\236\233N\276\362\355\247\312\017\250\234\312\341\234<u\274\265\2655\353]\267\\\355\330\261#\304\312\326\255[\233\020+\241N6m\332t\367\316\235\235\235\235J\005h4\231\222\2765k\326\274r\374\350\324\364\311\312\204\362x\375\\r\346\334\371\017M\317\234\377\367\253\017\374\3275\277\364k\177~\307\347\247\223\344\304t\362\332T\362\352T\022n\357\037|\374\351r\246\234\314\347\370=\302\305(\225J\203\203\203\215\216\225J\243<\361\344\376\263S\323\341_\245\0024\232\205!}\345\3248Q\235\360\337S\323\311\361\323\311\331s?=A\270e\377\333/~\351s\177\363\305#/\235_N\246f\222\263\345|y\364\311\247f}n\256F\246\\\274\206\306Jm\243TF\251\000\215faH_95\376\247:\3473\345\\r\354\365\344\307''\223\251$9{\346L\373\272u--\227\265\264\264~\344\3677\327~\342\023\373\017\314\372\334\\\215LIKm\254\244\325\020s\033E\251\000M`aH_95^\253N\345\227>\307O''/\235H^~#y\342\340\017\256\276\372\352\313\336\366\366\325W^\325\373\007?\223)\217?\271\177\326\347\346jdJ\272\252\261\262m\333\266\213\314\210\205\032E\251\000\215faH_95&\253\023\376{z&y\265t\376\321\224co${\036/~`\375\265W\375\342\273\257\\\363\013_\372\347\257\274\221$''\317$\257\2379\377\211\373F\037\237\365\271\271\032\231\322\010\241\036B\246\\L\254,\336(J\005h(\013C\372\302r;=\375\223\352TV\337P*\257M%?9\233\274tb\352\321g\306\327\377\306\207\256\373\255\337~\371L\362\343R\362r)9~&\011\241\262\357\261\307g}n\256F\2464\316[\216\225\2454\212R\001\032\307\302\220\276Y\251\321y\335\246\247\277\367\354\023\317\024G\307\212\217\354/>r\340\320\243O\037\376\306c\337\375\3663\317?\274\377\320\267\366\177\377\221\003\337\037}\352\3203\317\376\360\316\177\334y\323\3157e\236\0132e\245\2527V\226\336(J\005h\020\013C\372\312\231\362j\355|\342\023\037[\312!h\177\357#\037\231\365\211\271\032\231\322\034\225Xioo\037\034\034,\225J\213\234\254\256FQ*@#X\030\322W\316\224\343\246\336\221)\315411\261u\353\326B\2410o\254\274\265FQ*@\352,\014\351;\237)\347^1\365\216Li\276ycen\243\334w\377\003\353\326\265?w\370\360\274]r\354\225\343\353\327\257\277{\347N\245\002\244\316\302\220\276r\246\0343\365\216L\311Jm\254\314\333(\255\255\255a\357\254][\230[*\225F\251\374\326R\251\000\251\2630\244\257\234)/\233zG\246dn\221F\251\230U*\265\215\242T\200F\2600\244\257\234)?6\365\216L\311\326\334F9q\362T[[\333\254''zWKen\243\004\241i\216\274xT\251\000i\2610\244\257\234)\023\246\336\221)\0152<<<>>\276\370i\0269\026\376\2325k\346\226\312\376\003\007\346m\224\373\356\177\3003j\201\024Y\030\322''SdJ<\016\035:Ti\210+\256\270b\327\256]\363\236\346\202\307\302\237[*o\177\373\333\227\322(J\005\270H\026\206\364\2253\345G\215\236\332\025b\356\207\346=\375\254\017\265\314g\241\363i\302\205\222)\215P*\225.\275\364\322\312\316]\265j\325\373\337\377\376Y\217\254,\361X\370sKe\211\215\242T\200\213aaH_\270\325>w\356\245\324g\326\302\260\304\323\314=}\365\355\271g2\353S\346=\237\006]\272\312\227\310z\327\255L\263\236_\262z\365\352[o\275\265\362\362\343\272\216\205\277P\251\\\260Q\224\012\360\226Y\030\322W^\310\2176t\226\376%\0269e\365C\013\275Q\375w\356\011\032t\241\30226\377\275u\032#4\312C{\276\276\304\343\266}c\3577/\273\354\262Y\347p\311%\227\354\334\371\345%\236C\370Za\027g}\005\005\226\023\231\222\276\226\363k\371\213\351\316\005\327\233\352\311j?e\326{\346\236g\3559\327\236x\356\231_\360\334R\271\214Y\357\272\225\351\312+\257\254\356\312\236\262\320\012\305b1|hll,\224\312\261W\216_\2600\346}]O\305\274\307S\231\367\034\302\327\015_1\353\357\007\260\234X\030\322W^\313\217\244>\265g\273\320\333\325\377V\337\371\263\265q\244\372\306\254\323\314{\266\265''\236\373\205\032q\001\263\336u+\320\344\344de?\266\267\267\177\364\243\037\015\377\016\017\017\327\236`)\245\262H\243,\261T4\012\360\326X\030\322W^\316\177\230\372,\262H,t\202\312;\253\377VO\266\310\031\326\236f\241\177\03342\245\021^x\341\205\326\326\326\356\356\356B\241\320\337\337?\357SC\026/\225y\033\345\222K.Yz\251h\024\340-\2630\244\257q\231r\301\267\027\372\350B\2312\357''\316=\301\342_N\246Dndddhhh\361C\247,T*\013\035\303\355\357\377\357\027\347=\236\312\274G\323\327(\300[faH_y!\177!\365\231\367\301\2177\037\002\231\3774\225\367T\377\255\236\246\366\215yO\274\270F\\\272\312\327\315z\327\345\332\334RY\250Q*\257\353Y\350\310o\263\216\246\257Q\200\213aaH\337\371\205|f\274\241\263\370\227\250\375h\345\355\271\357\231\365\241\271''[\342\327J\367Be\275\353\362nn\251l\336|\313\274\215\262\320\253\224\273\272\272N\234<\245Q\200\264X\030\322W^\327\237O}\026{x\243\3464\213\374[{>\265\037\232\365\236\332\263\232\373u\033q\321\252_(\353]\307b\245\262\320\261\360\253\245\242Q\200\324Y\030\322W^\313\177\320\320\231\367KT\337\271\310\033\013\275\263\256\2235\356Be\275\3538o\336RY\374X\370\241T4\012\320\010\026\206\364\225\327\365\303\351\316"\017\245\274\371 \307\317\234\262\362F\355;\347\236\341\274\347_\327\327J\3752f\275\353\370\251\271\245\262\370\221j\277s\360\240F\001\032\301\302\220\276\362B\376\234\251wdJT\226~\3447\257\353\001\032\307\302\220\276r\246<k\352\035\231\022\233zKE\243\000\251\2630\244O\246\310\224\025\243\256\243\351k\024 u\026\206\364\205\345vf\346\220\251wdJ\234\226x4}\215\0024\202\205!}\345L\371\276\251wdJ\264.x4}\215\0024\210\205!}\345L)\232zG\246\304l\221\243\351k\024\240q,\014\351+g\312\367L\275#S"7\357\321\3645\012\320P\026\206\364\265\266\266\236>}`f\346\273\246\256\221)\361\253-\025\215\0024\201\205!}\205B\341\371\347\27763s\320\32452eY\250\224\312s\207\017k\024\240\011,\014\351\353\356\356\376\317\335;f\222\357\230\245\317\367\212_moo\317z\327\261$\241NB\213k\024\240\011dJ\372\006\006\006\372\373o\315|\341_^\363\345\241;\372\372\372\262\336u\000\304E\246\244o||\274\275\375}\247KO\314$\317\230%NO\317\365###Y\357:\000\342"S\032b\333y[f\222\247\315R\346\337\206\377\272\267\267;\353\235\006@tdJC\224J\245\316\316\017\215\216\376K\222<e\026\237\211\211=\355\355\357\233\234\334\227\365N\003 :2\245Q\212\305bG\307\272bq$I\306\314B\023\032%\364\334\336\275we\275\273\000\210\221Li\240\321\321\321P*\003\003\177\224$\007\314\334\031\031\371B{{a\357\336\177\312zG\001\020)\231\322X\245R\251\277\277\257\263\363\332\241\241\277\230\230x0I\366\233\311\311o\016\017\377UooWOOgx;\353]\004@\274dJ3\354\335\273\267\257\357w\333\332\336\325BK\313\2325W\364\366\336\020J%\353\335\002@\354d\012\000\020)\231\002\000DJ\246\000\000\221\222)\000@\244d\012\000\020)\231\002\000DJ\246\000\000\221\222)\000@\244d\012\000\020)\231\002\000DJ\246\000\000\221\222)\000@\244d\012\000\020)\231\002\000DJ\246\000\000\221\222)\000@\244d\012\000\020)\231\002\000DJ\246\000\000\221\222)\000@\244d\012\000\020)\231\002\000DJ\246\000\000\221\222)\000@\244d\012\000\020)\231\002\000DJ\246\000\000\221\222)\000@\244d\012\000\020)\231\002\000DJ\246\000\000\221\222)\000@\244d\012\000\020)\231\002\000DJ\246\000\000\221\222)\000@\244d\012\000\020)\231\002\000DJ\246\000\000\221\222)\000@\244d\012\000\020)\231\002\000DJ\246\000\000\221\222)\000@\244d\012\000\020)\231\002\000DJ\246\000\000\221\222)\000@\244d\012\000\020)\231\002\000DJ\246\000\000\221\222)\000@\244d\012\000\020)\231\002\000DJ\246\000\000\221\222)\000@\244d\012\000\020)\231\002\000DJ\246\000\000\221\222)\000@\244d\012\000\020)\231\002\000DJ\246\000\000\221\222)\000@\244d\012\000\020)\231\002\000DJ\246\000\000\221\222)\000@\244d\012\000\020)\231\002\000DJ\246\000\000\221\222)\000@\244d\012\000\020)\231\002\000DJ\246\000\000\221\222)\000@\244d\012\000\020)\231\002\000DJ\246\000\000\221\222)\000@\244d\012\000\020)\231\002\000DJ\246\000\000\221\222)\000@\244d\012\000\020)\231\002\000DJ\246\000\000\221\222)\000@\244d\012\000\020)\231\002\000DJ\246\000\000\221\222)\000@\244d\012\000\020)\231\002\000DJ\246\000\000\221\222)\000@\244d\012\000\020)\231\002\000DJ\246\000\000\221\222)\000@\244d\012\000\020)\231\002\000DJ\246\000\000\221\222)\000@\244d\012\000\020)\231\002\000DJ\246\000\000\221\222)\000@\244d\012\000\020)\231\002\000DJ\246\000\000\221\222)\000@\244d\012\000\020)\231\002\000DJ\246\000\000\221\222)\000@\244d\012\000\020)\231\002\000DJ\246\000\000\221\222)\000@\244d\012\000\020)\231\002\000DJ\246\000\000\221\222)\000@\244d\012\000\020)\231\002\000DJ\246\000\000\221\222)\000@\244d\012\000\020)\231\002\000DJ\246\000\000\221\222)\000@\244d\012\000\020)\231\002\000DJ\246\000\000\221\222)\000@\244d\012\000\020)\231\002\000DJ\246\000\000\221\222)\000@\244d\012\000\020)\231\002\000DJ\246\000\000\221\222)\000@\244\376?\267\226\347\375\022(\324\336\000\000\000\000IEND\256B`\202', '0');
INSERT INTO "public"."act_ge_bytearray" VALUES ('1904', '1', 'freeLeave/freeLeave.bpmn', '1901', '<?xml version="1.0" encoding="UTF-8"?>\015\012<definitions xmlns="http://www.omg.org/spec/BPMN/20100524/MODEL" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:activiti="http://activiti.org/bpmn" xmlns:bpmndi="http://www.omg.org/spec/BPMN/20100524/DI" xmlns:omgdc="http://www.omg.org/spec/DD/20100524/DC" xmlns:omgdi="http://www.omg.org/spec/DD/20100524/DI" typeLanguage="http://www.w3.org/2001/XMLSchema" expressionLanguage="http://www.w3.org/1999/XPath" targetNamespace="http://www.rguess.org/demo/activiti/leave">\015\012  <process id="freeLeave" name="\350\207\252\347\224\261\346\265\201\350\257\267\345\201\207" isExecutable="true">\015\012    <documentation>\350\207\252\347\224\261\346\265\201\350\257\267\345\201\207</documentation>\015\012    <startEvent id="startevent1" name="Start" activiti:initiator="applyUser"></startEvent>\015\012    <userTask id="approval" name="\345\256\241\346\211\271" activiti:assignee="${approvalUser}">\015\012      <multiInstanceLoopCharacteristics isSequential="true">\015\012        <loopCardinality>10</loopCardinality>\015\012        <completionCondition>${endTag}</completionCondition>\015\012      </multiInstanceLoopCharacteristics>\015\012    </userTask> \015\012    \015\012    <userTask id="usertask1" name="\351\207\215\346\226\260\350\260\203\346\225\264" activiti:assignee="${applyUser}"></userTask>\015\012    <exclusiveGateway id="exclusivegateway1" name="Exclusive Gateway"></exclusiveGateway>\015\012    \015\012    <endEvent id="endevent1" name="End"></endEvent>\015\012    <sequenceFlow id="flow1" sourceRef="startevent1" targetRef="approval"></sequenceFlow>\015\012    <sequenceFlow id="flow2" sourceRef="approval" targetRef="endevent1">\015\012    \011<conditionExpression xsi:type="tFormalExpression"><![CDATA[${auditerPass}]]></conditionExpression>\015\012    </sequenceFlow>\015\012    <sequenceFlow id="flow3" sourceRef="approval" targetRef="usertask1">\015\012    \011<conditionExpression xsi:type="tFormalExpression"><![CDATA[${!auditerPass}]]></conditionExpression>\015\012    </sequenceFlow>\015\012    <sequenceFlow id="flow4" sourceRef="usertask1" targetRef="exclusivegateway1"></sequenceFlow>\015\012    <sequenceFlow id="flow5" sourceRef="exclusivegateway1" targetRef="approval">\015\012    \011<conditionExpression xsi:type="tFormalExpression"><![CDATA[${reApply}]]></conditionExpression>\015\012    </sequenceFlow>\015\012    <sequenceFlow id="flow6" sourceRef="exclusivegateway1" targetRef="endevent1">\015\012    \011<conditionExpression xsi:type="tFormalExpression"><![CDATA[${!reApply}]]></conditionExpression>\015\012    </sequenceFlow>\015\012  </process>\015\012  <bpmndi:BPMNDiagram id="BPMNDiagram_freeLeave">\015\012    <bpmndi:BPMNPlane bpmnElement="freeLeave" id="BPMNPlane_freeLeave">\015\012      <bpmndi:BPMNShape bpmnElement="startevent1" id="BPMNShape_startevent1">\015\012        <omgdc:Bounds height="35.0" width="35.0" x="30.0" y="120.0"></omgdc:Bounds>\015\012      </bpmndi:BPMNShape>\015\012      <bpmndi:BPMNShape bpmnElement="approval" id="BPMNShape_approval">\015\012        <omgdc:Bounds height="55.0" width="105.0" x="110.0" y="110.0"></omgdc:Bounds>\015\012      </bpmndi:BPMNShape>\015\012      <bpmndi:BPMNShape bpmnElement="endevent1" id="BPMNShape_endevent1">\015\012        <omgdc:Bounds height="35.0" width="35.0" x="340.0" y="120.0"></omgdc:Bounds>\015\012      </bpmndi:BPMNShape>\015\012      <bpmndi:BPMNShape bpmnElement="usertask1" id="BPMNShape_usertask1">\015\012        <omgdc:Bounds height="55.0" width="105.0" x="113.0" y="210.0"></omgdc:Bounds>\015\012      </bpmndi:BPMNShape>\015\012      <bpmndi:BPMNShape bpmnElement="exclusivegateway1" id="BPMNShape_exclusivegateway1">\015\012        <omgdc:Bounds height="40.0" width="40.0" x="340.0" y="217.0"></omgdc:Bounds>\015\012      </bpmndi:BPMNShape>\015\012      <bpmndi:BPMNEdge bpmnElement="flow1" id="BPMNEdge_flow1">\015\012        <omgdi:waypoint x="65.0" y="137.0"></omgdi:waypoint>\015\012        <omgdi:waypoint x="110.0" y="137.0"></omgdi:waypoint>\015\012      </bpmndi:BPMNEdge>\015\012      <bpmndi:BPMNEdge bpmnElement="flow2" id="BPMNEdge_flow2">\015\012        <omgdi:waypoint x="215.0" y="137.0"></omgdi:waypoint>\015\012        <omgdi:waypoint x="340.0" y="137.0"></omgdi:waypoint>\015\012      </bpmndi:BPMNEdge>\015\012      <bpmndi:BPMNEdge bpmnElement="flow3" id="BPMNEdge_flow3">\015\012        <omgdi:waypoint x="162.0" y="165.0"></omgdi:waypoint>\015\012        <omgdi:waypoint x="165.0" y="210.0"></omgdi:waypoint>\015\012      </bpmndi:BPMNEdge>\015\012      <bpmndi:BPMNEdge bpmnElement="flow4" id="BPMNEdge_flow4">\015\012        <omgdi:waypoint x="218.0" y="237.0"></omgdi:waypoint>\015\012        <omgdi:waypoint x="340.0" y="237.0"></omgdi:waypoint>\015\012      </bpmndi:BPMNEdge>\015\012      <bpmndi:BPMNEdge bpmnElement="flow5" id="BPMNEdge_flow5">\015\012        <omgdi:waypoint x="360.0" y="217.0"></omgdi:waypoint>\015\012        <omgdi:waypoint x="162.0" y="165.0"></omgdi:waypoint>\015\012      </bpmndi:BPMNEdge>\015\012      <bpmndi:BPMNEdge bpmnElement="flow6" id="BPMNEdge_flow6">\015\012        <omgdi:waypoint x="360.0" y="217.0"></omgdi:waypoint>\015\012        <omgdi:waypoint x="357.0" y="155.0"></omgdi:waypoint>\015\012      </bpmndi:BPMNEdge>\015\012    </bpmndi:BPMNPlane>\015\012  </bpmndi:BPMNDiagram>\015\012</definitions>', '0');
INSERT INTO "public"."act_ge_bytearray" VALUES ('1905', '1', 'leave/leave.bpmn', '1901', '<?xml version="1.0" encoding="UTF-8"?>\015\012<definitions xmlns="http://www.omg.org/spec/BPMN/20100524/MODEL"\015\012\011xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:activiti="http://activiti.org/bpmn"\015\012\011xmlns:bpmndi="http://www.omg.org/spec/BPMN/20100524/DI" xmlns:omgdc="http://www.omg.org/spec/DD/20100524/DC"\015\012\011xmlns:omgdi="http://www.omg.org/spec/DD/20100524/DI" typeLanguage="http://www.w3.org/2001/XMLSchema"\015\012\011expressionLanguage="http://www.w3.org/1999/XPath" targetNamespace="http://www.rguess.org/demo/activiti/leave">\015\012\011<process id="leave" name="\350\257\267\345\201\207\346\265\201\347\250\213">\015\012\011\011<documentation>\350\257\267\345\201\207\346\265\201\347\250\213\346\274\224\347\244\272</documentation>\015\012\011\011<startEvent id="startevent1" name="Start"\015\012\011\011\011activiti:initiator="applyUserId"></startEvent>\015\012\011\011<userTask id="deptLeaderAudit" name="\351\203\250\351\227\250\351\242\206\345\257\274\345\256\241\346\211\271"\015\012\011\011\011activiti:candidateGroups="deptLeader"></userTask>\015\012\011\011<exclusiveGateway id="exclusivegateway5" name="Exclusive Gateway"></exclusiveGateway>\015\012\011\011<userTask id="modifyApply" name="\350\260\203\346\225\264\347\224\263\350\257\267" activiti:assignee="${applyUserId}">\015\012\011\011\011<extensionElements>\015\012\011\011\011\011<activiti:taskListener event="complete"\015\012\011\011\011\011\011delegateExpression="${afterModifyApplyContentProcessor}"></activiti:taskListener>\015\012\011\011\011</extensionElements>\015\012\011\011</userTask>\015\012\011\011<userTask id="hrAudit" name="\344\272\272\344\272\213\345\256\241\346\211\271" activiti:candidateGroups="hr"></userTask>\015\012\011\011<exclusiveGateway id="exclusivegateway6" name="Exclusive Gateway"></exclusiveGateway>\015\012\011\011<userTask id="reportBack" name="\351\224\200\345\201\207" activiti:assignee="${applyUserId}">\015\012\011\011\011<extensionElements>\015\012\011\011\011\011<activiti:taskListener event="complete"\015\012\011\011\011\011\011delegateExpression="${reportBackEndProcessor}"></activiti:taskListener>\015\012\011\011\011</extensionElements>\015\012\011\011</userTask>\015\012\011\011<endEvent id="endevent1" name="End"></endEvent>\015\012\011\011<exclusiveGateway id="exclusivegateway7" name="Exclusive Gateway"></exclusiveGateway>\015\012\011\011<sequenceFlow id="flow2" name="" sourceRef="startevent1"\015\012\011\011\011targetRef="deptLeaderAudit"></sequenceFlow>\015\012\011\011<sequenceFlow id="flow3" name="" sourceRef="deptLeaderAudit"\015\012\011\011\011targetRef="exclusivegateway5"></sequenceFlow>\015\012\011\011<sequenceFlow id="flow4" name="\344\270\215\345\220\214\346\204\217" sourceRef="exclusivegateway5"\015\012\011\011\011targetRef="modifyApply">\015\012\011\011\011<conditionExpression xsi:type="tFormalExpression"><![CDATA[${!deptLeaderPass}]]></conditionExpression>\015\012\011\011</sequenceFlow>\015\012\011\011<sequenceFlow id="flow5" name="\345\220\214\346\204\217" sourceRef="exclusivegateway5"\015\012\011\011\011targetRef="hrAudit">\015\012\011\011\011<conditionExpression xsi:type="tFormalExpression"><![CDATA[${deptLeaderPass}]]></conditionExpression>\015\012\011\011</sequenceFlow>\015\012\011\011<sequenceFlow id="flow6" name="" sourceRef="hrAudit"\015\012\011\011\011targetRef="exclusivegateway6"></sequenceFlow>\015\012\011\011<sequenceFlow id="flow7" name="\345\220\214\346\204\217" sourceRef="exclusivegateway6"\015\012\011\011\011targetRef="reportBack">\015\012\011\011\011<conditionExpression xsi:type="tFormalExpression"><![CDATA[${hrPass}]]></conditionExpression>\015\012\011\011</sequenceFlow>\015\012\011\011<sequenceFlow id="flow8" name="" sourceRef="reportBack"\015\012\011\011\011targetRef="endevent1"></sequenceFlow>\015\012\011\011<sequenceFlow id="flow9" name="\344\270\215\345\220\214\346\204\217" sourceRef="exclusivegateway6"\015\012\011\011\011targetRef="modifyApply">\015\012\011\011\011<conditionExpression xsi:type="tFormalExpression"><![CDATA[${!hrPass}]]></conditionExpression>\015\012\011\011</sequenceFlow>\015\012\011\011<sequenceFlow id="flow10" name="\351\207\215\346\226\260\347\224\263\350\257\267" sourceRef="exclusivegateway7"\015\012\011\011\011targetRef="deptLeaderAudit">\015\012\011\011\011<conditionExpression xsi:type="tFormalExpression"><![CDATA[${reApply}]]></conditionExpression>\015\012\011\011</sequenceFlow>\015\012\011\011<sequenceFlow id="flow11" name="" sourceRef="modifyApply"\015\012\011\011\011targetRef="exclusivegateway7"></sequenceFlow>\015\012\011\011<sequenceFlow id="flow12" name="\347\273\223\346\235\237\346\265\201\347\250\213" sourceRef="exclusivegateway7"\015\012\011\011\011targetRef="endevent1">\015\012\011\011\011<conditionExpression xsi:type="tFormalExpression"><![CDATA[${!reApply}]]></conditionExpression>\015\012\011\011</sequenceFlow>\015\012\011</process>\015\012\011<bpmndi:BPMNDiagram id="BPMNDiagram_leave">\015\012\011\011<bpmndi:BPMNPlane bpmnElement="leave" id="BPMNPlane_leave">\015\012\011\011\011<bpmndi:BPMNShape bpmnElement="startevent1"\015\012\011\011\011\011id="BPMNShape_startevent1">\015\012\011\011\011\011<omgdc:Bounds height="35" width="35" x="10" y="90"></omgdc:Bounds>\015\012\011\011\011</bpmndi:BPMNShape>\015\012\011\011\011<bpmndi:BPMNShape bpmnElement="deptLeaderAudit"\015\012\011\011\011\011id="BPMNShape_deptLeaderAudit">\015\012\011\011\011\011<omgdc:Bounds height="55" width="105" x="90" y="80"></omgdc:Bounds>\015\012\011\011\011</bpmndi:BPMNShape>\015\012\011\011\011<bpmndi:BPMNShape bpmnElement="exclusivegateway5"\015\012\011\011\011\011id="BPMNShape_exclusivegateway5">\015\012\011\011\011\011<omgdc:Bounds height="40" width="40" x="250" y="87"></omgdc:Bounds>\015\012\011\011\011</bpmndi:BPMNShape>\015\012\011\011\011<bpmndi:BPMNShape bpmnElement="modifyApply"\015\012\011\011\011\011id="BPMNShape_modifyApply">\015\012\011\011\011\011<omgdc:Bounds height="55" width="105" x="218" y="190"></omgdc:Bounds>\015\012\011\011\011</bpmndi:BPMNShape>\015\012\011\011\011<bpmndi:BPMNShape bpmnElement="hrAudit" id="BPMNShape_hrAudit">\015\012\011\011\011\011<omgdc:Bounds height="55" width="105" x="358" y="80"></omgdc:Bounds>\015\012\011\011\011</bpmndi:BPMNShape>\015\012\011\011\011<bpmndi:BPMNShape bpmnElement="exclusivegateway6"\015\012\011\011\011\011id="BPMNShape_exclusivegateway6">\015\012\011\011\011\011<omgdc:Bounds height="40" width="40" x="495" y="87"></omgdc:Bounds>\015\012\011\011\011</bpmndi:BPMNShape>\015\012\011\011\011<bpmndi:BPMNShape bpmnElement="reportBack" id="BPMNShape_reportBack">\015\012\011\011\011\011<omgdc:Bounds height="55" width="105" x="590" y="80"></omgdc:Bounds>\015\012\011\011\011</bpmndi:BPMNShape>\015\012\011\011\011<bpmndi:BPMNShape bpmnElement="endevent1" id="BPMNShape_endevent1">\015\012\011\011\011\011<omgdc:Bounds height="35" width="35" x="625" y="283"></omgdc:Bounds>\015\012\011\011\011</bpmndi:BPMNShape>\015\012\011\011\011<bpmndi:BPMNShape bpmnElement="exclusivegateway7"\015\012\011\011\011\011id="BPMNShape_exclusivegateway7">\015\012\011\011\011\011<omgdc:Bounds height="40" width="40" x="250" y="280"></omgdc:Bounds>\015\012\011\011\011</bpmndi:BPMNShape>\015\012\011\011\011<bpmndi:BPMNEdge bpmnElement="flow2" id="BPMNEdge_flow2">\015\012\011\011\011\011<omgdi:waypoint x="45" y="107"></omgdi:waypoint>\015\012\011\011\011\011<omgdi:waypoint x="90" y="107"></omgdi:waypoint>\015\012\011\011\011</bpmndi:BPMNEdge>\015\012\011\011\011<bpmndi:BPMNEdge bpmnElement="flow3" id="BPMNEdge_flow3">\015\012\011\011\011\011<omgdi:waypoint x="195" y="107"></omgdi:waypoint>\015\012\011\011\011\011<omgdi:waypoint x="250" y="107"></omgdi:waypoint>\015\012\011\011\011</bpmndi:BPMNEdge>\015\012\011\011\011<bpmndi:BPMNEdge bpmnElement="flow4" id="BPMNEdge_flow4">\015\012\011\011\011\011<omgdi:waypoint x="270" y="127"></omgdi:waypoint>\015\012\011\011\011\011<omgdi:waypoint x="270" y="190"></omgdi:waypoint>\015\012\011\011\011\011<bpmndi:BPMNLabel>\015\012\011\011\011\011\011<omgdc:Bounds height="11" width="100" x="10" y="0"></omgdc:Bounds>\015\012\011\011\011\011</bpmndi:BPMNLabel>\015\012\011\011\011</bpmndi:BPMNEdge>\015\012\011\011\011<bpmndi:BPMNEdge bpmnElement="flow5" id="BPMNEdge_flow5">\015\012\011\011\011\011<omgdi:waypoint x="290" y="107"></omgdi:waypoint>\015\012\011\011\011\011<omgdi:waypoint x="358" y="107"></omgdi:waypoint>\015\012\011\011\011\011<bpmndi:BPMNLabel>\015\012\011\011\011\011\011<omgdc:Bounds height="11" width="100" x="-24" y="-17"></omgdc:Bounds>\015\012\011\011\011\011</bpmndi:BPMNLabel>\015\012\011\011\011</bpmndi:BPMNEdge>\015\012\011\011\011<bpmndi:BPMNEdge bpmnElement="flow6" id="BPMNEdge_flow6">\015\012\011\011\011\011<omgdi:waypoint x="463" y="107"></omgdi:waypoint>\015\012\011\011\011\011<omgdi:waypoint x="495" y="107"></omgdi:waypoint>\015\012\011\011\011</bpmndi:BPMNEdge>\015\012\011\011\011<bpmndi:BPMNEdge bpmnElement="flow7" id="BPMNEdge_flow7">\015\012\011\011\011\011<omgdi:waypoint x="535" y="107"></omgdi:waypoint>\015\012\011\011\011\011<omgdi:waypoint x="590" y="107"></omgdi:waypoint>\015\012\011\011\011\011<bpmndi:BPMNLabel>\015\012\011\011\011\011\011<omgdc:Bounds height="11" width="100" x="-22" y="-17"></omgdc:Bounds>\015\012\011\011\011\011</bpmndi:BPMNLabel>\015\012\011\011\011</bpmndi:BPMNEdge>\015\012\011\011\011<bpmndi:BPMNEdge bpmnElement="flow8" id="BPMNEdge_flow8">\015\012\011\011\011\011<omgdi:waypoint x="642" y="135"></omgdi:waypoint>\015\012\011\011\011\011<omgdi:waypoint x="642" y="283"></omgdi:waypoint>\015\012\011\011\011</bpmndi:BPMNEdge>\015\012\011\011\011<bpmndi:BPMNEdge bpmnElement="flow9" id="BPMNEdge_flow9">\015\012\011\011\011\011<omgdi:waypoint x="515" y="127"></omgdi:waypoint>\015\012\011\011\011\011<omgdi:waypoint x="514" y="217"></omgdi:waypoint>\015\012\011\011\011\011<omgdi:waypoint x="323" y="217"></omgdi:waypoint>\015\012\011\011\011\011<bpmndi:BPMNLabel>\015\012\011\011\011\011\011<omgdc:Bounds height="11" width="100" x="10" y="0"></omgdc:Bounds>\015\012\011\011\011\011</bpmndi:BPMNLabel>\015\012\011\011\011</bpmndi:BPMNEdge>\015\012\011\011\011<bpmndi:BPMNEdge bpmnElement="flow10" id="BPMNEdge_flow10">\015\012\011\011\011\011<omgdi:waypoint x="250" y="300"></omgdi:waypoint>\015\012\011\011\011\011<omgdi:waypoint x="142" y="299"></omgdi:waypoint>\015\012\011\011\011\011<omgdi:waypoint x="142" y="135"></omgdi:waypoint>\015\012\011\011\011\011<bpmndi:BPMNLabel>\015\012\011\011\011\011\011<omgdc:Bounds height="11" width="100" x="10" y="0"></omgdc:Bounds>\015\012\011\011\011\011</bpmndi:BPMNLabel>\015\012\011\011\011</bpmndi:BPMNEdge>\015\012\011\011\011<bpmndi:BPMNEdge bpmnElement="flow11" id="BPMNEdge_flow11">\015\012\011\011\011\011<omgdi:waypoint x="270" y="245"></omgdi:waypoint>\015\012\011\011\011\011<omgdi:waypoint x="270" y="280"></omgdi:waypoint>\015\012\011\011\011</bpmndi:BPMNEdge>\015\012\011\011\011<bpmndi:BPMNEdge bpmnElement="flow12" id="BPMNEdge_flow12">\015\012\011\011\011\011<omgdi:waypoint x="290" y="300"></omgdi:waypoint>\015\012\011\011\011\011<omgdi:waypoint x="625" y="300"></omgdi:waypoint>\015\012\011\011\011\011<bpmndi:BPMNLabel>\015\012\011\011\011\011\011<omgdc:Bounds height="11" width="100" x="10" y="0"></omgdc:Bounds>\015\012\011\011\011\011</bpmndi:BPMNLabel>\015\012\011\011\011</bpmndi:BPMNEdge>\015\012\011\011</bpmndi:BPMNPlane>\015\012\011</bpmndi:BPMNDiagram>\015\012</definitions>', '0');
INSERT INTO "public"."act_ge_bytearray" VALUES ('2', '1', 'leave/leave.png', '1', '\211PNG\015\012\032\012\000\000\000\015IHDR\000\000\002\327\000\000\002E\010\002\000\000\000\231BLB\000\000T`IDATx\234\354\335\011x\024U\272\377q\006\227\341\177\237\231+\314\205Q\034\307{\021G\346\336q\003\361\252w\034QPF\331\004\221E6A\366}M\330\222\260\313"\012n#\233\002\016\002\303&\210\022\300\010\204-\011IX\302\222\004\022 !\010\030\004b\200,\335\235\376\277]\2254M\002\241\003iNW\237\357\347\251\247\236\323\325''\225:Uo\235\376\321\351\204\012N\000\000\000\025*\250>\000\000\000\240)R\010\000\000P\203\024\002\000\000\324 \205\000\000\0005H!\000\000@\015R\010\000\000P\203\024\002\000\000\324 \205\000\000\0005H!\000\000@\015R\010\000\000P\203\024\002\000\000\324 \205\000\000\0005H!\000\000@\015R\010\000\000P\203\024\002\000\000\324 \205\000\000\0005H!\000\000@\015R\010\000\000P\203\024\002\000\000\324 \205\000\000\0005H!\000\000@\015R\010\000\000P\203\024\002\000\000\324 \205\000\000\0005H!\000\000@\015R\010\000\000P\203\024\002\000\000\324 \205\000\000\0005H!\000\000@\015R\010\000\000P\203\024\002\000\000\324 \205\000\000\0005H!\000\000@\015R\010\000\000P\203\024\002\000\000\324 \205\000\000\0005H!\000\000@\015R\010\000\000P\203\024\002\000\000\324 \205\000\000\0005H!\000\000@\015R\010\000\000P\203\024\002\000\000\324 \205\000\000\0005H!\000\000@\015R\010\000\000P\203\024\002\000\000\324 \205\000\000\0005H!\000\000@\015R\010\000\000P\203\024\002\000\000\324 \205\000\000\0005H!\000\000@\015R\010\000\000P\203\024\002\000\000\324 \205\000\000\0005H!\000\000@\015R\010\000\000P\203\024\002\000\000\324 \205\000\000\0005H!\000\000@\015R\010\000\000P\203\024\002\000\000\324 \205\000\000\0005H!\000\000@\015R\010\000\000P\203\024\002\000\000\324 \205\000\000\0005H!\000\000@\015R\010\000\000P\203\024\002\000\000\324 \205\000\000\0005H!\000\000@\015R\010\000\000P\203\024\002\000\000\324 \205\000\000\0005H!\000\000@\015R\010\000\000P\203\024\002\000\000\324 \205\334@tt\364\350\321\243k\327\256}\337}\367\335q\307\035\025t%c\2273 \347A\316\206\234\023\325\227\005~\204{\304\304=b-\324\255Iy\335\222B\256+))\251E\213\026\017?\374\360\360\341\303w\356\214:\236\226\236\227o\313\267\311b7\026w\343\232\017Kn\267v\377\274\374|9\003r\036\206\005\005\3119i\336\274ybb\242\352K\004\305\270G\270G\254\210\272\365\253\272%\205\\\333\356\335\273+U\2524y\362\344\31399R\237\306\005s\255m6\263X\257\261\330\354\356v\200\367\227s2e\312\224j\325\252\255[\267N\365\205\2022\334#\334#VD\335\372[\335\222B\256A.@\205\012\025"##\215\253\225o\244d\327%+j\033k\273-\377\352-\236\213\016\3757l\334 gIni\325\227\013\012p\217p\217X\021u\353\207uK\012).))\351\367\277\377\375\306\215\353\363my6[^\276-W\026\263Q\354\241\253\203=\317\354\346nh\325?2r\313\257\177\375k\336v\326\015\367\010\367\210\025Q\267\376Y\267\244\220\342Z\264h1y\362$\343\362\310\265\311q5\354\271E\027\254\260]\264%\307\334^\330M\313\376S\246Ln\366zS\325\027\015\267\025\367\010\367\210\025Q\267\376Y\267\244\220\253\304\304\304<\364\320C9\271\027\345\032\330dq]!Y\347\344\027\265\315\305f\256\355\356F\256\266\375/\347d\327\254\371\020\277\021\240\017\356\021\356\021+\242n\375\266nI!W\011\011\011\011\016\016\266\331.\033W\353\262,\365\376\336\330\313\337w2\373\273\256_\321\227_i\330\215\215f\007{\216\347\376\003\240\177P\320\220\321\243G\253\276t\270M\270G\270G\254\210\272\365\333\272%\205\\\245v\355\332;vD\346\333.\031W\345\322\213/7\374\321\351<\356p\036\2669\017\3469\367\3469c\263\3553V\376\260!\343BL\2763:\307\031\223\343\334v\311\2711\327\371\341\266\204\356=z\032\227\360\262\373\313=\333\346\303+m[\341S\001\320\177\347\316\255O>\371\204\352K\347[\221\221\221\377\361\037\377\261e\313\026\325\007\242\036\367H\340\335#:\2247u\353\267uK\012\271J\365\352\325\217\037?b\263_2\027I\301\331N\347\305\002\347\005\273\363\347|\347%\247s\310\250\260\012\025\177\363l\303\346\0316gz\2363=\327y,\307y\304\356\\\266s\257t\266\271\256\342E\363k]\015\233\261\037\333%\263\221\357~X\264\377\300\350\237\226\236r\357\275\367\252\276t>$\263\363\357~\367\273\025+W\312L\275y\363f\325\207\243\030\367H\200\335#\232\2247u\353\267u[\016)d\317\236=c\306\214i\322\244I\235:u\356\273\357\276\273\356\272K\326\322n\334\270\261l\227go\375[\3346w\334qG^~\266\315u\221.\3125\220\342\273\344p\3469\\O\331\013\\\353o\276[\177\177\315GGO\234nw:\177\261;/\330\234?\333\234\347\235\316\215\273\366\271*\325n\\f\327\305\276h\\\362\302\375\024>\364l\024m\017\200\376\371\371\331\025+VT{\341|\307\234\243#"~\310\267\331\177\370a\223\217f\352\224\224\224\035;v\354\332\265+...\336\020\033\033\033\025\025\225\234\234\\\254\247<\025\026\026V\356\007\340=\356\221@\272G|T\336~X\317\324\255\337\326\355\315\247\220\013\027.\214\0301\342\301\007\037\254Y\263\346\320\241C\327\256]\033\025\025}<-=7\317\365\207\330\244\275z\315\032\331.\317\376\361\217\177\224\236\322\277\034\217\333G\214\314\373\213\315.\305\232-kyx\321\356<{\331\231\357(\354p\376\374\371\017>\2365\341\275\217\323O\236\222\207\266\002g\276Q\301;\342\366\026~\255\361\205\205;)\331pu\270\262\377\200\351/cWw\321|\310s\2166\027\037\005\221\341\303\207\317\2325k\365\325\346\314\231\323\257_?\367\221\214\0349\262K\227.\357\275\367\2364&M\232\324\250Q\243\340\340\340\333\377\231G\356\221\200\271G|W\336~X\317\324\255\337\326\355\315|\203\234\234\234\0313fT\253V\255g\317\236{\366\356\273\316_\207\275\262\354\335\227\320\255{w\351\377\301\007\037\310\327\226\373\030\312\221\221y\345\354g\231kW\245:\234?]r\236\316v\332\234\316\374\274\274?\327\252U\241\302\035\025*Tz\363\255N\236_\030\033\277\373\312\327\026^N\367~<\032v\317\355Y\001\323\337\017g\330[Wr\216v\317\324\262\275|\177\210.\023\361\326\255[e\246^\277~\375\306\215\033e-\355m\333\266\015\0336L\236\315\314\314\224\1772\356\337\277\277u\353\326\362}\023\023\023\247L\231"\023\367\201\003\007\366\354\331s\356\334\271r<\222\033\342\036\011\214{\304\247\345\355\207\365L\335\372m\335\226\371\033ddd\324\255[\267I\223&\222-n\230?\212e\221\306\215\233<\375\364\323\262\007_\214\244\\\030\325\226e\234}\271\014Y\346\273v\222\227O\376\342<\223\353\214=\220z\357\275\367\336q\347\335\377\357\236\252m\333]U\251\273\342\342\245\263\335u!\263\354\366,\317\235\330\355\205\015Y\233\035<\236\012\220\376\3766\303\336\272\353\315\321\346"\333\313\367\323|2k\307\304\304DEE\311,\274o\337>Y\313\303\330\330X\371\327\241\323x\177{\311\222%c\306\214\221\177b\216."\355\261c\307.^\2748--\255\274\016\303\033\334#\001p\217\370\272\274\375\260\236\251[\277\255\333\262}\203\364\364\364j\325\252\275\367\336{e\312\037\236\313\344\311S\252W\257\356\267\277:o\274\363v\301u1\354\027\314\013p\271\300\371s\216+/\377\224\353\214\330\225\370\330\023OU\255\366\373{*W\231\265pY\256\323\231\235\347\274\224\347\372\302mQ\273\012\277\326\365\345\205k\343\222_\331b\\\362\013\236\373\017\230\376~5\303\336\272\322\347h_\004\021\231\265SSS\227.]:j\324\250\260\2600\231\224\227/_~\374\370qs\3266\265k\327n\243\007\371\367e\373\366\355\313\345\273\227\011\367\210\325\357\221\333P\336~X\317\324\255\337\326m\031\276\201D\0079 )\246\233\216 \346\262b\345J\331\217\004\032\337\215\352\246\031\325v\336\356\2720\347e1/\200\024\353\005\233\363\\\276\244f\333\216\204cO\324\251\373\322+\257\235\311s\236\316q\236\311q\236\315sJ\255n\2131*\325n^`\327b\\]cW\366\302\265\315s\243\261\377\200\351\357?3\354\255\363f\216.\367 b\316\332\203\007\017\316\314\314t\032\037\272\032:th\311Y\373]\017\223&M\352\330\261\343\255\177\353\262\342\036\261\364=r{\312\333\017\353\231\272\365\333\272\365\366\033dddT\257^}\365\352\325\267\030A\314e\311\322\245\325\252U\363\303\037\315\030\325v\336\2706r%\316\275P\357\205}\207\016\307&$F\355I\334\036\237\270}w\362\216})\233b\016\356L8\032\031\237\2745>i\373\356\244\250\275\311\011\207\323>\235\375\371\233\255Z\231_e3\327\266\363\236\017\215v\321\303\242\375\007L\177?\231ao\235\367st\371\006\021s\326\016\012\012*e\326\0360`\300\204\011\023\334\263\366\370\361\343e\226\277\305\357{\023\270G\254{\217\334\266\362\366\303z\246n\375\266n\275\372\006999u\353\326\275\225\037\304\224\\&O\236\362\364\323O\373\333\207U\215\237\377\311\0058g\\\006\271\006\347\372\366\355\351\315\037\327{\343\215\226f\177{\321b\363\330\217g\243\330\376\003\243\277?\314\260\267\256\254st9\006\021s\326\2367o\336\270q\343\314\031y\376\374\371\236\263vzz\372\252U\253BCCsss{\366\354i\276\225(\317&%%\225\303\310\313\202{\304\242\367\310\355,o?\254g\352\326o\353\326\253o0c\306\214&M\232\224c\0041\227\306\215\233|\360\301\007\276\036a\231\030\225\372\263\315~\326\356Z~6\3336\233\253m\254\315\215\205[\\\015c\013\375\225\317\260\267\256\344\034}\372\314O\245T\257\347\263\267\036Dd\376MII)\266Qf\344\021#F\230\355\016\035:$''''\233oY\237={6<<|\356\334\271\021\021\021\257\276\372\352\311\223''o\372\373\336\004\356\021+\336#\267\271\274\375\260\236\251[\277\255\333\033\177\203\254\254\254\252U\253\226\3657b\274Yd\237\262g\277\372;"\306\273v\231\306e\220\253\222i\263\025\266\335[<\037\032\2270\223\376\262X=\205\224\234\243CBC\357\277\377\376C\211I\327,]\331.\317J\237\362\012"C\206\014IHH\360\334"\363u\275z\365\314\277\334\220\221\221\361\311''\237HCR{\237>}\344\037\232\303\206\015\353\334\271\363\345\313\227O\235:e\263\331n\371\004\224\001\367\210\345\356\221\333_\336~X\317\324\255\337\326\355\215\277\201\224H\317\236=\313=\202\230K\267\356\335\335\351\330\037\030y9\363\232\213\315\335\260]\273\203\316\375-\235B\2569G\233o\306^s\2466\347h\263C9\006\021\253\340\036\261\326=By\233\250[\277\255\333\033\177\203?\376\361\217\276x#\304\375v\310\003\017<\340\353Az\317\250\324\237l\266\237d\355j\330\315F\246\275\260\341ng^\325M\373\376\326M!\245\314\321\327\234\251=\347\350\300\233\251\275\301=b\241{\204\362v\243n\375\266no\360\015\366\354\331S\263fM\037E\020sy\350\241\207\374\347\377\2321*\365\214q\366\317\024]\2523\306%qo<s\315\016\232\367\267h\012\271\346\017\313\213\315\302\2363u\3119\332|\266|?#\342\347\270G\254r\217P\336\236\250[\277\255\333\033|\2031c\306\014\035:\324\247)d\320\340\301\362]|=N7\233\3156u\352\324\005\013\026\230\277BVLQ\245\232\313ic\361|x\246\304r\232\376\262\370U\012)\375\022\273]\357W\006\2567\027\207\257\337P\312\014\356\271Xw\2466q\217\370\363=By_\017u\353\317u[\212\033|\203&M\232\254]\273\326\247)d\365\2325\215\0337\366\3658\335V\032\1773M\334y\347\235\203\007\017\316\313\313\363|\326\250\324SE\327\300\335(\271\270\236r8\212u\323\267\277_\245\220\322/\261\251\364\337Z\274\346L]\261bEo\346h?\237\251\275\301=\342\317\367\010\345}=\324\255?\327m)n\360\015\236z\352\251\235;\243|\232B\242\242\242k\327\256\355\353q\272eee\271\3577iT\251Re\315\2325\356g\215J\375Q\256\201\303q\312\341\272\022?\232\213<,\3360\236-\352\243{\177\277J!\245_b\247w\1778\341\2323\265\227s\264?\317\324\336\340\036\361\347{\204\362\276\036\352\326\237\353\266\0247\370\006\325\253W?v<\315\247)\344xZ\372\275\367\336\353\353qz\252\345\372\277\023\257\220\340\374\354\263\317\232\377\205\222Q\251''\215\263/\353\223\016\327\245\372\321\275\305\341\261\335\334\350nh\336\337\257R\210\263\324K\354\375\337n*e\246\276\341\034\355\2673\265\227\270G\374\371\036\241\274\257\207\272\365\347\272\275\236\033|\203\273\356\272+7/\337\247)D\366/\2652v\354\330R\202\371\355\344\272\000\016\3632\234,\274\036%\036:\256l\317\240\277<\224\363\346?W\260te\372\363\221\341\3537\224|\247Z\266\310v/\367\360\303\017\233d\246\266\312\311\361\222%j\322\337\372W\270-\367\010\345]\012K\324\211\277\365\257\240<\205\004\344{!\225+W6\213\262R\245J\355\333\267\177\350\241\207Z\264h\341\316\313\016\207\\\214\214\302\265\353\302\024.\305\2668\212\326\364\227\3456Tj\231\224r\211###e\246\376>"\342\206\225\031\220\377X\364\022\367\210?\337#\224\367\365P\267\376\\\267\327\243\335\347B\366\354\331c\226i\303\206\015_y\345\225\2325k\206\207\207\273\237uU\252\375\204\335X\244!\327\303\275.\334\3500/\2224\212\036z\364\277p!i\360\240\356\346\306\314\314\375II[\217\036\215NL\334\232\235}X\372\237>\275\257u\353\246\347\317\035\262\331\32232\3423\177J\370\371\347\203\262>{\366\200{''\262\275}\3737\244\261s\3477\0337.\335\274y\305\346M\313\245\021\037\277A\372\034<\270e\324\310\376aa\203\307\214\031"\2134BC\007M\235\032R\362x\276\375\366\313i\323BJ\036\377\2313\011\035;\276)\215o\276Yp\350P\244<%\373\221\303\273\271\361\272\373\373U\012)\375\022;\275\233\251\003\362\007\347^\362\351=\342}\377\036=:\344\346\034-\245\377\213/>W\312\376\2773n\201\222\373w\335\002\035ZJc\315\232\005\211E\267\300\305\213G\312\375\370}t\217P\336\327\343''u{\275\376\275{w\222\227\203K\227RRRv\310\303\277\377\375\305\234\313\251G\216\354p\275:\030={\365\354\030\021\361\257\235;\276\221\311_\266\313\234\277w\357\367\007\016l\366\321\361\370\317\334~\343\337\221\371\272\234\376\037\335\353-\262\377F\215n\337\357\310DDD\310i\255[\267\356=\367\3343q\342\304k}\216:]\256\212\243\360\332\244\273\036\026\256O\030\333\013\333E\335\322\315\206\335\226\336\243G\373\221#\373\277\362\312\013\022\024z\366\354\370\217\177Ln\337\276\305\364\351\241\217=\366\347\213\256\227\371\364\334\334\2431\321ken\315\311I\355\337\257Kpp\357\021#\372\365\353\327E\212\317\275\377aC{\266k\327\342\330\321h)\307\225+\3476l\370\302\322\245\377X\261b\316\216\355k\344\331\015\033\026\177\374\361\304\374\274cyy\307\362\363\216\347\347\037\227\366\233o66\217\347\344\311\370\372\365\377:`@\327a\303z\005\007\365n\336\374\325\240\240\336\322\0362\270{\275z\317\236\314\210\227=\330\362\217\313\376\245\377\350\321\003RSw\312\361\267i\323\354&\306[\254\277_\245\220\322/\261\251\364\231:P\177\211\300K>\272G\312\332\377\205\027\236-\326\377\340\201\315-[6\222\373e\310\220\036#\206\367\255U\253\346\360\341}\244\274\345v\223\355\311I[\257\334\002C{\006\031\267\200\334eA\303z\0156n\201\214\214\270+\267\200\343D\310\350\201r\013\330\315[\300\007\307\357\243{\204\362\276\036?\251\333k\366\317\314L\370\313_\036Y\270p\346\017\021\313\2324y\371\347\237\017\274\361\306k\362\212 %z`\377&WY\332\322\2326}e}\370"\251\355\345\313\346\214\034\331o\345\212\271_}\365\311[m\233\373\342x\374jn\277\3017\030;v\354\300A\203|\232B\006\015\036\034\022\032\352\353qzZ\267n\335\254Y\263\316\236=[\362)#/\2479\034ivY\033\215\302\265\303\243]l]\324?=-f\316\234\251\362p\356\334i\337~\273`\355\332\371\213\026}t\376\374\201\036\335\333\231=\373\367\357\262;>\274\330\3763N\354\222\355\346\376#\276_2qbp\326\205C2\245\356\212\371v\357\336\015M\233\276\234\260\357\373\335\273\303/_\226\177\253\245m\334\370U\203\006\317\017\031\322\275p\031\334}\320\240\256\222B\362\363\217\312\263\351\3511\375\372vv\357\277K\347\326\356\343\354\332\265\255<\373\315\232/\302\302\006=\361\304\377\214\036\335?,tPj\352vy\266\255+\205\310\327\356*\353x=\267\373U\012q\226z\211\335d\246\256R\245\212V\177P\301{>\272G\312\324\277q\343\006%\373''''E\016\034\370\316\264i\243g\314\030#\225,)\177\362\344\021C\207\364p\337\203\375\372uv\367\357\322\245\265{\017\256[ -\346\233o\276\220\3127o\201P\271\005R\266\313\263\346-p\342\304\256\362=~\337\335#\224\367\365\370C\335^\263\277D\341\345\313gE\355\\\223\222\262-v\327\267;v|-\223\274d\216\255[W\230\375en\227W\212M\233\376\265`\301\007\347\316\355\037=\252\277\271\207\036=\332\371\342x\374jn\347o\247^\305\250\324\343\256\305a\256\323\012\037\026m\264_i\273\236\362x\350Z\207\206\016\374%\353\320\333\235\336\264\345\037]\373\315\027\213\026}\370\341\207\343\266l^f\366\227\320`\274\360_\265\177W\012q\315\233\307\267o[\331\266m3)\301U+\347d\376\264w\305\212\331\257\275\366\322\227_\316\224\245Q\243\227\322\322\242\244\317\367\337/\2369sl\311\343\351\324\261\345\341\303[\245!\301\245\353;m\206\007\367\0369\262\357\237\377\374\260\254\245\335\371\355V\011\3736\312!ee\035\314\316N\222\303\373\371\354>\211#K\226|\262}\373\252\326\255\232\310\204\336\252U\343\223\031\273\312:^w\177\177K!^\342\217K\336\204[\274G\274\354\1771;\351\361\307\377\273d\377\270\270o\273u{+r\313rY\352\325{V\326[\266,o\330\360\005\367\376\367\355\333Xx\013\214(\274\005\202\335\267\200\355X\326\005\317[`\240\334\002\362zPx\013\274i\336\002\345s\374\376p\217P\336\236nO\335^\263\177|\334w\377\363?\177\222W\2071c\006\313<\337\274\371\337CF\367o\335\272iX\350\300W^\371\333/\277\034\222>\222\271])\344\207\245\215\033\327\0376\264\207\374\2036(\250\227\324p\367no\225\373\361\370[\335*\376\177d\366\354\335''\373\367\365 \275\347\252T\207y\031\2169\034\307\214\365qW\243pK\321v\317\206\261l\215\\\336\263g\273\240a=\207\017\357\335\257\337\333\275zu\350\333\247\223\244\220\267\3326KJ\332d\366\0372\244\333\321\243\333\213\355?#cW\377\376\235eK\312\221\255\247N\305\311\226Y\263\336\265\331\216\246\035\3379th\367\210\210\305_\177=w\330\260\036\351\222B\034\307d\226\354\324\251\245\364\227o\321\257\357\333\262\226\011\267C\207\0262\207\232;\214\215\375v\334\270\241\346\376\333\266mj\036\263t;~|\247\373\370\337~\273\345\312\225\263\207\007\367\232={\362\206\015\213\244\350w\354XU\326\361\026\353o\321\024\342\344?\332(\273\233\276G\312\324_*\377O\177\252\021\031\271\254X\377\230\230o\346\315\233&\005\374\3157_\374\337\377=\265j\325\354\257\276\372\350\323O''fg''\026\336\002\273\326\032\267\200\253\177\3336M\315\257\362\270\005\\\333\337~\373\315+\267\300\372\177\026\336\002\345z\374~r\217P\336n\267\247n\257\327\377\314\231\335owjy\350P\304\271s\011M\233\276\234\223\223\234\223sX\226f\315^\261\333\216.^\374\321\2301\203z\364h\267i\323\022\371\207\250\364\377\351\247=\207\223\267\244\246nKJ\332l\313O-\367\343\361\253\272\365\352\377\324\355\326\275\273\217R\210\3549(8\330\327\203\364\236Q\251r\001\216\312\272\300q\254\260m<\364h\034+\261\305\265\336\273g\335\214\031a\237|2^\326;w\256Z\373\315\347\213\026\315<\177>\241E\213\277\347\346$K\207!\203\273\035M\335Vl\377\031''\242\373\367{\333\3348p@\027\011\034\301A\275\036|\360\376\365\353\277\034:\244\333\272\357\026,_\376\331\260\241\335\323\323\243N\244Gm\337\2762>\356[\371F{\367\206\273\326{\326M\237\036"\273\335\271c\225t\220=\304\356\372\346\305\027\237\015\015\351\037\032:\340/\177yD\326\322\256[\367q\363Y\331\303\264i\243j\326\374\317\317?\2376jT\337\324\224\255\262\321\010+73^\317\376\326M!N\376\323\3212\272\225{\304\373\376]:\267\332\277\177c\2336Ml\266T\317\376\341\353\026J\354X\276\354\263U+g?\367\\\235\325_\317\221\245u\353&G\016o1\367\037\033\273\366\252[\300h\270n\201\264\235\322\301\270\005F\272o\001\363~t\205\225\362>~\377\271G(o\323\355\251\333k\366\277|)q\322\244\240\277\376\265\356\304\211A\337\256\375\342\205\027\236\2310a\250\261\014\373\357\377~X:\330m\251\362J\321\243\373[\233~X\322\260\341\013}zw\2343gr\203\006\177\235?\177\372\013/\374o\271\037\217\277\325\355\215\277AVVV\325\252U}\361v\210\354S\366|\341\302\005_\017\322{\306\273v\022<\217\026^\025\263\3558Z`\254\215+d\264\355\356-\251\356\3762\257-X0==}\347\206\015_N\177o\324\332\265\256\024"O}\362\361\270\365\341\013\245\277\353\275\220\324\255\305\366\237\221\021\335\277\377\333\236\373_\367\335\374O?\235\360\343\311\230\241C\273\315\235;e\307\366\025\303\206uO;\276#a\337\372Y\263&M\236<|\374\370!\013\346O\237o,\362\265]\273\266\231=\373\335\375\011\353\345kcw\255\0317n\260\271+cnu}\257~\375:\235H\227)\370\350\326\310e\341\341\013\273ti%\317\206\205\015H5\016\306\370\367\342\315\214\327\263\277\245S\210\363:3u)\237\3163g\352@\232\243\275w+\367\210\227\375\267o[>h\320;\262e\315\352\271c\306\014t\367\377\346\233y!\243\373M\235:\362\275i#%L<\366\330\237\247\031\215\227_\376\353\200\001\235e~7\202\270\334\002C\314\376E\011\333u\013H\012\221-[\267.\013_\267\240K\3477ecX\350\000#\210\247\272\272\225\353\361\373\333=By;oK\335^\257\277\315\226r\350`D\307\216-\366\356\371Nr\360+\257<\377\355\267_|\273\366sY$I\233\375\263\1779\320\243\307[\2336-Y\270\340}s''\3620\361P\204Ti\271\037\217\277\325\255W\337`\306\214\031\215\0325.\367\024"\373\234>\375}_\217\260L\214\274,g?\265\300X\273\226\302k\343\261\366x\350\356&\215/\276\230\366\355\267\237\313\366=\273\277\233>}\364\332o\346-Z4C\346\304\267\3326\333\265k\265l\0372\244\353\261\243[\213\355?\343D\224\361^\210k\207+V\374\343\263\317&v\354\320\302nO9s:V\342\260\374[0.\356\233\371\363\337;sz\227\331?5%\362\265\327^\334\270\361K\363\000V\255\234%\317\272\217''j\347\312z\365\236\011\015\225\177\377\3657\336\013\351o\274\027\362\330\221#\233\335\207mL\301\251\256)85\362\347\263\273\215)85\347\362\241_~\331_\246\361z\236\037\253\247\020\347u~\210^J\365\006\306\017\313o\302\255\334#\336\364\337\263\373\333\246M\033dg\0370\373\217\032\325GB\266\273\303\207\037\216\0319\242\267\374\313R\302\307\343\217\377\371\375\367G\177\360\376h\231\326\217\035\333f\366\337i\336\002!\327\275\005\244[\227.\306-\340\012\342\221g\345\0260\362\372e\271\005\262\256q\013\224\365\370\375\363\036\241\274}]\2677\354\337\247w\207s?\357=zt\353\253\257\326\213\211\371zW\314\327\262\226Z5\373K\301\033\357\205,\226\351}\330\320\356\362jr`\377\206Z\265\036\222\372\364\321\361\370O\335z\365\015rrr\352<\365\324\224)S\3131\202\310\336d\237\277d_\364\365\010\313\304\250\324\024\207=E\326\256\213\341n8R\314\305l\027n\261\027n4\033\237\317\233\362V\333\246\241\241\375$\303N\235:|\315\2329\222B\306\204\015X\267\356\013\263\377\340A\357\034=\032Yl\377''N\354\350\337\377m\367\376\347\272\222G\343_\262\022rr\016\015\034\3209<|\376\264i#d\272\264\331\016\273\217\347\362\245C\275{\267\317\313K\222\366\362e\237\316\237?\315}<\247O\307\034:\264\321\354\366\346\233\257\231\215\324\224-\331\331\373\335\307\337\271sKY\017\036\374\216\304\235\340\340\036\322\315n;\262i\323W\023\306\017)\323x=\317O\000\244\020gY\376\372\265\347\022\030s\264\367n\345\036)\275\277\335~d\366\354I\215\032\275x\356\334\036w7)\316\267\337~#$\244\237\334\021\305\3727o\376\212\331m\333\266\177e\376\024gn<}\312u\013\230}\\\267\200\2611%e\363\305\354\003\356\303\220[@\032\256[\240c\213\340\240\036\346\235"\267\300\370\361\203o\345\370\375\374\036\321\274\274}W\267^\366\357\320\241\371\353\257\277\362\317/?\220\265\273\277\253mt;\367\363\236\036=\332\376\020\261h\301\002\371We\312/\277$t\352\364F\257^\355\006\015\352\222\233\233\350\213\343\361\237\272\365\366\033dddT\255Zu\311\322\245\345\022AV\254\\y\337}\367\035;\236\346\323\261\335\004\243R\345\365\376\210\303\356Z\273\033\205k\243Q\274C\321\303o\327\316\215\335\365\2654~<\2713\342\373/\027\375\363\375E\213>\360\354\337\275{\233cG\267x~\371\332o\346\274\370\3423\013\346O\363\334\177T\324\362\245K>|\365\325\027\242\243V\230\373_\276\354\3439s&\025;\236S?F=\363\314\223O>\371\337\273w\257\271\346\361\324\257\377\\\261\343\377\345\227}\177\377\373\337>\372(L\332\203\007u\331\237\260N\032\377\374\347\373]\273\266\352\325\363-9\3542\215\327\363x\224\317\260\345\245\2543u\300\314\321\336\273\225{\244\364\376[#\227\004\005u\317\313=T\254\277\335\226<&\254\377\366m\377r\367\377\344\223\261\365\352\375oXX\377\322\367/\267@\261\343\311\276\321-p+\307\357\377\367\210\316\345\355\273\272\365\246\277\335~\270K\347\226\307\217GJ\273E\213\206\262\316\317K\354\330\261\371\323O?nvH;\276\265G\367\266\253\277\2365\177\376\324M?,z\355\265z{v\177#;\374\342\363)\313\376\365q\271\037\217_\325m\031\276Az\272\353\017\230H\200\270\305\010"QF\366\263}\373\016\337\215\352\246\311\201\025\270\256\204kq8\314\213T\264\266_\331^rc\311\376\2719\007\363\363\016y\366\277t1A\346S\317\376\271\271\007m\371\211\327\334\177N\316\201\322\367oL\251{K9\236#G"n\345\370\313\324\337\037f\330\362\342\375L\035Hs\264\367\312\361\036\271\351\376\027/&\310\335t\303\376G\016G\334\236\343\261\320=\242my\373C\335\226\322???1\353\302n\363)[~\222\303\236\254O\335\226\355\033DGG\337w\337}\267\362\243\031\371\332\252U\253\246\036=\346\223\321\3342\343\023L\311\016\207T@\262Q\007F\243\344\272\260\317a\217\266\326\375\375d\206-/\336\314\324\0016G{\217{\304\352\367\210\236\345M\335\372m\335\226\371\033ddd\324y\352\251F\215\032\227\365\267f\244\277|\225|\255\037\376 \306\315\310\313I\306b^\006\311\244\205\017\335\015w\007\307\325\017u\356\357?3ly)}\246\016\2749\332{\334#\001p\217hX\336\324\255\337\326\355\315|\203\234\234\234\351\323\337\2272\355\326\275\2737YD\372HO\351/_\345o\037G-\306\370\331a\242q%\022\213\032If\243\330\366b\317j\336\337\257f\330\362r\275\231: \347h\357q\217\004\306=\242[yS\267~[\2677\377\015\262\262\262F\216\034\371\300\003\017<\364\320C\003\007\015\372z\365\352\235;\243\216\035O\313\315\313\227\265\264e\313\240\301\203\345Y\351\023<|\270\364/\307\343\366\021#/''z\2778\034\207\350_\340\1773ly)9S\007\352\034\355=\356\221\200\271G\264*o\352\326o\353\266\034\276\301\236={\306\216\035\353\372iK\235:\367\335w\337\235w\336)ki\313\226\220\320P\377\371?b\274q\307\035w8\354\007\013\\\327\343\220\303Q\330p/\356-%\237\322\271\277\234\261\212\025+\252\276t\276\3429S\007\360\034\355=\356\221@\272G\364)o\352\326o\353\326\357\342\271Z\325\253W?\221\276\251\300q\300\\\234\005\007\215\306Ac9pu\373`Q\207\203\232\367\3178\261\371\336{\253\252\276t>d\316\324+V\256\014\3409\332{\334#\001v\217hR\336\324\255\337\326-)\344*\265k\327\216\211^\342\276\022\005\216\375\036\213\\\030\367F\327\332y\245\203\326\375\345\214=\371\344\237U_:\337\212\214\214\2249Z\326\252\017D=\356\221\300\273G:w\356\034\360\345M\335\372m\335\222B\256\022\022\022\022\024\324\305Y \027 \301}\315\234\262\024x^\302b\017\0234\357?<\370\235\321\243\272\253\276t>7v\354X\325\207\340\027\270G\002\357\036\361\303\317\254\224;\352\326o\3536\360\213\257Lbbbj\324x ?o\267\323u%\344\222$\030\227\244p\361|X\374)]\373\313\271\252Y\363\217Q;\027\251\276t>\247\303L\355\015\356\221\300\273Gt\250m\352\326o\3536\360\213\257\254Z\264h1m\352\340\002\307>\247c\237k]\340j\030\327\251h\213\261\261\240\360\331\004c\331\247m\1779W-\232\327W}\321n\007\035fj/q\217\004\330=\242ImS\267\376Y\267Z\024_\231$%%\375\372\327w\357\330\266\300u\315\\\227d\257,Nc\355j\270\267\\yj\237\331A\303\376?D\314\251V\255\312\241\203_\253\276h\267\203&3\2657\270G\312z\217$\036Z\255\372\242\225F\223\332\246n\375sn\327\242\370\312j\367\356\335r[F|?\273\300\261\307Y`^\025\327\342z\350(j\024m1\333fC\253\376\333\267\315\227\263\264\356\273OT_\256\333D\223\231\332K\334#\201t\217\350S\333\324\255\037\326\255.\305WV\353\326\255\373}\265*\323\246\016\264\345\355*p\354v\026\3546\327N\307\356\253\036\032[\256j\024\353\020\210\375m\371\273\344\314T\372\365\335\273\343\027\253\276P\267\217>3\265\227\270G\002\346\036\321\252\266\251[\177\253[\215\212\257\254\222\222\222\2327\177\351\241\032\177\010\016z{W\364\227\031\351\341\005\2168\343R\305\233\353\002i\270\332W7\012\012\237uz\266\255\337\277\300\036w"=<&japP\247\0325\376\320\242\371KI\211+U_\242\333J\253\231\332K\334#\201q\217\350V\333\324\255_\325\255^\305w\023bbbBFw}\362\311Z\325\357\253zG\305\212\025t%c\2273P\373\311Zr6b\242\027\252\276,\012T\320l\246\366\036\367\210\311\272\367H\005-k\233\2725)\257[\035\213\317\242\370{\025jU\320r\246\206\016\250m\2654\237\333)>k\370\374\363\317e\246HKKS} \372b\246F\240\242\266\325\322\374\374k=x\253\310\311\311\371\267\177\3737\251\324\246M\233\252>\026}i>S \200Q\333ji~\376\265\036\274U\264o\337\336\374\001^\225*U\302\303\303U\037\216\2464\237)\020\300\250m\2654?\377Z\017\336\022\022\023\023\177\365\253_\231)\344\256\273\356z\360\301\007\363\362\362T\037\224\2164\237)\020\300\250m\2654?\377Z\017\336\022j\325\252\345\371y\346\373\356\273o\302\204\011\252\017JG\232\317\024\010`\324\266Z\232\237\177\255\007\357\377\314\277\364W\314o\177\373\333\314\314L\325\207\246\035\315g\012\0040j[-\315\317\277\326\203\367\177\023''N\224\002}\354\261\307\0324h \215\007\036x@\326\217>\372\350g\237}\246\372\320\264\243\371L\201\000Fm\253\245\371\371\327z\360\376/""B\012\364\337\377\375\337\315\017\250\312\3727\277\371\2154\326\255[\247\372\320\264\243\371L\201\000Fm\253\245\371\371\327z\360\226\020\023\023\223\225\225\345,\252Tio\336\274Y\3611iI\363\231\002\001\214\332VK\363\363\257\365\340\255E\363JU\216\363\217@Em\253\245\371\371\327z\360\326\242y\245*\307\371G\240\242\266\325\322\374\374k=xk\321\274R\225\343\374#PQ\333ji~\376\265\036\274\265h^\251\312q\376\021\250\250m\2654?\377Z\017\336Z4\257T\3458\377\010T\324\266Z\232\237\177\255\007o-\277\372\325\257T\037\202\3264\237)\020\300\250m\2654?\377Z\017\336Z4\257T\3458\377\010T\324\266Z\232\237\177\255\007o-\232W\252r\234\177\004*j[-\315\317\277\326\203\267\026\315+U9\316?\002\025\265\255\226\346\347_\353\301[\213\346\225\252\034\347\037\201\212\332VK\363\363\257\365\340\255E\363JU\216\363\217@Em\253\245\371\371\327z\360\326\242y\245*\307\371G\240\242\266\325\322\374\374k=xk\321\274R\225\343\374#PQ\333ji~\376\265\036\274\265h^\251\312\335\372\371OII\331\261c\307\256]\273\342\342\342\342\015\261\261\261QQQ\311\311\311\305z\312Saaa\267\370\355\000/1\267\250\245\371\371\327z\360\326\242y\245*W\372\371\317\316\316n\332\264i\227.]z\365\352\325\247O\237\327_\177\275M\2336\275{\367\356\326\255[\353\326\255\327\254Y#}\206\017\037>k\326\254\325W\2333gN\277~\375\314\235l\331\262e\344\310\221\262\223\367\336{O\032\223&Mj\324\250Qppptt\364\355\030!t\305\334\242\226\346\347_\353\301[\213\346\225\252\234\367\347\277\240\240\340\371\347\237?\177\376|\261\355\022,\266n\335*\311c\375\372\365\0337n\224\265\264\267m\3336l\3300y6333>>~\377\376\375\222Z$\216$&&N\2312E\202\310\201\003\007\366\354\331s\356\334\271r\036\017P\204\271E-\315\317\277\326\203\267\026\315+U9\357\317\377\204\011\023\376\360\207?dee%$$xn\227\024\022\023\023\023\025\025%\251b\337\276}\262\226\207\261\261\261\301\301\301N\343\3475K\226,\0313f\314\360\341\303G\027\221\366\330\261c\027/^\234\226\226V\376C\002\014\314-ji~\376\265\036\274\265h^\251\312yy\376\247M\233\326\247O\237\026-Z\2349s\346\205\027^\210\210\210p?%)$55u\351\322\245\243F\215\012\013\013\223\220\261|\371\362\343\307\217\233)\304\324\256]\273\215\036\326\257_\337\276}\373\362\037\014\340\201\271E-\315\317\277\326\203\267\026\315+U\271\033\236\177\311\023\315\2325\223HQPP )D\266dee\325\257__\222\204\331\301L!\203\007\017\316\314\314\224\207\027.\\\030:th\311\024\362\256\207I\223&u\354\330\321gc\002\\\230[\324\322\374\374k=xk\321\274R\225+\375\374\247\245\245=\362\310#k\327\2565\037\232)D\234;w\256n\335\272\031\031\031\316\242\024\022\024\024TJ\012\0310`\300\204\011\023\334)d\374\370\361\222Z|5$\300\300\334\242\226\346\347_\353\301[\213\346\225\252\334\015\317\177~~\276\273\355N!\342\342\305\213f\303L!\363\346\315\0337n\234\2310\346\317\237\357\231B\322\323\323W\255Z\025\032\032\232\233\233\333\263gOy(\033\345\331\244\244\244r\036\014\340\201\271E-\315\317\277\326\203\267\026\315+U\2712\235\377\327_\177\275\344F\311\023)))\3056J\302\0301b\204\331\356\320\241Crr\262\371#\230\263g\317\206\207\207\317\235;7""\342\325W_=y\362\344\315\0368p\003\314-ji~\376\265\036\274\265h^\251\312\225\351\374?\367\334s%7\016\0312\244\330o\315H\376\250W\257\336\346\315\233\245\235\221\221\361\311''\237H\343\203\017>\350\323\247\317\310\221#\207\015\033\326\271s\347\313\227/\237:u\312f\263\335\322\321\003\327\307\334\242\226\346\347_\353\301[\213\346\225\252\034\347\037\201\212\332VK\363\363\257\365\340\255E\363JU\216\363\217@Em\253\245\371\371\327z\360\326\242y\245*\307\371G\240\242\266\325\322\374\374k=xk\321\274R\225\343\374#PQ\333ji~\376\265\036\274\265h^\251\312q\376\021\250\250m\2654?\377Z\017\336Z4\257T\3458\377\010T\324\266Z\232\237\177\255\007o-\232W\252r\234\177\004*j[-\315\317\277\326\203\267\026\315+U9\316?\002\025\265\255\226\346\347_\353\301[\213\346\225\252\034\347\037\201\212\332VK\363\363\257\365\340\255E\363JU\216\363\217@Em\253\245\371\371\327z\360\326\242y\245*\307\371G\240\242\266\325\322\374\374k=xk\321\274R\225\343\374#PQ\333ji~\376\265\036\274\265h^\251J\330l\266E\213\026eee9\213\316\377\236={v\354\330\241\372\270\200\362\304\334\242\226\346\347_\353\301[\213\346\225\252\304\370\361\343\345\264W\254X\261V\255Z\322\250\\\271r\005\203\371\277\340\002\201\201\271E-\315\317\277\326\203\267\026\315+U\211\211\023''V(\341\231g\236\011\017\017W}h@\271anQK\363\363\257\365\340\255E\363JU\342\354\331\263w\336y\247g\004i\330\260\341=\367\334\223\231\231\251\372\320\200r\303\334\242\226\346\347_\353\301[\213\346\225\252\312\220!C*V\254hF\220J\225*I\012\2310a\202\352\203\002\312\023s\213Z\232\237\177\255\007o-\232W\252*yyyU\252T1SH\373\366\355\037~\370\341\334\334\\\325\007\005\224''\346\026\2654?\377Z\017\336Z4\257T\205\326\254Yc\376\\\246F\215\032|"\004\201\207\271E-\315\317\277\326\203\267\026\315+U\255g\237}V\316\177\363\346\315U\037\010P\376\230[\324\322\374\374k=xk\321\274R\325JKK\223\363/k\325\007\002\224?\346\026\2654?\377Z\017\336Z4\257T\3458\377\010T\324\266Z\232\237\177\255\007o-zVjtt\364\350\321\243k\327\256}\337}\367\335q\307\035%\377z\207&d\354r\006\344<\310\331\220s\242\372\262 \240T\320rn\361\037\232\237\177\255\007o-\272UjRRR\213\026-\036~\370\341\341\303\207\357\334\031u<-=/\337\226o\223\305n,\356\3065\037\226\334n\355\376y\371\371r\006\344<\014\013\012\222s\322\274y\363\304\304D\325\227\010\001B\267\271\305\337h~\376\265\036\274\265hU\251\273w\357\256T\251\322\344\311\223/\347\344H\3660^\214]k\233\315\014"\327Xlvw;\300\373\3139\2312eJ\265j\325\326\255[\247\372B!\020h5\267\370!\315\317\277\326\203\267\026}*U^\\e\260\221\221\221\306+q\276\361\016\210\353\345\270\250m\254\355\266\374\253\267x.:\364\337\260q\203\234%\211k\252/\027,O\237\271\305?i~\376\265\036\274\265hR\251III\277\377\375\3577n\\\237o\313\263\331\362\362m\271\262\230\215b\017]\035\354yf7wC\253\376\221\221[~\375\353_\363\243\031\334"M\346\026\277\245\371\371\327z\360\326\242I\245\266h\321b\362\344I\306K\257\274\356\346\270\032\366\334\242\027\343\302v\321\226\034s{a7-\373O\2312\271\331\353MU_4X\233&s\213\337\322\374\374k=xk\321\241Rcbb\036z\350\241\234\334\213\362\372j\223\305\365\352+\353\234\374\242\266\271\330\314\265\335\335\310\325\266\377\345\234\354\2325\037\342\267fp+t\230[\374\231\346\347_\353\301[\213\016\225\032\022\022\022\034\034l\263]6^\211/\313R\357\357\215\275\374]V\263\277\353\265\271\350\313\2574\354\306F\263\203=\307s\377\001\320?(h\310\350\321\243U_:X\230\016s\213?\323\374\374k=xk\321\241Rk\327\256\275cGd\276\355\222\361\212{\351\305\227\033\376\350t\036w8\017\333\234\007\363\234{\363\234\261\331\366\031+\177\330\220q!&\337\031\235\343\214\311qn\273\344\334\230\353\374p[B\367\036=\215\227\347\313\356/\367l\233\017\257\264m\205O\005@\377\235;\267>\371\344\023\252/\035,L\207\271\305\237i~\376\265\036\274\265\350P\251\325\253W?~\374\210\315~\311\\d\310\331N\347\305\002\347\005\273\363\347|\347%\247s\310\250\260\012\025\177\363l\303\346\0316gz\2363=\327y,\307y\304\356\\\266s\257t\266\271^\241/\232_\353j\330\214\375\330.\231\215|\367\303\242\375\007F\377\264\364\224{\357\275W\365\245\203\205\3510\267\3703\315\317\277\326\203\267\026\035*\365\216;\356\310\313\317\266\271^\200/\312\353\253\014\371\222\303\231\347p=e/p\255\277\371n\375\3755\037\035=q\272\335\351\374\305\356\274`s\376ls\236w:7\356\332\347J!v\343%\334\365B~\321x9/\334O\341C\317F\321\366\000\350\237\237\237]\261bE\265\027\016\226\246\303\334\342\3174?\377Z\017\336Zt\250T\343\375\214_lv\011"\331\262\226\207\027\355\316\263\227\235\371\216\302\016\347\317\237\377\340\343Y\023\336\3738\375\344)yh+p\346\033\351dG\334\336\302\2575\276\260p''%\033\256\016W\366\0370\375u\250\015\370\016\365\243\226\346\347_\353\301[\213\016\225j\274\237!\257\254Y\346\332\225B\034\316\237.9Og;mNg~^\336\237k\325\252P\341\216\012\025*\275\371V''\317/\214\215\337}\345k\013_\252\335\373\361h\330=\267g\005L\177\035j\003\276\363\253_\375J\365!hM\363\373W\353\301[\213\016\225j$\211,\343\225U^b\263\314\237\310\234\275\354<\371\213\363L\2563\366@\352\275\367\336{\307\235w\377\277{\252\266mwU\012\331\025\027/\235\355\256\027\351,\273=\313s''v{aC\326f\007\217\247\002\244\277\016\265\001\0379w\356\\\345\312\225U\037\205\3264\277\177\265\036\274\265\350P\251\306OU.\270^h\355\027\314\027\327\313\005\316\237s\\\357\205\374\224\353\214\330\225\370\330\023OU\255\366\373{*W\231\265pY\256\323\231\235\347\274\224\347\372\302mQ\273\012\277\326\365\345\205k\343\345\374\312\026\343\345\374\202\347\376\003\246\277\016\265\001\037IMM\255Q\243\206\352\243\320\232\346\367\257\326\203\267\026\035*\325H\022\347\355\256\027\335\363\262\230C\226 r\301\346<\227\357<\371\213mG\302\261''\352\324}\351\225\327\316\3449O\3478\317\3448\317\3469%\207l\2131R\210\335|\361v-\306+\267\261+{\341\332\346\271\321\330\177\300\364\327\2416\340#qqqu\352\324Q}\024Z\323\374\376\325z\360\326\242C\245\032I\342\274\361\272+\257\262\347^\250\367\302\276C\207c\023\022\243\366$n\217O\334\276;y\307\276\224M1\007w&\034\215\214O\336\032\237\264}wR\324\336\344\204\303i\237\316\376\374\315V\255\314\257\262\231k\333y\317\207F\273\350a\321\376\003\246\277\016\265\001\037Y\264hQ\353\326\255U\037\205\3264\277\177\265\036\274\265\350P\251\306g;\344\305\365\234\361\022+\257\257\347\372\366\355\351\315\037N}\343\215\226f\177{\321b\363\330\217g\243\330\376\003\243\277\016\265\001\037\351\325\253\327\314\2313U\037\205\3264\277\177\265\036\274\265\350P\251F\012\371\331f?kw-?\233m\233\315\3256\326\346\306\302-\256\206\261\205\376:\324\006|\344\261\307\036\213\215\215U}\024Z\323\374\376\325z\360\326\242C\245\032?\221\3114^b\345\0257\323f+l\273\267x>4^\2363\351/\213\016\265\001_\330\277\177\377\375\367\337o\263\331T\037\210\3264\277\177\265\036\274\265\350P\251\306{!\231\327\\l\356\206\355\332\035t\356\257Cm\300\027:t\3500u\352T\325G\241;\315\357_\255\007o-:T\252\221B~\262\331~\222\265\253a7\033\231\366\302\206\273\235yU7\355\373\353P\033(w\307\216\035\373\335\357~w\372\364i\325\007\242;\315\357_\255\007o-:T\252\221B\316\030\257\254g\212^\206\317\030/\267\356\215g\256\331A\363\376:\324\006\312WVV\326\335w\337\375\325W_\251>\020h1\267\227B\353\301[\213\016\225Z\224B\314\345\264\261x><Sb9M\177Y\256Y\033\361\361\361\375\372\365[\273v\355\355\277\216\360s\022A\236x\342\211\267\337~[\365\201\300E\207\271\275\024Z\017\336Zt\250T#\205\234*z}u7J.\256\247\034\216b\335\364\355_\2546\016\035:T\313\365\037\356\024\332\274y\263\242\353\011\177t\354\330\261\2325k\366\355\333\267\240\240@\365\261\300E\207\271\275\024Z\017\336Zt\250T#\205\374(\257\257\016\307)\207\353U\366Gs\221\207\305\033\306\263E}t\357\357\256\215\234\234\234\366\355\333\377\352W\2772\363\307\243\217>\372\357\377\376\357\362\017_\265\227\025~b\377\376\375R\036\277\373\335\357\370A\214_\321an/\205\326\203\267\026\035*\325H!''\215WVY\237t\270^\206\177toqxl77\272\033\232\3677k\343\363\317?\377\267\177\3737\317?\346\326\240A\203v\355\332\251\276\252P\343\334\271s\251\251\251qqq\2229z\367\356\375\370\343\217\337\177\377\375\323\246M\343\343\250\376F\207\271\275\024Z\017\336Zt\250T3\2058\034\346K\354\311\302\327\332\022\017\035W\266g\320_\036\312y\033;v\2547\177d\326\344~\263\004\201J.\361o~\363\233\312\225+\327\251S\247U\253V3f\314\330\265k\027\177\027\304?U\320`n/\205\326\203\267\026\035*U\306\350p\310\013mF\341\332\365\242[\270\024\333\342(Z\323_\026\2636\322\322\322\2325kV\245J\225\273\356\272\313|)z\340\201\007x/\304B\262\263\263\2336m\332\245K\227^\275z\365\351\323\347\365\327_o\323\246M\357\336\275\273u\353\326\272u\3535k\326H\237\341\303\207\317\2325k\365\325\346\314\231\323\257_?s''[\266l\0319r\244\354\344\275\367\336\223\306\244I\223\0325j\024\034\034\034\035\035\255tp\270.\035\346\366Rh=xk\321\241R])\304~\302n,\322\220\327Z\367\272p\243\303|\001\226F\321C\257\373\317\2349n\343\306\245\362TZ\332\256\370\370\015\011\373"\016\034\330,\353\270\270\365?\237=\340\356\337\263g\207\334\334c\346\376;v|\363z\373\177\372\351''\363\363\323\212\035\317\307\037O:\234\274\315\335?<\374\253\017?\034_^\307_J\177\317\332\010\017\017\177\360\301\007\357\275\367^3\210\310?\210\371\\\210\025\025\024\024<\377\374\363\347\317\237/\266]\202\305\326\255[%y\254_\277~\343\306\215\262\226\366\266m\333\206\015\033&\317fff\306\307\307\357\337\277_R\213\304\221\304\304\304)S\246H\0209p\340\300\236={\316\235;\247b(\270\001\035\346\366Rh=xk\321\241R+\270~"\223.\257\270\216\302\327\335t\327\303\302\365\011c{a\273\250[\272\367\375\363\362\216u}\247\355\326\255\253\302\302\006O\2348\374\363\317\337\0376\254\327\202\0053:vh\271a\303\342\350\250\265\203\006u\013\013\035T\267\356\343c\306\014\011\016\3563n\334\260\372\365\377:aB\320\330\261C%[\310\336\216\037\217\331\261c\315\356\370\365{\367~/O\355\335\2731>.|\347\316o\216\037\2131\017\343\2473\373\376\376\367zg\316\354\013\015\031\024\0222\260S\247VM\233\276\022\0322p\300\200\256\267~\374\245\364/V\033yyy\023''N\374\355o\177\373\350\243\217\312S111\252.(n\332\204\011\023\376\360\207?H\202LHH\360\334.)D.hTT\224\244\212}\373\366\311Z\036\306\306\306\006\007\007\313\263)))K\226,\0313f\314\360\341\303G\027\221\366\330\261c\027/^\234\226\226\246h4(\215\016s{)\264\036\274\265\350P\251\306{!i\016G\232]\326F\243p\355\360h\027[\227\245\277\335v\\\032aa\203\276\373\356\313\365\341\213^x\341\231o\327.\370\350\243\361\2337/\223g\337}w\304\270qC\237~\372\211\361\343\207\005\007\365\356\330\361\215\314\237\366}\263\346\213\345\313g\345\346\246\312\027\316\235;m\360\240ns\346L\225\245N\235\307\314F\277\276\235?\373l\262\373\273\244\247\305\344\347\037\335\264iY\320\260^\262\207&M\032\214\036\335\177\331\262\317\312\345\370\257\327\377\232\265q\366\354Y\371\2072\277\246kE\323\246M\353\323\247O\213\026-\316\2349\363\302\013/DDD\270\237\222\024\222\232\232\272t\351\322Q\243F\205\205\205I\310X\276|\371\361\343\307\315\024bj\327\256\335F\017R\006\355\333\267W1\016xE\207\271\275\024Z\017\336Zt\250T#\205\034w-\016s\235V\370\260h\243\375J\333\365\224\307\303\033\364\337\266me\307\016ot\355\332V\332a\241\003\277\373n\301\272\357\0266jT_\326\222B\266H\012\261\037\357\324\251\345\017?,m\332\364\345M?,m\335\272\311\217''c\203\202zId9\365c\234\271\377/\276x\177\303\372E\346\016[\266|\315\334\377\232\325\237\177\361\305t\371\326q\261\337\316\236=e\331\277>;\367s\302\2325\237\257\017\377\347\324\251\243\006\364\357"\215\265\337|\221xh\323\255\034\177\351\375u\250\015MH\236h\326\254\231D\212\202\202\002I!N\343/\214\325\257__\222\204\331\301L!\203\007\017\316\314\314\224\207\027.\\\030:th\311\024\362\256\207I\223&u\354\330Q\311p\340\015\315\357_\255\007o-:T\252\361\351T\363%\366\230\303q\314X\037w5\012\267\024m\367l\224\245\277d\013i\207\205\015\2344)x\350\320\356o\274\361\352\200\001]\006\017\356\272e\213\244\220cqq\3376i\322\340\245\227\236\223\215\253V\316\226\376!!\375_{\355\245\234\234\303\346\227\177\361\305{\255Z5\016\012\352)\313\237\376T\303\325\030\326\263E\213\277\273R\210\375Xr\362\346\335\273\327\311>\263\262\016J\354X\265j\366:\311:\353\026\256Y3OB\311\261\243\333o\375\370\257\327_\207\332\320AZZ\332#\217<\342\376s\267f\012q\032\277s[\267n\335\214\214\014gQ\012\011\012\012*%\205\014\0300`\302\204\011\356\0242~\374xI-\267}4\360\226\346\367\257\326\203\267\026\035*\325H!\362\342zT\326\005\216c\205m\343\241G\343X\211-\336\366o\333\246\2514\202\206\365\210\215];bDo\311"\357\276\033\374\321Gc\267l\371W|\334\267-[\276v\350P\304\353\257\277r\346t\334\302\205\037\364\356\325axp\257\257\277\236\363\374\363OK\377\002#\205lX\377\245\2717\327{!Fc\315\352y\262\335\375\035\333\266m*\353E\213>|\347\235\326\037\177<\376\343\217\307\205\206\364\0375\252o\271\034\377\365\372\353P\033\232\310\317\317w\267\335)D\\\274x\321l\230)d\336\274y\343\306\2153\023\306\374\371\363=SHzz\372\252U\253BCCsss{\366\354)\017e\243<\233\224\224t\033\307\2012\320\374\376\325z\360\326\242C\245\032?\221Iu8\216\026\276\342\232m\307\321\002cm\274\372\032m\273{Kj\231\372K\012\311\315I\352\326\255\315\241\203\021C\207t\223\376\222\025$\205DnY*\317\256Y=\267O\237\216\375\372u\012\013\035\320\245K\253\341\303{\215\036\325w\320\300.3g\216\311\313=,;\371\342\213iC\206t\2333g\362\3349\223\353\324yT\032\262\364\357\377\266\244\020\367\361\030A\347\350\262\177}\372\346\233\215\306\214\0318f\314 \327\016\303\006\224\313\361_\257\277\016\265\241\241\327_\177\275\344F\311\023)))\3056J\302\0301b\204\331\356\320\241Crr\262\371#\230\263g\317\206\207\207\317\235;7""\342\325W_=y\362\244\257\217\0317A\363\373W\353\301[\213\016\225j\274\027"\257\254\251\005\306\332\265\024\276\356z\254=\036\272\273y\323?//\371\311''\377\247w\357\366/\277\374\327\323\247b\2324\251?zt\337\267\33263\336\013YjvKJ\214X\276\354Si\264n\325x\315\232\271_\257\232\265z\365\034\367\376?\371d\374\354\331\357\356\333\273n\337\276u\365\353\377\237\254\245\375\351\247\343g\315\232\344>\236\266m\233~\371\345\007\262\023I''\377\374\347\014Y\246N\035\341J!\267|\374\245\364\327\24164\364\334s\317\225\3348d\310\220b\2775#\371\243^\275z\346\307\220322>\371\344\023i|\360\301\007}\372\364\0319r\344\260a\303:w\356|\371\362\345S\247N\361W\313\374\223\346\367\257\326\203\267\026\035*\325H!)\016{\212\254]/\264\356\206#\305\\\314v\341\026{\341F/\373\307\305\256i\320\340\377\242\242V\266z\263\221g\377\217>\034\263e\313\022\263\277\244\212\351\323G\311Sm\3324\216\216Z%\235e\271\346\376\0337~\251\344\361\244\246n\271\347\236\337~\366\331\304e\313>\371pfXrRDrr\304\372\360\005\241\241\375n\375\370K\351\257Cm\000\201J\363\373W\353\301[\213\016\225j\244\220\303\005\216#\016\273k\355n\024\256\215F\361\016e\351\237\233s\260w\357v\373\366~\353\356\337\245s\313\207\037\376\317cG\267,_\366q\307\216\315{to\333\271\363\033\301\301=\332\266i\022\024\324}\360\340.\322_\022\311\232\325\263\213\355\377\231g\236,\271\377\204}\337-[\366\2614\346\317\237\372\257\245\037I\343\302\371\335/\275\364\354\342\3053\312\345\370\257\327_\207\332\000\002\225\346\367\257\326\203\267\026\035*U\306X\340z\225u-\016\207\371\002\\\264\266_\331^r\343M\367w\330\223on\377I\211\033K\351\237\233s /\357\220\271\321fK\362\335\361\233\015\035j\003\010T\232\337\277Z\017\336Zt\250T\343\323\251\022\013\222\013\034\311\322(0\033%\327\205}\016{\264\265\356\257Cm\000\201J\363\373W\353\301[\213\016\225j\274\027\222d,\346Kl\222\303^\370\320\335pwp\\\375P\347\376:\324\006\020\2504\277\177\265\036\274\265\350P\251\306\347B\022\215W\331\304\242F\222\331(\266\275\330\263\232\367\327\2416\200@\245\371\375\253\365\340\255E\207J5\336\013I\364~q8\016\321\277\200\024\002X\231\346\367\257\326\203\267\026\035*\365\216;\356p\330\017\026\270^k\0179\034\205\015\367\342\336R\362)\235\373\313\031\253X\261\242\352K\007\340&\3510\267\227B\353\301[\213\016\225Z\275z\365\023\351\233\012\034\007\314\305Yp\320h\0344\226\003W\267\017\026u8\250y\377\214\023\233\357\275\267\252\352K\007\340&\3510\267\227B\353\301[\213\016\225Z\273v\355\230\350%\356W\331\002\307~\217E^t\335\033]k\347\225\016Z\367\2273\366\344\223\177V}\351\000\334$\035\346\366Rh=xk\321\241RCBB\202\202\2728\013\344\3055\301\375z\354\224\245\300\363\345\271\330\303\004\315\373\017\017~g\364\250\356\252/\035\200\233\244\303\334^\012\255\007o-:TjLLL\215\032\017\344\347\355v\272^e\345\3456\301x\271-\\<\037\026\177J\327\376r\256j\326\374c\324\316E\252/\035\200\233\244\303\334^\012\255\007o-\232Tj\213\026-\246M\035\\\340\330\347t\354s\255\013\\\015\3435\270h\213\261\261\240\360\331\004c\331\247m\1779W-\232\327W}\321\000\334<M\346\366\353\321z\360\326\242I\245&%%\375\372\327w\357\330\266\300\365z\354z\271\335+\213\323X\273\032\356-W\236\332gv\320\260\377\017\021s\252U\253\222xh\265\352\213\006\340\346i2\267_\217\326\203\267\026}*u\367\356\3352\330\210\357g\0278\3668\013\314W\\\327\342z\350(j\024m1\333fC\253\376\333\267\315\227\263\264\356\273OT_.\000\267D\237\271\375\232\264\036\274\265hU\251\353\326\255\373}\265*\323\246\016\264\345\355*p\354v\026\3546\327N\307\356\253\036\032[\256j\024\353\020\210\375m\371\273\344\314T\372\365\335\273\343\027\253\276P\000n\225Vs{IZ\017\336Zt\253\324\244\244\244\346\315_z\250\306\037\202\203\336\336\025\375eFzx\201#\316x\031\2167\327\005\322p\265\257n\024\024>\353\364l[\277\177\201=\356DzxL\324\302\340\240N5j\374\241E\363\227\222\022W\252\276D\000\312\201ns{1Z\017\336Z\364\254\324\230\230\230\220\321]\237|\262V\365\373\252\336Q\261b\005]\311\330\345\014\324~\262\226\234\215\230\350\205\252/\013\200rSA\313\271\335M\353\301[\213\346\225\252\334\330\261cU\037\002\200\000\244\371\334\256\365\340\255E\363JU\216\363\017\300\0274\237[\264\036\274\265h^\251\312q\376\001\370\202\346s\213\326\203\267\026\315+U9\316?\000_\320|n\321z\360\326\242y\245*\307\371\007\340\013\232\317-Z\017\336Z4\257T\3458\377\000|A\363\271E\353\301[\213\346\225\252\034\347\037\200/h>\267h=xk\321\274R\225\343\374\003\360\005\315\347\026\255\007o-\232W\252r\234\177\000\276\240\371\334\242\365\340\255E\363JU\216\363\017\300\0274\237[\264\036\274\265h^\251\312q\376\001\370\202\346s\213\326\203\267\026\315+U9\316?\000_\320|n\321z\360\326\242y\245*\307\371\007\340\013\232\317-Z\017\336Z4\257T\3458\377\000|A\363\271E\353\301[\213\346\225\252\034\347\037\200/h>\267h=xk\321\274R\225\343\374\003\360\005\315\347\026\255\007o-\232W\252r\234\177\000\276\240\371\334\242\365\340\255E\363JU\216\363\017\300\0274\237[\264\036\274\265h^\251\312q\376\001\370\202\346s\213\326\203\267\026\315+U9\316?\000_\320|n\321z\360\326\242y\245*\307\371\007\340\013\232\317-Z\017\336Z4\257T\3458\377\000|A\363\271E\353\301[\213\346\225\252\034\347\037\200/h>\267h=xk\321\274R\225\343\374\003\360\005\315\347\026\255\007o-\232W\252r\234\177\000\276\240\371\334\242\365\340\255E\363JU\216\363\017\300\0274\237[\264\036\274\265\334\260RSSS\243\243\243\343\343\343e\275i\323\246\025+VL\237>\275g\317\236\331\331\331\356>\343\307\217\227\355\356\207\231\231\231\377\374\347?\273u\353Vro\377\373\277\377\353p8\212m\374\364\323OSRR\334\0177l\330\360\361\307\037\337\314`,\302f\263-Z\264(++\313Yt\376\367\354\331\263c\307\016\325\307\005 p\220B`\0157\254\324\243G\217\316\236={\341\302\205\313\227/\377\333\337\376&YD\266\374\374\363\317v\273]\236=x\360`\277~\375BCC\273t\351\022\022\0222x\360\340\326\255[K(\221\327T\263\2038q\342\204|\325\336\275{\367\357\337\337\240A\203\204\204\004y\321\215\211\211IOO7;\234={\366\325W_\225\354\022\026\026&\273\352\334\271s\263f\315\244=h\320 \237\216]\0259?r\332+V\254X\253V-iT\256\\\271\202a\363\346\315\252\017\015@\200 \205\300\032J\257\324\330\330\330\267\337~;88X2\301\270q\343\036}\364QYKP\010\012\012\222\355qqq\005\005\005\021\021\021III\322y\340\300\201\347\317\237\2278\222\233\233\353\271\223\317?\377|\310\220!\363\014O=\365\224\331\350\337\277\277\204\033w\237\214\214\014I-\221\221\221\362\275:u\352\324\264iS\3114\236\357\257\004\222\211\023''V(\341\231g\236\011\017\017W}h\000,\214\367Y\335H!\226\341M^~\343\2157$y\214\0313FR\310\330\261c%\221\264o\337\376\342\305\213\362\324\345\313\227%y\214\036=:>>\376\275\367\336\223\352\357\335\273\367\316\235;%\276\230\357\232H\237\005\013\026|\377\375\367\346\256\336|\363M\263\261v\355Z\331.\215\335\273w\317\235;W\002\307\205\013\027d\343\306\215\033e?\022h\244\361\335w\337%''''\373j\344\352\234={\366\316;\357\364\214 \015\0336\274\347\236{233U\037\032\000\013\343}V7R\210ex\223B\3445r\247\241A\203\006fCr\311\245K\227\344))\356I\223&M\2336\355\351\247\237\2362e\212$\225\036=z|\375\365\327/\277\374\362\252U\253\366\356\335\3534RH\353\326\255\203\015\217<\362\210\331\220=\230)\344\310\221#\322\255e\313\226\331\331\331\022;V\257^\275\336\260\326\220\226\226\346\3533\240\304\220!Cd\2460''\210J\225*\311\031\2360a\202\352\203\002`m\274\317\352F\012\261\014/S\3106C\375\372\365\315F\363\346\315\315O\247feeIV\330\264i\323k\257\275\366\375\367\337K\214\350\336\275\273l\357\322\245\213\373S\250\245\277\027bz\353\255\267d\275x\361\342\256]\273~j\010\013\013\033=zt\271\216\325\217\344\345\345U\251R\305\234#\332\267o\377\360\303\017\027\3731\026\000\224\025\357\263\272\221B,\303\233\024\322\255[7\311\004c\307\216\375\313_\376b\376D\246G\217\036\347\317\237w\032)d\366\354\331\253W\257n\324\250\221\254\327\255[''\371\303Y"\205\014\035:\264\330\347B\006\014\030P2\205\254X\261\242U\253V\343\014\375\373\367\0373f\214/\206\354''\326\254Yc\316\0275j\324\320\360_*\000|\201\367YM\244\020\313\270a\0129x\360\240$\217\311\223''O\235:\365\361\307\037\2372e\312\273\357\276+[\016\0348`v\350\325\253\327\261c\307\336y\347\235\341\303\207GEE\265n\335\332yu\012\371\307?\3761w\356\334\375\206\006\015\032\230\215\317>\373l\316\2349\356\357")d\321\242E\222B$\235|ex\357\275\367\002;\205\210g\237}V\316\177\363\346\315U\037\010\200\000\301\373\254&R\210e\224\236B$I\374\362\313/\231\231\231YYY\027/^l\331\262\245\254\245-[\262\263\263\345\331\355\333\267\233aBRHNN\216d\210y\363\3469\215\024\342\376M]OM\2324)\271QBL\345\312\225g\317\236-)\344\243\217>:b\330\260aCXXX9\215\322O\245\245\245\311\371\017\324\317\276\000P\202\367Y\235\244\020\013)=\205$$$\364\355\3337((h\324\250Q!!!#F\214\220\365\310\221#\207\016\035j\276\005\3424~M\246u\353\326\023&LHIIi\330\260a~~\276lt\377\022M1\362\257\377\222\033\367\357\337o\376R\356\302\205\013\227-[&\015\211>\365\353\327_\272tiy\014\321\257i\376;\375\000|\201\367Y\231X-\243|_\005\363\362\362\314\206\304\210\202\202\202\222\035\016\037>\\\372\227\333l6\263]\362O\254\006\236\310\310\310\377\370\217\377\330\262e\213\352\003\001\020Px\237\225\024b\031\374[\\\025\011\037\277\373\335\357V\254\\)AD\303\337\346\007\340S\232\317\355Z\017\336Z4\257TU\314\010\022\021\361C\276\315\376\303\017\233\010"\000n\321\336\275{\307\216\035\333\264i\323\247\236z\252z\365\352w\337}\267\254\245-[d\273\371\327\233\364\301\013\233eT\254X\361\232?:\201\357xF\020s!\210\000\2709YYY\241\241\241\377\371\237\377Y\362\357\225\025#}\244\247\371\367\335\003\036)\3042*W\256|\356\3349\325G\241\221\222\021\304\035Dd;\237\021\001\340\245\274\274\274\2313gV\255Z\365\206\371\303\223\364\227\257r\177\206/P\221B,\243F\215\032\251\251\251\252\217B\027\327\213 \346"\333\371\260*\000oddd<\365\324S\236\361Bf\217N\235:}\265xIttLZ\372\211\213\227.\313Z\332\262\245C\207\016\362\254g\347\272u\353\312\036T\017\302\207H!\226Q\247N\235\270\2708\325G\241\205\322#\010A\004\200\227\242\243\243\253W\257\356\216\024\017?\374\360\342%Ksr\363J\231[\344Y\351S\263fM\367W\311\036d?\252\207\342+\244\020\313h\335\272\365\242E\213T\037E\340\363&\202\020D\000\334\220D\207J\225*\231I\342\356\273\357\2361c\306\245\31397\234X\314EzN\237\376\276|\225\371\345\262\237@\015"\244\020\313\2309sf\257^\275T\037E\200\363>\202\020D\000\224"##\303\375.H\265j\3256o\336\342\345\254\342\271\310W\271?M"{\013\310\037\315\220B,#66\366\261\307\036S}\024\201\254\254\021\204 \002\340\232\362\362\362\334\237\005\221\010\222\224|\370&"\210\271\310\327\272\203H\335\272u\003\357\303\252\244\020\313\260\331l\367\337\177\377\376\375\373U\037H`*\031AN\237\371\251\224\251\301\363Y\202\010\000O3g\316t\377 \346\346\336\005)\366\216\310]w\335e\356P\366\254zp\345\214\024b%\323\246Mk\337\276\275\352\243\010@%#HHh\250d\276C\211I\327\234\024d\273<+}\010"\000\212\311\312\312r\377\236\313\214\0313n1\202\230\313\364\351\357\273\177}7\300\376\216\010)\304JN\237>-/\226\346\177M\207\362r\315\010b\336\360\327\014"f\0041;\020D\000\024\023\022\022b\316\017\177\372\323\237\274\3778j\351\213\354\307\375[3\241\241\241\252\207X\236H!\026\363\325W_I-\006X\026V\250\224\010r\315 \342\031A\010"\000Jr\377u\324\305K\226\226K\0041\027\331\233\271[\331\277\352!\226''R\210\365\364\355\333\367\211''\236 \210\334\272k~\026\244X\310\360\014"%#\210\371,\237\021\001`\332\263g\21793\310<P\372\337\005)\353"{\223\371\312\334y \375_3\244\020\353)((\350\324\251\323\335w\337\315\217fn\305\365~#\346zQ#|\375\206R\002\212\347B\020\001\002\230\315f\233:u\352\202\005\013233K>;v\354Xsr\220Y\272\034#\210\271t\350\320\301\334\271|\227\333?p\037!\205X\325W_}%/\242\355\333\267\347\267fnB\351\277\224{\315 R\261bEo"\010A\004\010l+W\2564g\200;\357\274s\360\340\301\305~u\266i\323\246\346\263_-^R\356)D\366i\356\\\276\213\252\341\227;R\210\205\235>}z\332\264i\362Z\370\330c\217\365\352\325k\321\242Eqqq\251\251\251\347\316\235\343\177\337-\2057\177\027\344\232A\304\313\010B\020\001\002XVV\226\373\337$\322\250R\245\312\2325k\334\317\272\377LHttL\271\247\020\331\247\271s\371.\012\317@\371"\205X\236\315f\213\215\215\2359sf\353\326\255\353\324\251S\243F\215\312\225+\227\374\207;L\336\377i\262R\202\310\015#\010A\004\010`\265j\325\362\234\020\356\274\363\316g\237}6--M\236r\377\275\324\264\364\023\345\236Bd\237\346\316\345\273\250>\007\345\206\024\002\275\224\351\257\243\206\257\337P2\317\311\026\331\356\345\036~\370a\223\004\021\367\217\212\001\0046\367\377\374r\361\322\345rO!\262O\367wQ=\225\226\033R\010\364\022\031\031)A\344\373\210\010\336\013\201Z\307\216\035\353\332\265\2534\366\031\242\242\242\336|\363\315\304\304\304\335\273wgdd\234;w\356\255\267\336\352\327\257\337\360\341\303CBB\344\037\337\243G\217\016\016\016\0368p`\307\216\035\315\317E~\377\375\367\215\0337\376\360\303\017\245[\337\276}k\327\256-}\202\202\202\272u\353v\362\344\311\213\027/\266o\337\376\321G\037\2357o\336\321\243G\2335k\266\272\310\253\257\276\252z\364\326V\271res*\250T\251\222\234\344\207\036z\250E\213\026\274\027rsH!\320\2167A\204\317\205\300\327z\367\356}\352\324\251\257\277\376Z\262\305''\237|2s\346\314\347\237\177~\316\2349\222*v\355\332\3454\376/\222\344\344\344\023''N\374\370\343\217\257\275\366\232t\226\366\341\303\207srr\334;\371\345\227_\034\016G~~~\217\036=l6[zz\272\264=\277\313\340\301\203%\320H\243s\347\316\356\215\374\011\346[\341\376]\334\206\015\033\276\362\312+5k\326\014\017\017w?\313\347B\312\212\024\002\035\225\036D\370\035\031\370\332\206\015\033\036\177\374\361\221#G6k\326\314L\025\222\025\314\267F\334N\237>\375\334s\317\375\303\360\304\023O\230\215\027_|\361\310\221#\362lBB\302\260a\303\262\263\263\245=z\364\350\304\304Di\304\304\304\310N\314\017\247\307\307\307\367\351\323\247v\355\332}\373\366\375\370\343\217\2337o.\335BCCe\315{!\267"""\242\202\361\037\313\335s\317=\023''N\344wdn\021)\004\232\222 R\245J\025\376^\010\224\270x\361\342\217?\3768|\370\360\344\344\344\331\263gw\353\326m\320\240A\335\273w\0370`@\2336mN\235:%}233\273t\351b\366o\321\242\205\331\350\337\277\377\361\343\307\315vttt\277~\3756m\332\364\3143\317Hc\350\320\241\022k$y\214\0313\306\375\215\376\374\347?GEE\311\267;|\370\360\211\023''N\236<)\353\224\224\224\013\027.\334\326\001\007\226u\353\326\315\2325\353\354\331\263%\237r\177\010\254C\207\016\345\236B\370{!@@\341o\247B\241\255[\267~\366\331g\322\270|\371r||\374\376\375\373\017\0348\220\220\220\220\224\224dv8s\346L\223&M\202\203\203_\177\375\365G\036yD\202HPPP\243F\215RSS\335;9v\354\230\303\341X\261b\305\321\243G?\370\340\003\371\222/\276\370B\332\346\263k\326\254\221\177\262w\355\332u\351\322\2453f\314\220\027Ny8g\316\234\217>\372\350\320\241C\267\177\310:\330\273w\25793\360\267S\275D\012\201\326\370\177d\240\304\211\023''\036|\360\301\276}\373\366\352\325Kb\207d\213\177\026i\325\252\225g\317\310\310\310\211\023''J\004\221\350\360\365\327_\027\333\217l\277t\351\322\320\241Ce\207]\272t9}\372tXX\230\371Tvvv\2336m\006\015\032\224\221\221q\374\370\361\270\270\270\203\007\017\276\366\332k\222ubbbn\3238\265\344\353\377G\346\277\376\353\277T\017\261<\221B\240;\376O](a\267\333\035\016\307\376\375\373%\023\014\0336\314\275\275C\207\016\356\366\312\225+\273w\357.\335\314\237\310\204\204\204L\236<Y\276\320|6<<\374\037\377\370\207\323\370\264i~~\376;\357\274#)\304\375\343\230E\213\026m\337\276\335\375\351\324y\363\346}\365\325W\317=\367\334\222%K\346\316\235{\273F\251\243\320\242\011\244f\315\232\374\237\2727D\012\001\256\035DJ\371\360\251\031D\210 \270i\207\016\035\252W\257\236\004\216i\323\246\355\330\261\343o\177\373\333\273EZ\267n-\035\022\023\023\333\265k7a\302\004\363\243\246\356O#.\\\270\360\257\177\375kTTTnnn\203\006\015\362\362\362RSS\333\264i\3434~\013\346\314\2313\362\022%\351d\335\272uf\377\201\003\007\236={V\322\311\311\223''333\2337o.ki\233\037=\201/deeU\255Z\325L\014\323\247\277_.)D\366c\356P\366\034`\377\225))\004p\271\346gDJ\231\024\370,\010n\205\303\341p\277\245!\201c\370\360\341\347\213\364\356\335[6\376\364\323O\007\016\034p\367\177\376\371\347\335m\311\020\322-66v\316\2349\011\011\011\365\353\327\317\310\310\220\355\303\206\015\313\317\317o\331\262\245\344\030s\213\350\336\275\373\211\023''\226,Y"\371\346\375\367\337\2371c\206\254\245\275h\321\242\3337Z\375\314\2349\323\014\015w\337}\367\346\315[n1\202\310\036\356\272\353.s\207\262g\325\203+g\244\020\240\220\367\177\334\335s!\202\3406p\177\340\264$w\232\271\246\323\247O\027\373\013"\270\015\362\362\362\334\1778\244j\325\252I\311\207o:\202\310\327\272\337Y\251[\267n\261_\014\016\000\244\020\340\212\262\006\021"\010\200k\312\310\310p\377\035U\211\0217\367\216\210|\225;\202\310\336\334oq\005\022R\010p\025\357\203\010\021\004@)\242\243\243+U\252df\210\273\356\272k\372\364\367\275\377\260\252\364\224\376\356\037\304\310~do\252\007\344\023\244\020\2408o\202\010\021\004\300\015Itp\277#"\036~\370\341\305K\226\226\376wD\344Y\351\343\376\215\030\363]\220@\215 NR\010pM\245\007\021"\010\000/edd\324\255[\327\363\217\014\311\334\322\241C\207\257\026/\211\216\216IK?q\361\322eYK[\266\310v\367\237&s\177\026$ \177\020\343F\012\001\256\355zA\204\010\002\240L\362\362\362f\316\234\351\376\204\207\227\244\277|U\340}\034\265\030R\010p]%\203\010\021\004\300\315\311\312\312\012\015\015u\377e\325RH\037\351\031`\177\027\344zH!@i<\203\010\021\004\300\255\333\263g\317\330\261c\2336m\372\324SOU\257^\375\356\273\357\226\265\264e\213l\227gU\037\340mE\012\001n\300\014"+V\256$\202\000@\371"\205\0007\026\031\031)\021D\326\252\017\004\000\002\012)\004\000\000\250A\012\001\000\000j\220B\000\000\200\032\244\020\000\000\240\006)\004\000\000\250A\012\001\000\000j\220B\000\000\200\032\244\020\000\000\240\006)\004\000\000\250A\012\001\000\000j\220B\000\000\200\032\244\020\000\000\240\006)\004\000\000\250A\012\001\000\000j\220B\000\000\200\032\244\020\000\000\240\006)\004\000\000\250A\012\001\000\000j\220B\000\000\200\032\244\020\000\000\240\006)\004\000\000\250A\012\001\000\000j\220B\000\000\200\032\244\020\000\000\240\006)\004\000\000\250A\012\001\000\000j\220B\000\000\200\032\244\020\000\000\240\006)\004\000\000\250A\012\001\000\000j\220B\000\000\200\032\244\020\000\000\240\006)\004\000\000\250A\012\001\000\000j\220B\000\000\200\032\244\020\000\000\240\006)\004\000\000\250A\012\001\000\000j\220B\000\000\200\032\244\020\000\000\240\006)\004\000\000\250A\012\001\000\000j\220B\000\000\200\032\244\020\000\000\240\006)\004\000\000\250A\012\001\000\000j\220B\000\000\200\032\244\020\000\000\240\006)\004\000\000\250A\012\001\000\000j\220B\000\000\200\032\244\020\000\000\240\006)\004\000\000\250A\012\001\000\000j\220B\000\000\200\032\244\020\000\000\240\006)\004\000\000\250A\012\001\000\000j\220B\000\000\200\032\244\020\000\000\240\006)\004\000\000\250A\012\001\000\000j\220B\000\000\200\032\244\020\000\000\240\006)\004\000\000\250A\012\001\000\000j\220B\000\000\200\032\244\020\000\000\240\006)\004\000\000\250A\012\001\000\000j\220B\000\000\200\032\244\020\000\000\240\006)\004\000\000\250A\012\001\000\000j\220B\000\000\200\032\244\020\000\000\240\006)\004\000\000\250A\012\001\000\000j\220B\000\000\200\032\244\020\000\000\240\006)\004\000\000\250A\012\001\000\000j\220B\000\000\200\032\244\020\000\000\240\006)\004\000\000\250A\012\001\000\000j\220B\000\000\200\032\244\020\000\000\240\006)\004\000\000\250A\012\001\000\000j\220B\000\000\200\032\244\020\000\000\240\006)\004\000\000\250A\012\001\000\000j\220B\000\000\200\032\244\020\000\000\240\006)\004\000\000\250A\012\001\000\000j\220B\000\000\200\032\244\020\000\000\240\006)\004\000\000\250A\012\001\000\000j\220B\000\000\200\032\244\020\000\000\240\006)\004\000\000\250A\012\001\000\000j\220B\000\000\200\032\244\020\000\000\240\006)\004\000\000\250A\012\001\000\000j\220B\000\000\200\032\244\020\000\000\240\006)\004\000\000\250A\012\001\000\000j\220B\000\000\200\032\244\020\000\000\240\006)\004\000\000\250A\012\001\000\000j\220B\000\000\200\032\244\020\000\000\240\006)\004\000\000\250A\012\001\000\000j\220B\000\000\200\032\244\020\000\000\240\006)\004\000\000\250A\012\001\000\000j\220B\000\000\200\032\244\020\000\000\240\006)\004\000\000\250A\012\001\000\000j\220B\000\000\200\032\244\020\000\000\240\006)\004\000\000\250A\012\001\000\000j\220B\000\000\200\032\244\020\000\000\240\006)\004\000\000\250A\012\001\000\000j\220B\000\000\200\032\244\020\000\000\240\006)\004\000\000\250A\012\001\000\000j\220B\000\000\200\032\244\020\000\000\240\006)\004\000\000\250A\012\001\000\000j\220B\000\000\200\032\244\020\000\000\240\006)\004\000\000\250A\012\001\000\000j\220B\000\000\200\032\244\020\000\000\240\006)\004\000\000\250A\012\001\000\000j\220B\000\000\200\032\244\020\000\000\240\006)\004\000\000\250A\012\001\000\000j\220B\000\000\200\032\244\020\000\000\240\006)\004\000\000\250A\012\001\000\000j\220B\000\000\200\032\244\020\000\000\240\006)\004\000\000\250A\012\001\000\000j\220B\000\000\200\032\244\020\000\000\240\006)\004\000\000\250A\012\001\000\000j\220B\000\000\200\032\244\020\000\000\240\006)\004\000\000\250A\012\001\000\000j\220B\000\000\200\032\244\020\000\000\240\006)\004\000\000\250A\012\001\000\000j\220B\000\000\200\032\244\020\000\000\240\006)\004\000\000\250A\012\001\000\000j\220B\000\000\200\032\244\020\000\000\240\006)\004\000\000\250A\012\001\000\000j\220B\000\000\200\032\244\020\000\000\240\006)\004\000\000\250A\012\001\000\000j\220B\000\000\200\032\244\020\000\000\240\006)\004\000\000\250A\012\001\000\000j\220B\000\000\200\032\244\020\000\000\240\006)\004\000\000\250A\012\001\000\000j\220B\000\000\200\032\244\020\000\000\240\006)\004\000\000\250A\012\001\000\000j\220B\000\000\200\032\244\020\000\000\240\006)\004\000\000\250A\012\001\000\000j\220B\000\000\200\032\244\020\000\000\240\006)\004\000\000\250A\012\001\000\000j\220B\000\000\200\032\244\020\000\000\240\006)\004\000\000\250A\012\001\000\000j\220B\000\000\200\032\244\020\000\000\240\006)\004\000\000\250A\012\001\000\000j\220B\000\000\200\032\244\020\000\000\240\006)\004\000\000\250A\012\001\000\000j\220B\000\000\200\032\244\020\000\000\240\006)\004\000\000\250A\012\001\000\000j\220B\000\000\200\032\244\020\000\000\240\006)\004\000\000\250A\012\001\000\000j\220B\000\000\200\032\244\020\000\000\240\006)\004\000\000\250A\012\001\000\000j\220B\000\000\200\032\244\020\000\000\240\006)\004\000\000\250A\012\001\000\000j\220B\000\000\200\032\244\020\000\000\240\006)\004\000\000\250A\012\001\000\000j\220B\000\000\200\032\244\020\000\000\240\006)\344\377\267[\307\002\000\000\000\000\203\374\255\207\261\247(\002\000\036\026\002\000<,\004\000xX\010\000\360\260\020\000\340a!\000\300\303B\000\200\207\205\000\000\017\013\001\000\036\026\002\000<,\004\000xX\010\000\360\260\020\000\340a!\000\300\303B\000\200\207\205\000\000\017\013\001\000\036\001\035A\366wF\341\2444\000\000\000\000IEND\256B`\202', '0');
INSERT INTO "public"."act_ge_bytearray" VALUES ('3', '1', 'leave/leave.bpmn', '1', '<?xml version="1.0" encoding="UTF-8"?>\015\012<definitions xmlns="http://www.omg.org/spec/BPMN/20100524/MODEL"\015\012\011xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:activiti="http://activiti.org/bpmn"\015\012\011xmlns:bpmndi="http://www.omg.org/spec/BPMN/20100524/DI" xmlns:omgdc="http://www.omg.org/spec/DD/20100524/DC"\015\012\011xmlns:omgdi="http://www.omg.org/spec/DD/20100524/DI" typeLanguage="http://www.w3.org/2001/XMLSchema"\015\012\011expressionLanguage="http://www.w3.org/1999/XPath" targetNamespace="http://www.rguess.org/demo/activiti/leave">\015\012\011<process id="leave" name="\350\257\267\345\201\207\346\265\201\347\250\213">\015\012\011\011<documentation>\350\257\267\345\201\207\346\265\201\347\250\213\346\274\224\347\244\272</documentation>\015\012\011\011<startEvent id="startevent1" name="Start"\015\012\011\011\011activiti:initiator="applyUserId"></startEvent>\015\012\011\011<userTask id="deptLeaderAudit" name="\351\203\250\351\227\250\351\242\206\345\257\274\345\256\241\346\211\271"\015\012\011\011\011activiti:candidateGroups="deptLeader"></userTask>\015\012\011\011<exclusiveGateway id="exclusivegateway5" name="Exclusive Gateway"></exclusiveGateway>\015\012\011\011<userTask id="modifyApply" name="\350\260\203\346\225\264\347\224\263\350\257\267" activiti:assignee="${applyUserId}">\015\012\011\011\011<extensionElements>\015\012\011\011\011\011<activiti:taskListener event="complete"\015\012\011\011\011\011\011delegateExpression="${afterModifyApplyContentProcessor}"></activiti:taskListener>\015\012\011\011\011</extensionElements>\015\012\011\011</userTask>\015\012\011\011<userTask id="hrAudit" name="\344\272\272\344\272\213\345\256\241\346\211\271" activiti:candidateGroups="hr"></userTask>\015\012\011\011<exclusiveGateway id="exclusivegateway6" name="Exclusive Gateway"></exclusiveGateway>\015\012\011\011<userTask id="reportBack" name="\351\224\200\345\201\207" activiti:assignee="${applyUserId}">\015\012\011\011\011<extensionElements>\015\012\011\011\011\011<activiti:taskListener event="complete"\015\012\011\011\011\011\011delegateExpression="${reportBackEndProcessor}"></activiti:taskListener>\015\012\011\011\011</extensionElements>\015\012\011\011</userTask>\015\012\011\011<endEvent id="endevent1" name="End"></endEvent>\015\012\011\011<exclusiveGateway id="exclusivegateway7" name="Exclusive Gateway"></exclusiveGateway>\015\012\011\011<sequenceFlow id="flow2" name="" sourceRef="startevent1"\015\012\011\011\011targetRef="deptLeaderAudit"></sequenceFlow>\015\012\011\011<sequenceFlow id="flow3" name="" sourceRef="deptLeaderAudit"\015\012\011\011\011targetRef="exclusivegateway5"></sequenceFlow>\015\012\011\011<sequenceFlow id="flow4" name="\344\270\215\345\220\214\346\204\217" sourceRef="exclusivegateway5"\015\012\011\011\011targetRef="modifyApply">\015\012\011\011\011<conditionExpression xsi:type="tFormalExpression"><![CDATA[${!deptLeaderPass}]]></conditionExpression>\015\012\011\011</sequenceFlow>\015\012\011\011<sequenceFlow id="flow5" name="\345\220\214\346\204\217" sourceRef="exclusivegateway5"\015\012\011\011\011targetRef="hrAudit">\015\012\011\011\011<conditionExpression xsi:type="tFormalExpression"><![CDATA[${deptLeaderPass}]]></conditionExpression>\015\012\011\011</sequenceFlow>\015\012\011\011<sequenceFlow id="flow6" name="" sourceRef="hrAudit"\015\012\011\011\011targetRef="exclusivegateway6"></sequenceFlow>\015\012\011\011<sequenceFlow id="flow7" name="\345\220\214\346\204\217" sourceRef="exclusivegateway6"\015\012\011\011\011targetRef="reportBack">\015\012\011\011\011<conditionExpression xsi:type="tFormalExpression"><![CDATA[${hrPass}]]></conditionExpression>\015\012\011\011</sequenceFlow>\015\012\011\011<sequenceFlow id="flow8" name="" sourceRef="reportBack"\015\012\011\011\011targetRef="endevent1"></sequenceFlow>\015\012\011\011<sequenceFlow id="flow9" name="\344\270\215\345\220\214\346\204\217" sourceRef="exclusivegateway6"\015\012\011\011\011targetRef="modifyApply">\015\012\011\011\011<conditionExpression xsi:type="tFormalExpression"><![CDATA[${!hrPass}]]></conditionExpression>\015\012\011\011</sequenceFlow>\015\012\011\011<sequenceFlow id="flow10" name="\351\207\215\346\226\260\347\224\263\350\257\267" sourceRef="exclusivegateway7"\015\012\011\011\011targetRef="deptLeaderAudit">\015\012\011\011\011<conditionExpression xsi:type="tFormalExpression"><![CDATA[${reApply}]]></conditionExpression>\015\012\011\011</sequenceFlow>\015\012\011\011<sequenceFlow id="flow11" name="" sourceRef="modifyApply"\015\012\011\011\011targetRef="exclusivegateway7"></sequenceFlow>\015\012\011\011<sequenceFlow id="flow12" name="\347\273\223\346\235\237\346\265\201\347\250\213" sourceRef="exclusivegateway7"\015\012\011\011\011targetRef="endevent1">\015\012\011\011\011<conditionExpression xsi:type="tFormalExpression"><![CDATA[${!reApply}]]></conditionExpression>\015\012\011\011</sequenceFlow>\015\012\011</process>\015\012\011<bpmndi:BPMNDiagram id="BPMNDiagram_leave">\015\012\011\011<bpmndi:BPMNPlane bpmnElement="leave" id="BPMNPlane_leave">\015\012\011\011\011<bpmndi:BPMNShape bpmnElement="startevent1"\015\012\011\011\011\011id="BPMNShape_startevent1">\015\012\011\011\011\011<omgdc:Bounds height="35" width="35" x="10" y="90"></omgdc:Bounds>\015\012\011\011\011</bpmndi:BPMNShape>\015\012\011\011\011<bpmndi:BPMNShape bpmnElement="deptLeaderAudit"\015\012\011\011\011\011id="BPMNShape_deptLeaderAudit">\015\012\011\011\011\011<omgdc:Bounds height="55" width="105" x="90" y="80"></omgdc:Bounds>\015\012\011\011\011</bpmndi:BPMNShape>\015\012\011\011\011<bpmndi:BPMNShape bpmnElement="exclusivegateway5"\015\012\011\011\011\011id="BPMNShape_exclusivegateway5">\015\012\011\011\011\011<omgdc:Bounds height="40" width="40" x="250" y="87"></omgdc:Bounds>\015\012\011\011\011</bpmndi:BPMNShape>\015\012\011\011\011<bpmndi:BPMNShape bpmnElement="modifyApply"\015\012\011\011\011\011id="BPMNShape_modifyApply">\015\012\011\011\011\011<omgdc:Bounds height="55" width="105" x="218" y="190"></omgdc:Bounds>\015\012\011\011\011</bpmndi:BPMNShape>\015\012\011\011\011<bpmndi:BPMNShape bpmnElement="hrAudit" id="BPMNShape_hrAudit">\015\012\011\011\011\011<omgdc:Bounds height="55" width="105" x="358" y="80"></omgdc:Bounds>\015\012\011\011\011</bpmndi:BPMNShape>\015\012\011\011\011<bpmndi:BPMNShape bpmnElement="exclusivegateway6"\015\012\011\011\011\011id="BPMNShape_exclusivegateway6">\015\012\011\011\011\011<omgdc:Bounds height="40" width="40" x="495" y="87"></omgdc:Bounds>\015\012\011\011\011</bpmndi:BPMNShape>\015\012\011\011\011<bpmndi:BPMNShape bpmnElement="reportBack" id="BPMNShape_reportBack">\015\012\011\011\011\011<omgdc:Bounds height="55" width="105" x="590" y="80"></omgdc:Bounds>\015\012\011\011\011</bpmndi:BPMNShape>\015\012\011\011\011<bpmndi:BPMNShape bpmnElement="endevent1" id="BPMNShape_endevent1">\015\012\011\011\011\011<omgdc:Bounds height="35" width="35" x="625" y="283"></omgdc:Bounds>\015\012\011\011\011</bpmndi:BPMNShape>\015\012\011\011\011<bpmndi:BPMNShape bpmnElement="exclusivegateway7"\015\012\011\011\011\011id="BPMNShape_exclusivegateway7">\015\012\011\011\011\011<omgdc:Bounds height="40" width="40" x="250" y="280"></omgdc:Bounds>\015\012\011\011\011</bpmndi:BPMNShape>\015\012\011\011\011<bpmndi:BPMNEdge bpmnElement="flow2" id="BPMNEdge_flow2">\015\012\011\011\011\011<omgdi:waypoint x="45" y="107"></omgdi:waypoint>\015\012\011\011\011\011<omgdi:waypoint x="90" y="107"></omgdi:waypoint>\015\012\011\011\011</bpmndi:BPMNEdge>\015\012\011\011\011<bpmndi:BPMNEdge bpmnElement="flow3" id="BPMNEdge_flow3">\015\012\011\011\011\011<omgdi:waypoint x="195" y="107"></omgdi:waypoint>\015\012\011\011\011\011<omgdi:waypoint x="250" y="107"></omgdi:waypoint>\015\012\011\011\011</bpmndi:BPMNEdge>\015\012\011\011\011<bpmndi:BPMNEdge bpmnElement="flow4" id="BPMNEdge_flow4">\015\012\011\011\011\011<omgdi:waypoint x="270" y="127"></omgdi:waypoint>\015\012\011\011\011\011<omgdi:waypoint x="270" y="190"></omgdi:waypoint>\015\012\011\011\011\011<bpmndi:BPMNLabel>\015\012\011\011\011\011\011<omgdc:Bounds height="11" width="100" x="10" y="0"></omgdc:Bounds>\015\012\011\011\011\011</bpmndi:BPMNLabel>\015\012\011\011\011</bpmndi:BPMNEdge>\015\012\011\011\011<bpmndi:BPMNEdge bpmnElement="flow5" id="BPMNEdge_flow5">\015\012\011\011\011\011<omgdi:waypoint x="290" y="107"></omgdi:waypoint>\015\012\011\011\011\011<omgdi:waypoint x="358" y="107"></omgdi:waypoint>\015\012\011\011\011\011<bpmndi:BPMNLabel>\015\012\011\011\011\011\011<omgdc:Bounds height="11" width="100" x="-24" y="-17"></omgdc:Bounds>\015\012\011\011\011\011</bpmndi:BPMNLabel>\015\012\011\011\011</bpmndi:BPMNEdge>\015\012\011\011\011<bpmndi:BPMNEdge bpmnElement="flow6" id="BPMNEdge_flow6">\015\012\011\011\011\011<omgdi:waypoint x="463" y="107"></omgdi:waypoint>\015\012\011\011\011\011<omgdi:waypoint x="495" y="107"></omgdi:waypoint>\015\012\011\011\011</bpmndi:BPMNEdge>\015\012\011\011\011<bpmndi:BPMNEdge bpmnElement="flow7" id="BPMNEdge_flow7">\015\012\011\011\011\011<omgdi:waypoint x="535" y="107"></omgdi:waypoint>\015\012\011\011\011\011<omgdi:waypoint x="590" y="107"></omgdi:waypoint>\015\012\011\011\011\011<bpmndi:BPMNLabel>\015\012\011\011\011\011\011<omgdc:Bounds height="11" width="100" x="-22" y="-17"></omgdc:Bounds>\015\012\011\011\011\011</bpmndi:BPMNLabel>\015\012\011\011\011</bpmndi:BPMNEdge>\015\012\011\011\011<bpmndi:BPMNEdge bpmnElement="flow8" id="BPMNEdge_flow8">\015\012\011\011\011\011<omgdi:waypoint x="642" y="135"></omgdi:waypoint>\015\012\011\011\011\011<omgdi:waypoint x="642" y="283"></omgdi:waypoint>\015\012\011\011\011</bpmndi:BPMNEdge>\015\012\011\011\011<bpmndi:BPMNEdge bpmnElement="flow9" id="BPMNEdge_flow9">\015\012\011\011\011\011<omgdi:waypoint x="515" y="127"></omgdi:waypoint>\015\012\011\011\011\011<omgdi:waypoint x="514" y="217"></omgdi:waypoint>\015\012\011\011\011\011<omgdi:waypoint x="323" y="217"></omgdi:waypoint>\015\012\011\011\011\011<bpmndi:BPMNLabel>\015\012\011\011\011\011\011<omgdc:Bounds height="11" width="100" x="10" y="0"></omgdc:Bounds>\015\012\011\011\011\011</bpmndi:BPMNLabel>\015\012\011\011\011</bpmndi:BPMNEdge>\015\012\011\011\011<bpmndi:BPMNEdge bpmnElement="flow10" id="BPMNEdge_flow10">\015\012\011\011\011\011<omgdi:waypoint x="250" y="300"></omgdi:waypoint>\015\012\011\011\011\011<omgdi:waypoint x="142" y="299"></omgdi:waypoint>\015\012\011\011\011\011<omgdi:waypoint x="142" y="135"></omgdi:waypoint>\015\012\011\011\011\011<bpmndi:BPMNLabel>\015\012\011\011\011\011\011<omgdc:Bounds height="11" width="100" x="10" y="0"></omgdc:Bounds>\015\012\011\011\011\011</bpmndi:BPMNLabel>\015\012\011\011\011</bpmndi:BPMNEdge>\015\012\011\011\011<bpmndi:BPMNEdge bpmnElement="flow11" id="BPMNEdge_flow11">\015\012\011\011\011\011<omgdi:waypoint x="270" y="245"></omgdi:waypoint>\015\012\011\011\011\011<omgdi:waypoint x="270" y="280"></omgdi:waypoint>\015\012\011\011\011</bpmndi:BPMNEdge>\015\012\011\011\011<bpmndi:BPMNEdge bpmnElement="flow12" id="BPMNEdge_flow12">\015\012\011\011\011\011<omgdi:waypoint x="290" y="300"></omgdi:waypoint>\015\012\011\011\011\011<omgdi:waypoint x="625" y="300"></omgdi:waypoint>\015\012\011\011\011\011<bpmndi:BPMNLabel>\015\012\011\011\011\011\011<omgdc:Bounds height="11" width="100" x="10" y="0"></omgdc:Bounds>\015\012\011\011\011\011</bpmndi:BPMNLabel>\015\012\011\011\011</bpmndi:BPMNEdge>\015\012\011\011</bpmndi:BPMNPlane>\015\012\011</bpmndi:BPMNDiagram>\015\012</definitions>', '0');
COMMIT;

-- ----------------------------
--  Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys_role";
CREATE TABLE "public"."sys_role" (
	"id" int8 NOT NULL,
	"authorize" varchar(255) COLLATE "default",
	"name" varchar(255) COLLATE "default",
	"realname" varchar(255) COLLATE "default",
	"remark" varchar(255) COLLATE "default"
)
WITH (OIDS=FALSE);
ALTER TABLE "public"."sys_role" OWNER TO "postgres";

-- ----------------------------
--  Records of sys_role
-- ----------------------------
BEGIN;
INSERT INTO "public"."sys_role" VALUES ('1', null, 'superAdmin', '超级管理员', '拥有所有权限');
INSERT INTO "public"."sys_role" VALUES ('6', null, 'deptLeader', '部门经理', '111');
INSERT INTO "public"."sys_role" VALUES ('7', null, 'hr', '人力经理', '');
INSERT INTO "public"."sys_role" VALUES ('8', null, 'bloger', '博客玩家', '');
INSERT INTO "public"."sys_role" VALUES ('9', null, 'showcasers', '演示分配角色', '');
COMMIT;

-- ----------------------------
--  Table structure for cms_site
-- ----------------------------
DROP TABLE IF EXISTS "public"."cms_site";
CREATE TABLE "public"."cms_site" (
	"id" int8 NOT NULL DEFAULT nextval('seq_cms_site'::regclass),
	"copyright" varchar(255) COLLATE "default",
	"description" varchar(255) COLLATE "default",
	"keywords" varchar(255) COLLATE "default",
	"logo" varchar(255) COLLATE "default",
	"name" varchar(255) COLLATE "default",
	"theme" varchar(255) COLLATE "default",
	"title" varchar(255) COLLATE "default"
)
WITH (OIDS=FALSE);
ALTER TABLE "public"."cms_site" OWNER TO "postgres";

-- ----------------------------
--  Records of cms_site
-- ----------------------------
BEGIN;
INSERT INTO "public"."cms_site" VALUES ('1', '@copy2014', '个人博客', 'blog', 'blog', 'blog', 'blog', '个人博客');
INSERT INTO "public"."cms_site" VALUES ('2', '@copy2014', '新闻网站', 'news', 'news', 'news', 'news thems', '新闻网站');
COMMIT;

-- ----------------------------
--  Table structure for sys_res
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys_res";
CREATE TABLE "public"."sys_res" (
	"id" int8 NOT NULL DEFAULT nextval('seq_sys_res'::regclass),
	"authorize" varchar(255) COLLATE "default",
	"grade" int4 NOT NULL,
	"icon" varchar(255) COLLATE "default",
	"name" varchar(255) COLLATE "default",
	"orderno" int4 NOT NULL,
	"permsstring" varchar(255) COLLATE "default",
	"remark" varchar(255) COLLATE "default",
	"resstring" varchar(255) COLLATE "default",
	"parent_id" int8
)
WITH (OIDS=FALSE);
ALTER TABLE "public"."sys_res" OWNER TO "postgres";

-- ----------------------------
--  Records of sys_res
-- ----------------------------
BEGIN;
INSERT INTO "public"."sys_res" VALUES ('1', null, '1', 'ztree_root_close', '系统管理', '8', 'sys', '系统管理', '/sys', '5');
INSERT INTO "public"."sys_res" VALUES ('2', null, '2', 'diy_icon_01_05', '用户管理', '1', 'sys:user', '用户管理', '/sys/user/list', '1');
INSERT INTO "public"."sys_res" VALUES ('3', null, '2', 'diy_icon_01_10', '角色管理', '2', 'sys:role', '角色管理', '/sys/role/list', '1');
INSERT INTO "public"."sys_res" VALUES ('4', null, '2', 'ztree_report', '资源菜单', '3', 'sys:resource', '资源管理', '/sys/resource/list', '1');
INSERT INTO "public"."sys_res" VALUES ('5', null, '0', '', 'system', '1', 'system', '最高的节点只能有一个', '/system', null);
INSERT INTO "public"."sys_res" VALUES ('7', null, '3', 'icon-tasks', '用户列表', '1', 'sys:user:list', '用户列表', '/sys/user/list', '2');
INSERT INTO "public"."sys_res" VALUES ('8', null, '3', 'icon-plus', '添加用户', '2', 'sys:user:add', '添加用户', '/sys/user/add', '2');
INSERT INTO "public"."sys_res" VALUES ('9', null, '3', 'icon-minus', '删除用户', '3', 'sys:user:delete', '', '/sys/user/delete', '2');
INSERT INTO "public"."sys_res" VALUES ('10', null, '3', 'icon-pencil', '修改用户', '4', 'sys:user:update', '', '/sys/user/update', '2');
INSERT INTO "public"."sys_res" VALUES ('11', null, '3', 'icon-tasks', '角色列表', '1', 'sys:role:list', '', '/sys/role/list', '3');
INSERT INTO "public"."sys_res" VALUES ('12', null, '3', 'icon-plus', '添加角色', '2', 'sys:role:add', '', '/sys/role/add', '3');
INSERT INTO "public"."sys_res" VALUES ('13', null, '3', 'icon-minus', '删除角色', '3', 'sys:role:delete', '', '/sys/role/delete', '3');
INSERT INTO "public"."sys_res" VALUES ('14', null, '3', 'icon-pencil', '修改角色', '4', 'sys:role:update', '', '/sys/role/update', '3');
INSERT INTO "public"."sys_res" VALUES ('15', null, '3', 'icon-tasks', '资源列表', '1', 'sys:resource:list', '', '/sys/resource/list', '4');
INSERT INTO "public"."sys_res" VALUES ('16', null, '3', 'icon-plus', '添加资源', '2', 'sys:resource:add', '', '/sys/resource/add', '4');
INSERT INTO "public"."sys_res" VALUES ('17', null, '3', 'icon-minus', '删除资源', '3', 'sys:resource:delete', '', '/sys/resource/delete', '4');
INSERT INTO "public"."sys_res" VALUES ('18', null, '3', 'icon-pencil', '修改资源', '4', 'sys:resource:update', '', '/sys/resource/update', '4');
INSERT INTO "public"."sys_res" VALUES ('19', null, '2', 'diy_icon_01_02', '图标管理', '4', 'sys:user:list', '', '/sys/icon/list', '1');
INSERT INTO "public"."sys_res" VALUES ('20', null, '3', 'icon-tasks', '图标列表', '1', 'sys:icon:list', '', '/sys/icon/list', '19');
INSERT INTO "public"."sys_res" VALUES ('21', null, '3', 'icon-plus', '添加图标', '2', 'sys:icon:add', '', '/sys/icon/add', '19');
INSERT INTO "public"."sys_res" VALUES ('22', null, '3', 'icon-minus', '删除图标', '3', 'sys:icon:delete', '', '/sys/icon/delete', '19');
INSERT INTO "public"."sys_res" VALUES ('23', null, '3', 'icon-pencil', '修改图标', '4', 'sys:icon:update', '', '/sys/icon/update', '19');
INSERT INTO "public"."sys_res" VALUES ('24', null, '3', 'ztree_file2', '详细信息', '5', 'sys:user:show', '', '/sys/user/show', '2');
INSERT INTO "public"."sys_res" VALUES ('25', null, '3', 'ztree_file2', '详细信息', '5', 'sys:role:show', '', '/sys/role/show', '3');
INSERT INTO "public"."sys_res" VALUES ('28', null, '1', 'diy_icon_01_48', '数据迁移服务', '2', 'etl', '数据迁移ETL服务', '/etl', '5');
INSERT INTO "public"."sys_res" VALUES ('29', null, '2', 'diy_icon_01_29', '迁移任务管理', '1', 'etl:jobmgnt', '', '/etl/jobmgnt', '28');
INSERT INTO "public"."sys_res" VALUES ('30', null, '1', 'diy_icon_04_20', '工作流管理', '6', 'workflow', '', '/workflow', '5');
INSERT INTO "public"."sys_res" VALUES ('31', null, '3', 'icon-key', '更改用户状态', '6', 'sys:user:changeUserStatus', '', '/sys/user/changeUserStatus', '2');
INSERT INTO "public"."sys_res" VALUES ('32', null, '2', 'ztree_edit2', '待办', '1', 'workflow:todoTasks', '', '/workflow/todoTasks', '30');
INSERT INTO "public"."sys_res" VALUES ('33', null, '2', 'diy_icon_01_42', '已办', '2', 'workflow:hasTodo', '', '/workflow/hasTodo', '30');
INSERT INTO "public"."sys_res" VALUES ('34', null, '2', 'diy_icon_04_41', '发起流程', '3', 'workflow:process', '', '/workflow/process', '30');
INSERT INTO "public"."sys_res" VALUES ('35', null, '2', 'diy_icon_02_33', '我的流程', '4', 'workflow:myprocess', '', '/workflow/myprocess', '30');
INSERT INTO "public"."sys_res" VALUES ('36', null, '2', 'diy_icon_04_19', '系统日志', '5', 'sys:log:list', '', '/sys/log/list', '1');
INSERT INTO "public"."sys_res" VALUES ('37', null, '3', 'icon-tasks', '日志列表', '1', 'sys:log:list', '', '/sys/log/list', '36');
INSERT INTO "public"."sys_res" VALUES ('39', null, '2', 'diy_icon_03_08', '数据源管理', '1', 'meta:DataSource', '', '/meta/DataSource/list', '41');
INSERT INTO "public"."sys_res" VALUES ('40', null, '3', 'icon-cog', '删除日志', '2', 'sys:log:delete', '', '/sys/log/delete', '36');
INSERT INTO "public"."sys_res" VALUES ('41', null, '1', 'diy_icon_04_49', '数据仓库管理', '3', 'dbmgnt', '数据仓库管理，Hive建库、建表、建立索引、建立预统计表管理', '/dbmgnt', '5');
INSERT INTO "public"."sys_res" VALUES ('42', null, '1', 'diy_icon_02_34', '报表', '5', 'bi', '', '/bi', '5');
INSERT INTO "public"."sys_res" VALUES ('43', null, '2', 'diy_icon_02_32', '在线数据分析', '1', 'bi:olap', 'mondrian数据在线分析', '/bi/olap', '42');
INSERT INTO "public"."sys_res" VALUES ('44', null, '2', 'diy_icon_02_31', '财务分析', '2', 'finance:analyze', '', '/finance/analyze', '42');
INSERT INTO "public"."sys_res" VALUES ('45', null, '2', 'diy_icon_02_44', '表单管理', '1', 'meta:DBTable', '', '/meta/DBTable/list', '41');
INSERT INTO "public"."sys_res" VALUES ('46', null, '1', 'diy_icon_01_46', '内容管理', '7', 'cms', '', '/cms', '5');
INSERT INTO "public"."sys_res" VALUES ('47', null, '2', 'diy_icon_01_23', '内容发布', '1', 'cms', '', '/cms/', '46');
INSERT INTO "public"."sys_res" VALUES ('49', null, '2', 'diy_icon_04_37', '栏目管理', '2', 'cms:category:list', '', '/cms/category/list', '46');
INSERT INTO "public"."sys_res" VALUES ('50', null, '2', 'diy_icon_02_44', '站点管理', '1', 'cms:site:list', '', '/cms/site/list', '46');
INSERT INTO "public"."sys_res" VALUES ('51', null, '2', 'diy_icon_01_28', '评论管理', '5', 'cms:comment', '', '/cms/comment/list', '46');
INSERT INTO "public"."sys_res" VALUES ('52', null, '2', 'diy_icon_01_30', '数据查询', '3', 'meta:query', '', '/meta/query', '41');
INSERT INTO "public"."sys_res" VALUES ('53', null, '2', 'diy_icon_04_39', '字典管理', '6', 'sys:dict', '数据字典管理', '/sys/dict', '1');
INSERT INTO "public"."sys_res" VALUES ('54', null, '2', 'diy_icon_04_06', '语言管理', '7', 'sys:language', '', '/sys/language', '1');
INSERT INTO "public"."sys_res" VALUES ('55', null, '1', 'icon-cog', '调度任务', '4', 'Job:manager', '', 'task/job', '5');
INSERT INTO "public"."sys_res" VALUES ('57', null, '2', 'icon-cog', 'quarzt监管', '1', 'job:quartz', '调度管理', '/task/quartz/list', '55');
INSERT INTO "public"."sys_res" VALUES ('58', null, '2', 'icon-cog', '任务管理', '1', 'sys:taskmgnt', '任务管理', '/task/timeTask/list', '55');
INSERT INTO "public"."sys_res" VALUES ('59', null, '2', 'icon-cog', 'cron trigger验证', '3', 'sys:cronmgnt', '', '/task/conrmgnt', '55');
INSERT INTO "public"."sys_res" VALUES ('60', null, '2', 'icon-cog', '迁移插件管理', '2', 'etl:pluginmgnt', '迁移插件管理', 'sys/etl/pluginmgnt', '28');
INSERT INTO "public"."sys_res" VALUES ('61', null, '2', 'icon-cog', 'kettle任务管理', '3', 'etl:kettleMgnt', '', 'sys/etl/kettleMgnt', '28');
INSERT INTO "public"."sys_res" VALUES ('62', null, '1', 'icon-cog', 'lotuseedata 演示', '1', 'lotuseed', 'lotuseedata 演示', '/lotuseed', '5');
INSERT INTO "public"."sys_res" VALUES ('63', null, '2', 'icon-cog', 'start session查询', '1', 'lotuseed:sessionQuery', 'start session查询', '/lotuseed/sessionQuery', '62');
INSERT INTO "public"."sys_res" VALUES ('64', null, '2', 'icon-cog', '页面访问查询', '2', 'lotuseed:circleQuery', '', '/lotuseed/circleQuery', '62');
INSERT INTO "public"."sys_res" VALUES ('65', null, '2', 'icon-cog', '项目管理', '0', 'meta:project', '项目管理', '/meta/project', '41');
COMMIT;

-- ----------------------------
--  Table structure for meta_module_object
-- ----------------------------
DROP TABLE IF EXISTS "public"."meta_module_object";
CREATE TABLE "public"."meta_module_object" (
	"module_id" int8 NOT NULL,
	"object_id" int8 NOT NULL,
	"object_type" int4 NOT NULL,
	"remark" varchar COLLATE "default"
)
WITH (OIDS=FALSE);
ALTER TABLE "public"."meta_module_object" OWNER TO "postgres";

-- ----------------------------
--  Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys_user";
CREATE TABLE "public"."sys_user" (
	"id" int8 NOT NULL DEFAULT nextval('seq_sys_user'::regclass),
	"address" varchar(255) COLLATE "default",
	"createdate" timestamp(6) NOT NULL,
	"email" varchar(255) COLLATE "default",
	"loginid" varchar(255) NOT NULL COLLATE "default",
	"mobilephone" varchar(255) COLLATE "default",
	"name" varchar(255) COLLATE "default",
	"passwd" varchar(255) COLLATE "default",
	"remark" varchar(255) COLLATE "default",
	"status" varchar(255) NOT NULL COLLATE "default"
)
WITH (OIDS=FALSE);
ALTER TABLE "public"."sys_user" OWNER TO "postgres";

-- ----------------------------
--  Records of sys_user
-- ----------------------------
BEGIN;
INSERT INTO "public"."sys_user" VALUES ('4', '成都', '2013-03-07 00:00:00', 'sa@ww.cc', 'user2', '15222233426', '人力经理', '8d2209bf7ec9ac2eec597eb378a7cbf5', '123', '1');
INSERT INTO "public"."sys_user" VALUES ('5', '成都', '2014-03-14 00:00:00', '502876941@qq.com', 'admin', '15108276486', '超级管理员', 'a66abb5684c45962d887564f08346e8d', '帅气的开发者', '1');
INSERT INTO "public"."sys_user" VALUES ('7', '成都', '2014-03-23 00:00:00', 'sa22@ww.cc', 'depman', '15369654627', '部门经理', '1fa11d49afc1479d1392df32c9cd7dd4', '你好', '1');
INSERT INTO "public"."sys_user" VALUES ('8', '成都', '2014-05-24 00:00:00', 'sss@ss.cc', 'shenyc', '15236568954', '申鱼川', 'b3a92e2ce005f4cb00ceed9baa0d212c', '合作伙伴', '1');
INSERT INTO "public"."sys_user" VALUES ('9', '成都', '2014-05-27 00:00:00', 'sss@ss.cc', 'showcase', '15236568954', '演示', '6747c1c2e26c5d41711d0cf0a284702b', '供演示使用', '1');
COMMIT;

-- ----------------------------
--  Table structure for meta_index
-- ----------------------------
DROP TABLE IF EXISTS "public"."meta_index";
CREATE TABLE "public"."meta_index" (
	"id" int8 NOT NULL,
	"index_name" varchar COLLATE "default",
	"type_name" varchar COLLATE "default",
	"table_id" int8,
	"remark" varchar COLLATE "default",
	"create_date" date,
	"update_date" date,
	"createby_id" int8,
	"updateby_id" int8,
	"index_type" int4
)
WITH (OIDS=FALSE);
ALTER TABLE "public"."meta_index" OWNER TO "postgres";

-- ----------------------------
--  Records of meta_index
-- ----------------------------
BEGIN;
INSERT INTO "public"."meta_index" VALUES ('1', 'userfigure', 'T_User_Figure', '1', 'es索引表', '2015-12-14', '2015-12-14', '5', '5', '1');
COMMIT;


-- ----------------------------
--  Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."seq_cms_article" RESTART 46;
ALTER SEQUENCE "public"."seq_cms_category" RESTART 38;
ALTER SEQUENCE "public"."seq_cms_comment" RESTART 416;
ALTER SEQUENCE "public"."seq_cms_link" RESTART 15;
ALTER SEQUENCE "public"."seq_cms_site" RESTART 3;
ALTER SEQUENCE "public"."seq_finace" RESTART 2;
ALTER SEQUENCE "public"."seq_oa_leave" RESTART 15;
ALTER SEQUENCE "public"."seq_sys_dict" RESTART 2;
ALTER SEQUENCE "public"."seq_sys_icon" RESTART 364;
ALTER SEQUENCE "public"."seq_sys_log" RESTART 30;
ALTER SEQUENCE "public"."seq_sys_res" RESTART 66;
ALTER SEQUENCE "public"."seq_sys_role" RESTART 10;
ALTER SEQUENCE "public"."seq_sys_test" RESTART 4;
ALTER SEQUENCE "public"."seq_sys_timetask" RESTART 2;
ALTER SEQUENCE "public"."seq_sys_user" RESTART 10;
-- ----------------------------
--  Primary key structure for table act_ge_property
-- ----------------------------
ALTER TABLE "public"."act_ge_property" ADD PRIMARY KEY ("name_") NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Primary key structure for table act_hi_actinst
-- ----------------------------
ALTER TABLE "public"."act_hi_actinst" ADD PRIMARY KEY ("id_") NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Indexes structure for table act_hi_actinst
-- ----------------------------
CREATE INDEX  "act_idx_hi_act_inst_end" ON "public"."act_hi_actinst" USING btree(end_time_ ASC NULLS LAST);
CREATE INDEX  "act_idx_hi_act_inst_exec" ON "public"."act_hi_actinst" USING btree(execution_id_ COLLATE "default" ASC NULLS LAST, act_id_ COLLATE "default" ASC NULLS LAST);
CREATE INDEX  "act_idx_hi_act_inst_procinst" ON "public"."act_hi_actinst" USING btree(proc_inst_id_ COLLATE "default" ASC NULLS LAST, act_id_ COLLATE "default" ASC NULLS LAST);
CREATE INDEX  "act_idx_hi_act_inst_start" ON "public"."act_hi_actinst" USING btree(start_time_ ASC NULLS LAST);

-- ----------------------------
--  Primary key structure for table act_hi_attachment
-- ----------------------------
ALTER TABLE "public"."act_hi_attachment" ADD PRIMARY KEY ("id_") NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Primary key structure for table act_hi_comment
-- ----------------------------
ALTER TABLE "public"."act_hi_comment" ADD PRIMARY KEY ("id_") NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Primary key structure for table act_hi_detail
-- ----------------------------
ALTER TABLE "public"."act_hi_detail" ADD PRIMARY KEY ("id_") NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Indexes structure for table act_hi_detail
-- ----------------------------
CREATE INDEX  "act_idx_hi_detail_act_inst" ON "public"."act_hi_detail" USING btree(act_inst_id_ COLLATE "default" ASC NULLS LAST);
CREATE INDEX  "act_idx_hi_detail_name" ON "public"."act_hi_detail" USING btree(name_ COLLATE "default" ASC NULLS LAST);
CREATE INDEX  "act_idx_hi_detail_proc_inst" ON "public"."act_hi_detail" USING btree(proc_inst_id_ COLLATE "default" ASC NULLS LAST);
CREATE INDEX  "act_idx_hi_detail_task_id" ON "public"."act_hi_detail" USING btree(task_id_ COLLATE "default" ASC NULLS LAST);
CREATE INDEX  "act_idx_hi_detail_time" ON "public"."act_hi_detail" USING btree(time_ ASC NULLS LAST);

-- ----------------------------
--  Primary key structure for table act_hi_identitylink
-- ----------------------------
ALTER TABLE "public"."act_hi_identitylink" ADD PRIMARY KEY ("id_") NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Indexes structure for table act_hi_identitylink
-- ----------------------------
CREATE INDEX  "act_idx_hi_ident_lnk_procinst" ON "public"."act_hi_identitylink" USING btree(proc_inst_id_ COLLATE "default" ASC NULLS LAST);
CREATE INDEX  "act_idx_hi_ident_lnk_task" ON "public"."act_hi_identitylink" USING btree(task_id_ COLLATE "default" ASC NULLS LAST);
CREATE INDEX  "act_idx_hi_ident_lnk_user" ON "public"."act_hi_identitylink" USING btree(user_id_ COLLATE "default" ASC NULLS LAST);

-- ----------------------------
--  Primary key structure for table act_hi_procinst
-- ----------------------------
ALTER TABLE "public"."act_hi_procinst" ADD PRIMARY KEY ("id_") NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Indexes structure for table act_hi_procinst
-- ----------------------------
CREATE INDEX  "act_idx_hi_pro_i_buskey" ON "public"."act_hi_procinst" USING btree(business_key_ COLLATE "default" ASC NULLS LAST);
CREATE INDEX  "act_idx_hi_pro_inst_end" ON "public"."act_hi_procinst" USING btree(end_time_ ASC NULLS LAST);
CREATE UNIQUE INDEX  "act_uniq_hi_bus_key" ON "public"."act_hi_procinst" USING btree(proc_def_id_ COLLATE "default" ASC NULLS LAST, business_key_ COLLATE "default" ASC NULLS LAST);
CREATE UNIQUE INDEX  "proc_inst_id_" ON "public"."act_hi_procinst" USING btree(proc_inst_id_ COLLATE "default" ASC NULLS LAST);

-- ----------------------------
--  Primary key structure for table act_hi_taskinst
-- ----------------------------
ALTER TABLE "public"."act_hi_taskinst" ADD PRIMARY KEY ("id_") NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Primary key structure for table act_hi_varinst
-- ----------------------------
ALTER TABLE "public"."act_hi_varinst" ADD PRIMARY KEY ("id_") NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Indexes structure for table act_hi_varinst
-- ----------------------------
CREATE INDEX  "act_idx_hi_procvar_name_type" ON "public"."act_hi_varinst" USING btree(name_ COLLATE "default" ASC NULLS LAST, var_type_ COLLATE "default" ASC NULLS LAST);
CREATE INDEX  "act_idx_hi_procvar_proc_inst" ON "public"."act_hi_varinst" USING btree(proc_inst_id_ COLLATE "default" ASC NULLS LAST);

-- ----------------------------
--  Primary key structure for table act_re_procdef
-- ----------------------------
ALTER TABLE "public"."act_re_procdef" ADD PRIMARY KEY ("id_") NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Indexes structure for table act_re_procdef
-- ----------------------------
CREATE UNIQUE INDEX  "act_uniq_procdef" ON "public"."act_re_procdef" USING btree(key_ COLLATE "default" ASC NULLS LAST, version_ ASC NULLS LAST);

-- ----------------------------
--  Triggers structure for table act_re_procdef
-- ----------------------------
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_18580" AFTER DELETE ON "public"."act_re_procdef" FROM "public"."act_ru_execution" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_del"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_18580" ON "public"."act_re_procdef" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_18581" AFTER UPDATE ON "public"."act_re_procdef" FROM "public"."act_ru_execution" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_18581" ON "public"."act_re_procdef" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_18590" AFTER DELETE ON "public"."act_re_procdef" FROM "public"."act_ru_identitylink" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_del"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_18590" ON "public"."act_re_procdef" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_18591" AFTER UPDATE ON "public"."act_re_procdef" FROM "public"."act_ru_identitylink" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_18591" ON "public"."act_re_procdef" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_18610" AFTER DELETE ON "public"."act_re_procdef" FROM "public"."act_ru_task" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_del"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_18610" ON "public"."act_re_procdef" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_18611" AFTER UPDATE ON "public"."act_re_procdef" FROM "public"."act_ru_task" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_18611" ON "public"."act_re_procdef" IS NULL;

-- ----------------------------
--  Primary key structure for table act_ru_job
-- ----------------------------
ALTER TABLE "public"."act_ru_job" ADD PRIMARY KEY ("id_") NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Indexes structure for table act_ru_job
-- ----------------------------
CREATE INDEX  "act_fk_job_exception" ON "public"."act_ru_job" USING btree(exception_stack_id_ COLLATE "default" ASC NULLS LAST);

-- ----------------------------
--  Triggers structure for table act_ru_job
-- ----------------------------
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_18602" AFTER INSERT ON "public"."act_ru_job" FROM "public"."act_ge_bytearray" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_18602" ON "public"."act_ru_job" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_18603" AFTER UPDATE ON "public"."act_ru_job" FROM "public"."act_ge_bytearray" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_18603" ON "public"."act_ru_job" IS NULL;

-- ----------------------------
--  Primary key structure for table act_ru_task
-- ----------------------------
ALTER TABLE "public"."act_ru_task" ADD PRIMARY KEY ("id_") NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Indexes structure for table act_ru_task
-- ----------------------------
CREATE INDEX  "act_fk_task_exe" ON "public"."act_ru_task" USING btree(execution_id_ COLLATE "default" ASC NULLS LAST);
CREATE INDEX  "act_fk_task_procdef" ON "public"."act_ru_task" USING btree(proc_def_id_ COLLATE "default" ASC NULLS LAST);
CREATE INDEX  "act_fk_task_procinst" ON "public"."act_ru_task" USING btree(proc_inst_id_ COLLATE "default" ASC NULLS LAST);
CREATE INDEX  "act_idx_task_create" ON "public"."act_ru_task" USING btree(create_time_ ASC NULLS LAST);

-- ----------------------------
--  Triggers structure for table act_ru_task
-- ----------------------------
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_18595" AFTER DELETE ON "public"."act_ru_task" FROM "public"."act_ru_identitylink" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_del"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_18595" ON "public"."act_ru_task" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_18596" AFTER UPDATE ON "public"."act_ru_task" FROM "public"."act_ru_identitylink" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_18596" ON "public"."act_ru_task" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_18607" AFTER INSERT ON "public"."act_ru_task" FROM "public"."act_ru_execution" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_18607" ON "public"."act_ru_task" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_18608" AFTER UPDATE ON "public"."act_ru_task" FROM "public"."act_ru_execution" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_18608" ON "public"."act_ru_task" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_18612" AFTER INSERT ON "public"."act_ru_task" FROM "public"."act_re_procdef" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_18612" ON "public"."act_ru_task" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_18613" AFTER UPDATE ON "public"."act_ru_task" FROM "public"."act_re_procdef" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_18613" ON "public"."act_ru_task" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_18617" AFTER INSERT ON "public"."act_ru_task" FROM "public"."act_ru_execution" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_18617" ON "public"."act_ru_task" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_18618" AFTER UPDATE ON "public"."act_ru_task" FROM "public"."act_ru_execution" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_18618" ON "public"."act_ru_task" IS NULL;

-- ----------------------------
--  Primary key structure for table act_ru_identitylink
-- ----------------------------
ALTER TABLE "public"."act_ru_identitylink" ADD PRIMARY KEY ("id_") NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Indexes structure for table act_ru_identitylink
-- ----------------------------
CREATE INDEX  "act_fk_idl_procinst" ON "public"."act_ru_identitylink" USING btree(proc_inst_id_ COLLATE "default" ASC NULLS LAST);
CREATE INDEX  "act_fk_tskass_task" ON "public"."act_ru_identitylink" USING btree(task_id_ COLLATE "default" ASC NULLS LAST);
CREATE INDEX  "act_idx_athrz_procedef" ON "public"."act_ru_identitylink" USING btree(proc_def_id_ COLLATE "default" ASC NULLS LAST);
CREATE INDEX  "act_idx_ident_lnk_group" ON "public"."act_ru_identitylink" USING btree(group_id_ COLLATE "default" ASC NULLS LAST);
CREATE INDEX  "act_idx_ident_lnk_user" ON "public"."act_ru_identitylink" USING btree(user_id_ COLLATE "default" ASC NULLS LAST);

-- ----------------------------
--  Triggers structure for table act_ru_identitylink
-- ----------------------------
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_18587" AFTER INSERT ON "public"."act_ru_identitylink" FROM "public"."act_ru_execution" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_18587" ON "public"."act_ru_identitylink" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_18588" AFTER UPDATE ON "public"."act_ru_identitylink" FROM "public"."act_ru_execution" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_18588" ON "public"."act_ru_identitylink" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_18592" AFTER INSERT ON "public"."act_ru_identitylink" FROM "public"."act_re_procdef" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_18592" ON "public"."act_ru_identitylink" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_18593" AFTER UPDATE ON "public"."act_ru_identitylink" FROM "public"."act_re_procdef" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_18593" ON "public"."act_ru_identitylink" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_18597" AFTER INSERT ON "public"."act_ru_identitylink" FROM "public"."act_ru_task" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_18597" ON "public"."act_ru_identitylink" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_18598" AFTER UPDATE ON "public"."act_ru_identitylink" FROM "public"."act_ru_task" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_18598" ON "public"."act_ru_identitylink" IS NULL;

-- ----------------------------
--  Primary key structure for table act_ru_variable
-- ----------------------------
ALTER TABLE "public"."act_ru_variable" ADD PRIMARY KEY ("id_") NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Indexes structure for table act_ru_variable
-- ----------------------------
CREATE INDEX  "act_fk_var_bytearray" ON "public"."act_ru_variable" USING btree(bytearray_id_ COLLATE "default" ASC NULLS LAST);
CREATE INDEX  "act_fk_var_exe" ON "public"."act_ru_variable" USING btree(execution_id_ COLLATE "default" ASC NULLS LAST);
CREATE INDEX  "act_fk_var_procinst" ON "public"."act_ru_variable" USING btree(proc_inst_id_ COLLATE "default" ASC NULLS LAST);
CREATE INDEX  "act_idx_variable_task_id" ON "public"."act_ru_variable" USING btree(task_id_ COLLATE "default" ASC NULLS LAST);

-- ----------------------------
--  Triggers structure for table act_ru_variable
-- ----------------------------
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_18622" AFTER INSERT ON "public"."act_ru_variable" FROM "public"."act_ru_execution" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_18622" ON "public"."act_ru_variable" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_18623" AFTER UPDATE ON "public"."act_ru_variable" FROM "public"."act_ru_execution" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_18623" ON "public"."act_ru_variable" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_18627" AFTER INSERT ON "public"."act_ru_variable" FROM "public"."act_ru_execution" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_18627" ON "public"."act_ru_variable" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_18628" AFTER UPDATE ON "public"."act_ru_variable" FROM "public"."act_ru_execution" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_18628" ON "public"."act_ru_variable" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_18632" AFTER INSERT ON "public"."act_ru_variable" FROM "public"."act_ge_bytearray" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_18632" ON "public"."act_ru_variable" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_18633" AFTER UPDATE ON "public"."act_ru_variable" FROM "public"."act_ge_bytearray" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_18633" ON "public"."act_ru_variable" IS NULL;

-- ----------------------------
--  Primary key structure for table cms_category
-- ----------------------------
ALTER TABLE "public"."cms_category" ADD PRIMARY KEY ("id") NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Indexes structure for table cms_category
-- ----------------------------
CREATE INDEX  "fk2478cf341eec3da4" ON "public"."cms_category" USING btree(site_id ASC NULLS LAST);
CREATE INDEX  "fk2478cf34ea0c9e18" ON "public"."cms_category" USING btree(parent_id ASC NULLS LAST);

-- ----------------------------
--  Triggers structure for table cms_category
-- ----------------------------
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_18645" AFTER DELETE ON "public"."cms_category" FROM "public"."cms_article" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_del"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_18645" ON "public"."cms_category" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_18646" AFTER UPDATE ON "public"."cms_category" FROM "public"."cms_article" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_18646" ON "public"."cms_category" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_18650" AFTER DELETE ON "public"."cms_category" FROM "public"."cms_category" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_del"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_18650" ON "public"."cms_category" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_18651" AFTER UPDATE ON "public"."cms_category" FROM "public"."cms_category" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_18651" ON "public"."cms_category" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_18652" AFTER INSERT ON "public"."cms_category" FROM "public"."cms_category" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_18652" ON "public"."cms_category" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_18653" AFTER UPDATE ON "public"."cms_category" FROM "public"."cms_category" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_18653" ON "public"."cms_category" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_18657" AFTER INSERT ON "public"."cms_category" FROM "public"."cms_site" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_18657" ON "public"."cms_category" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_18658" AFTER UPDATE ON "public"."cms_category" FROM "public"."cms_site" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_18658" ON "public"."cms_category" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_18670" AFTER DELETE ON "public"."cms_category" FROM "public"."cms_link" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_del"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_18670" ON "public"."cms_category" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_18671" AFTER UPDATE ON "public"."cms_category" FROM "public"."cms_link" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_18671" ON "public"."cms_category" IS NULL;

-- ----------------------------
--  Primary key structure for table cms_article
-- ----------------------------
ALTER TABLE "public"."cms_article" ADD PRIMARY KEY ("id") NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Indexes structure for table cms_article
-- ----------------------------
CREATE INDEX  "fk935c9c00ca4e9944" ON "public"."cms_article" USING btree(category_id ASC NULLS LAST);
CREATE INDEX  "fk935c9c00e80591ec" ON "public"."cms_article" USING btree(updateby_id ASC NULLS LAST);
CREATE INDEX  "fk935c9c00ecc85199" ON "public"."cms_article" USING btree(createby_id ASC NULLS LAST);

-- ----------------------------
--  Triggers structure for table cms_article
-- ----------------------------
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_18637" AFTER INSERT ON "public"."cms_article" FROM "public"."sys_user" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_18637" ON "public"."cms_article" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_18638" AFTER UPDATE ON "public"."cms_article" FROM "public"."sys_user" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_18638" ON "public"."cms_article" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_18642" AFTER INSERT ON "public"."cms_article" FROM "public"."sys_user" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_18642" ON "public"."cms_article" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_18643" AFTER UPDATE ON "public"."cms_article" FROM "public"."sys_user" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_18643" ON "public"."cms_article" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_18647" AFTER INSERT ON "public"."cms_article" FROM "public"."cms_category" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_18647" ON "public"."cms_article" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_18648" AFTER UPDATE ON "public"."cms_article" FROM "public"."cms_category" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_18648" ON "public"."cms_article" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_18665" AFTER DELETE ON "public"."cms_article" FROM "public"."cms_comment" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_del"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_18665" ON "public"."cms_article" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_18666" AFTER UPDATE ON "public"."cms_article" FROM "public"."cms_comment" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_18666" ON "public"."cms_article" IS NULL;

-- ----------------------------
--  Primary key structure for table cms_link
-- ----------------------------
ALTER TABLE "public"."cms_link" ADD PRIMARY KEY ("id") NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Indexes structure for table cms_link
-- ----------------------------
CREATE INDEX  "fk7bc64d30ca4e9944" ON "public"."cms_link" USING btree(category_id ASC NULLS LAST);

-- ----------------------------
--  Triggers structure for table cms_link
-- ----------------------------
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_18672" AFTER INSERT ON "public"."cms_link" FROM "public"."cms_category" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_18672" ON "public"."cms_link" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_18673" AFTER UPDATE ON "public"."cms_link" FROM "public"."cms_category" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_18673" ON "public"."cms_link" IS NULL;

-- ----------------------------
--  Primary key structure for table cms_comment
-- ----------------------------
ALTER TABLE "public"."cms_comment" ADD PRIMARY KEY ("id") NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Indexes structure for table cms_comment
-- ----------------------------
CREATE INDEX  "fkf7a9bd696f3c6204" ON "public"."cms_comment" USING btree(auditer_id ASC NULLS LAST);
CREATE INDEX  "fkf7a9bd69c09e6470" ON "public"."cms_comment" USING btree(article_id ASC NULLS LAST);

-- ----------------------------
--  Triggers structure for table cms_comment
-- ----------------------------
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_18662" AFTER INSERT ON "public"."cms_comment" FROM "public"."sys_user" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_18662" ON "public"."cms_comment" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_18663" AFTER UPDATE ON "public"."cms_comment" FROM "public"."sys_user" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_18663" ON "public"."cms_comment" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_18667" AFTER INSERT ON "public"."cms_comment" FROM "public"."cms_article" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_18667" ON "public"."cms_comment" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_18668" AFTER UPDATE ON "public"."cms_comment" FROM "public"."cms_article" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_18668" ON "public"."cms_comment" IS NULL;

-- ----------------------------
--  Primary key structure for table act_re_model
-- ----------------------------
ALTER TABLE "public"."act_re_model" ADD PRIMARY KEY ("id_") NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Indexes structure for table act_re_model
-- ----------------------------
CREATE INDEX  "act_fk_model_deployment" ON "public"."act_re_model" USING btree(deployment_id_ COLLATE "default" ASC NULLS LAST);
CREATE INDEX  "act_fk_model_source" ON "public"."act_re_model" USING btree(editor_source_value_id_ COLLATE "default" ASC NULLS LAST);
CREATE INDEX  "act_fk_model_source_extra" ON "public"."act_re_model" USING btree(editor_source_extra_value_id_ COLLATE "default" ASC NULLS LAST);

-- ----------------------------
--  Triggers structure for table act_re_model
-- ----------------------------
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_18547" AFTER INSERT ON "public"."act_re_model" FROM "public"."act_ge_bytearray" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_18547" ON "public"."act_re_model" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_18548" AFTER UPDATE ON "public"."act_re_model" FROM "public"."act_ge_bytearray" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_18548" ON "public"."act_re_model" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_18552" AFTER INSERT ON "public"."act_re_model" FROM "public"."act_ge_bytearray" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_18552" ON "public"."act_re_model" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_18553" AFTER UPDATE ON "public"."act_re_model" FROM "public"."act_ge_bytearray" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_18553" ON "public"."act_re_model" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_18557" AFTER INSERT ON "public"."act_re_model" FROM "public"."act_re_deployment" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_18557" ON "public"."act_re_model" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_18558" AFTER UPDATE ON "public"."act_re_model" FROM "public"."act_re_deployment" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_18558" ON "public"."act_re_model" IS NULL;

-- ----------------------------
--  Primary key structure for table etl_job
-- ----------------------------
ALTER TABLE "public"."etl_job" ADD PRIMARY KEY ("id") NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Primary key structure for table etl_job_log
-- ----------------------------
ALTER TABLE "public"."etl_job_log" ADD PRIMARY KEY ("id") NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Primary key structure for table etl_param_column
-- ----------------------------
ALTER TABLE "public"."etl_param_column" ADD PRIMARY KEY ("id") NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Primary key structure for table etl_plugin
-- ----------------------------
ALTER TABLE "public"."etl_plugin" ADD PRIMARY KEY ("id") NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Primary key structure for table etl_plugin_param
-- ----------------------------
ALTER TABLE "public"."etl_plugin_param" ADD PRIMARY KEY ("id") NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Primary key structure for table etl_task
-- ----------------------------
ALTER TABLE "public"."etl_task" ADD PRIMARY KEY ("id") NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Primary key structure for table etl_task_param
-- ----------------------------
ALTER TABLE "public"."etl_task_param" ADD PRIMARY KEY ("id") NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Primary key structure for table meta_case_info
-- ----------------------------
ALTER TABLE "public"."meta_case_info" ADD PRIMARY KEY ("id") NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Primary key structure for table meta_datasource
-- ----------------------------
ALTER TABLE "public"."meta_datasource" ADD PRIMARY KEY ("id") NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Primary key structure for table meta_dbtable
-- ----------------------------
ALTER TABLE "public"."meta_dbtable" ADD PRIMARY KEY ("id") NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Indexes structure for table meta_dbtable
-- ----------------------------
CREATE INDEX  "IDX_TABLE_NAME" ON "public"."meta_dbtable" USING btree("table_name" COLLATE "default" ASC NULLS LAST, datasource_id ASC NULLS LAST);

-- ----------------------------
--  Primary key structure for table meta_module
-- ----------------------------
ALTER TABLE "public"."meta_module" ADD PRIMARY KEY ("id") NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Primary key structure for table meta_module_table
-- ----------------------------
ALTER TABLE "public"."meta_module_table" ADD PRIMARY KEY ("module_id", "table_id") NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Primary key structure for table meta_poject
-- ----------------------------
ALTER TABLE "public"."meta_poject" ADD PRIMARY KEY ("id") NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Primary key structure for table sys_dict
-- ----------------------------
ALTER TABLE "public"."sys_dict" ADD PRIMARY KEY ("id") NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Primary key structure for table sys_icon
-- ----------------------------
ALTER TABLE "public"."sys_icon" ADD PRIMARY KEY ("id") NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Indexes structure for table sys_icon
-- ----------------------------
CREATE UNIQUE INDEX  "mark_unique" ON "public"."sys_icon" USING btree(mark COLLATE "default" ASC NULLS LAST);

-- ----------------------------
--  Primary key structure for table sys_muti_lang
-- ----------------------------
ALTER TABLE "public"."sys_muti_lang" ADD PRIMARY KEY ("id") NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Uniques structure for table sys_muti_lang
-- ----------------------------
ALTER TABLE "public"."sys_muti_lang" ADD CONSTRAINT "sys_muti_lang_lang_key_lang_code_key" UNIQUE ("lang_key","lang_code") NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Primary key structure for table meta_column
-- ----------------------------
ALTER TABLE "public"."meta_column" ADD PRIMARY KEY ("id") NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Primary key structure for table sys_log
-- ----------------------------
ALTER TABLE "public"."sys_log" ADD PRIMARY KEY ("id") NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Indexes structure for table sys_log
-- ----------------------------
CREATE INDEX  "fkc3427a92d8327538" ON "public"."sys_log" USING btree(userid ASC NULLS LAST);

-- ----------------------------
--  Triggers structure for table sys_log
-- ----------------------------
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_18677" AFTER INSERT ON "public"."sys_log" FROM "public"."sys_user" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_18677" ON "public"."sys_log" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_18678" AFTER UPDATE ON "public"."sys_log" FROM "public"."sys_user" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_18678" ON "public"."sys_log" IS NULL;

-- ----------------------------
--  Primary key structure for table sys_test
-- ----------------------------
ALTER TABLE "public"."sys_test" ADD PRIMARY KEY ("id") NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Primary key structure for table sys_user_role
-- ----------------------------
ALTER TABLE "public"."sys_user_role" ADD PRIMARY KEY ("user_id", "role_id") NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Indexes structure for table sys_user_role
-- ----------------------------
CREATE INDEX  "fkaabb7d581423121" ON "public"."sys_user_role" USING btree(user_id ASC NULLS LAST);
CREATE INDEX  "fkaabb7d585c176d41" ON "public"."sys_user_role" USING btree(role_id ASC NULLS LAST);

-- ----------------------------
--  Triggers structure for table sys_user_role
-- ----------------------------
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_18697" AFTER INSERT ON "public"."sys_user_role" FROM "public"."sys_role" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_18697" ON "public"."sys_user_role" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_18698" AFTER UPDATE ON "public"."sys_user_role" FROM "public"."sys_role" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_18698" ON "public"."sys_user_role" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_18702" AFTER INSERT ON "public"."sys_user_role" FROM "public"."sys_user" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_18702" ON "public"."sys_user_role" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_18703" AFTER UPDATE ON "public"."sys_user_role" FROM "public"."sys_user" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_18703" ON "public"."sys_user_role" IS NULL;

-- ----------------------------
--  Primary key structure for table sys_role_res
-- ----------------------------
ALTER TABLE "public"."sys_role_res" ADD PRIMARY KEY ("role_id", "res_id") NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Indexes structure for table sys_role_res
-- ----------------------------
CREATE INDEX  "fk9a255a8923ae94ef" ON "public"."sys_role_res" USING btree(res_id ASC NULLS LAST);
CREATE INDEX  "fk9a255a895c176d41" ON "public"."sys_role_res" USING btree(role_id ASC NULLS LAST);

-- ----------------------------
--  Triggers structure for table sys_role_res
-- ----------------------------
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_18687" AFTER INSERT ON "public"."sys_role_res" FROM "public"."sys_role" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_18687" ON "public"."sys_role_res" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_18688" AFTER UPDATE ON "public"."sys_role_res" FROM "public"."sys_role" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_18688" ON "public"."sys_role_res" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_18692" AFTER INSERT ON "public"."sys_role_res" FROM "public"."sys_res" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_18692" ON "public"."sys_role_res" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_18693" AFTER UPDATE ON "public"."sys_role_res" FROM "public"."sys_res" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_18693" ON "public"."sys_role_res" IS NULL;

-- ----------------------------
--  Primary key structure for table act_ru_execution
-- ----------------------------
ALTER TABLE "public"."act_ru_execution" ADD PRIMARY KEY ("id_") NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Indexes structure for table act_ru_execution
-- ----------------------------
CREATE INDEX  "act_fk_exe_parent" ON "public"."act_ru_execution" USING btree(parent_id_ COLLATE "default" ASC NULLS LAST);
CREATE INDEX  "act_fk_exe_procinst" ON "public"."act_ru_execution" USING btree(proc_inst_id_ COLLATE "default" ASC NULLS LAST);
CREATE INDEX  "act_fk_exe_super" ON "public"."act_ru_execution" USING btree(super_exec_ COLLATE "default" ASC NULLS LAST);
CREATE INDEX  "act_idx_exec_buskey" ON "public"."act_ru_execution" USING btree(business_key_ COLLATE "default" ASC NULLS LAST);
CREATE UNIQUE INDEX  "act_uniq_ru_bus_key" ON "public"."act_ru_execution" USING btree(proc_def_id_ COLLATE "default" ASC NULLS LAST, business_key_ COLLATE "default" ASC NULLS LAST);

-- ----------------------------
--  Triggers structure for table act_ru_execution
-- ----------------------------
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_18560" AFTER DELETE ON "public"."act_ru_execution" FROM "public"."act_ru_event_subscr" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_del"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_18560" ON "public"."act_ru_execution" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_18561" AFTER UPDATE ON "public"."act_ru_execution" FROM "public"."act_ru_event_subscr" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_18561" ON "public"."act_ru_execution" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_18565" AFTER DELETE ON "public"."act_ru_execution" FROM "public"."act_ru_execution" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_del"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_18565" ON "public"."act_ru_execution" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_18566" AFTER UPDATE ON "public"."act_ru_execution" FROM "public"."act_ru_execution" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_18566" ON "public"."act_ru_execution" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_18567" AFTER INSERT ON "public"."act_ru_execution" FROM "public"."act_ru_execution" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_18567" ON "public"."act_ru_execution" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_18568" AFTER UPDATE ON "public"."act_ru_execution" FROM "public"."act_ru_execution" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_18568" ON "public"."act_ru_execution" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_18570" AFTER DELETE ON "public"."act_ru_execution" FROM "public"."act_ru_execution" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_del"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_18570" ON "public"."act_ru_execution" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_18571" AFTER UPDATE ON "public"."act_ru_execution" FROM "public"."act_ru_execution" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_18571" ON "public"."act_ru_execution" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_18572" AFTER INSERT ON "public"."act_ru_execution" FROM "public"."act_ru_execution" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_18572" ON "public"."act_ru_execution" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_18573" AFTER UPDATE ON "public"."act_ru_execution" FROM "public"."act_ru_execution" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_18573" ON "public"."act_ru_execution" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_18575" AFTER DELETE ON "public"."act_ru_execution" FROM "public"."act_ru_execution" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_del"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_18575" ON "public"."act_ru_execution" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_18576" AFTER UPDATE ON "public"."act_ru_execution" FROM "public"."act_ru_execution" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_18576" ON "public"."act_ru_execution" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_18577" AFTER INSERT ON "public"."act_ru_execution" FROM "public"."act_ru_execution" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_18577" ON "public"."act_ru_execution" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_18578" AFTER UPDATE ON "public"."act_ru_execution" FROM "public"."act_ru_execution" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_18578" ON "public"."act_ru_execution" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_18582" AFTER INSERT ON "public"."act_ru_execution" FROM "public"."act_re_procdef" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_18582" ON "public"."act_ru_execution" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_18583" AFTER UPDATE ON "public"."act_ru_execution" FROM "public"."act_re_procdef" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_18583" ON "public"."act_ru_execution" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_18585" AFTER DELETE ON "public"."act_ru_execution" FROM "public"."act_ru_identitylink" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_del"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_18585" ON "public"."act_ru_execution" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_18586" AFTER UPDATE ON "public"."act_ru_execution" FROM "public"."act_ru_identitylink" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_18586" ON "public"."act_ru_execution" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_18605" AFTER DELETE ON "public"."act_ru_execution" FROM "public"."act_ru_task" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_del"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_18605" ON "public"."act_ru_execution" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_18606" AFTER UPDATE ON "public"."act_ru_execution" FROM "public"."act_ru_task" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_18606" ON "public"."act_ru_execution" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_18615" AFTER DELETE ON "public"."act_ru_execution" FROM "public"."act_ru_task" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_del"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_18615" ON "public"."act_ru_execution" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_18616" AFTER UPDATE ON "public"."act_ru_execution" FROM "public"."act_ru_task" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_18616" ON "public"."act_ru_execution" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_18620" AFTER DELETE ON "public"."act_ru_execution" FROM "public"."act_ru_variable" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_del"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_18620" ON "public"."act_ru_execution" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_18621" AFTER UPDATE ON "public"."act_ru_execution" FROM "public"."act_ru_variable" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_18621" ON "public"."act_ru_execution" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_18625" AFTER DELETE ON "public"."act_ru_execution" FROM "public"."act_ru_variable" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_del"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_18625" ON "public"."act_ru_execution" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_18626" AFTER UPDATE ON "public"."act_ru_execution" FROM "public"."act_ru_variable" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_18626" ON "public"."act_ru_execution" IS NULL;

-- ----------------------------
--  Primary key structure for table act_re_deployment
-- ----------------------------
ALTER TABLE "public"."act_re_deployment" ADD PRIMARY KEY ("id_") NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Triggers structure for table act_re_deployment
-- ----------------------------
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_18540" AFTER DELETE ON "public"."act_re_deployment" FROM "public"."act_ge_bytearray" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_del"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_18540" ON "public"."act_re_deployment" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_18541" AFTER UPDATE ON "public"."act_re_deployment" FROM "public"."act_ge_bytearray" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_18541" ON "public"."act_re_deployment" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_18555" AFTER DELETE ON "public"."act_re_deployment" FROM "public"."act_re_model" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_del"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_18555" ON "public"."act_re_deployment" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_18556" AFTER UPDATE ON "public"."act_re_deployment" FROM "public"."act_re_model" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_18556" ON "public"."act_re_deployment" IS NULL;

-- ----------------------------
--  Primary key structure for table act_ru_event_subscr
-- ----------------------------
ALTER TABLE "public"."act_ru_event_subscr" ADD PRIMARY KEY ("id_") NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Indexes structure for table act_ru_event_subscr
-- ----------------------------
CREATE INDEX  "act_fk_event_exec" ON "public"."act_ru_event_subscr" USING btree(execution_id_ COLLATE "default" ASC NULLS LAST);
CREATE INDEX  "act_idx_event_subscr_config_" ON "public"."act_ru_event_subscr" USING btree(configuration_ COLLATE "default" ASC NULLS LAST);

-- ----------------------------
--  Triggers structure for table act_ru_event_subscr
-- ----------------------------
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_18562" AFTER INSERT ON "public"."act_ru_event_subscr" FROM "public"."act_ru_execution" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_18562" ON "public"."act_ru_event_subscr" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_18563" AFTER UPDATE ON "public"."act_ru_event_subscr" FROM "public"."act_ru_execution" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_18563" ON "public"."act_ru_event_subscr" IS NULL;

-- ----------------------------
--  Primary key structure for table act_ge_bytearray
-- ----------------------------
ALTER TABLE "public"."act_ge_bytearray" ADD PRIMARY KEY ("id_") NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Indexes structure for table act_ge_bytearray
-- ----------------------------
CREATE INDEX  "act_fk_bytearr_depl" ON "public"."act_ge_bytearray" USING btree(deployment_id_ COLLATE "default" ASC NULLS LAST);

-- ----------------------------
--  Triggers structure for table act_ge_bytearray
-- ----------------------------
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_18542" AFTER INSERT ON "public"."act_ge_bytearray" FROM "public"."act_re_deployment" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_18542" ON "public"."act_ge_bytearray" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_18543" AFTER UPDATE ON "public"."act_ge_bytearray" FROM "public"."act_re_deployment" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_18543" ON "public"."act_ge_bytearray" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_18545" AFTER DELETE ON "public"."act_ge_bytearray" FROM "public"."act_re_model" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_del"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_18545" ON "public"."act_ge_bytearray" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_18546" AFTER UPDATE ON "public"."act_ge_bytearray" FROM "public"."act_re_model" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_18546" ON "public"."act_ge_bytearray" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_18550" AFTER DELETE ON "public"."act_ge_bytearray" FROM "public"."act_re_model" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_del"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_18550" ON "public"."act_ge_bytearray" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_18551" AFTER UPDATE ON "public"."act_ge_bytearray" FROM "public"."act_re_model" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_18551" ON "public"."act_ge_bytearray" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_18600" AFTER DELETE ON "public"."act_ge_bytearray" FROM "public"."act_ru_job" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_del"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_18600" ON "public"."act_ge_bytearray" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_18601" AFTER UPDATE ON "public"."act_ge_bytearray" FROM "public"."act_ru_job" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_18601" ON "public"."act_ge_bytearray" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_18630" AFTER DELETE ON "public"."act_ge_bytearray" FROM "public"."act_ru_variable" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_del"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_18630" ON "public"."act_ge_bytearray" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_18631" AFTER UPDATE ON "public"."act_ge_bytearray" FROM "public"."act_ru_variable" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_18631" ON "public"."act_ge_bytearray" IS NULL;

-- ----------------------------
--  Primary key structure for table sys_role
-- ----------------------------
ALTER TABLE "public"."sys_role" ADD PRIMARY KEY ("id") NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Triggers structure for table sys_role
-- ----------------------------
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_18685" AFTER DELETE ON "public"."sys_role" FROM "public"."sys_role_res" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_del"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_18685" ON "public"."sys_role" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_18686" AFTER UPDATE ON "public"."sys_role" FROM "public"."sys_role_res" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_18686" ON "public"."sys_role" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_18695" AFTER DELETE ON "public"."sys_role" FROM "public"."sys_user_role" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_del"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_18695" ON "public"."sys_role" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_18696" AFTER UPDATE ON "public"."sys_role" FROM "public"."sys_user_role" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_18696" ON "public"."sys_role" IS NULL;

-- ----------------------------
--  Primary key structure for table cms_site
-- ----------------------------
ALTER TABLE "public"."cms_site" ADD PRIMARY KEY ("id") NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Indexes structure for table cms_site
-- ----------------------------
CREATE UNIQUE INDEX  "name_unique" ON "public"."cms_site" USING btree("name" COLLATE "default" ASC NULLS LAST);

-- ----------------------------
--  Triggers structure for table cms_site
-- ----------------------------
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_18655" AFTER DELETE ON "public"."cms_site" FROM "public"."cms_category" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_del"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_18655" ON "public"."cms_site" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_18656" AFTER UPDATE ON "public"."cms_site" FROM "public"."cms_category" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_18656" ON "public"."cms_site" IS NULL;

-- ----------------------------
--  Primary key structure for table sys_res
-- ----------------------------
ALTER TABLE "public"."sys_res" ADD PRIMARY KEY ("id") NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Indexes structure for table sys_res
-- ----------------------------
CREATE INDEX  "fkc3428feed6c7d0a5" ON "public"."sys_res" USING btree(parent_id ASC NULLS LAST);

-- ----------------------------
--  Triggers structure for table sys_res
-- ----------------------------
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_18680" AFTER DELETE ON "public"."sys_res" FROM "public"."sys_res" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_del"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_18680" ON "public"."sys_res" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_18681" AFTER UPDATE ON "public"."sys_res" FROM "public"."sys_res" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_18681" ON "public"."sys_res" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_18682" AFTER INSERT ON "public"."sys_res" FROM "public"."sys_res" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_18682" ON "public"."sys_res" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_18683" AFTER UPDATE ON "public"."sys_res" FROM "public"."sys_res" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_18683" ON "public"."sys_res" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_18690" AFTER DELETE ON "public"."sys_res" FROM "public"."sys_role_res" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_del"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_18690" ON "public"."sys_res" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_18691" AFTER UPDATE ON "public"."sys_res" FROM "public"."sys_role_res" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_18691" ON "public"."sys_res" IS NULL;

-- ----------------------------
--  Primary key structure for table meta_module_object
-- ----------------------------
ALTER TABLE "public"."meta_module_object" ADD PRIMARY KEY ("module_id", "object_id", "object_type") NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Primary key structure for table sys_user
-- ----------------------------
ALTER TABLE "public"."sys_user" ADD PRIMARY KEY ("id") NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Indexes structure for table sys_user
-- ----------------------------
CREATE UNIQUE INDEX  "loginid" ON "public"."sys_user" USING btree(loginid COLLATE "default" ASC NULLS LAST);

-- ----------------------------
--  Triggers structure for table sys_user
-- ----------------------------
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_18635" AFTER DELETE ON "public"."sys_user" FROM "public"."cms_article" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_del"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_18635" ON "public"."sys_user" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_18636" AFTER UPDATE ON "public"."sys_user" FROM "public"."cms_article" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_18636" ON "public"."sys_user" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_18640" AFTER DELETE ON "public"."sys_user" FROM "public"."cms_article" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_del"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_18640" ON "public"."sys_user" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_18641" AFTER UPDATE ON "public"."sys_user" FROM "public"."cms_article" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_18641" ON "public"."sys_user" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_18660" AFTER DELETE ON "public"."sys_user" FROM "public"."cms_comment" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_del"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_18660" ON "public"."sys_user" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_18661" AFTER UPDATE ON "public"."sys_user" FROM "public"."cms_comment" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_18661" ON "public"."sys_user" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_18675" AFTER DELETE ON "public"."sys_user" FROM "public"."sys_log" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_del"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_18675" ON "public"."sys_user" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_18676" AFTER UPDATE ON "public"."sys_user" FROM "public"."sys_log" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_18676" ON "public"."sys_user" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_18700" AFTER DELETE ON "public"."sys_user" FROM "public"."sys_user_role" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_del"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_18700" ON "public"."sys_user" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_18701" AFTER UPDATE ON "public"."sys_user" FROM "public"."sys_user_role" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_18701" ON "public"."sys_user" IS NULL;

-- ----------------------------
--  Primary key structure for table meta_index
-- ----------------------------
ALTER TABLE "public"."meta_index" ADD PRIMARY KEY ("id") NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Foreign keys structure for table act_ru_job
-- ----------------------------
ALTER TABLE "public"."act_ru_job" ADD CONSTRAINT "act_ru_job_exception_stack_id__fkey" FOREIGN KEY ("exception_stack_id_") REFERENCES "public"."act_ge_bytearray" ("id_") ON UPDATE NO ACTION ON DELETE NO ACTION NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Foreign keys structure for table act_ru_task
-- ----------------------------
ALTER TABLE "public"."act_ru_task" ADD CONSTRAINT "act_ru_task_proc_inst_id__fkey" FOREIGN KEY ("proc_inst_id_") REFERENCES "public"."act_ru_execution" ("id_") ON UPDATE NO ACTION ON DELETE NO ACTION NOT DEFERRABLE INITIALLY IMMEDIATE;
ALTER TABLE "public"."act_ru_task" ADD CONSTRAINT "act_ru_task_proc_def_id__fkey" FOREIGN KEY ("proc_def_id_") REFERENCES "public"."act_re_procdef" ("id_") ON UPDATE NO ACTION ON DELETE NO ACTION NOT DEFERRABLE INITIALLY IMMEDIATE;
ALTER TABLE "public"."act_ru_task" ADD CONSTRAINT "act_ru_task_execution_id__fkey" FOREIGN KEY ("execution_id_") REFERENCES "public"."act_ru_execution" ("id_") ON UPDATE NO ACTION ON DELETE NO ACTION NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Foreign keys structure for table act_ru_identitylink
-- ----------------------------
ALTER TABLE "public"."act_ru_identitylink" ADD CONSTRAINT "act_ru_identitylink_proc_inst_id__fkey" FOREIGN KEY ("proc_inst_id_") REFERENCES "public"."act_ru_execution" ("id_") ON UPDATE NO ACTION ON DELETE NO ACTION NOT DEFERRABLE INITIALLY IMMEDIATE;
ALTER TABLE "public"."act_ru_identitylink" ADD CONSTRAINT "act_ru_identitylink_proc_def_id__fkey" FOREIGN KEY ("proc_def_id_") REFERENCES "public"."act_re_procdef" ("id_") ON UPDATE NO ACTION ON DELETE NO ACTION NOT DEFERRABLE INITIALLY IMMEDIATE;
ALTER TABLE "public"."act_ru_identitylink" ADD CONSTRAINT "act_ru_identitylink_task_id__fkey" FOREIGN KEY ("task_id_") REFERENCES "public"."act_ru_task" ("id_") ON UPDATE NO ACTION ON DELETE NO ACTION NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Foreign keys structure for table act_ru_variable
-- ----------------------------
ALTER TABLE "public"."act_ru_variable" ADD CONSTRAINT "act_ru_variable_proc_inst_id__fkey" FOREIGN KEY ("proc_inst_id_") REFERENCES "public"."act_ru_execution" ("id_") ON UPDATE NO ACTION ON DELETE NO ACTION NOT DEFERRABLE INITIALLY IMMEDIATE;
ALTER TABLE "public"."act_ru_variable" ADD CONSTRAINT "act_ru_variable_execution_id__fkey" FOREIGN KEY ("execution_id_") REFERENCES "public"."act_ru_execution" ("id_") ON UPDATE NO ACTION ON DELETE NO ACTION NOT DEFERRABLE INITIALLY IMMEDIATE;
ALTER TABLE "public"."act_ru_variable" ADD CONSTRAINT "act_ru_variable_bytearray_id__fkey" FOREIGN KEY ("bytearray_id_") REFERENCES "public"."act_ge_bytearray" ("id_") ON UPDATE NO ACTION ON DELETE NO ACTION NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Foreign keys structure for table cms_category
-- ----------------------------
ALTER TABLE "public"."cms_category" ADD CONSTRAINT "cms_category_parent_id_fkey" FOREIGN KEY ("parent_id") REFERENCES "public"."cms_category" ("id") ON UPDATE NO ACTION ON DELETE NO ACTION NOT DEFERRABLE INITIALLY IMMEDIATE;
ALTER TABLE "public"."cms_category" ADD CONSTRAINT "cms_category_site_id_fkey" FOREIGN KEY ("site_id") REFERENCES "public"."cms_site" ("id") ON UPDATE NO ACTION ON DELETE NO ACTION NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Foreign keys structure for table cms_article
-- ----------------------------
ALTER TABLE "public"."cms_article" ADD CONSTRAINT "cms_article_updateby_id_fkey" FOREIGN KEY ("updateby_id") REFERENCES "public"."sys_user" ("id") ON UPDATE NO ACTION ON DELETE NO ACTION NOT DEFERRABLE INITIALLY IMMEDIATE;
ALTER TABLE "public"."cms_article" ADD CONSTRAINT "cms_article_createby_id_fkey" FOREIGN KEY ("createby_id") REFERENCES "public"."sys_user" ("id") ON UPDATE NO ACTION ON DELETE NO ACTION NOT DEFERRABLE INITIALLY IMMEDIATE;
ALTER TABLE "public"."cms_article" ADD CONSTRAINT "cms_article_category_id_fkey" FOREIGN KEY ("category_id") REFERENCES "public"."cms_category" ("id") ON UPDATE NO ACTION ON DELETE NO ACTION NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Foreign keys structure for table cms_link
-- ----------------------------
ALTER TABLE "public"."cms_link" ADD CONSTRAINT "cms_link_category_id_fkey" FOREIGN KEY ("category_id") REFERENCES "public"."cms_category" ("id") ON UPDATE NO ACTION ON DELETE NO ACTION NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Foreign keys structure for table cms_comment
-- ----------------------------
ALTER TABLE "public"."cms_comment" ADD CONSTRAINT "cms_comment_auditer_id_fkey" FOREIGN KEY ("auditer_id") REFERENCES "public"."sys_user" ("id") ON UPDATE NO ACTION ON DELETE NO ACTION NOT DEFERRABLE INITIALLY IMMEDIATE;
ALTER TABLE "public"."cms_comment" ADD CONSTRAINT "cms_comment_article_id_fkey" FOREIGN KEY ("article_id") REFERENCES "public"."cms_article" ("id") ON UPDATE NO ACTION ON DELETE NO ACTION NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Foreign keys structure for table act_re_model
-- ----------------------------
ALTER TABLE "public"."act_re_model" ADD CONSTRAINT "act_re_model_editor_source_extra_value_id__fkey" FOREIGN KEY ("editor_source_extra_value_id_") REFERENCES "public"."act_ge_bytearray" ("id_") ON UPDATE NO ACTION ON DELETE NO ACTION NOT DEFERRABLE INITIALLY IMMEDIATE;
ALTER TABLE "public"."act_re_model" ADD CONSTRAINT "act_re_model_editor_source_value_id__fkey" FOREIGN KEY ("editor_source_value_id_") REFERENCES "public"."act_ge_bytearray" ("id_") ON UPDATE NO ACTION ON DELETE NO ACTION NOT DEFERRABLE INITIALLY IMMEDIATE;
ALTER TABLE "public"."act_re_model" ADD CONSTRAINT "act_re_model_deployment_id__fkey" FOREIGN KEY ("deployment_id_") REFERENCES "public"."act_re_deployment" ("id_") ON UPDATE NO ACTION ON DELETE NO ACTION NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Foreign keys structure for table sys_log
-- ----------------------------
ALTER TABLE "public"."sys_log" ADD CONSTRAINT "sys_log_userid_fkey" FOREIGN KEY ("userid") REFERENCES "public"."sys_user" ("id") ON UPDATE NO ACTION ON DELETE NO ACTION NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Foreign keys structure for table sys_user_role
-- ----------------------------
ALTER TABLE "public"."sys_user_role" ADD CONSTRAINT "sys_user_role_role_id_fkey" FOREIGN KEY ("role_id") REFERENCES "public"."sys_role" ("id") ON UPDATE NO ACTION ON DELETE NO ACTION NOT DEFERRABLE INITIALLY IMMEDIATE;
ALTER TABLE "public"."sys_user_role" ADD CONSTRAINT "sys_user_role_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "public"."sys_user" ("id") ON UPDATE NO ACTION ON DELETE NO ACTION NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Foreign keys structure for table sys_role_res
-- ----------------------------
ALTER TABLE "public"."sys_role_res" ADD CONSTRAINT "sys_role_res_role_id_fkey" FOREIGN KEY ("role_id") REFERENCES "public"."sys_role" ("id") ON UPDATE NO ACTION ON DELETE NO ACTION NOT DEFERRABLE INITIALLY IMMEDIATE;
ALTER TABLE "public"."sys_role_res" ADD CONSTRAINT "sys_role_res_res_id_fkey" FOREIGN KEY ("res_id") REFERENCES "public"."sys_res" ("id") ON UPDATE NO ACTION ON DELETE NO ACTION NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Foreign keys structure for table act_ru_execution
-- ----------------------------
ALTER TABLE "public"."act_ru_execution" ADD CONSTRAINT "act_ru_execution_proc_inst_id__fkey" FOREIGN KEY ("proc_inst_id_") REFERENCES "public"."act_ru_execution" ("id_") ON UPDATE NO ACTION ON DELETE NO ACTION NOT DEFERRABLE INITIALLY IMMEDIATE;
ALTER TABLE "public"."act_ru_execution" ADD CONSTRAINT "act_ru_execution_super_exec__fkey" FOREIGN KEY ("super_exec_") REFERENCES "public"."act_ru_execution" ("id_") ON UPDATE NO ACTION ON DELETE NO ACTION NOT DEFERRABLE INITIALLY IMMEDIATE;
ALTER TABLE "public"."act_ru_execution" ADD CONSTRAINT "act_ru_execution_parent_id__fkey" FOREIGN KEY ("parent_id_") REFERENCES "public"."act_ru_execution" ("id_") ON UPDATE NO ACTION ON DELETE NO ACTION NOT DEFERRABLE INITIALLY IMMEDIATE;
ALTER TABLE "public"."act_ru_execution" ADD CONSTRAINT "act_ru_execution_proc_def_id__fkey" FOREIGN KEY ("proc_def_id_") REFERENCES "public"."act_re_procdef" ("id_") ON UPDATE NO ACTION ON DELETE NO ACTION NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Foreign keys structure for table act_ru_event_subscr
-- ----------------------------
ALTER TABLE "public"."act_ru_event_subscr" ADD CONSTRAINT "act_ru_event_subscr_execution_id__fkey" FOREIGN KEY ("execution_id_") REFERENCES "public"."act_ru_execution" ("id_") ON UPDATE NO ACTION ON DELETE NO ACTION NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Foreign keys structure for table act_ge_bytearray
-- ----------------------------
ALTER TABLE "public"."act_ge_bytearray" ADD CONSTRAINT "act_ge_bytearray_deployment_id__fkey" FOREIGN KEY ("deployment_id_") REFERENCES "public"."act_re_deployment" ("id_") ON UPDATE NO ACTION ON DELETE NO ACTION NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Foreign keys structure for table sys_res
-- ----------------------------
ALTER TABLE "public"."sys_res" ADD CONSTRAINT "sys_res_parent_id_fkey" FOREIGN KEY ("parent_id") REFERENCES "public"."sys_res" ("id") ON UPDATE NO ACTION ON DELETE NO ACTION NOT DEFERRABLE INITIALLY IMMEDIATE;

