package net.iharding.modules.meta.model;

import java.util.List;

public class DataSourceWrapper extends DataSource {

	private List<MetaProperty> properties;

	public List<MetaProperty> getProperties() {
		return properties;
	}

	public void setProperties(List<MetaProperty> properties) {
		this.properties = properties;
	}
	
	
}
