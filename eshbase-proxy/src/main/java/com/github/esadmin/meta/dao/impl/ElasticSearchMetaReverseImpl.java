package com.github.esadmin.meta.dao.impl;

import java.net.InetAddress;
import java.net.UnknownHostException;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

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
import org.guess.sys.util.UserUtil;

import com.carrotsearch.hppc.cursors.ObjectObjectCursor;
import com.github.esadmin.meta.dao.MetaReverseDao;
import com.github.esadmin.meta.model.DBTable;
import com.github.esadmin.meta.model.DataSource;
import com.github.esadmin.meta.model.Database;
import com.github.esadmin.meta.model.DbColumn;
import com.github.esadmin.meta.model.MetaProperty;

/**
 * elasticsearch元数据读取
 * 
 * @author admin
 *
 */
public class ElasticSearchMetaReverseImpl implements MetaReverseDao {

	private Map<String, Client> esclientMap = new ConcurrentHashMap<String, Client>();

	@SuppressWarnings({ "rawtypes", "unchecked" })
	@Override
	public DataSource reverseMeta(DataSource ds, List<MetaProperty> mps) throws Exception {
		Client client = getEsClient(ds.getId() + "-" + ds.getDsName(), mps);
		// 访问获取index库集合
		GetIndexRequestBuilder indexRequestBuilder = client.admin().indices().prepareGetIndex();
		indexRequestBuilder.addFeatures(GetIndexRequest.Feature.MAPPINGS).addFeatures(GetIndexRequest.Feature.SETTINGS);
		GetIndexResponse getIndexResponse = client.admin().indices().getIndex(indexRequestBuilder.request()).actionGet();
		GetIndexRequest.Feature[] features = indexRequestBuilder.request().features();
		String[] indices = getIndexResponse.indices();
		User cuser = UserUtil.getCurrentUser();
		for(Database db:ds.getDatabases()){
			db.setCheckLabel(0);
			db.setUpdater(cuser);
			db.setUpdateDate(new Date());
		}
		for (String index : indices) { 
			// 解析索引库为database
			Database db =ds.getDatabase(index);
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
						if (db.getTables()!=null){
							for(DBTable table:db.getTables()){
								table.setCheckLabel(0);
								table.setUpdatebyId(cuser.getId());
								table.setUpdateDate(new Date());
							}
						}
						for (ObjectObjectCursor<String, MappingMetaData> typeEntry : mappings) {
							DBTable table =db.getDBTable(typeEntry.key);// new DBTable();
							table.setTableName(typeEntry.key);
							table.setCheckLabel(1);
							table.setTablePname(typeEntry.key);
							table.setTableType(1);
							table.setDatabase(db);
							table.setRemark("");
//							table.set typeEntry.value.toString()
							Map<String, Object> fields = typeEntry.value.sourceAsMap();
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

	

}
