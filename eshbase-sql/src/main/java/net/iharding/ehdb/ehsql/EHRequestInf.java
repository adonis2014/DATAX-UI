package net.iharding.ehdb.ehsql;

/**
 * hbase +ElasticSearch请求接口
 * 
 * @author zhangxuhui
 * @mail joezxh@qq.com
 * 
 */
public interface EHRequestInf {

	

	/**
	 * 获取执行需要的语句，不同类型返回不同格式
	 * 
	 * @return
	 */
	public String explain();

	/**
	 * 请求操作类型
	 * 
	 * @return
	 */
	public int getRequestType();
	/**
	 * 执行顺序
	 * @return
	 */
	public int exeSortId();
}
