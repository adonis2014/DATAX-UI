package net.iharding.ehdb.ehsql;

import net.iharding.Constants;

/**
 * HBase基础上 phoeinx sql查询请求
 * @author zhangxuhui
 * @mail joezxh@qq.com
 *
 */
public class PhoeinxRequest  implements EHRequestInf{
	
	private String sql;

	public String getSql() {
		return sql;
	}

	public void setSql(String sql) {
		this.sql = sql;
	}

	@Override
	public String explain() {
		return "hbase phoeinx sql查询："+sql;
	}

	@Override
	public int getRequestType() {
		return Constants.REQUESTTYPE_PHOEINX_SEARCH;
	}

	@Override
	public int exeSortId() {
		return 3;
	}
	
	

}
