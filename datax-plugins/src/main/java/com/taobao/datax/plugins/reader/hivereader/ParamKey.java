package com.taobao.datax.plugins.reader.hivereader;

public final class ParamKey {
		 /*
	       * @name: ip
	       * @description: Hive database's ip address
	       * @range:
	       * @mandatory: true
	       * @default:
	       */
		public final static String ip = "ip";
		/*
	       * @name: port
	       * @description: Hive database's port
	       * @range:
	       * @mandatory: true
	       * @default:3306
	       */
		public final static String port = "port";
		/*
	       * @name: dbname
	       * @description: Hive database's name
	       * @range:
	       * @mandatory: true
	       * @default:
	       */
		public final static String dbname = "dbname";
		/*
	       * @name: username
	       * @description: Hive database's login name
	       * @range:
	       * @mandatory: true
	       * @default:
	       */
		public final static String username = "username";
		/*
	       * @name: password
	       * @description: Hive database's login password
	       * @range:
	       * @mandatory: true
	       * @default:
	       */
		public final static String password = "password";
		/*
	       * @name: tables
	       * @description: tables to export data, format can support simple regex, table[0-63]
	       * @range: 
	       * @mandatory: true
	       * @default: 
	       */
		public final static String tables = "tables";
		/*
	       * @name: where
	       * @description: where clause, like 'modified_time > sysdate'
	       * @range: 
	       * @mandatory: false
	       * @default: 
	       */
		public final static String where = "where";
		/*
	       * @name: sql
	       * @description: self-defined sql statement
	       * @range: 
	       * @mandatory: false
	       * @default: 
	       */
		public final static String sql = "sql";
		/*
	       * @name: metaSql
	       * @description: get meta data sql statement
	       * @range: 
	       * @mandatory: false
	       * @default: 
	       */
		public final static String metaSql = "metaSql";
		
		/*
	       * @name: days
	       * @description: days T+n days
	       * @range: -1 -  -10000
	       * @mandatory: false
	       * @default: 
	       */
		public final static String days = "days";
		
		/*
	       * @name: isVelocity
	       * @description: sql is velocity template or no
	       * @range: 
	       * @mandatory: false
	       * @default: 
	       */
		public final static String isVelocity = "isVelocity";
		/*
	       * @name: columns
	       * @description: columns to be selected, default is *
	       * @range: 
	       * @mandatory: false
	       * @default: *
	       */
		public final static String columns = "columns";
		/*
	       * @name: encoding
	       * @description: Hive database's encode
	       * @range: UTF-8|GBK|GB2312
	       * @mandatory: false
	       * @default: UTF-8
	       */
		public final static String encoding = "encoding";
		
       /*
	       * @name: Hive.params
	       * @description: Hive driver params, starts with no &, e.g. loginTimeOut=3000&yearIsDateType=false
	       * @range: 
	       * @mandatory: false
	       * @default:
	       */
		public final static String hiveParams = "hive.params";
		
		 /*
	       * @name: concurrency
	       * @description: concurrency of the job
	       * @range: 1-10
	       * @mandatory: false
	       * @default: 1
	       */
		public final static String concurrency = "concurrency";
		 /*
	       * @name: fetchSize
	       * @description: fetchSize of the resultset
	       * @range: 100-100000
	       * @mandatory: false
	       * @default: 4096
	       */
		public static String fetchSize="fetchSize";
}
