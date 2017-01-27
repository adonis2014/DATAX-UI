package com.github.eswrapper.service;

import java.util.List;
import java.util.Map;

import com.github.eswrapper.model.CommonQueryParams;
import com.github.eswrapper.model.Response;


public interface ESSqlManager {
	/**
	 * 
	 * @param params
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	public Response<List<Map>> getResults(CommonQueryParams params);

	/**
	 * 使用sql查询ES和hbase数据库，返回结果
	 * 
	 * @param sql
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	public Response<List<Map>> getESSqlQuery(String sql,String clusterName,String taskId,int from,int size,boolean useScroll,boolean useCahce);

}
