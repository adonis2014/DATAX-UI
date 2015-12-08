package net.iharding.plugin.eshbasesql;


import net.iharding.ehsql.ESSearchRequest;

import org.elasticsearch.client.Client;
import org.elasticsearch.rest.RestChannel;


public class ActionRequestExecuter {

	private RestChannel channel;
	private Client client;
	private ESSearchRequest request;

	public ActionRequestExecuter(ESSearchRequest request, RestChannel channel, final Client client) {
		this.request = request;
		this.channel = channel;
		this.client = client;
	}

	/**
	 * Execute the ActionRequest and returns the REST response using the channel.
	 */
	public void execute() throws Exception {
//		request.listenerThreaded(false);

//		if (request instanceof SearchRequest) {
//			client.prepareSearch("userfigure").setTypes("types").setQuery(queryBuilder)
//			client.search((SearchRequest) request, new RestStatusToXContentListener<SearchResponse>(channel));
//		} else if (request instanceof DeleteByQueryRequest) {
//			client.deleteByQuery((DeleteByQueryRequest) request, new DeleteByQueryRestListener(channel));
//		}
//		else {
//			throw new Exception(String.format("Unsupported ActionRequest provided: %s", request.getClass().getName()));
//		}
	}

}

