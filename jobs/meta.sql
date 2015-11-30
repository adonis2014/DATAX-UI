/*==============================================================*/
/* DBMS name:      PostgreSQL 8                                 */
/* Created on:     2015/7/27 12:00:00                           */
/*==============================================================*/


drop index ACT_FK_BYTEARR_DEPL;

drop table act_ge_bytearray;

drop table act_ge_property;

drop index ACT_IDX_HI_ACT_INST_START;

drop index ACT_IDX_HI_ACT_INST_PROCINST;

drop index ACT_IDX_HI_ACT_INST_EXEC;

drop index ACT_IDX_HI_ACT_INST_END;

drop table act_hi_actinst;

drop table act_hi_attachment;

drop table act_hi_comment;

drop index ACT_IDX_HI_DETAIL_TIME;

drop index ACT_IDX_HI_DETAIL_TASK_ID;

drop index ACT_IDX_HI_DETAIL_PROC_INST;

drop index ACT_IDX_HI_DETAIL_NAME;

drop index ACT_IDX_HI_DETAIL_ACT_INST;

drop table act_hi_detail;

drop index ACT_IDX_HI_IDENT_LNK_USER;

drop index ACT_IDX_HI_IDENT_LNK_TASK;

drop index ACT_IDX_HI_IDENT_LNK_PROCINST;

drop table act_hi_identitylink;

drop index ACT_IDX_HI_PRO_I_BUSKEY;

drop index ACT_IDX_HI_PRO_INST_END;

drop table act_hi_procinst;

drop table act_hi_taskinst;

drop index ACT_IDX_HI_PROCVAR_PROC_INST;

drop index ACT_IDX_HI_PROCVAR_NAME_TYPE;

drop table act_hi_varinst;

drop table act_id_group;

drop table act_id_membership;

drop table act_id_user;

drop table act_re_deployment;

drop index ACT_FK_MODEL_SOURCE_EXTRA;

drop index ACT_FK_MODEL_SOURCE;

drop index ACT_FK_MODEL_DEPLOYMENT;

drop table act_re_model;

drop table act_re_procdef;

drop index ACT_IDX_EVENT_SUBSCR_CONFIG_;

drop index ACT_FK_EVENT_EXEC;

drop table act_ru_event_subscr;

drop index ACT_IDX_EXEC_BUSKEY;

drop index ACT_FK_EXE_SUPER;

drop index ACT_FK_EXE_PROCINST;

drop index ACT_FK_EXE_PARENT;

drop table act_ru_execution;

drop index ACT_IDX_IDENT_LNK_USER;

drop index ACT_IDX_IDENT_LNK_GROUP;

drop index ACT_IDX_ATHRZ_PROCEDEF;

drop index ACT_FK_TSKASS_TASK;

drop index ACT_FK_IDL_PROCINST;

drop table act_ru_identitylink;

drop index ACT_FK_JOB_EXCEPTION;

drop table act_ru_job;

drop index ACT_IDX_TASK_CREATE;

drop index ACT_FK_TASK_PROCINST;

drop index ACT_FK_TASK_PROCDEF;

drop index ACT_FK_TASK_EXE;

drop table act_ru_task;

drop index ACT_IDX_VARIABLE_TASK_ID;

drop index ACT_FK_VAR_PROCINST;

drop index ACT_FK_VAR_EXE;

drop index ACT_FK_VAR_BYTEARRAY;

drop table act_ru_variable;

drop index FK935C9C00CA4E9944;

drop table cms_article;

drop index FK2478CF34EA0C9E18;

drop index FK2478CF341EEC3DA4;

drop table cms_category;

drop table cms_comment;

drop index FK7BC64D30CA4E9944;

drop table cms_link;

drop table cms_site;

drop table etl_job;

drop table etl_job_log;

drop table etl_param_column;

drop table etl_plugin;

drop table etl_plugin_param;

drop table etl_task;

drop table etl_task_param;

drop table meta_case_info;

drop table meta_column;

drop table meta_datasource;

drop table meta_dbtable;

drop table meta_module;

drop table meta_module_table;

drop table meta_poject;

drop table sys_dict;

drop table sys_icon;

drop index FKC3427A92D8327538;

drop table sys_log;

drop table sys_muti_lang;

drop index FKC3428FEED6C7D0A5;

drop table sys_res;

drop table sys_role;

drop index FK9A255A895C176D41;

drop index FK9A255A8923AE94EF;

drop table sys_role_res;

drop table sys_test;

drop table sys_user;

drop index FKAABB7D585C176D41;

drop index FKAABB7D581423121;

drop table sys_user_role;

/*==============================================================*/
/* Table: act_ge_bytearray                                      */
/*==============================================================*/
create table act_ge_bytearray (
   ID_                  VARCHAR(64)          not null,
   REV_                 INT4                 null,
   NAME_                VARCHAR(255)         null,
   DEPLOYMENT_ID_       VARCHAR(64)          null,
   BYTES_               CHAR                 null,
   GENERATED_           INT2                 null,
   constraint PK_act_ge_bytearray primary key (ID_)
);

/*==============================================================*/
/* Index: ACT_FK_BYTEARR_DEPL                                   */
/*==============================================================*/
create  index ACT_FK_BYTEARR_DEPL on act_ge_bytearray (
DEPLOYMENT_ID_
);

/*==============================================================*/
/* Table: act_ge_property                                       */
/*==============================================================*/
create table act_ge_property (
   NAME_                VARCHAR(64)          not null,
   VALUE_               VARCHAR(300)         null,
   REV_                 INT4                 null,
   constraint PK_act_ge_property primary key (NAME_)
);

/*==============================================================*/
/* Table: act_hi_actinst                                        */
/*==============================================================*/
create table act_hi_actinst (
   ID_                  VARCHAR(64)          not null,
   PROC_DEF_ID_         VARCHAR(64)          not null,
   PROC_INST_ID_        VARCHAR(64)          not null,
   EXECUTION_ID_        VARCHAR(64)          not null,
   ACT_ID_              VARCHAR(255)         not null,
   TASK_ID_             VARCHAR(64)          null,
   CALL_PROC_INST_ID_   VARCHAR(64)          null,
   ACT_NAME_            VARCHAR(255)         null,
   ACT_TYPE_            VARCHAR(255)         not null,
   ASSIGNEE_            VARCHAR(255)         null,
   START_TIME_          DATE                 not null,
   END_TIME_            DATE                 null,
   DURATION_            INT8                 null,
   constraint PK_act_hi_actinst primary key (ID_)
);

/*==============================================================*/
/* Index: ACT_IDX_HI_ACT_INST_END                               */
/*==============================================================*/
create  index ACT_IDX_HI_ACT_INST_END on act_hi_actinst (
END_TIME_
);

/*==============================================================*/
/* Index: ACT_IDX_HI_ACT_INST_EXEC                              */
/*==============================================================*/
create  index ACT_IDX_HI_ACT_INST_EXEC on act_hi_actinst (
( <IndexExpression_0> )
);

/*==============================================================*/
/* Index: ACT_IDX_HI_ACT_INST_PROCINST                          */
/*==============================================================*/
create  index ACT_IDX_HI_ACT_INST_PROCINST on act_hi_actinst (
( <IndexExpression_0> )
);

