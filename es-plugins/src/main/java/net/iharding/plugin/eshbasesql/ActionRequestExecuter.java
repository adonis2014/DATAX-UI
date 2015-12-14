package net.iharding.plugin.eshbasesql;


import net.iharding.Constants;
import net.iharding.ehdb.ehsql.ESSearchRequest;

import org.elasticsearch.client.Client;


public class ActionRequestExecuter {

	private Client client;
	private ESSearchRequest request;

	public ActionRequestExecuter(ESSearchRequest request,final Client client) {
		this.request = request;
		this.client = client;
	}

	/**
	 * Execute the ActionRequest and returns the REST response using the channel.
	 */
	public void execute() throws Exception {

		if (request.getRequestType()==Constants.ES_REQUEST_TYPE_SEARCH) {//基本select查询
//			client.prepareSearch(request.getIndexName()).setTypes(request.getTypeNames()).setQuery(request.getQb()).addSort(request.getSort());
			
		} else if (request.getRequestType()==Constants.ES_REQUEST_TYPE_DELETE_INDEX) {//删除索引
//			client.deleteByQuery((DeleteByQueryRequest) request, new DeleteByQueryRestListener(channel));
		}else {
			throw new Exception(String.format("Unsupported ActionRequest provided: %s", request.getClass().getName()));
		}
	}

}

