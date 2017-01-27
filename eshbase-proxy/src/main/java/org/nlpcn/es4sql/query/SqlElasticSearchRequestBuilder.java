package org.nlpcn.es4sql.query;

import java.io.IOException;

import org.elasticsearch.action.ActionRequest;
import org.elasticsearch.action.ActionRequestBuilder;
import org.elasticsearch.action.ActionResponse;
import org.elasticsearch.action.search.SearchRequestBuilder;
import org.elasticsearch.common.xcontent.ToXContent;
import org.elasticsearch.common.xcontent.XContentBuilder;
import org.elasticsearch.common.xcontent.XContentFactory;
import org.elasticsearch.common.xcontent.XContentType;
import org.nlpcn.es4sql.domain.Select;

/**
 * Created by Eliran on 19/8/2015.
 */
public class SqlElasticSearchRequestBuilder implements SqlElasticRequestBuilder {
    SearchRequestBuilder requestBuilder;
    private Select select;


    public SqlElasticSearchRequestBuilder(SearchRequestBuilder requestBuilder,Select select) {
        this.requestBuilder = requestBuilder;
        this.select=select;
    }

    @Override
    public ActionRequest request() {
        return requestBuilder.request();
    }

    @Override
    public String explain() {
        try {
            XContentBuilder builder = XContentFactory.contentBuilder(XContentType.JSON).prettyPrint();
            requestBuilder.internalBuilder().toXContent(builder, ToXContent.EMPTY_PARAMS);
            return builder.string();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public ActionResponse get() {
        return requestBuilder.get();
    }
    
    public Select getSelect() {
		return select;
	}

    @Override
    public ActionRequestBuilder getBuilder() {
        return requestBuilder;
    }

    @Override
    public String toString(){
        return this.requestBuilder.toString();
    }
}
