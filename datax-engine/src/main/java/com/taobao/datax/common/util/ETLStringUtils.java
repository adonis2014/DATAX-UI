package com.taobao.datax.common.util;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Collection;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.lang.math.NumberUtils;
import org.apache.hadoop.hbase.client.Result;
import org.apache.hadoop.hbase.util.Bytes;
import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.type.TypeReference;


public class ETLStringUtils extends StringUtils {

	private static Map<String,HBaseKeyManager> hbaseKMMap=new HashMap<String,HBaseKeyManager>();

	public enum JSON_TYPE {
		/** JSONObject */
		JSON_TYPE_OBJECT,
		/** JSONArray */
		JSON_TYPE_ARRAY,
		/** 不是JSON格式的字符串 */
		JSON_TYPE_STRING
	}
	
	/**
	 * 获取求余数方式的rowid
	 * 
	 * @param fileValue
	 * @param fieldvalueLen
	 * @param remainder
	 * @param remainderLen
	 * @return
	 */
	public static String getRemainderRowId(Long fieldValue, Integer fieldvalueLen, Integer remainder, Integer remainderLen) {
		return leftPad(String.valueOf(fieldValue % remainder), remainderLen, "0") + leftPad(String.valueOf(fieldValue), fieldvalueLen, "0");
	}
	/**
	 * 反转余数获取fiedl value
	 * @param fieldValue
	 * @param fieldvalueLen
	 * @param remainder
	 * @param remainderLen
	 * @return
	 */
	public static String getReverseRemainderRowId(String rowValue,Integer remainderLen) {
		return removeStart(substring(rowValue, remainderLen+1), "0");
	}

	/***
	 * 
	 * 获取JSON类型 判断规则 判断第一个字母是否为{或[ 如果都不是则不是一个JSON格式的文本
	 * 
	 * @param str
	 * @return
	 */
	public static JSON_TYPE getJSONType(String str) {
		if (isEmpty(str)) {
			return JSON_TYPE.JSON_TYPE_STRING;
		}
		final char[] strChar = str.toCharArray();
		final char firstChar = strChar[0];
		final char lastChar=strChar[str.length()-1];
		if (firstChar == '{' && lastChar=='}') {
			return JSON_TYPE.JSON_TYPE_OBJECT;
		} else if (firstChar == '[' && lastChar==']') {
			return JSON_TYPE.JSON_TYPE_ARRAY;
		} else {
			return JSON_TYPE.JSON_TYPE_STRING;
		}
	}
	
	/**
	 * 根据日期+自增长值组织rowkey
	 * 
	 * @param rowId
	 * @return
	 */
	public static String getDateIncrementRowId(String tableName,String rowId,String pattern) {
		Date day=ETLDateUtils.parseDate(rowId, pattern);
		if (day==null){
			day=ETLDateUtils.parseDate(rowId, "yyyy-MM-dd HH:mm:ss SSS");
			if (day==null){
				day=new Date();
				System.out.println(rowId);
			}
		}
		String date=ETLDateUtils.formatDate(day,ETLConstants.DATEFORMAT_YYYYMMDD);
		HBaseKeyManager km=hbaseKMMap.get(tableName+"-"+date);
		if (km==null){
			km=new HBaseKeyManager(tableName,date);
			hbaseKMMap.put(tableName+"-"+date, km);
		}
		return date+"-"+km.cal();
	}
	

	public static String getMaxListStringFromList(List<String> days) {
		String theDay = null;
		for (String day : days) {
			if (theDay == null || day.compareTo(theDay) > 0) {
				theDay = day;
			}
		}
		return theDay;
	}

	/**
	 * 从求余数方式rowid中获取field值
	 * 
	 * @param rowId
	 * @param fieldvalueLen
	 * @param remainder
	 * @param remainderLen
	 * @return
	 */
	public static Long getFieldValueFromRowId(String rowId, Integer fieldvalueLen, Integer remainderLen) {
		return NumberUtils.toLong(removeLeftPad(substring(rowId, remainderLen), "0"));
	}

	/**
	 * 获取组合字段值的rowid
	 * 
	 * @param fieldValue
	 * @return
	 */
	public static String getHbaseRowId(List<String> fieldValues) {
		StringBuffer rowId = new StringBuffer();
		for (String fv : fieldValues) {
			rowId.append(ETLConstants.separator);
			rowId.append(fv);
		}
		return rowId.substring(1);
	}

