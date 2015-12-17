package net.iharding.ehdb.query;

import java.util.List;
import java.util.Map;

import net.iharding.Constants;
import net.iharding.core.model.Response;
import net.iharding.ehdb.QueryAction;
import net.iharding.ehdb.ehsql.ESSearchRequest;
import net.iharding.ehdb.ehsql.HBaseRequest;
import net.iharding.ehdb.ehsql.SQLRequest;
import net.iharding.ehdb.exception.ErrorSqlException;
import net.iharding.ehdb.query.maker.AggMaker;
import net.iharding.ehdb.query.maker.FilterMaker;
import net.iharding.ehdb.query.maker.QueryMaker;
import net.iharding.modules.meta.model.DBIndex;
import net.iharding.modules.meta.model.DBTable;
import net.iharding.modules.meta.service.DBTableService;
import net.iharding.modules.meta.service.impl.DBTableServiceImpl;
import net.sf.jsqlparser.expression.Expression;
import net.sf.jsqlparser.expression.Function;
import net.sf.jsqlparser.schema.Column;
import net.sf.jsqlparser.schema.Table;
import net.sf.jsqlparser.statement.select.PlainSelect;
import net.sf.jsqlparser.statement.select.Select;
import net.sf.jsqlparser.statement.select.SelectBody;

import org.elasticsearch.action.search.SearchRequestBuilder;
import org.elasticsearch.action.search.SearchType;
import org.elasticsearch.client.Client;
import org.elasticsearch.index.query.BoolFilterBuilder;
import org.elasticsearch.index.query.QueryBuilder;
import org.elasticsearch.index.query.QueryBuilders;
import org.elasticsearch.search.aggregations.AbstractAggregationBuilder;
import org.elasticsearch.search.aggregations.AggregationBuilder;
import org.elasticsearch.search.aggregations.bucket.terms.Terms;
import org.elasticsearch.search.aggregations.bucket.terms.TermsBuilder;

/**
 * Transform SQL query to Elasticsearch aggregations query
 */
public class AggregationQueryAction extends QueryAction {

	private AggMaker aggMaker = new AggMaker();
	private PlainSelect psel;
	DBTableService tableService=new DBTableServiceImpl();
	private SQLRequest request;
	private ESSearchRequest esrequest=new ESSearchRequest();
	private DBTable dbtable;
	private DBIndex esindex;
	
	
	public AggregationQueryAction(Client client, Select select) throws ErrorSqlException {
		super(client, select);
		this.psel = (PlainSelect)select.getSelectBody();
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
		//this.request = client.prepareSearch();
		//request.setListenerThreaded(false);
		setIndicesAndTypes();

		setWhere(psel.getWhere());
		AggregationBuilder<?> lastAgg = null;

		if (psel.getGroupByColumnReferences().size() > 0) {
			Expression exp=psel.getGroupByColumnReferences().get(0);
			if (exp instanceof Column){
				Column field =(Column) exp;
				lastAgg = aggMaker.makeGroupAgg(dbtable.getDbColumn(field.getColumnName()));
			}else{
				Function function=(Function)exp;
				lastAgg = aggMaker.makeGroupAgg(function);
			}
			if (lastAgg != null && lastAgg instanceof TermsBuilder) {
				((TermsBuilder) lastAgg).size(select.getRowCount());
			}

			request.addAggregation(lastAgg);

			for (int i = 1; i < select.getGroupBys().size(); i++) {
				field = select.getGroupBys().get(i);
				AggregationBuilder<?> subAgg = aggMaker.makeGroupAgg(field);
				if(subAgg instanceof TermsBuilder){
					((TermsBuilder)subAgg).size(0) ;
				}
				
				lastAgg.subAggregation(subAgg);
				lastAgg = subAgg;
			}
		}

		Map<String, KVValue> groupMap = aggMaker.getGroupMap();
		// add field
		if (select.getFields().size() > 0) {
			explanFields(request, select.getFields(), lastAgg);
		}

		// add order
		if (lastAgg != null && select.getOrderBys().size() > 0) {
			KVValue temp = null;
			TermsBuilder termsBuilder = null;
			for (Order order : select.getOrderBys()) {
				temp = groupMap.get(order.getName());
				termsBuilder = (TermsBuilder) temp.value;
				switch (temp.key) {
				case "COUNT":
					termsBuilder.order(Terms.Order.count(isASC(order)));
					break;
				case "KEY":
					termsBuilder.order(Terms.Order.term(isASC(order)));
					break;
				case "FIELD":
					termsBuilder.order(Terms.Order.aggregation(order.getName(), isASC(order)));
					break;
				default:
					throw new SqlParseException(order.getName() + " can not to order");
				}
			}
		}
		request.setSize(0);
		request.setSearchType(SearchType.DEFAULT);
		return request;
	}

	private boolean isASC(Order order) {
		return "ASC".equals(order.getType());
	}

	private void explanFields(SearchRequestBuilder request, List<Field> fields, AggregationBuilder<?> groupByAgg) throws SqlParseException {
		for (Field field : fields) {
			if (field instanceof MethodField) {
				AbstractAggregationBuilder makeAgg = aggMaker.makeFieldAgg((MethodField) field, groupByAgg);
				if (groupByAgg != null) {
					groupByAgg.subAggregation(makeAgg);
				}
				 else {
					request.addAggregation(makeAgg);
				}
			} else if (field instanceof Field) {
				request.addField(field.getName());
			} else {
				throw new SqlParseException("it did not support this field method " + field);
			}
		}
	}

	/**
	 * Create filters based on
	 * the Where clause.
	 * @param where the 'WHERE' part of the SQL query.
	 * @throws SqlParseException
	 */
	private void setWhere(Expression where)  {
		if (where != null) {
			 QueryBuilder boolQuery = QueryMaker.explan(dbtable,where);
	         esrequest.setQb(boolQuery);
		}
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

	@Override
	public Response<?> extcute() {
		// TODO Auto-generated method stub
		return null;
	}
}
