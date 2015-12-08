package com.taobao.datax.plugins.writer.elasticsearchwriter;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.lang.math.NumberUtils;
import org.apache.log4j.Logger;
import org.apache.lucene.queryparser.classic.QueryParser;
import org.codehaus.jackson.map.ObjectMapper;
import org.elasticsearch.client.Client;
import org.elasticsearch.client.transport.TransportClient;
import org.elasticsearch.common.settings.ImmutableSettings;
import org.elasticsearch.common.settings.Settings;
import org.elasticsearch.common.transport.InetSocketTransportAddress;

import com.taobao.datax.common.plugin.Line;
import com.taobao.datax.common.plugin.LineReceiver;
import com.taobao.datax.common.plugin.PluginParam;
import com.taobao.datax.common.plugin.PluginStatus;
import com.taobao.datax.common.plugin.Writer;
import com.taobao.datax.common.util.ETLStringUtils;
/**
 * 数据写入elastic search 插件
 * @author admin
 *
 */
public class ElasticSearchWriter extends Writer {

	//群组名称
	private String clustername;
	//索引名称
	private String indexname;
	//分片数目
	private int number_of_shards;
	//索引副本数目
	private int number_of_replicas;
	//类型名称(类似表名)
	private String typename;
	//批量提交的记录数
	private int bulksize;
	//结构mapping定义，json字符串文件
	private String mapping_xml;
	//删除模式；由用户进行选择，0 写入前不删除，如果不存在，建立新表，覆盖文件 1 上传数据之前truncate原type;2 上传数据之前delete原type
	private int delMode;
	//要写的字段名，','间隔
	private String column_name;
	//要写的字段数组
	private String[] columnNames;
	
	private String hosts;
	//要读的字段id集合,','间隔
	private String column_value_index;
	//要读的字段id数组
	private int[] columnIndexes;
	//要读的字段id转义集合,','间隔
	private String column_escape_index;
	//是否转义的定义
	private int[] columnEscapeIndexes;
	//_id指定的字段
	private int uniquekey=-1;
	
	private ElasticSearchProxy proxy;

	private Logger logger = Logger.getLogger(ElasticSearchWriter.class);
	ObjectMapper mapper = new ObjectMapper();

	private Client client; 
	@Override
	public int prepare(PluginParam param) {
		this.logger.info("DataX ElasticSearchWriter do prepare work .");
		//根据模式删除清理已有表
		try {
			switch (this.delMode) {
			case 0:
				createTable();
				this.logger.info("ElasticSearchWriter reserves old data .");
				break;
			case 1:
				truncateTable();
				break;
			case 2:
				deleteTables();
				break;
			case 3:
				break;
			default:
				String msg = "ElasticSearchWriter delmode is not correct .";
				this.logger.error(msg);
				throw new IllegalArgumentException(msg);
			}
		} catch (Exception e) {
			e.printStackTrace();
			try {
				proxy.close();
			} catch (Exception e1) {
			}
		}

		return this.finish();
	}
	
	@Override
	public int commit() {
		this.logger.info("ElasticSearchWriter starts to commit records .");
		try {
			proxy.flush();
			return PluginStatus.SUCCESS.value();
		} catch (Exception e) {
			try {
				proxy.close();
			} catch (IOException e1) {
			}
			return PluginStatus.SUCCESS.value();
		//	throw new DataExchangeException(e.getCause());
		}
	}
	
	/**
	 * 新建定义的es type作为表
	 */
	private void createTable() throws Exception{
		this.logger.info(String.format(
				"ElasticSearchWriter begins to create table %s .", this.indexname,this.typename));
		proxy.createTable(this.indexname, number_of_shards, number_of_replicas, 
				 typename,  bulksize,  mapping_xml);
	}
	
	private void deleteTables() throws Exception {
		this.logger.info(String.format(
				"ElasticSearchWriter begins to delete table %s .", this.indexname,this.typename));
		proxy.deleteTable(this.indexname,typename);
	}

