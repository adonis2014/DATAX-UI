package com.taobao.datax.plugins.reader.hbasereader;

public class ParamKey {

	/*
	 * @name: htable
	 * @description:hbase table name
	 * @range:
	 * @mandatory: true
	 * @default: 
	 */
	public final static String htable = "htable";
	/*
	 * @name: hbase_conf
	 * @description: where the hbase_conf file is
	 * @range:
	 * @mandatory: true
	 * @default: 
	 */
	public final static String hbase_conf = "hbase_conf";
	/*
	 * @name: maxVersion
	 * @description: where the maxVersion file is
	 * @range:
	 * @mandatory: false
	 * @default: 
	 */
	public final static String maxVersion = "maxVersion";
	
	/*
     * @name:columnProcRule
     * @description:columnProcRule
     * @range:
     * @mandatory: false
     * @default:1:8:1:10/2:4:1：10
     */
	public final static String columnProcRule = "columnProcRule";
	
	/*
	 * @name: hadoop_conf
	 * @description: where the hadoop_conf file is
	 * @range:
	 * @mandatory: true
	 * @default: 
	 */
	public final static String hadoop_conf = "hadoop_conf";
	/*
	 * @name: encoding
	 * @description: indict the encoding in hbase
	 * @range: UTF-8|GBK
	 * @mandatory: false
	 * @default: UTF-8
	 */
	public final static String encoding = "encoding";

	/*
	 * @name: columns_key
	 * @description: indict which CF:qualifier should be write, split by ","
	 * @range: 
	 * @mandatory: false
	 * @default: 
	 */
	public final static String columns_key = "columns_key";
	
	/*
	 * @name: column_value_version
	 * @description: indict which values in src should be read, split by "," 1 最老版本，0最新版本
	 * @range: 
	 * @mandatory: false
	 * @default: 
	 */
	public final static String column_value_version = "column_value_version";
	
	/*
	 * @name: rowkey_range
	 * @description: range of  rowkey
	 * @range: 
	 * @mandatory: false
	 * @default: 
	 */
	public final static String rowkey_range="rowkey_range";
	
	/*
     * @name: dateRange
     * @description: hbase database's dateRange,字段名和日期
     * @range: 
     * @mandatory: false
     * @default: cf/lastUpdateTime/{currDate}/-1
     */
	public final static String dateRange="dateRange";
	 /*		
       * @name:concurrency
       * @description:concurrency of the job
       * @range:1-100
       * @mandatory: false
       * @default:1
       */
	public final static String concurrency = "concurrency";
	
	 /*
     * @name:isSaveOneObj 
     * @description:是否分拆合并保存的字段
     * @range:true,false
     * @mandatory: false
     * @default:true
     */
	public final static String isSaveOneObj = "isSaveOneObj";
	
	/*
     * @name:oneObjColName 
     * @description:合并保存的字段名
     * @mandatory: false
     * @default:data
     */
	public final static String oneObjColName = "oneObjColName";
	
	/*
     * @name:oneObjName
     * @description:合并保存的字段对应对象 EN_User-用户表
     * @mandatory: false
     * @default:EN_User
     */
	public final static String oneObjName = "oneObjName";
	/*
     * @name:oneObjColumnNames
     * @description:需要分拆保存的字段名集合
     * @mandatory: false
     * @default:
     */
	public final static String oneObjColumnNames = "oneObjColumnNames";
	/*
     * @name:oneObjFamilyName
     * @description:需要合并保存的列族名
     * @mandatory: false
     * @default:cf
     */
	public final static String oneObjFamilyName="oneObjFamilyName";
	/*
	 * @name: timestamp_range
	 * @description: range of  timestamp
	 * @range: 
	 * @mandatory: false
	 * @default: 
	 */
	public final static  String timestamp_range = "timestamp_range";
	/*
	 * @name: primarykey
	 * @description: timestamp时使用的主键，减少读取数据
	 * @range: 
	 * @mandatory: false
	 * @default: cf:USERID
	 */
	public final static  String primarykey = "primarykey";
	/*
	 * @name: userLineProcess
	 * @description: range of  userLineProcess
	 * @range: 
	 * @mandatory: false
	 * @default: com.taobao.datax.plugins.reader.enhbasereader.UserLineProcessReader
	 */
	public final static  String userLineProcess = "userLineProcess";
	/*
	 * @name: readAllField
	 * @description: 是否重新读取所有定义的字段，跟Timestamp_range字段对应，防止丢失不在范围内字段
	 * @range: 
	 * @mandatory: false
	 * @default: false
	 */
	public final static  String readAllField = "readAllField";
	
	

}
