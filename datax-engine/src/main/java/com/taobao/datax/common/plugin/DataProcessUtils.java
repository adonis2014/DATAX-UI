package com.taobao.datax.common.plugin;

import java.io.IOException;
import java.io.StringWriter;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.lang.math.NumberUtils;
import org.apache.velocity.VelocityContext;
import org.apache.velocity.app.VelocityEngine;
import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.type.TypeReference;

import com.taobao.datax.common.model.AggregationRecord;
import com.taobao.datax.common.model.DataProcessField;
import com.taobao.datax.common.util.ETLConstants;
import com.taobao.datax.common.util.ETLDateUtils;
import com.taobao.datax.common.util.ETLStringUtils;

public class DataProcessUtils {

	private static VelocityEngine ve = new VelocityEngine();
	private static ObjectMapper mapper = new ObjectMapper();
	static {
		ve.init();
	}

	/**
	 * 按照函数和脚本获取处理结果值
	 * 
	 * @param fieldValue
	 * @param functionName
	 * @param script
	 * @return
	 */
	public static String processValue(AggregationRecord record, Map<String, String> curRow, DataProcessField field) {
		if (ETLStringUtils.isEmpty(field.getFunctionName()) && ETLStringUtils.isEmpty(field.getScript())) {
			return curRow.get(field.getColumnName());
		} else {
			// 如果有脚本处理，优先处理脚本的值
			if (ETLStringUtils.isNotEmpty(field.getScript())) {
				VelocityContext velocityContext = new VelocityContext();
				velocityContext.put("StringUtils", new ETLStringUtils());
				velocityContext.put("DateUtils", new ETLDateUtils());
				velocityContext.put("curRow", curRow);
				velocityContext.put("curRecord", record);
				velocityContext.put("curField", field);
				StringWriter sw = new StringWriter();
				ve.evaluate(velocityContext, sw, "", field.getScript());
				curRow.put(field.getColumnName(), sw.toString());
			}
			if ("to_date".equalsIgnoreCase(field.getFunctionName())) {
				return ETLDateUtils.formatDate(ETLDateUtils.parseDate(curRow.get(field.getColumnName()), "yyyy-MM-dd HH:mm:ss SSS"), ETLConstants.DATE_ONLY_FORMAT);
			} else if ("to_hour".equalsIgnoreCase(field.getFunctionName())) {
				return ETLDateUtils.formatDate(ETLDateUtils.parseDate(curRow.get(field.getColumnName()), "yyyy-MM-dd HH:mm:ss SSS"), "HH");
			} else if ("to_miniute".equalsIgnoreCase(field.getFunctionName())) {
				return ETLDateUtils.formatDate(ETLDateUtils.parseDate(curRow.get(field.getColumnName()), "yyyy-MM-dd HH:mm:ss SSS"), "HH:mm");
			}  else if ("custProc".equalsIgnoreCase(field.getFunctionName())) {// 调用第三方类接口
				try {
					ColumnValueProc cvProc = (ColumnValueProc) Class.forName(field.getClassName()).newInstance();
					return cvProc.procFieldValue(record, curRow, field);
				} catch (Exception e) {
					e.printStackTrace();
					return "";
				}
			} else {
				return curRow.get(field.getColumnName());
			}
		}
	}

