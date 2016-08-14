package com.taobao.datax.plugins.reader.hdfsreader;

public final class ParamKey {
	/*
	 * @name: ugi
	 * @description: HDFS login account, e.g. 'username, groupname(groupname...),#password
	 * @range:
	 * @mandatory: true
	 * @default:
	 */
	public final static String ugi = "hadoop.job.ugi";
	
	/*
	 * @name: hadoop_conf
	 * @description: hadoop-site.xml path
	 * @range:
	 * @mandatory: false
	 * @default:
	 */
	public final static String hadoop_conf = "hadoop_conf";
	
	/*
	 * @name: dir
	 * @description: hdfs path, format like: hdfs://ip:port/path, or file:///home/taobao/
	 * @range:
	 * @mandatory: true 
	 * @default:
	 */
	public final static String dir = "dir";
	
	
	/*
	 * @name: fileType
	 * @description: filetype of hdfs
	 * @range:
	 * @mandatory: false 
	 * @default:
	 */
	public final static String fileType = "fileType";
	/*
	 * @name: fieldSplit
	 * @description: how to sperate a line
	 * @range:
	 * @mandatory: false 
	 * @default:\t
	 */
	public final static String fieldSplit = "field_split";
	/*
	 * @name: encoding 
	 * @description: hdfs encode
	 * @range:UTF-8|GBK|GB2312
	 * @mandatory: false 
	 * @default:UTF-8
	 */
	public final static String encoding = "encoding";
	/*
	 * @name: bufferSize
	 * @description: how large the buffer
	 * @range: [1024-4194304]
	 * @mandatory: false 
	 * @default: 4096
	 */
	public final static String bufferSize = "buffer_size";

	/*
       * @name: nullString
       * @description: replace the nullstring to null
       * @range: 
       * @mandatory: false
       * @default: \N
       */
	public final static String nullString = "nullstring";
	/*
	 * @name: ignoreKey
	 * @description: ingore key
	 * @range: true|false
	 * @mandatory: false 
	 * @default: true
	 */		
	public final static String ignoreKey = "ignore_key";
	/*
	 * @name: colFilter
	 * @description: how to filter column
	 * @range: 
	 * @mandatory: false 
	 * @default: 
	 */		
	public final static String colFilter = "col_filter";

	 /*
       * @name:concurrency
       * @description:concurrency of the job
       * @range:1-100
       * @mandatory: false
       * @default:1
       */
	public final static String concurrency = "concurrency";
	
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
     * @name:路径作为字段输出
     * @description:路径作为字段输出
     * @mandatory: false
     * @default:
     */
	public final static String pathField = "pathField";
	
	/*
     * @name:扩展字段获取，比如获取其他表的join数据或者当前时间等
     * @description:
     * @mandatory: false
     * @default:
     */
	public final static String extendValueClass = "extendValueClass";
}

