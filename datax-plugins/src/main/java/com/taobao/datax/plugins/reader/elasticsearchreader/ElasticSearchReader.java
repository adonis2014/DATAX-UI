package com.taobao.datax.plugins.reader.elasticsearchreader;

import java.io.IOException;
import java.net.InetAddress;
import java.net.UnknownHostException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
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
import org.elasticsearch.action.search.SearchRequestBuilder;
import org.elasticsearch.action.search.SearchResponse;
import org.elasticsearch.client.Client;
import org.elasticsearch.client.transport.TransportClient;
import org.elasticsearch.common.settings.Settings;
import org.elasticsearch.common.transport.InetSocketTransportAddress;
import org.elasticsearch.common.unit.TimeValue;
import org.elasticsearch.search.SearchHit;
import org.elasticsearch.search.sort.SortOrder;

import com.fasterxml.jackson.databind.ObjectMapper;
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
 * 
 * @author admin
 *
 */
public class ElasticSearchReader extends Reader {

	// 群组名称
	private String clustername;
	// 索引名称
	private String indexname;
	// 类型名称(类似表名)
	private String typename;
	// hbase table名称
	private String htableName;

	private String hbaseConf = null;
	// 批量提交的记录数
	private int buffsize;
	
	private String routing;
	
	private int isHotStableSplit = 0;
	// 要写的字段名，','间隔
	private String column_name;
	// 要写的字段数组
	private String[] columnNames;

	private String queryString;

	private String order_field;

	private String[] orderItems;

	private String hosts;

	private boolean needHBaseQuery = false;

	private boolean onlyEsQuery = false;

	private Logger logger = Logger.getLogger(ElasticSearchReader.class);
	ObjectMapper mapper = new ObjectMapper();

	private Client client;

	private Configuration config;

	private HTable htable;

	private int days = -1;
	private String dayRange = "";
	
	private  String shield_user;
	private  String shield_password;

	@Override
	public int prepare(PluginParam param) {
		this.logger.info("DataX ElasticSearchReader do prepare work .");
		return this.finish();
	}

