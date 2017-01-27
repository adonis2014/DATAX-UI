package net.iharding.esproxy.http.manager;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import net.iharding.esproxy.config.CommonConfig;
import net.iharding.esproxy.exception.InvokeException;
import net.iharding.esproxy.exchange.Response;
import net.iharding.esproxy.invoker.Invoker;
import net.iharding.esproxy.invoker.InvokerFactory;
import net.iharding.esproxy.model.Consist;
import net.iharding.esproxy.model.SearchModel;
import net.iharding.esproxy.throttle.EsThrottle;
import net.iharding.esproxy.throttle.EsThrottleFactory;

/**
 * Created by yuxuefeng on 15/9/15.
 */
@Service("esWrapperManager")
public class ESWrapperManagerImpl extends BaseManager implements ESWrapperManager {
    protected static Logger logger = LoggerFactory.getLogger(ESWrapperManagerImpl.class);
    @Autowired
    private InvokerFactory invokerFactory;

    public ESWrapperManagerImpl() {
    }

    @Override
    public Response search(SearchModel searchModel) {
        String clusterName = CommonConfig.commonConfig.getString(Consist.DEFAULT_CLUSTER_NAME, CommonConfig.defaultClusterName);
        String queryStr = searchModel.getRequest().getQueryString();
        clusterName = getString(queryStr, Consist.CLUSTER_NAME, clusterName);
        try {
            EsThrottle esSearchThrottle = EsThrottleFactory.getEsSearchThrottleByClusteName(clusterName);

            //InvokerWrapper
            Invoker invoker = invokerFactory.generateEsHttpSearchInvoker(esSearchThrottle, searchModel);
            //执行调用
            Response response = invoker.invoke();

            return response;

        } catch (InvokeException e) {
            return new Response(e.getCode(), buildJsonStr(new Response(e.getCode(), e.getMessage())));
        }
    }

    @Override
    public Response write(SearchModel searchModel) {
        String clusterName = CommonConfig.commonConfig.getString(Consist.DEFAULT_CLUSTER_NAME, CommonConfig.defaultClusterName);
        String queryStr = searchModel.getRequest().getQueryString();
        clusterName = getString(queryStr, Consist.CLUSTER_NAME, clusterName);
        try {
            EsThrottle esSearchThrottle = EsThrottleFactory.getEsSearchThrottleByClusteName(clusterName);

            //InvokerWrapper
            Invoker invoker = invokerFactory.generateEsHttpWriteInvoker(esSearchThrottle, searchModel);
//            Invoker invoker = invokerFactory.generateEsHttpClientWriteInvoker(esSearchThrottle, searchModel);
            //执行调用
            Response response = invoker.invoke();

            return response;

        } catch (InvokeException e) {
            return new Response(e.getCode(), buildJsonStr(new Response(e.getCode(), e.getMessage())));
        }
    }

    @Override
    public Response root(SearchModel searchModel) {
        String clusterName = CommonConfig.commonConfig.getString(Consist.DEFAULT_CLUSTER_NAME, CommonConfig.defaultClusterName);
        String queryStr = searchModel.getRequest().getQueryString();
        clusterName = getString(queryStr, Consist.CLUSTER_NAME, clusterName);
        try {
            EsThrottle esSearchThrottle = EsThrottleFactory.getEsSearchThrottleByClusteName(clusterName);
            Invoker invoker = invokerFactory.generateEsHttpRootInvoker(esSearchThrottle, searchModel);
            //执行调用
            Response response = invoker.invoke();

            return response;

        } catch (InvokeException e) {
            return new Response(e.getCode(), buildJsonStr(new Response(e.getCode(), e.getMessage())));
        }

    }

}
