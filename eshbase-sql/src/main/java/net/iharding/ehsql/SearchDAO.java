package net.iharding.ehsql;

import java.sql.SQLFeatureNotSupportedException;

import org.elasticsearch.action.ActionRequestBuilder;
import org.elasticsearch.client.Client;
import org.nlpcn.es4sql.exception.SqlParseException;
import org.nlpcn.es4sql.query.ESActionFactory;
import org.nlpcn.es4sql.query.QueryAction;

public class SearchDAO {

	private Client client = null;


	public SearchDAO(Client client) {
		this.client = client;
	}


	/**
	 * Prepare action And transform sql
	 * into ES ActionRequest
	 * @param sql SQL query to execute.
	 * @return ES request
	 * @throws SqlParseException
	 */
	public ActionRequestBuilder explain(String sql) throws SqlParseException, SQLFeatureNotSupportedException {

		QueryAction query = ESActionFactory.create(client, sql);
		return query.explain();
	}
}
