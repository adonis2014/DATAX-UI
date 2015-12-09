package net.iharding.query.query.maker;

import net.iharding.query.domain.Condition;
import net.iharding.query.domain.Where;
import net.iharding.query.domain.Where.CONN;
import net.iharding.query.exception.SqlParseException;

import org.elasticsearch.index.query.BaseQueryBuilder;
import org.elasticsearch.index.query.BoolQueryBuilder;
import org.elasticsearch.index.query.QueryBuilders;

public class QueryMaker extends Maker {

	/**
	 * 将where条件构建成query
	 * 
	 * @param where
	 * @return
	 * @throws SqlParseException
	 */
	public static BoolQueryBuilder explan(Where where) throws SqlParseException {
		BoolQueryBuilder boolQuery = QueryBuilders.boolQuery();
		new QueryMaker().explanWhere(boolQuery, where);
		return boolQuery;
	}

	private QueryMaker() {
		super(true);
	}

	private void explanWhere(BoolQueryBuilder boolQuery, Where where) throws SqlParseException {
		while (where.getWheres().size() == 1) {
			where = where.getWheres().getFirst();
		}
		if (where instanceof Condition) {
			addSubQuery(boolQuery, where, (BaseQueryBuilder) make((Condition) where));
		} else {
			BoolQueryBuilder subQuery = QueryBuilders.boolQuery();
			addSubQuery(boolQuery, where, subQuery);
			for (Where subWhere : where.getWheres()) {
				explanWhere(subQuery, subWhere);
			}
		}
	}

	/**
	 * 增加嵌套插
	 * 
	 * @param boolQuery
	 * @param where
	 * @param subQuery
	 */
	private void addSubQuery(BoolQueryBuilder boolQuery, Where where, BaseQueryBuilder subQuery) {
		if (where.getConn() == CONN.AND) {
			boolQuery.must(subQuery);
		} else {
			boolQuery.should(subQuery);
		}
	}
}
