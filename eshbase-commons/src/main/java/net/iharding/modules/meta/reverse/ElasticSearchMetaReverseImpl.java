package net.iharding.modules.meta.reverse;



import java.io.IOException;
import java.net.InetAddress;
import java.net.UnknownHostException;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import net.iharding.modules.meta.model.Dataset;
import net.iharding.modules.meta.model.DataSource;
import net.iharding.modules.meta.model.Database;
import net.iharding.modules.meta.model.DbColumn;
import net.iharding.modules.meta.model.MetaProperty;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.lang.math.NumberUtils;
import org.elasticsearch.action.admin.indices.get.GetIndexRequest;
import org.elasticsearch.action.admin.indices.get.GetIndexRequestBuilder;
import org.elasticsearch.action.admin.indices.get.GetIndexResponse;
import org.elasticsearch.client.Client;
import org.elasticsearch.client.transport.TransportClient;
import org.elasticsearch.cluster.metadata.MappingMetaData;
import org.elasticsearch.common.collect.ImmutableOpenMap;
import org.elasticsearch.common.settings.Settings;
import org.elasticsearch.common.transport.InetSocketTransportAddress;
import org.elasticsearch.shield.ShieldPlugin;
import org.guess.sys.model.User;
import org.springframework.stereotype.Repository;

import com.carrotsearch.hppc.cursors.ObjectObjectCursor;

/**
 * elasticsearch元数据读取
 * 
 * @author admin
 *
 */
@Repository("MetaReverse4")
public class ElasticSearchMetaReverseImpl implements MetaReverseDao {

	private Map<String, Client> esclientMap = new ConcurrentHashMap<String, Client>();

	@SuppressWarnings({ "rawtypes", "unchecked" })
	@Override
	public DataSource reverseMeta(DataSource ds, List<MetaProperty> mps,User cuser)  {
		Client client = getEsClient(ds.getId() + "-" + ds.getDsName(), mps);
		// 访问获取index库集合
		GetIndexRequestBuilder indexRequestBuilder = client.admin().indices().prepareGetIndex();
		indexRequestBuilder.addFeatures(GetIndexRequest.Feature.MAPPINGS).addFeatures(GetIndexRequest.Feature.SETTINGS);
		GetIndexResponse getIndexResponse = client.admin().indices().getIndex(indexRequestBuilder.request()).actionGet();
		GetIndexRequest.Feature[] features = indexRequestBuilder.request().features();
		String[] indices = getIndexResponse.indices();
		for (String index : indices) { 
			// 解析索引库为database
			Database db =ds.getDatabase(index,cuser);
			db.setDatasource(ds);
			db.setDbname(index);
			db.setCheckLabel(1);
			if (index.startsWith(".") )
				continue;
			for (GetIndexRequest.Feature feature : features) {
				switch (feature) {
				case SETTINGS:
					Settings settings = getIndexResponse.settings().get(index);
					db.setSchemaName(settings.get("index.uuid"));
					break;
				case MAPPINGS:
					ImmutableOpenMap<String, MappingMetaData> mappings = getIndexResponse.mappings().get(index);
					if (mappings != null) {
						for (ObjectObjectCursor<String, MappingMetaData> typeEntry : mappings) {
							Dataset table =db.getDBTable(typeEntry.key,cuser);// new DBTable();
							table.setDatasetName(typeEntry.key);
							table.setCheckLabel(1);
							table.setDatasetPname(typeEntry.key);
							table.setTableType(1);
							table.setDatabase(db);
							table.setRemark("");
							try {
								Map<String, Object> fields = typeEntry.value.getSourceAsMap();
								if (fields.get("_all") != null) {
									table.setRemark(table.getRemark()+"|_all"+":"+((Map) fields.get("_all")).get("enabled"));
								}
								if (fields.get("_source") != null) {
									table.setRemark(table.getRemark()+"|_source"+":"+((Map) fields.get("_source")).get("enabled"));
								}
								if (fields.get("_parent") != null) {
									table.setRemark(table.getRemark()+"|_parent"+":"+((Map) fields.get("_parent")).get("type"));
								}
								table.setRemark(table.getRemark()+"|_routing"+":"+ typeEntry.value.routing().required());
								Map mf=(Map)fields.get("properties");
								Iterator iter=mf.entrySet().iterator();
								while(iter.hasNext()){//字段
									Map.Entry<String,Map> ob=(Map.Entry<String,Map>) iter.next();
									DbColumn field=table.getNewDbColumn(ob.getKey());
									field.setColumnName(ob.getKey());
									field.setColumnPname(ob.getKey());
									field.setRemark(ob.getKey());
									field.setCheckLabel(1);
									field.setFieldCode(ob.getKey());
									field.setType(getFieldValue("type",ob));
									field.setFormat(getFieldValue("format",ob));
									field.setIndex(getFieldValue("index",ob));
									field.setDbtable(table);
									table.addColumn(field);
								}
							} catch (IOException e) {
								e.printStackTrace();
							}
							db.addTable(table);
						}
					}
					break;
				default:
					throw new IllegalStateException("feature [" + feature + "] is not valid");
				}
			}
			ds.addDatabase(db);
		}
		return ds;
	}
	