/*==============================================================*/
/* Index: ACT_IDX_HI_ACT_INST_START                             */
/*==============================================================*/
create  index ACT_IDX_HI_ACT_INST_START on act_hi_actinst (
START_TIME_
);

/*==============================================================*/
/* Table: act_hi_attachment                                     */
/*==============================================================*/
create table act_hi_attachment (
   ID_                  VARCHAR(64)          not null,
   REV_                 INT4                 null,
   USER_ID_             VARCHAR(255)         null,
   NAME_                VARCHAR(255)         null,
   DESCRIPTION_         VARCHAR(4000)        null,
   TYPE_                VARCHAR(255)         null,
   TASK_ID_             VARCHAR(64)          null,
   PROC_INST_ID_        VARCHAR(64)          null,
   URL_                 VARCHAR(4000)        null,
   CONTENT_ID_          VARCHAR(64)          null,
   constraint PK_act_hi_attachment primary key (ID_)
);

/*==============================================================*/
/* Table: act_hi_comment                                        */
/*==============================================================*/
create table act_hi_comment (
   ID_                  VARCHAR(64)          not null,
   TYPE_                VARCHAR(255)         null,
   TIME_                DATE                 not null,
   USER_ID_             VARCHAR(255)         null,
   TASK_ID_             VARCHAR(64)          null,
   PROC_INST_ID_        VARCHAR(64)          null,
   ACTION_              VARCHAR(255)         null,
   MESSAGE_             VARCHAR(4000)        null,
   FULL_MSG_            CHAR                 null,
   constraint PK_act_hi_comment primary key (ID_)
);

/*==============================================================*/
/* Table: act_hi_detail                                         */
/*==============================================================*/
create table act_hi_detail (
   ID_                  VARCHAR(64)          not null,
   TYPE_                VARCHAR(255)         not null,
   PROC_INST_ID_        VARCHAR(64)          null,
   EXECUTION_ID_        VARCHAR(64)          null,
   TASK_ID_             VARCHAR(64)          null,
   ACT_INST_ID_         VARCHAR(64)          null,
   NAME_                VARCHAR(255)         not null,
   VAR_TYPE_            VARCHAR(255)         null,
   REV_                 INT4                 null,
   TIME_                DATE                 not null,
   BYTEARRAY_ID_        VARCHAR(64)          null,
   DOUBLE_              FLOAT8               null,
   LONG_                INT8                 null,
   TEXT_                VARCHAR(4000)        null,
   TEXT2_               VARCHAR(4000)        null,
   constraint PK_act_hi_detail primary key (ID_)
);

/*==============================================================*/
/* Index: ACT_IDX_HI_DETAIL_ACT_INST                            */
/*==============================================================*/
create  index ACT_IDX_HI_DETAIL_ACT_INST on act_hi_detail (
ACT_INST_ID_
);

/*==============================================================*/
/* Index: ACT_IDX_HI_DETAIL_NAME                                */
/*==============================================================*/
create  index ACT_IDX_HI_DETAIL_NAME on act_hi_detail (
NAME_
);

/*==============================================================*/
/* Index: ACT_IDX_HI_DETAIL_PROC_INST                           */
/*==============================================================*/
create  index ACT_IDX_HI_DETAIL_PROC_INST on act_hi_detail (
PROC_INST_ID_
);

/*==============================================================*/
/* Index: ACT_IDX_HI_DETAIL_TASK_ID                             */
/*==============================================================*/
create  index ACT_IDX_HI_DETAIL_TASK_ID on act_hi_detail (
TASK_ID_
);

/*==============================================================*/
/* Index: ACT_IDX_HI_DETAIL_TIME                                */
/*==============================================================*/
create  index ACT_IDX_HI_DETAIL_TIME on act_hi_detail (
TIME_
);

/*==============================================================*/
/* Table: act_hi_identitylink                                   */
/*==============================================================*/
create table act_hi_identitylink (
   ID_                  VARCHAR(64)          not null,
   GROUP_ID_            VARCHAR(255)         null,
   TYPE_                VARCHAR(255)         null,
   USER_ID_             VARCHAR(255)         null,
   TASK_ID_             VARCHAR(64)          null,
   PROC_INST_ID_        VARCHAR(64)          null,
   constraint PK_act_hi_identitylink primary key (ID_)
);

/*==============================================================*/
/* Index: ACT_IDX_HI_IDENT_LNK_PROCINST                         */
/*==============================================================*/
create  index ACT_IDX_HI_IDENT_LNK_PROCINST on act_hi_identitylink (
PROC_INST_ID_
);

/*==============================================================*/
/* Index: ACT_IDX_HI_IDENT_LNK_TASK                             */
/*==============================================================*/
create  index ACT_IDX_HI_IDENT_LNK_TASK on act_hi_identitylink (
TASK_ID_
);

/*==============================================================*/
/* Index: ACT_IDX_HI_IDENT_LNK_USER                             */
/*==============================================================*/
create  index ACT_IDX_HI_IDENT_LNK_USER on act_hi_identitylink (
USER_ID_
);

/*==============================================================*/
/* Table: act_hi_procinst                                       */
/*==============================================================*/
create table act_hi_procinst (
   ID_                  VARCHAR(64)          not null,
   PROC_INST_ID_        VARCHAR(64)          not null,
   BUSINESS_KEY_        VARCHAR(255)         null,
   PROC_DEF_ID_         VARCHAR(64)          not null,
   START_TIME_          DATE                 not null,
   END_TIME_            DATE                 null,
   DURATION_            INT8                 null,
   START_USER_ID_       VARCHAR(255)         null,
   START_ACT_ID_        VARCHAR(255)         null,
   END_ACT_ID_          VARCHAR(255)         null,
   SUPER_PROCESS_INSTANCE_ID_ VARCHAR(64)          null,
   DELETE_REASON_       VARCHAR(4000)        null,
   constraint PK_act_hi_procinst primary key (ID_),
   constraint ACT_UNIQ_HI_BUS_KEY unique (PROC_DEF_ID_, BUSINESS_KEY_),
   constraint PROC_INST_ID_ unique (PROC_INST_ID_)
);

/*==============================================================*/
/* Index: ACT_IDX_HI_PRO_INST_END                               */
/*==============================================================*/
create  index ACT_IDX_HI_PRO_INST_END on act_hi_procinst (
END_TIME_
);

/*==============================================================*/
/* Index: ACT_IDX_HI_PRO_I_BUSKEY                               */
/*==============================================================*/
create  index ACT_IDX_HI_PRO_I_BUSKEY on act_hi_procinst (
BUSINESS_KEY_
);

