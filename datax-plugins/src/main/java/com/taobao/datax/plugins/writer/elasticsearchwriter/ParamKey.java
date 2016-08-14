package com.taobao.datax.plugins.writer.elasticsearchwriter;

public class ParamKey {
	
	

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
	 * @name: parent
	 * @description:parent 所对应列值
	 * @range:
	 * @mandatory: false
	 * @default:1
	 */
	public final static String parent = "parent";
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
	 * @name: delMode
	 * @description:删除模式；由用户进行选择，0 写入前不删除，覆盖文件 1 上传数据之前truncate原type;2 上传数据之前delete原type
	 * @range:[0-2]  
	 * @mandatory: false
	 * @default:1
	 */
	public final static String delMode = "del_mode";
	
	/*
	 * @name: cloumns name
	 * @description: indict which elasticsearch field should be write, split by ","
	 * @range: 
	 * @mandatory: true
	 * @default: 
	 */
	public final static String column_name = "columns_key";
	/*
	 * @name: column_value_index
	 * @description: indict which values in src should be read, split by ","
	 * @range: 
	 * @mandatory: true
	 * @default: 
	 */
	public final static String column_value_index = "columns_value";
	
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

	 /*
     * @name:rowKeyRule
     * @description:uniquekey Rule of the row
     * @range:1-4
     * @mandatory: false
     * @default:1
     */
	public static String rowKeyRule="rowKeyRule";
	
	 /*
     * @name:routing
     * @description:routing  of the row
     * @range:1-4
     * @mandatory: false
     * @default:1
     */
	public static String routing="routing";
	 /*
     * @name:isHotStableSplit
     * @description:isHotStableSplit
     * @range:0-1
     * @mandatory: false
     * @default:0
     */
	public static String isHotStableSplit="isHotStableSplit";
	
	 /*
     * @name:shield_user
     * @description:shield_user
     * @range:
     * @mandatory: false
     * @default:
     */
	public static String shield_user="shield_user";
	
	 /*
     * @name:shield_password
     * @description:shield_password
     * @range:
     * @mandatory: false
     * @default:
     */
	public static String shield_password="shield_password";
	/*
     * @name:ignoreEmptyRowId
     * @description:if ignore empty rowid
     * @range:true,false
     * @mandatory: false
     * @default:true
     */
	public static String ignoreEmptyRowId="ignoreEmptyRowId";

	/*
     * @name:isJob
     * @description:是否固定调度任务
     * @range:0-1
     * @mandatory: false
     * @default:0
     */
	public final static String isJob = "isJob";
	
	/*
     * @name:days
     * @description:几天内数据目录导入调度
     * @range:-1- -100
     * @mandatory: false
     * @default:-1
     */
	public final static String days = "days";
	
	/*
     * @name:format
     * @description:日期格式
     * @mandatory: false
     * @default:yyyy-MM-dd
     */
	public final static String format = "format";
	

	/*
     * @name:lineProcessClass
     * @description:写入之前行数据处理类
     * @mandatory: false
     * @default: com.
     */
	public final static String lineProcessClass = "lineProcessClass";
	
	/*
     * @name:isUpdate
     * @description:是否更新索引文档，如果是更新，将读取原es document后更新部分属性
     * @mandatory: false
     * @default:false
     */
	public final static String isUpdate = "isUpdate";
	
	
}
