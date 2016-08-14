package com.taobao.datax.plugins.reader.mongodbreader;

public class ParamKey {
	
	 /*
     * @name: host
     * @description: mangodb database's ip address
     * @range:
     * @mandatory: false
     * @default:
     */
	public final static String host = "host";
	/*
     * @name: port
     * @description: mangoDb database's port
     * @range:
     * @mandatory: false
     * @default:27017
     */
	public final static String port = "port";
	
	/*
     * @name: dbname
     * @description: mangoDB database's name
     * @range:
     * @mandatory: false
     * @default:
     */
	public final static String dbname = "dbname";
	/*
     * @name: username
     * @description: mangoDB database's login name
     * @range:
     * @mandatory: false
     * @default:
     */
	public final static String username = "username";
	/*
     * @name: password
     * @description: mangoDB database's login password
     * @range:
     * @mandatory: false
     * @default:
     */
	public final static String password = "password";
	/*
     * @name: collectionName
     * @description: mangoDB database's collection Name
     * @range:
     * @mandatory: true
     * @default:
     */
	public final static String collectionName = "collectionName";

	/*
     * @name: idRange
     * @description: mangoDB database's idRange
     * @range:
     * @mandatory: false
     * @default:
     */
	public final static String idRange="idRange";
	/*
     * @name: dateRange
     * @description: mangoDB database's dateRange,字段名和日期
     * @range: 
     * @mandatory: false
     * @default:lastUpdateTime/{currDate}/-1
     */
	public final static String dateRange="dateRange";

	/*
     * @name: columnNames
     * @description: mangoDB database's columnNames
     * @range:
     * @mandatory: false
     * @default:
     */
	public final static String columnNames="columnNames";
	/*
     * @name: parentColumnId
     * @description: mangoDB database's parentColumnId
     * @range:
     * @mandatory: false
     * @default:
     */
	public final static String parentColumnId="parentColumnId";
	/*
     * @name: childColumnNames
     * @description: mangoDB database's childColumnNames
     * @range:
     * @mandatory: false
     * @default:
     */
	public final static String childColumnNames="childColumnNames";

	 /*
     * @name:concurrency
     * @description:concurrency of the job
     * @range:1-100
     * @mandatory: false
     * @default:1
     */
	public final static String concurrency = "concurrency";

}
