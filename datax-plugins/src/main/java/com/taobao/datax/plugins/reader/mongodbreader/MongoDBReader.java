package com.taobao.datax.plugins.reader.mongodbreader;

import java.io.IOException;
import java.net.UnknownHostException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.lang.math.NumberUtils;
import org.apache.log4j.Logger;

import com.mongodb.DB;
import com.mongodb.MongoClient;
import com.mongodb.MongoCredential;
import com.mongodb.ServerAddress;
import com.taobao.datax.common.exception.DataExchangeException;
import com.taobao.datax.common.exception.ExceptionTracker;
import com.taobao.datax.common.plugin.Line;
import com.taobao.datax.common.plugin.LineSender;
import com.taobao.datax.common.plugin.PluginParam;
import com.taobao.datax.common.plugin.PluginStatus;
import com.taobao.datax.common.plugin.Reader;
import com.taobao.datax.common.util.ETLDateUtils;
import com.taobao.datax.common.util.ETLStringUtils;
import com.taobao.datax.engine.plugin.LineExchanger;
import com.taobao.datax.engine.storage.RAMStorage;
/**
 * mongoDB 数据读取插件
 * @author admin
 *
 */
public class MongoDBReader extends Reader {

	private Logger logger = Logger.getLogger(this.getClass());

	private MongoClient mongo;
	private  String host="localhost";
	private int port=27017;
	private String dbname="monitor";
	private String username="";
	private String password="";
	private String collectionName="User";
	private DB db=null;
	private MongoDBProxy proxy=null;
	private String idRange="";
	private String dateRange="";
	private String columnNames="channel,regTime,name";//，间隔
	@Override
	public int init() {
		this.host=param.getValue(ParamKey.host, this.host);
		this.port=param.getIntValue(ParamKey.port, this.port);
		this.dbname=param.getValue(ParamKey.dbname, this.dbname);
		this.password=param.getValue(ParamKey.password, this.password);
		this.username = param.getValue(ParamKey.username, this.username);
		this.collectionName=param.getValue(ParamKey.collectionName, this.collectionName);
		this.idRange=param.getValue(ParamKey.idRange,this.idRange);
		this.columnNames=param.getValue(ParamKey.columnNames,this.columnNames);
		this.dateRange=param.getValue(ParamKey.dateRange,this.dateRange);
		return PluginStatus.SUCCESS.value();
	}

	@Override
	public int connect() {
		try {
			if (StringUtils.isNotEmpty(this.username)){
				ServerAddress server = new ServerAddress(this.host,this.port);
				List<MongoCredential> mcs=new ArrayList<MongoCredential>();
				mcs.add(MongoCredential.createPlainCredential(this.username,this.dbname,this.password.toCharArray()));
				this.mongo=new MongoClient(server,mcs);
			}else{
				this.mongo=new MongoClient(this.host,this.port);
			}
			this.db = mongo.getDB(this.dbname);
			this.proxy=MongoDBProxy.newProxy(this.collectionName,db);
			if (StringUtils.isNotEmpty(this.idRange)){
				String[] ids=StringUtils.split(this.idRange,",");
				proxy.setStartId(ids[0]);
				proxy.setStopId(ids[1]);
			}
			if (StringUtils.isNotEmpty(this.dateRange)){
				String[] drs=ETLStringUtils.split(this.dateRange,"/");
				if (drs.length>0) proxy.setFieldName(drs[0]);
				if (drs.length>2) {
					if (drs[1].indexOf("{currDate}")>=0){
						proxy.setStartDate(ETLDateUtils.dateAddDays(ETLDateUtils.getCurrTimestamp(), NumberUtils.toInt(drs[2], -1), "yyyy-MM-dd"));
						proxy.setEndDate(ETLDateUtils.dateAddDays(ETLDateUtils.getCurrTimestamp(), -1, "yyyy-MM-dd"));
					}else{
						proxy.setStartDate(drs[1]);
						proxy.setEndDate(drs[2]);
					}
				}
			}
		} catch (UnknownHostException e) {
			e.printStackTrace();
		}
		return PluginStatus.SUCCESS.value();
	}

	@Override
	public int startRead(LineSender sender) {
		try {
			proxy.prepare(this.columnNames.split(","));
			Line line = sender.createLine();
			while (proxy.fetchLine(line)) {
				sender.sendToWriter(line);
				monitor.lineSuccess();
				line = sender.createLine();
			}
			sender.flush();
		} catch (Exception e) {
			logger.error(ExceptionTracker.trace(e));
			throw new DataExchangeException(e.getCause());
		} finally {
			try {
				proxy.close();
			} catch (IOException e) {
			}
		}
		return PluginStatus.SUCCESS.value();
	}

	@Override
	public int finish() {
		try {
			if (this.mongo != null) {
				mongo.close();
			}
			proxy=null;
			mongo=null;
			db = null;
		} catch (Exception e) {
		}
		return PluginStatus.SUCCESS.value();
	}
	
	@Override
	public List<PluginParam> split(PluginParam param){
		MongoDBReaderSplitter spliter=new MongoDBReaderSplitter(param);
		spliter.init();
		return spliter.split();
	}

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		MongoDBReader reader=new MongoDBReader();
//		reader.init();
		reader.connect();
		RAMStorage storge=new RAMStorage();
		storge.init("testMongoDB", 1000, 1000, 1000);
		LineSender sender=new LineExchanger(storge);
		reader.startRead(sender);
		reader.finish();
	}

}
