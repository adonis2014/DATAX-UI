package net.iharding.esproxy.loadbalance;

import net.iharding.esproxy.throttle.EsThrottle;

/**
 * Created by yuxuefeng on 15/9/24.
 */
public interface LoadBalance {
    /**
     * 根据当前loadbalance策略选择目标node
     *
     * @param esSearchThrottle
     * @return
     */
    public String doSelect(EsThrottle esSearchThrottle);
}
