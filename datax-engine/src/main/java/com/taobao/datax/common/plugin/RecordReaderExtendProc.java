package com.taobao.datax.common.plugin;


public interface RecordReaderExtendProc {
	/**
	 * 根据提供的当前行数据，获取扩展字段集合
	 * 
	 * @param currLine
	 * @return
	 */
	public Line extendRow(Line currLine);

}
