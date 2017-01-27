package com.github.eswrapper.dao.impl;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import org.apache.commons.lang.StringUtils;
import org.apache.hadoop.hbase.Cell;
import org.apache.hadoop.hbase.client.Get;
import org.apache.hadoop.hbase.client.Result;
import org.apache.hadoop.hbase.client.Table;
import org.apache.hadoop.hbase.util.Bytes;
import org.codehaus.jackson.map.ObjectMapper;
import org.elasticsearch.action.ActionRequestBuilder;
import org.elasticsearch.action.admin.indices.get.GetIndexRequest;
import org.elasticsearch.action.admin.indices.get.GetIndexRequestBuilder;
import org.elasticsearch.action.admin.indices.get.GetIndexResponse;
import org.elasticsearch.action.deletebyquery.DeleteByQueryAction;
import org.elasticsearch.action.deletebyquery.DeleteByQueryRequest;
import org.elasticsearch.action.deletebyquery.DeleteByQueryRequestBuilder;
import org.elasticsearch.action.deletebyquery.DeleteByQueryResponse;
import org.elasticsearch.action.search.SearchRequest;
import org.elasticsearch.action.search.SearchRequestBuilder;
import org.elasticsearch.action.search.SearchResponse;
import org.elasticsearch.action.search.SearchType;
import org.elasticsearch.client.Client;
import org.elasticsearch.cluster.metadata.AliasMetaData;
import org.elasticsearch.cluster.metadata.MappingMetaData;
import org.elasticsearch.common.collect.ImmutableOpenMap;
import org.elasticsearch.common.settings.Settings;
import org.elasticsearch.common.unit.TimeValue;
import org.elasticsearch.plugin.nlpcn.ElasticJoinExecutor;
import org.elasticsearch.search.SearchHit;
import org.elasticsearch.search.SearchHits;
import org.elasticsearch.search.aggregations.Aggregation;
import org.elasticsearch.search.aggregations.bucket.histogram.Histogram;
import org.elasticsearch.search.aggregations.bucket.range.Range;
import org.elasticsearch.search.aggregations.bucket.terms.InternalTerms;
import org.elasticsearch.search.aggregations.bucket.terms.Terms;
import org.elasticsearch.search.aggregations.metrics.avg.InternalAvg;
import org.elasticsearch.search.aggregations.metrics.cardinality.InternalCardinality;
import org.elasticsearch.search.aggregations.metrics.max.InternalMax;
import org.elasticsearch.search.aggregations.metrics.min.InternalMin;
import org.elasticsearch.search.aggregations.metrics.percentiles.Percentile;
import org.elasticsearch.search.aggregations.metrics.percentiles.Percentiles;
import org.elasticsearch.search.aggregations.metrics.stats.Stats;
import org.elasticsearch.search.aggregations.metrics.stats.extended.ExtendedStats;
import org.elasticsearch.search.aggregations.metrics.stats.extended.ExtendedStats.Bounds;
import org.elasticsearch.search.aggregations.metrics.sum.InternalSum;
import org.elasticsearch.search.aggregations.metrics.tophits.InternalTopHits;
import org.elasticsearch.search.aggregations.metrics.valuecount.InternalValueCount;
import org.elasticsearch.search.sort.SortOrder;
import org.elasticsearch.search.warmer.IndexWarmersMetaData;
import org.nlpcn.es4sql.SearchDao;
import org.nlpcn.es4sql.domain.Field;
import org.nlpcn.es4sql.domain.Select;
import org.nlpcn.es4sql.query.SqlElasticRequestBuilder;
import org.nlpcn.es4sql.query.join.JoinRequestBuilder;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.carrotsearch.hppc.cursors.ObjectObjectCursor;
import com.github.eswrapper.dao.CommonESHBaseDAO;
import com.github.eswrapper.model.CommonQueryParams;
import com.github.eswrapper.model.FieldItem;
import com.github.eswrapper.model.OrderItem;
import com.github.eswrapper.model.Response;
import com.github.eswrapper.util.Constants;
import com.github.eswrapper.util.EhCacheUtils;
import com.github.eswrapper.util.HBStringUtils;
import com.github.eswrapper.util.HBaseUtils;

import net.iharding.esproxy.client.ClientFactory;
import net.iharding.esproxy.throttle.EsThrottle;
import net.iharding.esproxy.throttle.EsThrottleFactory;
@Repository
public class CommonESHBaseDAOImpl implements CommonESHBaseDAO {

	private static final Logger logger = LoggerFactory.getLogger(CommonESHBaseDAOImpl.class);

	private EhCacheUtils cacheUtils = EhCacheUtils.getServerInstance();

	private ObjectMapper mapper = new ObjectMapper();
	
