package com.taobao.datax.plugins.writer.agghbasewriter;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;

import net.iharding.utils.ETLConstants;

import org.apache.log4j.Logger;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.taobao.datax.common.exception.DataExchangeException;
import com.taobao.datax.common.model.AggregationRecord;
import com.taobao.datax.common.plugin.Line;
import com.taobao.datax.common.plugin.LineReceiver;
import com.taobao.datax.common.plugin.PluginParam;
import com.taobao.datax.common.plugin.PluginStatus;
import com.taobao.datax.common.plugin.Writer;
import com.taobao.datax.common.util.ETLDateUtils;
import com.taobao.datax.common.util.ETLStringUtils;
import com.taobao.datax.engine.plugin.DefaultLine;

public class AGGHBaseWriter  extends Writer{

	private static final int DEFAULT_BUFFER_SIZE = 16 * 1024 * 1024;

	private String tablename;

	private AGGHBaseProxy proxy;

	private int delMode;

	private String hbase_conf;

	private int bufferSize;
	
	private Logger logger = Logger.getLogger(AGGHBaseWriter.class);
	
	// _id指定的字段
	private int uniquekey = -1;

	ObjectMapper mapper = new ObjectMapper();

	@Override
	public List<PluginParam> split(PluginParam param) {
		AGGHBaseWriterSplitter spliter = new AGGHBaseWriterSplitter();
		spliter.setParam(param);
		spliter.init();
		return spliter.split();
	}

	@Override
	public int prepare(PluginParam param) {
		this.logger.info("DataX ESHBaseWriter do prepare work .");
		try {
			switch (this.delMode) {
			case 0:
				this.logger.info("ESHBaseWriter create old data .");
				break;
			case 1:
				truncateTable();
				break;
			case 2:
				deleteTables();
				break;
			default:
				String msg = "ESHBaseWriter delmode is not correct .";
				this.logger.error(msg);
				throw new IllegalArgumentException(msg);
			}
		} catch (Exception e) {
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
		delMode = param.getIntValue(ParamKey.delMode, 0);
		bufferSize = param.getIntValue(ParamKey.bufferSize, DEFAULT_BUFFER_SIZE);
		if (bufferSize < 0 || bufferSize >= 32 * 1024 * 1024) {
			throw new IllegalArgumentException("buffer size must be [0M-32M] .");
		}
		try {
			this.proxy = AGGHBaseProxy.newProxy(hbase_conf, tablename,this.bufferSize);
			try{
			String deleteRange=param.getValue(ParamKey.deleteRange);
			if (ETLStringUtils.isNotEmpty(deleteRange)){
				String[] ranges=ETLStringUtils.split(deleteRange, ";");
				for(String range:ranges){
					String[] rows=ETLStringUtils.split(range,"/");
					proxy.deleteTableRows(rows[0],rows[1]);
				}
			}
			}catch(IllegalArgumentException ex){
			}
			
//			this.proxy.setBufferSize(bufferSize);
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
			e.printStackTrace();
			throw new DataExchangeException(e.getCause());
		}
	}

	@Override
	public int connect() {
		return PluginStatus.SUCCESS.value();
	}
	
	private Line cloneLine(Line line){
		Line newline=new DefaultLine();
		for(int i=0;i< line.getFieldNum();i++){
			newline.addField(line.getField(i));
		}
		return newline;
	}

	@Override
	public int startWrite(LineReceiver receiver) {
		//prepareEs,connect to elasticSearch Server & hbase Server
		AGGDataProcessor dataProcessor=new AGGDataProcessor(proxy);
		dataProcessor.setParam(param);
		dataProcessor.init();
		List<Line> lines=new ArrayList<Line>();
		Line line=null;int fieldNum;
		while ((line = receiver.getFromReader()) != null) {
			try {
				fieldNum = line.getFieldNum();
				if (0 == fieldNum || 1 == fieldNum) {
					logger.warn("UDAWriter meets an empty line, ignore it .");
					continue;
				}
				if (dataProcessor.validate(line)){
					lines.add(cloneLine(line));
				}
				if (lines.size()>=this.bufferSize){
					//处理聚合记录
					long currtime=System.currentTimeMillis();
					Map<String,AggregationRecord> rows=dataProcessor.getLines(lines);
					logger.info("aggregate "+lines.size()+" lines  consuming:"+(System.currentTimeMillis()-currtime));
					currtime=System.currentTimeMillis();
					//保存更新聚合记录
					dataProcessor.saveOrUpdate(rows);
					logger.info("save "+rows.size()+" lines  consuming:"+(System.currentTimeMillis()-currtime));
					rows.clear();
					lines.clear();
				}
				this.monitor.lineSuccess();
			} catch (Exception e) {e.printStackTrace();
				this.getMonitor().lineFail(e.getMessage());
			}
		}
		if (lines.size()>0){
			long currtime=System.currentTimeMillis();
			Map<String,AggregationRecord> rows=dataProcessor.getLines(lines);
			logger.info("aggregate "+lines.size()+" lines  consuming:"+(System.currentTimeMillis()-currtime));
			currtime=System.currentTimeMillis();
			//保存更新聚合记录
			dataProcessor.saveOrUpdate(rows);
			logger.info("save "+rows.size()+" lines  consuming:"+(System.currentTimeMillis()-currtime));
			rows.clear();
			lines.clear();
		}
		return PluginStatus.SUCCESS.value();
	}

	public String getDateStr(String dateStr) {
		Date day = ETLDateUtils.parseDate(dateStr, "yyyy-MM-dd HH:mm:ss SSS");
		if (day == null) {
			return dateStr;
		}
		return ETLDateUtils.formatDate(day, ETLConstants.DATE_FORMAT_SSS);
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
		this.logger.info("ESHBaseWriter starts to commit records .");
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
