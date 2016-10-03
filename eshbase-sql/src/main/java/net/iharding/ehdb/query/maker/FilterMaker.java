package net.iharding.ehdb.query.maker;

import net.iharding.modules.meta.model.Dataset;
import net.sf.jsqlparser.expression.Expression;

import org.apache.hadoop.hive.metastore.parser.ExpressionTree.FilterBuilder;

public class FilterMaker extends Maker {

	/**
	 * 将where条件构建成filter
	 * 
	 * @param where
	 * @return
	 * @throws SqlParseException
	 */
	public static FilterBuilder explan(Dataset dbtable,Expression where)   {
		return (FilterBuilder)new FilterMaker(dbtable).make(where);
	}

	private FilterMaker(Dataset dbtable) {
		super(dbtable,false);
	}


}
