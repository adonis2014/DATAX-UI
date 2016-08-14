package com.taobao.datax.plugins.writer.distinctwriter;

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
	 * @name: read hbase table
	 * @description:read hbase table name
	 * @range:
	 * @mandatory: false
	 * @default: 
	 */
	public final static String readtable = "readtable";
	/*
	 * @name: autoFlush
	 * @description:if autoFlush
	 * @range:
	 * @mandatory: true
	 * @default: false
	 */
	public final static String autoFlush = "autoFlush";
	/*
	 * @name: hbase_conf
	 * @description: where the hbase_conf file is
	 * @range:
	 * @mandatory: true
	 * @default: 
	 */
	public final static String hbase_conf = "hbase_conf";
	/*
	 * @name: encoding
	 * @description: indict the encoding in hbase
	 * @range: UTF-8|GBK
	 * @mandatory: false
	 * @default: UTF-8
	 */
	public final static String encoding = "encoding";
	/*
	 * @name: rowkey
	 * @description: indict which column in src is rowkey
	 * @range: 
	 * @mandatory: false
	 * @default: 
	 */
	public final static String rowkey_index = "rowkey";
	/*
	 * @name: columns_key
	 * @description: indict which CF:qualifier should be write, split by ","
	 * @range: 
	 * @mandatory: false
	 * @default: 
	 */
	public final static String column_name = "columns_key";
	/*
	 * @name: column_value_index
	 * @description: indict which values in src should be read, split by ","
	 * @range: 
	 * @mandatory: false
	 * @default: 
	 */
	public final static String column_value_index = "columns_value";
	
	/*
	 * @name: read_columns_value
	 * @description: read values in src should be read, split by ","
	 * @range: 
	 * @mandatory: false
	 * @default: 
	 */
	public final static String read_columns_value = "read_columns_value";
	
	/*
	 * @name: writer buffer size
	 * @description: writer buffer size, 
	 * @range: [0, 16777216]
	 * @mandatory: false
	 * @default: 16777216
	 */
	public final static String bufferSize = "buffer_size";

	 /*
       * @name:concurrency
       * @description:concurrency of the job
       * @range:1-100
       * @mandatory: false
       * @default:1
       */
	public final static String concurrency = "concurrency";
	/*
     * @name:rowKeyRule
     * @description:rowKeyRule of the job
     * @range:0,1,2
     * @mandatory: false
     * @default:0
     */
	public final static String rowKeyRule = "rowKeyRule";
	
	

}
