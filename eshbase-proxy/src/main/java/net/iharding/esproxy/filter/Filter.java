package net.iharding.esproxy.filter;

import net.iharding.esproxy.exception.InvokeException;
import net.iharding.esproxy.exchange.Response;
import net.iharding.esproxy.invoker.Invoker;

/**
 * Created by yuxuefeng on 15/9/21.
 */
public interface Filter {
    /**
     * do invoke filter.
     * <p/>
     * <code>
     * // before filter
     * Result result = invoker.invoke(invocation);
     * // after filter
     * return result;
     * </code>
     *
     * @param invoker    service
     * @return invoke result.
     */
    Response invoke(Invoker invoker) throws InvokeException;
}
