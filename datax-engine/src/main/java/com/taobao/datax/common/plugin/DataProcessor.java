package com.taobao.datax.common.plugin;

import java.util.List;
import java.util.Map;

import com.taobao.datax.common.model.AggregationRecord;
import com.taobao.datax.common.util.ETLStringUtils;

/**
 * 数据处理器，预统计，按照条件清洗等
 * 
 * @author zhangxuhui
 * 
 */
public abstract class DataProcessor extends AbstractPlugin  {

	/**
	 * Do Initialize work before process data.
	 * 
	 * @return 0 for OK, others for failure.
	 * 
	 * */
	public void init() {

	}

	/**
	 * 返回处理后的line集合
	 * 
	 * @return
	 */
	public abstract Map<String, AggregationRecord> getLines(List<Line> lines);

	/**
	 * 合并已有数据，保存或者更新记录
	 * 
	 * @param rows
	 * @return
	 */
	public abstract int saveOrUpdate(Map<String, AggregationRecord> rows);

	/**
	 * 获取组合rowid
	 * 
	 * @param rowKeyColumns
	 * @return
	 */
	public String getRowIdFromCloumn(List<String> rowKeyColumns) {
		return ETLStringUtils.getHbaseRowId(rowKeyColumns);
	}
}
