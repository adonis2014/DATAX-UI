package net.iharding.ehdb.dml;


import net.iharding.core.model.Response;
import net.iharding.ehdb.QueryAction;
import net.iharding.ehdb.ehsql.SQLRequest;
import net.sf.jsqlparser.statement.delete.Delete;

import org.elasticsearch.client.Client;

public class DeleteQueryAction extends QueryAction {

	private final Delete delete;



	public DeleteQueryAction(Client client, Delete delete) {
		super(client, delete);
		this.delete = delete;
	}


	@Override
	public SQLRequest explain()  {
		
		return null;
	}


	/**
	 * Set indices and types to the delete by query request.
	 */
	private void setIndicesAndTypes() {
		
	}


	

	@Override
	public Response<?> extcute() {
		// TODO Auto-generated method stub
		return null;
	}

}