	private void truncateTable() throws Exception {
		this.logger.info(String.format(
				"ElasticSearchWriter begins to truncate table %s .",this.indexname,this.typename));
		proxy.truncateTable(indexname,number_of_shards, number_of_replicas, typename,this.mapping_xml);
	}

	@Override
	public int connect() {
		return PluginStatus.SUCCESS.value();
	}

	@Override
	public int finish() {
		client.close();
		//node.close();
		client=null;
		return PluginStatus.SUCCESS.value();
	}


	@SuppressWarnings({ "unchecked", "rawtypes" })
	@Override
	public int startWrite(LineReceiver receiver) {
		Line line;
		int fieldNum;
		//准备bulk对象
		proxy.prepare();
		/*
		 * NOTE: field numbers in each line may be different
		 */
		String lineValue=null;
		while ((line = receiver.getFromReader()) != null) {
			try {
				fieldNum = line.getFieldNum();
				if (0 == fieldNum || 1 == fieldNum) {
					logger.warn("elasticsearch Writer meets an empty line, ignore it .");
					continue;
				}
				Map map=new ConcurrentHashMap();
				//Map tepMap=new ConcurrentHashMap();
				for (int i = 0; i < columnIndexes.length; i++) {
					if (ETLStringUtils.isEmpty(line.checkAndGetField(columnIndexes[i]))) {
						continue;
					}
					if (StringUtils.isNotEmpty(line.getField(columnIndexes[i]))){
						lineValue=ETLStringUtils.trim(line.getField(columnIndexes[i]));
						if (ETLStringUtils.getJSONType(lineValue)==ETLStringUtils.JSON_TYPE.JSON_TYPE_STRING){
							if (1==columnEscapeIndexes[i]){//是否转义
								map.put(this.columnNames[i],QueryParser.escape(lineValue));
							}else{
								map.put(this.columnNames[i],lineValue);
							}
						}else if (ETLStringUtils.getJSONType(lineValue)==ETLStringUtils.JSON_TYPE.JSON_TYPE_ARRAY){
							if (1==columnEscapeIndexes[i]){//是否转义
								map.put(this.columnNames[i],escapeList(mapper.readValue(lineValue, List.class)));
							}else{
								map.put(this.columnNames[i],mapper.readValue(lineValue, List.class));
							}
						}else if (ETLStringUtils.getJSONType(lineValue)==ETLStringUtils.JSON_TYPE.JSON_TYPE_OBJECT){
							if (1==columnEscapeIndexes[i]){//是否转义
								map.put(this.columnNames[i],escapeMap(mapper.readValue(lineValue, Map.class)));
							}else{
								map.put(this.columnNames[i],mapper.readValue(lineValue, Map.class));
							}
						}
					}
				}
				if (this.uniquekey>=0){
					//System.out.println("id:--"+line.getField(this.uniquekey));
					if (StringUtils.isNotEmpty(line.checkAndGetField(this.uniquekey))) {
						proxy.insert(line.getField(this.uniquekey),map);
					}else{
						proxy.insert(null,map);
					}
				}else{
					proxy.insert(null,map);
				}
				this.monitor.lineSuccess();
			} catch (Exception e) {
				this.getMonitor().lineFail(e.getMessage());e.printStackTrace();
			}
		}
		return PluginStatus.SUCCESS.value();
	}
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	private Map escapeMap(Map mapStr){
		Iterator<Map.Entry> iter=mapStr.entrySet().iterator();
		while(iter.hasNext()){
			Map.Entry entry=iter.next();
			if (entry.getValue() instanceof String){
				entry.setValue(QueryParser.escape((String)entry.getValue()));
			}else{
				break;
			}
		}
		return mapStr;
	}

	@SuppressWarnings("rawtypes")
	private List escapeList(List<String> arrayStr){
		for(int i=0;i<arrayStr.size();i++){
			Object v=arrayStr.get(i);
			if (v instanceof String){
				arrayStr.remove(i);
				arrayStr.add(i, QueryParser.escape((String)v));
			}else{
				break;
			}
		}
		return arrayStr;
	}
	