	/**
	 * 聚合记录计算
	 * 
	 * @param record
	 * @param checkAndGetField
	 * @param field
	 */
	public static void aggValue(AggregationRecord record, Map<String, String> curRow, DataProcessField field) {
		String fieldValue = curRow.get(field.getColumnName());
		if (ETLStringUtils.isEmpty(field.getFunctionName()) && ETLStringUtils.isEmpty(field.getScript())) {
			record.putValue(field.getColumnName(), fieldValue);
		} else {
			// 如果有脚本处理，优先处理脚本的值
			if (ETLStringUtils.isNotEmpty(field.getScript())) {
				VelocityContext velocityContext = new VelocityContext();
				velocityContext.put("StringUtils", new ETLStringUtils());
				velocityContext.put("DateUtils", new ETLDateUtils());
				velocityContext.put("curRow", curRow);
				velocityContext.put("curRecord", record);
				velocityContext.put("curField", field);
				velocityContext.put("isRow", "true");
				StringWriter sw = new StringWriter();
				ve.evaluate(velocityContext, sw, "", field.getScript());
				curRow.put(field.getColumnName(), sw.toString());
			}
			switch (field.getFunctionName()){
			case "primaryKey":{// 直接读取主键
				record.putValue(field.getColumnName(), record.getRowKey());
				break;
			} case "rowNum":{// 直接读取主键
				record.putValue(field.getColumnName(), record.getRowNum());
				break;
			} case "aggRowNum":{// 直接读取主键
				record.putValue(field.getColumnName(), record.getAggRowNum());
				break;
			} case "count":{// 计数
				if (record.getValue(field.getColumnName()) == null) {
					record.putValue(field.getColumnName(), 1);
				} else {
					record.putValue(field.getColumnName(), "" + (NumberUtils.toInt(record.getValue(field.getColumnName()).toString(), 0) + 1));
				}
				break;
			} case "sum":{// 求和
				if (record.getValue(field.getColumnName()) == null) {
					record.putValue(field.getColumnName(), NumberUtils.toFloat(fieldValue));
				} else {
					record.putValue(field.getColumnName(), "" + (NumberUtils.toFloat(record.getValue(field.getColumnName()).toString(), 0) + NumberUtils.toFloat(fieldValue)));
				}
				break;
			} case "avg":{// 求平均值
				if (record.getValue(field.getColumnName()) == null) {
					record.putValue(field.getColumnName(), NumberUtils.toFloat(fieldValue));
				} else {
					record.putValue(field.getColumnName(),
							"" + (NumberUtils.toFloat(record.getValue(field.getColumnName()).toString(), 0) * (record.getAggRowNum() - 1) + NumberUtils.toFloat(fieldValue)) / record.getAggRowNum());
				}
				break;
			} case "max":{// 最大值
				if (record.getValue(field.getColumnName()) == null) {
					record.putValue(field.getColumnName(), fieldValue);
				} else {
					String rvalue = record.getValue(field.getColumnName()).toString();
					if (NumberUtils.isNumber(rvalue)) {
						if (NumberUtils.toFloat(rvalue) < NumberUtils.toFloat(fieldValue)) {
							record.putValue(field.getColumnName(), fieldValue);
						}
					} else {
						if (rvalue.compareTo(fieldValue) < 0 && StringUtils.isEmpty(fieldValue)) {
							record.putValue(field.getColumnName(), fieldValue);
						}
					}
				}
				break;
			} case "min":{// 最小值
				if (record.getValue(field.getColumnName()) == null) {
					record.putValue(field.getColumnName(), fieldValue);
				} else {
					String rvalue = record.getValue(field.getColumnName()).toString();
					if (NumberUtils.isNumber(rvalue)) {
						if (NumberUtils.toFloat(rvalue) > NumberUtils.toFloat(fieldValue)) {
							record.putValue(field.getColumnName(), fieldValue);
						}
					} else {
						if (rvalue.compareTo(fieldValue) > 0) {
							record.putValue(field.getColumnName(), fieldValue);
						}
					}
				}
				break;
			} case "firstValue":{// 第一个值
				if (record.getRowNum() == 1) {
					record.putValue(field.getColumnName(), fieldValue);
				}
				break;
			} case "lastValue":{// 最后一个值
				record.putValue(field.getColumnName(), fieldValue);
				break;
			} case "firstNoNull":{// 第一个非null值
				if (ETLStringUtils.isEmpty(record.getValue(field.getColumnName()).toString()) && ETLStringUtils.isNotEmpty(fieldValue)) {
					record.putValue(field.getColumnName(), fieldValue);
				}
				break;
			} case "lastNoNull":{// 最后一个非null值
				if (ETLStringUtils.isNotEmpty(fieldValue)) {
					record.putValue(field.getColumnName(), fieldValue);
				}
				break;
			} case "joinAsString":{// 合并字符串，间隔
				if (record.getRowNum() == 1) {
					record.putValue(field.getColumnName(), fieldValue);
				} else {
					record.putValue(field.getColumnName(), record.getValue(field.getColumnName()) + "," + fieldValue);
				}
				break;
			} case "joinAsList":{// 合并字符串为LIST集合
				if (record.getRowNum() == 1) {
					List<String> jlist = new ArrayList<String>();
					jlist.add(fieldValue);
					record.putValue(field.getColumnName(), jlist);
				} else {
					List<String> jlist = (List<String>) record.getValue(field.getColumnName());
					jlist.add(fieldValue);
					record.putValue(field.getColumnName(), jlist);
				}
				break;
			} case "joinAsSet":{// 合并字符串为Set去重集合
				if (record.getRowNum() == 1) {
					Set<String> jset = new HashSet<String>();
					jset.add(fieldValue);
					record.putValue(field.getColumnName(), jset);
				} else {
					Set<String> jset = (Set<String>) record.getValue(field.getColumnName());
					jset.add(fieldValue);
					record.putValue(field.getColumnName(), jset);
				}
				break;
			} case "joinAsListMap":{// 合并字符串为Set去重集合
				if (record.getRowNum() == 1) {
					List<Map<String, Object>> jset = new ArrayList<Map<String, Object>>();
					Map<String, Object> row = new ConcurrentHashMap<String, Object>();
					row.put(field.getColumnName(), fieldValue);
					row.put("count", 1);
					jset.add(row);
					record.putValue(field.getColumnName(), jset);
				} else {
					List<Map<String, Object>> jset = (List<Map<String, Object>>) record.getValue(field.getColumnName());
					Map<String, Object> row = null;
					for (Map<String, Object> curtRow : jset) {
						if (curtRow.get(field.getColumnName()).toString().equalsIgnoreCase(fieldValue)) {
							row = curtRow;
							break;
						}
					}
					if (row != null) {
						row.put("count", (NumberUtils.toInt(row.get("count").toString()) + 1));
					} else {
						row = new ConcurrentHashMap<String, Object>();
						row.put(field.getColumnName(), fieldValue);
						row.put("count", 1);
						jset.add(row);
					}
					record.putValue(field.getColumnName(), jset);
				}
				break;
			} case "joinAsRangeMap":{// 合并统计按照参数范围合并
				if (record.getRowNum() == 1) {
					List<Map<String, Object>> jset = new ArrayList<Map<String, Object>>();
					Map<String, Object> row = new ConcurrentHashMap<String, Object>();
					row.put(field.getColumnName(), getRangValue(field, fieldValue));
					row.put("count", 1);
					jset.add(row);
					record.putValue(field.getColumnName(), jset);
				} else {
					String range = getRangValue(field, fieldValue);
					List<Map<String, Object>> jset = (List<Map<String, Object>>) record.getValue(field.getColumnName());
					Map<String, Object> row = null;
					for (Map<String, Object> curtRow : jset) {
						if (curtRow.get(field.getColumnName()).toString().equalsIgnoreCase(range)) {
							row = curtRow;
							break;
						}
					}
					if (row != null) {
						row.put("count", (NumberUtils.toInt(row.get("count").toString()) + 1));
					} else {
						row = new ConcurrentHashMap<String, Object>();
						row.put(field.getColumnName(), range);
						row.put("count", 1);
						jset.add(row);
					}
					record.putValue(field.getColumnName(), jset);
				}
				break;
			} case "custProc":{// 调用第三方类接口
				try {
					ColumnValueProc cvProc = (ColumnValueProc) Class.forName(field.getClassName()).newInstance();
					record.putValue(field.getColumnName(), cvProc.aggFieldValue(record, curRow, field));
				} catch (Exception e) {
					e.printStackTrace();
				}
				break;
			}default:{
				break;
			}
			}
		}

	}

