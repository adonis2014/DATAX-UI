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
import net.iharding.ehdb.exception.NotSupportedException;
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
import net.sf.jsqlparser.statement.select.OrderByElement;
import net.sf.jsqlparser.statement.select.PlainSelect;
import net.sf.jsqlparser.statement.select.Select;
import net.sf.jsqlparser.statement.select.SelectBody;
import net.sf.jsqlparser.statement.select.SelectExpressionItem;
import net.sf.jsqlparser.statement.select.SelectItem;

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
	public SQLRequest explain() throws NotSupportedException  {
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
				lastAgg = aggMaker.makeFunctionGroup(dbtable,function);
			}
			if (lastAgg != null && lastAgg instanceof TermsBuilder) {
				if (psel.getLimit()!=null){
					((TermsBuilder) lastAgg).size((int)psel.getLimit().getRowCount());
				}else{
					((TermsBuilder) lastAgg).size(100);
				}
			}
			esrequest.setAggBuilder(lastAgg);
			for (int i = 1; i < psel.getGroupByColumnReferences().size(); i++) {
				Expression field = psel.getGroupByColumnReferences().get(i);
				AggregationBuilder<?> subAgg =null;
				if (field instanceof Column){
					Column cc=(Column)field;
					subAgg = aggMaker.makeGroupAgg(dbtable.getDbColumn(cc.getColumnName()));
					if(subAgg instanceof TermsBuilder){
						((TermsBuilder)subAgg).size(0) ;
					}
				}else if (field instanceof Function){
					subAgg = aggMaker.makeFunctionGroup(dbtable,(Function) field);
				}
				lastAgg.subAggregation(subAgg);
				lastAgg = subAgg;
			}
		}

		// add field
		if (psel.getSelectItems().size() > 0) {
			explanFields(esrequest, psel.getSelectItems(), lastAgg);
		}

		// add order
//		if (lastAgg != null && psel.getOrderByElements().size() > 0) {
//			TermsBuilder termsBuilder = null;
//			for (OrderByElement order : psel.getOrderByElements()) {
//				termsBuilder = (TermsBuilder) temp.value;
//				switch (temp.key) {
//				case "COUNT":
//					termsBuilder.order(Terms.Order.count(isASC(order)));
//					break;
//				case "KEY":
//					termsBuilder.order(Terms.Order.term(isASC(order)));
//					break;
//				case "FIELD":
//					termsBuilder.order(Terms.Order.aggregation(order.getName(), isASC(order)));
//					break;
//				default:
//					throw new SqlParseException(order.getName() + " can not to order");
//				}
//			}
//		}
//		request.setSize(0);
//		request.setSearchType(SearchType.DEFAULT);
		return request;
	}

//	private boolean isASC(Order order) {
//		return "ASC".equals(order.getType());
//	}

	private void explanFields(ESSearchRequest request, List<SelectItem> fields, AggregationBuilder<?> groupByAgg) throws NotSupportedException  {
		for (SelectItem field : fields) {
			if (((SelectExpressionItem)field).getExpression() instanceof Function) {
				AbstractAggregationBuilder makeAgg = aggMaker.makeFieldAgg(dbtable, (Function)((SelectExpressionItem)field).getExpression());
				if (groupByAgg != null) {
					groupByAgg.subAggregation(makeAgg);
				}else {
//					request.setAggBuilder(makeAgg);
				}
			} else if (((SelectExpressionItem)field).getExpression() instanceof Column) {
//				request.addField(((Column)field.getExpression()).getColumnName());
			} else {
				throw new NotSupportedException("it did not support this field method " );
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
