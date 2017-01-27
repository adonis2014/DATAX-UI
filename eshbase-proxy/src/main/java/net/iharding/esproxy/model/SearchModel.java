package net.iharding.esproxy.model;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by yuxuefeng on 15/9/16.
 */
public class SearchModel {
    private String requestURI;
    private String queryStr;
    private String requestData;
    private HttpServletRequest request;
    private String contextPath;
   
    

    public SearchModel(HttpServletRequest request) {
        this.request = request;
        this.contextPath=request.getContextPath();
    }

    public SearchModel(String requestURI, String queryStr, String requestData) {
        this.requestURI = requestURI;
        this.queryStr = queryStr;
        this.requestData = requestData;
    }
    
    public String getEsPath(){
    	if ("/".equalsIgnoreCase(contextPath)||"".equalsIgnoreCase(contextPath)){
    		return request.getRequestURI();
    	}else{
    		return request.getRequestURI().replace(contextPath+"/es", "");
    	}
    }

    public String getContextPath() {
		return contextPath;
	}

	public void setContextPath(String contextPath) {
		this.contextPath = contextPath;
	}

	public String getRequestURI() {
        return requestURI;
    }

    public void setRequestURI(String requestURI) {
        this.requestURI = requestURI;
    }

    public String getQueryStr() {
        return queryStr;
    }

    public void setQueryStr(String queryStr) {
        this.queryStr = queryStr;
    }

    public String getRequestData() {
        return requestData;
    }

    public void setRequestData(String requestData) {
        this.requestData = requestData;
    }

    public HttpServletRequest getRequest() {
        return request;
    }

    public void setRequest(HttpServletRequest request) {
        this.request = request;
    }
}
