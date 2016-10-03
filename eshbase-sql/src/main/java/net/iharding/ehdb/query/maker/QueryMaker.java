package net.iharding.ehdb.query.maker;

import net.iharding.modules.meta.model.Dataset;
import net.sf.jsqlparser.expression.Expression;

import org.elasticsearch.index.query.QueryBuilder;

public class QueryMaker extends Maker {

	/**
	 * 将where条件构建成query
	 * 
	 * @param where
	 * @return
	 * @throws SqlParseException
	 */
	public static QueryBuilder explan(Dataset dbtable,Expression where)  {
		return (QueryBuilder) new QueryMaker(dbtable).make(where);
	}

	public QueryMaker(Dataset dbtable) {
		super(dbtable,true);
	}

}
