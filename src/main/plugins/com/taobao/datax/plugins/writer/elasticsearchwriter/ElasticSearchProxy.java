package com.taobao.datax.plugins.writer.elasticsearchwriter;

import java.io.IOException;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.codehaus.jackson.map.ObjectMapper;
import org.elasticsearch.action.admin.indices.create.CreateIndexResponse;
import org.elasticsearch.action.admin.indices.delete.DeleteIndexResponse;
import org.elasticsearch.action.admin.indices.exists.indices.IndicesExistsResponse;
import org.elasticsearch.action.admin.indices.exists.types.TypesExistsResponse;
import org.elasticsearch.action.admin.indices.mapping.delete.DeleteMappingResponse;
import org.elasticsearch.action.admin.indices.mapping.put.PutMappingRequest;
import org.elasticsearch.action.admin.indices.mapping.put.PutMappingResponse;
import org.elasticsearch.action.bulk.BulkItemResponse;
import org.elasticsearch.action.bulk.BulkRequestBuilder;
import org.elasticsearch.action.bulk.BulkResponse;
import org.elasticsearch.client.Client;
import org.elasticsearch.client.Requests;
import org.elasticsearch.common.settings.ImmutableSettings;

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
	
	private BulkRequestBuilder bulkRequestBuilder;

	private Logger logger = Logger.getLogger(ElasticSearchProxy.class);
	ObjectMapper mapper = new ObjectMapper();
	public void prepare() {
		this.bulkRequestBuilder = client.prepareBulk();
	}

	public void flush() {
		BulkResponse response = bulkRequestBuilder.execute().actionGet();
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

	public void close() throws IOException {
		if (this.bulkRequestBuilder != null) {
			this.bulkRequestBuilder = null;
		}
	}

	public void deleteTable(String indexname, String typename) throws Exception {
		DeleteMappingResponse response = client.admin().indices().prepareDeleteMapping(indexname).setType(typename).execute().actionGet();
		if (!response.isAcknowledged()) {
			throw new Exception(response.toString());
		} else {
			logger.debug("删除索引Type：" + indexname + "-" + typename + " 成功！");
		}
	}

	public void createTable(String indexname, int number_of_shards, int number_of_replicas, String typename, int bulksize, String mapping_xml) throws Exception {
		// 判断是否已经存在索引
		IndicesExistsResponse response = client.admin().indices().prepareExists(indexname).execute().actionGet();
		if (!response.isExists()) {
			// 建立索引
			CreateIndexResponse creaResp = client.admin().indices().prepareCreate(indexname)
					.setSettings(ImmutableSettings.settingsBuilder().put("number_of_shards", number_of_shards).put("number_of_replicas", number_of_replicas)).execute().actionGet();
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
		IndicesExistsResponse exresponse = client.admin().indices().prepareExists(indexname).execute().actionGet();
		if (exresponse.isExists()) {
			try{
				DeleteIndexResponse delresponse = client.admin().indices()
			     .prepareDelete(indexname).execute().actionGet();
				if (!delresponse.isAcknowledged()) {
					throw new Exception(delresponse.toString());
				} else {
					logger.debug("删除索引：" + indexname  + " 成功！");
				}
			}catch(Exception ex){
			}
		}
		CreateIndexResponse creaResp = client.admin().indices().prepareCreate(indexname)
				.setSettings(ImmutableSettings.settingsBuilder().put("number_of_shards", number_of_shards).put("number_of_replicas", number_of_replicas)).execute().actionGet();
		if (!creaResp.isAcknowledged()) {
			throw new Exception(creaResp.toString());
		}
		PutMappingRequest mapping = Requests.putMappingRequest(indexname).type(typename).source(mapping_xml);
		PutMappingResponse respMap = client.admin().indices().putMapping(mapping).actionGet();
		if (!respMap.isAcknowledged()) {
			throw new Exception(respMap.toString());
		} else {
			logger.debug("新建索引：" + indexname + "下的type:" + typename + " 成功！mapping格式为:" + mapping_xml);
		}
	}

	@SuppressWarnings({ "rawtypes", "unchecked" })
	public void insert(String id,Map map) {
		try {
			if (StringUtils.isEmpty(id)){
				bulkRequestBuilder.add(client.prepareIndex(this.indexname, this.typename).setSource(map).request());
			}else{
				bulkRequestBuilder.add(client.prepareIndex(this.indexname, this.typename,id).setSource(map).request());
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
