package net.iharding.ehdb.ehsql;

import java.util.ArrayList;
import java.util.List;

import org.apache.hadoop.hbase.client.Get;

import net.iharding.Constants;
import net.iharding.modules.meta.model.DbColumn;

/**
 * HBase请求封装，提供通过hbase get，scan查询的封装
 * @author zhangxuhui
 * @mail joezxh@qq.com
 *
 */
public class HBaseRequest implements EHRequestInf{
	
	private String htableName;

	private List<DbColumn> columns=new ArrayList<DbColumn>();
	
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
	
	
	
	public String getHtableName() {
		return htableName;
	}



	public void setHtableName(String htableName) {
		this.htableName = htableName;
	}



	public List<DbColumn> getColumns() {
		return columns;
	}



	public void setColumns(List<DbColumn> columns) {
		this.columns = columns;
	}



	public List<Get> getGets() {
		return gets;
	}



	public void setGets(List<Get> gets) {
		this.gets = gets;
	}



	public String[] getIds() {
		return ids;
	}



	public void setIds(String[] ids) {
		this.ids = ids;
	}



	public long[] getTimeRange() {
		return timeRange;
	}



	public void setTimeRange(long[] timeRange) {
		this.timeRange = timeRange;
	}



	public void add(DbColumn column){
		columns.add(column);
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
