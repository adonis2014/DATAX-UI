package com.taobao.datax.plugins.reader.elasticsearchreader;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.lang.math.NumberUtils;
import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.fs.Path;
import org.apache.hadoop.hbase.client.Get;
import org.apache.hadoop.hbase.client.HTable;
import org.apache.hadoop.hbase.client.Result;
import org.apache.hadoop.hbase.util.Bytes;
import org.apache.log4j.Logger;
import org.codehaus.jackson.map.ObjectMapper;
import org.elasticsearch.action.search.SearchRequestBuilder;
import org.elasticsearch.action.search.SearchResponse;
import org.elasticsearch.action.search.SearchType;
import org.elasticsearch.client.Client;
import org.elasticsearch.client.transport.TransportClient;
import org.elasticsearch.common.settings.ImmutableSettings;
import org.elasticsearch.common.settings.Settings;
import org.elasticsearch.common.transport.InetSocketTransportAddress;
import org.elasticsearch.common.unit.TimeValue;
import org.elasticsearch.search.SearchHit;
import org.elasticsearch.search.sort.SortOrder;

import com.taobao.datax.common.exception.DataExchangeException;
import com.taobao.datax.common.exception.ExceptionTracker;
import com.taobao.datax.common.plugin.Line;
import com.taobao.datax.common.plugin.LineSender;
import com.taobao.datax.common.plugin.PluginParam;
import com.taobao.datax.common.plugin.PluginStatus;
import com.taobao.datax.common.plugin.Reader;
import com.taobao.datax.common.util.ETLDateUtils;
import com.taobao.datax.common.util.ETLStringUtils;
import com.taobao.datax.utils.ETLConstants;
/**
 * 数据写入elastic search 插件
 * @author admin
 *
 */
public class ElasticSearchReader extends Reader {

	//群组名称
	private String clustername;
	//索引名称
	private String indexname;
	//类型名称(类似表名)
	private String typename;
	//hbase table名称
	private String htableName;
	
	private String hbaseConf = null;
	//批量提交的记录数
	private int buffsize;
	//要写的字段名，','间隔
	private String column_name;
	//要写的字段数组
	private String[] columnNames;
	
	private String queryString;
	
	private String order_field;
	
	private String[] orderItems;
	
	private String hosts;
	
	private boolean needHBaseQuery=false;

	private Logger logger = Logger.getLogger(ElasticSearchReader.class);
	ObjectMapper mapper = new ObjectMapper();

	private Client client; 
	
	private Configuration config;

	private HTable htable;
	
	private int days=-1;
	@Override
	public int prepare(PluginParam param) {
		this.logger.info("DataX ElasticSearchReader do prepare work .");
		return this.finish();
	}
	
	private boolean hasColumn(String cname){
		if (cname.equalsIgnoreCase("id")){
			return true;
		}
		if (cname.startsWith("'") && cname.endsWith("'")){
			return true;
		}
		
		return false;
	}

	

	@Override
	public int connect() {
		return PluginStatus.SUCCESS.value();
	}

	@Override
	public int finish() {
		client.close();
		client=null;
		return PluginStatus.SUCCESS.value();
	}


	@Override
	public int startRead(LineSender sender) {
		try {
			if (queryString.indexOf("{currDate}")>=0){
				queryString=StringUtils.replace(queryString,"{currDate}",
						ETLDateUtils.formatDate(ETLDateUtils.addDays(ETLDateUtils.getCurrTimestamp(), this.days) ,ETLConstants.DATE_ONLY_FORMAT));
			}
			SearchRequestBuilder esRequest = client.prepareSearch(indexname).setTypes(typename).setQuery(this.queryString);
			if (orderItems!=null){
				for (String oitem : orderItems) {
					esRequest.addSort(oitem,SortOrder.ASC);
				}
			}
			SearchResponse esResponse = esRequest.setSearchType(SearchType.SCAN).setScroll(TimeValue.timeValueMinutes(20)).setSize(this.buffsize).execute().actionGet();
			logger.info("hit total:"+esResponse.getHits().getTotalHits());
			for(String cname:columnNames){
				if (!hasColumn(cname)){
					this.needHBaseQuery=true;
					break;
				}
			}
			if (this.needHBaseQuery){//需要查询hbase
				try {
					Configuration conf = new Configuration();
					conf.addResource(new Path(this.hbaseConf));
					config = new Configuration(conf);
					htable = new HTable(config, this.htableName);
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
			if (esResponse.getHits().getTotalHits()>0){
				List<Get> gets=new ArrayList<Get>();
				while (true) {
					esResponse = client.prepareSearchScroll(esResponse.getScrollId()).setScroll(TimeValue.timeValueMinutes(10)).execute().actionGet();
					if (esResponse.getHits().getHits().length == 0) {
						break;
					}
					for (SearchHit hit : esResponse.getHits()) {
						if (this.needHBaseQuery){//获取get集合，批量hbase查询
							Get get=new Get(Bytes.toBytes(hit.getId()));
							gets.add(get);
							if (gets.size()>this.buffsize){
								Result[] rs = htable.get(gets);
								for (Result ur : rs) {
									Line line = sender.createLine();
									for(String cname:this.columnNames){
										if ("id".equalsIgnoreCase(cname)){
											line.addField(Bytes.toString(ur.getRow()));
										}else if (cname.startsWith("'") && cname.endsWith("'")){
											line.addField(cname.substring(1,cname.length()-1));
										}else{
											line.addField(Bytes.toString(ur.getValue(Bytes.toBytes(cname.split(":")[0].trim()), Bytes.toBytes(cname.split(":")[1].trim()))));
										}
									}
									sender.sendToWriter(line);
									monitor.lineSuccess();
								}
								gets.clear();
							}
						}else{
							Line line = sender.createLine();
							for(String cname:this.columnNames){
								if ("id".equalsIgnoreCase(cname)){
									line.addField(hit.getId());
								}else if (cname.startsWith("'") && cname.endsWith("'")){
									line.addField(cname.substring(1,cname.length()-1));
								} 
							}
							sender.sendToWriter(line);
							monitor.lineSuccess();
						}
						
					}
				}
			}
			sender.flush();
		} catch (Exception e) {
			logger.error(ExceptionTracker.trace(e));
			throw new DataExchangeException(e.getCause());
		} finally {
			
		}
		return PluginStatus.SUCCESS.value();
	}

	@SuppressWarnings("resource")
	@Override
	public int init() {
		this.clustername=param.getValue(ParamKey.clustername);
		this.hosts=param.getValue(ParamKey.hosts);
		this.indexname=param.getValue(ParamKey.indexname);
		this.typename=param.getValue(ParamKey.typename);
		this.htableName=param.getValue(ParamKey.htableName);
		this.buffsize=param.getIntValue(ParamKey.buffsize,500);
		this.column_name=param.getValue(ParamKey.columns);
		this.columnNames=this.column_name.split(",");
		try{
			this.days=param.getIntValue(ParamKey.days,-1);
		}catch(Exception ex){}
		try{
			this.order_field=param.getValue(ParamKey.order_field);
			if (StringUtils.isNotBlank(order_field.trim())){
				this.orderItems=this.order_field.split(",");
			}
		}catch(Exception ex){}
		this.queryString=param.getValue(ParamKey.queryString);
		this.hbaseConf = this.param.getValue(ParamKey.hbase_conf);
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
		return PluginStatus.SUCCESS.value();
	}




}
