package net.iharding.query.query;


import net.iharding.ehsql.ESSearchRequest;
import net.iharding.query.domain.Delete;
import net.iharding.query.domain.Select;
import net.iharding.query.domain.Where;
import net.iharding.query.exception.SqlParseException;
import net.iharding.query.query.maker.FilterMaker;
import net.iharding.query.query.maker.QueryMaker;

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
	public ESSearchRequest explain() throws SqlParseException {
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
	private void setWhere(Where where) throws SqlParseException {
		if (where != null) {
			BoolFilterBuilder boolFilter = FilterMaker.explan(where);
			request.setQuery(QueryBuilders.filteredQuery(null, boolFilter));
		} else {
			request.setQuery(QueryBuilders.matchAllQuery());
		}
	}

}