	private Client getEsClient(String clusterName){
		EsThrottle esThrottle = EsThrottleFactory.getEsSearchThrottleByClusteName(clusterName);
		String username=(String)esThrottle.getConfigs().get(Constants.ES_SHIELD_USER);
	    String password=(String)esThrottle.getConfigs().get(Constants.ES_SHIELD_PASSWORD);
	    return ClientFactory.generateTransportClient(esThrottle, username, password);
	}


	@SuppressWarnings({ "rawtypes", "unchecked" })
	@Override
	public Response<List<Map>> getESSqlQuery(String sql,String clusterName, boolean userScroll) {
		Response<List<Map>> response = new Response<List<Map>>();
		response.start();
		if (StringUtils.isEmpty(sql.trim())) {
			response.setTotal(0);
			response.setStatus(Constants.STATUS_FAIL);
			response.setMsg(Constants.MSG_FAIL);
			response.error("空sql！");
			response.end();
			return response;
		}
		Client client = null;
		Table table = null;
		try {
			client =getEsClient(clusterName);
			SearchDao searchDao = new SearchDao(client);
			SqlElasticRequestBuilder actionRequestBuilder = searchDao.explain(sql);
			ActionRequestBuilder requestBuilder = actionRequestBuilder.getBuilder();
			Select select = actionRequestBuilder.getSelect();
			 if (actionRequestBuilder instanceof JoinRequestBuilder) {
					ElasticJoinExecutor executor = ElasticJoinExecutor.createJoinExecutor(client, actionRequestBuilder);
					logger.info(actionRequestBuilder.explain().toString());
					executor.run();
					SearchHits hits = executor.getHits();
					response.setTotal(hits.getTotalHits());
					response.setStatus(Constants.STATUS_OK);
					// 数据分页查询
					if (response.getTotal() == 0) {// 查询结果为空
						response.setMsg(Constants.MSG_SUCCESS_EMPTY);
					} else {// 处理查询结果
						response.setMsg(Constants.MSG_SUCCESS);
						response.setData(getHitsResults(clusterName,hits, select, null, null));
					}
					response.end();
			}else if (requestBuilder instanceof SearchRequestBuilder) {
				SearchRequestBuilder sqb = (SearchRequestBuilder) requestBuilder;
				logger.info(sqb.toString());
				sqb.setPreference(Constants.ES_HOTSTABLE_SPLIT_READVALUE);
				SearchResponse esResponse = null;
				if (!select.isAgg && userScroll) {// 使用游标查询,游标查询不支持hbase反查。
					sqb.setSearchType(SearchType.SCAN);
					sqb.setSize(Constants.MAX_ROWS_NUM);
					if (select.getFields().size() > 0) {
						ArrayList<String> includeFields = new ArrayList<String>();
						for (Field field : select.getFields()) {
							if (field instanceof Field) {
								includeFields.add(field.getName());
							}
						}
						sqb.setFetchSource(includeFields.toArray(new String[includeFields.size()]), null);
					}
					SearchRequest srequest = sqb.request();
					esResponse = client.search(srequest).actionGet();
					List<Map> results = new ArrayList<Map>();
					while (true) {
						for (SearchHit hit : esResponse.getHits().getHits()) {
							Map row = hit.getSource();
							row.put("id", hit.getId());
							results.add(row);
						}
						esResponse = client.prepareSearchScroll(esResponse.getScrollId()).setScroll(new TimeValue(300000)).execute().actionGet();
						// Break condition: No hits are returned
						if (esResponse.getHits().getHits().length == 0) {
							break;
						}
					}
					response.setData(results);
					if (response.getTotal() == 0) {// 查询结果为空
						response.setMsg(Constants.MSG_SUCCESS_EMPTY);
					} else {// 处理查询结果
						response.setMsg(Constants.MSG_SUCCESS);
					}
					response.setStatus(Constants.STATUS_OK);
					response.end();
				} else {
					SearchRequest srequest = sqb.request();
					esResponse = client.search(srequest).actionGet();
					SearchHits hits = esResponse.getHits();
					response.setTotal(hits.getTotalHits());
					if (select.isAgg) {// 数据聚合
						List<Map> results = null;// new ArrayList<Map>();
						if (select.getGroupBys().size() > 0) {// bucket 桶
							Map<String, Aggregation> aggs = esResponse.getAggregations().asMap();
							Iterator<Entry<String, Aggregation>> iter = aggs.entrySet().iterator();
							results = new ArrayList<Map>();
							while (iter.hasNext()) {
								Entry<String, Aggregation> entry = iter.next();
								results.addAll(getBucketsMap(clusterName,entry.getKey(), entry.getValue(), select));
							}
						} else {// metrics 指标
							results = this.getMetricsResults(clusterName,"agg", esResponse.getAggregations().asMap(), select);
						}
						if (results.size() == 1 && results.get(0).isEmpty()) {
							Map agg = new HashMap();
							agg.put("agg", esResponse.toString());
							results.add(agg);
						}
						response.setData(results);
						response.setMsg(Constants.MSG_SUCCESS);
					} else {// 数据分页查询
						if (response.getTotal() == 0) {// 查询结果为空
							response.setMsg(Constants.MSG_SUCCESS_EMPTY);
						} else {// 处理查询结果
							response.setData(getHitsResults(clusterName,hits, select, null, null));
							response.setMsg(Constants.MSG_SUCCESS);
						}
					}
					response.end();
					response.setStatus(Constants.STATUS_OK);
				}
			}else if (actionRequestBuilder instanceof DeleteByQueryRequestBuilder) {
				DeleteByQueryRequest elasticRequest =(DeleteByQueryRequest)actionRequestBuilder.request();
				 DeleteByQueryResponse rsp = new DeleteByQueryRequestBuilder(client, DeleteByQueryAction.INSTANCE)
				    .setIndices(elasticRequest.indices())
				    .setTypes(elasticRequest.types())
				    .setSource(elasticRequest.source())
				    .execute()
				    .actionGet();
				 if (rsp.getTotalDeleted()==0){
					 response.setMsg(Constants.MSG_SUCCESS_EMPTY);
				 }else{
					 response.setTotal(rsp.getTotalDeleted());
					 response.getMessages().add("delete success:"+rsp.getTotalDeleted());
					 response.getMessages().add("delete failed:"+rsp.getTotalFailed());
					 response.getMessages().add("delete found:"+rsp.getTotalFound());
					 response.getMessages().add("delete missing:"+rsp.getTotalMissing());
					 response.setMsg(Constants.MSG_SUCCESS);
				}
				 response.end();
			 } else if (requestBuilder instanceof GetIndexRequestBuilder) {
				List<Map> results = processGetIndexResponse(client, (GetIndexRequest) requestBuilder.request(), sql);
				response.setStatus(Constants.STATUS_OK);
				// 排序所有mapping时记录
				Collections.sort(results, new SortByIndexName());
				response.setTotal(results.size());
				response.setData(results);
				response.setMsg(Constants.MSG_SUCCESS);
				response.end();
			}
		} catch (Exception ex) {
			logger.error(ex.getMessage());
			response.setTotal(0);
			ex.printStackTrace();
			response.setStatus(Constants.STATUS_FAIL);
			response.setMsg(Constants.MSG_FAIL);
			response.error(Constants.MSG_FAIL + "," + ex.getMessage());
			response.end();
		} finally {
			HBaseUtils.doCloseTable(table);
		}
		return response;
	}

