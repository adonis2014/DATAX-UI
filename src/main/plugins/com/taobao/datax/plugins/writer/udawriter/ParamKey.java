package com.taobao.datax.plugins.writer.udawriter;

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
	 * @name: encoding
	 * @description: indict the encoding in hbase
	 * @range: UTF-8|GBK
	 * @mandatory: false
	 * @default: UTF-8
	 */
	public final static String encoding = "encoding";
	
	/*
	 * @name: columns_json
	 * @description: column define by a json file,this is the path
	 * @range: 
	 * @mandatory: false
	 * @default: 
	 */
	public final static String columns_json = "columns_json";
	
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
	 * @name: number_of_shards
	 * @description:elasticsearch number_of_shards 
	 * @range:
	 * @mandatory: false
	 * @default: 20
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
	 * @name: mapping_xml
	 * @description:elasticsearch mapping xml for current type
	 * @range:
	 * @mandatory: false
	 * @default: 
	 */
	public final static String mapping_xml="mapping_xml";
	
	 /*
     * @name:concurrency
     * @description:concurrency of the job
     * @range:1-100
     * @mandatory: false
     * @default:1
     */
	public final static String concurrency = "concurrency";
	/*
     * @name:deleteRange
     * @description:deleteRange of the table
     * @range:
     * @mandatory: false
     * @default:
     */
	public final static String deleteRange="deleteRange";

}

