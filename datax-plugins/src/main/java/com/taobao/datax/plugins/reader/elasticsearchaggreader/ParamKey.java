package com.taobao.datax.plugins.reader.elasticsearchaggreader;

public final class ParamKey {

	/*
	 * @name: clustername
	 * 
	 * @description:elasticsearch cluster name
	 * 
	 * @range:
	 * 
	 * @mandatory: true
	 * 
	 * @default: enniu-data
	 */
	public final static String clustername = "clustername";

	/*
	 * @name: clustername
	 * 
	 * @description:elasticsearch cluster name
	 * 
	 * @range:
	 * 
	 * @mandatory: true
	 * 
	 * @default: 127.0.0.1:9300
	 */
	public final static String hosts = "hosts";
	/*
	 * @name: indexname
	 * 
	 * @description:elasticsearch index name
	 * 
	 * @range:
	 * 
	 * @mandatory: true
	 * 
	 * @default: enuser
	 */
	public final static String indexname = "indexname";
	/*
	 * @name: typename
	 * 
	 * @description:elasticsearch type name
	 * 
	 * @range:
	 * 
	 * @mandatory: true
	 * 
	 * @default: user
	 */
	public final static String typename = "typename";
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
	 * @name: days
	 * 
	 * @description: days T+n days
	 * 
	 * @range: -1 - -10000
	 * 
	 * @mandatory: false
	 * 
	 * @default:
	 */
	public final static String days = "days";
	/*
	 * @name: columns
	 * 
	 * @description: columns to be selected, default is *
	 * 
	 * @range:
	 * 
	 * @mandatory: false
	 * 
	 * @default: *
	 */
	public final static String columns = "columns";
	/*
	 * @name: queryString
	 * 
	 * @description: es queryString
	 * 
	 * @range:
	 * 
	 * @mandatory: false
	 * 
	 * @default:
	 */
	public final static String queryString = "queryString";

	/*
	 * @name:concurrency
	 * 
	 * @description:concurrency of the job
	 * 
	 * @range:1-100
	 * 
	 * @mandatory: false
	 * 
	 * @default:1
	 */
	public final static String concurrency = "concurrency";
}
