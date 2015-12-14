package net.iharding.ehdb.ehsql;

import java.util.List;

import net.iharding.modules.meta.model.DBTable;

public class SQLRequest {

	private DBTable table;
	private List<EHRequestInf> requests;
	private String userId="Anonymous";
	private String remote="127.0.0.1";
	
	public DBTable getTable() {
		return table;
	}
	
	public void setTable(DBTable table) {
		this.table = table;
	}
	
	public List<EHRequestInf> getRequests() {
		return requests;
	}
	public void setRequests(List<EHRequestInf> requests) {
		this.requests = requests;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getRemote() {
		return remote;
	}
	public void setRemote(String remote) {
		this.remote = remote;
	}
	
	
	
}