/*==============================================================*/
/* Table: act_hi_taskinst                                       */
/*==============================================================*/
create table act_hi_taskinst (
   ID_                  VARCHAR(64)          not null,
   PROC_DEF_ID_         VARCHAR(64)          null,
   TASK_DEF_KEY_        VARCHAR(255)         null,
   PROC_INST_ID_        VARCHAR(64)          null,
   EXECUTION_ID_        VARCHAR(64)          null,
   NAME_                VARCHAR(255)         null,
   PARENT_TASK_ID_      VARCHAR(64)          null,
   DESCRIPTION_         VARCHAR(4000)        null,
   OWNER_               VARCHAR(255)         null,
   ASSIGNEE_            VARCHAR(255)         null,
   START_TIME_          DATE                 not null,
   CLAIM_TIME_          DATE                 null,
   END_TIME_            DATE                 null,
   DURATION_            INT8                 null,
   DELETE_REASON_       VARCHAR(4000)        null,
   PRIORITY_            INT4                 null,
   DUE_DATE_            DATE                 null,
   FORM_KEY_            VARCHAR(255)         null,
   constraint PK_act_hi_taskinst primary key (ID_)
);

/*==============================================================*/
/* Table: act_hi_varinst                                        */
/*==============================================================*/
create table act_hi_varinst (
   ID_                  VARCHAR(64)          not null,
   PROC_INST_ID_        VARCHAR(64)          null,
   EXECUTION_ID_        VARCHAR(64)          null,
   TASK_ID_             VARCHAR(64)          null,
   NAME_                VARCHAR(255)         not null,
   VAR_TYPE_            VARCHAR(100)         null,
   REV_                 INT4                 null,
   BYTEARRAY_ID_        VARCHAR(64)          null,
   DOUBLE_              FLOAT8               null,
   LONG_                INT8                 null,
   TEXT_                VARCHAR(4000)        null,
   TEXT2_               VARCHAR(4000)        null,
   constraint PK_act_hi_varinst primary key (ID_)
);

/*==============================================================*/
/* Index: ACT_IDX_HI_PROCVAR_NAME_TYPE                          */
/*==============================================================*/
create  index ACT_IDX_HI_PROCVAR_NAME_TYPE on act_hi_varinst (
( <IndexExpression_0> )
);

/*==============================================================*/
/* Index: ACT_IDX_HI_PROCVAR_PROC_INST                          */
/*==============================================================*/
create  index ACT_IDX_HI_PROCVAR_PROC_INST on act_hi_varinst (
PROC_INST_ID_
);

/*==============================================================*/
/* Table: act_id_group                                          */
/*==============================================================*/
create table act_id_group (
   ID_                  VARCHAR(255)         null,
   REV_                 CHAR(0)              null,
   NAME_                VARCHAR(255)         null,
   TYPE_                VARCHAR(10)          not null
);

comment on table act_id_group is
'VIEW';

/*==============================================================*/
/* Table: act_id_membership                                     */
/*==============================================================*/
create table act_id_membership (
   USER_ID_             VARCHAR(255)         null,
   GROUP_ID_            VARCHAR(255)         null
);

comment on table act_id_membership is
'VIEW';

/*==============================================================*/
/* Table: act_id_user                                           */
/*==============================================================*/
create table act_id_user (
   ID_                  VARCHAR(255)         not null,
   REV_                 INT4                 not null default 0,
   FIRST_               VARCHAR(255)         null,
   LAST_                CHAR(0)              not null,
   EMAIL_               VARCHAR(255)         null,
   PWD_                 VARCHAR(255)         null,
   PICTURE_ID_          CHAR(0)              not null
);

comment on table act_id_user is
'VIEW';

/*==============================================================*/
/* Table: act_re_deployment                                     */
/*==============================================================*/
create table act_re_deployment (
   ID_                  VARCHAR(64)          not null,
   NAME_                VARCHAR(255)         null,
   CATEGORY_            VARCHAR(255)         null,
   DEPLOY_TIME_         DATE                 not null default CURRENT_TIMESTAMP,
   constraint PK_act_re_deployment primary key (ID_)
);

/*==============================================================*/
/* Table: act_re_model                                          */
/*==============================================================*/
create table act_re_model (
   ID_                  VARCHAR(64)          not null,
   REV_                 INT4                 null,
   NAME_                VARCHAR(255)         null,
   KEY_                 VARCHAR(255)         null,
   CATEGORY_            VARCHAR(255)         null,
   CREATE_TIME_         DATE                 null,
   LAST_UPDATE_TIME_    DATE                 null,
   VERSION_             INT4                 null,
   META_INFO_           VARCHAR(4000)        null,
   DEPLOYMENT_ID_       VARCHAR(64)          null,
   EDITOR_SOURCE_VALUE_ID_ VARCHAR(64)          null,
   EDITOR_SOURCE_EXTRA_VALUE_ID_ VARCHAR(64)          null,
   constraint PK_act_re_model primary key (ID_)
);

/*==============================================================*/
/* Index: ACT_FK_MODEL_DEPLOYMENT                               */
/*==============================================================*/
create  index ACT_FK_MODEL_DEPLOYMENT on act_re_model (
DEPLOYMENT_ID_
);

/*==============================================================*/
/* Index: ACT_FK_MODEL_SOURCE                                   */
/*==============================================================*/
create  index ACT_FK_MODEL_SOURCE on act_re_model (
EDITOR_SOURCE_VALUE_ID_
);

/*==============================================================*/
/* Index: ACT_FK_MODEL_SOURCE_EXTRA                             */
/*==============================================================*/
create  index ACT_FK_MODEL_SOURCE_EXTRA on act_re_model (
EDITOR_SOURCE_EXTRA_VALUE_ID_
);

/*==============================================================*/
/* Table: act_re_procdef                                        */
/*==============================================================*/
create table act_re_procdef (
   ID_                  VARCHAR(64)          not null,
   REV_                 INT4                 null,
   CATEGORY_            VARCHAR(255)         null,
   NAME_                VARCHAR(255)         null,
   KEY_                 VARCHAR(255)         not null,
   VERSION_             INT4                 not null,
   DEPLOYMENT_ID_       VARCHAR(64)          null,
   RESOURCE_NAME_       VARCHAR(4000)        null,
   DGRM_RESOURCE_NAME_  VARCHAR(4000)        null,
   DESCRIPTION_         VARCHAR(4000)        null,
   HAS_START_FORM_KEY_  INT2                 null,
   SUSPENSION_STATE_    INT4                 null,
   constraint PK_act_re_procdef primary key (ID_),
   constraint ACT_UNIQ_PROCDEF unique (KEY_, VERSION_)
);

/*==============================================================*/
/* Table: act_ru_event_subscr                                   */
/*==============================================================*/
create table act_ru_event_subscr (
   ID_                  VARCHAR(64)          not null,
   REV_                 INT4                 null,
   EVENT_TYPE_          VARCHAR(255)         not null,
   EVENT_NAME_          VARCHAR(255)         null,
   EXECUTION_ID_        VARCHAR(64)          null,
   PROC_INST_ID_        VARCHAR(64)          null,
   ACTIVITY_ID_         VARCHAR(64)          null,
   CONFIGURATION_       VARCHAR(255)         null,
   CREATED_             DATE                 not null default CURRENT_TIMESTAMP,
   constraint PK_act_ru_event_subscr primary key (ID_)
);

/*==============================================================*/
/* Index: ACT_FK_EVENT_EXEC                                     */
/*==============================================================*/
create  index ACT_FK_EVENT_EXEC on act_ru_event_subscr (
EXECUTION_ID_
);

