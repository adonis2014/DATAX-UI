/**
 * (C) 2010-2011 Alibaba Group Holding Limited.
 *
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License 
 * version 2 as published by the Free Software Foundation. 
 * 
 */


package com.taobao.datax.common.constants;

/**
 * DataX constant configuration.
 * 
 * <p>
 * DATAX_LOCATION : path of DataX<br>
 * ENGINEXML : path of engin's xml.<br>
 * JOBSXML : path of jobs' xml.<br>
 * JOBSXMLDIR : path of concrete job xml.<br>
 * PLUGINSXML : path of plugins' xml.<br>
 * GENJOBXML : path of name's xml.
 * </p>
 * 
 * */
public abstract class Constants {
	public static final String DATAX_LOCATION = System.getProperty("user.dir");
    public static final String ENGINEXML = DATAX_LOCATION + "/conf/engine.xml";
	public static final String JOBSXML = DATAX_LOCATION + "/conf/jobs.xml";
	public static final String JOBSXMLDIR = DATAX_LOCATION + "/jobs/{0}.xml";
    public static final String PLUGINSXML = DATAX_LOCATION + "/conf/plugins.xml";
    public static final String PARAMCONFIG = DATAX_LOCATION
			+ "/conf/ParamsKey.java";
    
    
	public static final int GMT_TIME = 0;// 转换为标准时区小时数
	public static final String GMT8 = "GMT+8";// 东八区
	public static final String GMT = "GMT";// 标准时区
	public static final String DATE_ONLY_FORMAT = "yyyy-MM-dd";
	public static final String DATE_FORMAT = "yyyy-MM-dd HH:mm:ss";

	public static final String DATEFORMAT_YYYYMMDD = "yyyyMMdd";
	public static final String DATEFORMAT_YYYYMMDDHHMMSS = "yyyyMMddHHmmss";
	public static final String ZERO_HOUR = "00:00:00";// 零时日期格式
	public static final String DATE_FORMAT_SSS = "yyyy-MM-dd HH:mm:ss.SSS";

	public static final String separator = "-";

	// HBase表名声明
	public static final String DEFAULT_COLUMN_FAMILY = "cf";// 默认列族名
	public static final String ENNIU_SYS_TABLE_INCREMENT_ENTITY_CODE = "SYS_TABLE_INCREMENT";//自增长最大值存放表
	public static final String ENNIU_SYSINCREMENT_FIELD_TABNAME = "tabName";
	public static final String ENNIU_SYSINCREMENT_FIELD_DICT = "dict";
	public static final String ENNIU_SYSINCREMENT_FIELD_MAXID = "maxId";
	

	public static final String DEFAULT_COLUMN_ROWNUM = "rowNum";
	public static final String DEFAULT_COLUMN_AGGROWNUM = "aggRowNum";

	public static final int RET_SUCCESS = 0;
	public static final int RET_FAIL = -1;
	
}