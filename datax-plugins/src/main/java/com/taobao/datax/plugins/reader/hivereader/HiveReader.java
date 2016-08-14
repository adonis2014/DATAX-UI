

package com.taobao.datax.plugins.reader.hivereader;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;

import com.taobao.datax.common.exception.DataExchangeException;
import com.taobao.datax.common.exception.ExceptionTracker;
import com.taobao.datax.common.plugin.LineSender;
import com.taobao.datax.common.plugin.MetaData;
import com.taobao.datax.common.plugin.PluginParam;
import com.taobao.datax.common.plugin.PluginStatus;
import com.taobao.datax.common.plugin.Reader;
import com.taobao.datax.common.util.ETLDateUtils;
import com.taobao.datax.common.util.ETLStringUtils;
import com.taobao.datax.common.util.SqlTemplateUtil;
import com.taobao.datax.plugins.common.DBResultSetSender;
import com.taobao.datax.plugins.common.DBUtils;
import com.taobao.datax.utils.ETLConstants;


public class HiveReader extends Reader {
	private Connection conn;

	/* below for job-xml variant */
	private String encode = null;

	private String username = "";

	private String password = "";

	private String ip = "";

	private String port = "10000";

	private String dbname = null;

	private int concurrency = -1;

	private int fetchSize=4096;
	
	private String isVelocity;
	
	private String sql = null;
	
	private int days=-1;

	private static final Set<String> supportEncode = new HashSet<String>() {
		{
			add("utf-8");
			add("gbk");
		}
	};

	private Logger logger = Logger.getLogger(HiveReader.class);

	@Override
	public int init() {
		/* for database connection */
		this.username = param.getValue(ParamKey.username, this.username);
		this.password = param.getValue(ParamKey.password, this.password);
		this.ip = param.getValue(ParamKey.ip);
		this.port = param.getValue(ParamKey.port, this.port);
		this.dbname = param.getValue(ParamKey.dbname);
		this.encode = param.getValue(ParamKey.encoding, "");
		this.isVelocity=param.getValue(ParamKey.isVelocity,"false");
		try{
		this.days=param.getIntValue(ParamKey.days,-1);
		}catch(Exception ex){}
		/* set nullChar to replace null in query-null-value */
		this.sql = param.getValue(ParamKey.sql, "").trim();
		if (ETLStringUtils.isNotBlank(this.sql) && "true".equalsIgnoreCase(this.isVelocity)){
			this.sql=SqlTemplateUtil.getTemplateSql(this.sql);
		}
		this.fetchSize= param.getIntValue(ParamKey.fetchSize,4096);
		/* for connection session */
		this.concurrency = param.getIntValue(ParamKey.concurrency, 1);

		return PluginStatus.SUCCESS.value();
	}

	@Override
	public int prepare(PluginParam param) {
		this.init();
		return PluginStatus.SUCCESS.value();
	}

	@Override
	public int connect() {
		conn=this.getConnection();
		return PluginStatus.SUCCESS.value();
	}
	
