package com.github.eswrapper.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.eswrapper.dao.HSSplitIndexDAO;
import com.github.eswrapper.model.Response;
import com.github.eswrapper.service.HSSplitIndexManager;

@Service
public class HSSplitIndexManagerImpl implements HSSplitIndexManager {

	@Autowired
	private HSSplitIndexDAO hssplitIndexDAO;
	
	@Override
	public Response<String> createHSSplitIndex(String clustername,String indexName, int shardNum, int replicas, String delayUnAssign, String hotZoneName, String stableZoneName) {
		return hssplitIndexDAO.createHSSplitIndex(clustername, indexName, shardNum, replicas, delayUnAssign, hotZoneName, stableZoneName);
	}

	@Override
	public Response<String> initHSSplitIndex(String clustername,String indexName, int shardNum, int replicas, String delayUnAssign, String hotZoneName) {
		return hssplitIndexDAO.initHSSplitIndex(clustername, indexName, shardNum, replicas, delayUnAssign, hotZoneName);
	}

	@Override
	public Response<String> finishHSSplitIndex(String clustername,String indexName, String hotZoneName, String stableZoneName) {
		return hssplitIndexDAO.finishHSSplitIndex(clustername, indexName, hotZoneName, stableZoneName);
	}

	

}
