package com.github.eswrapper.dao.impl;

import org.elasticsearch.action.admin.cluster.settings.ClusterUpdateSettingsResponse;
import org.elasticsearch.action.admin.indices.create.CreateIndexResponse;
import org.elasticsearch.action.admin.indices.exists.indices.IndicesExistsResponse;
import org.elasticsearch.action.admin.indices.settings.put.UpdateSettingsResponse;
import org.elasticsearch.client.Client;
import org.elasticsearch.common.settings.Settings;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.github.eswrapper.dao.HSSplitIndexDAO;
import com.github.eswrapper.model.Response;
import com.github.eswrapper.util.Constants;

import net.iharding.esproxy.client.ClientFactory;
import net.iharding.esproxy.throttle.EsThrottle;
import net.iharding.esproxy.throttle.EsThrottleFactory;

@Repository
public class HSSplitIndexDAOImpl implements HSSplitIndexDAO {

	private static final Logger logger = LoggerFactory.getLogger(HSSplitIndexDAOImpl.class);

	private Client getEsClient(String clusterName) {
		EsThrottle esThrottle = EsThrottleFactory.getEsSearchThrottleByClusteName(clusterName);
		String username = (String) esThrottle.getConfigs().get(Constants.ES_SHIELD_USER);
		String password = (String) esThrottle.getConfigs().get(Constants.ES_SHIELD_PASSWORD);
		return ClientFactory.generateTransportClient(esThrottle, username, password);
	}

	@Override
	public Response<String> createHSSplitIndex(String clustername, String indexName, int shardNum, int replicas, String delayUnAssign, String hotZoneName, String stableZoneName) {
		Response<String> resp=new Response<String>();
		resp.start();
		Client client = null;
		try {
			client = getEsClient(clustername);
			IndicesExistsResponse response = client.admin().indices().prepareExists(indexName).execute().actionGet();
			if (!response.isExists()) {
				ClusterUpdateSettingsResponse cupdateResp = client.admin().cluster().prepareUpdateSettings()
						.setTransientSettings(Settings.settingsBuilder().put("cluster.routing.allocation.enable", "all")).execute().actionGet();
				if (!cupdateResp.isAcknowledged()) {
					throw new Exception("设置索引自动装配失败:" + cupdateResp.toString());
				}
				// 建立索引
				CreateIndexResponse creaResp = null;
				// 建立无副本索引，在热区建立主shard
				creaResp = client
						.admin()
						.indices()
						.prepareCreate(indexName)
						.setSettings(
								Settings.settingsBuilder().put("index.routing.allocation.include.zone", hotZoneName).put("number_of_shards", shardNum)
										.put("index.unassigned.node_left.delayed_timeout", delayUnAssign).put("number_of_replicas", 0)).execute().actionGet();
				if (!creaResp.isAcknowledged()) {// 建立完成，建立副本并将区域扩展到冷区
					throw new Exception("新建索引区域和副本数设置失败:" + creaResp.toString());
				}
				if (!creaResp.isAcknowledged()) {
					throw new Exception(creaResp.toString());
				}
				logger.debug("新建索引：" + indexName + " 成功！");
				UpdateSettingsResponse updateResp = client.admin().indices().prepareUpdateSettings(indexName)
						.setSettings(Settings.settingsBuilder().put("index.routing.allocation.include.zone", hotZoneName + "," + stableZoneName).put("number_of_replicas", 1))
						.execute().actionGet();
				if (!updateResp.isAcknowledged()) {
					throw new Exception("更新索引区域和副本数设置失败:" + updateResp.toString());
				}
			}
			resp.setData("建立读写分离适用分区索引库成功！");
			resp.end();
		} catch (Exception ex) {
			ex.printStackTrace();
			resp.getMessages().add(ex.getMessage());
			resp.setData("建立读写分离适用分区索引库失败！");
			resp.endAndFailed();
		}
		return resp;
	}

	@Override
	public Response<String> initHSSplitIndex(String clustername, String indexName, int shardNum, int replicas, String delayUnAssign, String hotZoneName) {
		Response<String> resp=new Response<String>();
		resp.start();
		Client client = null;
		try {
			client = getEsClient(clustername);
			IndicesExistsResponse response = client.admin().indices().prepareExists(indexName).execute().actionGet();
			if (!response.isExists()) {
				ClusterUpdateSettingsResponse cupdateResp = client.admin().cluster().prepareUpdateSettings()
						.setTransientSettings(Settings.settingsBuilder().put("cluster.routing.allocation.enable", "all")).execute().actionGet();
				if (!cupdateResp.isAcknowledged()) {
					throw new Exception("设置索引自动装配失败:" + cupdateResp.toString());
				}
				// 建立索引
				CreateIndexResponse creaResp = null;
				// 建立无副本索引，在热区建立主shard
				creaResp = client
						.admin()
						.indices()
						.prepareCreate(indexName)
						.setSettings(
								Settings.settingsBuilder().put("index.routing.allocation.include.zone", hotZoneName).put("number_of_shards", shardNum)
										.put("index.unassigned.node_left.delayed_timeout", delayUnAssign).put("number_of_replicas", 0)).execute().actionGet();
				if (!creaResp.isAcknowledged()) {// 建立完成，建立副本并将区域扩展到冷区
					throw new Exception("新建索引区域和副本数设置失败:" + creaResp.toString());
				}
				if (!creaResp.isAcknowledged()) {
					throw new Exception(creaResp.toString());
				}
				logger.debug("新建索引：" + indexName + " 成功！");
			}
			resp.setData("建立初始化读写分离适用分区索引库成功！");
			resp.end();
		} catch (Exception ex) {
			logger.error(ex.getMessage());
			ex.printStackTrace();
			resp.getMessages().add(ex.getMessage());
			resp.setData("建立初始化读写分离适用分区索引库失败！");
			resp.endAndFailed();
		}
		return resp;
	}

	@Override
	public Response<String> finishHSSplitIndex(String clustername, String indexName, String hotZoneName, String stableZoneName) {
		Response<String> resp=new Response<String>();
		resp.start();
		Client client = null;
		try {
			client = getEsClient(clustername);
			UpdateSettingsResponse updateResp = client.admin().indices().prepareUpdateSettings(indexName)
					.setSettings(Settings.settingsBuilder().put("index.routing.allocation.include.zone", hotZoneName + "," + stableZoneName).put("number_of_replicas", 1))
					.execute().actionGet();
			if (!updateResp.isAcknowledged()) {
				throw new Exception("更新索引区域和副本数设置失败:" + updateResp.toString());
			}
			resp.setData("读写分离适用分区索引库 写入完毕启用副本成功！");
			resp.end();
		} catch (Exception ex) {
			logger.error(ex.getMessage());
			ex.printStackTrace();
			resp.getMessages().add(ex.getMessage());
			resp.setData("读写分离适用分区索引库 写入完毕启用副本失败！");
			resp.endAndFailed();
		}
		return resp;
	}



}
