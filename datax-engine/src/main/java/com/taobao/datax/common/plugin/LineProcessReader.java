package com.taobao.datax.common.plugin;

/**
 * 读取插件过滤执行，在sendling发送数据前执行
 * 
 * @author zhangxuhui
 *
 */
public interface LineProcessReader {
	/**
	 * 读取插件
	 * 
	 * @param line
	 * @return
	 */
	public boolean execute(Line line);

	/**
	 * 从plugin配置读取配置参数
	 * 
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
