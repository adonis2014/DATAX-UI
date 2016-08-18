package com.taobao.datax.common.plugin;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.apache.commons.lang.math.NumberUtils;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.taobao.datax.common.model.AggregationRecord;
import com.taobao.datax.common.model.DataProcessField;
import com.taobao.datax.common.util.ETLDateUtils;
import com.taobao.datax.common.util.ETLStringUtils;

public class LogTimeHourDAColumnProc implements ColumnValueProc {

	private static ObjectMapper mapper = new ObjectMapper();

	@Override
	public String procFieldValue(AggregationRecord record, Map<String, String> curRow, DataProcessField field) {
		return "";
	}

	@Override
	public Object procAggRecord(AggregationRecord curRecord, AggregationRecord orirecord, DataProcessField field) {
		String fieldValue = (String) orirecord.getValue(field.getColumnName());
		if (fieldValue == null)
			fieldValue = "";
		Object curFieldValue = curRecord.getValue(field.getColumnName());
		if (curFieldValue == null)
			curFieldValue = "";
		if (ETLStringUtils.isNotEmpty(fieldValue)) {
			List<Map<String, Object>> jset = (List<Map<String, Object>>) curFieldValue;
			List<Map<String, Object>> oriJset = null;
			try {
				oriJset = mapper.readValue(fieldValue, new TypeReference<List<Map<String, Object>>>() {
				});
			} catch (IOException e) {
				e.printStackTrace();
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
			return jset;
		}
		return "";
	}

	@Override
	public Object aggFieldValue(AggregationRecord record, Map<String, String> curRow, DataProcessField field) {
		String fieldValue = ETLDateUtils.formatDate(ETLDateUtils.parseDate(curRow.get(field.getColumnName()), "yyyy-MM-dd HH:mm:ss sss"), "yyyyMMddHH");
		if (ETLStringUtils.isNotEmpty(fieldValue )) {
			if (record.getRowNum() == 1) {
				List<Map<String, Object>> jset = new ArrayList<Map<String, Object>>();
				Map<String, Object> row = new ConcurrentHashMap<String, Object>();
				row.put(field.getColumnName(), fieldValue);
				row.put("count", 1);
				jset.add(row);
				return jset;
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
				return jset;
			}
		}
		return "";
	}

}
