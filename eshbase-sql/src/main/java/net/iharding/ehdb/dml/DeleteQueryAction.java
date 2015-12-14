package net.iharding.ehdb.dml;


import net.iharding.core.model.Response;
import net.iharding.ehdb.QueryAction;
import net.iharding.ehdb.ehsql.ESSearchRequest;
import net.iharding.ehdb.ehsql.SQLRequest;
import net.iharding.ehdb.query.maker.FilterMaker;
import net.iharding.ehdb.query.maker.QueryMaker;
import net.sf.jsqlparser.statement.Statement;
import net.sf.jsqlparser.statement.delete.Delete;

import org.elasticsearch.action.deletebyquery.DeleteByQueryRequestBuilder;
import org.elasticsearch.action.search.SearchRequestBuilder;
import org.elasticsearch.client.Client;
import org.elasticsearch.index.query.BoolFilterBuilder;
import org.elasticsearch.index.query.BoolQueryBuilder;
import org.elasticsearch.index.query.QueryBuilders;

public class DeleteQueryAction extends QueryAction {

	private final Delete delete;
	private DeleteByQueryRequestBuilder request;



	public DeleteQueryAction(Client client, Delete delete) {
		super(client, delete);
		this.delete = delete;
	}


	@Override
	public SQLRequest explain()  {
		this.request = client.prepareDeleteByQuery();
		request.setListenerThreaded(false);

		setIndicesAndTypes();
		setWhere(delete.getWhere());
		return request;
	}


	/**
	 * Set indices and types to the delete by query request.
	 */
	private void setIndicesAndTypes() {
		request.setIndices(query.getIndexArr());

		String[] typeArr = query.getTypeArr();
		if (typeArr != null) {
			request.setTypes(typeArr);
		}
	}


	/**
	 * Create filters based on
	 * the Where clause.
	 *
	 * @param where the 'WHERE' part of the SQL query.
	 * @throws SqlParseException
	 */
	private void setWhere(Where where)  {
		if (where != null) {
			BoolFilterBuilder boolFilter = FilterMaker.explan(where);
			request.setQuery(QueryBuilders.filteredQuery(null, boolFilter));
		} else {
			request.setQuery(QueryBuilders.matchAllQuery());
		}
	}


	@Override
	public Response<?> extcute() {
		// TODO Auto-generated method stub
		return null;
	}

}
