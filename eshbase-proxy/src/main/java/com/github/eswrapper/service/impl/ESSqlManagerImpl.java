package com.github.eswrapper.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.eswrapper.dao.CommonESHBaseDAO;
import com.github.eswrapper.model.CommonQueryParams;
import com.github.eswrapper.model.Response;
import com.github.eswrapper.service.ESSqlManager;
import com.github.eswrapper.util.Constants;
import com.github.eswrapper.util.EhCacheUtils;

@Service
public class ESSqlManagerImpl implements ESSqlManager {

	@Autowired
	private CommonESHBaseDAO commonESHBaseDAO;
	
	@SuppressWarnings("rawtypes")
	@Override
	public Response<List<Map>> getResults(CommonQueryParams params) {
		return commonESHBaseDAO.getResults(params);
	}
	
	@SuppressWarnings("rawtypes")
	private List<Map> getData(List<Map> userMap, int from, int size) {
		if (userMap==null)return null;
		List<Map> data = new ArrayList<Map>();
		for (int i = from; i < from + size; i++) {
			if (userMap.size() >= i + 1) {
				try {
					data.add(userMap.get(i));
				} catch (Exception ex) {
					break;
				}
			} else {
				break;
			}
		}
		return data;
	}

	@SuppressWarnings({ "rawtypes", "unchecked" })
	@Override
	public Response<List<Map>> getESSqlQuery(String sql,String clusterName, String taskId, int from, int size, boolean useScroll, boolean useCahce) {
		EhCacheUtils cacheUtils=EhCacheUtils.getServerInstance();
		if (StringUtils.isEmpty(clusterName)){
			clusterName=Constants.ES_CLUSTERNAME_DEFAULT;
		}
		Response<List<Map>> response=null;
		if (useCahce){
			//根据taskId从cahce获取数据，判读是否有缓存
			response= new Response<List<Map>>();
			response.start();
			response.setStartIndex(from);
			Object resu=cacheUtils.get("dataCollector",taskId);
			if (resu!=null){
				response.setData(getData((List<Map>)resu,from,size));
				response.setFromCache(Constants.FROM_CACHE_ID);
				response.setTotal(((List<Map>)resu).size());
				response.setId(taskId);
				response.end();
				return response;
			}
			//根据sql获取最近查询的sql的记录
			resu=cacheUtils.get("sqlCollector","elasticsearch-"+  sql.toUpperCase());
			if (resu!=null){
				response.setData(getData((List<Map>)resu,from,size));
				response.setFromCache(Constants.FROM_CACHE_SQL);
				response.setTotal(((List<Map>)resu).size());
				response.setId(taskId);
				response.end();
				return response;
			}
		}
		Response<List<Map>> rows=commonESHBaseDAO.getESSqlQuery(sql,clusterName,useScroll);
		response=rows.copyResponse();
		if (taskId!=null   && rows.getStatus()==Constants.STATUS_OK){
			cacheUtils.put("dataCollector",taskId,rows.getData());
			cacheUtils.put("sqlCollector","elasticsearch-"+ sql.toUpperCase(),rows.getData());
			response.setData(getData(rows.getData(),from,size));
		}else{
			response.setData(getData(rows.getData(),from,size));
		}
		response.setAllMessages(rows.getAllMessages());
		response.setMessages(rows.getMessages());
		response.setId(taskId);
		response.setFromCache(Constants.FROM_CACHE_NO);
		return response;
	}

}
