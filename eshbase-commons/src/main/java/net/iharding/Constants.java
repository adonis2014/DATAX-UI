package net.iharding;

public class Constants {
	
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

	/**
	 * 时间相关常量-日期格式
	 */
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

	public static final int STATUS_RUNNING = 2;// 操作开始
	public static final int STATUS_PENDING = 1; // 操作尚未开始
	public static final int STATUS_OK = 3; // 操作正常结束
	public static final int STATUS_WARN = 4; // 有警告，但是正常结束
	public static final int STATUS_ERROR = 5; // 有错误，但是完整结束
	public static final int STATUS_FAIL = 6; // 操作失败


	public static final int DBMS_TYPE_ORACLE = 1;//oracle
	public static final int DBMS_TYPE_MSSQL = 2;//MS Sql Server
	public static final int DBMS_TYPE_MYSQL = 3;//mysql
	public static final int DBMS_TYPE_POSTGRESQL = 4;//postgresql db
	public static final int DBMS_TYPE_HBASE = 5;//hbase db
	
	public static final int ES_REQUEST_TYPE_SEARCH = 1;//select 查询
	public static final int ES_REQUEST_TYPE_SEARCH_GROUP = 2;//select 查询 group by
	public static final int ES_REQUEST_TYPE_CREATE_TABLE = 3;//create table
	public static final int ES_REQUEST_TYPE_CREATE_INDEX = 4;//create index
	public static final int ES_REQUEST_TYPE_DELETE_TABLE = 5;//delete table
	public static final int ES_REQUEST_TYPE_DELETE_INDEX = 6;//delete index

	public static final String SYS_TABLE_INCREMENT_ENTITY_CODE = "SYS_TABLE_INCREMENT";//自增长最大值存放表
	public static final String SYSINCREMENT_FIELD_TABNAME = "tabName";
	public static final String SYSINCREMENT_FIELD_DICT = "dict";
	public static final String SYSINCREMENT_FIELD_MAXID = "maxId";
	
	public static final String DEFAULT_COLUMN_FAMILY = "cf";// 默认列族名
	public static final String DEFAULT_COLUMN_DATA = "data";
	public static final String DEFAULT_COLUMN_ROWNUM = "rowNum";
	public static final String DEFAULT_COLUMN_AGGROWNUM = "aggRowNum";
	
	//请求类型
	public static final int REQUESTTYPE_ELASTICSEARCH_SEARCH = 1;
	public static final int REQUESTTYPE_HBASE_SCAN = 2;
	public static final int REQUESTTYPE_PHOEINX_SEARCH = 3;
	//索引类别
	public static final int INDEX_TYPE_ELASTICSEARCH = 1;
	public static final int INDEX_TYPE_SOLR = 2;
	public static final int INDEX_TYPE_HBASESECOND = 3;
	
}
