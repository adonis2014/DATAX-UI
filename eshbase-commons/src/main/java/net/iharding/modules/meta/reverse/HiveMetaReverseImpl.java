package net.iharding.modules.meta.reverse;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.iharding.modules.meta.model.Dataset;
import net.iharding.modules.meta.model.DataSource;
import net.iharding.modules.meta.model.Database;
import net.iharding.modules.meta.model.DbColumn;
import net.iharding.modules.meta.model.MetaProperty;

import org.apache.commons.lang.StringUtils;
import org.guess.sys.model.User;
import org.springframework.stereotype.Repository;

@Repository("MetaReverse10")
public class HiveMetaReverseImpl extends JDBCMetaReverse {

	private Map<String, SimpleDateFormat> dateFormatMap = null;

	@Override
	public DataSource reverseMeta(DataSource datasource, List<MetaProperty> mproes, User cuser) {
		Connection conn = null;
		try {
			conn = getConnection(mproes);
			// 获取所有数据库
			List<Map<String, String>> dbs = getHiveSqlQuery(conn, "show databases", null);
			for (Map<String, String> row : dbs) {
				String dbname = row.get("database_name");
				Database db = datasource.getDatabase(dbname, cuser);
				db.setDatasource(datasource);
				db.setDbname(dbname);
				db.setCheckLabel(1);
				db.setSchemaName(dbname);
				db.setRemark(dbname);
				// 获取表信息
				List<Map<String, String>> tabs = getHiveSqlQuery(conn, "show tables", dbname);
				for (Map<String, String> tab : tabs) {
					String tableName = tab.get("tab_name");
					if (StringUtils.isNotEmpty(tableName)) {
						Dataset table = db.getDBTable(tableName, cuser);// new
																		// DBTable();
						table.setDatasetName(tableName);
						table.setCheckLabel(1);
						table.setDatasetPname(tableName);
						table.setRemark(tableName);
						table.setClassName(this.sql2javaName(tableName));
						table.setDatabase(db);
						List<Map<String, String>> cols = getHiveSqlQuery(conn, "describe " + tableName, null);
						for (Map<String, String> colMap : cols) {
							String sqlColName = colMap.get("col_name");
							if (StringUtils.isNotEmpty(sqlColName) && !StringUtils.startsWith(sqlColName, "#")) {
								DbColumn col = table.getNewDbColumn(sqlColName);
								String tit = "";
								try {
									tit = colMap.get("comment");
								} catch (Exception ex) {
								}
								col.setFieldCode(this.sql2javaName(sqlColName));
								col.setColumnName(sqlColName);
								if ("".equalsIgnoreCase(tit) || tit == null) {
									col.setColumnPname(sqlColName);
								} else {
									col.setColumnPname(tit);
								}
								col.setRemark(col.getColumnPname());
								col.setCheckLabel(1);
								col.setDbtable(table);
								col.setType(colMap.get("data_type"));
								table.addColumn(col);
							}
						}
						db.addTable(table);
						System.out.println(tableName);
					}
				}
				datasource.addDatabase(db);
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			this.closeConnection(conn);
		}

		return datasource;
	}

	private Map<String, SimpleDateFormat> genDateFormatMap() {
		if (dateFormatMap == null) {
			dateFormatMap = new HashMap<String, SimpleDateFormat>();
			dateFormatMap.put("datetime", new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"));
			dateFormatMap.put("timestamp", new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"));
			dateFormatMap.put("time", new SimpleDateFormat("HH:mm:ss"));
		}
		return dateFormatMap;
	}

	private List<Map<String, String>> getHiveSqlQuery(Connection conn, String sql, String dbname) {
		ResultSet resultSet = null;
		Statement stmt = null;
		List<Map<String, String>> results = new ArrayList<Map<String, String>>();
		try {
			stmt = conn.createStatement();
			if (dbname != null)
				stmt.execute("use " + dbname);
			resultSet = stmt.executeQuery(sql);
			String item = null;
			Timestamp ts = null;
			int columnCount = resultSet.getMetaData().getColumnCount();
			String[] columnNames = new String[columnCount + 1];
			SimpleDateFormat[] timeMap = new SimpleDateFormat[columnCount + 1];
			ResultSetMetaData rsmd = resultSet.getMetaData();
			for (int i = 1; i <= columnCount; i++) {
				String type = rsmd.getColumnTypeName(i).toLowerCase().trim();
				columnNames[i] = rsmd.getColumnName(i).toLowerCase().trim();
				if (this.genDateFormatMap().containsKey(type)) {
					timeMap[i] = this.genDateFormatMap().get(type);
				}
			}
			while (resultSet.next()) {
				Map<String, String> row = new HashMap<String, String>();
				for (int i = 1; i <= columnCount; i++) {
					if (null != timeMap[i]) {
						ts = resultSet.getTimestamp(i);
						if (null != ts) {
							item = timeMap[i].format(ts);
						} else {
							item = null;
						}
					} else {
						item = resultSet.getString(i);
					}
					row.put(StringUtils.lowerCase(columnNames[i]), item);
				}
				results.add(row);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (null != resultSet) {
					resultSet.close();
					resultSet = null;
				}
				if (null != stmt) {
					stmt.close();
					stmt = null;
				}
			} catch (SQLException e) {
				throw new IllegalStateException(e.getCause());
			}
		}
		return results;
	}

	@Override
	public Database reverseDatabaseMeta(DataSource datasource, List<MetaProperty> mproes, User cuser, String dbname) {
		Connection conn = null;
		Database db = null;
		try {
			conn = getConnection(mproes);
			db = this.reverseDatabaseMeta(datasource, mproes, cuser, dbname, conn);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			this.closeConnection(conn);
		}
		return db;
	}

	/**
	 * 反转database数据
	 * 
	 * @param datasource
	 * @param mproes
	 * @param cuser
	 * @param dbname
	 * @param conn
	 * @return
	 */
	private Database reverseDatabaseMeta(DataSource datasource, List<MetaProperty> mproes, User cuser, String dbname, Connection conn) {
		Database db = datasource.getDatabase(dbname, cuser);
		db.setDatasource(datasource);
		db.setDbname(dbname);
		db.setCheckLabel(1);
		db.setSchemaName(dbname);
		db.setRemark(dbname);
		// 获取表信息
		List<Map<String, String>> tabs = getHiveSqlQuery(conn, "show tables", dbname);
		for (Map<String, String> tab : tabs) {
			String tableName = tab.get("tab_name");
			if (StringUtils.isNotEmpty(tableName)) {
				db.addTable(this.reverseTableMeta(datasource, mproes, cuser, db, tableName, conn));
			}
		}
		return db;
	}
	
	/**
	 * 获取表对象数据
	 * @param datasource
	 * @param mproes
	 * @param cuser
	 * @param db
	 * @param tableName
	 * @param conn
	 * @return
	 */
	private Dataset reverseTableMeta(DataSource datasource, List<MetaProperty> mproes, User cuser, Database db, String tableName, Connection conn) {
		Dataset table = db.getDBTable(tableName, cuser);// new
		table.setDatasetName(tableName);
		table.setCheckLabel(1);
		table.setDatasetPname(tableName);
		table.setRemark(tableName);
		table.setClassName(this.sql2javaName(tableName));
		table.setDatabase(db);
		List<Map<String, String>> cols = getHiveSqlQuery(conn, "describe " + tableName, null);
		for (Map<String, String> colMap : cols) {
			String sqlColName = colMap.get("col_name");
			if (StringUtils.isNotEmpty(sqlColName) && !StringUtils.startsWith(sqlColName, "#")) {
				DbColumn col = table.getNewDbColumn(sqlColName);
				String tit = "";
				try {
					tit = colMap.get("comment");
				} catch (Exception ex) {
				}
				col.setFieldCode(this.sql2javaName(sqlColName));
				col.setColumnName(sqlColName);
				if ("".equalsIgnoreCase(tit) || tit == null) {
					col.setColumnPname(sqlColName);
				} else {
					col.setColumnPname(tit);
				}
				col.setRemark(col.getColumnPname());
				col.setCheckLabel(1);
				col.setDbtable(table);
				col.setType(colMap.get("data_type"));
				table.addColumn(col);
			}
		}
		return table;
	}

	@Override
	public Dataset reverseTableMeta(DataSource datasource, List<MetaProperty> mproes, User cuser, String dbname, String tableName) {
		Connection conn = null;Dataset table =null;
		Database db = datasource.getDatabase(dbname, cuser);
		db.setDatasource(datasource);
		db.setDbname(dbname);
		db.setCheckLabel(1);
		db.setSchemaName(dbname);
		db.setRemark(dbname);
		try {
			conn = getConnection(mproes);
			table = this.reverseTableMeta(datasource, mproes, cuser, db, tableName, conn);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			this.closeConnection(conn);
		}
		return table;
	}

}