	private static String getRangValue(DataProcessField field, String fieldValue) {
		String[] ranges = StringUtils.split(field.getScript(), ",");
		for (String rg : ranges) {
			if (NumberUtils.toFloat(fieldValue) <= NumberUtils.toFloat(rg)) {
				return rg;
			}
		}
		return ranges[ranges.length - 1];
	}

	public static AggregationRecord aggRecord(AggregationRecord curRecord, AggregationRecord orirecord, List<DataProcessField> fields) {
		curRecord.setRowNum(curRecord.getRowNum() + orirecord.getRowNum());
		curRecord.setAggRowNum(curRecord.getAggRowNum() + orirecord.getAggRowNum());
		for (DataProcessField field : fields) {
			// 只需要计算聚合字段
			if (field.getFieldType() != ETLConstants.FIELD_TYPE_SUMMARY)
				continue;
			Object fv = orirecord.getValue(field.getColumnName());
			String fieldValue = "";
			if (fv != null) {
				fieldValue = fv.toString();
			}
			Object curFieldValue = curRecord.getValue(field.getColumnName());
			if (curFieldValue == null)
				curFieldValue = "";
			if (ETLStringUtils.isEmpty(field.getFunctionName()) && ETLStringUtils.isEmpty(field.getScript())) {
				curRecord.putValue(field.getColumnName(), fieldValue);
			} else {
				// 如果有脚本处理，优先处理脚本的值
				if (ETLStringUtils.isNotEmpty(field.getScript())) {
					VelocityContext velocityContext = new VelocityContext();
					velocityContext.put("StringUtils", new ETLStringUtils());
					velocityContext.put("DateUtils", new ETLDateUtils());
					velocityContext.put("oriRecord", orirecord);
					velocityContext.put("curRecord", curRecord);
					velocityContext.put("curField", field);
					velocityContext.put("isRow", "false");
					StringWriter sw = new StringWriter();
					ve.evaluate(velocityContext, sw, "", field.getScript());
					curRecord.putValue(field.getColumnName(), sw.toString());
				}
			switch (field.getFunctionName()) {
				case "primaryKey": {// 主键
					curRecord.putValue(field.getColumnName(), curRecord.getRowKey());
					break;
				}
				case "rowNum": {// 中记录数
					curRecord.putValue(field.getColumnName(), curRecord.getRowNum());
					break;
				}
				case "aggRowNum": {// 聚合记录数，直接读取
					curRecord.putValue(field.getColumnName(), curRecord.getAggRowNum());
					break;
				}
				case "count": {// 计数
					curRecord.putValue(field.getColumnName(), (NumberUtils.toInt(curFieldValue.toString()) + NumberUtils.toInt(fieldValue.toString())));
					break;
				}
				case "sum": {// 求和
					curRecord.putValue(field.getColumnName(), (NumberUtils.toFloat(curFieldValue.toString()) + NumberUtils.toFloat(fieldValue.toString())));
					break;
				}
				case "avg": {// 求平均值
					curRecord.putValue(
							field.getColumnName(),
							(NumberUtils.toFloat(curFieldValue.toString()) * (curRecord.getAggRowNum() - 1) + NumberUtils.toFloat(fieldValue.toString()) * orirecord.getAggRowNum())
									/ (curRecord.getAggRowNum() + orirecord.getAggRowNum()));
					break;
				}
				case "max": {// 最大值
					if (NumberUtils.isNumber(curFieldValue.toString())) {
						if (NumberUtils.toFloat(curFieldValue.toString()) < NumberUtils.toFloat(fieldValue.toString()) && StringUtils.isNotEmpty(fieldValue)) {
							curRecord.putValue(field.getColumnName(), fieldValue);
						}
					} else {
						if (curFieldValue.toString().compareTo(fieldValue.toString()) < 0 && StringUtils.isNotEmpty(fieldValue)) {
							curRecord.putValue(field.getColumnName(), fieldValue);
						}
					}
					break;
				}
				case "min": {// 最小值
					if (NumberUtils.isNumber(curFieldValue.toString())) {
						if (NumberUtils.toFloat(curFieldValue.toString()) > NumberUtils.toFloat(fieldValue.toString()) && StringUtils.isNotEmpty(fieldValue)) {
							curRecord.putValue(field.getColumnName(), fieldValue);
						}
					} else {
						if (curFieldValue.toString().compareTo(fieldValue.toString()) > 0 && StringUtils.isNotEmpty(fieldValue)) {
							curRecord.putValue(field.getColumnName(), fieldValue);
						}
					}
					break;
				}
				case "firstValue": {// 第一个值,取原始值
					if (StringUtils.isNotEmpty(fieldValue))
						curRecord.putValue(field.getColumnName(), fieldValue);
					break;
				}
				case "lastValue": {// 最后一个值,取当前记录值
				// curRecord.putValue(field.getColumnName(), fieldValue);
					break;
				}
				case "firstNoNull": {// 第一个非null值，取原始值
					if (ETLStringUtils.isNotEmpty(fieldValue.toString())) {
						curRecord.putValue(field.getColumnName(), fieldValue);
					}
					break;
				}
				case "lastNoNull": {// 最后一个非null值
					if (ETLStringUtils.isEmpty(curFieldValue.toString())) {
						curRecord.putValue(field.getColumnName(), fieldValue);
					}
					break;
				}
				case "joinString": {// 合并字符串，间隔
					if (curRecord.getRowNum() == 1) {
						curRecord.putValue(field.getColumnName(), fieldValue);
					} else {
						if (StringUtils.isNotEmpty(curFieldValue.toString()) && StringUtils.isNotEmpty(fieldValue)) {
							curRecord.putValue(field.getColumnName(), curFieldValue + "," + fieldValue);
						} else {
							curRecord.putValue(field.getColumnName(), fieldValue);
						}
					}
					break;
				}
				case "joinAsList": {// 合并字符串为LIST集合
					if (fieldValue != null) {
						List<String> jlist = (List<String>) curFieldValue;
						List<String> oriList = null;
						try {
							if (ETLStringUtils.isNotEmpty(fieldValue))
								oriList = mapper.readValue(fieldValue, new TypeReference<List<String>>() {
								});
						} catch (IOException e) {
							e.printStackTrace();
						}
						if (oriList != null)
							jlist.addAll(oriList);
						curRecord.putValue(field.getColumnName(), jlist);
					}
					break;
				}
				case "joinAsSet": {// 合并字符串为Set去重集合
					if (fieldValue != null) {
						Set<String> jset = (Set<String>) curFieldValue;
						Set<String> oriset = null;
						try {
							if (ETLStringUtils.isNotEmpty(fieldValue))
								oriset = mapper.readValue(fieldValue, new TypeReference<Set<String>>() {
								});
						} catch (IOException e) {
							e.printStackTrace();
						}
						if (oriset != null)
							jset.addAll(oriset);
						curRecord.putValue(field.getColumnName(), jset);
					}
					break;
				}
				case "joinAsListMap": {// 合并字符串为map并统计
					if (fieldValue != null) {
						List<Map<String, Object>> jset = (List<Map<String, Object>>) curFieldValue;
						List<Map<String, Object>> oriJset = null;
						try {
							if (ETLStringUtils.isNotEmpty(fieldValue)) {
								oriJset = mapper.readValue(fieldValue, new TypeReference<List<Map<String, Object>>>() {
								});
							}
						} catch (Exception e) {
							e.printStackTrace();
							System.out.println("fieldValue:" + fieldValue);
						}
						if (oriJset != null) {
							for (Map<String, Object> curtRow : jset) {
								for (Map<String, Object> oriRow : oriJset) {
									if (curtRow.get(field.getColumnName()).toString().equalsIgnoreCase(oriRow.get(field.getColumnName()).toString())) {// 同一个类型聚合
										curtRow.put("count", (int) curtRow.get("count") + (int) oriRow.get("count"));
										oriJset.remove(oriRow);
										break;
									}
								}
							}
							jset.addAll(oriJset);
						}
						curRecord.putValue(field.getColumnName(), jset);
					}
					break;
				}
				case "joinAsRangeMap": {// 合并字符串按照参数范围合并
					if (fieldValue != null) {
						List<Map<String, Object>> jset = (List<Map<String, Object>>) curFieldValue;
						List<Map<String, Object>> oriJset = null;
						try {
							if (ETLStringUtils.isNotEmpty(fieldValue)) {
								oriJset = mapper.readValue(fieldValue, new TypeReference<List<Map<String, Object>>>() {
								});
							}
						} catch (Exception e) {
							e.printStackTrace();
							System.out.println("fieldValue:" + fieldValue);
						}
						if (oriJset != null) {
							for (Map<String, Object> curtRow : jset) {
								for (Map<String, Object> oriRow : oriJset) {
									if (curtRow.get(field.getColumnName()).toString().equalsIgnoreCase(oriRow.get(field.getColumnName()).toString())) {// 同一个类型聚合
										curtRow.put("count", (int) curtRow.get("count") + (int) oriRow.get("count"));
									}
								}
							}
						}
						curRecord.putValue(field.getColumnName(), jset);
					}
					break;
				}
				case "custProc": {// 调用第三方类接口
					try {
						ColumnValueProc cvProc = (ColumnValueProc) Class.forName(field.getClassName()).newInstance();
						curRecord.putValue(field.getColumnName(), cvProc.procAggRecord(curRecord, orirecord, field));
					} catch (Exception e) {
						e.printStackTrace();
					}
					break;
				}
				default: {
					curRecord.putValue(field.getColumnName(), fieldValue);
					break;
				}
			}

			}
		}
		return curRecord;
	}

