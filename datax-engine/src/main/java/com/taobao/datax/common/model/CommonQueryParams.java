package com.taobao.datax.common.model;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.lucene.queryparser.classic.QueryParser;
import org.elasticsearch.index.query.BoolQueryBuilder;
import org.elasticsearch.index.query.ExistsQueryBuilder;
import org.elasticsearch.index.query.QueryBuilder;
import org.elasticsearch.index.query.QueryBuilders;
import org.elasticsearch.index.query.RangeQueryBuilder;
import org.elasticsearch.index.query.TermsQueryBuilder;

import com.fasterxml.jackson.databind.ObjectMapper;

/**
 * eshbase通用查询参数类
 * 
 * @author admin
 * 
 */
public class CommonQueryParams implements java.io.Serializable {

	private static final long serialVersionUID = -4774399665523847691L;

	private static final transient Log log = LogFactory.getLog(CommonQueryParams.class);

	// hbase table名称
	private String htableName;
	// elasticsearch index名称
	private String esIndexName;
	// elasticsearch type名称
	private String esTypeName;
	// 需要返回的字段名，包含列族名
	private List<FieldItem> selectColumns=new ArrayList<FieldItem>();
	// where条件集合
	private List<WhereListParam> whereListParams=new ArrayList<WhereListParam>();
	// 模糊查询字段参数
	private List<WhereFieldParam> wildFieldParams=new ArrayList<WhereFieldParam>();
	//missing查询
	private List<WhereFieldParam> missFieldParams=new ArrayList<WhereFieldParam>();
	// 精确查询字段参数
	private List<WhereFieldParam> exactFieldParams=new ArrayList<WhereFieldParam>();
	// 排序条件集合
	private List<OrderItem> orderItems=new ArrayList<OrderItem>();

	private int from = 0;
	private int size = 20;

	public CommonQueryParams() {
		selectColumns=new ArrayList<FieldItem>();
		FieldItem item=new FieldItem();
		item.setEsFieldName("_id");
		item.setFamilyName("cf");
		item.setTitle("rowId");
		item.setFieldName("_id");
		selectColumns.add(item);
		
	}

	public CommonQueryParams(String htableName, String esIndexName, String esTypeName, List<FieldItem> selectColumns, List<WhereListParam> whereListParams, List<WhereFieldParam> wildFieldParams,
			List<WhereFieldParam> exactFieldParams, List<OrderItem> orderItems, int from, int size) {
		this.htableName = htableName;
		this.esIndexName = esIndexName;
		this.esTypeName = esTypeName;
		this.selectColumns = selectColumns;
		this.whereListParams = whereListParams;
		this.wildFieldParams = wildFieldParams;
		this.exactFieldParams = exactFieldParams;
		this.orderItems = orderItems;
		this.from = from;
		this.size = size;
	}


	public String getHtableName() {
		return htableName;
	}

	public void setHtableName(String htableName) {
		this.htableName = htableName;
	}

	public String getEsIndexName() {
		return esIndexName;
	}

	public void setEsIndexName(String esIndexName) {
		this.esIndexName = esIndexName;
	}

	public String getEsTypeName() {
		return esTypeName;
	}

	public void setEsTypeName(String esTypeName) {
		this.esTypeName = esTypeName;
	}

	public List<FieldItem> getSelectColumns() {
		return selectColumns;
	}

	public void setSelectColumns(List<FieldItem> selectColumns) {
		this.selectColumns = selectColumns;
	}

	public List<WhereListParam> getWhereListParams() {
		return whereListParams;
	}

	public void setWhereListParams(List<WhereListParam> whereListParams) {
		this.whereListParams = whereListParams;
	}

	public List<WhereFieldParam> getWildFieldParams() {
		return wildFieldParams;
	}

	public void setWildFieldParams(List<WhereFieldParam> wildFieldParams) {
		this.wildFieldParams = wildFieldParams;
	}

	public List<WhereFieldParam> getExactFieldParams() {
		return exactFieldParams;
	}

	public void setExactFieldParams(List<WhereFieldParam> exactFieldParams) {
		this.exactFieldParams = exactFieldParams;
	}

