package com.github.eswrapper.dao;

import java.util.List;
import java.util.Map;

import com.github.eswrapper.model.CommonQueryParams;
import com.github.eswrapper.model.Response;

public interface CommonESHBaseDAO {
	/**
	 * 
	 * @param params
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	public Response<List<Map>> getResults(CommonQueryParams params);

	/**
	 * 通过sql查询eshbase获取结果
	 * 
	 * @param sql
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	public Response<List<Map>> getESSqlQuery(String sql,String clusterName,boolean userScroll);
}
