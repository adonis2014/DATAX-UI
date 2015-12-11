package net.iharding.query;

import java.sql.SQLFeatureNotSupportedException;
import java.util.HashSet;
import java.util.Set;

import net.iharding.ehsql.ESSearchRequest;
import net.iharding.query.exception.SqlParseException;
import net.iharding.query.query.ESActionFactory;
import net.iharding.query.query.QueryAction;
import net.sf.jsqlparser.JSQLParserException;

import org.elasticsearch.client.Client;


public class SearchDao {

	private static final Set<String> END_TABLE_MAP = new HashSet<>();

	static {
		END_TABLE_MAP.add("limit");
		END_TABLE_MAP.add("order");
		END_TABLE_MAP.add("where");
		END_TABLE_MAP.add("group");

	}

	private Client client = null;


	public SearchDao(Client client) {
		this.client = client;
	}


	/**
	 * Prepare action And transform sql
	 * into ES ActionRequest
	 * @param sql SQL query to execute.
	 * @return ES request
	 * @throws JSQLParserException 
	 * @throws SqlParseException
	 */
	public ESSearchRequest explain(String sql) throws JSQLParserException  {

		QueryAction query = ESActionFactory.create(client, sql);
		return query.explain();
	}

}
