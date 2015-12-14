package net.iharding.ehdb;

import net.iharding.core.model.Response;
import net.iharding.ehdb.ehsql.SQLRequest;
import net.sf.jsqlparser.JSQLParserException;
import net.sf.jsqlparser.statement.Statement;

import org.elasticsearch.client.Client;

/**
 * Abstract class. used to transform Select object (Represents SQL query) to
 * SearchRequestBuilder (Represents ES query)
 */
public abstract class QueryAction {

	protected Statement query;

	protected Client client;


	public QueryAction(Client client, Statement query) {
		this.client = client;
		this.query = query;
	}


	/**
	 * Prepare the request, and return ES request.
	 * @return ActionRequestBuilder (ES request)
	 * @throws JSQLParserException
	 */
	public abstract SQLRequest explain() throws JSQLParserException;
	
	/**
	 * 执行查询获取结果
	 * @return
	 */
	public abstract Response<?> extcute() ;

}
