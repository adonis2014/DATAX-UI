package com.taobao.datax.plugins.writer.elasticsearchwriter;

import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.elasticsearch.action.admin.indices.create.CreateIndexResponse;
import org.elasticsearch.action.admin.indices.delete.DeleteIndexResponse;
import org.elasticsearch.action.admin.indices.exists.indices.IndicesExistsResponse;
import org.elasticsearch.action.admin.indices.exists.types.TypesExistsResponse;
import org.elasticsearch.action.admin.indices.mapping.put.PutMappingRequest;
import org.elasticsearch.action.admin.indices.mapping.put.PutMappingResponse;
import org.elasticsearch.action.admin.indices.settings.put.UpdateSettingsResponse;
import org.elasticsearch.action.bulk.BulkItemResponse;
import org.elasticsearch.action.bulk.BulkRequestBuilder;
import org.elasticsearch.action.bulk.BulkResponse;
import org.elasticsearch.action.get.GetResponse;
import org.elasticsearch.client.Client;
import org.elasticsearch.client.Requests;
import org.elasticsearch.common.settings.Settings;

import com.fasterxml.jackson.databind.ObjectMapper;

/**
 * elastic search 数据操作类
 * 
 * @author admin
 * 
 */
public class ElasticSearchProxy {

	// 批量提交的记录数
	private int bulksize;
	// 索引名称
	private String indexname;
	// 类型名称(类似表名)
	private String typename;
	
	
	private Client client;
	private int isHotStableSplit=0;
	private BulkRequestBuilder bulkRequestBuilder;

	private Logger logger = Logger.getLogger(ElasticSearchProxy.class);
	ObjectMapper mapper = new ObjectMapper();
	public void prepare() {
		this.bulkRequestBuilder = client.prepareBulk();
	}

	public void flush() {
		BulkResponse response = bulkRequestBuilder.execute().actionGet();
//		client.admin().indices().prepareFlush(indexname).execute().actionGet();
		logger.debug(getFailueMessage(response));
		bulkRequestBuilder=null;
	}

	private String getFailueMessage(BulkResponse response) {
		StringBuilder sb = new StringBuilder();
		boolean havFailure = false;
		for (BulkItemResponse item : response.getItems()) {
			if (item.isFailed()) {
				havFailure = true;
				sb.append("\n[").append("]: index [").append(item.getIndex()).append("], type [").append(item.getType()).append("], id [").append(item.getId())
						.append("], message [").append(item.getFailureMessage()).append("]");
			}
		}
		if (havFailure) {
			return "failure in bulk execution:" + sb.toString();
		} else {
			return "";
		}
	}

	public void close() throws Exception {
		if (this.bulkRequestBuilder != null) {
			this.bulkRequestBuilder = null;
		}
		if (this.isHotStableSplit==1){
			UpdateSettingsResponse updateResp =client.admin().indices().prepareUpdateSettings(indexname).setSettings(Settings.settingsBuilder().put("index.routing.allocation.include.zone","hot,stable").put("number_of_replicas", 1)).execute().actionGet();
			if (!updateResp.isAcknowledged()){
				throw new Exception("更新索引区域和副本数设置失败:"+updateResp.toString());
			}
		}
	}

