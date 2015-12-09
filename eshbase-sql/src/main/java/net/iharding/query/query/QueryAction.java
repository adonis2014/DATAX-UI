package net.iharding.query.query;

import net.iharding.ehsql.ESSearchRequest;
import net.iharding.query.domain.Query;
import net.iharding.query.exception.SqlParseException;

import org.elasticsearch.client.Client;

/**
 * Abstract class. used to transform Select object (Represents SQL query) to
 * SearchRequestBuilder (Represents ES query)
 */
public abstract class QueryAction {

	protected net.iharding.query.domain.Query query;

	protected Client client;


	public QueryAction(Client client, Query query) {
		this.client = client;
		this.query = query;
	}


	/**
	 * Prepare the request, and return ES request.
	 * @return ActionRequestBuilder (ES request)
	 * @throws SqlParseException
	 */
	public abstract ESSearchRequest explain() throws SqlParseException;

}