	/**
	 * 获取index定义，保存缓存
	 * 
	 * @param client
	 * @param getIndexRequest
	 * @param sql
	 * @return
	 * @throws IOException
	 */
	@SuppressWarnings({ "unchecked", "rawtypes" })
	private List<Map> processGetIndexResponse(Client client, GetIndexRequest getIndexRequest, String sql) throws IOException {
		GetIndexResponse getIndexResponse = client.admin().indices().getIndex(getIndexRequest).actionGet();
		GetIndexRequest.Feature[] features = getIndexRequest.featuresAsEnums();
		String[] indices = getIndexResponse.indices();
		sql = sql.replaceAll("\\s+", " ");
		String indexName = sql.split(" ")[1];
		List<Map> results = new ArrayList<Map>();
		for (String index : indices) {
			if (index.startsWith(".") || index.startsWith("logstash"))
				continue;
			for (GetIndexRequest.Feature feature : features) {
				switch (feature) {
				case ALIASES:
					List<AliasMetaData> aliases = getIndexResponse.aliases().get(index);
					if (aliases != null) {
						for (AliasMetaData alias : aliases) {
							Map row = new HashMap();
							row.put("indexName", index);
							row.put("aliasName", alias.getAlias());
							if (alias.indexRouting() != null) {
								row.put("index_routing", alias.indexRouting());
							}
							if (alias.searchRouting() != null) {
								row.put("search_routing", alias.searchRouting());
							}
							results.add(row);
						}
					} else {
						Map row = new HashMap();
						row.put("indexName", index);
						results.add(row);
					}
					break;
				case MAPPINGS:
					ImmutableOpenMap<String, MappingMetaData> mappings = getIndexResponse.mappings().get(index);
					if (mappings != null) {
						if ("tables".equalsIgnoreCase(indexName) || "*".equalsIgnoreCase(indexName)) {
							for (ObjectObjectCursor<String, MappingMetaData> typeEntry : mappings) {
								Map row = new HashMap();
								row.put("typeName", typeEntry.key);
								row.put("indexName", index);
								Map<String, Object> fields = typeEntry.value.sourceAsMap();
								if (fields.get("_all") != null) {
									Map mm = (Map) fields.get("_all");
									row.put("_all", mm.get("enabled"));
								}
								if (fields.get("_source") != null) {
									Map mm = (Map) fields.get("_source");
									row.put("_source", mm.get("enabled"));
								}
								if (fields.get("_parent") != null) {
									Map mm = (Map) fields.get("_parent");
									row.put("_parent", mm.get("type"));
								}
								row.put("_routing", typeEntry.value.routing().required());
								row.put("_properties", fields.get("properties"));
								cacheUtils.put("metaCollector", "es-"+client.settings().get("cluster.name")+"-"  + index + "-" + typeEntry.key, row);
								results.add(row);
							}
						} else {
							for (ObjectObjectCursor<String, MappingMetaData> typeEntry : mappings) {
								Map<String, Object> fields = typeEntry.value.sourceAsMap();
								results.addAll(getProperties(fields, typeEntry.key, index, ""));
							}
						}
					} else {
						Map row = new HashMap();
						row.put("indexName", index);
						results.add(row);
					}
					break;
				case SETTINGS:
					Settings settings = getIndexResponse.settings().get(index);
					results.add(settings.getAsMap());
					break;
				case WARMERS:
					List<IndexWarmersMetaData.Entry> warmers = getIndexResponse.warmers().get(index);
					if (warmers != null) {
						for (IndexWarmersMetaData.Entry warmer : warmers) {
							for (String type : warmer.types()) {
								Map row = new HashMap();
								row.put("warmerName", warmer.name());
								row.put("typeName", type);
								row.put("indexName", index);
								results.add(row);
							}
						}
					} else {
						Map row = new HashMap();
						row.put("indexName", index);
						results.add(row);
					}
					break;
				default:
					throw new IllegalStateException("feature [" + feature + "] is not valid");
				}
			}
		}
		return results;
	}