/*==============================================================*/
/* Index: ACT_IDX_EVENT_SUBSCR_CONFIG_                          */
/*==============================================================*/
create  index ACT_IDX_EVENT_SUBSCR_CONFIG_ on act_ru_event_subscr (
CONFIGURATION_
);

/*==============================================================*/
/* Table: act_ru_execution                                      */
/*==============================================================*/
create table act_ru_execution (
   ID_                  VARCHAR(64)          not null,
   REV_                 INT4                 null,
   PROC_INST_ID_        VARCHAR(64)          null,
   BUSINESS_KEY_        VARCHAR(255)         null,
   PARENT_ID_           VARCHAR(64)          null,
   PROC_DEF_ID_         VARCHAR(64)          null,
   SUPER_EXEC_          VARCHAR(64)          null,
   ACT_ID_              VARCHAR(255)         null,
   IS_ACTIVE_           INT2                 null,
   IS_CONCURRENT_       INT2                 null,
   IS_SCOPE_            INT2                 null,
   IS_EVENT_SCOPE_      INT2                 null,
   SUSPENSION_STATE_    INT4                 null,
   CACHED_ENT_STATE_    INT4                 null,
   constraint PK_act_ru_execution primary key (ID_),
   constraint ACT_UNIQ_RU_BUS_KEY unique (PROC_DEF_ID_, BUSINESS_KEY_)
);

/*==============================================================*/
/* Index: ACT_FK_EXE_PARENT                                     */
/*==============================================================*/
create  index ACT_FK_EXE_PARENT on act_ru_execution (
PARENT_ID_
);

/*==============================================================*/
/* Index: ACT_FK_EXE_PROCINST                                   */
/*==============================================================*/
create  index ACT_FK_EXE_PROCINST on act_ru_execution (
PROC_INST_ID_
);

/*==============================================================*/
/* Index: ACT_FK_EXE_SUPER                                      */
/*==============================================================*/
create  index ACT_FK_EXE_SUPER on act_ru_execution (
SUPER_EXEC_
);

/*==============================================================*/
/* Index: ACT_IDX_EXEC_BUSKEY                                   */
/*==============================================================*/
create  index ACT_IDX_EXEC_BUSKEY on act_ru_execution (
BUSINESS_KEY_
);

/*==============================================================*/
/* Table: act_ru_identitylink                                   */
/*==============================================================*/
create table act_ru_identitylink (
   ID_                  VARCHAR(64)          not null,
   REV_                 INT4                 null,
   GROUP_ID_            VARCHAR(255)         null,
   TYPE_                VARCHAR(255)         null,
   USER_ID_             VARCHAR(255)         null,
   TASK_ID_             VARCHAR(64)          null,
   PROC_INST_ID_        VARCHAR(64)          null,
   PROC_DEF_ID_         VARCHAR(64)          null,
   constraint PK_act_ru_identitylink primary key (ID_)
);

/*==============================================================*/
/* Index: ACT_FK_IDL_PROCINST                                   */
/*==============================================================*/
create  index ACT_FK_IDL_PROCINST on act_ru_identitylink (
PROC_INST_ID_
);

/*==============================================================*/
/* Index: ACT_FK_TSKASS_TASK                                    */
/*==============================================================*/
create  index ACT_FK_TSKASS_TASK on act_ru_identitylink (
TASK_ID_
);

/*==============================================================*/
/* Index: ACT_IDX_ATHRZ_PROCEDEF                                */
/*==============================================================*/
create  index ACT_IDX_ATHRZ_PROCEDEF on act_ru_identitylink (
PROC_DEF_ID_
);

/*==============================================================*/
/* Index: ACT_IDX_IDENT_LNK_GROUP                               */
/*==============================================================*/
create  index ACT_IDX_IDENT_LNK_GROUP on act_ru_identitylink (
GROUP_ID_
);

/*==============================================================*/
/* Index: ACT_IDX_IDENT_LNK_USER                                */
/*==============================================================*/
create  index ACT_IDX_IDENT_LNK_USER on act_ru_identitylink (
USER_ID_
);

/*==============================================================*/
/* Table: act_ru_job                                            */
/*==============================================================*/
create table act_ru_job (
   ID_                  VARCHAR(64)          not null,
   REV_                 INT4                 null,
   TYPE_                VARCHAR(255)         not null,
   LOCK_EXP_TIME_       DATE                 null,
   LOCK_OWNER_          VARCHAR(255)         null,
   EXCLUSIVE_           INT2                 null,
   EXECUTION_ID_        VARCHAR(64)          null,
   PROCESS_INSTANCE_ID_ VARCHAR(64)          null,
   PROC_DEF_ID_         VARCHAR(64)          null,
   RETRIES_             INT4                 null,
   EXCEPTION_STACK_ID_  VARCHAR(64)          null,
   EXCEPTION_MSG_       VARCHAR(4000)        null,
   DUEDATE_             DATE                 null,
   REPEAT_              VARCHAR(255)         null,
   HANDLER_TYPE_        VARCHAR(255)         null,
   HANDLER_CFG_         VARCHAR(4000)        null,
   constraint PK_act_ru_job primary key (ID_)
);

/*==============================================================*/
/* Index: ACT_FK_JOB_EXCEPTION                                  */
/*==============================================================*/
create  index ACT_FK_JOB_EXCEPTION on act_ru_job (
EXCEPTION_STACK_ID_
);

/*==============================================================*/
/* Table: act_ru_task                                           */
/*==============================================================*/
create table act_ru_task (
   ID_                  VARCHAR(64)          not null,
   REV_                 INT4                 null,
   EXECUTION_ID_        VARCHAR(64)          null,
   PROC_INST_ID_        VARCHAR(64)          null,
   PROC_DEF_ID_         VARCHAR(64)          null,
   NAME_                VARCHAR(255)         null,
   PARENT_TASK_ID_      VARCHAR(64)          null,
   DESCRIPTION_         VARCHAR(4000)        null,
   TASK_DEF_KEY_        VARCHAR(255)         null,
   OWNER_               VARCHAR(255)         null,
   ASSIGNEE_            VARCHAR(255)         null,
   DELEGATION_          VARCHAR(64)          null,
   PRIORITY_            INT4                 null,
   CREATE_TIME_         DATE                 not null default CURRENT_TIMESTAMP,
   DUE_DATE_            DATE                 null,
   SUSPENSION_STATE_    INT4                 null,
   constraint PK_act_ru_task primary key (ID_)
);

/*==============================================================*/
/* Index: ACT_FK_TASK_EXE                                       */
/*==============================================================*/
create  index ACT_FK_TASK_EXE on act_ru_task (
EXECUTION_ID_
);

/*==============================================================*/
/* Index: ACT_FK_TASK_PROCDEF                                   */
/*==============================================================*/
create  index ACT_FK_TASK_PROCDEF on act_ru_task (
PROC_DEF_ID_
);

/*==============================================================*/
/* Index: ACT_FK_TASK_PROCINST                                  */
/*==============================================================*/
create  index ACT_FK_TASK_PROCINST on act_ru_task (
PROC_INST_ID_
);

/*==============================================================*/
/* Index: ACT_IDX_TASK_CREATE                                   */
/*==============================================================*/
create  index ACT_IDX_TASK_CREATE on act_ru_task (
CREATE_TIME_
);

