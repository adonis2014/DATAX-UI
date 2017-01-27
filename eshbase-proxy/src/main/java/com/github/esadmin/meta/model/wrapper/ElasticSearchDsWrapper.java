package com.github.esadmin.meta.model.wrapper;

import org.springframework.util.StringUtils;

import com.github.esadmin.meta.model.DataSourceWrapper;

public class ElasticSearchDsWrapper extends DataSourceWrapper {

	private String url;

	public String getUrl() {
		if (this.getPropertyValue("httpNodes")!=null){
			String[] httpNodes=StringUtils.split(getPropertyValue("httpNodes"), ",");
			url="base_uri=http://"+httpNodes[0]+"/";
		}
		if (this.getPropertyValue("shield_user")!=null && this.getPropertyValue("shield_password")!=null){
			url=url+ "&auth_user="+getPropertyValue("shield_user")+"&auth_password="+getPropertyValue("shield_password");
		}
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}
	
	
	
}
