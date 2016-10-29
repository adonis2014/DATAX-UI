package net.iharding.utils;

public class ETLConstants {

	/**
	 *  表前缀定义，用于elasticSearch中unique Key中定义不同表的前缀
	 */
	public static final String UKEY_PREFIX_USER = "01";//用户表
	public static final String UKEY_PREFIX_BILL = "02";//账单表
	
	/**
	 * 需要导入的不同表名定义
	 */
	public static final String HTABLE_USER = "EN_User";//用户表
	public static final String HTABLE_BILL = "EN_BILL";//用户表
	public static final String HTABLE_NGINX_MONTH_LOG = "NGINX_LogUserMonth";//日志月度处理表
	public static final String HTABLE_RPB_ACTIVEUSER_LOG = "RPB_ACTIVEUSER";
	public static final String HTABLE_RPB_SHOPSHEET_LOG = "RPB_SHOPSHEET";


	/**
	 * Hbase rowid和elasticSearch中unquie key需要多字段组合间隔符号
	 */
	public static final String separator = "-";
	
	/**
	 * 时间相关常量-日期格式
	 */
	public static final int GMT_TIME = 8;// 转换为标准时区小时数
	public static final String GMT8 = "GMT+8";// 东八区
	public static final String GMT = "GMT";// 标准时区
	public static final String DATE_ONLY_FORMAT = "yyyy-MM-dd";
	public static final String DATE_FORMAT = "yyyy-MM-dd HH:mm:ss";

	public static final String DATEFORMAT_YYYYMMDD = "yyyyMMdd";
	public static final String DATEFORMAT_YYYYMMDDHHMMSS = "yyyyMMddHHmmss";
	public static final String ZERO_HOUR = "00:00:00";// 零时日期格式
	public static final String DATE_FORMAT_SSS = "yyyy-MM-dd HH:mm:ss.SSS";

	public static final int FIELD_SOURCETYPE_INITVALUE = 0;// 0-原始字段，从ID取值
	public static final int FIELD_SOURCETYPE_THIRD = 1;//1-第三方获取的字段
	public static final int FIELD_SOURCETYPE_AGGS = 2;//1-纯聚合处理字段，无原始数据字段
	
	public static final int FIELD_TYPE_ORI = 0;//原始取值字段
	public static final int FIELD_TYPE_VALUE = 1;// 1-取值字段
	public static final int FIELD_TYPE_PRIMKEY = 2;//2-主键组合字段
	public static final int FIELD_TYPE_SUMMARY = 3;//3-统计聚合字段
	
	/**
	 * 表示无效的值，为-1
	 */
	public static int INVALIDATE_VALUE = -1;
	public static int INVALIDATE_ATTRIBUTION = 999;
	public static final int MAX_ROWS_NUM = 10000;
	public static final int MAX_PAGE_SIZE = 1000;
	
	public static final int MAX_SCROLL_ROWS_NUM = 500000;

	public static final String MSG_SUCCESS = "查询成功";
	public static final String MSG_SAVE_SUCCESS = "执行操作成功";
	public static final String MSG_SUCCESS_EMPTY = "查询不到符合条件的数据！";
	public static final String MSG_SUCCESS_TOO_MANYROWS = "查询到符合条件的数据量大于50w，请修改条件！";

	public static final int RET_SUCCESS = 0;
	public static final int RET_FAIL = -1;
	public static final String MSG_FAIL = "查询失败";



	
	
	// HBase表名声明
		public static final String DEFAULT_COLUMN_FAMILY = "cf";// 默认列族名
		public static final String DEFAULT_COLUMN_DATA = "data";
		public static final String DEFAULT_COLUMN_ROWNUM = "rowNum";
		public static final String DEFAULT_COLUMN_AGGROWNUM = "aggRowNum";
	
	public static final String ENNIU_SYS_TABLE_INCREMENT_ENTITY_CODE = "SYS_TABLE_INCREMENT";//自增长最大值存放表
	public static final String ENNIU_SYSINCREMENT_FIELD_TABNAME = "tabName";
	public static final String ENNIU_SYSINCREMENT_FIELD_DICT = "dict";
	public static final String ENNIU_SYSINCREMENT_FIELD_MAXID = "maxId";


}