/*==============================================================*/
/* Table: act_ru_variable                                       */
/*==============================================================*/
create table act_ru_variable (
   ID_                  VARCHAR(64)          not null,
   REV_                 INT4                 null,
   TYPE_                VARCHAR(255)         not null,
   NAME_                VARCHAR(255)         not null,
   EXECUTION_ID_        VARCHAR(64)          null,
   PROC_INST_ID_        VARCHAR(64)          null,
   TASK_ID_             VARCHAR(64)          null,
   BYTEARRAY_ID_        VARCHAR(64)          null,
   DOUBLE_              FLOAT8               null,
   LONG_                INT8                 null,
   TEXT_                VARCHAR(4000)        null,
   TEXT2_               VARCHAR(4000)        null,
   constraint PK_act_ru_variable primary key (ID_)
);

/*==============================================================*/
/* Index: ACT_FK_VAR_BYTEARRAY                                  */
/*==============================================================*/
create  index ACT_FK_VAR_BYTEARRAY on act_ru_variable (
BYTEARRAY_ID_
);

/*==============================================================*/
/* Index: ACT_FK_VAR_EXE                                        */
/*==============================================================*/
create  index ACT_FK_VAR_EXE on act_ru_variable (
EXECUTION_ID_
);

/*==============================================================*/
/* Index: ACT_FK_VAR_PROCINST                                   */
/*==============================================================*/
create  index ACT_FK_VAR_PROCINST on act_ru_variable (
PROC_INST_ID_
);

/*==============================================================*/
/* Index: ACT_IDX_VARIABLE_TASK_ID                              */
/*==============================================================*/
create  index ACT_IDX_VARIABLE_TASK_ID on act_ru_variable (
TASK_ID_
);

/*==============================================================*/
/* Table: cms_article                                           */
/*==============================================================*/
create table cms_article (
   id                   SERIAL not null,
   color                VARCHAR(255)         null,
   content              TEXT                 null,
   createDate           DATE                 null,
   description          VARCHAR(255)         null,
   hits                 INT4                 null,
   htmlid               VARCHAR(255)         null,
   image                VARCHAR(255)         null,
   isWord               INT4                 null,
   keywords             VARCHAR(255)         null,
   title                VARCHAR(255)         null,
   weight               INT4                 null,
   CATEGORY_ID          INT8                 null,
   delFlag              INT4                 not null,
   updateDate           DATE                 null,
   createby_id          INT8                 null,
   updateby_id          INT8                 null,
   constraint PK_cms_article primary key (id)
);

/*==============================================================*/
/* Index: FK935C9C00CA4E9944                                    */
/*==============================================================*/
create  index FK935C9C00CA4E9944 on cms_article (
CATEGORY_ID
);

/*==============================================================*/
/* Table: cms_category                                          */
/*==============================================================*/
create table cms_category (
   id                   SERIAL not null,
   description          VARCHAR(255)         null,
   image                VARCHAR(255)         null,
   keywords             VARCHAR(255)         null,
   module               VARCHAR(255)         null,
   name                 VARCHAR(255)         null,
   PARENT_ID            INT8                 null,
   grade                INT4                 not null,
   isShow               INT4                 not null,
   orderNo              INT4                 not null,
   site_id              INT8                 null,
   url                  VARCHAR(255)         null,
   constraint PK_cms_category primary key (id)
);

/*==============================================================*/
/* Index: FK2478CF341EEC3DA4                                    */
/*==============================================================*/
create  index FK2478CF341EEC3DA4 on cms_category (
site_id
);

/*==============================================================*/
/* Index: FK2478CF34EA0C9E18                                    */
/*==============================================================*/
create  index FK2478CF34EA0C9E18 on cms_category (
PARENT_ID
);

/*==============================================================*/
/* Table: cms_comment                                           */
/*==============================================================*/
create table cms_comment (
   id                   SERIAL not null,
   auditDate            DATE                 null,
   content              VARCHAR(255)         null,
   createDate           DATE                 null,
   delFlag              INT4                 not null,
   email                VARCHAR(255)         null,
   ip                   VARCHAR(255)         null,
   name                 VARCHAR(255)         null,
   url                  VARCHAR(255)         null,
   article_id           INT8                 null,
   auditer_id           INT8                 null,
   headPath             VARCHAR(255)         null,
   constraint PK_cms_comment primary key (id)
);

/*==============================================================*/
/* Table: cms_link                                              */
/*==============================================================*/
create table cms_link (
   id                   SERIAL not null,
   color                VARCHAR(255)         null,
   href                 VARCHAR(255)         null,
   image                VARCHAR(255)         null,
   title                VARCHAR(255)         null,
   weight               INT4                 null,
   weightDate           DATE                 null,
   CATEGORY_ID          INT8                 null,
   constraint PK_cms_link primary key (id)
);

/*==============================================================*/
/* Index: FK7BC64D30CA4E9944                                    */
/*==============================================================*/
create  index FK7BC64D30CA4E9944 on cms_link (
CATEGORY_ID
);

/*==============================================================*/
/* Table: cms_site                                              */
/*==============================================================*/
create table cms_site (
   id                   SERIAL not null,
   copyright            VARCHAR(255)         null,
   description          VARCHAR(255)         null,
   keywords             VARCHAR(255)         null,
   logo                 VARCHAR(255)         null,
   name                 VARCHAR(255)         null,
   theme                VARCHAR(255)         null,
   title                VARCHAR(255)         null,
   constraint PK_cms_site primary key (id),
   constraint name_UNIQUE unique (name)
);

/*==============================================================*/
/* Table: etl_job                                               */
/*==============================================================*/
create table etl_job (
   id                   INT8                 not null,
   job_name             VARCHAR(50)          null,
   next_exe_date        DATE                 null,
   cron_trigger         VARCHAR(100)         null,
   status               INT2                 null,
   create_date          DATE                 null,
   update_date          DATE                 null,
   createby_id          INT8                 null,
   updateby_id          INT8                 null,
   remark               VARCHAR(200)         null,
   constraint PK_ETL_JOB primary key (id)
);

comment on table etl_job is
'etl调度任务';

comment on column etl_job.id is
'job_id';

comment on column etl_job.job_name is
'调度名称';

comment on column etl_job.remark is
'备注';

/*==============================================================*/
/* Table: etl_job_log                                           */
/*==============================================================*/
create table etl_job_log (
   id                   INT8                 not null,
   task_id              INT8                 null,
   log_content          TEXT                 null,
   log_time             TIMESTAMP            null,
   createby_id          INT8                 null,
   constraint PK_ETL_JOB_LOG primary key (id)
);

comment on column etl_job_log.id is
'log_id';

/*==============================================================*/
/* Table: etl_param_column                                      */
/*==============================================================*/
create table etl_param_column (
   id                   INT8                 not null,
   task_param_id        INT8                 null,
   task_id              INT8                 null,
   column_name          VARCHAR(50)          null,
   column_value_index   INT4                 null,
   remark               VARCHAR(200)         null,
   constraint PK_ETL_PARAM_COLUMN primary key (id)
);

comment on column etl_param_column.task_param_id is
'参数ID';

