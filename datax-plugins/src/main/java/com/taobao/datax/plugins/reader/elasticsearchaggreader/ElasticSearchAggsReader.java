package com.taobao.datax.plugins.reader.elasticsearchaggreader;

import java.net.InetAddress;
import java.net.UnknownHostException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.lang.math.NumberUtils;
import org.apache.log4j.Logger;
import org.codehaus.jackson.map.ObjectMapper;
import org.elasticsearch.action.search.SearchResponse;
import org.elasticsearch.client.Client;
import org.elasticsearch.client.transport.TransportClient;
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
import com.taobao.datax.plugins.reader.elasticsearchreader.ParamKey;
import com.taobao.datax.utils.ETLConstants;

public class ElasticSearchAggsReader extends Reader {

	// 群组名称
	private String clustername;
	// 索引名称
	private String indexname;
	// 类型名称(类似表名)
	private String typename;
	// 要写的字段名，','间隔
	private String column_name;
	// 要写的字段数组
	private String[] columnNames;

	private String queryString;


	private String hosts;


	private String routing;
	
	private int isHotStableSplit = 0;
	
	private Logger logger = Logger.getLogger(ElasticSearchAggsReader.class);
	ObjectMapper mapper = new ObjectMapper();

	private Client client;

	private int days = -1;
	private String dayRange = "";

	@Override
	public int prepare(PluginParam param) {
		this.logger.info("DataX ElasticSearchReader do prepare work .");
		return this.finish();
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

	private void sendLine(LineSender sender, String queryStr) {
		try {
			SearchResponse esResponse = client.prepareSearch(indexname).setScroll(TimeValue.timeValueMinutes(60))
					.setQuery(queryStr).execute().actionGet();
			logger.info("hit total:" + esResponse.getHits().getTotalHits());
			if (esResponse.getHits().getTotalHits() > 0) {
				while (true) {
					for (SearchHit hit : esResponse.getHits()) {
						
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
					esResponse = client.prepareSearchScroll(esResponse.getScrollId()).setScroll(TimeValue.timeValueMinutes(20)).execute().actionGet();
					if (esResponse.getHits().getHits().length == 0) {
						break;
					}
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

	@Override
	public int init() {
		this.clustername = param.getValue(ParamKey.clustername);
		this.hosts = param.getValue(ParamKey.hosts);
		this.indexname = param.getValue(ParamKey.indexname);
		this.typename = param.getValue(ParamKey.typename);
		this.column_name = param.getValue(ParamKey.columns);
		this.columnNames = this.column_name.split(",");
		try {
			this.routing = param.getValue(ParamKey.routing);
			} catch (Exception ex) {
			}
		this.isHotStableSplit=param.getIntValue(ParamKey.isHotStableSplit,0);
		try {
			this.days = param.getIntValue(ParamKey.days, -1);
		} catch (Exception ex) {
			dayRange = param.getValue(ParamKey.days);
		}
		
		this.queryString = param.getValue(ParamKey.queryString);
		
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
			id++;
		}
		Settings settings = Settings.settingsBuilder().put("cluster.name", this.clustername).put("client.transport.sniff", true).build();
		client =TransportClient.builder().settings(settings).build().addTransportAddresses(transportAddress);
//		client = new TransportClient(settings).addTransportAddresses(transportAddress);
		return PluginStatus.SUCCESS.value();
	}

}