	private Connection getConnection(){
		try {
			Class.forName("org.apache.hive.jdbc.HiveDriver");
			conn = DriverManager.getConnection("jdbc:hive2://"+this.ip+":"+this.port+"/"+this.dbname, this.username,this.password);
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		return conn;
	}

	@Override
	public int startRead(LineSender lineSender){
		DBResultSetSender proxy = DBResultSetSender.newSender(lineSender);
		proxy.setMonitor(getMonitor());
		proxy.setDateFormatMap(genDateFormatMap());
		
		String sqle = param.getValue(ParamKey.sql);
		this.logger.info(String.format("hiveReader start to query %s .", sqle));
		String[] sqls=StringUtils.split(sqle,";");
		
		ResultSet rs = null;
		Statement stmt =null;
		try {
			stmt = conn.createStatement();
			for(String tsql:sqls){
				if (tsql.indexOf("{currDate}")>=0){
					tsql=StringUtils.replace(tsql,"{currDate}",
							ETLDateUtils.formatDate(ETLDateUtils.addDays(ETLDateUtils.getCurrTimestamp(), this.days) ,ETLConstants.DATE_ONLY_FORMAT));
				}
				rs =DBUtils.query(stmt, tsql);
				rs.setFetchSize(this.fetchSize);
				proxy.sendToWriter(rs);
			}
			proxy.flush();
			getMonitor().setStatus(PluginStatus.READ_OVER);
			return PluginStatus.SUCCESS.value();
		} catch (SQLException e) {
			logger.error(ExceptionTracker.trace(e));
			throw new DataExchangeException(e);
		} finally {
			try {
				if (null != rs) {
					rs.close();
					rs = null;
				}
				if (null != stmt) {
					stmt.close();
					stmt = null;
				}
			} catch (SQLException e) {
				throw new IllegalStateException(e.getCause());
			}
		}
	
	}

	@Override
	public int finish(){
		try {
			if (conn != null) {
				conn.close();
			}
			conn = null;
		} catch (SQLException e) {
		}
		return PluginStatus.SUCCESS.value();
	}

	@Override
	public List<PluginParam> split(PluginParam param){
		List<PluginParam> sqlList;
		
		if (StringUtils.isBlank(this.sql)) {
			/* non-user-defined sql */
			HiveReaderSplitter spliter = new HiveReaderSplitter(param);
			spliter.init();
			sqlList = spliter.split();
		} else {
			/* user-define sql */
			sqlList = super.split(param);
		}
		
		String metaSql = sqlList.get(0).getValue(ParamKey.metaSql);
		if (StringUtils.isEmpty(metaSql)){
			metaSql=param.getValue(ParamKey.sql);
		}
		MetaData m = null;
		try {
			conn = getConnection();
			m = this.genMetaData(conn, metaSql);
			param.setMyMetaData(m);
		} catch (SQLException e) {
			logger.error(ExceptionTracker.trace(e));
			throw new DataExchangeException(e);
		}
		return sqlList;
	}
	
	private  MetaData genMetaData(Connection conn, String sql)
			throws SQLException {
		MetaData meta = new MetaData();
		List<MetaData.Column> columns = new ArrayList<MetaData.Column>();
		ResultSet resultSet = null;
		Statement stmt =null;
		try {
			stmt = conn.createStatement();
			resultSet =DBUtils.query(stmt, sql);
			int columnCount = resultSet.getMetaData().getColumnCount();
			for (int i = 1; i <= columnCount; i++) {
				MetaData.Column col = meta.new Column();
				col.setColName(resultSet.getMetaData().getColumnName(i)
						.toLowerCase().trim());
				col.setDataType(resultSet.getMetaData().getColumnTypeName(i)
						.toLowerCase().trim());
				columns.add(col);
			}
			meta.setColInfo(columns);
//			meta.setTableName(resultSet.getMetaData().getTableName(1).toLowerCase());
		} finally {
			try {
				if (null != resultSet) {
					resultSet.close();
				}
				resultSet = null;
				if (null != stmt) {
					stmt.close();
					stmt = null;
				}
			} catch (SQLException e) {
				throw new IllegalStateException(e.getCause());
			}
		}
		return meta;
	}

	private Map<String, SimpleDateFormat> genDateFormatMap() {
		Map<String, SimpleDateFormat> mapDateFormat = new HashMap<String, SimpleDateFormat>();
		mapDateFormat.clear();
		mapDateFormat.put("datetime", new SimpleDateFormat(
				"yyyy-MM-dd HH:mm:ss"));
		mapDateFormat.put("timestamp", new SimpleDateFormat(
				"yyyy-MM-dd HH:mm:ss"));
		mapDateFormat.put("time", new SimpleDateFormat("HH:mm:ss"));
		return mapDateFormat;
	}



}