	private boolean hasColumn(String cname) {
		if (cname.equalsIgnoreCase("id")) {
			return true;
		}
		if (cname.startsWith("'") && cname.endsWith("'")) {
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
		client = null;
		return PluginStatus.SUCCESS.value();
	}

	@SuppressWarnings("deprecation")
	private void sendLine(LineSender sender, String queryStr) {
		try {
			SearchResponse esResponse =null;
			SearchRequestBuilder sb=null;
			if (StringUtils.isEmpty(this.order_field)){
				sb = client.prepareSearch(indexname).setTypes(typename).setScroll(TimeValue.timeValueMinutes(60))
						.setQuery(queryStr).setSize(this.buffsize);
			}else{
				sb = client.prepareSearch(indexname).setTypes(typename).addSort(this.order_field, SortOrder.ASC).setScroll(TimeValue.timeValueMinutes(60))
						.setQuery(queryStr).setSize(this.buffsize);//setRouting(this.routing).setPreference("_replica_first")
			}
			if (StringUtils.isNotEmpty(this.routing)){
				sb.setRouting(this.routing.split(";"));
			}
			if (this.isHotStableSplit==1){
				sb.setPreference("_replica_first");
			}
			esResponse=sb.execute().actionGet();
			logger.info("hit total:" + esResponse.getHits().getTotalHits());
			if (!this.onlyEsQuery) {
				for (String cname : columnNames) {
					if (!hasColumn(cname)) {
						this.needHBaseQuery = true;
						break;
					}
				}
			}
			if (this.needHBaseQuery) {// 需要查询hbase
				try {
					Configuration conf = new Configuration();
					conf.addResource(new Path(this.hbaseConf));
					config = new Configuration(conf);
					htable = new HTable(config, this.htableName);
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
			if (esResponse.getHits().getTotalHits() > 0) {
				List<Get> gets = new ArrayList<Get>();
				while (true) {
					for (SearchHit hit : esResponse.getHits()) {
						if (this.needHBaseQuery) {// 获取get集合，批量hbase查询
							Get get = new Get(Bytes.toBytes(hit.getId()));
							gets.add(get);
							if (gets.size() > this.buffsize) {
								Result[] rs = htable.get(gets);
								for (Result ur : rs) {
									Line line = sender.createLine();
									for (String cname : this.columnNames) {
										if ("id".equalsIgnoreCase(cname)) {
											line.addField(Bytes.toString(ur.getRow()));
										} else if (cname.startsWith("'") && cname.endsWith("'")) {
											line.addField(cname.substring(1, cname.length() - 1));
										} else {
											line.addField(Bytes.toString(ur.getValue(Bytes.toBytes(cname.split(":")[0].trim()), Bytes.toBytes(cname.split(":")[1].trim()))));
										}
									}
									sender.sendToWriter(line);
									monitor.lineSuccess();
								}
								gets.clear();
							}
						} else {
							Line line = sender.createLine();
							for (String cname : this.columnNames) {
								if ("id".equalsIgnoreCase(cname)) {
									line.addField(hit.getId());
								} else if (cname.startsWith("'") && cname.endsWith("'")) {
									line.addField(cname.substring(1, cname.length() - 1));
								} else {
									line.addField(ETLStringUtils.getNullString(hit.getSource().get(cname)));
								}
							}
							sender.sendToWriter(line);
							monitor.lineSuccess();
						}

					}
					esResponse = client.prepareSearchScroll(esResponse.getScrollId()).setScroll(TimeValue.timeValueMinutes(20)).execute().actionGet();
					if (esResponse.getHits().getHits().length == 0) {
						break;
					}
					
				}
				if (this.needHBaseQuery && !gets.isEmpty()) {// 获取get集合，批量hbase查询
					Result[] rs = htable.get(gets);
					for (Result ur : rs) {
						Line line = sender.createLine();
						for (String cname : this.columnNames) {
							if ("id".equalsIgnoreCase(cname)) {
								line.addField(Bytes.toString(ur.getRow()));
							} else if (cname.startsWith("'") && cname.endsWith("'")) {
								line.addField(cname.substring(1, cname.length() - 1));
							} else {
								line.addField(Bytes.toString(ur.getValue(Bytes.toBytes(cname.split(":")[0].trim()), Bytes.toBytes(cname.split(":")[1].trim()))));
							}
						}
						sender.sendToWriter(line);
						monitor.lineSuccess();
					}
					gets.clear();
				}
			}
		} catch (Exception e) {
			logger.error(ExceptionTracker.trace(e));
			throw new DataExchangeException(e.getCause());
		} finally {

		}
	}

	@Override
	public int startRead(LineSender sender) {
		if (queryString.indexOf("{currDate}") >= 0) {
			queryString = StringUtils.replace(queryString, "{currDate}",
					ETLDateUtils.formatDate(ETLDateUtils.addDays(ETLDateUtils.getCurrTimestamp(), this.days), ETLConstants.DATE_ONLY_FORMAT));
		}
		if (queryString.indexOf("{startDate}") > 0 && queryString.indexOf("{stopDate}") > 0 && StringUtils.isNotEmpty(dayRange)) {
			try {
				String[] days = StringUtils.split(this.dayRange, "/");
				Date d1= new SimpleDateFormat("yyyy-MM-dd").parse(days[0]);
				// 定义起始日期
				Date d2 = new SimpleDateFormat("yyyy-MM-dd").parse(days[1]);// 定义结束日期
				Calendar dd = Calendar.getInstance();// 定义日期实例
				dd.setTime(d1);// 设置日期起始时间
				String startDate =null;String stopDate=null;String queryStr=null;
				while (dd.getTime().before(d2)) {// 判断是否到结束日期
					SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
					startDate = sdf.format(dd.getTime());
					dd.add(Calendar.DATE, 1);// 进行当前日期月份加1
					stopDate=sdf.format(dd.getTime());
					queryStr = StringUtils.replace(queryString, "{startDate}",startDate);
					queryStr = StringUtils.replace(queryStr, "{stopDate}",stopDate);
					sendLine(sender, queryStr);
//					Thread.sleep(3000);
				}
			} catch (ParseException e) {
				e.printStackTrace();
			}
		} else {
			sendLine(sender, this.queryString);
		}
		sender.flush();
		return PluginStatus.SUCCESS.value();
	}

	@SuppressWarnings("resource")
	@Override
	public int init() {
		this.clustername = param.getValue(ParamKey.clustername);
		this.hosts = param.getValue(ParamKey.hosts);
		this.indexname = param.getValue(ParamKey.indexname);
		this.typename = param.getValue(ParamKey.typename);
		try {
			this.htableName = param.getValue(ParamKey.htableName);
		} catch (Exception ex) {
		}
		this.buffsize = param.getIntValue(ParamKey.buffsize, 500);
		this.column_name = param.getValue(ParamKey.columns);
		this.columnNames = this.column_name.split(",");
		try {
		this.routing = param.getValue(ParamKey.routing);
		} catch (Exception ex) {
		}
		
		this.isHotStableSplit=param.getIntValue(ParamKey.isHotStableSplit,0);
		try {
			this.shield_user = param.getValue(ParamKey.shield_user);
			this.shield_password = param.getValue(ParamKey.shield_password);
		} catch (Exception ex) {
		}
		try {
			if ("true".equalsIgnoreCase(param.getValue(ParamKey.onlyEsQuery))) {
				this.onlyEsQuery = true;
			}
		} catch (Exception ex) {
		}
		try {
			this.days = param.getIntValue(ParamKey.days, -1);
		} catch (Exception ex) {
			dayRange = param.getValue(ParamKey.days);
		}
		try {
			this.order_field = param.getValue(ParamKey.order_field);
			if (StringUtils.isNotBlank(order_field.trim())) {
				this.orderItems = this.order_field.split(",");
			}
		} catch (Exception ex) {
		}
		this.queryString = param.getValue(ParamKey.queryString);
		try {
			this.hbaseConf = this.param.getValue(ParamKey.hbase_conf);
		} catch (Exception ex) {
		}
		String[] hosts = ETLStringUtils.split(this.hosts, ";");
		int id = 0;
		InetSocketTransportAddress[] transportAddress = new InetSocketTransportAddress[hosts.length];
		for (String host : hosts) {
			String[] hp = ETLStringUtils.split(host, ":");
			try {
				transportAddress[id] = new InetSocketTransportAddress(InetAddress.getByName(hp[0]), NumberUtils.toInt(hp[1], 9300));
			} catch (UnknownHostException e) {
				e.printStackTrace();
			}
//			transportAddress[id] = new InetSocketTransportAddress(hp[0], NumberUtils.toInt(hp[1], 9300));
			id++;
		}
		Settings settings = null;
		if (StringUtils.isNotEmpty(this.shield_user)){
			settings = Settings.settingsBuilder().put("cluster.name", this.clustername).put("shield.user", this.shield_user+":"+this.shield_password).put("client.transport.sniff", true).build();
		}else{
			settings = Settings.settingsBuilder().put("cluster.name", this.clustername).put("client.transport.sniff", true).build();
		}
		client =TransportClient.builder().settings(settings).build().addTransportAddresses(transportAddress);
//		client = new TransportClient(settings).addTransportAddresses(transportAddress);
		return PluginStatus.SUCCESS.value();
	}

}
