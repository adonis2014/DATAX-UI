package net.iharding.modules.job.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.iharding.modules.meta.model.MetaProperty;
/**
 * 调度任务设置类扩展
 * @author admin
 *
 */
public class JobFlowWrapper extends JobFlow {

	private Map<String, String> properties = new HashMap<String, String>();

	/**
	 * 将数据库中配置属性批量设置到map中
	 * 
	 * @param propers
	 */
	public void addProperties(List<MetaProperty> propers) {
		for (MetaProperty property : propers) {
			properties.put(property.getPropertyKey(), property.getPropertyValue());
		}
	}

	public void putProperty(String key, String value) {
		properties.put(key, value);
	}

	public String getProperty(String key) {
		return properties.get(key);
	}
}
