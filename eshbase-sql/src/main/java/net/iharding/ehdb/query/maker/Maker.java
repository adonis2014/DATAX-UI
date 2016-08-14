package net.iharding.ehdb.query.maker;

import net.iharding.modules.meta.model.DBTable;
import net.iharding.modules.meta.model.DbColumn;
import net.sf.jsqlparser.expression.Expression;
import net.sf.jsqlparser.expression.StringValue;
import net.sf.jsqlparser.expression.operators.conditional.AndExpression;
import net.sf.jsqlparser.expression.operators.conditional.OrExpression;
import net.sf.jsqlparser.expression.operators.relational.Between;
import net.sf.jsqlparser.expression.operators.relational.EqualsTo;
import net.sf.jsqlparser.expression.operators.relational.ExpressionList;
import net.sf.jsqlparser.expression.operators.relational.GreaterThan;
import net.sf.jsqlparser.expression.operators.relational.GreaterThanEquals;
import net.sf.jsqlparser.expression.operators.relational.InExpression;
import net.sf.jsqlparser.expression.operators.relational.IsNullExpression;
import net.sf.jsqlparser.expression.operators.relational.LikeExpression;
import net.sf.jsqlparser.expression.operators.relational.MinorThan;
import net.sf.jsqlparser.expression.operators.relational.MinorThanEquals;
import net.sf.jsqlparser.expression.operators.relational.NotEqualsTo;
import net.sf.jsqlparser.schema.Column;

import org.elasticsearch.common.xcontent.ToXContent;
import org.elasticsearch.index.query.BoolQueryBuilder;
import org.elasticsearch.index.query.MatchQueryBuilder;
import org.elasticsearch.index.query.QueryBuilder;
import org.elasticsearch.index.query.QueryBuilders;
import org.elasticsearch.index.query.WildcardQueryBuilder;

public abstract class Maker {

	private DBTable dbtable;
	private boolean isQuery = false;

	protected Maker( DBTable dbtable,Boolean isQuery) {
		this.dbtable=dbtable;
		this.isQuery = isQuery;
	}

	/**
	 * 构建过滤条件
	 * 
	 * @param boolFilter
	 * @param expr
	 * @param expr
	 * @return
	 * @throws SqlParseException
	 */
	protected ToXContent make(Expression cond)  {
		ToXContent x = null;
		if (cond instanceof AndExpression ){
			AndExpression ae=(AndExpression)cond;
			if (isQuery) {
				x=QueryBuilders.boolQuery().must((QueryBuilder)make(ae.getLeftExpression())).must((QueryBuilder)make(ae.getRightExpression()));
			}
			x = fixNot(cond, x,ae.isNot());
		}else if (cond instanceof OrExpression){
			OrExpression oe=(OrExpression)cond;
			if (isQuery) {
				x=QueryBuilders.boolQuery().should((QueryBuilder)make(oe.getLeftExpression())).should((QueryBuilder)make(oe.getRightExpression()));
			}
			x = fixNot(cond, x,oe.isNot());
		}else{
			x= makeRelational(cond);
		}
		return x;
	}