/*==============================================================*/
/* Table: etl_plugin                                            */
/*==============================================================*/
create table etl_plugin (
   id                   INT8                 not null,
   plugin_name          VARCHAR(100)         null,
   plugin_type          INT2                 null,
   class_name           VARCHAR(200)         null,
   version              VARCHAR(20)          null,
   target               VARCHAR(50)          null,
   jar_name             VARCHAR(200)         null,
   maxthreadnum         INT4                 null,
   remark               VARCHAR(200)         null,
   constraint PK_ETL_PLUGIN primary key (id)
);

comment on column etl_plugin.id is
'plugin 序号';

comment on column etl_plugin.plugin_name is
'plugin名称';

comment on column etl_plugin.plugin_type is
'plugin类别';

comment on column etl_plugin.jar_name is
'jar名称';

comment on column etl_plugin.remark is
'备注';

/*==============================================================*/
/* Table: etl_plugin_param                                      */
/*==============================================================*/
create table etl_plugin_param (
   id                   INT8                 not null,
   plugin_id            INT8                 not null,
   name                 VARCHAR(50)          null,
   range                VARCHAR(200)         null,
   mandatory            INT2                 null,
   "default"            VARCHAR(200)         null,
   is_column            INT2                 null,
   description          VARCHAR(200)         null,
   constraint PK_ETL_PLUGIN_PARAM primary key (id)
);

comment on column etl_plugin_param.id is
'参数ID';

comment on column etl_plugin_param.plugin_id is
'plugin 序号';

comment on column etl_plugin_param.name is
'名称';

comment on column etl_plugin_param.range is
'范围';

comment on column etl_plugin_param."default" is
'默认值';

comment on column etl_plugin_param.is_column is
'是否字段 0-否 1-是';

comment on column etl_plugin_param.description is
'备注';

/*==============================================================*/
/* Table: etl_task                                              */
/*==============================================================*/
create table etl_task (
   id                   INT8                 not null,
   task_name            VARCHAR(200)         null,
   job_id               INT8                 null,
   plugin_id            INT8                 null,
   create_date          DATE                 null,
   update_date          DATE                 null,
   createby_id          INT8                 null,
   updateby_id          INT8                 null,
   remark               VARCHAR(200)         null,
   constraint PK_ETL_TASK primary key (id)
);

comment on table etl_task is
'ETL任务';

comment on column etl_task.id is
'task_id';

comment on column etl_task.plugin_id is
'plugin 序号';

/*==============================================================*/
/* Table: etl_task_param                                        */
/*==============================================================*/
create table etl_task_param (
   id                   INT8                 not null,
   task_id              INT8                 null,
   plugin_param_id      INT8                 null,
   param_key            VARCHAR(50)          null,
   param_value          VARCHAR(200)         null,
   remark               VARCHAR(200)         null,
   constraint PK_ETL_TASK_PARAM primary key (id)
);

comment on table etl_task_param is
'任务参数值';

comment on column etl_task_param.id is
'参数ID';

comment on column etl_task_param.plugin_param_id is
'参数ID';

/*==============================================================*/
/* Table: meta_case_info                                        */
/*==============================================================*/
create table meta_case_info (
   id                   INT8                 not null,
   case_code            VARCHAR(50)          not null,
   project_id           INT8                 null,
   case_type            INT2                 null,
   check_label          INT2                 null,
   create_date          DATE                 null,
   update_date          DATE                 null,
   createby_id          INT8                 null,
   updateby_id          INT8                 null,
   remark               VARCHAR(200)         null,
   constraint PK_META_CASE_INFO primary key (id)
);

comment on column meta_case_info.id is
'case id';

comment on column meta_case_info.remark is
'备注';

/*==============================================================*/
/* Table: meta_column                                           */
/*==============================================================*/
create table meta_column (
   id                   INT8                 not null,
   table_id             INT8                 null,
   column_name          VARCHAR(100)         null,
   column_pname         VARCHAR(200)         null,
   type                 INT4                 null,
   store                VARCHAR(20)          null,
   doc_values           VARCHAR(20)          null,
   index                VARCHAR(50)          null,
   required             VARCHAR(20)          null,
   format               VARCHAR(100)         null,
   remark               VARCHAR(200)         null,
   constraint PK_META_COLUMN primary key (id)
);

comment on table meta_column is
'字段';

comment on column meta_column.id is
'字段ID';

comment on column meta_column.table_id is
'表格ID';

comment on column meta_column.column_name is
'字段名';

comment on column meta_column.column_pname is
'物理名';

comment on column meta_column.type is
'类别';

comment on column meta_column.store is
'store';

comment on column meta_column.index is
'分词index';

comment on column meta_column.required is
'是否必须';

comment on column meta_column.remark is
'备注';

/*==============================================================*/
/* Table: meta_datasource                                       */
/*==============================================================*/
create table meta_datasource (
   id                   INT8                 not null,
   project_id           INT8                 null,
   driver_class_name    VARCHAR(200)         null,
   jdbc_url             VARCHAR(250)         null,
   jdbc_user            VARCHAR(50)          null,
   jdbc_password        VARCHAR(50)          null,
   db_type              INT4                 null,
   create_date          DATE                 null,
   update_date          DATE                 null,
   createby_id          INT8                 null,
   updateby_id          INT8                 null,
   remark               VARCHAR(200)         null,
   constraint PK_META_DATASOURCE primary key (id)
);

comment on table meta_datasource is
'数据源';

comment on column meta_datasource.id is
'数据源ID';

comment on column meta_datasource.project_id is
'project_id';

comment on column meta_datasource.db_type is
'数据库类别';

comment on column meta_datasource.remark is
'备注';

/*==============================================================*/
/* Table: meta_dbtable                                          */
/*==============================================================*/
create table meta_dbtable (
   id                   INT8                 not null,
   datasource_id        INT8                 null,
   table_name           VARCHAR(100)         null,
   table_pname          VARCHAR(200)         null,
   table_type           INT2                 null,
   remark               VARCHAR(200)         null,
   constraint PK_META_DBTABLE primary key (id)
);

comment on table meta_dbtable is
'表';

comment on column meta_dbtable.id is
'表格ID';

comment on column meta_dbtable.datasource_id is
'数据源ID';

comment on column meta_dbtable.table_pname is
'物理名';

comment on column meta_dbtable.remark is
'备注';

/*==============================================================*/
/* Table: meta_module                                           */
/*==============================================================*/
create table meta_module (
   id                   INT8                 not null,
   datasource_id        INT8                 null,
   package_name         VARCHAR(200)         null,
   create_date          DATE                 null,
   update_date          DATE                 null,
   createby_id          INT8                 null,
   updateby_id          INT8                 null,
   remark               VARCHAR(200)         null,
   constraint PK_META_MODULE primary key (id)
);

comment on column meta_module.id is
'模块编号';

comment on column meta_module.datasource_id is
'数据源ID';

comment on column meta_module.package_name is
'模块名';

comment on column meta_module.remark is
'备注';

/*==============================================================*/
/* Table: meta_module_table                                     */
/*==============================================================*/
create table meta_module_table (
   module_id            INT8                 not null,
   table_id             INT8                 not null,
   constraint PK_META_MODULE_TABLE primary key (module_id, table_id)
);

