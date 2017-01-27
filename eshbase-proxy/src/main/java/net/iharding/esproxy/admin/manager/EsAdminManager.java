package net.iharding.esproxy.admin.manager;

import java.util.List;

import net.iharding.esproxy.throttle.EsThrottle;

/**
 * Created by yuxuefeng on 15/9/25.
 */
public interface EsAdminManager {
    List<EsThrottle> getAllThrottles();

    EsThrottle getByClusterName(String clusterName);

    EsThrottle updateEsSearchThrottle(EsThrottle esSearchThrottle);
}
