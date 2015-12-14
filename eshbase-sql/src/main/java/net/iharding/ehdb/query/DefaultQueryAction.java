package net.iharding.ehdb.query;

import java.util.List;
import java.util.ArrayList;

import net.iharding.core.model.Response;
import net.iharding.ehdb.QueryAction;
import net.iharding.ehdb.ehsql.ESSearchRequest;
import net.iharding.ehdb.ehsql.SQLRequest;
import net.iharding.ehdb.exception.ErrorSqlException;
import net.iharding.ehdb.query.maker.FilterMaker;
import net.iharding.ehdb.query.maker.QueryMaker;
import net.iharding.modules.meta.model.DBTable;
import net.iharding.modules.meta.service.DBTableService;
import net.iharding.modules.meta.service.impl.DBTableServiceImpl;
import net.sf.jsqlparser.expression.Expression;
import net.sf.jsqlparser.schema.Table;
import net.sf.jsqlparser.statement.select.OrderByElement;
import net.sf.jsqlparser.statement.select.PlainSelect;
import net.sf.jsqlparser.statement.select.Select;
import net.sf.jsqlparser.statement.select.SelectItem;

import org.elasticsearch.action.search.SearchRequestBuilder;
import org.elasticsearch.action.search.SearchType;
import org.elasticsearch.client.Client;
import org.elasticsearch.index.query.BoolFilterBuilder;
import org.elasticsearch.index.query.BoolQueryBuilder;
import org.elasticsearch.index.query.QueryBuilders;
import org.elasticsearch.search.sort.SortOrder;

/**
 * 单表查询实现
 */
public class DefaultQueryAction extends QueryAction {

	private final Select select;
	private SQLRequest request;
	private DBTable dbtable;
	private PlainSelect psel;
	DBTableService tableService=new DBTableServiceImpl();
	
	public DefaultQueryAction(Client client, Select select) throws ErrorSqlException {
		super(client, select);
		this.select = select;
		psel=(PlainSelect)select.getSelectBody();
		//获取table信息
		Table table=(Table)psel.getFromItem();
		List<DBTable> tables=tableService.findBy("tableName", table.getName());
		if (tables==null || tables.size()>0){
			throw new ErrorSqlException("元数据库中找不到该表定义！");
		}else{
			dbtable=(DBTable)tables.get(0);
		}
	}

	@Override
	public SQLRequest explain()  {
		setIndicesAndTypes();
		setFields(psel.getSelectItems());
		setWhere(psel.getWhere());
		setSorts(psel.getOrderByElements());
		setLimit(psel.getLimit().getOffset(), psel.getOffset().getOffset());
		return request;
	}

	/**
	 * Set indices and types to the search request.
	 */
	private void setIndicesAndTypes() {
		request.setIndexName(query.getIndexArr());

		String[] typeArr = query.getTypeArr();
		if(typeArr != null) {
			request.setTypes(typeArr);
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
				if (field instanceof SelectItem) {
					includeFields.add(field.getName());
				}
			}

			request.setFetchSource(includeFields.toArray(new String[includeFields.size()]), null);
		}
	}


	/**
	 * Create filters or queries based on
	 * the Where clause.
	 * @param where the 'WHERE' part of the SQL query.
	 * @throws SqlParseException
	 */
	private void setWhere(Expression where)  {
		if (where != null) {
			if (select.isQuery) {
				BoolQueryBuilder boolQuery = QueryMaker.explan(where);
				request.setQuery(boolQuery);
			} else {
				BoolFilterBuilder boolFilter = FilterMaker.explan(where);
				request.setQuery(QueryBuilders.filteredQuery(null, boolFilter));
			}
		}
	}


	/**
	 * Add sorts to the elasticsearch query
	 * based on the 'ORDER BY' clause.
	 * @param orderBys list of Order object
	 */
	private void setSorts(List<OrderByElement> orderBys) {
		for (Order order : orderBys) {
			request.addSort(order.getName(), SortOrder.valueOf(order.getType()));
		}
	}


	/**
	 * Add from and size to the ES query
	 * based on the 'LIMIT' clause
	 * @param from starts from document at position from
	 * @param size number of documents to return.
	 */
	private void setLimit(long from, long size) {
		request.setFrom(from);

		if (size > -1) {
			request.setSize(size);
		}
	}

	@Override
	public Response<?> extcute() {
		// TODO Auto-generated method stub
		return null;
	}


}
