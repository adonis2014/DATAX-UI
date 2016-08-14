package com.taobao.datax.plugins.reader.mongodbreader;

import java.io.IOException;
import java.net.UnknownHostException;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.lang.math.NumberUtils;
import org.apache.log4j.Logger;
import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.type.TypeReference;

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

	ObjectMapper mapper=new ObjectMapper();
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
	private int parentColumnId=-1;//是否有json子行
	private String childColumnNames="";//，间隔
	private String[] childColumnNamesArray;
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
		this.parentColumnId=param.getIntValue(ParamKey.parentColumnId,this.parentColumnId);
		try{
			this.childColumnNames=param.getValue(ParamKey.childColumnNames);
			if (ETLStringUtils.isNotEmpty(childColumnNames)){
				childColumnNamesArray=childColumnNames.split(",");
			}
		}catch(Exception ex){}
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
			if (this.collectionName.indexOf("{currMonth}")>=0){
				this.collectionName=ETLStringUtils.replace(this.collectionName, "{currMonth}", 
						ETLDateUtils.formatDate(ETLDateUtils.getCurrTimestamp(), "yyyyMM"));
			}
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
	
	private Line cloneLine(LineSender sender,Line line,int parentColumnId){
		Line newLine=sender.createLine();
		for(int i=0;i<line.getFieldNum();i++){
			if (i!=parentColumnId){
				newLine.addField(line.getField(i));
			}
		}
		return newLine;
	}
	
	@Override
	public int startRead(LineSender sender) {
		try {
			proxy.prepare(this.columnNames.split(","));
			Line line = sender.createLine();
			while (proxy.fetchLine(line)) {
				if (this.parentColumnId>=0 && childColumnNamesArray!=null){//需要处理子集
					String parColumn=line.getField(this.parentColumnId);
					List<Map> parRows=mapper.readValue(parColumn,new TypeReference<List<Map>>(){});
					for(Map<String,String> row:parRows){
						Line childLine=cloneLine(sender,line,this.parentColumnId);
						for(String childColumn:childColumnNamesArray){
							Object obj=row.get(childColumn);
							if (obj==null){
								childLine.addField("");
							}else if(obj instanceof String){
								childLine.addField(obj.toString());
							}else if(obj instanceof LinkedHashMap){
								if (!((LinkedHashMap)obj).isEmpty()){
									Entry ev=(Entry)((LinkedHashMap)obj).entrySet().iterator().next();
									if ("$date".equalsIgnoreCase(ev.getKey().toString())){
										if (ev.getValue().toString().indexOf("T")>0 && ev.getValue().toString().indexOf("Z")>0){
											childLine.addField(ETLDateUtils.utc2Local(ev.getValue().toString().replace("T"," ").replace("Z","") , "yyyy-MM-dd hh:mm:ss", "yyyy-MM-dd hh:mm:ss"));
										}else{
											childLine.addField(ev.getValue().toString());
										}
									}else{
										childLine.addField(ev.getValue().toString());
									}
								}
							}else if(obj instanceof ArrayList){
								childLine.addField(StringUtils.join((List)obj,"-"));
							}else{
								childLine.addField(mapper.writeValueAsString(obj));
							}
						}
						sender.sendToWriter(childLine);
					}
				}else{
					sender.sendToWriter(line);
				}
				
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
