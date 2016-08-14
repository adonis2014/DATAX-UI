package com.taobao.datax.common.plugin;

import java.util.Map;

import com.taobao.datax.common.model.AggregationRecord;
import com.taobao.datax.common.model.DataProcessEntity;

public interface RecordValueProc {

	/**
	 * 记录行最后执行方法，在聚合等操作完成后
	 * 
	 * @param aggRows
	 * @param curRow
	 * @param fields
	 */
	public void endProcRow(Map<String, AggregationRecord> aggRows, AggregationRecord curRow, DataProcessEntity dpEntity);

	/**
	 * 记录行初始执行方法，在获取reader行数据后
	 * 
	 * @param aggRows
	 * @param curRow
	 * @param fields
	 */
	public void initRow(Map<String, AggregationRecord> aggRows, Map<String, String> curRow, DataProcessEntity dpEntity);

}
