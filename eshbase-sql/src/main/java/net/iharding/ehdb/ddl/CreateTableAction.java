package net.iharding.ehdb.ddl;

import org.elasticsearch.client.Client;

import net.iharding.core.model.Response;
import net.iharding.ehdb.QueryAction;
import net.iharding.ehdb.ehsql.SQLRequest;
import net.sf.jsqlparser.JSQLParserException;
import net.sf.jsqlparser.statement.Statement;

public class CreateTableAction extends QueryAction {

	public CreateTableAction(Client client, Statement query) {
		super(client, query);
		// TODO Auto-generated constructor stub
	}

	@Override
	public SQLRequest explain() throws JSQLParserException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Response<?> extcute() {
		// TODO Auto-generated method stub
		return null;
	}

}
