package net.iharding.utils;

import java.io.IOException;
import java.util.Properties;
/**
 * 获取属性文件配置信息
 * @author admin
 *
 */
public class PropertyUtils {

	private static Properties hbaseQueryProp=new Properties();
	private static String esClusterName_key="elasticsearch.cluster.name";
	private static String esUserIndex_hosts="elasticsearch.hosts";
	private static String userFigureHtable_key="userfigure.htable";
	
	static{
		try {
			hbaseQueryProp.load(PropertyUtils.class.getResourceAsStream("/hbase-query.properties"));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public static String getUserFigureTableName() {
		return (String)hbaseQueryProp.get(userFigureHtable_key);
	}
	
	public static String getValue(String key){
		return (String)hbaseQueryProp.get(key);
	}
	
	public static String getElasticSearchClusterName(){
		return (String)hbaseQueryProp.get(esClusterName_key);
	}
	
	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}

	public static String getUserIndexHosts() {
		return (String)hbaseQueryProp.get(esUserIndex_hosts);
	}


}
