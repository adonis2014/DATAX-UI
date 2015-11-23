package net.iharding.generate;

import java.sql.Connection;
import java.sql.DatabaseMetaData;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.guess.core.utils.DateUtil;

import com.google.common.collect.Maps;

public class DBReverse {
	
	private String packageName="net.iharding";
	private String driverClass="";
	private String url;
	private String user;
	private String password;
	private String dbName;
	private String schemaName;
	private String dbms;
	
	public Map<String, Object> getTableDescription(String moduleName,String className,String classAuthor,String functionName) throws ClassNotFoundException, SQLException{
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
