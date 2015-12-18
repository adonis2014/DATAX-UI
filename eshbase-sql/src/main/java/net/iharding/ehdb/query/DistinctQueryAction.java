package net.iharding.ehdb.query;

import org.elasticsearch.client.Client;

import net.iharding.core.model.Response;
import net.iharding.ehdb.QueryAction;
import net.iharding.ehdb.ehsql.SQLRequest;
import net.iharding.ehdb.exception.NotSupportedException;
import net.sf.jsqlparser.JSQLParserException;
import net.sf.jsqlparser.statement.Statement;

public class DistinctQueryAction extends QueryAction {

	public DistinctQueryAction(Client client, Statement query) {
		super(client, query);
	}

	@Override
	public SQLRequest explain()   throws NotSupportedException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Response<?> extcute() {
		// TODO Auto-generated method stub
		return null;
	}

}
