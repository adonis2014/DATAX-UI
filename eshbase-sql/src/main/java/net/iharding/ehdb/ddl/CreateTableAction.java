package net.iharding.ehdb.ddl;

import net.iharding.core.model.Response;
import net.iharding.ehdb.QueryAction;
import net.iharding.ehdb.ehsql.SQLRequest;
import net.iharding.ehdb.exception.NotSupportedException;
import net.sf.jsqlparser.statement.Statement;

import org.elasticsearch.client.Client;

public class CreateTableAction extends QueryAction {

	public CreateTableAction(Client client, Statement query) {
		super(client, query);
		// TODO Auto-generated constructor stub
	}

	@Override
	public SQLRequest explain() throws NotSupportedException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Response<?> extcute() {
		// TODO Auto-generated method stub
		return null;
	}

}
