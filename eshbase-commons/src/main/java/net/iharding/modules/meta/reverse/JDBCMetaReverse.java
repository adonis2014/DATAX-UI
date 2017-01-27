package net.iharding.modules.meta.reverse;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Types;
import java.util.List;

import net.iharding.modules.meta.model.MetaProperty;

import org.apache.commons.lang.StringUtils;


public abstract class JDBCMetaReverse extends AbstractMetaReverse {

	/**
	 * 获取连接
	 * 
	 * @param mproes
	 * @return
	 * @throws ClassNotFoundException
	 * @throws SQLException
	 */
	protected Connection getConnection(List<MetaProperty> mproes) throws ClassNotFoundException, SQLException {
		return this.getConnection(mproes, false);
	}
	
	/**
	 * 是否替代dbanem
	 * @param mproes
	 * @param replaceDbName
	 * @return
	 * @throws ClassNotFoundException
	 * @throws SQLException
	 */
	protected Connection getConnection(List<MetaProperty> mproes,boolean replaceDbName) throws ClassNotFoundException, SQLException {
		Class.forName(getMetaProperty("jdbcdriver", mproes).getPropertyValue());
		String jdbcurl=getMetaProperty("jdbcurl", mproes).getPropertyValue();
		if (replaceDbName)jdbcurl=StringUtils.replace(jdbcurl, "{dbname}", getMetaProperty("database", mproes).getPropertyValue());
		return DriverManager.getConnection(jdbcurl, getMetaProperty("username", mproes).getPropertyValue(),
				getMetaProperty("password", mproes).getPropertyValue());
	}

	/**
	 * convert capital in text to _ and lowercase, but the first letter e.g.
	 * firstName become first_name
	 *
	 * @param name
	 *            Description of Parameter
	 * @return Description of the Returned Value
	 */
	protected String java2sqlName(String name) {
		String column = "";
		for (int i = 0; i < name.length(); i++) {
			if (i < name.length() - 1 && (name.charAt(i) >= 'a' && name.charAt(i) <= 'z') && (name.charAt(i + 1) >= 'A' && name.charAt(i + 1) <= 'Z')) {
				column += name.charAt(i) + "_";
			} else {
				column += name.charAt(i);
			}
		}
		return column.toLowerCase();
	}

	/**
	 * Convert sql field naming (field_name) to java field naming (fieldName).
	 * 
	 * @param name
	 * @return
	 */
	protected String sql2javaName(String name) {
		String column = "";
		for (int i = 0; i < name.length(); i++) {
			if (name.charAt(i) == '_') {
				column += ++i < name.length() ? String.valueOf(name.charAt(i)).toUpperCase() : "";
			} else {
				column += name.charAt(i);
			}
		}
		return column;
	}

	protected void closeConnection(Connection conn) {
		if (conn!=null){
			try {
				conn.close();
			} catch (SQLException e) {
			}
			conn=null;
		}
			
	}
	
	protected void closeStatement(Statement stmt) {
		try {
			if (stmt!=null){
				if (stmt.isClosed()) stmt.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		stmt=null;
	}

	protected void closeResult(ResultSet rs) {
		try {
			if (rs!=null){
				if (rs.isClosed()) rs.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		rs=null;
	}

	protected String convert(int type, int typeLength, int decimalLength) {
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
}