	/**
	 * 清除增加的前缀
	 * 
	 * @param str
	 * @param remove
	 * @return
	 */
	public static String removeLeftPad(String str, String remove) {
		if (isEmpty(str) || isEmpty(remove)) {
			return str;
		}
		while (str.startsWith(remove)) {
			str = str.substring(remove.length());
		}
		return str;
	}

	/**
	 * 将List<String>,转换为以特定字符分隔字符串，如b1*b2*b3
	 * 
	 * @author zhangxuhui 2012-12-25 下午07:47:47
	 * @param al
	 * @param seprator
	 * @return
	 */
	public static String arraylistToStirng(List<String> al, String seprator) {
		StringBuilder out = new StringBuilder();

		for (String o : al) {
			out.append(o);
			out.append(seprator);
		}
		int lastindex = out.lastIndexOf(seprator);
		if (lastindex != -1) {
			return out.substring(0, lastindex);
		} else
			return "";

	}

	/**
	 * 判断字符串是否为空
	 * 
	 * @author zhangxuhui 2011-11-11 下午8:35:10
	 * @param str
	 * @return
	 */
	public static String checkStrNull(String str) {
		if (null == str || "null".equals(str.trim()) || str.trim().equals("0") || 0 == str.length())
			return "";
		else
			return str.trim();
	}

	/**
	 * 判断字符串是否为空（不判断是否为0，“null”）。为空则返回True，不为空则返回false
	 * 
	 * @author zhangxuhui 2011-11-11 下午8:35:17
	 * @param str
	 * @return
	 */
	public static boolean isNull(String str) {
		return (null == str || str.trim().length() == 0) ? true : false;
	}

	/**
	 * 判断字符串非空
	 * 
	 * @author zhangxuhui 2013-7-19 下午06:02:56
	 * @param str
	 * @return
	 */
	public static boolean isNotBlank(String str) {
		return !StringUtils.isBlank(str);
	}

	/**
	 * 判断字符串为空
	 * 
	 * @author zhangxuhui 2013-7-19 下午06:03:10
	 * @param str
	 * @return
	 */
	public static boolean isBlank(String str) {
		int strLen;
		if (str == null || (strLen = str.length()) == 0) {
			return true;
		}
		for (int i = 0; i < strLen; i++) {
			if ((Character.isWhitespace(str.charAt(i)) == false)) {
				return false;
			}
		}
		return true;
	}

	/**
	 * 格式化日期对象
	 * 
	 * @author zhangxuhui 2011-11-11 下午8:35:23
	 * @param strDate
	 *            格式化的日期
	 * @return 返回yyyy-MM-dd hh:mm:ss格式的字符串
	 */
	public static String getDateString(Date strDate) {
		SimpleDateFormat sdf = new SimpleDateFormat(ETLConstants.DATEFORMAT_YYYYMMDDHHMMSS);
		String str = "";
		try {
			if (null != strDate)
				return sdf.format(strDate);
		} catch (Exception ex) {
			return str;
		}
		return str;
	}

	/**
	 * 日期添加天数 并返回添加后的日期
	 * 
	 * @author zhangxuhui 2011-11-12 上午9:09:53
	 * @param d
	 *            日期
	 * @param offset
	 *            天数
	 * @return
	 */
	public static Date changeDay(Date d, int offset) {
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(d);
		calendar.set(Calendar.DAY_OF_YEAR, (calendar.get(Calendar.DAY_OF_YEAR) + offset));
		return calendar.getTime();
	}

	/**
	 * 把首字母变为大写
	 * 
	 * @author zhangxuhui 2011-11-12 上午9:10:10
	 * @param s
	 *            要改变的字符串
	 * @return
	 */
	public static String firstCharToUpper(String s) {
		switch (s.length()) {
		case 0:
			return null;
		case 1:
			return s.toUpperCase(Locale.US);
		default:
			return s = s.substring(0, 1).toUpperCase(Locale.US) + s.substring(1, s.length());
		}
	}

	/**
	 * 用符号切割字符串，返回包含符号的最后字符。<br>
	 * 如果所给字符串不包括符号则直接返回原字符串。<br>
	 * 如：cn.com.nxt.onesearch.domain.model.NewsInfo需要返回NewsInfo则<br>
	 * 调用getSubStrBuyChar("cn.com.nxt.onesearch.domain.model.NewsInfo",".")
	 * 
	 * @author zhangxuhui 2011-11-12 上午9:10:27
	 * @param str
	 *            要分割的字符串
	 * @param regex
	 *            分割的符号
	 * @return
	 */
	public static String getSubStrBuyChar(String str, String regex) {
		return str.contains(regex) ? str.split("\\" + regex)[str.split("\\" + regex).length - 1] : str;
	}

