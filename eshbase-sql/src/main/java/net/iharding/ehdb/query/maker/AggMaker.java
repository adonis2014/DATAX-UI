package net.iharding.ehdb.query.maker;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import net.iharding.ehdb.exception.NotSupportedException;
import net.iharding.modules.meta.model.DBTable;
import net.iharding.modules.meta.model.DbColumn;
import net.sf.jsqlparser.expression.Expression;
import net.sf.jsqlparser.expression.Function;
import net.sf.jsqlparser.schema.Column;

import org.apache.commons.lang.math.NumberUtils;
import org.elasticsearch.search.aggregations.AbstractAggregationBuilder;
import org.elasticsearch.search.aggregations.AggregationBuilder;
import org.elasticsearch.search.aggregations.AggregationBuilders;
import org.elasticsearch.search.aggregations.ValuesSourceAggregationBuilder;
import org.elasticsearch.search.aggregations.bucket.histogram.DateHistogram;
import org.elasticsearch.search.aggregations.bucket.histogram.DateHistogramBuilder;
import org.elasticsearch.search.aggregations.bucket.histogram.Histogram;
import org.elasticsearch.search.aggregations.bucket.histogram.HistogramBuilder;
import org.elasticsearch.search.aggregations.bucket.range.RangeBuilder;
import org.elasticsearch.search.aggregations.bucket.range.date.DateRangeBuilder;
import org.elasticsearch.search.aggregations.bucket.terms.TermsBuilder;
import org.elasticsearch.search.aggregations.metrics.tophits.TopHitsBuilder;
import org.elasticsearch.search.sort.SortOrder;

public class AggMaker {


	/**
	 * 分组查的聚合函数
	 * 
	 * @param field
	 * @return
	 * @throws NotSupportedException 
	 * @throws SqlParseException
	 */
	public AggregationBuilder<?> makeGroupAgg(DbColumn field) throws NotSupportedException  {
			TermsBuilder termsBuilder = AggregationBuilders.terms(field.getColumnName()).field(field.getFieldCode());
			return termsBuilder;
	}


	/**
	 * Create aggregation according to the SQL function.
	 * @param field SQL function
	 * @param parent parentAggregation
	 * @return AggregationBuilder represents the SQL function
	 * @throws NotSupportedException 
	 * @throws SqlParseException in case of unrecognized function
	 */
	public AbstractAggregationBuilder makeFieldAgg(DBTable dbtable,Function field, AbstractAggregationBuilder parent) throws NotSupportedException {
//		groupMap.put(field.getAlias(), new KVValue("FIELD", parent));
		Column column=(Column)field.getParameters().getExpressions().get(0);
		DbColumn dbColumn=dbtable.getDbColumn(column.getColumnName());
		switch (field.getName().toUpperCase()) {
		case "SUM":
			return AggregationBuilders.sum(dbColumn.getColumnName()).field(dbColumn.getFieldCode());
		case "MAX":
			return AggregationBuilders.max(dbColumn.getColumnName()).field(dbColumn.getFieldCode());
		case "MIN":
			return AggregationBuilders.min(dbColumn.getColumnName()).field(dbColumn.getFieldCode());
		case "AVG":
			return AggregationBuilders.avg(dbColumn.getColumnName()).field(dbColumn.getFieldCode());
		case "STATS":
			return AggregationBuilders.stats(dbColumn.getColumnName()).field(dbColumn.getFieldCode());
		case "TOPHITS":
			return makeTopHitsAgg(dbColumn);
		case "COUNT":
//			groupMap.put(dbColumn.getColumnName(), new KVValue("COUNT", parent));
			return makeCountAgg(dbColumn);
		default:
			throw new NotSupportedException("the agg function not to define !");
		}
	}

	public ValuesSourceAggregationBuilder<?> makeRangeGroup(DBTable dbtable,Function field) throws NotSupportedException {
		switch (field.getName().toLowerCase()) {
		case "range":
			return rangeBuilder(dbtable,field);
		case "date_histogram":
			return dateHistogram(dbtable,field);
		case "date_range":
			return dateRange(dbtable,field);
		case "month":
			return dateRange(dbtable,field);
		case "histogram":
			return histogram(dbtable,field);
		default:
			throw new NotSupportedException("can define this method " + field);
		}

	}

	private static final String TIME_FARMAT = "yyyy-MM-dd HH:mm:ss";

	private ValuesSourceAggregationBuilder<?> dateRange(DBTable dbtable,Function field) {
		int leng= field.getParameters().getExpressions().size();
		String column=field.getParameters().getExpressions().get(0).toString();
		String format=field.getParameters().getExpressions().get(1).toString();
		DbColumn dbColumn =dbtable.getDbColumn(column);
		DateRangeBuilder dateRange = AggregationBuilders.dateRange(dbColumn.getColumnName()).format(TIME_FARMAT);

		String value = null;
		List<String> ranges = new ArrayList<>();
		for (Expression kv : field.getParameters().getExpressions()) {
			value = kv.value.toString();
			if ("field".equals(kv.key)) {
				dateRange.field(value);
				continue;
			} else if ("format".equals(kv.key)) {
				dateRange.format(value);
				continue;
			} else if ("from".equals(kv.key)) {
				dateRange.addUnboundedFrom(kv.value);
				continue;
			} else if ("to".equals(kv.key)) {
				dateRange.addUnboundedTo(kv.value);
				continue;
			} else {
				ranges.add(value);
			}
		}

		for (int i = 1; i < ranges.size(); i++) {
			dateRange.addRange(ranges.get(i - 1), ranges.get(i));
		}

		return dateRange;
	}