comment on column meta_module_table.module_id is
'模块编号';

comment on column meta_module_table.table_id is
'表格ID';

/*==============================================================*/
/* Table: meta_poject                                           */
/*==============================================================*/
create table meta_poject (
   id                   INT8                 not null,
   project_code         VARCHAR(50)          not null,
   project_name         VARCHAR(100)         null,
   create_date          DATE                 null,
   update_date          DATE                 null,
   createby_id          INT8                 null,
   updateby_id          INT8                 null,
   remark               VARCHAR(200)         null,
   constraint PK_META_POJECT primary key (id)
);

/*==============================================================*/
/* Table: sys_dict                                              */
/*==============================================================*/
create table sys_dict (
   id                   INT4                 not null,
   code_type            INT4                 null,
   code_value           VARCHAR(200)         null,
   code_name            VARCHAR(200)         null,
   sort_id              INT4                 null,
   remark               VARCHAR(200)         null,
   constraint PK_SYS_DICT primary key (id)
);

comment on table sys_dict is
'数据字典表';

/*==============================================================*/
/* Table: sys_icon                                              */
/*==============================================================*/
create table sys_icon (
   id                   SERIAL not null,
   description          VARCHAR(255)         null,
   mark                 VARCHAR(255)         null,
   type                 VARCHAR(255)         null,
   constraint PK_sys_icon primary key (id),
   constraint mark_UNIQUE unique (mark)
);

/*==============================================================*/
/* Table: sys_log                                               */
/*==============================================================*/
create table sys_log (
   id                   SERIAL not null,
   content              VARCHAR(255)         null,
   operName             VARCHAR(255)         null,
   operTime             DATE                 null,
   result               INT4                 not null,
   userId               INT8                 null,
   ip                   VARCHAR(255)         null,
   constraint PK_sys_log primary key (id)
);

/*==============================================================*/
/* Index: FKC3427A92D8327538                                    */
/*==============================================================*/
create  index FKC3427A92D8327538 on sys_log (
userId
);

/*==============================================================*/
/* Table: sys_muti_lang                                         */
/*==============================================================*/
create table sys_muti_lang (
   id                   VARCHAR(32)          not null,
   lang_key             VARCHAR(50)          not null,
   lang_context         VARCHAR(500)         not null,
   lang_code            VARCHAR(50)          not null,
   constraint PK_t_s_muti_lang primary key (id),
   constraint uniq_langkey_langcode unique (lang_key, lang_code)
);

comment on table sys_muti_lang is
'多国语言字典';

comment on column sys_muti_lang.id is
'主键';

comment on column sys_muti_lang.lang_key is
'语言主键';

comment on column sys_muti_lang.lang_context is
'内容';

comment on column sys_muti_lang.lang_code is
'语言';

/*==============================================================*/
/* Table: sys_res                                               */
/*==============================================================*/
create table sys_res (
   id                   SERIAL not null,
   authorize            VARCHAR(255)         null,
   grade                INT4                 not null,
   icon                 VARCHAR(255)         null,
   name                 VARCHAR(255)         null,
   orderNo              INT4                 not null,
   permsString          VARCHAR(255)         null,
   remark               VARCHAR(255)         null,
   resString            VARCHAR(255)         null,
   PARENT_ID            INT8                 null,
   constraint PK_sys_res primary key (id)
);

/*==============================================================*/
/* Index: FKC3428FEED6C7D0A5                                    */
/*==============================================================*/
create  index FKC3428FEED6C7D0A5 on sys_res (
PARENT_ID
);

/*==============================================================*/
/* Table: sys_role                                              */
/*==============================================================*/
create table sys_role (
   id                   SERIAL not null,
   authorize            VARCHAR(255)         null,
   name                 VARCHAR(255)         null,
   realName             VARCHAR(255)         null,
   remark               VARCHAR(255)         null,
   constraint PK_sys_role primary key (id)
);

/*==============================================================*/
/* Table: sys_role_res                                          */
/*==============================================================*/
create table sys_role_res (
   ROLE_ID              INT8                 not null,
   RES_ID               INT8                 not null,
   constraint PK_sys_role_res primary key (ROLE_ID, RES_ID)
);

/*==============================================================*/
/* Index: FK9A255A8923AE94EF                                    */
/*==============================================================*/
create  index FK9A255A8923AE94EF on sys_role_res (
RES_ID
);

/*==============================================================*/
/* Index: FK9A255A895C176D41                                    */
/*==============================================================*/
create  index FK9A255A895C176D41 on sys_role_res (
ROLE_ID
);

/*==============================================================*/
/* Table: sys_test                                              */
/*==============================================================*/
create table sys_test (
   id                   SERIAL not null,
   aaa                  VARCHAR(255)         null,
   bbb                  VARCHAR(255)         null,
   ccc                  VARCHAR(255)         null,
   ddd                  VARCHAR(255)         null,
   eee                  VARCHAR(255)         null,
   eight                VARCHAR(255)         null,
   fff                  VARCHAR(255)         null,
   five                 VARCHAR(255)         null,
   four                 VARCHAR(255)         null,
   ggg                  VARCHAR(255)         null,
   hhh                  VARCHAR(255)         null,
   iii                  VARCHAR(255)         null,
   jjj                  VARCHAR(255)         null,
   kkk                  VARCHAR(255)         null,
   lll                  VARCHAR(255)         null,
   nine                 VARCHAR(255)         null,
   one                  VARCHAR(255)         null,
   seven                VARCHAR(255)         null,
   six                  VARCHAR(255)         null,
   ten                  VARCHAR(255)         null,
   three                VARCHAR(255)         null,
   tow                  VARCHAR(255)         null,
   constraint PK_sys_test primary key (id)
);

/*==============================================================*/
/* Table: sys_user                                              */
/*==============================================================*/
create table sys_user (
   id                   SERIAL not null,
   address              VARCHAR(255)         null,
   createDate           DATE                 not null,
   email                VARCHAR(255)         null,
   loginId              VARCHAR(255)         not null,
   mobilePhone          VARCHAR(255)         null,
   name                 VARCHAR(255)         null,
   passwd               VARCHAR(255)         null,
   remark               VARCHAR(255)         null,
   status               VARCHAR(255)         not null,
   constraint PK_sys_user primary key (id),
   constraint loginId unique (loginId)
);

/*==============================================================*/
/* Table: sys_user_role                                         */
/*==============================================================*/
create table sys_user_role (
   USER_ID              INT8                 not null,
   ROLE_ID              INT8                 not null,
   constraint PK_sys_user_role primary key (USER_ID, ROLE_ID)
);

/*==============================================================*/
/* Index: FKAABB7D581423121                                     */
/*==============================================================*/
create  index FKAABB7D581423121 on sys_user_role (
USER_ID
);

/*==============================================================*/
/* Index: FKAABB7D585C176D41                                    */
/*==============================================================*/
create  index FKAABB7D585C176D41 on sys_user_role (
ROLE_ID
);

alter table act_ge_bytearray
   add constraint act_ge_bytearray_ibfk_1 foreign key (DEPLOYMENT_ID_)
      references act_re_deployment (ID_);

