package net.iharding.utils;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Locale;
import java.util.TimeZone;

import net.iharding.Constants;

import org.apache.commons.lang.time.DateUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;


public class HBDateUtils extends DateUtils {

	private static final Logger log = LoggerFactory
			.getLogger(HBDateUtils.class);

	public static final Date invalidateDate = parseDate("1970-09-01",
			"yyyy-MM-dd");

	public static long parse(String date) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		try {
			return sdf.parse(date).getTime();
		} catch (ParseException e) {
			e.printStackTrace();
			return 0;
		}
	}

	/**
	 * 计算两个日期之间相差的天数
	 * 
	 * @param smdate
	 *            较小的时间
	 * @param bdate
	 *            较大的时间
	 * @return 相差天数
	 * @throws ParseException
	 */
	public static int daysBetween(Date smdate, Date bdate)
			throws ParseException {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		smdate = sdf.parse(sdf.format(smdate));
		bdate = sdf.parse(sdf.format(bdate));
		Calendar cal = Calendar.getInstance();
		cal.setTime(smdate);
		long time1 = cal.getTimeInMillis();
		cal.setTime(bdate);
		long time2 = cal.getTimeInMillis();
		long between_days = (time2 - time1) / (1000 * 3600 * 24);

		return Integer.parseInt(String.valueOf(between_days));
	}

	/**
	 * 字符串的日期格式的计算
	 */
	public static int daysBetween(String smdate, String bdate)
			throws ParseException {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Calendar cal = Calendar.getInstance();
		cal.setTime(sdf.parse(smdate));
		long time1 = cal.getTimeInMillis();
		cal.setTime(sdf.parse(bdate));
		long time2 = cal.getTimeInMillis();
		long between_days = (time2 - time1) / (1000 * 3600 * 24);

		return Integer.parseInt(String.valueOf(between_days));
	}

	public static long parseLong(String date, String pattern)
			throws ParseException {
		SimpleDateFormat sdft = new SimpleDateFormat(pattern);
		return sdft.parse(date).getTime();
	}

	public static long parse(String date, String pattern) {

		SimpleDateFormat sdft = new SimpleDateFormat(pattern);
		try {
			return sdft.parse(date).getTime();
		} catch (ParseException e) {
			e.printStackTrace();
			return 0;
		}
	}

	public static String formatDate(Date date, String datePattern) {
		SimpleDateFormat dateFormat = new SimpleDateFormat(datePattern);
		return dateFormat.format(date);
	}

	public static String formatToSolrDate(Date date) {
		SimpleDateFormat dateFormat = new SimpleDateFormat(Constants.DATE_FORMAT_SSS);
		String[] strs = HBStringUtils.split(dateFormat.format(date), " ");
		return strs[0] + "T" + strs[1] + "Z";
	}

	public static String formatToSolrDate(String date) {
		String[] strs = HBStringUtils.split(date, " ");
		return strs[0] + "T" + strs[1] + "Z";
	}

	public static Date parseDate(String dateStr, String pattern) {
		try {
			SimpleDateFormat dateFormat = new SimpleDateFormat(pattern);
			Date date = dateFormat.parse(dateStr);
			return date;
		} catch (ParseException e) {
			log.error("时间格式处理错误!", e.getMessage());
			return null;
		}
	}

	/**
	 * 将UTC时间转换为东八区时间
	 * 
	 * @param UTCTime
	 * @return
	 */
	public static String getLocalTimeFromUTC(String UTCTime, String pattern) {
		java.util.Date UTCDate = null;
		String localTimeStr = null;
		SimpleDateFormat dateFormat = new SimpleDateFormat(pattern);
		try {
			UTCDate = dateFormat.parse(UTCTime);
			dateFormat.setTimeZone(TimeZone.getTimeZone("GMT-8"));
			localTimeStr = dateFormat.format(UTCDate);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return localTimeStr;
	}

	/**
	 * 
	 * @author zhangxuhui 2013-3-9 上午10:42:52
	 * @param beforeFormart
	 * @param afterFormart
	 * @param dateStr
	 * @return
	 * @throws ParseException
	 */
	public static String getUTC(String beforeFormart, String afterFormart,
			String dateStr) throws ParseException {
		SimpleDateFormat be = new SimpleDateFormat(beforeFormart, Locale.US);
		Date date = be.parse(dateStr);

		SimpleDateFormat af = new SimpleDateFormat(afterFormart, Locale.US);
		af.setTimeZone(TimeZone.getTimeZone("UTC"));
		String dateUtc = af.format(date);
		return dateUtc;
	}

	/**
	 * 转换时区，组装为YYYY-MM-DDTHH:mm:ssZ格式
	 * 
	 * @author zhangxuhui 2012-11-29 下午04:45:26
	 * @param time
	 * @param dateFormat
	 * @return
	 * @throws ParseException
	 */
	public static String getTimeStr(String time, SimpleDateFormat dateFormat)
			throws ParseException {
		Date startDate = stringToDate(time, dateFormat);
		String timeStr = dateAddHours(startDate, Constants.GMT_TIME, dateFormat);
		String[] startTime = timeStr.split(" ");
		String startTimeStr = startTime[0] + "T" + startTime[1] + "Z";
		return startTimeStr;
	}

	/**
	 * 时间小时数增加或减少
	 * 
	 * @author zhangxuhui 2012-8-10 下午04:22:17
	 * @param time
	 * @param hours
	 * @param dateFormat
	 * @return
	 */
	public static String dateAddHours(Date time, int hours,
			SimpleDateFormat dateFormat) {
		long timeLong = time.getTime() / 1000 + 60l * 60 * hours;
		time.setTime(timeLong * 1000);
		String timeStr = dateFormat.format(time);
		return timeStr;
	}

	/**
	 * TZ格式转换为普通格式
	 * 
	 * @author zhangxuhui 2013-6-9 上午10:51:02
	 * @param dateStr
	 * @param dateFormat
	 * @param beforeTimeZone
	 * @param afterTimeZone
	 * @return
	 * @throws ParseException
	 */
	public static String getTzToGmt(String dateStr, String dateFormat,
			String beforeTimeZone, String afterTimeZone) throws ParseException {
		SimpleDateFormat sdfBefore = new SimpleDateFormat(dateFormat);
		sdfBefore.setTimeZone(TimeZone.getTimeZone(beforeTimeZone));
		SimpleDateFormat sdfAfter = new SimpleDateFormat(dateFormat);
		sdfAfter.setTimeZone(TimeZone.getTimeZone(afterTimeZone));
		Date date = stringToDate(dateStr, sdfBefore);
		String dateGmtEight = sdfAfter.format(date);
		return dateGmtEight;
	}

	/**
	 * 判断开始时间是否大于结束时间
	 * 
	 * @author zhangxuhui 2013-7-15 下午02:48:41
	 * @param start
	 * @param end
	 * @param dateFormat
	 * @return
	 * @throws ParseException
	 */
	public static boolean dateCheck(String start, String end,
			SimpleDateFormat dateFormat) throws ParseException {
		boolean flag = true;
		Date startDate = stringToDate(start, dateFormat);
		Date endDate = stringToDate(end, dateFormat);
		if (startDate.after(endDate)) {
			flag = false;
		}
		return flag;
	}

	/**
	 * 搜索时获取开始时间
	 * 
	 * @author zhangxuhui 2013-7-15 下午02:11:27
	 * @param start
	 * @param init
	 * @param keep
	 * @return
	 * @throws ParseException
	 */
	public static String getSearchStartDate(String start, String init,
			String keep, SimpleDateFormat dateFormat) throws ParseException {
		String startDate = start;
		Date startDay = stringToDate(start, dateFormat);
		Date judgeDay = dateCompare(init, keep, dateFormat);
		if (startDay.before(judgeDay)) {
			startDate = dateFormat.format(judgeDay);
		}
		return startDate;
	}

	/**
	 * 搜索时获取结束时间
	 * 
	 * @author zhangxuhui 2013-7-15 下午02:09:21
	 * @param time
	 * @param dateFormat
	 * @return
	 * @throws ParseException
	 */
	public static String getEndDate(String time, SimpleDateFormat dateFormat)
			throws ParseException {
		Date nowDate = new Date();
		Date timeDate = stringToDate(time, dateFormat);
		String endDate = "";
		if (timeDate.after(nowDate)) {
			endDate = dateFormat.format(nowDate);
		} else {
			endDate = dateFormat.format(timeDate);
		}
		return endDate;
	}

	/**
	 * 字符串转换为日期格式
	 * 
	 * @author zhangxuhui 2012-8-10 下午04:23:55
	 * @param dateStr
	 * @param dateFormat
	 * @return
	 */
	public static Date stringToDate(String dateStr, SimpleDateFormat dateFormat)
			throws ParseException {
		Date date = dateFormat.parse(dateStr);
		return date;
	}

	/**
	 * 比较时间，并返回最大时间
	 * 
	 * @author zhangxuhui 2013-7-11 下午04:56:25
	 * @return
	 * @throws ParseException
	 */
	public static String dateCompare(String initDateStr, String keepDateStr,
			String dateFormat) throws ParseException {
		String returnVal = "";
		SimpleDateFormat sdf = new SimpleDateFormat(dateFormat);
		Date initDate = stringToDate(initDateStr, sdf);
		Date keepDate = stringToDate(keepDateStr, sdf);
		if (initDate.after(keepDate)) {
			returnVal = sdf.format(initDate);
		} else {
			returnVal = sdf.format(keepDate);
		}
		return returnVal;
	}

	public static boolean dateCompare(String initDateStr, String keepDateStr)
			throws ParseException {
		SimpleDateFormat sdf = new SimpleDateFormat(Constants.DATE_FORMAT_SSS);
		Date initDate = stringToDate(initDateStr, sdf);
		Date keepDate = stringToDate(keepDateStr, sdf);
		if (initDate.after(keepDate)) {
			return false;
		} else {
			return true;
		}
	}

	/**
	 * 比较时间，并返回最大时间
	 * 
	 * @author zhangxuhui 2013-7-11 下午04:56:25
	 * @return
	 * @throws ParseException
	 */
	public static Date dateCompare(String initDateStr, String keepDateStr,
			SimpleDateFormat sdf) throws ParseException {
		Date initDate = stringToDate(initDateStr, sdf);
		Date keepDate = stringToDate(keepDateStr, sdf);
		if (initDate.after(keepDate)) {
			return initDate;
		} else {
			return keepDate;
		}
	}

	public static Date lastDayOfMonth(Date date) {
		Calendar cal = Calendar.getInstance();
		cal.setTime(date);
		int value = cal.getActualMaximum(Calendar.DAY_OF_MONTH);
		cal.set(Calendar.DAY_OF_MONTH, value);
		return cal.getTime();
	}

	public static String long2String(long t) {

		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd  HH:mm:ss");
		return sdf.format(new Date(t));
	}

	public static String long2StringPerDay(long t) {

		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		return sdf.format(new Date(t));
	}

	public static String long2String(long startTime, String pattern) {
		SimpleDateFormat sdf = new SimpleDateFormat(pattern);
		return sdf.format(new Date(startTime));
	}

	public static String long2StringPerDay(long t, SimpleDateFormat sdf) {

		return sdf.format(new Date(t));
	}

	public static boolean ifShouldDelete(String start, String initDateStr,
			String keepDateStr, SimpleDateFormat sdf) throws ParseException {

		Date startDay = stringToDate(start, sdf);
		Date initDate = stringToDate(initDateStr, new SimpleDateFormat(
				"yyyy-MM-dd"));
		Date keepDate = stringToDate(keepDateStr, sdf);
		if (startDay.before(initDate) || startDay.before(keepDate)) {
			return true;
		}
		return false;
	}

	/**
	 * 时间天数增加或减少
	 * 
	 * @author zhangxuhui 2012-8-10 下午04:22:17
	 * @param time
	 * @param hours
	 * @param dateFormat
	 * @return
	 */
	public static String dateAddDays(Date time, int days, String dateFormat) {
		SimpleDateFormat sdf = new SimpleDateFormat(dateFormat);
		long timeLong = time.getTime() / 1000 + 60l * 60 * 24 * days;
		time.setTime(timeLong * 1000);
		String timeStr = sdf.format(time);
		return timeStr;
	}

	/**
	 * 判断时间是否在一个时间区间内
	 * 
	 * @author zhangxuhui 2012-11-29 上午10:16:57
	 * @param rangeStr
	 * @param coreStr
	 * @return
	 * @throws ParseException
	 */
	public static boolean compareDate(String rangeStr, String coreStr)
			throws ParseException {
		SimpleDateFormat dateFormat = new SimpleDateFormat(
				Constants.DATE_FORMAT);
		boolean flag = false;
		Date coreDate = stringToDate(coreStr, dateFormat);
		String[] rangeStrArr = rangeStr.split(",");
		Date rangeDateMin = stringToDate(rangeStrArr[0], dateFormat);
		Date raneDateMax = stringToDate(rangeStrArr[1], dateFormat);
		if ((coreDate.after(rangeDateMin) && coreDate.before(raneDateMax))
				|| coreDate.equals(rangeDateMin)) {
			flag = true;
		}
		return flag;
	}

	/**
	 * 时间天数增加或减少
	 * 
	 * @author zhangxuhui 2012-8-10 下午04:22:17
	 * @param time
	 * @param hours
	 * @param dateFormat
	 * @return
	 */
	public static String dateAddDays(Date time, int days,
			SimpleDateFormat dateFormat) {
		long timeLong = time.getTime() / 1000 + 60l * 60 * 24 * days;
		time.setTime(timeLong * 1000);
		String timeStr = dateFormat.format(time);
		return timeStr;
	}

	public static String convertDateFormat(String date,
			SimpleDateFormat formatBefore, SimpleDateFormat formatAfter)
			throws ParseException {
		String convertDateStr = formatAfter.format(formatBefore.parse(date));
		return convertDateStr;
	}

}
