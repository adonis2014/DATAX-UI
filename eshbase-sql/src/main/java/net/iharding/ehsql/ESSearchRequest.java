package net.iharding.ehsql;

import org.elasticsearch.index.query.QueryBuilder;
/**
 * es查询请求封装
 * @author zhangxuhui
 * @mail joezxh@qq.com
 *
 */
public class ESSearchRequest {

	private String indexName;
	private String[] typeNames;
	private QueryBuilder qb;
	private int requestType;
	
	public int getRequestType() {
		return requestType;
	}
	public void setRequestType(int requestType) {
		this.requestType = requestType;
	}
	public String getIndexName() {
		return indexName;
	}
	public void setIndexName(String indexName) {
		this.indexName = indexName;
	}
	public String[] getTypeNames() {
		return typeNames;
	}
	public void setTypeNames(String[] typeNames) {
		this.typeNames = typeNames;
	}
	public QueryBuilder getQb() {
		return qb;
	}
	public void setQb(QueryBuilder qb) {
		this.qb = qb;
	}
	
	
}