	public static String processPKValue(AggregationRecord record, Map<String, String> curRow, DataProcessField field) {
		if (ETLStringUtils.isEmpty(field.getPkFunctionName()) ) {
			return curRow.get(field.getColumnName());
		} else {
			if ("to_date".equalsIgnoreCase(field.getPkFunctionName())) {
				return ETLDateUtils.formatDate(ETLDateUtils.parseDate(curRow.get(field.getColumnName()), "yyyy-MM-dd HH:mm:ss SSS"), ETLConstants.DATE_ONLY_FORMAT);
			} else if ("to_hour".equalsIgnoreCase(field.getPkFunctionName())) {
				return ETLDateUtils.formatDate(ETLDateUtils.parseDate(curRow.get(field.getColumnName()), "yyyy-MM-dd HH:mm:ss SSS"), "HH");
			} else if ("to_miniute".equalsIgnoreCase(field.getPkFunctionName())) {
				return ETLDateUtils.formatDate(ETLDateUtils.parseDate(curRow.get(field.getColumnName()), "yyyy-MM-dd HH:mm:ss SSS"), "HH:mm");
			} else if ("reverse".equalsIgnoreCase(field.getPkFunctionName())) {
				return StringUtils.reverse(curRow.get(field.getColumnName()));
			} else if ("custProc".equalsIgnoreCase(field.getPkFunctionName())) {// 调用第三方类接口
				try {
					ColumnValueProc cvProc = (ColumnValueProc) Class.forName(field.getClassName()).newInstance();
					return cvProc.procFieldValue(record, curRow, field);
				} catch (Exception e) {
					e.printStackTrace();
					return "";
				}
			} else {
				return curRow.get(field.getColumnName());
			}
		}
	}

}
