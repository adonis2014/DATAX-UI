package com.taobao.datax.plugins.writer.hbasewriter;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.lang.math.NumberUtils;
import org.apache.log4j.Logger;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.taobao.datax.common.exception.DataExchangeException;
import com.taobao.datax.common.plugin.Line;
import com.taobao.datax.common.plugin.LineReceiver;
import com.taobao.datax.common.plugin.PluginParam;
import com.taobao.datax.common.plugin.PluginStatus;
import com.taobao.datax.common.plugin.Writer;
import com.taobao.datax.common.util.ETLConstants;
import com.taobao.datax.common.util.ETLDateUtils;
import com.taobao.datax.common.util.ETLStringUtils;

public class EnNiuHBaseWriter extends Writer {

	private static final int DEFAULT_BUFFER_SIZE = 16 * 1024 * 1024;

	private String tablename;

	private String encode = "utf-8";

	private EnNiuHBaseProxy proxy;
	ObjectMapper mapper = new ObjectMapper();
	private int delMode;

	private boolean autoflush;

	private String hbase_conf;

	private String[] columnNames;

	private int bufferSize;

	private String[] families = null;

	private String[] qualifiers = null;

	private int[] columnIndexes;

	private int rowkeyIndex;

	private String rowKeyRule = "0";

	private String isSaveOneObj = "false";

	private String oneObjColName = "data";

	private String oneObjColumnNames = "";

	private List<String> ooColumnNames = null;

	private String oneObjName = "EN_User";
	// rowid设置方式
	private int rowKeyRuleValue = 0;
	// 求余数方式计算rowId的参数
	private Integer fieldvalueLen = 15;
	private Integer remainder = 200;
	private Integer remainderLen = 3;
	private String rowIdPattern="yyyy-MM-dd";
	// 多个字段组合方式
	private int[] rowIdIdx;// 字段index值，数字集合
	private Logger logger = Logger.getLogger(EnNiuHBaseWriter.class);

	private String oneObjFamilyName = "cf";

	@Override
	public List<PluginParam> split(PluginParam param) {
		EnNiuHBaseWriterSplitter spliter = new EnNiuHBaseWriterSplitter();
		spliter.setParam(param);
		spliter.init();
		return spliter.split();
	}

	@Override
	public int prepare(PluginParam param) {
		this.logger.info("DataX HBaseWriter do prepare work .");

		try {
			switch (this.delMode) {
			case 0:
				this.logger.info("HBaseWriter reserves old data .");
				break;
			case 1:
				truncateTable();
				break;
			case 2:
				deleteTables();
				break;
			default:
				String msg = "HBaseWriter delmode is not correct .";
				this.logger.error(msg);
				throw new IllegalArgumentException(msg);
			}
		} catch (IOException e) {
			try {
				proxy.close();
			} catch (IOException e1) {
			}
		}

		return this.finish();
	}

	@Override
	public int post(PluginParam param) {
		return PluginStatus.SUCCESS.value();
	}

	@Override
	public int init() {
		tablename = param.getValue(ParamKey.htable);
		hbase_conf = param.getValue(ParamKey.hbase_conf);
		encode = param.getValue(ParamKey.encoding, "UTF-8");
		delMode = param.getIntValue(ParamKey.delMode, 0);
		autoflush = param.getBoolValue(ParamKey.autoFlush, false);
		bufferSize = param.getIntValue(ParamKey.bufferSize, DEFAULT_BUFFER_SIZE);
		isSaveOneObj = param.getValue(ParamKey.isSaveOneObj, this.isSaveOneObj);
		oneObjColName = param.getValue(ParamKey.oneObjColName, this.oneObjColName);
		oneObjColumnNames = param.getValue(ParamKey.oneObjColumnNames, this.oneObjColumnNames);
		ooColumnNames = Arrays.asList(oneObjColumnNames.split(","));
		rowKeyRule = param.getValue(ParamKey.rowKeyRule, this.rowKeyRule);
		oneObjName = param.getValue(ParamKey.oneObjName, this.oneObjName);
		oneObjFamilyName = param.getValue(ParamKey.oneObjFamilyName, this.oneObjFamilyName);
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
			String[] rids=rules[1].split("/");
			this.rowIdIdx=new int[rids.length];
			for (String idx : rids) {
				this.rowIdIdx[id] = NumberUtils.toInt(idx);
				id++;
			}
		} else if (rowKeyRule.startsWith("3")) {
			this.rowKeyRuleValue = 3;
			String[] rules = rowKeyRule.split(",");
			rowIdPattern=rules[1];
		}else if (rowKeyRule.startsWith("4")) {
			this.rowKeyRuleValue = 4;
		}else if (rowKeyRule.startsWith("5")) {// 使用组合字段首字段倒序方式计算rowId
			this.rowKeyRuleValue = 5;
			String[] rules = rowKeyRule.split(",");
			int id = 0;
			String[] rids=rules[1].split("/");
			this.rowIdIdx=new int[rids.length];
			for (String idx : rids) {
				this.rowIdIdx[id] = NumberUtils.toInt(idx);
				id++;
			}
		}
		/* if user does not set rowkey index, use 0 for default. */
		rowkeyIndex = param.getIntValue(ParamKey.rowkey_index, 0, 0, Integer.MAX_VALUE);

