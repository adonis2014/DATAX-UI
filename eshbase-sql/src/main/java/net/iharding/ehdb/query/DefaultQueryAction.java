package net.iharding.ehdb.query;

import java.util.ArrayList;
import java.util.List;

import net.iharding.Constants;
import net.iharding.core.model.Response;
import net.iharding.ehdb.QueryAction;
import net.iharding.ehdb.ehsql.ESSearchRequest;
import net.iharding.ehdb.ehsql.HBaseRequest;
import net.iharding.ehdb.ehsql.SQLRequest;
import net.iharding.ehdb.exception.ErrorSqlException;
import net.iharding.ehdb.query.maker.QueryMaker;
import net.iharding.modules.meta.model.DBIndex;
import net.iharding.modules.meta.model.DBTable;
import net.iharding.modules.meta.model.DbColumn;
import net.iharding.modules.meta.service.DBTableService;
import net.iharding.modules.meta.service.impl.DBTableServiceImpl;
import net.sf.jsqlparser.expression.Expression;
import net.sf.jsqlparser.schema.Column;
import net.sf.jsqlparser.schema.Table;
import net.sf.jsqlparser.statement.select.OrderByElement;
import net.sf.jsqlparser.statement.select.PlainSelect;
import net.sf.jsqlparser.statement.select.Select;
import net.sf.jsqlparser.statement.select.SelectExpressionItem;
import net.sf.jsqlparser.statement.select.SelectItem;

import org.elasticsearch.client.Client;
import org.elasticsearch.index.query.BoolQueryBuilder;
import org.elasticsearch.index.query.QueryBuilder;
import org.elasticsearch.search.sort.SortBuilder;
import org.elasticsearch.search.sort.SortBuilders;
import org.elasticsearch.search.sort.SortOrder;


/**
 * 单表查询实现
 */
public class DefaultQueryAction extends QueryAction {

	private SQLRequest request;
	private ESSearchRequest esrequest=new ESSearchRequest();
	private HBaseRequest hbrequest=new HBaseRequest();
	private DBTable dbtable;
	private DBIndex esindex;
	private PlainSelect psel;
	DBTableService tableService=new DBTableServiceImpl();
	
	public DefaultQueryAction(Client client, Select select) throws ErrorSqlException {
		super(client, select);
		psel=(PlainSelect)select.getSelectBody();
		//获取table信息
		Table table=(Table)psel.getFromItem();
		List<DBTable> tables=tableService.findBy("tableName", table.getName());
		if (tables==null || tables.size()>0){
			throw new ErrorSqlException("元数据库中找不到该表定义！");
		}else{
			dbtable=(DBTable)tables.get(0);
			esindex=dbtable.getDBIndex(Constants.INDEX_TYPE_ELASTICSEARCH);
		}
	}

	@Override
	public SQLRequest explain()  {
		setIndicesAndTypes();
		setFields(psel.getSelectItems());
		setWhere(psel.getWhere());
		setSorts(psel.getOrderByElements());
		setLimit(psel.getLimit().getOffset(), psel.getOffset().getOffset());
		request.addRequest(esrequest);
		request.addRequest(hbrequest);
		return request;
	}

	/**
	 * Set indices and types to the search request.
	 */
	private void setIndicesAndTypes() {
		if (esindex!=null){
			esrequest.setIndexName(esindex.getIndex_name());
			esrequest.setTypeNames(esindex.getType_name().split(";"));
		}
	}


	/**
	 * Set source filtering on a search request.
	 * @param fields list of fields to source filter.
	 */
	private void setFields(List<SelectItem> fields) {
		if (fields.size() > 0) {
			ArrayList<String> includeFields = new ArrayList<String>();
			for (SelectItem field : fields) {
				if (field instanceof SelectExpressionItem) {
					Column fi=(Column)((SelectExpressionItem)field).getExpression();
					DbColumn column=dbtable.getDbColumn(fi.getColumnName());
					if (column!=null ){
						includeFields.add(column.getFieldCode());
						hbrequest.add(column);
					}
					
				}
			}
			esrequest.setFetchSourceColumns(includeFields.toArray(new String[includeFields.size()]));
		}
	}


	/**
	 * Create filters or queries based on
	 * the Where clause.
	 * @param where the 'WHERE' part of the SQL query.
	 * @throws SqlParseException
	 */
	private void setWhere(Expression where)  {
		if (where!=null){
			 QueryBuilder boolQuery = QueryMaker.explan(dbtable,where);
	         esrequest.setQb(boolQuery);
		}
		
	}
	


	/**
	 * Add sorts to the elasticsearch query
	 * based on the 'ORDER BY' clause.
	 * @param orderBys list of Order object
	 */
	private void setSorts(List<OrderByElement> orderBys) {
		List<SortBuilder> sorts=new ArrayList<SortBuilder>();
		for(OrderByElement order:orderBys){
			Column fi=(Column)order.getExpression();
			DbColumn column=dbtable.getDbColumn(fi.getColumnName());
			if (column!=null){
				if (order.isAsc()){
					sorts.add(SortBuilders.fieldSort(column.getFieldCode()).order(SortOrder.ASC));
				}else{
					sorts.add(SortBuilders.fieldSort(column.getFieldCode()).order(SortOrder.DESC));
				}
			}
		}
		esrequest.setSorts(sorts);
	}


	/**
	 * Add from and size to the ES query
	 * based on the 'LIMIT' clause
	 * @param from starts from document at position from
	 * @param size number of documents to return.
	 */
	private void setLimit(long from, long size) {
		esrequest.setFrom(from);
		if (size > -1) {
			esrequest.setSize(size);
		}
	}

	@Override
	public Response<?> extcute() {
		// TODO Auto-generated method stub
		return null;
	}


}
