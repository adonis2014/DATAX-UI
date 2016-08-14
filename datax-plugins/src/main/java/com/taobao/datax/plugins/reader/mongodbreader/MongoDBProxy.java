package com.taobao.datax.plugins.reader.mongodbreader;

import java.io.IOException;
import java.util.Date;
import java.util.Map;

import org.apache.commons.lang.math.NumberUtils;

import com.mongodb.BasicDBObject;
import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.DBCursor;
import com.mongodb.DBObject;
import com.mongodb.QueryBuilder;
import com.mongodb.QueryOperators;
import com.taobao.datax.common.plugin.Line;
import com.taobao.datax.common.util.ETLDateUtils;
import com.taobao.datax.common.util.ETLStringUtils;
import com.taobao.datax.utils.ETLConstants;

/**
 * mongoDB数据访问
 * @author admin
 *
 */
public class MongoDBProxy {
	
	private String collectionName;
	
	private String startId=null;
	
	private String stopId=null;
	
	private DBCollection collection = null;
	private DB db=null;
	private DBCursor cursor;
	private String[] columnNames;
	private String fieldName;
	private String startDate;
	private String endDate;
	public MongoDBProxy(String collectionName,DB db){
		this.collectionName=collectionName;
		this.db=db;
		
	}
	
	public static MongoDBProxy newProxy(String collectionName,DB db) {
		return new MongoDBProxy(collectionName,db);
	}
	/**
	 * 根据条件获取游标
	 */
	public void prepare(String[] columnNames)  {
		collection = this.db.getCollection(collectionName);
		this.columnNames=columnNames;
		if (this.startId==null && this.stopId==null){
			if (ETLStringUtils.isNotEmpty(startDate) && ETLStringUtils.isNotEmpty(endDate)){
				long start=ETLDateUtils.parse(startDate, "yyyy-MM-dd");
				long end=ETLDateUtils.parse(endDate+" 23:59:59.999", ETLConstants.DATE_FORMAT_SSS);
				DBObject dbObj = QueryBuilder.start().put(fieldName).greaterThanEquals(new Date(start))
						.lessThan(new Date(end)).get();
				cursor=collection.find(dbObj);
			}else{
				cursor=collection.find();
			}
		}else{
			BasicDBObject dbObj=null;
			if (this.startId!=null && this.stopId!=null){
				dbObj=new BasicDBObject().append("_id",new BasicDBObject().append(QueryOperators.GTE,NumberUtils.toLong(this.startId)))
						.append(QueryOperators.LT,NumberUtils.toLong(this.stopId)); 
			}else if (this.startId!=null){
				dbObj=new BasicDBObject().append("_id",  
		                new BasicDBObject().append(QueryOperators.GTE, NumberUtils.toLong(startId.toString()))); 
			}else if (this.stopId!=null){
				dbObj=new BasicDBObject().append("_id",  
		                new BasicDBObject().append(QueryOperators.LT, NumberUtils.toLong(stopId))); 
			}
			cursor=collection.find( dbObj);
			cursor.addOption(com.mongodb.Bytes.QUERYOPTION_NOTIMEOUT);
		}
	}
	/**
	 *  读取数据设置到line
	 * @param line
	 * @return
	 */
	public boolean fetchLine(Line line)  {
		if (null == cursor) {
			return false;
		}
		if (!cursor.hasNext()){
			return false;
		}
		DBObject result = cursor.next();
		Map resuMap= result.toMap();
		for(String colName:this.columnNames){
			line.addField(getNullString(resuMap,colName));
		}
		return true;
	}
	
	private String getNullString(Map resuMap,String colName){
		if (colName.indexOf(".")>0){
			Object val=resuMap.get(colName.substring(0, colName.indexOf(".")));
			if (val instanceof DBObject){
				return getNullString(((DBObject)val).toMap(),colName.substring(colName.indexOf(".")+1));
			}else{
				return null;
			}
		}else{
			Object val=resuMap.get(colName);
			if (val==null){
				return "";
			}else{
				if (val instanceof java.util.Date){
					return ETLDateUtils.formatDate((Date)val, ETLConstants.DATE_FORMAT_SSS);
				}else{
					return val.toString();
				}
			}
		}
		
	}
	
	
	/**
	 * 关闭游标
	 * @throws IOException
	 */
	public void close() throws IOException {
		if (null != cursor) {
			cursor.close();
		}
	}
	
	public String getCollectionName() {
		return collectionName;
	}

	public void setCollectionName(String collectionName) {
		this.collectionName = collectionName;
	}

	public String getStartId() {
		return startId;
	}

	public String getFieldName() {
		return fieldName;
	}

	public void setFieldName(String fieldName) {
		this.fieldName = fieldName;
	}

	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}

	public void setStartId(String startId) {
		this.startId = startId;
	}

	public String getStopId() {
		return stopId;
	}

	public void setStopId(String stopId) {
		this.stopId = stopId;
	}

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}

}
