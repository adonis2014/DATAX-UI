package net.iharding.esproxy.threadpool;

import java.io.IOException;
import java.util.concurrent.Callable;

import javax.servlet.http.HttpServletRequest;

import org.elasticsearch.action.ActionRequestBuilder;
import org.elasticsearch.action.ActionRequestValidationException;
import org.elasticsearch.action.search.SearchRequestBuilder;
import org.elasticsearch.action.search.SearchResponse;
import org.elasticsearch.client.transport.TransportClient;
import org.json.JSONException;
import org.nlpcn.es4sql.SearchDao;
import org.nlpcn.es4sql.query.SqlElasticRequestBuilder;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.github.eswrapper.util.Constants;

import net.iharding.esproxy.client.ClientFactory;
import net.iharding.esproxy.exception.InvokeException;
import net.iharding.esproxy.model.Consist;
import net.iharding.esproxy.throttle.EsThrottle;

public class EsSQLClientTask implements Callable<String> {

	 private static Logger logger = LoggerFactory.getLogger(EsSQLClientTask.class);
	    String defaultIndex = null;
	    String defaultType = Consist.DEFAULT_TYPE;
	    private HttpServletRequest request;
	    private EsThrottle esThrottle;
	    private String username;
	    private String password;

	    public EsSQLClientTask(EsThrottle esThrottle, HttpServletRequest request) {
	        this.esThrottle = esThrottle;
	        this.request = request;
	        this.username=(String)esThrottle.getConfigs().get(Constants.ES_SHIELD_USER);
	        this.password=(String)esThrottle.getConfigs().get(Constants.ES_SHIELD_PASSWORD);
	    }

	    @Override
	    public String call() throws Exception {
	        String res = "";
	        TransportClient client = (TransportClient) ClientFactory.generateTransportClient(esThrottle,username,password);

	        try {
	        	SearchRequestBuilder searchRequest = generateSearchRequest(client);
	        	SearchResponse searchResponse = searchRequest.execute().actionGet();
	            if (searchResponse.getShardFailures().length==0) {
	                return "Es Search operations success ! HitSize:[" + searchResponse.getHits().getTotalHits() + "]\n";
	            }
	            long failureCount = searchResponse.getShardFailures().length;
	            //todo 解析返回结果
	            
	            return "Es Bulk failure,Count:[" + failureCount + "],Exception msg:" + searchResponse.getShardFailures().toString() + "\n";
	        } catch (ActionRequestValidationException e) {
	            logger.error("Fail to send Java_Client [search] request, because no requestActions added,\nException message:" + e.getMessage() + "\n");
	            res = e.getMessage() + "\n";
	        } catch (Exception e) {
	            logger.error("Fail to send Java_Client [search] request\nException message:" + e.getMessage() + "\n");
	            res = e.getMessage() + "\n";
	        }
	        throw new InvokeException("Send ES [search] Request Error,Original Exception message:\n" + res);
	    }

	    @SuppressWarnings("rawtypes")
		private SearchRequestBuilder generateSearchRequest(TransportClient client) throws IOException, JSONException {
	    	String sql=request.getParameter("sql");
	    	SearchDao searchDao = new SearchDao(client);
			SqlElasticRequestBuilder actionRequestBuilder;
			try {
				actionRequestBuilder = searchDao.explain(sql);
				ActionRequestBuilder requestBuilder = actionRequestBuilder.getBuilder();
				if (requestBuilder instanceof SearchRequestBuilder){
					return (SearchRequestBuilder)requestBuilder;
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			return null;
	    }

	   


}
