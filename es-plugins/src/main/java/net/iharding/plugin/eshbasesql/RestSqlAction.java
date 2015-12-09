package net.iharding.plugin.eshbasesql;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.iharding.Constants;
import net.iharding.core.model.Response;
import net.iharding.ehsql.ESSearchRequest;
import net.iharding.ehsql.query.explain.ExPlainManager;
import net.iharding.query.SearchDao;
import net.iharding.utils.HBaseUtils;

import org.apache.hadoop.hbase.client.Get;
import org.apache.hadoop.hbase.client.Result;
import org.apache.hadoop.hbase.client.Table;
import org.apache.hadoop.hbase.util.Bytes;
import org.codehaus.jackson.map.ObjectMapper;
import org.elasticsearch.action.search.SearchRequestBuilder;
import org.elasticsearch.action.search.SearchResponse;
import org.elasticsearch.client.Client;
import org.elasticsearch.common.inject.Inject;
import org.elasticsearch.common.settings.Settings;
import org.elasticsearch.rest.BaseRestHandler;
import org.elasticsearch.rest.BytesRestResponse;
import org.elasticsearch.rest.RestChannel;
import org.elasticsearch.rest.RestController;
import org.elasticsearch.rest.RestRequest;
import org.elasticsearch.rest.RestStatus;
import org.elasticsearch.search.SearchHit;
import org.elasticsearch.search.SearchHits;
import org.elasticsearch.search.sort.SortBuilder;




public class RestSqlAction extends BaseRestHandler {
	
	ObjectMapper mapper=new ObjectMapper();

	@Inject
	public RestSqlAction(Settings settings, Client client, RestController restController) {
		super(settings, restController, client);
		restController.registerHandler(RestRequest.Method.POST, "/eshbasesql/_explain", this);
		restController.registerHandler(RestRequest.Method.GET, "/eshbasesql/_explain", this);
		restController.registerHandler(RestRequest.Method.POST, "/eshbasesql", this);
		restController.registerHandler(RestRequest.Method.GET, "/eshbasesql", this);
	}

	@SuppressWarnings("rawtypes")
	@Override
	protected void handleRequest(RestRequest request, RestChannel channel, final Client client) throws Exception {
		String sql = request.param("sql");
		if (sql == null) {
			sql = request.content().toUtf8();
		}
		SearchDao searchDao = new SearchDao(client);
		//获取解析sql为ES request对象
		ESSearchRequest actionRequest = searchDao.explain(sql);

		if (request.path().endsWith("/_explain")) {
			String jsonExplanation = ExPlainManager.explain(actionRequest);
			BytesRestResponse bytesRestResponse = new BytesRestResponse(RestStatus.OK, jsonExplanation);
			channel.sendResponse(bytesRestResponse);
		} else {
			Response<List<Map>> response = new Response<List<Map>>();
			response.start();
			SearchRequestBuilder esRequest = client.prepareSearch(actionRequest.getIndexName()).setTypes(actionRequest.getTypeNames())
					.setQuery(actionRequest.getQb()).setFrom(actionRequest.getFrom())
					.setSize(actionRequest.getSize());
			for (SortBuilder oitem : actionRequest.getSorts()) {
				esRequest.addSort(oitem);
			}
			SearchResponse esResponse = esRequest.execute().actionGet();
			SearchHits hits = esResponse.getHits();
			response.setTotal(hits.getTotalHits());
			response.setStart(actionRequest.getFrom());
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
//					for (FieldItem fitem : params.getSelectColumns()) {
//						if (!"_id".equalsIgnoreCase(fitem.getFieldName())) {
//							get.addColumn(Bytes.toBytes(fitem.getFamilyName()), Bytes.toBytes(fitem.getFieldName()));
//						}
//					}
					row.put("id",hit.getId());
					gets.add(get);
					results.add(row);
				}
				Table table = HBaseUtils.getTable(actionRequest.getHtableName());
				Result[] rs = table.get(gets);
				String fv = null;
				for (Result ur : rs) {
					if (ur != null && !ur.isEmpty()) {
						Map row = new HashMap();
//						for (FieldItem fitem : params.getSelectColumns()) {
//							if (!"_id".equalsIgnoreCase(fitem.getFieldName())) {
//								fv = Bytes.toString(ur.getValue(Bytes.toBytes(fitem.getFamilyName()), Bytes.toBytes(fitem.getFieldName())));
//								if (HBStringUtils.getJSONType(fv) == HBStringUtils.JSON_TYPE.JSON_TYPE_STRING) {
//									row.put(fitem.getFieldName(), fv);
//								} else if (HBStringUtils.getJSONType(fv) == HBStringUtils.JSON_TYPE.JSON_TYPE_ARRAY) {
//									row.put(fitem.getFieldName(), mapper.readValue(fv, List.class));
//								} else if (HBStringUtils.getJSONType(fv) == HBStringUtils.JSON_TYPE.JSON_TYPE_OBJECT) {
//									row.put(fitem.getFieldName(), mapper.readValue(fv, HashMap.class));
//								}
//							} else {
//								row.put("id", Bytes.toString(ur.getRow()));
//							}
//						}
						for(int i=0;i<results.size();i++){
							 Map rt=results.get(i);
							if (rt.get("id").equals(row.get("id"))){
								results.remove(i);
								results.add(i,row);
							}
						}
					} 
				}
				response.setData(results);
			}
			response.end();
			BytesRestResponse bytesRestResponse = new BytesRestResponse(RestStatus.OK, mapper.writeValueAsString(response));
			channel.sendResponse(bytesRestResponse);
		}
	}
}
