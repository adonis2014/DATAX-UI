package net.iharding.ehdb;

import java.sql.SQLFeatureNotSupportedException;
import java.util.HashSet;
import java.util.Set;

import net.iharding.ehdb.ehsql.ESSearchRequest;
import net.iharding.ehdb.ehsql.SQLRequest;
import net.iharding.ehdb.exception.ErrorSqlException;
import net.iharding.ehdb.exception.NotSupportedException;
import net.iharding.ehdb.query.ESActionFactory;
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
	 * @throws NotSupportedException 
	 * @throws ErrorSqlException 
	 * @throws SqlParseException
	 */
	public SQLRequest explain(String sql) throws JSQLParserException, NotSupportedException, ErrorSqlException  {

		QueryAction query = ESActionFactory.create(client, sql);
		return query.explain();
	}

}
