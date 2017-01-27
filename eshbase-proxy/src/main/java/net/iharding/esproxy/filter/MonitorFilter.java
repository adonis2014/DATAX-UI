package net.iharding.esproxy.filter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import net.iharding.esproxy.exception.InvokeException;
import net.iharding.esproxy.exchange.Response;
import net.iharding.esproxy.invoker.Invoker;
import net.iharding.esproxy.monitor.Monitor;
import net.iharding.esproxy.monitor.MonitorFactory;

import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.ConcurrentMap;
import java.util.concurrent.atomic.AtomicInteger;

/**
 * Created by yuxuefeng on 15/9/21.
 */
@Service("monitorFilter")
public class MonitorFilter implements Filter {
    private final ConcurrentMap<String, AtomicInteger> nodeConcurrents = new ConcurrentHashMap<String, AtomicInteger>();
    private final ConcurrentMap<String, AtomicInteger> clusterConcurrents = new ConcurrentHashMap<String, AtomicInteger>();
    private final AtomicInteger serverConcurrents = new AtomicInteger();
    @Autowired
    private MonitorFactory monitorFactory;

    @Override
    public Response invoke(Invoker invoker) throws InvokeException {
        if (invoker.getEsSearchThrottle().isMonitor()) {
            long start = System.currentTimeMillis();
            getNodeConcurrent(invoker).incrementAndGet(); // 并发计数
            getClusterConcurrents(invoker).incrementAndGet(); // 并发计数
            serverConcurrents.incrementAndGet();
            try {
                Response response = invoker.invoke();
                collect(invoker, start, true);
                return response;
            } catch (InvokeException e) {
                collect(invoker, start, false);
                throw e;
            } finally {
                getNodeConcurrent(invoker).decrementAndGet(); // 并发计数
                getClusterConcurrents(invoker).decrementAndGet();
                serverConcurrents.decrementAndGet();
            }
        } else {
            return invoker.invoke();
        }
    }

    private void collect(Invoker invoker, long start, boolean sucess) {
        long elapsed = System.currentTimeMillis() - start; // 计算调用耗时
        int nodeConcurrent = getNodeConcurrent(invoker).get(); // node当前并发
        int clusterConcurrent = getClusterConcurrents(invoker).get();//cluster当前并发
        int serverConcurrent = serverConcurrents.get();//server当前并发
        invoker.getParameters().put(Monitor.START_TIME, start + "");
        invoker.getParameters().put(Monitor.ELAPSED, elapsed + "");
        if (sucess) invoker.getParameters().put(Monitor.SUCESS_LABEL, "1");
        
        invoker.getParameters().put(Monitor.NODE_CONCURRENT, nodeConcurrent + "");
        invoker.getParameters().put(Monitor.CLUSTER_CONCURRENT, clusterConcurrent + "");
        invoker.getParameters().put(Monitor.SERVER_CONCURRENT, serverConcurrent + "");
        invoker.getParameters().put(sucess ? Monitor.SUCESS : Monitor.FAILURE, 1 + "");
        Monitor monitor = monitorFactory.getMonitor(invoker);
        monitor.collect(invoker);

    }

    // 获取node并发计数器
    private AtomicInteger getNodeConcurrent(Invoker invoker) {
        String key = invoker.getTargetNode();
        AtomicInteger concurrent = nodeConcurrents.get(key);
        if (concurrent == null) {
            nodeConcurrents.putIfAbsent(key, new AtomicInteger());
            concurrent = nodeConcurrents.get(key);
        }
        return concurrent;
    }

    // 获取cluster并发计数器
    private AtomicInteger getClusterConcurrents(Invoker invoker) {
        String key = invoker.getEsSearchThrottle().getClusterName();
        AtomicInteger concurrent = clusterConcurrents.get(key);
        if (concurrent == null) {
            clusterConcurrents.putIfAbsent(key, new AtomicInteger());
            concurrent = clusterConcurrents.get(key);
        }
        return concurrent;
    }

}
