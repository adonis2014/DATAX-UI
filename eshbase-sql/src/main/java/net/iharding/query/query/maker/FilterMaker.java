package net.iharding.query.query.maker;

import net.iharding.query.domain.Condition;
import net.iharding.query.domain.Where;
import net.iharding.query.domain.Where.CONN;
import net.iharding.query.exception.SqlParseException;

import org.elasticsearch.index.query.BaseFilterBuilder;
import org.elasticsearch.index.query.BoolFilterBuilder;
import org.elasticsearch.index.query.FilterBuilders;

public class FilterMaker extends Maker {

	/**
	 * 将where条件构建成filter
	 * 
	 * @param where
	 * @return
	 * @throws SqlParseException
	 */
	public static BoolFilterBuilder explan(Where where) throws SqlParseException {
		BoolFilterBuilder boolFilter = FilterBuilders.boolFilter();
		new FilterMaker().explanWhere(boolFilter, where);
		return boolFilter;
	}

	private FilterMaker() {
		super(false);
	}

	private void explanWhere(BoolFilterBuilder boolFilter, Where where) throws SqlParseException {
		while (where.getWheres().size() == 1) {
			where = where.getWheres().getFirst();
		}
		if (where instanceof Condition) {
			addSubFilter(boolFilter, where, (BaseFilterBuilder) make((Condition) where));
		} else {
			BoolFilterBuilder subFilter = FilterBuilders.boolFilter();
			addSubFilter(boolFilter, where, subFilter);
			for (Where subWhere : where.getWheres()) {
				explanWhere(subFilter, subWhere);
			}
		}
	}

	/**
	 * 增加嵌套插
	 * 
	 * @param boolFilter
	 * @param where
	 * @param subFilter
	 */
	private void addSubFilter(BoolFilterBuilder boolFilter, Where where, BaseFilterBuilder subFilter) {
		if (where.getConn() == CONN.AND) {
			boolFilter.must(subFilter);
		} else {
			boolFilter.should(subFilter);
		}
	}

}
