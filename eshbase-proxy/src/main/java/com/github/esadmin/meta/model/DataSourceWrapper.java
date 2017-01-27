package com.github.esadmin.meta.model;

import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang.StringUtils;

import com.github.eswrapper.util.Constants;


public class DataSourceWrapper extends DataSource {

	public DataSourceWrapper() {

	}
	
	private String url;

	public String getUrl(String baseuri,String user,String password) {
		if (this.getDbType()==1){
			if (StringUtils.isNotEmpty(getPropertyValue(Constants.ES_SHIELD_HTTPNODES))){
				String[] httpNodes=StringUtils.split(getPropertyValue(Constants.ES_SHIELD_HTTPNODES), ",");
				url=baseuri+"="+URLEncoder.encode("http://"+httpNodes[0]+"/");
			}
			if (StringUtils.isNotEmpty(getPropertyValue(Constants.ES_SHIELD_USER)) && StringUtils.isNotEmpty(getPropertyValue(Constants.ES_SHIELD_PASSWORD))){
				url=url+ "&"+user+"="+getPropertyValue(Constants.ES_SHIELD_USER)+"&"+password+"="+getPropertyValue(Constants.ES_SHIELD_PASSWORD);
			}
		}
		return url;
	}
	
	public String getPluginUrl(String pluginName,String user,String password) {
		if (this.getDbType()==1){
			if (StringUtils.isNotEmpty(getPropertyValue(Constants.ES_SHIELD_HTTPNODES))){
				String[] httpNodes=StringUtils.split(getPropertyValue(Constants.ES_SHIELD_HTTPNODES), ",");
				url="http://"+httpNodes[0]+"/_plugin/"+pluginName;
			}
			if (StringUtils.isNotEmpty(getPropertyValue(Constants.ES_SHIELD_USER)) && StringUtils.isNotEmpty(getPropertyValue(Constants.ES_SHIELD_PASSWORD))){
				url=url+ "?"+user+"="+getPropertyValue(Constants.ES_SHIELD_USER)+"&"+password+"="+getPropertyValue(Constants.ES_SHIELD_PASSWORD);
			}
		}
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
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
