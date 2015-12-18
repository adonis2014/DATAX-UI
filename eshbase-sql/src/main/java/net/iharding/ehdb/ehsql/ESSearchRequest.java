package net.iharding.ehdb.ehsql;

import java.util.List;

import net.iharding.Constants;

import org.elasticsearch.index.query.QueryBuilder;
import org.elasticsearch.search.aggregations.AggregationBuilder;
import org.elasticsearch.search.sort.SortBuilder;
/**
 * es查询请求封装
 * @author zhangxuhui
 * @mail joezxh@qq.com
 *
 */
public class ESSearchRequest implements EHRequestInf{

	private String indexName;
	private String[] typeNames;
	private QueryBuilder qb;
	private AggregationBuilder<?> aggBuilder;
	private List<SortBuilder> sorts;
	private long from=0l;
	private long size=50l;
	private String[] fetchSourceColumns;
	
	
	public AggregationBuilder<?> getAggBuilder() {
		return aggBuilder;
	}
	public void setAggBuilder(AggregationBuilder<?> aggBuilder) {
		this.aggBuilder = aggBuilder;
	}
	public long getFrom() {
		return from;
	}
	public void setFrom(long from) {
		this.from = from;
	}
	public long getSize() {
		return size;
	}
	public void setSize(long size) {
		this.size = size;
	}
	
	public String[] getFetchSourceColumns() {
		return fetchSourceColumns;
	}
	public void setFetchSourceColumns(String[] fetchSourceColumns) {
		this.fetchSourceColumns = fetchSourceColumns;
	}
	public List<SortBuilder> getSorts() {
		return sorts;
	}
	public void setSorts(List<SortBuilder> sorts) {
		this.sorts = sorts;
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
	
	@Override
	public String explain() {
		return "ELASTICSEARCH查询，查询语句："+qb.toString();
	}
	
	@Override
	public int exeSortId() {
		return 1;
	}
	
	public int getRequestType() {
		return Constants.REQUESTTYPE_ELASTICSEARCH_SEARCH;
	}
}
