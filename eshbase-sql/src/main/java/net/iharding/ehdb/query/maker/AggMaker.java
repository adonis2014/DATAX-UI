package net.iharding.ehdb.query.maker;

import java.util.ArrayList;
import java.util.List;

import net.iharding.ehdb.exception.NotSupportedException;
import net.iharding.modules.meta.model.Dataset;
import net.iharding.modules.meta.model.DbColumn;
import net.sf.jsqlparser.expression.Expression;
import net.sf.jsqlparser.expression.Function;
import net.sf.jsqlparser.schema.Column;

import org.apache.commons.lang.math.NumberUtils;
import org.elasticsearch.search.aggregations.AbstractAggregationBuilder;
import org.elasticsearch.search.aggregations.AggregationBuilder;
import org.elasticsearch.search.aggregations.AggregationBuilders;
import org.elasticsearch.search.aggregations.ValuesSourceAggregationBuilder;
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
	 * @param column
	 * @return
	 * @throws NotSupportedException
	 * @throws SqlParseException
	 */
	public AggregationBuilder<?> makeGroupAgg(DbColumn column) throws NotSupportedException {
		TermsBuilder termsBuilder = AggregationBuilders.terms(column.getColumnName()).field(column.getFieldCode());
		return termsBuilder;
	}

	/**
	 * Create aggregation according to the SQL function.
	 * 
	 * @param field
	 *            SQL function
	 * @param parent
	 *            parentAggregation
	 * @return AggregationBuilder represents the SQL function
	 * @throws NotSupportedException
	 * @throws SqlParseException
	 *             in case of unrecognized function
	 */
	public AbstractAggregationBuilder makeFieldAgg(Dataset dbtable, Function field) throws NotSupportedException {
		// groupMap.put(field.getAlias(), new KVValue("FIELD", parent));
		Column column = (Column) field.getParameters().getExpressions().get(0);
		DbColumn dbColumn = dbtable.getDbColumn(column.getColumnName());
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
			return makeTopHitsAgg(dbColumn,field);
		case "COUNT":
			return makeCountAgg(dbColumn,field);
		default:
			throw new NotSupportedException("the agg function not to define !");
		}
	}

	public ValuesSourceAggregationBuilder<?> makeFunctionGroup(Dataset dbtable, Function field) throws NotSupportedException {
		switch (field.getName().toLowerCase()) {
		case "range":
			return rangeBuilder(dbtable, field);
		case "date_histogram":
			return dateHistogram(dbtable, field);
		case "date_range":
			return dateRange(dbtable, field);
		case "month":
			return dateRange(dbtable, field);
		case "histogram":
			return histogram(dbtable, field);
		default:
			throw new NotSupportedException("can define this method " + field);
		}

	}

	private static final String TIME_FARMAT = "yyyy-MM-dd HH:mm:ss";

	/**
	 * dateRange 统计 第一个参数为字段名,其它字段按照:间隔带key或者不带key为rang value daterange
	 * aggregation { "aggs": { "range": { "date_range": { "field": "date",
	 * "format": "MM-yyy", "ranges": [ { "to": "now-10M/M" }, { "from":
	 * "now-10M/M" } ] } } } }
	 * 
	 * @param dbtable
	 * @param field
	 * @return
	 */
	private ValuesSourceAggregationBuilder<?> dateRange(Dataset dbtable, Function field) {
		String column = field.getParameters().getExpressions().get(0).toString();
		DbColumn dbColumn = dbtable.getDbColumn(column);
		DateRangeBuilder dateRange = AggregationBuilders.dateRange(dbColumn.getColumnName()).format(TIME_FARMAT);
		dateRange.field(dbColumn.getFieldCode());
		List<String> ranges = new ArrayList<>();
		for (Expression expression : field.getParameters().getExpressions()) {
			String[] kv = expression.toString().split(":");
			if (kv.length > 1) {
				if (kv[0].equalsIgnoreCase("format")) {
					dateRange.format(kv[0]);
					continue;
				} else if (kv[0].equalsIgnoreCase("from")) {
					dateRange.addUnboundedFrom(kv[0]);
					continue;
				} else if (kv[0].equalsIgnoreCase("to")) {
					dateRange.addUnboundedTo(kv[0]);
					continue;
				}
			} else {
				ranges.add(kv[0]);
			}
		}
		for (int i = 1; i < ranges.size(); i++) {
			dateRange.addRange(ranges.get(i - 1), ranges.get(i));
		}
		return dateRange;
	}

	/**
	 * 按照时间范围分组 第一个参数为字段名,其它字段按照:间隔带key
	 * 
	 * { "aggs" : { "articles_over_time" : { "date_histogram" : { "field" :
	 * "date", "interval" : "1M", "format" : "yyyy-MM-dd" } } } }
	 * 
	 * @param field
	 * @return
	 * @throws SqlParseException
	 */
	private DateHistogramBuilder dateHistogram(Dataset dbtable, Function field) throws NotSupportedException {
		String column = field.getParameters().getExpressions().get(0).toString();
		DbColumn dbColumn = dbtable.getDbColumn(column);
		DateHistogramBuilder dateHistogram = AggregationBuilders.dateHistogram(dbColumn.getFieldCode()).format(TIME_FARMAT);
		dateHistogram.field(dbColumn.getFieldCode());
//		for(Expression expression:field.getParameters().getExpressions()){
//			String[] kv = expression.toString().split(":");
//			if (kv.length>1){
//				if (kv[0].equalsIgnoreCase("interval")){
//					dateHistogram.interval(new DateHistogram.Interval(kv[1]));
//					continue;
//				}else if (kv[0].equalsIgnoreCase("format")){
//					dateHistogram.format(kv[1]);
//					continue;
//				}else if (kv[0].equalsIgnoreCase("time_zone")|| kv[0].equalsIgnoreCase("pre_zone")){
//					dateHistogram.preZone(kv[1]);
//					continue;
//				}else if (kv[0].equalsIgnoreCase("post_zone")){
//					dateHistogram.postZone(kv[1]);
//					continue;
//				}else if (kv[0].equalsIgnoreCase("post_offset")){
//					dateHistogram.postOffset(kv[1]);
//					continue;
//				}else if (kv[0].equalsIgnoreCase("pre_offset")){
//					dateHistogram.preOffset(kv[1]);
//					continue;
//				}else{
//					throw new NotSupportedException("date range err or not define field " + kv.toString());
//				}
//			}
//		}
		return dateHistogram;
	}

	private HistogramBuilder histogram(Dataset dbtable, Function field) throws NotSupportedException {
		String column = field.getParameters().getExpressions().get(0).toString();
		DbColumn dbColumn = dbtable.getDbColumn(column);
		HistogramBuilder histogram = AggregationBuilders.histogram(dbColumn.getColumnName());
		histogram.field(dbColumn.getFieldCode());
		for(Expression expression:field.getParameters().getExpressions()){
			String[] kv = expression.toString().split(":");
			if (kv.length>1){
				if (kv[0].equalsIgnoreCase("interval")){
					histogram.interval(Long.parseLong(kv[1]));
					continue;
				}else if (kv[0].equalsIgnoreCase("min_doc_count")){
					histogram.minDocCount(Long.parseLong(kv[1]));
					continue;
				}else if (kv[0].equalsIgnoreCase("extended_bounds")){
					String[] bounds = kv[1].split("/");
					if (bounds.length == 2)
						histogram.extendedBounds(Long.valueOf(bounds[0]), Long.valueOf(bounds[1]));
					continue;
				}else if (kv[0].equalsIgnoreCase("order")){
					Histogram.Order order = null;
					switch (kv[1]) {
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
					continue;
				}else{
					throw new NotSupportedException("histogram err or not define field " + kv.toString());
				}
			}
		}
		return histogram;
	}

	/**
	 * 构建范围查询
	 * 
	 * 第一个参数为字段名
	 * 
	 * @param field
	 * @return
	 */
	private RangeBuilder rangeBuilder(Dataset dbtable, Function field) {
		int leng = field.getParameters().getExpressions().size();
		// 第一个参数为字段名
		Column column = (Column) field.getParameters().getExpressions().get(0);
		DbColumn dbColumn = dbtable.getDbColumn(column.getColumnName());
		RangeBuilder range = AggregationBuilders.range(dbColumn.getColumnName()).field(dbColumn.getFieldCode());
		for (int i = 2; i < leng; i++) {
			range.addRange(NumberUtils.toDouble(field.getParameters().getExpressions().get(i - 1).toString()), NumberUtils.toDouble(field.getParameters().getExpressions().get(i).toString()));
		}
		return range;
	}

	/**
	 * Create count aggregation.
	 * 
	 * @param field
	 *            The count function
	 * @return AggregationBuilder use to count result
	 */
	private AbstractAggregationBuilder makeCountAgg(DbColumn field, Function function) {
		Expression expression=function.getParameters().getExpressions().get(1);
		// Cardinality is approximate DISTINCT.
		if ("DISTINCT".equals(expression.toString())) {
			return AggregationBuilders.cardinality(field.getColumnName()).precisionThreshold(40000).field(field.getFieldCode());
		}
		String fieldName = function.getParameters().getExpressions().get(0).toString();
		if ("*".equals(fieldName)) {
			return AggregationBuilders.count(field.getColumnName()).field("_index");
		} else {
			return AggregationBuilders.count(field.getColumnName()).field(field.getFieldCode());
		}
	}

	/**
	 * TOPHITS查询
	 * 
	 * @param field
	 * @return
	 */
	private AbstractAggregationBuilder makeTopHitsAgg(DbColumn field, Function function) {
		TopHitsBuilder topHits = AggregationBuilders.topHits(field.getColumnName());
		for (Expression expression : function.getParameters().getExpressions()) {
			String[] kv = expression.toString().split(":");
			switch (kv[0]) {
			case "from":
				topHits.setFrom(NumberUtils.toInt(kv[1]));
				break;
			case "size":
				topHits.setSize(NumberUtils.toInt(kv[1]));
				break;
			default:
				topHits.addSort(kv[0], SortOrder.valueOf(kv[1].toUpperCase()));
				break;
			}
		}
		return topHits;
	}

}
