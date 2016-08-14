package com.taobao.datax.plugins.reader.hbasereader;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.lang.math.NumberUtils;
import org.apache.log4j.Logger;

import com.taobao.datax.common.exception.DataExchangeException;
import com.taobao.datax.common.exception.ExceptionTracker;
import com.taobao.datax.common.plugin.Line;
import com.taobao.datax.common.plugin.LineProcessReader;
import com.taobao.datax.common.plugin.LineSender;
import com.taobao.datax.common.plugin.PluginParam;
import com.taobao.datax.common.plugin.PluginStatus;
import com.taobao.datax.common.plugin.Reader;
import com.taobao.datax.common.util.ETLDateUtils;
import com.taobao.datax.common.util.ETLStringUtils;
/**
 * 读取hbase插件，支持分拆合并保存的对象数据
 * @author admin
 *
 */
public class EnNiuHbaseReader extends Reader {

	private Logger logger = Logger.getLogger(this.getClass());

	private String tableName = null;

	private String columns = null;

	private String hbaseConf = null;

	private String rowkeyRange = null;
	
	private String timeRange=null;
	
	private boolean readAllField=false;

	private EnNiuHBaseProxy proxy = null;

	private String isSaveOneObj = "false";
	
	private String oneObjColName = "data";
	
	private String oneObjColumnNames = "";
	
	private List<String> ooColumnNames = null;
	
	private String oneObjName="EN_User";
	
	private String oneObjFamilyName="cf";

	private int maxversion=0;
	
	private String[] column_version=null;
	
	private String dateRange="";
	private  String columnProcRule ="";
	private int partColumnIdx=0;
	private int bakPartColumnIdx=1;
	private int partRuleId=0;
	private String partFormat="";
	
	private String userLineProcessClass="";
	private LineProcessReader lineProcess=null;
	
	@Override
	public List<PluginParam> split(PluginParam param) {
		EnNiuHBaseReaderSplitter splitter = new EnNiuHBaseReaderSplitter();
		splitter.setParam(param);
		splitter.init();
		return splitter.split();
	}

	@Override
	public int init() {
		this.tableName = this.param.getValue(ParamKey.htable);
		this.hbaseConf = this.param.getValue(ParamKey.hbase_conf);
		try{
		this.columns = this.param.getValue(ParamKey.columns_key);
		this.isSaveOneObj =  param.getValue(ParamKey.isSaveOneObj, this.isSaveOneObj);
		this.oneObjColName = param.getValue(ParamKey.oneObjColName, this.oneObjColName);
		this.oneObjColumnNames = param.getValue(ParamKey.oneObjColumnNames, this.oneObjColumnNames);
		this.ooColumnNames=Arrays.asList(oneObjColumnNames.split(","));
		this.oneObjName=param.getValue(ParamKey.oneObjName,this.oneObjName);
		this.oneObjFamilyName=param.getValue(ParamKey.oneObjFamilyName,this.oneObjFamilyName);
		}catch(Exception ex){}
		try{
			readAllField=param.getBoolValue(ParamKey.readAllField);
		}catch(Exception ex){}
		try{
			this.maxversion=param.getIntValue(ParamKey.maxVersion,0);
		}catch(Exception ex){}
		try{
			this.columnProcRule=param.getValue(ParamKey.columnProcRule);
			if (StringUtils.isNotEmpty(columnProcRule)){
				String[] pps=StringUtils.split(columnProcRule, ":");
				if (pps.length>3){
					this.partColumnIdx=NumberUtils.toInt(pps[0],0);
					this.bakPartColumnIdx=NumberUtils.toInt(pps[1],0);
					this.partRuleId=NumberUtils.toInt(pps[2],0);
					this.partFormat=pps[3];
				}
			}
		}catch(Exception ex){}
		try{
			userLineProcessClass=param.getValue(ParamKey.userLineProcess);
			if (StringUtils.isNotEmpty(userLineProcessClass)){
				lineProcess=(LineProcessReader)Class.forName(userLineProcessClass).newInstance();
				lineProcess.init(param);
			}
		}catch(Exception ex){
			if (lineProcess!=null){
				lineProcess.finish();
			}
		}
		String column_value_version=param.getValue(ParamKey.column_value_version, "");
		column_version=StringUtils.split(column_value_version, ",");
		try{
			this.dateRange=param.getValue(ParamKey.dateRange,this.dateRange);
		}catch(Exception ex){}
		try {
			proxy = EnNiuHBaseProxy.newProxy(hbaseConf, tableName,isSaveOneObj,oneObjFamilyName,oneObjColName,ooColumnNames,oneObjName);
			proxy.setMaxversion(this.maxversion);
			proxy.setColumn_version(column_version);
			proxy.setBakPartColumnIdx(bakPartColumnIdx);
			proxy.setPartColumnIdx(partColumnIdx);
			proxy.setPartFormat(partFormat);
			proxy.setPartRuleId(partRuleId);
			proxy.setColumnProcRule(columnProcRule);
		} catch (IOException e) {
			try {
				if (null != proxy) {
					proxy.close();
				}
			} catch (IOException e1) {
			}
			logger.error(ExceptionTracker.trace(e));
			throw new DataExchangeException(e.getCause());
		}
		if (StringUtils.isNotEmpty(this.dateRange)){
			String[] drs=ETLStringUtils.split(this.dateRange,"/");
			if (drs.length>0) proxy.setFamilyName(drs[0]);
			if (drs.length>1) proxy.setFieldName(drs[1]);
			if (drs.length>3) {
				if (drs[2].indexOf("{currDate}")>=0){
					proxy.setStartDate(ETLDateUtils.dateAddDays(ETLDateUtils.getCurrTimestamp(), NumberUtils.toInt(drs[3], -1), "yyyy-MM-dd"));
				}else{
					proxy.setStartDate(drs[2]);
					proxy.setEndDate(drs[3]);
				}
			}
		}
		return PluginStatus.SUCCESS.value();
	}

