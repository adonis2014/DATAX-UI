package net.iharding.generate;

import java.lang.reflect.Array;
import java.util.HashMap;
import java.util.Properties;

import org.apache.velocity.util.StringUtils;

public class Util extends StringUtils {

	public static String prop_file = "StrutsCreator-his.properties";
	public static String bundle_file = "StrutsCreator-his";

	HashMap<String,String> sqlTypeMap;
	HashMap<String,String> javaTypeMap;
	HashMap<String,String> javaSqlTypeMap;
	HashMap<String,String> refs;



	/**
	 * Default constructor
	 */
	public Util() {
		javaTypeMap = new HashMap<String,String>();
		javaTypeMap.put("string", "String");
		javaTypeMap.put("auto", "Long");
		javaTypeMap.put("long", "Long");
		javaTypeMap.put("double", "Double");
		javaTypeMap.put("float", "Float");
		javaTypeMap.put("boolean", "Boolean");
		javaTypeMap.put("password", "String");
		javaTypeMap.put("email", "String");
		javaTypeMap.put("creditcard", "String");
		javaTypeMap.put("date", "Timestamp");
		javaTypeMap.put("timestamp", "Timestamp");
	}


	/**
	 * set SQL type mapping for certain DBMS.
	 *
	 * @param dbms
	 * @exception Exception
	 */
	public void setDbms(String dbms) throws Exception {
		PropertyMgr prop = new PropertyMgr("SQLType.properties");
		Properties p = prop.getProperties();
		sqlTypeMap = new HashMap<String,String>();
		sqlTypeMap.put("int", p.getProperty(dbms + ".type.int"));
		sqlTypeMap.put("long", p.getProperty(dbms + ".type.long"));
		sqlTypeMap.put("float", p.getProperty(dbms + ".type.float"));
		sqlTypeMap.put("double", p.getProperty(dbms + ".type.double"));
		sqlTypeMap.put("boolean", p.getProperty(dbms + ".type.boolean"));
		sqlTypeMap.put("char", p.getProperty(dbms + ".type.char"));
		sqlTypeMap.put("byte", p.getProperty(dbms + ".type.byte"));
		sqlTypeMap.put("short", p.getProperty(dbms + ".type.short"));
		sqlTypeMap.put("string", p.getProperty(dbms + ".type.string"));
		sqlTypeMap.put("auto", p.getProperty(dbms + ".type.auto"));
		sqlTypeMap.put("date", p.getProperty(dbms + ".type.date"));
		sqlTypeMap.put("timestamp", p.getProperty(dbms + ".type.timestamp"));
		sqlTypeMap.put("memo", p.getProperty(dbms + ".type.memo"));
		sqlTypeMap.put("email", p.getProperty(dbms + ".type.email"));
		sqlTypeMap.put("creditcard", p.getProperty(dbms + ".type.creditcard"));
		javaSqlTypeMap = new HashMap<String,String>();
		javaSqlTypeMap.put("int", p.getProperty("type.int"));
		javaSqlTypeMap.put("long", p.getProperty("type.long"));
		javaSqlTypeMap.put("float", p.getProperty("type.float"));
		javaSqlTypeMap.put("double", p.getProperty("type.double"));
		javaSqlTypeMap.put("boolean", p.getProperty("type.boolean"));
		javaSqlTypeMap.put("char", p.getProperty("type.char"));
		javaSqlTypeMap.put("byte", p.getProperty("type.byte"));
		javaSqlTypeMap.put("short", p.getProperty("type.short"));
		javaSqlTypeMap.put("string", p.getProperty("type.string"));
		javaSqlTypeMap.put("auto", p.getProperty("type.auto"));
		javaSqlTypeMap.put("date", p.getProperty("type.date"));
		javaSqlTypeMap.put("timestamp", p.getProperty("type.timestamp"));
		javaSqlTypeMap.put("memo", p.getProperty("type.memo"));
		javaSqlTypeMap.put("email", p.getProperty("type.email"));
		javaSqlTypeMap.put("creditcard", p.getProperty("type.creditcard"));
	}

