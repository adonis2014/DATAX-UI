package net.iharding.esproxy.client;

import org.apache.commons.lang.StringUtils;
import org.elasticsearch.client.Client;
import org.elasticsearch.client.transport.TransportClient;
import org.elasticsearch.common.settings.Settings;
import org.elasticsearch.common.transport.InetSocketTransportAddress;
import org.elasticsearch.shield.ShieldPlugin;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import net.iharding.esproxy.model.Consist;
import net.iharding.esproxy.throttle.EsThrottle;

import java.net.InetAddress;
import java.net.UnknownHostException;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.ConcurrentMap;

/**
 * Created by yuxuefeng on 15/10/15.
 */
public class ClientFactory {
    private static Logger logger = LoggerFactory.getLogger(ClientFactory.class);
    //TODO 二期优化成连接池形式，减少不必要的资源浪费
    private static ConcurrentMap<String, Client> esClientsMap = new ConcurrentHashMap<>();

    public static Client generateTransportClient(EsThrottle esSearchThrottle,String username,String password) {
        Client client = esClientsMap.get(esSearchThrottle.getClusterName());
        if (client != null) {
            return client;
        }
        return updateClient(esSearchThrottle, false, username, password);
    }

    private synchronized static Client updateClient(EsThrottle esSearchThrottle, boolean reload,String username,String password) {
        String clusterName = esSearchThrottle.getClusterName();//tString(Consist.CLUSTER_NAME, "vdata");
        Client client = esClientsMap.get(clusterName);
        if (!reload && client != null) {
            return client;
        }
        logger.info("Start to init [" + clusterName + "]  TransportClient...\n");
        TransportClient transportClient =null;Settings settings =null;
        if (StringUtils.isNotEmpty(username)&&StringUtils.isNotEmpty(password)){
        	settings = Settings.settingsBuilder().put("cluster.name", clusterName).put("shield.user", username+":"+password).put("client.transport.sniff", false).build();
        	transportClient =TransportClient.builder().addPlugin(ShieldPlugin.class).settings(settings).build();
        }else{
        	settings = Settings.settingsBuilder().put("cluster.name", clusterName).build();
        	transportClient =TransportClient.builder().settings(settings).build();
        }
        String[] nodes = esSearchThrottle.getTransportNodes();
        for (int i = 0; i < nodes.length; i++) {
            String[] ipport = nodes[i].split(":");
            try {
				transportClient.addTransportAddress(new InetSocketTransportAddress(InetAddress.getByName(ipport[0]), Integer.parseInt(ipport[1])));
			} catch (NumberFormatException e) {
				e.printStackTrace();
			} catch (UnknownHostException e) {
				e.printStackTrace();
			}
        }

        logger.info("[" + clusterName + "] TransportClient Completed!\n");
        return putEsClient(clusterName, transportClient);
    }

    public static Client putEsClient(String clusterName, Client client) {

        esClientsMap.put(clusterName, client);

        return esClientsMap.get(clusterName);
    }

}
