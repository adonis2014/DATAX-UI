package net.iharding.ehsql;

import java.util.List;

import net.sf.jsqlparser.statement.Statement;

import org.elasticsearch.index.query.QueryBuilder;
import org.elasticsearch.search.sort.SortBuilder;
/**
 * es查询请求封装
 * @author zhangxuhui
 * @mail joezxh@qq.com
 *
 */
public class ESSearchRequest {

	private String indexName;
	private String[] typeNames;
	private String htableName;
	private QueryBuilder qb;
	private List<SortBuilder> sorts;
	private int requestType;
	private int from=0;
	private int size=50;
	
	private Statement statement;
	
	public String getHtableName() {
		return htableName;
	}
	public void setHtableName(String htableName) {
		this.htableName = htableName;
	}
	public int getFrom() {
		return from;
	}
	public void setFrom(int from) {
		this.from = from;
	}
	public int getSize() {
		return size;
	}
	public void setSize(int size) {
		this.size = size;
	}
	public List<SortBuilder> getSorts() {
		return sorts;
	}
	public void setSorts(List<SortBuilder> sorts) {
		this.sorts = sorts;
	}
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
	public Statement getStatement() {
		return statement;
	}
	public void setStatement(Statement statement) {
		this.statement = statement;
	}
	
}
