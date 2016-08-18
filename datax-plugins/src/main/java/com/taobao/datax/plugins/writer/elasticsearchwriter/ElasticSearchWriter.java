package com.taobao.datax.plugins.writer.elasticsearchwriter;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.net.InetAddress;
import java.net.UnknownHostException;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.lang.math.NumberUtils;
import org.apache.log4j.Logger;
import org.apache.lucene.queryparser.classic.QueryParser;
import org.elasticsearch.client.Client;
import org.elasticsearch.client.transport.TransportClient;
import org.elasticsearch.common.settings.Settings;
import org.elasticsearch.common.transport.InetSocketTransportAddress;
import org.elasticsearch.shield.ShieldPlugin;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.taobao.datax.common.plugin.Line;
import com.taobao.datax.common.plugin.LineReceiver;
import com.taobao.datax.common.plugin.PluginParam;
import com.taobao.datax.common.plugin.PluginStatus;
import com.taobao.datax.common.plugin.Writer;
import com.taobao.datax.common.util.ETLConstants;
import com.taobao.datax.common.util.ETLDateUtils;
import com.taobao.datax.common.util.ETLStringUtils;

/**
 * 数据写入elastic search 插件
 * 
 * @author admin
 * 
 */
public class ElasticSearchWriter extends Writer {

	// 群组名称
	private String clustername;
	// 索引名称
	private String indexname;
	// 分片数目
	private int number_of_shards;
	// 索引副本数目
	private int number_of_replicas;
	// 类型名称(类似表名)
	private String typename;
	// 批量提交的记录数
	private int bulksize;
	// 结构mapping定义，json字符串文件
	private String mapping_xml;
	// 删除模式；由用户进行选择，0 写入前不删除，如果不存在，建立新表，覆盖文件 1 上传数据之前truncate原type;2
	// 上传数据之前delete原type
	private int delMode;
	// 要写的字段名，','间隔
	private String column_name;
	// 要写的字段数组
	private String[] columnNames;

	private String[] formats = null;

	private String hosts;
	// 要读的字段id集合,','间隔
	private String column_value_index;
	// 要读的字段id数组
	private int[] columnIndexes;
	// 要读的字段id转义集合,','间隔
	private String column_escape_index;
	// 是否转义的定义
	private int[] columnEscapeIndexes;
	// _id指定的字段
	private int uniquekey = -1;

	private String rowKeyRule = "0";
	
	private int routing = -1;
	
	private int isHotStableSplit = 0;
	
	private String routingValue = null;

	private boolean ignoreEmptyRowId = true;

	// rowid设置方式
	private int rowKeyRuleValue = 0;
	// 求余数方式计算rowId的参数
	private Integer fieldvalueLen = 15;
	private Integer remainder = 200;
	private Integer remainderLen = 3;
	private String rowIdPattern = "yyyy-MM-dd";
	// 多个字段组合方式
	private int[] rowIdIdx;// 字段index值，数字集合

	private String parent;

	private ElasticSearchProxy proxy;
	
	private String splitColumnName;
	
	private boolean isUpdate=false;
	private  String shield_user;
	private  String shield_password;

	private Logger logger = Logger.getLogger(ElasticSearchWriter.class);
	ObjectMapper mapper = new ObjectMapper();

	private Client client;