		if (bufferSize < 0 || bufferSize >= 32 * 1024 * 1024) {
			throw new IllegalArgumentException("buffer size must be [0M-32M] .");
		}
		// 获取要写入hbase的字段，使用cf:fieldName方式写，","间隔
		columnNames = param.getValue(ParamKey.column_name).split(",");
		families = new String[columnNames.length];
		qualifiers = new String[columnNames.length];
		for (int i = 0; i < columnNames.length; i++) {
			if (!columnNames[i].contains(":")) {
				throw new IllegalArgumentException(String.format("Column %s must be like 'family:qualifier'", columnNames[i]));
			}
			String[] tmps = columnNames[i].split(":");
			families[i] = tmps[0].trim();
			qualifiers[i] = tmps[1].trim();
		}
		/*
		 * test if user has set column_value_index(读取的字段集合，按照数字集合，从0开始，使用","间隔)
		 * . if set, use the value set by user if not set, use the default
		 * value, [1, length of column_name]
		 */
		if (param.hasValue(ParamKey.column_value_index)) {
			String[] indexes = param.getValue(ParamKey.column_value_index).split(",");
			if (!"true".equalsIgnoreCase(oneObjColName)) {// 是否统一保存为一个字段
				if (indexes.length != columnNames.length) {
					String msg = String.format("HBase column index is different form column name: \nColumnName %s\nColumnIndex %s\n", param.getValue(ParamKey.column_name),
							param.getValue(ParamKey.column_value_index));
					logger.error(msg);
					throw new IllegalArgumentException(msg);
				}
			}
			columnIndexes = new int[indexes.length];
			for (int i = 0; i < indexes.length; i++) {
				columnIndexes[i] = Integer.valueOf(indexes[i]);
			}
		} else {// 默认从1到字段长度
			columnIndexes = new int[columnNames.length];
			for (int i = 0; i < rowkeyIndex; i++) {
				columnIndexes[i] = i;
			}
			for (int i = rowkeyIndex; i < columnIndexes.length; i++) {
				columnIndexes[i] = i + 1;
			}
		}
		try {
			this.proxy = EnNiuHBaseProxy.newProxy(hbase_conf, tablename);
			this.proxy.setAutoFlush(autoflush);
			this.proxy.setBufferSize(bufferSize);
			if (null == this.proxy || !this.proxy.check()) {
				throw new DataExchangeException("HBase Client initilize failed .");
			}

			return PluginStatus.SUCCESS.value();
		} catch (IOException e) {
			if (null != proxy) {
				try {
					proxy.close();
				} catch (IOException e1) {
				}
			}
			throw new DataExchangeException(e.getCause());
		}
	}

	@Override
	public int connect() {
		return PluginStatus.SUCCESS.value();
	}

	@Override
	public int startWrite(LineReceiver receiver) {
		Line line;
		int fieldNum;

		/*
		 * NOTE: field numbers in each line may be different
		 */
		while ((line = receiver.getFromReader()) != null) {
			try {
				fieldNum = line.getFieldNum();

				if (null == line.checkAndGetField(rowkeyIndex)||StringUtils.isEmpty(line.getField(rowkeyIndex))) {
					throw new IOException("rowkey is missing .");
				}

				if (0 == fieldNum || 1 == fieldNum) {
					logger.warn("HBaseWriter meets an empty line, ignore it .");
					continue;
				}
				// rowKey计算方式，可以自己定义增加多种方式
				switch (rowKeyRuleValue) {
				case 0:// 直接使用指定字段作为rowId
				{
					proxy.prepare(line.getField(rowkeyIndex).getBytes(encode));
					break;
				}
				case 1:// 使用求余数方式计算rowId
				{
					String rowId = line.getField(rowkeyIndex);
					if (!NumberUtils.isDigits(rowId)) {
						logger.warn("rowid指定字段不是数字，不能求余数:" + rowId);
						continue;
					}
					proxy.prepare(ETLStringUtils.getRemainderRowId(Long.valueOf(rowId), fieldvalueLen, remainder, remainderLen).getBytes(encode));
					break;
				}
				case 2:// 使用组合字段方式计算rowId
				{
					List<String> fieldValues = new ArrayList<String>();
					boolean rowidEnable=true;
					for (int rowIdx : this.rowIdIdx) {
						if (StringUtils.isEmpty(line.getField(rowIdx))|| "[]".equalsIgnoreCase(line.getField(rowIdx))){
							rowidEnable=false;
							break;
						}else{
							if (ETLStringUtils.getJSONType(line.getField(rowIdx))==ETLStringUtils.JSON_TYPE.JSON_TYPE_ARRAY){
								List<String> arrs=mapper.readValue(line.getField(rowIdx), List.class);
								fieldValues.addAll(arrs);
							}else{
								fieldValues.add(line.getField(rowIdx));
							}
						}
					}
					if (!rowidEnable)continue;
					proxy.prepare(ETLStringUtils.getHbaseRowId(fieldValues).getBytes(encode));
					break;
				}
				case 3://日期+自增长方式
				{
					String rowId = line.getField(rowkeyIndex);
					proxy.prepare(ETLStringUtils.getDateIncrementRowId(this.tablename,rowId,rowIdPattern).getBytes(encode));
					break;
				}
				case 4://指定字段倒序方式
				{
					String rowId = line.getField(rowkeyIndex);
					proxy.prepare(ETLStringUtils.reverse(rowId).getBytes(encode));
					break;
				}case 5://首字段倒序，组合字段
				{
					StringBuffer rowId = new StringBuffer();
					for (int i=0;i<this.rowIdIdx.length;i++) {
						if (i==0){
							rowId.append(StringUtils.reverse(line.getField(rowIdIdx[0])));
						}else{
							rowId.append(ETLConstants.separator);
							rowId.append(line.getField(rowIdIdx[i]));
						}
					}
					proxy.prepare(rowId.toString().getBytes(encode));
					break;
				}
				}
				Map<String, String> map = new HashMap<String, String>();
				String logDate="";
				for (int i = 0; i < columnIndexes.length; i++) {
					if (null == line.checkAndGetField(columnIndexes[i])) {
						continue;
					}
					if ("true".equalsIgnoreCase(this.isSaveOneObj)) {// 包含多个字段保存到Map
						if (ooColumnNames.contains(qualifiers[i])) {
							map.put(qualifiers[i], line.getField(columnIndexes[i]));
						} else {
							if (StringUtils.isNotEmpty(line.getField(columnIndexes[i]))) {
								proxy.add(families[i].getBytes(encode), qualifiers[i].getBytes(encode), line.getField(columnIndexes[i]).getBytes(encode));
								if (ETLConstants.HTABLE_USER.equals(this.oneObjName) 
										&& StringUtils.isNotEmpty(line.getField(columnIndexes[i]))) {// 用户表
									try{
										if (qualifiers[i].equalsIgnoreCase("lastTime")){
											map.put(qualifiers[i],ETLDateUtils.formatDate(ETLDateUtils.parseDate(line.getField(columnIndexes[i]), ETLConstants.DATEFORMAT_YYYYMMDDHHMMSS),ETLConstants.DATE_ONLY_FORMAT));
										}else if (qualifiers[i].equalsIgnoreCase("regTime")){
											map.put(qualifiers[i],ETLDateUtils.formatDate(ETLDateUtils.parseDate(line.getField(columnIndexes[i]), ETLConstants.DATE_FORMAT),ETLConstants.DATE_ONLY_FORMAT));
										}
									}catch(Exception ex){
										logger.debug("rowid:"+line.getField(rowkeyIndex)+"   "+qualifiers[i]+" : "+line.getField(columnIndexes[i]));
										System.out.println("rowid:"+line.getField(rowkeyIndex)+"   "+qualifiers[i]+" : "+line.getField(columnIndexes[i]));
										ex.printStackTrace();
									}
								}
							}
						}
					} else {
						if (StringUtils.isNotEmpty(line.getField(columnIndexes[i]))) {
							if (ETLConstants.HTABLE_RPB_ACTIVEUSER_LOG.equals(this.tablename)) {
								if (qualifiers[i].equalsIgnoreCase("logtime")){
									proxy.add(families[i].getBytes(encode), qualifiers[i].getBytes(encode), getDateStr(line.getField(columnIndexes[i])).getBytes(encode));
								}else{
									proxy.add(families[i].getBytes(encode), qualifiers[i].getBytes(encode), line.getField(columnIndexes[i]).getBytes(encode));
								}
							}else{
								proxy.add(families[i].getBytes(encode), qualifiers[i].getBytes(encode), line.getField(columnIndexes[i]).getBytes(encode));
							}
							if (ETLConstants.HTABLE_NGINX_MONTH_LOG.equals(this.tablename)) {
								if (qualifiers[i].equalsIgnoreCase("month")){
									logDate=line.getField(columnIndexes[i]).substring(0,4)+"-"+line.getField(columnIndexes[i]).substring(4)+"-"+logDate;
								}else if (qualifiers[i].equalsIgnoreCase("day")){
									String ld=ETLStringUtils.getMaxListStringFromList(ETLStringUtils.getListStringFromStr(line.getField(columnIndexes[i])));
									if (ld==null)ld="01";
									logDate=logDate+ld;
								}
							} 
						}
					}
				}
				if ("true".equalsIgnoreCase(this.isSaveOneObj)) {// 包含多个字段保存到,转换Map为对象
//					if (ETLConstants.HTABLE_USER.equals(this.oneObjName)) {// 用户表
//						BasicUser user = new BasicUser(map);
//						// 计算留存天数
//						if (user.getRegTime()!=null && map.get("lastTime")!=null){
//						proxy.add(oneObjFamilyName.getBytes(encode), "days".getBytes(encode),
//								(daysBetween(map.get("regTime"), map.get("lastTime")) + "").getBytes(encode));
//						}
//						proxy.add(oneObjFamilyName.getBytes(encode), oneObjColName.getBytes(encode), user.toBytes());
//					}
				}
				if (ETLConstants.HTABLE_NGINX_MONTH_LOG.equals(this.tablename)) {
					proxy.add("cf".getBytes(encode), "logDate".getBytes(encode),logDate.getBytes(encode));
				}
				proxy.insert();
				this.monitor.lineSuccess();
			} catch (IOException e) {
				this.getMonitor().lineFail(e.getMessage());
			}
		}
		return PluginStatus.SUCCESS.value();
	}

	public  String getDateStr(String dateStr) {
		Date day=ETLDateUtils.parseDate(dateStr, "yyyy-MM-dd HH:mm:ss SSS");
		if (day==null){
			return dateStr;
		}
		return ETLDateUtils.formatDate(day,ETLConstants.DATE_FORMAT_SSS);
	}
	
	public static int daysBetween(String smdate, String bdate) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Calendar cal = Calendar.getInstance();
		try {
			cal.setTime(sdf.parse(smdate));
		} catch (ParseException e) {
			e.printStackTrace();
		}
		long time1 = cal.getTimeInMillis();
		try {
			cal.setTime(sdf.parse(bdate));
		} catch (ParseException e) {
			e.printStackTrace();
		}
		long time2 = cal.getTimeInMillis();
		long between_days = (time2 - time1) / (1000 * 3600 * 24);

		return Integer.parseInt(String.valueOf(between_days));
	}

	@Override
	public int commit() {
		this.logger.info("HBaseWriter starts to commit records .");
		try {
			proxy.flush();
			return PluginStatus.SUCCESS.value();
		} catch (IOException e) {
			try {
				proxy.close();
			} catch (IOException e1) {
			}
			throw new DataExchangeException(e.getCause());
		}
	}

	@Override
	public int finish() {
		try {
			proxy.close();
			return PluginStatus.SUCCESS.value();
		} catch (IOException e) {
			throw new DataExchangeException(e.getCause());
		}
	}

	private void deleteTables() throws IOException {
		this.logger.info(String.format("HBasWriter begins to delete table %s .", this.tablename));
		proxy.deleteTable();
	}

	private void truncateTable() throws IOException {
		this.logger.info(String.format("HBasWriter begins to truncate table %s .", this.tablename));
		proxy.truncateTable();
	}

}
