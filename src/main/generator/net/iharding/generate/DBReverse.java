package net.iharding.generate;

import java.sql.Connection;
import java.sql.DatabaseMetaData;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.util.HashMap;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.guess.core.utils.DateUtil;

import com.google.common.collect.Maps;
import com.iharding.generator.xml.Attribute;
import com.iharding.generator.xml.Bean;
import com.iharding.generator.xml.Column;
import com.iharding.generator.xml.PrimaryKey;
import com.iharding.generator.xml.Validation;

public class DBReverse {
	
	private String packageName="net.iharding";
	private String driverClass="";
	private String url;
	private String user;
	private String password;
	private String dbName;
	private String schemaName;
	private String dbms;
	
	private String getOracleTableComments(String table)  {
		ResultSet rs = null;
		PreparedStatement ps=null;
		String comments="";
		try {
			String sql = "SELECT comments FROM user_tab_comments WHERE table_name='"+table+"'";
			ps=getCommentConnection().prepareStatement(sql);
			rs =ps.executeQuery();
			if (rs.next()) {
				comments=rs.getString("comments");				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rs);
			try{ps.close();}catch(Exception ex){}
		}		
		return comments;
	}
	
	private String getOracleColumnComments(String table,String column)  {
		ResultSet rs = null;
		PreparedStatement  ps=null;
		String comments="";
		try {
			String sql = "SELECT comments FROM user_col_comments WHERE table_name='"+table+"' AND column_name = '"+column+"'";
			ps=getCommentConnection().prepareStatement(sql);
			rs =ps.executeQuery();
			if (rs.next()) {
				comments=rs.getString("comments");				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rs);
			try{ps.close();}catch(Exception ex){				
			}
		}		
		return comments;
	}
	
	private Map getTableDescription(DatabaseMetaData dmd, String tableName, String moduleName) {
		ResultSet rs = null;
		Bean bean = new Bean();
		try {
			if ("oracle".equalsIgnoreCase(this.dbms)){
				bean.setTitle(this.getOracleTableComments(tableName));
			}
			bean.setName(util.firstUpper(util.sql2javaName(tableName, 1)).substring(moduleName.length()));
			if (!tableName.equals(util.java2sqlName(bean.getName()))) {
				bean.setSqlName(tableName.toUpperCase());
			}			
			bean.setGenerateDao(true);
			bean.setGenerateProcess(false);
			if ("mssql".equalsIgnoreCase(this.dbms)){
				rs = dmd.getPrimaryKeys(null, null, tableName);
			}else{
				rs = dmd.getPrimaryKeys(dbName, schemaName, tableName);
			}
			HashMap pkMap = new HashMap();
			while (rs.next()) {
				pkMap.put(util.sql2javaName(rs.getString(4), 0), "");
			}
			if (pkMap.size() == 0) {
				System.out.println("err pk able:" + tableName);
			}
			close(rs);
			if ("mssql".equalsIgnoreCase(this.dbms)){
				rs = dmd.getColumns(null, null, tableName, "%");
			}else{
				rs = dmd.getColumns(dbName, schemaName, tableName, "%");
			}
			Attribute attr = new Attribute();
			PrimaryKey pk = new PrimaryKey();
			while (rs.next()) {
				int colType = rs.getInt(5);
				if (colType != Types.BINARY && colType != Types.VARBINARY && colType != Types.LONGVARBINARY) {
					String sqlColName = rs.getString(4);
					String javaColName = util.sql2javaName(sqlColName, 0);
					int colTypeLength = rs.getInt(7);
					int decimalLength = rs.getInt(9);
					Column col = new Column();
					Validation val = new Validation();
					col.setValidation(val);
					col.setName(javaColName);
					if (!util.java2sqlName(javaColName).equals(sqlColName)) {
						col.setSqlName(sqlColName);
					}
					String tit ="";
					if ("oracle".equalsIgnoreCase(this.dbms)){
						tit=getOracleColumnComments(tableName,sqlColName);						
					}else{
						 tit = rs.getString(12);						
					}
					if ("".equalsIgnoreCase(tit) || tit == null) {
						col.setTitle(javaColName);
					} else {
						col.setTitle(tit);
					}
					col.setType(convert(colType, colTypeLength, decimalLength));
					if (!pkMap.containsKey(javaColName)) {
						val.setRequired(false);
						attr.addColumn(col);
					} else {
						pk.addColumn(col);
						val.setRequired(true);
					}

					if (col.getType().equals("string")) {
						try {
							val.setMaxLength(rs.getInt(7));
						} catch (RuntimeException e) {
							val.setMaxLength(30);
						}
					}
				}
				bean.setAttribute(attr);
				bean.setPrimaryKey(pk);
			}
		} catch (SQLException e) {
		} finally {
			close(rs);
		}
		return bean;
	}

	
	public Map<String, Object> getTablesDescription(String moduleName,String className,String classAuthor,String functionName) throws ClassNotFoundException, SQLException{
		ResultSet rs = null;
		Connection conn = null;
		Map<String, Object> model = Maps.newHashMap();
		model.put("packageName", StringUtils.lowerCase(packageName));
		model.put("moduleName", StringUtils.lowerCase(moduleName));
		model.put("className", StringUtils.uncapitalize(className));
		model.put("ClassName", StringUtils.capitalize(className));
		model.put("classAuthor",
				StringUtils.isNotBlank(classAuthor) ? classAuthor
						: "Generate Tools");
		model.put("classVersion", DateUtil.getCurrenDate());
		model.put("functionName", functionName);
		model.put("tableName",model.get("moduleName") + "_" + model.get("className"));
		Class.forName(driverClass);
		conn = DriverManager.getConnection(url, user, password);
		DatabaseMetaData dmd = conn.getMetaData();
		String[] tabletypes = { "TABLE" };
		if ("oracle".equalsIgnoreCase(dbms)){
			rs = dmd.getTables(dbName, schemaName, "%", tabletypes);
		}else if ("mssql".equalsIgnoreCase(dbms)){
			rs = dmd.getTables(null, null, "%", null);
		}else{
			rs = dmd.getTables(dbName, null, null, tabletypes);
		}
		while (rs.next()) {
			if (rs.getString(4).equalsIgnoreCase("table")) {
				String tableName = rs.getString(3);
				if (tableName != null) {
					System.out.println("tables: " + tableName);
					if (tableName.toLowerCase().startsWith(moduleName.toLowerCase() + "_") || "*".equalsIgnoreCase(moduleName)) {
//						System.out.println("Importing table " + tableName);
//						tree.addBean(getTableDescription(dmd, tableName, moduleName));
					}
				}
			}
		}
//		model.put("fields", fields);
		return model;
	}

}