alter table act_re_model
   add constraint act_re_model_ibfk_1 foreign key (DEPLOYMENT_ID_)
      references act_re_deployment (ID_);

alter table act_re_model
   add constraint act_re_model_ibfk_2 foreign key (EDITOR_SOURCE_VALUE_ID_)
      references act_ge_bytearray (ID_);

alter table act_re_model
   add constraint act_re_model_ibfk_3 foreign key (EDITOR_SOURCE_EXTRA_VALUE_ID_)
      references act_ge_bytearray (ID_);

alter table act_ru_event_subscr
   add constraint act_ru_event_subscr_ibfk_1 foreign key (EXECUTION_ID_)
      references act_ru_execution (ID_);

alter table act_ru_execution
   add constraint act_ru_execution_ibfk_1 foreign key (PARENT_ID_)
      references act_ru_execution (ID_);

alter table act_ru_execution
   add constraint act_ru_execution_ibfk_2 foreign key (PROC_DEF_ID_)
      references act_re_procdef (ID_);

alter table act_ru_execution
   add constraint act_ru_execution_ibfk_3 foreign key (PROC_INST_ID_)
      references act_ru_execution (ID_);

alter table act_ru_execution
   add constraint act_ru_execution_ibfk_4 foreign key (SUPER_EXEC_)
      references act_ru_execution (ID_);

alter table act_ru_identitylink
   add constraint act_ru_identitylink_ibfk_1 foreign key (PROC_DEF_ID_)
      references act_re_procdef (ID_);

alter table act_ru_identitylink
   add constraint act_ru_identitylink_ibfk_2 foreign key (PROC_INST_ID_)
      references act_ru_execution (ID_);

alter table act_ru_identitylink
   add constraint act_ru_identitylink_ibfk_3 foreign key (TASK_ID_)
      references act_ru_task (ID_);

alter table act_ru_job
   add constraint act_ru_job_ibfk_1 foreign key (EXCEPTION_STACK_ID_)
      references act_ge_bytearray (ID_);

alter table act_ru_task
   add constraint act_ru_task_ibfk_1 foreign key (EXECUTION_ID_)
      references act_ru_execution (ID_);

alter table act_ru_task
   add constraint act_ru_task_ibfk_2 foreign key (PROC_DEF_ID_)
      references act_re_procdef (ID_);

alter table act_ru_task
   add constraint act_ru_task_ibfk_3 foreign key (PROC_INST_ID_)
      references act_ru_execution (ID_);

alter table act_ru_variable
   add constraint act_ru_variable_ibfk_1 foreign key (BYTEARRAY_ID_)
      references act_ge_bytearray (ID_);

alter table act_ru_variable
   add constraint act_ru_variable_ibfk_2 foreign key (EXECUTION_ID_)
      references act_ru_execution (ID_);

alter table act_ru_variable
   add constraint act_ru_variable_ibfk_3 foreign key (PROC_INST_ID_)
      references act_ru_execution (ID_);

alter table cms_article
   add constraint FK935C9C00E80591EC foreign key (updateby_id)
      references sys_user (id);

alter table cms_article
   add constraint FK935C9C00ECC85199 foreign key (createby_id)
      references sys_user (id);

alter table cms_article
   add constraint cms_article_ibfk_1 foreign key (CATEGORY_ID)
      references cms_category (id);

alter table cms_category
   add constraint cms_category_ibfk_1 foreign key (site_id)
      references cms_site (id);

alter table cms_category
   add constraint cms_category_ibfk_2 foreign key (PARENT_ID)
      references cms_category (id);

alter table cms_comment
   add constraint FKF7A9BD696F3C6204 foreign key (auditer_id)
      references sys_user (id);

alter table cms_comment
   add constraint FKF7A9BD69C09E6470 foreign key (article_id)
      references cms_article (id);

alter table cms_link
   add constraint cms_link_ibfk_1 foreign key (CATEGORY_ID)
      references cms_category (id);

alter table etl_job_log
   add constraint FK_ETLJOB_JOBLOG foreign key (task_id)
      references etl_task (id)
      on delete restrict on update restrict;

alter table etl_param_column
   add constraint FK_PARACOLUMN_TASK foreign key (task_id)
      references etl_task (id)
      on delete restrict on update restrict;

alter table etl_param_column
   add constraint FK_PARACOLUMN_TASKPARAM foreign key (task_param_id)
      references etl_task_param (id)
      on delete restrict on update restrict;

alter table etl_plugin_param
   add constraint FK_PLUGPARAM_PLUGIN foreign key (plugin_id)
      references etl_plugin (id)
      on delete restrict on update restrict;

alter table etl_task
   add constraint FK_TASK_JOB foreign key (job_id)
      references etl_job (id)
      on delete restrict on update restrict;

alter table etl_task
   add constraint FK_TASK_PLUGIN foreign key (plugin_id)
      references etl_plugin (id)
      on delete restrict on update restrict;

alter table etl_task_param
   add constraint FK_ETLTASK_TASKPARAM foreign key (task_id)
      references etl_task (id)
      on delete restrict on update restrict;

alter table etl_task_param
   add constraint FK_TASKPARAM_PLUGINPARAM foreign key (plugin_param_id)
      references etl_plugin_param (id)
      on delete restrict on update restrict;

alter table meta_case_info
   add constraint FK_CASE_METAPOJECT foreign key (project_id)
      references meta_poject (id)
      on delete restrict on update restrict;

alter table meta_column
   add constraint FK_COLUMN_TABLE foreign key (table_id)
      references meta_dbtable (id)
      on delete restrict on update restrict;

alter table meta_datasource
   add constraint FK_DATASOURCE_POJECT foreign key (project_id)
      references meta_poject (id)
      on delete restrict on update restrict;

alter table meta_dbtable
   add constraint FK_TABLE_DATASOURCE foreign key (datasource_id)
      references meta_datasource (id)
      on delete restrict on update restrict;

alter table meta_module
   add constraint FK_META_MOD_REFERENCE_META_DAT foreign key (datasource_id)
      references meta_datasource (id)
      on delete restrict on update restrict;

alter table meta_module_table
   add constraint FK_MODULETABLE_MODULE foreign key (module_id)
      references meta_module (id)
      on delete restrict on update restrict;

alter table meta_module_table
   add constraint FK_META_MOD_REFERENCE_META_DBT foreign key (table_id)
      references meta_dbtable (id)
      on delete restrict on update restrict;

alter table sys_log
   add constraint sys_log_ibfk_1 foreign key (userId)
      references sys_user (id);

alter table sys_res
   add constraint sys_res_ibfk_1 foreign key (PARENT_ID)
      references sys_res (id);

alter table sys_role_res
   add constraint sys_role_res_ibfk_1 foreign key (RES_ID)
      references sys_res (id);

alter table sys_role_res
   add constraint sys_role_res_ibfk_2 foreign key (ROLE_ID)
      references sys_role (id);

alter table sys_user_role
   add constraint sys_user_role_ibfk_1 foreign key (USER_ID)
      references sys_user (id);

alter table sys_user_role
   add constraint sys_user_role_ibfk_2 foreign key (ROLE_ID)
      references sys_role (id);