	/**
	 * 按照时间范围分组
	 * 
	 * @param field
	 * @return
	 * @throws SqlParseException
	 */
	private DateHistogramBuilder dateHistogram(DBTable dbtable,Function field) throws NotSupportedException {
		DateHistogramBuilder dateHistogram = AggregationBuilders.dateHistogram(field.getAlias()).format(TIME_FARMAT);
		String value = null;
		for (KVValue kv : field.getParams()) {
			value = kv.value.toString();
			switch (kv.key.toLowerCase()) {
			case "interval":
				dateHistogram.interval(new DateHistogram.Interval(kv.value.toString()));
				break;
			case "field":
				dateHistogram.field(value);
				break;
			case "format":
				dateHistogram.format(value);
				break;
			case "time_zone":
			case "pre_zone":
				dateHistogram.preZone(value);
				break;
			case "post_zone":
				dateHistogram.postZone(value);
				break;
			case "post_offset":
				dateHistogram.postOffset(value);
				break;
			case "pre_offset":
				dateHistogram.preOffset(value);
				break;
			default:
				throw new NotSupportedException("date range err or not define field " + kv.toString());
			}
		}
		return dateHistogram;
	}

	private HistogramBuilder histogram(DBTable dbtable,Function field) throws NotSupportedException {
		HistogramBuilder histogram = AggregationBuilders.histogram(field.getAlias());
		String value = null;
		for (KVValue kv : field.getParams()) {
			value = kv.value.toString();
			switch (kv.key.toLowerCase()) {
				case "interval":
					histogram.interval(Long.parseLong(value));
					break;
				case "field":
					histogram.field(value);
					break;
				case "min_doc_count":
					histogram.minDocCount(Long.parseLong(value));
					break;
				case "extended_bounds":
					String[] bounds = value.split(":");
					if (bounds.length == 2)
						histogram.extendedBounds(Long.valueOf(bounds[0]), Long.valueOf(bounds[1]));
					break;
				case "order":
					Histogram.Order order = null;
					switch (value) {
						case "key_desc":
							order = Histogram.Order.KEY_DESC;
							break;
						case "count_asc":
							order = Histogram.Order.COUNT_ASC;
							break;
						case "count_desc":
							order = Histogram.Order.COUNT_DESC;
							break;
						case "key_asc":
						default:
							order = Histogram.Order.KEY_ASC;
							break;
					}
					histogram.order(order);
					break;
				default:
					throw new NotSupportedException("histogram err or not define field " + kv.toString());
			}
		}
		return histogram;
	}

	/**
	 * 构建范围查询
	 * 
	 * @param field
	 * @return
	 */
	private RangeBuilder rangeBuilder(DBTable dbtable,Function field) {
		int leng= field.getParameters().getExpressions().size();
		Column column=(Column)field.getParameters().getExpressions().get(0);
		DbColumn dbColumn =dbtable.getDbColumn(column.getColumnName());
		RangeBuilder range = AggregationBuilders.range(dbColumn.getColumnName()).field(dbColumn.getFieldCode());
		for (int i = 2; i < leng; i++) {
			range.addRange(NumberUtils.toDouble(field.getParameters().getExpressions().get(i - 1).toString()),
					NumberUtils.toDouble(field.getParameters().getExpressions().get(i).toString()));
		}
		return range;
	}


	/**
	 * Create count aggregation.
	 * @param field The count function
	 * @return AggregationBuilder use to count result
	 */
	private AbstractAggregationBuilder makeCountAgg(DbColumn field) {

		// Cardinality is approximate DISTINCT.
		if ("DISTINCT".equals(field.getOption())) {
			return AggregationBuilders.cardinality(field.getAlias()).precisionThreshold(40000).field(field.getParams().get(0).value.toString());
		}

		String fieldName = field.getParams().get(0).value.toString();

		// In case of count(*) we use '_index' as field parameter to count all documents
		if ("*".equals(fieldName)) {
			return AggregationBuilders.count(field.getAlias()).field("_index");
		}
		else {
			return AggregationBuilders.count(field.getAlias()).field(fieldName);
		}
	}

	/**
	 * TOPHITS查询
	 * 
	 * @param field
	 * @return
	 */
	private AbstractAggregationBuilder makeTopHitsAgg(DbColumn field) {
		TopHitsBuilder topHits = AggregationBuilders.topHits(field.getAlias());
		List<KVValue> params = field.getParams();
		for (KVValue kv : params) {
			switch (kv.key) {
			case "from":
				topHits.setFrom((int) kv.value);
				break;
			case "size":
				topHits.setSize((int) kv.value);
				break;
			default:
				topHits.addSort(kv.key, SortOrder.valueOf(kv.value.toString().toUpperCase()));
				break;
			}
		}
		return topHits;
	}

}