	/**
	 * 转换字符串为时间
	 * 
	 * @author zhangxuhui 2011-11-12 上午9:11:22
	 * @param dateStr
	 * @return
	 * @throws ParseException
	 */
	public static Date changeStr2Date(String dateStr) throws ParseException {
		return new SimpleDateFormat(ETLConstants.DATEFORMAT_YYYYMMDDHHMMSS).parse(dateStr);
	}

	/**
	 * 把毫秒转换为时间字符串
	 * 
	 * @author zhangxuhui 2011-11-12 上午9:11:30
	 * @param msel
	 * @return
	 */
	public static String changeLong2Str(long msel) {
		return new SimpleDateFormat(ETLConstants.DATEFORMAT_YYYYMMDDHHMMSS).format(new Date(msel));
	}

	/**
	 * 把毫秒数格式成要求的显示格式
	 * 
	 * @author zhangxuhui 2011-11-12 上午9:11:43
	 * @param second
	 *            毫秒数
	 * @return
	 */
	public static String second_tra(String second) {
		String str = "";
		int intnum = Integer.parseInt(second);
		intnum = intnum / 1000;
		if (intnum >= 60 && intnum < 3600) {
			double m = Math.floor(intnum / (double) 60);
			double s = intnum % 60;
			return (int) m + "分" + (int) s + "秒";
		} else if (intnum >= 3600) {
			double h = Math.floor(intnum / (double) 3600);
			double m = Math.floor((intnum % 3600) / (double) 60);
			double s = intnum % 60;
			str = (int) h + "小时" + (int) m + "分" + (int) s + "秒";
			return str;
		} else {
			str = (int) intnum + "秒";
			return str;
		}
	}

	/**
	 * 获得给定日期
	 * 
	 * @author zhangxuhui 2011-11-12 上午9:12:00
	 * @param strDate
	 *            格式化的日期
	 * @return 返回字符串
	 */
	public static String getDateToLongStr(Date strDate) {
		String str = "";
		try {
			if (null != strDate)
				return String.valueOf(strDate.getTime());
		} catch (Exception ex) {
		}
		return str;
	}

	/**
	 * 是否是整数
	 * 
	 * @author zhangxuhui 2011-11-12 上午9:27:13
	 * @param str
	 * @return
	 */
	public static boolean isInt(String str) {
		try {
			if (str == null) {
				return false;
			}
			Integer.parseInt(str.trim());
		} catch (NumberFormatException e) {
			return false;
		}
		return true;
	}

	/**
	 * 判断给定字符串是否是浮点数
	 * 
	 * @author zhangxuhui 2011-11-12 上午9:27:19
	 * @param str
	 * @return
	 */
	public static boolean isDouble(String str) {
		try {
			if (str == null) {
				return false;
			}
			Double.parseDouble(str.trim());
		} catch (NumberFormatException e) {
			return false;
		}
		return true;
	}

	/**
	 * 判断给定字符串是否是数字
	 * 
	 * @author zhangxuhui 2011-11-12 上午9:27:25
	 * @param str
	 * @return
	 */
	public static boolean isNumber(String str) {
		return isInt(str) || isDouble(str);

	}

	/**
	 * 判断字符串数组中是否含有某个字符串
	 * 
	 * @author zhangxuhui 2012-6-27 下午07:56:06
	 * @param strs
	 *            字符串数组
	 * @param str
	 *            匹配字符串
	 * @return
	 */
	public static boolean arrayIsHave(String[] strs, String str) {
		for (int i = 0; i < strs.length; i++) {
			if (strs[i].equalsIgnoreCase(str)) {
				return true;
			}
		}
		return false;
	}

	/**
	 * 判断字符串ArrayList中是否含有某个字符串
	 * 
	 * @author zhangxuhui 2012-6-28 上午09:53:09
	 * @param strs
	 *            字符串ArrayList
	 * @param str
	 *            匹配字符串
	 * @return
	 */
	public static boolean collectionIsHave(Collection<String> strs, String str) {
		for (int i = 0; i < strs.size(); i++) {
			if (strs.toArray()[i].toString().equalsIgnoreCase(str)) {
				return true;
			}
		}
		return false;
	}

	public static void main(String[] args) {
		// System.out.println(isFilefolder("dd《》.<>.jsp"));
		// System.out.println(isFilefolder("dd/d"));
		// System.out.println(isFilefolder("d:\\\\d\\d.text<>.jsp"));
		// StringUtils.getHBaseRowId("000161-1388316916750-苏D797M1      -2155363291");
//		List<String> ss = new ArrayList<String>();
//		ss.add("23");
//		ss.add("2");
//		ss.add("20");
//		System.out.println(getMaxListStringFromList(ss));
		System.out.println(getReverseRemainderRowId("00340034343434",5));
	}