	@Override
	public int prepare(PluginParam param) {
		this.logger.info("DataX ElasticSearchWriter do prepare work .");
		// 根据模式删除清理已有表
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
			} catch (Exception e1) {
			}
			return PluginStatus.SUCCESS.value();
			// throw new DataExchangeException(e.getCause());
		}
	}

	/**
	 * 新建定义的es type作为表
	 */
	private void createTable() throws Exception {
		this.logger.info(String.format("ElasticSearchWriter begins to create table %s .", this.indexname, this.typename));
		proxy.createTable(this.indexname, number_of_shards, number_of_replicas, typename, bulksize, mapping_xml,isHotStableSplit);
	}

	private void deleteTables() throws Exception {
		this.logger.info(String.format("ElasticSearchWriter begins to delete table %s .", this.indexname, this.typename));
		proxy.deleteTable(this.indexname, number_of_shards, number_of_replicas, typename, mapping_xml);
	}

	private void truncateTable() throws Exception {
		this.logger.info(String.format("ElasticSearchWriter begins to truncate table %s .", this.indexname, this.typename));
		proxy.truncateTable(indexname, number_of_shards, number_of_replicas, typename, this.mapping_xml);
	}

	@Override
	public int connect() {
		return PluginStatus.SUCCESS.value();
	}

	@Override
	public int finish() {
		client.close();
		// node.close();
		client = null;
		return PluginStatus.SUCCESS.value();
	}
	
	@Override
	public List<PluginParam> split(PluginParam param) {
		ElasticSearchWriterSplitter spliter = new ElasticSearchWriterSplitter();
		spliter.setParam(param);
		spliter.init();
		return spliter.split();
	}

	@SuppressWarnings({ "unchecked", "rawtypes" })
	@Override
	public int startWrite(LineReceiver receiver) {
		Line line;
		int fieldNum;
		// 准备bulk对象
		proxy.prepare();
		/*
		 * NOTE: field numbers in each line may be different
		 */
		String lineValue = null;
		while ((line = receiver.getFromReader()) != null) {
			try {
				fieldNum = line.getFieldNum();
				if (0 == fieldNum || 1 == fieldNum) {
					logger.warn("elasticsearch Writer meets an empty line, ignore it .");
					continue;
				}
				Map map = new ConcurrentHashMap();
				// Map tepMap=new ConcurrentHashMap();
				for (int i = 0; i < columnIndexes.length; i++) {
					if (ETLStringUtils.isEmpty(line.checkAndGetField(columnIndexes[i]))) {
						// logger.warn("elasticsearch Writer meets an empty column, ignore it ."+columnIndexes[i]);
						continue;
					}
					if (StringUtils.isNotEmpty(line.getField(columnIndexes[i]))) {
						lineValue = ETLStringUtils.trim(line.getField(columnIndexes[i]));
						if (columnNames[i].indexOf(".") > 0 && (columnNames[i].indexOf("mm:ss.S")<=0 && columnNames[i].indexOf("mm:ss.s")<=0) ) {// 对象
							String[] cnames = StringUtils.split(columnNames[i], ".");
							Object nMap = map.get(cnames[0]);
							Map nestMap = null;
							if (nMap != null) {
								nestMap = (Map) nMap;
							} else {
								nestMap = new ConcurrentHashMap();
							}
							if (formats[i] != null) {
								lineValue = StringUtils.substring(lineValue, 0, 19);
							}

							if (ETLStringUtils.getJSONType(lineValue) == ETLStringUtils.JSON_TYPE.JSON_TYPE_STRING) {
								if (lineValue.length() > 32766) {
									lineValue = lineValue.substring(0, 32760);
								}
								if (cnames[1].indexOf("|") > 0) {// 存在格式定义
									String[] cms = StringUtils.split(cnames[1], "|");
									if ("SPLIT".equalsIgnoreCase(cms[1])) {// 分割字符串为数组
										if (1 == columnEscapeIndexes[i])
											lineValue = QueryParser.escape(lineValue);
										if (StringUtils.contains(lineValue, "-")) {
											String[] values = StringUtils.split(lineValue, "-");
											List vvList = new ArrayList<String>();
											for (String vv : values) {
												if (StringUtils.isNotEmpty(vv)) {
													vvList.add(vv);
												}
											}
											if (!vvList.isEmpty())
												nestMap.put(cms[0], vvList);
										} else {
											nestMap.put(cms[0], lineValue);
										}
									} else {
										Date theDate = ETLDateUtils.parseDate(lineValue, "yyyy-MM-dd HH:mm:ss");
										if (theDate == null) {
											theDate = ETLDateUtils.parseDate(lineValue, "yyyy-MM-dd HH:mm:ss.sss");
										}
										if (theDate == null) {
											theDate = ETLDateUtils.parseDate(lineValue, "yyyy-MM-dd HH:mm:ss.s");
										}
										if (theDate == null) {
											theDate = ETLDateUtils.parseDate(lineValue, "YYYYMMddHHmmss");
										}
										if (theDate == null) {
											theDate = ETLDateUtils.parseDate(lineValue, "yyyy-MM-dd");
										}
										if (theDate == null) {
											theDate = ETLDateUtils.parseDate(lineValue, "YYYYMMdd");
										}
										if (theDate != null)nestMap.put(cms[0], ETLDateUtils.formatDate(theDate, cms[1]));
									}
								} else {
									if (1 == columnEscapeIndexes[i]) {// 是否转义
										nestMap.put(cnames[1], QueryParser.escape(lineValue));
									} else {
										if (formats[i] == null) {
											nestMap.put(cnames[1], lineValue);
										} else {
											nestMap.put(cnames[1], StringUtils.substring(lineValue, 0, 19));
										}
									}
								}
							} else if (ETLStringUtils.getJSONType(lineValue) == ETLStringUtils.JSON_TYPE.JSON_TYPE_ARRAY) {
								try {
									if (1 == columnEscapeIndexes[i]) {// 是否转义
										nestMap.put(cnames[1], escapeList(mapper.readValue(lineValue, List.class)));
									} else {
										nestMap.put(cnames[1], mapper.readValue(lineValue, List.class));
									}
								} catch (Exception ex) {
									nestMap.put(cnames[1], lineValue);
								}
							} else if (ETLStringUtils.getJSONType(lineValue) == ETLStringUtils.JSON_TYPE.JSON_TYPE_OBJECT) {
								try {
									if (1 == columnEscapeIndexes[i]) {// 是否转义
										nestMap.put(cnames[1], escapeMap(mapper.readValue(lineValue, Map.class)));
									} else {
										nestMap.put(cnames[1], mapper.readValue(lineValue, Map.class));
									}
								} catch (Exception ex) {
									nestMap.put(cnames[1], lineValue);
								}
							}
							map.put(cnames[0], nestMap);
						} else {
							if (ETLStringUtils.getJSONType(lineValue) == ETLStringUtils.JSON_TYPE.JSON_TYPE_STRING) {
								if (lineValue.length() > 32766) {
									lineValue = lineValue.substring(0, 32760);
								}
								if (columnNames[i].indexOf("|") > 0) {// 存在格式定义
									String[] cms = StringUtils.split(columnNames[i], "|");
									if ("SPLIT".equalsIgnoreCase(cms[1])) {// 分割字符串为数组
										if (1 == columnEscapeIndexes[i])
											lineValue = QueryParser.escape(lineValue);
										if (StringUtils.contains(lineValue, "-")) {
											String[] values = StringUtils.split(lineValue, "-");
											List vvList = new ArrayList<String>();
											for (String vv : values) {
												if (StringUtils.isNotEmpty(vv)) {
													vvList.add(vv);
												}
											}
											if (!vvList.isEmpty())
												map.put(cms[0], vvList);
										} else {
											map.put(cms[0], lineValue);
										}
									} else {
										Date theDate = ETLDateUtils.parseDate(lineValue, "yyyy-MM-dd HH:mm:ss");
										if (theDate == null) {
											theDate = ETLDateUtils.parseDate(lineValue, "yyyy-MM-dd HH:mm:ss.sss");
										}
										if (theDate == null) {
											theDate = ETLDateUtils.parseDate(lineValue, "yyyy-MM-dd HH:mm:ss.s");
										}
										if (theDate == null) {
											theDate = ETLDateUtils.parseDate(lineValue, "YYYYMMddHHmmss");
										}
										if (theDate == null) {
											theDate = ETLDateUtils.parseDate(lineValue, "yyyy-MM-dd");
										}
										if (theDate == null) {
											theDate = ETLDateUtils.parseDate(lineValue, "YYYYMMdd");
										}
										if (theDate != null)
											map.put(cms[0], ETLDateUtils.formatDate(theDate, cms[1]));
									}
								} else {
									if (1 == columnEscapeIndexes[i]) {// 是否转义
										map.put(this.columnNames[i], QueryParser.escape(lineValue));
									} else {
										if (formats[i] == null) {
											map.put(this.columnNames[i], lineValue);
										} else {
											map.put(this.columnNames[i], StringUtils.substring(lineValue, 0, 19));
										}
									}
								}
							} else if (ETLStringUtils.getJSONType(lineValue) == ETLStringUtils.JSON_TYPE.JSON_TYPE_ARRAY) {
								try {
									if (1 == columnEscapeIndexes[i]) {// 是否转义
										map.put(this.columnNames[i], escapeList(mapper.readValue(lineValue, List.class)));
									} else {
										map.put(this.columnNames[i], mapper.readValue(lineValue, List.class));
									}
								} catch (Exception ex) {
									map.put(this.columnNames[i], lineValue);
								}
							} else if (ETLStringUtils.getJSONType(lineValue) == ETLStringUtils.JSON_TYPE.JSON_TYPE_OBJECT) {
								try {
									if (1 == columnEscapeIndexes[i]) {// 是否转义
										map.put(this.columnNames[i], escapeMap(mapper.readValue(lineValue, Map.class)));
									} else {
										map.put(this.columnNames[i], mapper.readValue(lineValue, Map.class));
									}
								} catch (Exception ex) {
									map.put(this.columnNames[i], lineValue);
								}
							}
						}
					}
				}
				if (this.uniquekey >= 0) {
					// System.out.println("id:--"+line.getField(this.uniquekey));
					// rowKey计算方式，可以自己定义增加多种方式
					String uqId = "";
					switch (rowKeyRuleValue) {
					case 0:// 直接使用指定字段作为rowId
					{
						uqId = line.getField(uniquekey);
						if (StringUtils.isEmpty(uqId) && ignoreEmptyRowId) {
							//logger.warn("rowid指定字段为空，不能作为合法记录:" + uqId);
							continue;
						}
						break;
					}
					case 1:// 使用求余数方式计算rowId
					{
						String rowId = line.getField(uniquekey);
						if (!NumberUtils.isDigits(rowId)) {
							logger.warn("rowid指定字段不是数字，不能求余数:" + rowId);
							continue;
						}
						uqId = ETLStringUtils.getRemainderRowId(Long.valueOf(rowId), fieldvalueLen, remainder, remainderLen);
						break;
					}
					case 2:// 使用组合字段方式计算rowId
					{
						List<String> fieldValues = new ArrayList<String>();
						boolean rowidEnable = true;
						for (int rowIdx : this.rowIdIdx) {
							if (StringUtils.isEmpty(line.getField(rowIdx)) || "[]".equalsIgnoreCase(line.getField(rowIdx))) {
								if (this.ignoreEmptyRowId) {
									rowidEnable = false;
									break;
								}
							}
							if (ETLStringUtils.getJSONType(line.getField(rowIdx)) == ETLStringUtils.JSON_TYPE.JSON_TYPE_ARRAY) {
								List<String> arrs = mapper.readValue(line.getField(rowIdx), List.class);
								fieldValues.addAll(arrs);
							} else {
								fieldValues.add(line.getField(rowIdx));
							}
						}
						if (!rowidEnable && ignoreEmptyRowId) {
							//logger.warn("elasticsearch Writer meets an empty rowid, ignore it ." + line.toString());
							continue;
						}
						uqId = ETLStringUtils.getHbaseRowId(fieldValues);
						break;
					}
					case 3:// 日期+自增长方式
					{
						String rowId = line.getField(uniquekey);
						if (StringUtils.isEmpty(rowId) && ignoreEmptyRowId) {
							logger.warn("rowid指定字段为空，不能作为合法记录:" + rowId);
							continue;
						}
						uqId = ETLStringUtils.getDateIncrementRowId(this.indexname + "-" + this.typename, rowId, rowIdPattern);
						break;
					}
					case 4:// 指定字段倒序方式
					{
						String rowId = line.getField(uniquekey);
						if (StringUtils.isEmpty(rowId) && ignoreEmptyRowId) {
							logger.warn("rowid指定字段为空，不能作为合法记录:" + rowId);
							continue;
						}
						uqId = ETLStringUtils.reverse(rowId);
						break;
					}
					case 5:// 首字段倒序，组合字段
					{
						StringBuffer rowId = new StringBuffer();
						boolean rowidEnable = true;
						for (int i = 0; i < this.rowIdIdx.length; i++) {
							if (StringUtils.isEmpty(line.getField(rowIdIdx[i]))) {
								if (this.ignoreEmptyRowId) {
									rowidEnable = false;
									break;
								}
							}
							List<String> vv = this.getValues(line.getField(rowIdIdx[i]));
							if (this.ignoreEmptyRowId && vv.isEmpty()) {
								rowidEnable = false;
								break;
							}
							if (i == 0) {
								rowId.append(StringUtils.reverse(line.getField(rowIdIdx[0])));
							} else {
								rowId.append(ETLConstants.separator);
								rowId.append(ETLStringUtils.getHbaseRowId(vv));// line.getField(rowIdIdx[i]));
							}
						}
						if (!rowidEnable && ignoreEmptyRowId) {
							//logger.warn("rowid指定字段为空，不能作为合法记录:" + rowId.toString());
							continue;
						}
						uqId = rowId.toString();
						break;
					}case 7:{//组合字段，不存在字段不跳过，以null代替
						List<String> fieldValues = new ArrayList<String>();
						for (int rowIdx : this.rowIdIdx) {
							if (StringUtils.isEmpty(line.getField(rowIdx)) || "[]".equalsIgnoreCase(line.getField(rowIdx))) {
								fieldValues.add("null");
							}else if (ETLStringUtils.getJSONType(line.getField(rowIdx)) == ETLStringUtils.JSON_TYPE.JSON_TYPE_ARRAY) {
								List<String> arrs = mapper.readValue(line.getField(rowIdx), List.class);
								fieldValues.addAll(arrs);
							} else {
								fieldValues.add(line.getField(rowIdx));
							}
						}
						uqId = ETLStringUtils.getHbaseRowId(fieldValues);
						break;
					}
					}
					if (this.routing>-1){
						routingValue=line.getField(this.routing);
					}
					if (rowKeyRuleValue==6){//首字段倒序，最后字段如果多个分割id插入多行
						String rowId =null;
						List<String> rowValues =null;boolean rowidEnable = true;
						for (int i = 0; i < this.rowIdIdx.length; i++) {
							if (StringUtils.isEmpty(line.getField(rowIdIdx[i]))) {
								if (this.ignoreEmptyRowId) {
									rowidEnable = false;
									break;
								}
							}
							if (i == 0) {
								rowId=StringUtils.reverse(line.getField(rowIdIdx[i]));
							}else if (i<rowIdIdx.length-1) {
								rowId=rowId+ETLConstants.separator+line.getField(rowIdIdx[i]);
							}else{
								rowValues = this.getValues(line.getField(rowIdIdx[i]));
								if (this.ignoreEmptyRowId && rowValues.isEmpty()) {//多个值都为空，不记录本行
									rowidEnable = false;
									break;
								}
							}
						}
						if (!rowidEnable && ignoreEmptyRowId) {
							//logger.warn("rowid指定字段为空，不能作为合法记录:" + rowId.toString());
							continue;
						}
						for(String row:rowValues){
							//rowid分割
							uqId=rowId+ETLConstants.separator+row;
							//记录字段改为分割后的值
							if (this.splitColumnName.contains(".")){
								String[] cnames=StringUtils.split(splitColumnName,".");
								Map nestMap=(Map)map.get(cnames[0]);
								nestMap.put(cnames[1], row);
								map.put(cnames[0], nestMap);
							}else{
								map.put(splitColumnName, row);
							}
							if (this.isUpdate){
								Map oriMap=proxy.getDocument(uqId);
								oriMap.putAll(map);
								if (StringUtils.isNotEmpty(this.parent)) {
									proxy.insert(uqId, oriMap, this.parent,routingValue);
								} else {
									proxy.insert(uqId, oriMap, null,routingValue);
								}
							}else{
								if (StringUtils.isNotEmpty(this.parent)) {
									proxy.insert(uqId, map, this.parent,routingValue);
								} else {
									proxy.insert(uqId, map, null,routingValue);
								}
							}
						}
					}else{
						if (StringUtils.isNotEmpty(uqId)) {
							if (this.isUpdate){
								Map oriMap=proxy.getDocument(uqId);
								oriMap.putAll(map);
								if (StringUtils.isNotEmpty(this.parent)) {
									proxy.insert(uqId, oriMap, this.parent,routingValue);
								} else {
									proxy.insert(uqId, oriMap, null,routingValue);
								}
							}else{
								if (StringUtils.isNotEmpty(this.parent)) {
									proxy.insert(uqId, map, this.parent,routingValue);
								} else {
									proxy.insert(uqId, map, null,routingValue);
								}
							}
						} else {
							proxy.insert(null, map, null,routingValue);
						}
					}
				} else {
					proxy.insert(null, map, null,routingValue);
				}
				this.monitor.lineSuccess();
			} catch (Exception e) {
				this.getMonitor().lineFail(e.getMessage());
				e.printStackTrace();
			}
		}
		try {
			proxy.close();
		} catch (Exception e1) {
		}
		return PluginStatus.SUCCESS.value();
	}

	private List<String> getValues(String value) {
		String[] values = StringUtils.split(value, "-");
		List<String> vvList = new ArrayList<String>();
		for (String vv : values) {
			if (StringUtils.isNotEmpty(vv)) {
				vvList.add(vv);
			}
		}
		return vvList;
	}

	@SuppressWarnings({ "rawtypes", "unchecked" })
	private Map escapeMap(Map mapStr) {
		Iterator<Map.Entry> iter = mapStr.entrySet().iterator();
		while (iter.hasNext()) {
			Map.Entry entry = iter.next();
			if (entry.getValue() instanceof String) {
				entry.setValue(QueryParser.escape((String) entry.getValue()));
			} else {
				break;
			}
		}
		return mapStr;
	}

	@SuppressWarnings("rawtypes")
	private List escapeList(List arrayStr) {
		for (int i = 0; i < arrayStr.size(); i++) {
			Object v = arrayStr.get(i);
			if (v instanceof String) {
				arrayStr.remove(i);
				arrayStr.add(i, QueryParser.escape((String) v));
			} else {
				break;
			}
		}
		return arrayStr;
	}

	@Override
	public int init() {
		this.clustername = param.getValue(ParamKey.clustername);
		this.hosts = param.getValue(ParamKey.hosts);
		this.indexname = param.getValue(ParamKey.indexname);
		this.number_of_shards = param.getIntValue(ParamKey.number_of_shards, 5);
		this.number_of_replicas = param.getIntValue(ParamKey.number_of_replicas, 1);
		this.typename = param.getValue(ParamKey.typename);
		this.bulksize = param.getIntValue(ParamKey.bulksize, 500);
		this.mapping_xml = param.getValue(ParamKey.mapping_xml);
		this.uniquekey = param.getIntValue(ParamKey.uniquekey, -1);
		this.rowKeyRule = param.getValue(ParamKey.rowKeyRule, this.rowKeyRule);
		this.routing = param.getIntValue(ParamKey.routing, -1);
		try {
			this.shield_user = param.getValue(ParamKey.shield_user);
			this.shield_password = param.getValue(ParamKey.shield_password);
		} catch (Exception ex) {
		}
		this.isHotStableSplit=param.getIntValue(ParamKey.isHotStableSplit,0);
		this.delMode = param.getIntValue(ParamKey.delMode, 0);
		this.column_name = param.getValue(ParamKey.column_name);
		this.column_value_index = param.getValue(ParamKey.column_value_index);
		this.columnNames = this.column_name.split(",");
		try {
		this.isUpdate=param.getBoolValue(ParamKey.isUpdate);
		} catch (Exception ex) {
		}
		try {
			if ("false".equalsIgnoreCase(param.getValue(ParamKey.ignoreEmptyRowId))) {
				this.ignoreEmptyRowId = false;
			}
		} catch (Exception ex) {
		}
		// 分解参数规则
		if ("0".equalsIgnoreCase(rowKeyRule)) {// 直接使用指定字段作为rowId
			this.rowKeyRuleValue = 0;
		} else if (rowKeyRule.startsWith("1")) {// 使用求余数方式计算rowId
			this.rowKeyRuleValue = 1;
			String[] rules = rowKeyRule.split(",");
			fieldvalueLen = NumberUtils.toInt(rules[1]);
			remainder = NumberUtils.toInt(rules[2]);
			remainderLen = NumberUtils.toInt(rules[3]);
		} else if (rowKeyRule.startsWith("2")) {// 使用组合字段方式计算rowId
			this.rowKeyRuleValue = 2;
			String[] rules = rowKeyRule.split(",");
			int id = 0;
			String[] rids = rules[1].split("/");
			this.rowIdIdx = new int[rids.length];
			for (String idx : rids) {
				this.rowIdIdx[id] = NumberUtils.toInt(idx);
				id++;
			}
		} else if (rowKeyRule.startsWith("3")) {
			this.rowKeyRuleValue = 3;
			String[] rules = rowKeyRule.split(",");
			rowIdPattern = rules[1];
		} else if (rowKeyRule.startsWith("4")) {
			this.rowKeyRuleValue = 4;
		} else if (rowKeyRule.startsWith("5")) {// 使用组合字段首字段倒序方式计算rowId
			this.rowKeyRuleValue = 5;
			String[] rules = rowKeyRule.split(",");
			int id = 0;
			String[] rids = rules[1].split("/");
			this.rowIdIdx = new int[rids.length];
			for (String idx : rids) {
				this.rowIdIdx[id] = NumberUtils.toInt(idx);
				id++;
			}
		}else if (rowKeyRule.startsWith("6")) {// 使用组合字段首字段倒序方式计算rowId
			this.rowKeyRuleValue = 6;
			String[] rules = rowKeyRule.split(",");
			int id = 0;
			String[] rids = rules[1].split("/");
			this.rowIdIdx = new int[rids.length];
			for (String idx : rids) {
				this.rowIdIdx[id] = NumberUtils.toInt(idx);
				splitColumnName=columnNames[NumberUtils.toInt(idx)];
				id++;
			}
		}else if (rowKeyRule.startsWith("7")) {// 使用组合字段null方式计算rowId
			this.rowKeyRuleValue = 7;
			String[] rules = rowKeyRule.split(",");
			int id = 0;
			String[] rids = rules[1].split("/");
			this.rowIdIdx = new int[rids.length];
			for (String idx : rids) {
				this.rowIdIdx[id] = NumberUtils.toInt(idx);
				splitColumnName=columnNames[NumberUtils.toInt(idx)];
				id++;
			}
		}

		try {
			this.parent = param.getValue(ParamKey.parent, this.parent);
		} catch (Exception ex) {
		}
		if (this.mapping_xml != null) {
			FileInputStream is = null;
			try {
				File file = new File(mapping_xml);
				is = new FileInputStream(file);
				int size = (int) file.length();
				byte[] bytes = new byte[size];
				is.read(bytes);
				String content = new String(bytes, "UTF-8");
				this.mapping_xml = content;
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				if (is != null) {
					try {
						is.close();
					} catch (IOException e) {
						e.printStackTrace();
					}
				}
			}
		}
		formats = new String[columnNames.length];
		if (param.hasValue(ParamKey.column_value_index)) {
			String[] indexes = column_value_index.split(",");
			if (indexes.length != columnNames.length) {
				String msg = String.format("elasticsearch column index is different form column name: \nColumnName %s\nColumnIndex %s\n", param.getValue(ParamKey.column_name),
						param.getValue(ParamKey.column_value_index));
				logger.error(msg);
				throw new IllegalArgumentException(msg);
			}
			this.columnIndexes = new int[indexes.length];
			for (int i = 0; i < indexes.length; i++) {
				columnIndexes[i] = Integer.valueOf(indexes[i]);
				if (columnNames[i].contains("/")) {
					String[] tmps2 = columnNames[i].trim().split("/");
					columnNames[i] = tmps2[0].trim();
					formats[i] = tmps2[1].trim();
				} else {
					formats[i] = null;
				}
			}
		} else {// 默认从1到字段长度
			this.columnIndexes = new int[columnNames.length];
		}
		try {
			this.column_escape_index = param.getValue(ParamKey.column_escape_index);
			if (param.hasValue(ParamKey.column_escape_index)) {
				String[] indexes = column_escape_index.split(",");
				if (indexes.length != columnNames.length) {
					String msg = String.format("elasticsearch column escape index is different form column name: \nColumnName %s\nColumnIndex %s\n",
							param.getValue(ParamKey.column_name), param.getValue(ParamKey.column_escape_index));
					logger.error(msg);
					throw new IllegalArgumentException(msg);
				}
				this.columnEscapeIndexes = new int[indexes.length];
				for (int i = 0; i < indexes.length; i++) {
					columnEscapeIndexes[i] = Integer.valueOf(indexes[i]);
				}
			} else {// 默认从1到字段长度
				this.columnEscapeIndexes = new int[columnNames.length];
			}
		} catch (Exception ex) {
			this.columnEscapeIndexes = new int[columnNames.length];
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
			id++;
		}
//		Client client = TransportClient.builder().build()
//		        .addTransportAddress(new InetSocketTransportAddress(InetAddress.getByName("host1"), 9300))
//		        .addTransportAddress(new InetSocketTransportAddress(InetAddress.getByName("host2"), 9300));
		Settings settings = null;
		if (StringUtils.isNotEmpty(this.shield_user)){
			settings = Settings.settingsBuilder().put("cluster.name", this.clustername).put("shield.user", this.shield_user+":"+this.shield_password).put("client.transport.sniff", false).build();
			client =TransportClient.builder().addPlugin(ShieldPlugin.class).settings(settings).build().addTransportAddresses(transportAddress);
		}else{
			settings = Settings.settingsBuilder().put("cluster.name", this.clustername).put("client.transport.sniff", true).build();
			client =TransportClient.builder().settings(settings).build().addTransportAddresses(transportAddress);
		}
		if (indexname.indexOf("{currDate}") >= 0) {
			String format = param.getValue(ParamKey.format, "yyyy-MM-dd");
			String days = param.getValue(ParamKey.days, "-1");
			String isJob = param.getValue(ParamKey.isJob, "0");
			if ("1".equalsIgnoreCase(isJob)) {
				String currDate = ETLDateUtils.dateAddDays(ETLDateUtils.getCurrTimestamp(), NumberUtils.toInt(days, -1), format);
				indexname = ETLStringUtils.replace(indexname, "{currDate}", currDate);
			}
		}
		this.proxy = ElasticSearchProxy.newProxy(client, this.bulksize, this.indexname, this.typename);
		return PluginStatus.SUCCESS.value();
	}

}