	public List<OrderItem> getOrderItems() {
		return orderItems;
	}

	public void setOrderItems(List<OrderItem> orderItems) {
		this.orderItems = orderItems;
	}

	public int getFrom() {
		return from;
	}

	public void setFrom(int from) {
		this.from = from;
	}

	public int getSize() {
		return size;
	}

	public void setSize(int size) {
		this.size = size;
	}
	

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		CommonQueryParams params = new CommonQueryParams();
		params.setHtableName("User_Figure");
		params.setEsIndexName("userfigure");
		params.setEsTypeName("T_User_Figure");
		WhereListParam paramw = new WhereListParam();
		paramw.setFieldName("bigAppId");
		List<String> pvs = new ArrayList<String>();
		pvs.add("1");
		pvs.add("2");
		paramw.setParamValues(pvs);
		paramw.setType(0);
		List<WhereListParam> wps = new ArrayList<WhereListParam>();
		wps.add(paramw);
		WhereListParam paramw2 = new WhereListParam();
		paramw2.setFieldName("regTime");
		paramw2.setIsRange(1);
		paramw2.setFormat("yyyy-MM-dd HH:mm:ss.sss");
		List<String> pvs2 = new ArrayList<String>();
		pvs2.add("2015-04-04 00:00:00.000/2015-06-09 00:00:00.000");
		pvs2.add("2015-10-10 00:00:00.000/2015-10-24 00:00:00.000");
		paramw2.setParamValues(pvs2);
		paramw2.setType(2);
		wps.add(paramw2);
		params.setWhereListParams(wps);
		List<WhereFieldParam> wfps = new ArrayList<WhereFieldParam>();
		WhereFieldParam fp1 = new WhereFieldParam();
		fp1.setFieldName("regCity");
		fp1.setParamValue("杭州市");
		wfps.add(fp1);
		params.setExactFieldParams(wfps);
		params.setWildFieldParams(wfps);
		FieldItem item=new FieldItem();
		item.setFamilyName("profile");
		item.setFieldName("userId");
		item.setEsFieldName("userId");
		item.setTitle("用户ID");
		item.setType(1);
		params.getSelectColumns().add(item);
		OrderItem oitem=new OrderItem();
		oitem.setOrderFieldName("regTime");
		oitem.setOrder("asc");
		params.getOrderItems().add(oitem);
		ObjectMapper om=new ObjectMapper();
		try {
			System.out.println(om.writeValueAsString(params));
		}  catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public QueryBuilder toQueryBuilder(){
		BoolQueryBuilder qb=QueryBuilders.boolQuery();
		for (WhereListParam listParam : whereListParams) {
			if (listParam.getIsRange() == 1) {// 是range查询
				if (listParam.getParamValues().size() > 1) {// 多个范围查询段，使用bool嵌套should时间
					BoolQueryBuilder qbRange=QueryBuilders.boolQuery();
					for (String paramValues : listParam.getParamValues()) {
						String[] paramValueRange = paramValues.split("/");
						// 范围类型参数处理：
						RangeQueryBuilder rqb=QueryBuilders.rangeQuery(listParam.getFieldName());
						rqb.gte(paramValueRange[0]);
						rqb.lt(paramValueRange[1]);
						qbRange.should(rqb);
					}
					qb.must(qbRange);
				} else if (listParam.getParamValues().size() == 1) {// 1个范围查询段,直接RangeQueryBuilder
					String[] logDateRange = listParam.getParamValues().get(0).split("/");
					// 范围类型参数处理：
					RangeQueryBuilder rqb=QueryBuilders.rangeQuery(listParam.getFieldName());
					rqb.gte(logDateRange[0]);
					rqb.lt(logDateRange[1]);
					qb.must(rqb);
				}
			} else {
				if (listParam.getParamValues().size() > 0) {
					TermsQueryBuilder tqb=QueryBuilders.termsQuery(listParam.getFieldName(), listParam.getParamValues());
					qb.must(tqb);
				}
			}
		}
		for (WhereFieldParam fieldParam : wildFieldParams) {
			qb.must(QueryBuilders.wildcardQuery(fieldParam.getFieldName(), fieldParam.getParamValue()));
		}
		for (WhereFieldParam fieldParam : exactFieldParams) {
			qb.must(QueryBuilders.termQuery(fieldParam.getFieldName(), QueryParser.escape(fieldParam.getParamValue())));
		}
		for (WhereFieldParam fieldParam : missFieldParams) {
			ExistsQueryBuilder existsBuilder =QueryBuilders.existsQuery(fieldParam.getFieldName());
			qb.mustNot(existsBuilder);
		}
		return qb;
	}

