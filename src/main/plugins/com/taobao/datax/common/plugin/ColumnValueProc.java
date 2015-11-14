package com.taobao.datax.common.plugin;

import java.util.Map;

import com.taobao.datax.common.model.AggregationRecord;
import com.taobao.datax.common.model.DataProcessField;

/**
 * 字段值处理接口
 * 
 * @author admin
 * 
 */
public interface ColumnValueProc {
	
	 
	
	/**
	 * 自定义代码实现 处理字段值
	 * 
	 * @param record
	 * @param curRow
	 * @param field
	 * @return
	 */
	public String procFieldValue(AggregationRecord record, Map<String, String> curRow, DataProcessField field);

	/**
	 * 自定义代码实现聚合2个聚合记录
	 * 
	 * @param curRecord
	 * @param orirecord
	 * @param field
	 * @return
	 */
	public Object procAggRecord(AggregationRecord curRecord, AggregationRecord orirecord, DataProcessField field);

	public Object aggFieldValue(AggregationRecord record, Map<String, String> curRow, DataProcessField field);
}