	@SuppressWarnings("rawtypes")
	class SortByIndexName implements Comparator {
		public int compare(Object o1, Object o2) {
			Map s1 = (Map) o1;
			Map s2 = (Map) o2;
			return ((String) s1.get("indexName")).compareTo((String) s2.get("indexName"));
		}
	}

	/**
	 * 获取属性（字段）列表
	 * 
	 * @param fields
	 * @return
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	private List<Map> getProperties(Map<String, Object> fields, String typeName, String indexName, String parentName) {
		List<Map> results = new ArrayList<Map>();
		Iterator<Entry<String, Object>> iters = fields.entrySet().iterator();
		while (iters.hasNext()) {
			Entry<String, Object> entry = iters.next();
			if ("properties".equalsIgnoreCase(entry.getKey())) {
				Map properties = (Map) entry.getValue();
				Iterator<Entry<String, Object>> piters = properties.entrySet().iterator();
				while (piters.hasNext()) {
					Entry<String, Object> pentry = piters.next();
					Map ppentry = (Map) pentry.getValue();
					if (ppentry.get("properties") != null) {
						results.addAll(getProperties(ppentry, typeName, indexName, pentry.getKey()));
					} else {
						Map row = new HashMap();
						row.put("typeName", typeName);
						row.put("indexName", indexName);
						if (StringUtils.isNotEmpty(parentName)) {
							row.put("columnName", parentName + "." + pentry.getKey());
						} else {
							row.put("columnName", pentry.getKey());
						}

						row.putAll(ppentry);
						results.add(row);
					}
				}
			}
		}
		return results;
	}

	@SuppressWarnings({ "rawtypes", "unchecked" })
	private List<Map> getBucketsMap(String clusterName,String aggName, Object value, Select select) throws IOException {
		List<Map> bucketsMap = new ArrayList<Map>();
		if (value instanceof Terms) {
			Terms sts = (Terms) value;
			for (Terms.Bucket bucket : sts.getBuckets()) {
				if (bucket.getAggregations().asMap().isEmpty()){
					Map row = new HashMap();
					row.put("aggName", aggName);
					row.put(aggName + "-key", bucket.getKeyAsString());
					row.put(aggName + "-docCount", bucket.getDocCount());
					bucketsMap.add(row);
				}else{
					List<Map> ress = this.getMetricsResults(clusterName,bucket.getKeyAsString(), bucket.getAggregations().asMap(), select);
					for (Map row : ress) {
						row.put("aggName", aggName);
						row.put(aggName + "-key", bucket.getKeyAsString());
						row.put(aggName + "-docCount", bucket.getDocCount());
						// row.put("docCountError",bucket.getDocCountError());
						bucketsMap.add(row);
					}
				}
			}
		} else if (value instanceof Range) {
			Range range = (Range) value;
			for (Range.Bucket bucket : range.getBuckets()) {
				if (bucket.getAggregations().asMap().isEmpty()){
					Map row = new HashMap();
					row.put("aggName", aggName);
					row.put(aggName + "-key", bucket.getKeyAsString());
					row.put(aggName + "-docCount", bucket.getDocCount());
					row.put(aggName + "-rangForm", bucket.getFrom());
					row.put(aggName + "-rangTo", bucket.getTo());
					bucketsMap.add(row);
				}else{
					List<Map> ress = this.getMetricsResults(clusterName,bucket.getKeyAsString(), bucket.getAggregations().asMap(), select);
					for (Map row : ress) {
						row.put("aggName", aggName);
						row.put(aggName + "-key", bucket.getKeyAsString());
						row.put(aggName + "-docCount", bucket.getDocCount());
						row.put(aggName + "-rangForm", bucket.getFrom());
						row.put(aggName + "-rangTo", bucket.getTo());
						bucketsMap.add(row);
					}
				}
			}
		} else if (value instanceof Histogram) {
			Histogram histogram = (Histogram) value;
			for (Histogram.Bucket bucket : histogram.getBuckets()) {
				if (bucket.getAggregations().asMap().isEmpty()){
					Map row = new HashMap();
					row.put("aggName", aggName);
					row.put(aggName + "-key", bucket.getKeyAsString());
					row.put(aggName + "-docCount", bucket.getDocCount());
					bucketsMap.add(row);
				}else{
					List<Map> ress = this.getMetricsResults(clusterName,bucket.getKeyAsString(), bucket.getAggregations().asMap(), select);
					for (Map row : ress) {
						row.put("aggName", aggName);
						row.put(aggName + "-key", bucket.getKeyAsString());
						row.put(aggName + "-docCount", bucket.getDocCount());
						bucketsMap.add(row);
					}
				}
			}
		}
		return bucketsMap;
	}

	@SuppressWarnings({ "rawtypes", "unchecked" })
	private List<Map> getMetricsResults(String clusterName,String aggName, Map<String, Aggregation> aggs, Select select) throws IOException {
		List<Map> results = new ArrayList<Map>();
		Iterator<Entry<String, Aggregation>> iter = aggs.entrySet().iterator();
		Map agg = new HashMap();
		while (iter.hasNext()) {
			Entry<String, Aggregation> entry = iter.next();
			// bucket桶数据获取
			if (entry.getValue() instanceof Terms || entry.getValue() instanceof Range || entry.getValue() instanceof Histogram) {
				results.addAll(getBucketsMap(clusterName,entry.getKey(), entry.getValue(), select));
				// for(Map row:ress){
				// //row.put(aggName+"-key",entry.getKey());
				// results.add(row);
				// }
			} else if (entry.getValue() instanceof ExtendedStats) {// metrics 指标
				ExtendedStats stats = (ExtendedStats) entry.getValue();
				agg.put(entry.getKey() + "-min", stats.getMin());
				agg.put(entry.getKey() + "-max", stats.getMax());
				agg.put(entry.getKey() + "-avg", stats.getAvg());
				agg.put(entry.getKey() + "-sum", stats.getSum());
				agg.put(entry.getKey() + "-count", stats.getCount());
				agg.put(entry.getKey() + "-sum_of_squares", stats.getSumOfSquares());
				agg.put(entry.getKey() + "-std_deviation", stats.getStdDeviation());
				agg.put(entry.getKey() + "-variance", stats.getVariance());
				agg.put(entry.getKey() + "-upper_std_deviation_bounds", stats.getStdDeviationBound(Bounds.UPPER));
				agg.put(entry.getKey() + "-lower_std_deviation_bounds", stats.getStdDeviationBound(Bounds.LOWER));
			} else if (entry.getValue() instanceof Percentiles) {
				Percentiles percs = (Percentiles) entry.getValue();
				Iterator<Percentile> itor = percs.iterator();
				while (itor.hasNext()) {
					Percentile perc = itor.next();
					agg.put(entry.getKey() + "-" + perc.getPercent(), perc.getValue());
				}
			} else if (entry.getValue() instanceof InternalTopHits) {// 多记录返回
				InternalTopHits tophs = (InternalTopHits) entry.getValue();
				select.getFields().clear();
				results.addAll(getHitsResults(clusterName,tophs.getHits(), select, aggName, entry.getKey()));
			} else if (entry.getValue() instanceof Stats) {
				Stats stats = (Stats) entry.getValue();
				agg.put(entry.getKey() + "-min", stats.getMin());
				agg.put(entry.getKey() + "-max", stats.getMax());
				agg.put(entry.getKey() + "-avg", stats.getAvg());
				agg.put(entry.getKey() + "-sum", stats.getSum());
				agg.put(entry.getKey() + "-count", stats.getCount());
			} else if (entry.getValue() instanceof InternalSum) {
				InternalSum sum = (InternalSum) entry.getValue();
				agg.put(entry.getKey(), sum.getValue());
			} else if (entry.getValue() instanceof InternalValueCount) {
				InternalValueCount count = (InternalValueCount) entry.getValue();
				agg.put(entry.getKey(), count.getValue());
			} else if (entry.getValue() instanceof InternalMin) {
				InternalMin min = (InternalMin) entry.getValue();
				agg.put(entry.getKey(), min.getValue());
			} else if (entry.getValue() instanceof InternalMax) {
				InternalMax max = (InternalMax) entry.getValue();
				agg.put(entry.getKey(), max.getValue());
			} else if (entry.getValue() instanceof InternalAvg) {
				InternalAvg avg = (InternalAvg) entry.getValue();
				agg.put(entry.getKey(), avg.getValue());
			} else if (entry.getValue() instanceof InternalCardinality) {
				InternalCardinality cardinality = (InternalCardinality) entry.getValue();
				agg.put(entry.getKey(), cardinality.getValue());
			} else if (entry.getValue() instanceof InternalTerms) {
				agg.put(entry.getKey(), entry.getValue());
			}
		}
		if (!agg.isEmpty())
			results.add(agg);
		return results;
	}

	@SuppressWarnings("rawtypes")
	private boolean hasSource(String clusterName,Select select) {
		Map row = (Map) cacheUtils.get("metaCollector", "es-"+clusterName+"-" + select.getFrom().get(0).getIndex() + "-" + select.getFrom().get(0).getType());
		if (row == null) {// 重新获取元数据定义
			try {
				Client client = this.getEsClient(clusterName);
				SearchDao searchDao = new SearchDao(client);
				GetIndexRequest getIndexRequest = (GetIndexRequest) searchDao.explain("show *").getBuilder().request();
				processGetIndexResponse(client, getIndexRequest, "show *");
				row = (Map) cacheUtils.get("metaCollector", "es-"+clusterName+"-" + select.getFrom().get(0).getIndex() + "-" + select.getFrom().get(0).getType());
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		if (row != null) {
			if (row.get("_source") == null || (Boolean) row.get("_source")) {
				return true;
			}
		}
		return false;
	}

	@SuppressWarnings("rawtypes")
	private List<String> getAllFields(Select select) {
		Map row = (Map) cacheUtils.get("metaCollector", "es-" + select.getFrom().get(0).getIndex() + "-" + select.getFrom().get(0).getType());
		if (row != null) {
			if (row.get("_properties") != null) {
				Map<String, Object> fieldMap = (Map<String, Object>) row.get("_properties");
				return getFieldListName("", fieldMap);
			}
		} else {// todo

		}
		return null;
	}

	@SuppressWarnings({ "unchecked", "rawtypes" })
	private List<String> getFieldListName(String key, Map fieldMap) {
		List<String> fields = new ArrayList<String>();
		Iterator<Map.Entry<String, Object>> iter = fieldMap.entrySet().iterator();
		while (iter.hasNext()) {
			Map.Entry<String, Object> entry = iter.next();
			if (entry.getValue() instanceof Map && ((Map) entry.getValue()).get("properties") != null) {
				fields.addAll(getFieldListName(key + entry.getKey() + ".", (Map) ((Map) entry.getValue()).get("properties")));
			} else {
				fields.add(key + entry.getKey());
			}
		}
		return fields;
	}

	@SuppressWarnings({ "unchecked", "rawtypes" })
	private void putValue2Map(String key, Map row, Map rows) {
		Iterator<Map.Entry<String, Object>> iter = rows.entrySet().iterator();
		while (iter.hasNext()) {
			Map.Entry<String, Object> entry = iter.next();
			if (entry.getValue() instanceof Map) {
				putValue2Map(key + entry.getKey() + ".", row, (Map) entry.getValue());
			} else {
				row.put(key + entry.getKey(), entry.getValue());
			}
		}
	}

	@SuppressWarnings({ "rawtypes", "unchecked", "deprecation" })
	private List<Map> getHitsResults(String clusterName,SearchHits hits, Select select, String aggName, String key) throws IOException {
		List<Map> results = new ArrayList<Map>();
		List<Get> gets = new ArrayList<Get>();
		boolean hasSource = hasSource(clusterName,select);
		// 从Hbase读取当前对象完整数据
		for (SearchHit hit : hits) {
			Map row = new HashMap();
			if (aggName != null)
				row.put("aggName", aggName);
			if (key != null)
				row.put("tophit-key", key);
			if (!hasSource) {
				Get get = new Get(Bytes.toBytes(hit.getId()));
				if (select.getFields().size() > 0) {
					for (Field fitem : select.getFields()) {
						if (!"_id".equalsIgnoreCase(fitem.getName())) {
							get.addColumn(Bytes.toBytes(fitem.getFamilyName()), Bytes.toBytes(fitem.getColumnName()));
						}
					}
				}
				gets.add(get);
			} else {
				if (select.getFields().size() > 0) {
					for (Field fitem : select.getFields()) {
						if (fitem.getColumnName().indexOf(".") < 0) {
							row.put(fitem.getColumnName(), hit.getSource().get(fitem.getColumnName()));
						} else {
							row.put(fitem.getColumnName(), getNestValue2Row(fitem.getColumnName(), hit.getSource()));
						}
					}
				} else {
					List<String> tfields = this.getAllFields(select);
					if (tfields == null) {
						Map rows = hit.getSource();
						putValue2Map("", row, rows);
					} else {
						for (String columnName : tfields) {
							if (columnName.indexOf(".") < 0) {
								row.put(columnName, hit.getSource().get(columnName));
							} else {
								row.put(columnName, getNestValue2Row(columnName, hit.getSource()));
							}
						}
					}
				}
			}
			row.put("id", hit.getId());
			results.add(row);
		}
		if (hasSource) {
			return results;
		}
		if (select.getFields().size() == 1 && "_id".equalsIgnoreCase(select.getFields().get(0).getName())) {// 不需要反查hbase
			return results;
		}

		Table table = HBaseUtils.getTable(select.getFrom().get(0).getHtableName());
		Result[] rs = table.get(gets);
		String fv = null;
		for (Result ur : rs) {
			if (ur != null && !ur.isEmpty()) {
				Map row = new HashMap();
				if (select.getFields().size() > 0) {
					for (Field fitem : select.getFields()) {
						if (!"_id".equalsIgnoreCase(fitem.getName())) {
							fv = Bytes.toString(ur.getValue(Bytes.toBytes(fitem.getFamilyName()), Bytes.toBytes(fitem.getColumnName())));
							if (fv != null) {
								if (HBStringUtils.getJSONType(fv) == HBStringUtils.JSON_TYPE.JSON_TYPE_STRING) {
									if (StringUtils.isEmpty(fitem.getAlias())) {
										row.put(fitem.getName(), fv);
									} else {
										row.put(fitem.getAlias(), fv);
									}
								} else if (HBStringUtils.getJSONType(fv) == HBStringUtils.JSON_TYPE.JSON_TYPE_ARRAY) {
									if (StringUtils.isEmpty(fitem.getAlias())) {
										row.put(fitem.getName(), mapper.readValue(fv, List.class));
									} else {
										row.put(fitem.getAlias(), mapper.readValue(fv, List.class));
									}
								} else if (HBStringUtils.getJSONType(fv) == HBStringUtils.JSON_TYPE.JSON_TYPE_OBJECT) {
									if (StringUtils.isEmpty(fitem.getAlias())) {
										row.put(fitem.getName(), mapper.readValue(fv, HashMap.class));
									} else {
										row.put(fitem.getAlias(), mapper.readValue(fv, HashMap.class));
									}
								}
							}
						}
					}
					row.put("id", Bytes.toString(ur.getRow()));
				} else {
					row.put("id", Bytes.toString(ur.getRow()));
					for (Cell cell : ur.listCells()) {
						fv = Bytes.toString(cell.getValue());
						if (HBStringUtils.getJSONType(fv) == HBStringUtils.JSON_TYPE.JSON_TYPE_STRING) {
							row.put(Bytes.toString(cell.getFamily()) + ":" + Bytes.toString(cell.getQualifier()), fv);
						} else if (HBStringUtils.getJSONType(fv) == HBStringUtils.JSON_TYPE.JSON_TYPE_ARRAY) {
							row.put(Bytes.toString(cell.getFamily()) + ":" + Bytes.toString(cell.getQualifier()), mapper.readValue(fv, List.class));
						} else if (HBStringUtils.getJSONType(fv) == HBStringUtils.JSON_TYPE.JSON_TYPE_OBJECT) {
							row.put(Bytes.toString(cell.getFamily()) + ":" + Bytes.toString(cell.getQualifier()), mapper.readValue(fv, HashMap.class));
						}
					}
				}
				for (int i = 0; i < results.size(); i++) {
					Map rt = results.get(i);
					if (rt.get("id").equals(row.get("id"))) {
						results.remove(i);
						if (aggName != null)
							row.put("aggName", aggName);
						if (key != null)
							row.put("tophit-key", key);
						results.add(i, row);
					}
				}
			}
		}
		return results;
	}

	@SuppressWarnings("rawtypes")
	private Object getNestValue2Row(String columnName, Map source) {
		String firstColumnName = StringUtils.substring(columnName, 0, columnName.indexOf("."));
		String lastColumnName = StringUtils.substring(columnName, columnName.indexOf(".") + 1);
		Map nestSource = (Map) source.get(firstColumnName);
		if (nestSource != null) {
			if (lastColumnName.indexOf(".") < 0) {
				return nestSource.get(lastColumnName);
			} else {
				return getNestValue2Row(lastColumnName, nestSource);
			}
		} else {
			return null;
		}
	}


	@SuppressWarnings({ "rawtypes", "unchecked", "deprecation" })
	@Override
	public Response<List<Map>> getResults(CommonQueryParams params) {
		Response<List<Map>> response = new Response<List<Map>>();
		response.start();
		Client client = null;
		Table table = null;
		try {
			client = getEsClient(params.getClusterName());
			SearchRequestBuilder esRequest = client.prepareSearch(params.getEsIndexName()).setTypes(params.getEsTypeName()).setQuery(params.toQueryBuilder())
					.setFrom(params.getFrom()).setSize(params.getSize());
			for (OrderItem oitem : params.getOrderItems()) {
				esRequest.addSort(oitem.getOrderFieldName(), getOrder(oitem.getOrder()));
			}
			SearchResponse esResponse = esRequest.execute().actionGet();
			SearchHits hits = esResponse.getHits();
			response.setTotal(hits.getTotalHits());
			response.setStart(params.getFrom());
			response.setStatus(Constants.STATUS_OK);
			if (response.getTotal() == 0) {// 查询结果为空
				response.setMsg(Constants.MSG_SUCCESS_EMPTY);
			} else {// 处理查询结果
				response.setMsg(Constants.MSG_SUCCESS);
				List<Map> results = new ArrayList<Map>();
				List<Get> gets = new ArrayList<Get>();
				// 从Hbase读取当前对象完整数据
				for (SearchHit hit : hits) {
					Map row = new HashMap();
					Get get = new Get(Bytes.toBytes(hit.getId()));
					if (params.getSelectColumns().size() > 0) {
						for (FieldItem fitem : params.getSelectColumns()) {
							if (!"_id".equalsIgnoreCase(fitem.getFieldName())) {
								get.addColumn(Bytes.toBytes(fitem.getFamilyName()), Bytes.toBytes(fitem.getFieldName()));
							}
						}
					}
					row.put("id", hit.getId());
					gets.add(get);
					results.add(row);
				}
				table = HBaseUtils.getTable(params.getHtableName());
				Result[] rs = table.get(gets);
				String fv = null;
				for (Result ur : rs) {
					if (ur != null && !ur.isEmpty()) {
						Map row = new HashMap();
						if (params.getSelectColumns().size() > 0) {
							for (FieldItem fitem : params.getSelectColumns()) {
								if (!"_id".equalsIgnoreCase(fitem.getFieldName())) {
									fv = Bytes.toString(ur.getValue(Bytes.toBytes(fitem.getFamilyName()), Bytes.toBytes(fitem.getFieldName())));
									if (HBStringUtils.getJSONType(fv) == HBStringUtils.JSON_TYPE.JSON_TYPE_STRING) {
										row.put(fitem.getFieldName(), fv);
									} else if (HBStringUtils.getJSONType(fv) == HBStringUtils.JSON_TYPE.JSON_TYPE_ARRAY) {
										row.put(fitem.getFieldName(), mapper.readValue(fv, List.class));
									} else if (HBStringUtils.getJSONType(fv) == HBStringUtils.JSON_TYPE.JSON_TYPE_OBJECT) {
										row.put(fitem.getFieldName(), mapper.readValue(fv, HashMap.class));
									}
								} else {
									row.put("id", Bytes.toString(ur.getRow()));
								}
							}
						} else {
							row.put("id", Bytes.toString(ur.getRow()));
							for (Cell cell : ur.listCells()) {
								fv = Bytes.toString(cell.getValue());
								if (HBStringUtils.getJSONType(fv) == HBStringUtils.JSON_TYPE.JSON_TYPE_STRING) {
									row.put(Bytes.toString(cell.getFamily()) + ":" + Bytes.toString(cell.getQualifier()), fv);
								} else if (HBStringUtils.getJSONType(fv) == HBStringUtils.JSON_TYPE.JSON_TYPE_ARRAY) {
									row.put(Bytes.toString(cell.getFamily()) + ":" + Bytes.toString(cell.getQualifier()), mapper.readValue(fv, List.class));
								} else if (HBStringUtils.getJSONType(fv) == HBStringUtils.JSON_TYPE.JSON_TYPE_OBJECT) {
									row.put(Bytes.toString(cell.getFamily()) + ":" + Bytes.toString(cell.getQualifier()), mapper.readValue(fv, HashMap.class));
								}
							}
						}
						for (int i = 0; i < results.size(); i++) {
							Map rt = results.get(i);
							if (rt.get("id").equals(row.get("id"))) {
								results.remove(i);
								results.add(i, row);
							}
						}
					}
				}
				response.setData(results);
			}
			response.end();
		} catch (Exception ex) {
			logger.error(ex.getMessage());
			response.setTotal(0);
			ex.printStackTrace();
			response.setStatus(Constants.STATUS_FAIL);
			response.error(Constants.MSG_FAIL + "," + ex.getMessage());
			response.end();
		} finally {
			HBaseUtils.doCloseTable(table);
		}
		return response;
	}

	private SortOrder getOrder(String order) {
		if ("asc".equalsIgnoreCase(order)) {
			return SortOrder.ASC;
		} else {
			return SortOrder.DESC;
		}
	}
	
}