	private ToXContent makeRelational(Expression cond)  {
		ToXContent x = null;
		boolean isnot=false;
		if (cond instanceof Between){//A "BETWEEN" expr1 expr2 statement
			Between bt=(Between)cond;
			Column column=(Column)bt.getLeftExpression();
			DbColumn dbcolumn=dbtable.getDbColumn(column.getColumnName());
			if (isQuery) {
				x=QueryBuilders.rangeQuery(dbcolumn.getFieldCode()).gte(bt.getBetweenExpressionStart()).lte(bt.getBetweenExpressionEnd());
			}
			isnot=bt.isNot();
		}else if (cond instanceof EqualsTo){
			EqualsTo equalsTo=(EqualsTo)cond;
			Column column=(Column)equalsTo.getLeftExpression();
			DbColumn dbcolumn=dbtable.getDbColumn(column.getColumnName());
			if (isQuery){
				x=QueryBuilders.termQuery(dbcolumn.getFieldCode(), equalsTo.getRightExpression());
			}
			isnot=equalsTo.isNot();
		}else if (cond instanceof GreaterThan){
			GreaterThan greaterThan=(GreaterThan)cond;
			Column column=(Column)greaterThan.getLeftExpression();
			DbColumn dbcolumn=dbtable.getDbColumn(column.getColumnName());
			if (isQuery){
				x=QueryBuilders.rangeQuery(dbcolumn.getFieldCode()).gt(greaterThan.getRightExpression());
			}
			isnot=greaterThan.isNot();
		}else if (cond instanceof GreaterThanEquals){
			GreaterThanEquals equalsTo=(GreaterThanEquals)cond;
			Column column=(Column)equalsTo.getLeftExpression();
			DbColumn dbcolumn=dbtable.getDbColumn(column.getColumnName());
			if (isQuery){
				x=QueryBuilders.rangeQuery(dbcolumn.getFieldCode()).gte(equalsTo.getRightExpression());
			}
			isnot=equalsTo.isNot();
		}else if (cond instanceof MinorThan){
			MinorThan equalsTo=(MinorThan)cond;
			Column column=(Column)equalsTo.getLeftExpression();
			DbColumn dbcolumn=dbtable.getDbColumn(column.getColumnName());
			if (isQuery){
				x=QueryBuilders.rangeQuery(dbcolumn.getFieldCode()).lt(equalsTo.getRightExpression());
			}
			isnot=equalsTo.isNot();
		}  else if (cond instanceof MinorThanEquals){
			MinorThanEquals equalsTo=(MinorThanEquals)cond;
			Column column=(Column)equalsTo.getLeftExpression();
			DbColumn dbcolumn=dbtable.getDbColumn(column.getColumnName());
			if (isQuery){
				x=QueryBuilders.rangeQuery(dbcolumn.getFieldCode()).lte(equalsTo.getRightExpression());
			}
			isnot=equalsTo.isNot();
		} else if (cond instanceof NotEqualsTo){
			NotEqualsTo equalsTo=(NotEqualsTo)cond;
			Column column=(Column)equalsTo.getLeftExpression();
			DbColumn dbcolumn=dbtable.getDbColumn(column.getColumnName());
			if (isQuery){
				x=QueryBuilders.boolQuery().mustNot(QueryBuilders.termQuery(dbcolumn.getFieldCode(),equalsTo.getRightExpression()));
			}
			isnot=equalsTo.isNot();
		}   else if (cond instanceof InExpression){
			InExpression inExpress=(InExpression)cond;
			Column column=(Column)inExpress.getLeftExpression();
			DbColumn dbcolumn=dbtable.getDbColumn(column.getColumnName());
			ExpressionList values = (ExpressionList) inExpress.getRightItemsList();
			MatchQueryBuilder[] matchQueries = new MatchQueryBuilder[values.getExpressions().size()];
			for(int i = 0; i < values.getExpressions().size(); i++) {
				matchQueries[i] = QueryBuilders.matchPhraseQuery(dbcolumn.getFieldCode(), values.getExpressions().get(i));
			}
			if(isQuery) {
				BoolQueryBuilder boolQuery = QueryBuilders.boolQuery();
				for(MatchQueryBuilder matchQuery : matchQueries) {
					boolQuery.should(matchQuery);
				}
				x = boolQuery;
			}
			
			isnot=inExpress.isNot();
		}   else if (cond instanceof IsNullExpression){
			IsNullExpression missExp=(IsNullExpression)cond;
			Column column=(Column)missExp.getLeftExpression();
			DbColumn dbcolumn=dbtable.getDbColumn(column.getColumnName());
			isnot=missExp.isNot();
		}   else if (cond instanceof LikeExpression){
			LikeExpression like=(LikeExpression)cond;
			Column column=(Column)like.getLeftExpression();
			DbColumn dbcolumn=dbtable.getDbColumn(column.getColumnName());
			StringValue value=(StringValue)like.getRightExpression();
			String queryStr = value.getValue().replace('%', '*').replace('_', '?');
			WildcardQueryBuilder wildcardQuery = QueryBuilders.wildcardQuery(dbcolumn.getFieldCode(), queryStr);
			isnot=like.isNot();
		}    
		x = fixNot(cond, x,isnot);
		return x;
	}

	private ToXContent fixNot(Expression cond, ToXContent bqb,boolean isnot) {
		if (isnot) {
			if (isQuery) {
				bqb = QueryBuilders.boolQuery().mustNot((QueryBuilder) bqb);
			} 
		}
		return bqb;
	}

}