	private String getFieldValue(String key,Map.Entry<String,Map> ob){
		Object obj=ob.getValue().get(key);
		if (obj!=null){
			return (String)obj;
		}
		return null;
	}

	/**
	 * 从集合中获取参数设置对象
	 * 
	 * @param paramKey
	 * @param mproes
	 * @return
	 */
	private MetaProperty getMetaProperty(String paramKey, List<MetaProperty> mproes) {
		for (MetaProperty mp : mproes) {
			if (mp.getPropertyKey().equalsIgnoreCase(paramKey)) {
				return mp;
			}
		}
		return new MetaProperty();
	}

	private Client getEsClient(String key, List<MetaProperty> mps) {
		Client cl = esclientMap.get(key);
		if (cl == null) {
			String[] hosts = StringUtils.split(getMetaProperty("transportNodes", mps).getPropertyValue(), ",");
			int id = 0;
			InetSocketTransportAddress[] transportAddress = new InetSocketTransportAddress[hosts.length];
			for (String host : hosts) {
				String[] hp = StringUtils.split(host, ":");
				try {
					transportAddress[id] = new InetSocketTransportAddress(InetAddress.getByName(hp[0]), NumberUtils.toInt(hp[1], 9300));
				} catch (UnknownHostException e) {
					e.printStackTrace();
				}
				id++;
			}
			Settings settings = null;
			if (StringUtils.isNotEmpty(getMetaProperty("shield_user", mps).getPropertyValue())) {
				settings = Settings.settingsBuilder().put("cluster.name", getMetaProperty("clustername", mps).getPropertyValue())
						.put("shield.user", getMetaProperty("shield_user", mps).getPropertyValue() + ":" + getMetaProperty("shield_password", mps).getPropertyValue())
						.put("client.transport.sniff", true).build();
				cl = TransportClient.builder().addPlugin(ShieldPlugin.class).settings(settings).build().addTransportAddresses(transportAddress);
			} else {
				settings = Settings.settingsBuilder().put("cluster.name", getMetaProperty("clustername", mps).getPropertyValue()).put("client.transport.sniff", true).build();
				cl = TransportClient.builder().settings(settings).build().addTransportAddresses(transportAddress);
			}
			esclientMap.put(key, cl);
		}
		return cl;
	}

	@Override
	public Database reverseDatabaseMeta(DataSource datasource, List<MetaProperty> mproes, User cuser, String dbName) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Dataset reverseTableMeta(DataSource datasource, List<MetaProperty> mproes, User cuser, String dbName, String tableName) {
		// TODO Auto-generated method stub
		return null;
	}

	

}

