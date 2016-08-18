package net.iharding.plugin.eshbasesql;

import java.util.List;
import java.util.Map;

import net.iharding.core.model.Response;
import net.iharding.ehdb.SearchDao;
import net.iharding.ehdb.ehsql.SQLRequest;
import net.iharding.ehdb.ehsql.query.explain.ExPlainManager;
import net.iharding.utils.HBaseUtils;

import org.elasticsearch.client.Client;
import org.elasticsearch.common.inject.Inject;
import org.elasticsearch.common.settings.Settings;
import org.elasticsearch.rest.BaseRestHandler;
import org.elasticsearch.rest.BytesRestResponse;
import org.elasticsearch.rest.RestChannel;
import org.elasticsearch.rest.RestController;
import org.elasticsearch.rest.RestRequest;
import org.elasticsearch.rest.RestStatus;

import com.fasterxml.jackson.databind.ObjectMapper;




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
		SearchDao searchDao = new SearchDao(client,HBaseUtils.getHBaseConnection());
		//获取解析sql为ES request对象
		SQLRequest actionRequest = searchDao.explain(sql);

		if (request.path().endsWith("/_explain")) {//显示执行计划内容
			String jsonExplanation = ExPlainManager.explain(actionRequest);
			BytesRestResponse bytesRestResponse = new BytesRestResponse(RestStatus.OK, jsonExplanation);
			channel.sendResponse(bytesRestResponse);
		} else {
			Response<List<Map>> response = new Response<List<Map>>();
			response.start();
			
			response.end();
			BytesRestResponse bytesRestResponse = new BytesRestResponse(RestStatus.OK, mapper.writeValueAsString(response));
			channel.sendResponse(bytesRestResponse);
		}
	}
}
