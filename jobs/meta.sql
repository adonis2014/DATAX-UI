

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