	public String toQueryString() {
		StringBuffer sb = new StringBuffer();
		sb.append("{");
		sb.append("\"bool\":{ ");
		int i = 0;
		sb.append("\"must\":[");
		for (WhereListParam listParam : whereListParams) {
			if (listParam.getIsRange() == 1) {// 是range查询
				if (listParam.getParamValues().size() > 1) {// 多个范围查询段，使用bool嵌套should时间
					if (i > 0) {
						sb.append(",");
					}
					sb.append(" {\"bool\": {\"should\": [");
					int j=0;
					for (String paramValues : listParam.getParamValues()) {
						String[] paramValueRange = paramValues.split("/");
						if (j > 0) {
							sb.append(",");
						}
						sb.append(" {");
						// 范围类型参数处理：
						sb.append("\"range\":{\"" + listParam.getFieldName() + "\":{");
						sb.append("\"gte\": \"" + paramValueRange[0] + "\",");
						sb.append("\"lt\": \"" + paramValueRange[1] + "\"");
						sb.append("}");
						sb.append("}");
						sb.append("}");
						j++;
					}
					sb.append("]}}");
					i++;
				} else if (listParam.getParamValues().size() == 1) {// 1个范围查询段,直接方位
					String[] logDateRange = listParam.getParamValues().get(0).split("/");
					if (i > 0) {
						sb.append(",");
					}
					sb.append(" {");
					// 范围类型参数处理：
					sb.append("\"range\":{\"" + listParam.getFieldName() + "\":{");
					sb.append("\"gte\": \"" + logDateRange[0] + "\",");
					sb.append("\"lt\": \"" + logDateRange[1] + "\"");
					sb.append("}");
					sb.append("}");
					sb.append("}");
					i++;
				}
			} else {
				if (listParam.getParamValues().size() > 0) {
					if (i > 0) {
						sb.append(",");
					}
					sb.append(" {");
					sb.append("\"terms\":{\"" + listParam.getFieldName() + "\":[");
					i = 0;
					for (String tchannel : listParam.getParamValues()) {
						if (i > 0) {
							sb.append(",");
						}
						sb.append("\"" + tchannel + "\"");
						i++;
					}
					sb.append("]");
					sb.append("}");
					sb.append("}");
					i++;
				}
			}

		}

		for (WhereFieldParam fieldParam : wildFieldParams) {
			if (i > 0) {
				sb.append(",");
			}
			sb.append(" {");
			sb.append("\"wildcard\":{\"" + fieldParam.getFieldName() + "\":\"" + QueryParser.escape(fieldParam.getParamValue()) + "\"}");
			sb.append("}");
			i++;
		}
		for (WhereFieldParam fieldParam : exactFieldParams) {
			if (i > 0) {
				sb.append(",");
			}
			sb.append(" {");
			sb.append("\"match\":{\"" + fieldParam.getFieldName() + "\":\"" +QueryParser.escape(fieldParam.getParamValue()) + "\"}");
			sb.append("}");
			i++;
		}
		for (WhereFieldParam fieldParam : missFieldParams) {
			if (i > 0) {
				sb.append(",");
			}
			sb.append(" {");
			sb.append("\"constant_score\":{\"filter\": {\"missing\": {\"field\": \"" + fieldParam.getFieldName() + "\"}}}");
			sb.append("}");
			i++;
		}
		sb.append("]");
		sb.append("}");
		sb.append("}");
		log.debug(sb.toString());
		return sb.toString();
	}
}