	public void deleteTable(String indexname,int number_of_shards, int number_of_replicas, String typename,String mapping_xml) throws Exception {
		IndicesExistsResponse exresponse = client.admin().indices().prepareExists(indexname).execute().actionGet();
		if (exresponse.isExists()) {
			try{
				DeleteIndexResponse delresponse = client.admin().indices().prepareDelete(indexname).execute().actionGet();
				if (!delresponse.isAcknowledged()) {
					throw new Exception(delresponse.toString());
				} else {
					logger.debug("删除索引：" + indexname  + " 成功！");
				}
			}catch(Exception ex){
			}
		}else{
//			DeleteMappingResponse response = client.admin().indices().prepareDelete(indexname).setType(typename).execute().actionGet();
//			if (!response.isAcknowledged()) {
//				throw new Exception(response.toString());
//			} else {
//				logger.debug("删除索引Type：" + indexname + "-" + typename + " 成功！");
//			}
		}
		CreateIndexResponse creaResp = client.admin().indices().prepareCreate(indexname)
				.setSettings(Settings.settingsBuilder().put("number_of_shards", number_of_shards).put("number_of_replicas", number_of_replicas)).execute().actionGet();
		if (!creaResp.isAcknowledged()) {
			throw new Exception(creaResp.toString());
		}
		TypesExistsResponse typeResp = client.admin().indices().prepareTypesExists(indexname).setTypes(typename).execute().actionGet();
		if (!typeResp.isExists()){
			// 建立type和mapping
			PutMappingRequest mapping = Requests.putMappingRequest(indexname).type(typename).source(mapping_xml);
			PutMappingResponse respMap = client.admin().indices().putMapping(mapping).actionGet();
			if (!respMap.isAcknowledged()) {
				throw new Exception(respMap.toString());
			} else {
				logger.debug("新建索引：" + indexname + "下的type:" + typename + " 成功！mapping格式为:" + mapping_xml);
			}
		}
	}

	public void createTable(String indexname, int number_of_shards, int number_of_replicas, String typename, int bulksize, String mapping_xml,int isHotStableSplit) throws Exception {
		// 判断是否已经存在索引
		IndicesExistsResponse response = client.admin().indices().prepareExists(indexname).execute().actionGet();
		if (!response.isExists()) {
			// 建立索引
			CreateIndexResponse creaResp =null;
			this.isHotStableSplit=isHotStableSplit;
			if (isHotStableSplit==1){
				//建立无副本索引，在热区建立主shard
				creaResp = client.admin().indices().prepareCreate(indexname)
						.setSettings(Settings.settingsBuilder().put("index.routing.allocation.include.zone","hot").put("number_of_shards", number_of_shards).put("number_of_replicas", 0)).execute().actionGet();
				if (!creaResp.isAcknowledged()) {//建立完成，建立副本并将区域扩展到冷区
					throw new Exception("新建索引区域和副本数设置失败:"+creaResp.toString());
				}
			}else{
				creaResp = client.admin().indices().prepareCreate(indexname)
						.setSettings(Settings.settingsBuilder().put("number_of_shards", number_of_shards).put("number_of_replicas", number_of_replicas)).execute().actionGet();
			}
			if (!creaResp.isAcknowledged()) {
				throw new Exception(creaResp.toString());
			}
			// 建立type和mapping
			PutMappingRequest mapping = Requests.putMappingRequest(indexname).type(typename).source(mapping_xml);
			PutMappingResponse respMap = client.admin().indices().putMapping(mapping).actionGet();
			if (!respMap.isAcknowledged()) {
				throw new Exception(respMap.toString());
			} else {
				logger.debug("新建索引：" + indexname + "下的type:" + typename + " 成功！mapping格式为:" + mapping_xml);
			}
		} else {
			logger.debug("新建索引：" + indexname + " 成功！");
		}
		 TypesExistsResponse typeResp = client.admin().indices().prepareTypesExists(indexname).setTypes(typename)
		 .execute().actionGet();
		 if (!typeResp.isExists()){
			// 建立type和mapping
				PutMappingRequest mapping = Requests.putMappingRequest(indexname).type(typename).source(mapping_xml);
				PutMappingResponse respMap = client.admin().indices().putMapping(mapping).actionGet();
				if (!respMap.isAcknowledged()) {
					throw new Exception(respMap.toString());
				} else {
					logger.debug("新建索引：" + indexname + "下的type:" + typename + " 成功！mapping格式为:" + mapping_xml);
				}
		 }
		
	}