	@SuppressWarnings("resource")
	@Override
	public int init() {
		this.clustername=param.getValue(ParamKey.clustername);
		this.hosts=param.getValue(ParamKey.hosts);
		this.indexname=param.getValue(ParamKey.indexname);
		this.number_of_shards=param.getIntValue(ParamKey.number_of_shards, 5);
		this.number_of_replicas=param.getIntValue(ParamKey.number_of_replicas,1);
		this.typename=param.getValue(ParamKey.typename);
		this.bulksize=param.getIntValue(ParamKey.bulksize,500);
		this.mapping_xml=param.getValue(ParamKey.mapping_xml);
		this.uniquekey=param.getIntValue(ParamKey.uniquekey,-1);
		if (this.mapping_xml!=null){
			FileInputStream is =null;
			try {
				File file=new File(mapping_xml);
				is = new FileInputStream(file);
		        int size = (int) file.length();
		        byte[] bytes =new byte[size]; 
		        is.read(bytes);
		        String content = new String(bytes, "UTF-8");
		        this.mapping_xml= content;
			} catch (Exception e) {
				e.printStackTrace();
			}  finally{
				if (is!=null){
					try {
						is.close();
					} catch (IOException e) {
						e.printStackTrace();
					}
				}
			}
		}
		this.delMode=param.getIntValue(ParamKey.delMode,0);
		this.column_name=param.getValue(ParamKey.column_name);
		this.column_value_index=param.getValue(ParamKey.column_value_index);
		this.columnNames=this.column_name.split(",");
		if (param.hasValue(ParamKey.column_value_index)) {
			String[] indexes = column_value_index.split(",");
			if (indexes.length != columnNames.length) {
					String msg = String.format("elasticsearch column index is different form column name: \nColumnName %s\nColumnIndex %s\n",
									param.getValue(ParamKey.column_name),
									param.getValue(ParamKey.column_value_index));
					logger.error(msg);
					throw new IllegalArgumentException(msg);
			}
			this.columnIndexes = new int[indexes.length];
			for (int i = 0; i < indexes.length; i++) {
				columnIndexes[i] = Integer.valueOf(indexes[i]);
			}
		} else {//默认从1到字段长度
			this.columnIndexes = new int[columnNames.length];
		}
		try{
			this.column_escape_index=param.getValue(ParamKey.column_escape_index);
			if (param.hasValue(ParamKey.column_escape_index)) {
				String[] indexes = column_escape_index.split(",");
				if (indexes.length != columnNames.length) {
						String msg = String.format("elasticsearch column escape index is different form column name: \nColumnName %s\nColumnIndex %s\n",
										param.getValue(ParamKey.column_name),
										param.getValue(ParamKey.column_escape_index));
						logger.error(msg);
						throw new IllegalArgumentException(msg);
				}
				this.columnEscapeIndexes = new int[indexes.length];
				for (int i = 0; i < indexes.length; i++) {
					columnEscapeIndexes[i] = Integer.valueOf(indexes[i]);
				}
			} else {//默认从1到字段长度
				this.columnEscapeIndexes = new int[columnNames.length];
			}
		}catch(Exception ex){
			this.columnEscapeIndexes = new int[columnNames.length];
		}
		
		
		String[] hosts=ETLStringUtils.split(this.hosts,";");
		int id=0;
		InetSocketTransportAddress[] transportAddress=new InetSocketTransportAddress[hosts.length];
		for(String host:hosts){
			String[] hp=ETLStringUtils.split(host,":");
			transportAddress[id]=new InetSocketTransportAddress(hp[0],NumberUtils.toInt(hp[1],9300));
			id++;
		}
		 Settings settings = ImmutableSettings.settingsBuilder()     
	                .put("cluster.name", this.clustername).put("client.transport.sniff", true).build();
		client = new TransportClient(settings).addTransportAddresses(transportAddress);
		
		

//		node = nodeBuilder().clusterName(this.clustername).client(true).node();
		this.proxy = ElasticSearchProxy.newProxy(client,this.bulksize,this.indexname,this.typename);
		return PluginStatus.SUCCESS.value();
	}


}
