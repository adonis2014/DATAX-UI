package net.iharding.esproxy.http.manager;

import net.iharding.esproxy.exchange.Response;
import net.iharding.esproxy.model.SearchModel;

/**
 * Created by yuxuefeng on 15/9/15.
 */
public interface ESWrapperManager {


    /**
     * 非batch查询操作
     *
     * @param searchModel
     * @return
     */
    Response search(SearchModel searchModel);

    Response root(SearchModel searchModel);

    /**
     * 非batch增、删、改操作
     *
     * @param searchModel
     * @return
     */
    Response write(SearchModel searchModel);
}
