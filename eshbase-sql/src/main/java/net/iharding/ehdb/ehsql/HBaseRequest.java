package net.iharding.ehdb.ehsql;

import java.util.List;

import org.apache.hadoop.hbase.client.Get;

import net.iharding.Constants;

/**
 * HBase请求封装，提供通过hbase get，scan查询的封装
 * @author zhangxuhui
 * @mail joezxh@qq.com
 *
 */
public class HBaseRequest implements EHRequestInf{
	
	private String htableName;

	
	private List<Get> gets;
	
	private String[] ids;
	
	private long[] timeRange;

	@Override
	public String explain() {
		if (gets!=null && gets.size()>0){
			return "hbase 批量get:"+gets.size();
		}else if (ids!=null && ids.length>0){
			return "hbase scan rowid 范围"+ids;
		}else if (timeRange!=null && timeRange.length>0){
			return "hbase scan timestamp 范围"+timeRange;
		} 
		return "不执行任何操作";
	}

	@Override
	public int getRequestType() {
		return Constants.REQUESTTYPE_HBASE_SCAN;
	}

	@Override
	public int exeSortId() {
		return 2;
	}

}
