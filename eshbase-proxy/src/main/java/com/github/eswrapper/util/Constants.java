package com.github.eswrapper.util;

public class Constants {
	/**
	 * 表示无效的值，为-1
	 */
	public static int INVALIDATE_VALUE = -1;
	public static int INVALIDATE_ATTRIBUTION = 999;
	public static final int MAX_ROWS_NUM = 1000;
	public static final int MAX_PAGE_SIZE = 200;

	public static final int MAX_SCROLL_ROWS_NUM = 200000;

	public static final String MSG_SUCCESS = "查询成功";
	public static final String MSG_RUNNING = "查询中...";

	public static final String MSG_SAVE_SUCCESS = "执行操作成功";
	public static final String MSG_SUCCESS_EMPTY = "查询不到符合条件的数据！";
	public static final String MSG_SUCCESS_TOO_MANYROWS = "查询到符合条件的数据量大于50w，请修改条件！";

	public static final int RET_SUCCESS = 0;
	public static final int RET_FAIL = -1;
	public static final String MSG_FAIL = "查询失败";

	public static final int STATUS_RUNNING = 2;// 操作开始
	public static final int STATUS_PENDING = 1; // 操作尚未开始
	public static final int STATUS_OK = 3; // 操作正常结束
	public static final int STATUS_WARN = 4; // 有警告，但是正常结束
	public static final int STATUS_ERROR = 5; // 有错误，但是完整结束
	public static final int STATUS_FAIL = 6; // 操作失败

	// 来自缓存
	public static final int FROM_CACHE_NO = 0;// 无cache
	public static final int FROM_CACHE_ID = 1;// 来自ehcache的taskID区块
	public static final int FROM_CACHE_SQL = 2; // 来自ehcache的SQL区块

	/**
	 * 读写分离时需要添加的参数
	 */
	public static final String ES_READ_PREF = "preference=_replica_first";

	public static final String ES_CLUSTERNAME_DEFAULT = "vdata";
	
	public static final String ES_SHIELD_USER = "shield_user";

	public static final String ES_SHIELD_PASSWORD = "shield_password";

	public static final String ES_SHIELD_HTTPNODES = "httpNodes";

	public static final String ES_SHIELD_TRANSPORTNODES = "transportNodes";

	public static final String ES_SHIELD_CLUSTERNAME = "clustername";

	public static final String ES_SHIELD_SEARCHCONCURRENTCOUNT = "searchConcurrentCount";

	public static final String ES_SHIELD_WRITECONCURRENTCOUNT = "writeConcurrentCount";

	public static final String ES_SHIELD_SEARCHBUFFERSIZE = "searchBufferSize";

	public static final String ES_SHIELD_WRITERBUFFERSIZE = "writeBufferSize";

	public static final String ES_SHIELD_BALANCETYPE = "balanceType";

	public static final String ES_SHIELD_RETRIES = "retries";

	public static final String ES_SHIELD_SYNCWRAPPER = "syncWrapper";
	// 读写分离参数
	public static final String ES_HOTSTABLE_SPLIT_PARAM = "preference";

	public static final String ES_HOTSTABLE_SPLIT_READVALUE = "_replica_first";

	public static final String ES_HOTSTABLE_SPLIT_WRITEVALUE = "_primary_first";

}
