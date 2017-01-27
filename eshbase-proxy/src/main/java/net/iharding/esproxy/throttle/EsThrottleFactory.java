package net.iharding.esproxy.throttle;

import java.io.IOException;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.ConcurrentMap;

import javax.annotation.PostConstruct;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.github.esadmin.meta.model.DataSourceWrapper;
import com.github.esadmin.meta.model.MetaProperty;
import com.github.esadmin.meta.service.DataSourceService;

import net.iharding.esproxy.watcher.DirectoryHandler;
import net.iharding.esproxy.watcher.DirectoryWatcher;

/**
 * Created by yuxuefeng on 15/9/16.
 */
@Component
public class EsThrottleFactory {
    private static Logger logger = Logger.getLogger(EsThrottleFactory.class);
    private static ConcurrentMap<String, EsThrottle> esSearchThrottlesMap = new ConcurrentHashMap<>();
    private DirectoryWatcher directoryWatcher;
    private DirectoryHandler directoryHandler;
    
    @Autowired
    private  DataSourceService dsService;
    
    private static EsThrottleFactory esThrottleFactory;

    public EsThrottleFactory() throws IOException {
        this(EsThrottle.class.getResource("/").getPath());
    }
    
    @PostConstruct  
    public void init() {  
    	esThrottleFactory=this;
    	esThrottleFactory.dsService = this.dsService;
    }  

    public EsThrottleFactory(String path) throws IOException {
        logger.info("Start to init the watcher of the path:[" + path + "]~");
        directoryWatcher = new DirectoryWatcher(path);
        directoryHandler = new DirectoryHandler();
        directoryWatcher.addObserver(directoryHandler);
        directoryWatcher.execute();
        logger.info("the watcher of the path:[" + path + "] completed~");
    }

    public static EsThrottle getEsSearchThrottleByClusteName(String clusterName) {
        EsThrottle esSearchThrottle = esSearchThrottlesMap.get(clusterName);
        if (esSearchThrottle != null) {
            return esSearchThrottle;
        }
        //加载配置文件
        esSearchThrottle = updateByClusterName(clusterName, false);
        return esSearchThrottle;
    }
    
   
    public synchronized static EsThrottle updateByClusterName(String clusterName, boolean reload) {
        EsThrottle esSearchThrottle = esSearchThrottlesMap.get(clusterName);
        if (esSearchThrottle != null && !reload) {
            return esSearchThrottle;
        }
    	DataSourceWrapper dw=esThrottleFactory.dsService.getWrapper(1,clusterName);
        if (esSearchThrottle == null) {
            esSearchThrottle = new EsThrottle();
            esSearchThrottle.setClusterName(clusterName);
        }
        logger.info("Start to load [" + clusterName + "] configuration dbms...");
        for(MetaProperty mp: dw.getProperties()){
        	esSearchThrottle.getConfigs().put(mp.getPropertyKey(),mp.getPropertyValue());
        }
        esSearchThrottle.reset();
        esSearchThrottlesMap.put(clusterName, esSearchThrottle);
        esSearchThrottle = esSearchThrottlesMap.get(clusterName);

        logger.info("Congratulations!Load [" + clusterName + "] configuration file completed sucessfully!");
        
        
        //logger.info("Start to load [" + clusterName + "] configuration file...");
//        try {
//            //TODO linux下文件名区分大小写  windows下不区分大小写
//            esSearchThrottle.getConfigs().load(EsThrottleFactory.class.getClassLoader().getResourceAsStream(clusterName + ".properties"));
//            esSearchThrottle.reset();
//
//            esSearchThrottlesMap.put(clusterName, esSearchThrottle);
//            esSearchThrottle = esSearchThrottlesMap.get(clusterName);
//
//            logger.info("Congratulations!Load [" + clusterName + "] configuration file completed sucessfully!");
//        } catch (IOException e) {
//            logger.error("The configuration file:[" + fileName + "] IOError,please retry", e);
//            throw new InvokeException("the configuration file:[" + fileName + "] IOException,please retry", 503);
//        } catch (NullPointerException e) {
//            logger.error("The configuration file:[" + fileName + "] does not exsit,please check!", e);
//            throw new InvokeException("the configuration file:[" + fileName + "] does not exist,please check!", 504);
//        } catch (Exception e) {
//            logger.error("The configuration file:[" + fileName + "] params error,please check!", e);
//        }

        return esSearchThrottle;

    }

    public synchronized static EsThrottle updateByEsSearchThrottle(EsThrottle esSearchThrottle, boolean reload) {
        String clusterName = esSearchThrottle.getClusterName();
        EsThrottle esSearchThrottleOld = esSearchThrottlesMap.get(clusterName);
        if (esSearchThrottle != null && !reload) {
            return esSearchThrottleOld;
        }
        if (esSearchThrottle == null) {
            esSearchThrottle = new EsThrottle();
            esSearchThrottle.setClusterName(clusterName);
        }
        logger.info("Start to update [" + clusterName + "] configuration ...");
        try {
            esSearchThrottlesMap.put(clusterName, esSearchThrottle);
            esSearchThrottle = esSearchThrottlesMap.get(clusterName);
            return esSearchThrottle;
        } catch (Exception e) {
            logger.error("Error occurs when update [" + clusterName + "] configuration file");
            logger.error("Exception:" + e.getMessage());
        }
        logger.info("Update [" + clusterName + "] configuration completed...");
        return esSearchThrottle;

    }

    public static EsThrottle deleteByClusterName(String clusterName) {
        logger.info("Start to Remove cluster:[" + clusterName + "]...");
        EsThrottle esThrottle = esSearchThrottlesMap.remove(clusterName);
        logger.info("Remove cluster:[" + clusterName + "] sucessfully!");
        return esThrottle;
    }

    public static Map<String, EsThrottle> getEsSearchThrottlesMap() {
        return esSearchThrottlesMap;
    }

}