	/**
	 * Specify if the type is number type group.
	 * 
	 * @param type
	 * @return
	 */
	public boolean isNumberType(String type) {
		if ("int".equals(type) || "long".equals(type) || "float".equals(type) || "double".equals(type) || "short".equals(type) || "auto".equals(type)) {
			return true;
		} else {
			return false;
		}
	}



	/**
	 * Check if type is String type.
	 * 
	 * @param type
	 * @return
	 */
	public boolean isStringType(String type) {
		if ("string".equals(type) || "password".equals(type) || "email".equals(type) || "creditcard".equals(type)) {
			return true;
		} else {
			return false;
		}
	}

	/**
	 * Check if type is date type.
	 * 
	 * @param type
	 * @return
	 */
	public boolean isDateType(String type) {
		if ("date".equals(type) || "timestamp".equals(type)) {
			return true;
		} else {
			return false;
		}
	}



	/**
	 * convert capital in text to _ and lowercase, but the first letter e.g.
	 * firstName become first_name
	 *
	 * @param name
	 *            Description of Parameter
	 * @return Description of the Returned Value
	 */
	public String java2sqlName(String name) {
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
	public String sql2javaName(String name) {
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

	public String getBasePackage(String packageStr) {
		int id1 = packageStr.indexOf(".");
		int id2 = packageStr.indexOf(".", id1 + 1);
		// int id3=packageStr.indexOf(".",id2+1);
		return packageStr.substring(0, id2);
	}

	public String sql2javaName(String name, int isTable) {
		String column = "";
		boolean needUpperCase = false;
		// ��ȡǰ׺
		// if (isTable == 1) {
		// name = name.substring(name.indexOf("_") + 1);
		// }
		for (int i = 0; i < name.length(); i++) {
			if (name.charAt(i) == '_') {
				column += ++i < name.length() ? String.valueOf(name.charAt(i)).toUpperCase() : "";
				needUpperCase = true;
			} else {
				if (i == 0 && isTable == 1) {
					column += String.valueOf(name.charAt(i)).toUpperCase();
					needUpperCase = false;
				} else {
					column += String.valueOf(name.charAt(i)).toLowerCase();
				}
			}
		}
		return column;
	}



	/**
	 * Java type mapping.
	 *
	 * @param type
	 *            Description of Parameter
	 * @return Description of the Returned Value
	 */
	public String javaType(String type) {
		if (javaTypeMap.containsKey(type)) {
			return (String) javaTypeMap.get(type);
		} else {
			return type;
		}
	}

	/**
	 * Full Qualified Java type mapping. Almost similar to javaType(), but
	 * return java.util.Date for date type and java.sql.Timestamp for
	 *
	 * @param type
	 *            Description of Parameter
	 * @return Description of the Returned Value
	 */
	public String fqJavaType(String type) {
		if ("date".equals(type)) {
			return "java.util.Date";
		} else if ("timestamp".equals(type)) {
			return "java.sql.Timestamp";
		} else if ("int".equals(type)) {
			return "Integer";
		} else if ("clob".equals(type)) {
			return "String";
		} else if ("memo".equals(type)) {
			return "String";
		} else if (javaTypeMap.containsKey(type)) {
			return (String) javaTypeMap.get(type);
		} else {
			return type;
		}
	}

	public int getMaxLength(int maxLength) {
		if (maxLength % 2 == 0) {
			return maxLength / 2;
		} else {
			return maxLength / 2 + 1;
		}
	}

	public String fpJavaType(String type) {
		if ("date".equals(type)) {
			return "Date";
		} else if ("timestamp".equals(type)) {
			return "Timestamp";
		} else if ("int".equals(type)) {
			return "Int";
		} else if ("clob".equals(type)) {
			return "String";
		} else if ("memo".equals(type)) {
			return "String";
		} else if (javaTypeMap.containsKey(type)) {
			return (String) javaTypeMap.get(type);
		} else {
			return type;
		}
	}

	/**
	 * Attribute with default initial value.
	 *
	 * @param type
	 * @param attr
	 * @return
	 */
	public String initAttr(String type, String attr) {
		if ("int".equals(type) || "long".equals(type) || "short".equals(type)) {
			return type + " " + attr + " = 0";
		} else if ("double".equalsIgnoreCase(type)) {
			return type + " " + attr + " = 0.0";
		} else if ("float".equalsIgnoreCase(type)) {
			return type + " " + attr + " = (float) 0.0";
		} else if ("String".equalsIgnoreCase(type) || "password".equalsIgnoreCase(type)) {
			return "String " + attr + " = \"\"";
		} else if ("auto".equalsIgnoreCase(type)) {
			return "long " + attr;
		} else {
			return type + " " + attr;
		}
	}

	/**
	 * Generate the code to set an Attribute to the default initial value
	 *
	 * @param type
	 *            Description of Parameter
	 * @param attr
	 *            Description of Parameter
	 * @return Description of the Returned Value
	 */
	public String initValue(String type, String attr) {
		if ("int".equals(type) || "long".equals(type) || "short".equals(type)) {
			return attr + " = 0";
		} else if ("double".equalsIgnoreCase(type)) {
			return attr + " = 0.0";
		} else if ("float".equalsIgnoreCase(type)) {
			return attr + " = (float) 0.0";
		} else if ("String".equalsIgnoreCase(type) || "password".equalsIgnoreCase(type)) {
			return attr + " = \"\"";
		} else if ("auto".equalsIgnoreCase(type)) {
			return attr + " = 0";
		} else {
			return attr;
		}
	}


	public String toUpCase(String str) {
		return str.toUpperCase();
	}

	/**
	 * Capitalize first letter.
	 *
	 * @param s
	 * @return
	 */
	public String firstUpper(String s) {
		if (s.length() > 1) {
			return capitalizeFirstLetter(s);
		} else {
			return s;
		}
	}

	/**
	 * Lower first letter.
	 * 
	 * @param s
	 * @return
	 */
	public String firstLower(String s) {
		if (s.length() > 1) {
			return s.substring(0, 1).toLowerCase() + s.substring(1);
		} else {
			return s;
		}
	}


	/**
	 * Return lenght of an array (for used by velocity template).
	 * 
	 * @param array
	 * @return array's length
	 */
	public int arrLen(java.lang.Object array) {
		return Array.getLength(array);
	}


	/**
	 * SQL type mapping.
	 *
	 * @param type
	 * @param nonNull
	 * @param length
	 * @return
	 */
	private String sqlType(String type, boolean nonNull, int length) {
		String sqlType;
		if (sqlTypeMap.containsKey(type)) {
			sqlType = (String) sqlTypeMap.get(type);
		} else if ("password".equalsIgnoreCase(type)) {
			sqlType = (String) sqlTypeMap.get("string");
		} else {
			sqlType = "UNKNOWN";
		}

		if ("string".equals(type) || "password".equals(type)) {
			sqlType += "(" + length + ")";
		}

		if (nonNull) {
			sqlType += " NOT NULL";
		}
		return sqlType;
	}

	private String requestParam(String name, String type) {
		type = javaType(type);
		String result;
		if ("String".equals(type)) {
			result = "request.getParameter(\"" + name + "\")";
		} else if ("Timestamp".equals(type)) {
			result = "java.sql.Timestamp.valueOf(request.getParameter(\"" + name + "\"))";
		} else if ("int".equals(type)) {
			result = "Integer.parseInt(request.getParameter(\"" + name + "\"))";
		} else {
			result = firstUpper(type) + ".parse" + firstUpper(type) + "(request.getParameter(\"" + name + "\"))";
		}
		return result;
	}

	/**
	 * Escape xml string.
	 * 
	 * @param xml
	 * @return
	 */
	public String escapeXML(String xml) {
		String result = "";
		for (int i = 0; i < xml.length(); i++) {
			switch (xml.charAt(i)) {
			case '<':
				result += "&lt;";
				break;
			case '>':
				result += "&gt;";
				break;
			default:
				result += xml.charAt(i);
			}
		}
		return result;
	}
}
