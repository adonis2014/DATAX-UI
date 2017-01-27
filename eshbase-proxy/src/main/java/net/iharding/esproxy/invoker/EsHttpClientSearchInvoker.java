package net.iharding.esproxy.invoker;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import net.iharding.esproxy.exchange.Response;
import net.iharding.esproxy.threadpool.EsHttpClientTask;
import net.iharding.esproxy.throttle.EsThrottle;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.FutureTask;
import java.util.concurrent.RunnableFuture;
import java.util.concurrent.ThreadPoolExecutor;

/**
 * Created by yuxuefeng on 15/9/17.
 */
public class EsHttpClientSearchInvoker extends AbstractInvoker {
    protected static Logger logger = LoggerFactory.getLogger(EsJavaHttpWriteInvoker.class);
    private final EsThrottle esSearchThrottle;
    private final String url;
    private final String targetNode;
    private final String requestData;
    private final long timeout;
    private final String sync;

    private final HttpServletRequest request;
    private final Response response;
    private final Map<String, String> parameters;

    public EsHttpClientSearchInvoker(EsThrottle esSearchThrottle, String url, String targetNode, HttpServletRequest request) {
        this(esSearchThrottle, url, "", 3000, "true", targetNode, request);
    }

    public EsHttpClientSearchInvoker(EsThrottle esSearchThrottle, String url, String requestData, long timeout, String sync, String targetNode, HttpServletRequest request) {
        this(esSearchThrottle, url, requestData, timeout, sync, new Response(), new ConcurrentHashMap<String, String>(), targetNode, request);
    }

    public EsHttpClientSearchInvoker(EsThrottle esSearchThrottle, String url, String requestData, long timeout, String sync, Response response, Map<String, String> parameters, String targetNode, HttpServletRequest request) {
        this.esSearchThrottle = esSearchThrottle;
        this.url = url;
        this.requestData = requestData;
        this.timeout = timeout;
        this.sync = sync;
        this.response = response;
        this.parameters = parameters;
        this.targetNode = targetNode;
        this.request = request;
    }

    @Override
    public Response getResponse() {
        return response;
    }

    @Override
    public Map<String, String> getParameters() {
        return parameters;
    }

    public EsThrottle getEsSearchThrottle() {
        return esSearchThrottle;
    }

    @Override
    public String getUrl() {
        return url;
    }

    @Override
    protected RunnableFuture<String> doInvoke() {
        return new FutureTask<String>(new EsHttpClientTask(url, requestData, esSearchThrottle, request));
    }

    @Override
    public String getTargetNode() {
        return targetNode;
    }

    @Override
    public String getRequestData() {
        return requestData;
    }

    @Override
    public HttpServletRequest getRequest() {
        return request;
    }

    @Override
    public String getSync() {
        return sync;
    }

    @Override
    protected ThreadPoolExecutor getExecutor() {
        //获得查询executor
        return esSearchThrottle.getSearchExecutor();
    }

    @Override
    public long getTimeout() {
        return timeout;
    }
}
