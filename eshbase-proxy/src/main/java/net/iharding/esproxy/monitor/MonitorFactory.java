package net.iharding.esproxy.monitor;

import net.iharding.esproxy.invoker.Invoker;

/**
 * Created by yuxuefeng on 15/9/21.
 */
public interface MonitorFactory {
    /**
     * Create monitor.
     *
     * @param invoker
     * @return monitor
     */
    Monitor getMonitor(Invoker invoker);
}
