package net.iharding.modules.meta.model;

import java.util.ArrayList;
import java.util.List;

/**
 * 数据源
 * @author admin
 *
 */
public class DataSource {
	private String dbms;
	private String driverClass;
	private String dbName;
	private String jdbcUrl;
	private String user;
	private String password;
	
	private List<Table> tables=new ArrayList<Table>();

	public void addTable(Table table){
		tables.add(table);
	}
	
	public List<Table> getTables() {
		return tables;
	}

	public void setTables(List<Table> tables) {
		this.tables = tables;
	}

	public String getJdbcUrl() {
		return jdbcUrl;
	}

	public void setJdbcUrl(String jdbcUrl) {
		this.jdbcUrl = jdbcUrl;
	}

	public String getDbms() {
		return dbms;
	}

	public void setDbms(String dbms) {
		this.dbms = dbms;
	}

	public String getDriverClass() {
		return driverClass;
	}

	public void setDriverClass(String driverClass) {
		this.driverClass = driverClass;
	}

	public String getDbName() {
		return dbName;
	}

	public void setDbName(String dbName) {
		this.dbName = dbName;
	}

	public String getUser() {
		return user;
	}

	public void setUser(String user) {
		this.user = user;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

}