	@Override
	public int connect() {
		this.logger.info("HBaseReader start to connect to HBase .");
		this.rowkeyRange = this.param.getValue(ParamKey.rowkey_range, "");
		try{
			this.timeRange=this.param.getValue(ParamKey.timestamp_range,"");
			
		}catch(Exception ex){}
		if (StringUtils.isNotBlank(timeRange)) {
			String[] pair = timeRange.split(",");
			if (null != pair &&  pair.length>0) {
				String minStamp = StringUtils.isBlank(pair[0].trim()) ? null: pair[0].trim();
				String maxStamp = StringUtils.isBlank(pair[1].trim()) ? null: pair[1].trim();
				if (NumberUtils.isNumber(minStamp)&&NumberUtils.isNumber(maxStamp)){
					proxy.setMinStamp(NumberUtils.toLong(minStamp));
					proxy.setMaxStamp(NumberUtils.toLong(maxStamp));
				}
			}
		}
		if (StringUtils.isBlank(rowkeyRange)) {
			this.logger.info("HBaseReader prepare to query all records . ");
			proxy.setStartEndRange(null, null);
		} else {
			rowkeyRange = " " + rowkeyRange + " ";
			String[] pair = rowkeyRange.split(",");
			if (null == pair || 0 == pair.length) {
				this.logger.info("HBaseReader prepare to query all records . ");
				proxy.setStartEndRange(null, null);
			} else {
				String start = StringUtils.isBlank(pair[0].trim()) ? null
						: pair[0].trim();
				String end = StringUtils.isBlank(pair[1].trim()) ? null
						: pair[1].trim();
				this.logger.info(String.format(
						"HBaseReader prepare to query records [%s, %s) .",
						(start == null ? "-infinite" : start), (end == null ? "+infinite"
								: end)));
				proxy.setStartEndRange((start == null ? null : start.getBytes()),
						(end == null ? null : end.getBytes()));
			}
		}
		return PluginStatus.SUCCESS.value();
	}

	@Override
	public int startRead(LineSender sender) {
		try {
			proxy.prepare(columns.split(","));
			if (this.readAllField){
				List<Line> lines=new ArrayList<Line>();
				while (proxy.fetchReadAllFieldLine(lines,sender)) {
					for(Line line:lines){
						if (lineProcess!=null){
							if (!lineProcess.execute(line)){//处理数据，如果不通过，跳过send
								logger.info("删除多余的用户数据ID:"+line.getField(line.getFieldNum()-1));
								monitor.lineSuccess();
								line = sender.createLine();
								continue;
							}
						}
						if (line.getFieldNum()>1){
							sender.sendToWriter(line);
						}
						monitor.lineSuccess();
					}
					lines.clear();
				}
				if (lines.size()>0){//resu读取完毕，还有数据需要处理
					for(Line line:lines){
						if (lineProcess!=null){
							if (!lineProcess.execute(line)){//处理数据，如果不通过，跳过send
								logger.info("删除多余的用户数据ID:"+line.getField(line.getFieldNum()-1));
								monitor.lineSuccess();
								line = sender.createLine();
								continue;
							}
						}
						if (line.getFieldNum()>1){
							sender.sendToWriter(line);
						}
						monitor.lineSuccess();
					}
					lines.clear();
				}
			}else{
				Line line = sender.createLine();
				while (proxy.fetchLine(line)) {
					if (lineProcess!=null){
						if (!lineProcess.execute(line)){//处理数据，如果不通过，跳过send
							logger.info("删除多余的用户数据ID:"+line.getField(line.getFieldNum()-1));
							monitor.lineSuccess();
							line = sender.createLine();
							continue;
						}
					}
					if (line.getFieldNum()>1){
						sender.sendToWriter(line);
					}
					monitor.lineSuccess();
					line = sender.createLine();
				}
			}
			
			sender.flush();
		} catch (IOException e) {
			logger.error(ExceptionTracker.trace(e));
			throw new DataExchangeException(e.getCause());
		} finally {
			
		}

		return PluginStatus.SUCCESS.value();
	}

	@Override
	public int finish() {
		try {
			proxy.flush();
			proxy.close();
			if (lineProcess!=null){
				lineProcess.finish();
			}
		} catch (IOException e) {
		}
		return PluginStatus.SUCCESS.value();
	}
}
