package net.iharding.esproxy.loadbalance;

import org.springframework.stereotype.Component;

import net.iharding.esproxy.throttle.EsThrottle;

/**
 * 轮询负载均衡
 * Created by yuxuefeng on 15/9/24.
 */
@Component("roundRobinLoadBalance")
public class RoundRobinLoadBalance implements LoadBalance {
    @Override
    public String doSelect(EsThrottle esSearchThrottle) {

        String[] nodes = esSearchThrottle.getHttpNodes();
        return nodes[esSearchThrottle.getAtomicInteger().getAndIncrement() % nodes.length];

    }
}
