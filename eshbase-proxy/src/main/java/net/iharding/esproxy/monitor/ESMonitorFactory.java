package net.iharding.esproxy.monitor;

import org.springframework.stereotype.Component;

import net.iharding.esproxy.invoker.Invoker;

/**
 *
 * Created by yuxuefeng on 15/9/21.
 */
@Component("searchMonitorFactory")
public class ESMonitorFactory extends AbstractMonitorFactory {
    @Override
    protected Monitor createMonitor(Invoker invoker) {

        return new ESMonitor(invoker.getEsSearchThrottle());
    }
}
