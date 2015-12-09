package net.iharding.ehsql.query.explain;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.sql.SQLFeatureNotSupportedException;

import net.iharding.ehsql.ESSearchRequest;

import org.elasticsearch.action.deletebyquery.DeleteByQueryRequestBuilder;
import org.elasticsearch.action.search.SearchRequestBuilder;
import org.elasticsearch.action.support.QuerySourceBuilder;
import org.elasticsearch.common.xcontent.ToXContent;
import org.elasticsearch.common.xcontent.XContentBuilder;
import org.elasticsearch.common.xcontent.XContentFactory;
import org.elasticsearch.common.xcontent.XContentType;

/**
 * 编写显示执行计划.
 */
public class ExPlainManager {

	public static String explain(ESSearchRequest actionRequest) throws IOException, NoSuchMethodException, InvocationTargetException, IllegalAccessException, SQLFeatureNotSupportedException {
		XContentBuilder builder = XContentFactory.contentBuilder(XContentType.JSON).prettyPrint();

//		if (actionRequest instanceof SearchRequestBuilder) {
//			((SearchRequestBuilder) actionRequest).internalBuilder().toXContent(builder, ToXContent.EMPTY_PARAMS);
//		} else if (actionRequest instanceof DeleteByQueryRequestBuilder) {
//			// access private method to get the explain...
//			DeleteByQueryRequestBuilder deleteRequest = ((DeleteByQueryRequestBuilder) actionRequest);
//			Method method = deleteRequest.getClass().getDeclaredMethod("sourceBuilder");
//			method.setAccessible(true);
//			QuerySourceBuilder sourceBuilder = (QuerySourceBuilder) method.invoke(deleteRequest);
//			sourceBuilder.toXContent(builder, ToXContent.EMPTY_PARAMS);
//		} else {
//			throw new SQLFeatureNotSupportedException(String.format("Failed to explain class %s", actionRequest.getClass().getName()));
//		}

		return builder.string();
	}
}
