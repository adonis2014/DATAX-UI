package net.iharding.ehdb.query.maker;

import net.iharding.modules.meta.model.DBTable;
import net.sf.jsqlparser.expression.Expression;

import org.elasticsearch.index.query.FilterBuilder;

public class FilterMaker extends Maker {

	/**
	 * 将where条件构建成filter
	 * 
	 * @param where
	 * @return
	 * @throws SqlParseException
	 */
	public static FilterBuilder explan(DBTable dbtable,Expression where)   {
		return (FilterBuilder)new FilterMaker(dbtable).make(where);
	}

	private FilterMaker(DBTable dbtable) {
		super(dbtable,false);
	}


}
