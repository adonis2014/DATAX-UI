package net.iharding.modules.meta.model;

import java.util.ArrayList;
import java.util.List;


public class DataSourceWrapper extends DataSource {
	public DataSourceWrapper() {

	}
	
	public DataSourceWrapper(DataSource ds) {
		this.setCheckLabel(ds.getCheckLabel());
		this.setCreateDate(ds.getCreateDate());
		this.setCreater(ds.getCreater());
		this.setDatabases(ds.getDatabases());
		this.setDbType(ds.getDbType());
		this.setDsName(ds.getDsName());
		this.setId(ds.getId());
		this.setRemark(ds.getRemark());
		this.setSchemaName(ds.getSchemaName());
		this.setUpdateDate(ds.getUpdateDate());
		this.setUpdater(ds.getUpdater());
	}

	private List<MetaProperty> properties;

	public List<MetaProperty> getProperties() {
		return properties;
	}

	public void setProperties(List<MetaProperty> properties) {
		this.properties = properties;
	}
	
	public void addMetaProperty(MetaProperty mp) {
		if (properties == null) {
			properties = new ArrayList<MetaProperty>();
		}
		properties.add(mp);
	}

	public String getPropertyValue(String key) {
		if (properties != null) {
			for (MetaProperty mp : properties) {
				if (mp.getPropertyKey().equalsIgnoreCase(key)) {
					return mp.getPropertyValue();
				}
			}
		}
		return null;
	}
}