	public static String delZero(String str) {
		return str.replaceFirst("^0*", "");
	}

	public static boolean isDigit(String param, String splitStr) {
		String[] pids = StringUtils.split(param, splitStr);
		for (String pid : pids) {
			if (!NumberUtils.isDigits(pid)) {
				return false;
			}
		}
		return true;
	}

	public static String getNullString(Object obj) {
		if (obj == null)
			return "";
		return obj.toString();
	}

	private static ObjectMapper mapper = new ObjectMapper();

	/**
	 * 从result获取字符串，null返回''
	 * 
	 * @param ur
	 * @param familyName
	 * @param qualifier
	 * @return
	 */
	public static String getStringValueFromResult(Result ur, byte[] familyName, String qualifier) {
		byte[] vb = ur.getValue(familyName, Bytes.toBytes(qualifier));
		if (vb == null) {
			return "";
		} else {
			return Bytes.toString(vb);
		}
	}

	/**
	 * 从result获取数字，null返回0
	 * 
	 * @param ur
	 * @param familyName
	 * @param qualifier
	 * @return
	 */
	public static int getIntValueFromResult(Result ur, byte[] familyName, String qualifier) {
		byte[] vb = ur.getValue(familyName, Bytes.toBytes(qualifier));
		if (vb == null) {
			return 0;
		} else {
			return NumberUtils.toInt(Bytes.toString(vb));
		}
	}
	
	public static float getFloatValueFromResult(Result ur, byte[] familyName, String qualifier) {
		byte[] vb = ur.getValue(familyName, Bytes.toBytes(qualifier));
		if (vb == null) {
			return 0;
		} else {
			return NumberUtils.toFloat(Bytes.toString(vb));
		}
	}

	public static long getLongValueFromResult(Result ur, byte[] familyName, String qualifier) {
		byte[] vb = ur.getValue(familyName, Bytes.toBytes(qualifier));
		if (vb == null) {
			return 0;
		} else {
			return NumberUtils.toLong(Bytes.toString(vb));
		}
	}

	public static Date getDateValueFromResult(Result ur, byte[] familyName, String qualifier, String pattern) {
		byte[] vb = ur.getValue(familyName, Bytes.toBytes(qualifier));
		if (vb == null) {
			return null;
		} else {
			return ETLDateUtils.parseDate(Bytes.toString(vb), pattern);
		}
	}

	public static List<String> getListStringFromResult(Result ur, byte[] familyName, String qualifier) {
		byte[] vb = ur.getValue(familyName, Bytes.toBytes(qualifier));
		if (vb == null) {
			return null;
		} else {
			try {
				return mapper.readValue(ur.getValue(familyName, Bytes.toBytes(qualifier)), new TypeReference<List<String>>() {
				});
			} catch (IOException e) {
				e.printStackTrace();
				return null;
			}
		}
	}

	public static List<String> getListStringFromStr(String field) {
		try {
			return mapper.readValue(field, new TypeReference<List<String>>() {
			});
		} catch (IOException e) {
			e.printStackTrace();
			return null;
		}
	}

	public static Map<String, Integer> getMapStringFromResult(Result ur, byte[] familyName, String qualifier) {
		byte[] vb = ur.getValue(familyName, Bytes.toBytes(qualifier));
		if (vb == null) {
			return null;
		} else {
			try {
				return mapper.readValue(ur.getValue(familyName, Bytes.toBytes(qualifier)), new TypeReference<Map<String, Integer>>() {
				});
			} catch (IOException e) {
				e.printStackTrace();
				return null;
			}
		}
	}

	public static Map<String, Integer> getMapStringFromStr(String ur) {
		try {
			return mapper.readValue(ur, new TypeReference<Map<String, Integer>>() {
			});
		} catch (IOException e) {
			e.printStackTrace();
			return null;
		}
	}

	public static List<Integer> getListIntFromResult(Result ur, byte[] familyName, String qualifier) {
		byte[] vb = ur.getValue(familyName, Bytes.toBytes(qualifier));
		if (vb == null) {
			return null;
		} else {
			try {
				return mapper.readValue(ur.getValue(familyName, Bytes.toBytes(qualifier)), new TypeReference<List<Integer>>() {
				});
			} catch (IOException e) {
				e.printStackTrace();
				return null;
			}
		}
	}


}
