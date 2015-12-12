package net.iharding.generate;

import java.sql.Connection;
import java.sql.DatabaseMetaData;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;

import net.iharding.Constants;
import net.iharding.modules.meta.model.DBTable;
import net.iharding.modules.meta.model.DataSource;
import net.iharding.modules.meta.model.DbColumn;
import net.iharding.modules.meta.model.Module;

public class DBReverse {
	
	private Util util=new Util();
	
	public static void main(String[] args) throws Exception {
		DBReverse reverse=new DBReverse();
		Module module=new Module();
		
		module.setModuleCode("etl");
		module.setModuleName("ETL模块");
		reverse.reverseModule(module, "Joe.Zhang");
	}
	
	private String getOracleTableComments(DataSource dataSource,String table)  {
		ResultSet rs = null;
		PreparedStatement ps=null;
		String comments="";
		try {
			String sql = "SELECT comments FROM user_tab_comments WHERE table_name='"+table+"'";
			ps=getConnection(dataSource).prepareStatement(sql);
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
	
	private void close(ResultSet rs){
		if (rs!=null){
			try {
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			rs=null;
		}
	}
	
	private String getOracleColumnComments(DataSource dataSource,String table,String column)  {
		ResultSet rs = null;
		PreparedStatement  ps=null;
		String comments="";
		try {
			String sql = "SELECT comments FROM user_col_comments WHERE table_name='"+table+"' AND column_name = '"+column+"'";
			ps=getConnection(dataSource).prepareStatement(sql);
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
	
	public DBTable getTableDescription(DatabaseMetaData dmd, String tableName, DataSource dataSource) {
		ResultSet rs = null;
		DBTable bean = new DBTable();
		
		try {
			if (dataSource.getDbType()==Constants.DBMS_TYPE_ORACLE){
				bean.setTablePname(this.getOracleTableComments(dataSource,tableName));
			}
			bean.setTableName(tableName);
			//primaryKey
//			if (dataSource.getDbType()==Constants.DBMS_TYPE_MSSQL){
//				rs = dmd.getPrimaryKeys(null, null, tableName);
//			}else{
//				rs = dmd.getPrimaryKeys(dataSource.getDbName(), dataSource.getSchemaName(), tableName);
//			}
//			HashMap pkMap = new HashMap();
//			while (rs.next()) {
//				pkMap.put(util.sql2javaName(rs.getString(4), 0), "");
//			}
//			if (pkMap.size() == 0) {
//				System.out.println("err pk able:" + tableName);
//			}
//			close(rs);
			if (dataSource.getDbType()==Constants.DBMS_TYPE_MSSQL){
				rs = dmd.getColumns(null, null, tableName, "%");
			}else{
				rs = dmd.getColumns(dataSource.getDbName(), dataSource.getSchemaName(), tableName, "%");
			}
			while (rs.next()) {
				int colType = rs.getInt(5);
				if (colType != Types.BINARY && colType != Types.VARBINARY && colType != Types.LONGVARBINARY) {
					String sqlColName = rs.getString(4);
					String javaColName =util.sql2javaName(sqlColName, 0);
					int colTypeLength = rs.getInt(7);
					int decimalLength = rs.getInt(9);
					DbColumn col = new DbColumn();
//					Validation val = new Validation();
//					col.setValidation(val);
					col.setFieldCode(javaColName);
					col.setColumnName(sqlColName);
					String tit ="";
					if (dataSource.getDbType()==Constants.DBMS_TYPE_ORACLE){
						tit=getOracleColumnComments(dataSource,tableName,sqlColName);						
					}else{
						 tit = rs.getString(12);						
					}
					if ("".equalsIgnoreCase(tit) || tit == null) {
						col.setColumnPname(javaColName);
					} else {
						col.setColumnPname(tit);
					}
					col.setRemark(col.getColumnPname());
					col.setType(convert(colType, colTypeLength, decimalLength));
					if (!"id".equalsIgnoreCase(sqlColName)) {
//						val.setRequired(false);
						bean.addColumn(col);
					}
//					if (col.getType().equals("string")) {
//						try {
//							val.setMaxLength(rs.getInt(7));
//						} catch (RuntimeException e) {
//							val.setMaxLength(30);
//						}
//					}
				}
			}
		} catch (SQLException e) {
		} finally {
			close(rs);
		}
		return bean;
	}
	
	private String convert(int type, int typeLength, int decimalLength) {
		switch (type) {
		case Types.CHAR:
		case Types.VARCHAR:
			return "string";
		case Types.NUMERIC:
			if (typeLength < 10) {
				return "int";
			} else {
				return "long";
			}
		case Types.DECIMAL:
			if (decimalLength > 0) {
				return "double";
			} else {
				if (typeLength < 10) {
					return "int";
				} else {
					return "long";
				}
			}
		case Types.DOUBLE:
			return "double";
		case Types.BIT:
			return "boolean";
		case Types.TINYINT:
			return "int";
		case Types.SMALLINT:
			return "int";
		case Types.INTEGER:
			return "int";
		case Types.BIGINT:
			return "long";
		case Types.REAL:
		case Types.FLOAT:
			return "float";
		case Types.BINARY:
		case Types.VARBINARY:
		case Types.BLOB:
		case Types.LONGVARBINARY:
			return "blob";
		case Types.CLOB:
		case Types.LONGVARCHAR:
			return "clob";
		case Types.DATE:
			return "timestamp";
		case Types.TIME:
			return "timestamp";
		case Types.TIMESTAMP:
			return "timestamp";
		default:
			return "string";
		}
	}

	public Connection getConnection(DataSource dataSource) throws ClassNotFoundException, SQLException{
		Class.forName(dataSource.getDriverClassName());
		return DriverManager.getConnection(dataSource.getJdbcUrl(),dataSource.getJdbcUser(),dataSource.getJdbcPassword());
	}
	
	public Module reverseModule(Module module,String classAuthor) throws ClassNotFoundException, SQLException{
		ResultSet rs = null;
		Connection conn = getConnection(module.getDatasource());
		DatabaseMetaData dmd = conn.getMetaData();
		String[] tabletypes = { "TABLE" };
		if (module.getDatasource().getDbType()==Constants.DBMS_TYPE_ORACLE){
			rs = dmd.getTables(module.getDatasource().getDbName(), module.getDatasource().getSchemaName(), "%", tabletypes);
		}else if (module.getDatasource().getDbType()==Constants.DBMS_TYPE_MSSQL){
			rs = dmd.getTables(null, null, "%", null);
		}else{
			rs = dmd.getTables(module.getDatasource().getDbName(), null, null, tabletypes);
		}
		while (rs.next()) {
			if (rs.getString(4).equalsIgnoreCase("table")) {
				String tableName = rs.getString(3);
				if (tableName != null) {
					System.out.println("tables: " + tableName);
					if (tableName.toLowerCase().startsWith(module.getModuleCode().toLowerCase() + "_") || "*".equalsIgnoreCase(module.getModuleCode())) {
//						System.out.println("Importing table " + tableName);
//						tree.addBean(getTableDescription(dmd, tableName, moduleName));
					}
				}
			}
		}
		return module;
	}

}
