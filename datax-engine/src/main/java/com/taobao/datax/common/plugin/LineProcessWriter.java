package com.taobao.datax.common.plugin;

/**
 * 写插件过滤执行，在写入数据前执行
 * 
 * @author zhangxuhui
 *
 */
public interface LineProcessWriter {
	/**
	 * 处理写入插件之间执行，返回true or flase
	 * 
	 * @param line
	 * @return
	 */
	public boolean execute(Line line);
	
	/**
	 * 从plugin配置读取配置参数
	 * @param param
	 * @return
	 */
	public boolean init(PluginParam param);
	
	/**
	 * 完成后处理
	 * 
	 * @return
	 */
	public int finish();
}
