package net.iharding.esproxy.monitor;

import java.util.List;

import net.iharding.esproxy.invoker.Invoker;

/**
 * Created by yuxuefeng on 15/9/21.
 */
public interface Monitor {

    String SUCESS = "success";

    String FAILURE = "failure";

    String ELAPSED = "elapsed";

    String NODE_CONCURRENT = "nodeConcurrent";

    String CLUSTER_CONCURRENT = "clusterConcurrent";

    String SERVER_CONCURRENT = "serverConcurrent";

    String SEARCH_THREAD_POOL_SIZE = "search_thread_pool_size";

    String SEARCH_THREAD_POOL_QUEUE_SIZE = "search_thread_pool_queue_size";
    
    String WRITE_THREAD_POOL_SIZE = "write_thread_pool_size";

    String WRITE_THREAD_POOL_QUEUE_SIZE = "write_thread_pool_queue_size";

	String START_TIME = "reuqest_start_time";
	

	String SUCESS_LABEL = "reuqest_success_label";;

    /**
     * 同步监控数据采集.
     * 后期性能优化，建议改成采用异步采集，提高invoke主线任务性能
     *
     * @param invoker
     */
    void collect(Invoker invoker);

    /**
     * 监控数据查询. 
     *
     * @param invoker
     * @return
     */
    List<Invoker> lookup(Invoker invoker);

    /**
     * 定时检测monitor是否更新
     */
    boolean checkModified();

    /**
     * 执行更新
     */
    void update();
}
