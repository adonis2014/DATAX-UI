package net.iharding.ehsql;

import java.util.ArrayList;
import java.util.List;

/**
 * HBase基础上 phoeinx sql查询请求
 * @author zhangxuhui
 * @mail joezxh@qq.com
 *
 */
public class PhoeinxRequest {
	
	private List<String> sqls=new ArrayList<String>();

	public void addSql(String sql){
		sqls.add(sql);
	}
	
	public List<String> getSqls() {
		return sqls;
	}

	public void setSqls(List<String> sqls) {
		this.sqls = sqls;
	}
	
	

}