	public void truncateTable(String indexname, int number_of_shards, int number_of_replicas,String typename, String mapping_xml) throws Exception {

		//删除type
		TypesExistsResponse exresponse =client.admin().indices().prepareTypesExists(indexname).setTypes(typename).execute().actionGet();
		if (exresponse.isExists()){//删除type
//					try{
//						DeleteMappingResponse delresponse = client.admin().indices().prepareDeleteMapping(indexname).setType(typename).execute().actionGet();
//						if (!delresponse.isAcknowledged()) {
//							throw new Exception(delresponse.toString());
//						} else {
//							logger.debug("删除type：" + indexname+ ":"+typename+" 成功！");
//						}
//					}catch(Exception ex){
//					}
		}
		PutMappingRequest mapping = Requests.putMappingRequest(indexname).type(typename).source(mapping_xml);
		PutMappingResponse respMap = client.admin().indices().putMapping(mapping).actionGet();
		if (!respMap.isAcknowledged()) {
			throw new Exception(respMap.toString());
		} else {
			logger.debug("新建索引：" + indexname + "下的type:" + typename + " 成功！mapping格式为:" + mapping_xml);
		}
	}
	
	@SuppressWarnings("rawtypes")
	public Map getDocument(String rowid){
		GetResponse response = client.prepareGet(indexname, typename, rowid).execute() .actionGet();
		return response.getSource();
	}

	@SuppressWarnings({ "unchecked", "rawtypes" })
	public void insert(String id,Map map,String parent,String routing) {
		try {
			if (StringUtils.isEmpty(id)){
				if (StringUtils.isEmpty(routing)){
					bulkRequestBuilder.add(client.prepareIndex(this.indexname, this.typename).setSource(map).request());
				}else{
					bulkRequestBuilder.add(client.prepareIndex(this.indexname, this.typename).setRouting(routing).setSource(map).request());
				}
			}else{
				if (StringUtils.isNotEmpty(parent)){
					if (parent.startsWith("4:")){
						String[] dd=StringUtils.split(parent,":");
						if (StringUtils.isEmpty(routing)){
							bulkRequestBuilder.add(client.prepareIndex(this.indexname, this.typename,id).setParent(StringUtils.reverse((String)map.get(dd[1]))).setSource(map).request());
						}else{
							bulkRequestBuilder.add(client.prepareIndex(this.indexname, this.typename,id).setRouting(routing).setParent(StringUtils.reverse((String)map.get(dd[1]))).setSource(map).request());
						}
					}else{
						if (StringUtils.isEmpty(routing)){
							bulkRequestBuilder.add(client.prepareIndex(this.indexname, this.typename,id).setParent((String)map.get(parent)).setSource(map).request());
						}else{
							bulkRequestBuilder.add(client.prepareIndex(this.indexname, this.typename,id).setRouting(routing).setParent((String)map.get(parent)).setSource(map).request());
						}
					}
				}else{
					if (StringUtils.isEmpty(routing)){
						bulkRequestBuilder.add(client.prepareIndex(this.indexname, this.typename,id).setSource(map).request());
					}else{
						bulkRequestBuilder.add(client.prepareIndex(this.indexname, this.typename,id).setRouting(routing).setSource(map).request());
					}
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		if (bulkRequestBuilder.numberOfActions() >= this.bulksize) {
			BulkResponse response = bulkRequestBuilder.execute().actionGet();
			String err=getFailueMessage(response);
			if (err.length()>0){
				System.out.println(err);
			}
			this.prepare();
		}
	}


	public ElasticSearchProxy(Client client, int bulksize, String indexname,String typename) {
		this.client = client;
		this.bulksize=bulksize;
		this.indexname=indexname;
		this.typename=typename;
	}


	public static ElasticSearchProxy newProxy(Client client, int bulksize, String indexname,String typename) {
		return new ElasticSearchProxy(client,bulksize,indexname,typename);
	}


}
