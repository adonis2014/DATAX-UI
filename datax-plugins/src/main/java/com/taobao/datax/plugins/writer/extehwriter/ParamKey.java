package com.taobao.datax.plugins.writer.extehwriter;

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
	 * @name: exthtable
	 * @description: 在原hbase user 表中找不到的用户存放的table name
	 * @range:
	 * @mandatory: true
	 * @default: 
	 */
	public final static String exthtable = "exthtable";
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
	 * @name: delMode
	 * @description:删除模式；由用户进行选择，0 写入前不删除，覆盖文件 1 上传数据之前truncate原表;2 上传数据之前delete原表
	 * @range:[0-2]  
	 * @mandatory: false
	 * @default:1
	 */
	public final static String delMode = "del_mode";
	
	/*
	 * @name: writer buffer size
	 * @description: writer buffer size, 
	 * @range: [0, 16777216]
	 * @mandatory: false
	 * @default: 16777216
	 */
	public final static String bufferSize = "buffer_size";

	
	/*
     * @name:rowKeyRule
     * @description:rowKeyRule of the job
     * @range:0,1,2
     * @mandatory: false
     * @default:0
     */
	public final static String rowKeyRule = "rowKeyRule";
	
	
	/*
	 * @name: clustername
	 * @description:elasticsearch cluster name
	 * @range:
	 * @mandatory: true
	 * @default: enniu-data
	 */
	public final static String clustername = "clustername";
	
	/*
	 * @name: clustername
	 * @description:elasticsearch cluster name
	 * @range:
	 * @mandatory: true
	 * @default: 127.0.0.1:9300
	 */
	public final static String hosts = "hosts";
	/*
	 * @name: indexname
	 * @description:elasticsearch index name
	 * @range:
	 * @mandatory: true
	 * @default: enuser
	 */
	public final static String indexname="indexname";
	
	/*
	 * @name: extindexname
	 * @description:elasticsearch ext index name
	 * @range:
	 * @mandatory: true
	 * @default: enuser
	 */
	public final static String extindexname="extindexname";
	
	/*
	 * @name: number_of_shards
	 * @description:elasticsearch number_of_shards 
	 * @range:
	 * @mandatory: false
	 * @default: 5
	 */
	public final static String number_of_shards="number_of_shards";
	
	/*
	 * @name: number_of_replicas
	 * @description:elasticsearch number_of_replicas 
	 * @range:1-10
	 * @mandatory: false
	 * @default: 1
	 */
	public final static String number_of_replicas="number_of_replicas";
	/*
	 * @name: typename
	 * @description:elasticsearch type name
	 * @range:
	 * @mandatory: true
	 * @default: user
	 */
	public final static String typename="typename";
	
	/*
	 * @name: exttypename
	 * @description:elasticsearch type name
	 * @range:
	 * @mandatory: true
	 * @default: user
	 */
	public final static String exttypename="exttypename";
	/*
	 * @name: uniquekey
	 * @description:elasticsearch unique 字段 _id 采用的来源数据的id顺序号，默认为空，由es生成
	 * @range:
	 * @mandatory: true
	 * @default: 
	 */
	public final static String uniquekey="uniquekey";

	/*
	 * @name: mapping_xml
	 * @description:elasticsearch mapping xml for current type
	 * @range:
	 * @mandatory: false
	 * @default: 
	 */
	public final static String mapping_xml="mapping_xml";
	/*
	 * @name: bulksize
	 * @description:elasticsearch buik request size
	 * @range:
	 * @mandatory: true
	 * @default: 2000
	 */
	public final static String bulksize="bulksize";
	
	/* 
	 * @name: esDelMode
	 * @description:删除模式；由用户进行选择，0 写入前不删除，覆盖文件 1 上传数据之前truncate原type;2 上传数据之前delete原type
	 * @range:[0-2]  
	 * @mandatory: false
	 * @default:1
	 */
	public final static String es_delMode = "es_del_mode";
	
	/*
	 * @name: cloumns name
	 * @description: indict which elasticsearch field should be write, split by ","
	 * @range: 
	 * @mandatory: true
	 * @default: 
	 */
	public final static String es_column_name = "es_columns_key";
	/*
	 * @name: column_value_index
	 * @description: indict which values in src should be read, split by ","
	 * @range: 
	 * @mandatory: true
	 * @default: 
	 */
	public final static String es_column_value_index = "es_columns_value";
	
	/*
	 * @name: column_escape_index
	 * @description: indict which values in src should be escape, split by ","
	 * @range: 
	 * @mandatory: false
	 * @default: 
	 */
	public final static String column_escape_index = "column_escape_index";
	 /*
     * @name:concurrency
     * @description:concurrency of the job
     * @range:1-100
     * @mandatory: false
     * @default:1
     */
	public final static String concurrency = "concurrency";


}
