package net.iharding.utils;



import java.io.DataInput;
import java.io.DataOutput;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import net.iharding.Constants;

import org.apache.hadoop.io.Writable;


/**
 * 时间范围和相关处理
 * @author admin
 *
 */
public class TimeRange implements Comparable<TimeRange>, Writable {
	private long startTime = 0L;
	private long endTime = 0L;
	
	public TimeRange(){
		
	}
	
	public TimeRange(long startTime, long endTime) {
		super();
		this.startTime = startTime;
		this.endTime = endTime;
	}

	public long getStartTime() {
		return startTime;
	}
	
	public String getStartDate() {		
		return HBDateUtils.formatDate(new Date(startTime),"yyyyMMdd");
	}
	
	public String getEndDate() {		
		return HBDateUtils.formatDate(new Date(endTime),"yyyyMMdd");
	}
	
	public String getEndNextDate() {
		 Calendar endCal=Calendar.getInstance(); 
		 endCal.setTime(new Date(endTime));
		 endCal.add(Calendar.DATE, 1);		
		 return HBDateUtils.formatDate( endCal.getTime(),"yyyyMMdd");
	}

	public void setStartTime(long startTime) {
		this.startTime = startTime;
	}
	
	public void setHourStartTime(String startDate,String hour) {
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMddHH");
		try {
			this.startTime = HBDateUtils.stringToDate(startDate+hour, dateFormat).getTime();
		} catch (ParseException e) {
			e.printStackTrace();
		}
	}
	
	public void setHourEndTime(String endDate,String hour) {
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMddHH");
		try {
			this.endTime = HBDateUtils.stringToDate(endDate+hour, dateFormat).getTime()+60*60*1000;
		} catch (ParseException e) {
			e.printStackTrace();
		}
	}
	
	public void setDateStartTime(String startDate) {
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMdd");
		try {
			this.startTime = HBDateUtils.stringToDate(startDate, dateFormat).getTime();
		} catch (ParseException e) {
			e.printStackTrace();
		}
	}
	
	public void setDateEndTime(String endDate) {
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMdd");
		try {			
			this.endTime =HBDateUtils.stringToDate(endDate, dateFormat).getTime();
		} catch (ParseException e) {
			e.printStackTrace();
		}
	}
	
	public void setMonthStartTime(String startMonth) {
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMM");
		try {
			this.startTime = HBDateUtils.stringToDate(startMonth, dateFormat).getTime();
		} catch (ParseException e) {
			e.printStackTrace();
		}
	}
	
	public void setMonthEndTime(String endMonth) {
		SimpleDateFormat dateFormat1 = new SimpleDateFormat("yyyyMM");
		try {
			endTime = HBDateUtils.stringToDate(endMonth, dateFormat1).getTime();
		} catch (ParseException e) {
			e.printStackTrace();
		}
	}

	public long getEndTime() {
		return endTime;
	}

	public void setEndTime(long endTime) {
		this.endTime = endTime;
	}
	
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + (int) (endTime ^ (endTime >>> 32));
		result = prime * result + (int) (startTime ^ (startTime >>> 32));
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		TimeRange other = (TimeRange) obj;
		if (endTime != other.endTime)
			return false;
		if (startTime != other.startTime)
			return false;
		return true;
	}
	
	public boolean isSeparateFrom(TimeRange range, boolean includeStart, boolean includeEnd){
		
		long startTime = range.getStartTime();
		long endTime = range.getEndTime();
		return (includeStart? (startTime >= this.endTime) : (startTime > this.endTime)) 
			|| (includeEnd? (endTime <= this.startTime) : (endTime < this.startTime));
	}

	@Override
	public String toString() {
		return "TimeRange [startTime=" + HBDateUtils.long2String(startTime) + ", endTime=" 
				+ HBDateUtils.long2String(endTime) + "]";
	}
	
	public String getTimeGap() {
		return this.startTime+Constants.separator+this.endTime;
	}
	
	public String getTimeGapStr() {
		return this.getStartMinute()+"/"+this.getEndMinute();
	}

	@Override
	public void write(DataOutput out) throws IOException {
		
		out.writeLong(this.startTime);
		out.writeLong(this.endTime);
	}

	@Override
	public void readFields(DataInput in) throws IOException {
		this.startTime = in.readLong();
		this.endTime = in.readLong();
	}

	@Override
	public int compareTo(TimeRange o) {		
		if(o == null){
			return 1;
		}
		return (int) (this.startTime - o.startTime);
	}

	public String getStartMonth() {
		 return HBDateUtils.formatDate(new Date(startTime),"yyyyMM");
	}
	
	public String getStartNextMonth() {
		 Calendar beginCal=Calendar.getInstance(); 
		 beginCal.setTime(new Date(startTime));
		 beginCal.add(Calendar.MONTH, 1);		
		 return HBDateUtils.formatDate( beginCal.getTime(),"yyyyMM");
	}
	
	public String getStartNextDate() {
		 Calendar beginCal=Calendar.getInstance(); 
		 beginCal.setTime(new Date(startTime));
		 beginCal.add(Calendar.DATE, 1);		
		 return HBDateUtils.formatDate( beginCal.getTime(),"yyyyMMdd");
	}
	
	public String getStartNextHour() {
		 Calendar beginCal=Calendar.getInstance(); 
		 beginCal.setTime(new Date(startTime));
		 beginCal.add(Calendar.HOUR, 1);		
		 return HBDateUtils.formatDate( beginCal.getTime(),"yyyyMMddHH");
	}
	
	public String getStartLastDate() {
		 Calendar beginCal=Calendar.getInstance(); 
		 beginCal.setTime(new Date(startTime));
		 beginCal.set(Calendar.DATE, beginCal.getActualMaximum(Calendar.DATE));  
		 beginCal.add(Calendar.DATE, 1);	//stoprow不包含当天
		 return HBDateUtils.formatDate( beginCal.getTime(),"yyyyMMdd");
	}
	
	public String getEndFirstDate() {
		 Calendar endCal=Calendar.getInstance(); 
		 endCal.setTime(new Date(endTime));
		 endCal.set(Calendar.DATE, endCal.getActualMinimum(Calendar.DATE));   
		 return HBDateUtils.formatDate( endCal.getTime(),"yyyyMMdd");
	}
	
	public Calendar getStartCalendarDate(){
		 Calendar c1 = Calendar.getInstance();
		 c1.setTime(new Date(startTime));
		 return c1;
	}
	
	public Calendar getEndCalendarDate(){
		 Calendar c2 = Calendar.getInstance();	        
	     c2.setTime(new Date(this.endTime));
	     return c2;
	}

	public boolean haveIntYear(){
		 int result = getEndCalendarDate().get(Calendar.YEAR) - getStartCalendarDate().get(Calendar.YEAR);
         return (result>=1);
	}
	
	/**
	 * 时间差是否包含完整月度差
	 * @return
	 */
	public boolean haveIntMonth(){
		 int result = getEndCalendarDate().get(Calendar.MONTH) - getStartCalendarDate().get(Calendar.MONTH);
         return (result>=1);
	}
	
	public boolean haveIntDate(){
		int result = getEndCalendarDate().get(Calendar.DATE) - getStartCalendarDate().get(Calendar.DATE);
        return (result>=1);
	}
	/**
	 *  时间差是否包含完整小时差
	 * @return
	 */
	public boolean haveIntHour(){
		int result = getEndCalendarDate().get(Calendar.HOUR_OF_DAY) - getStartCalendarDate().get(Calendar.HOUR_OF_DAY);
        return (result>=1);
	}
	

	public String getEndMonth() {
		return HBDateUtils.formatDate(new Date(endTime),"yyyyMM");
	}
	
	public String getStartTimeStr() {
		 return HBDateUtils.formatDate(new Date(startTime),Constants.DATE_FORMAT_SSS);
	}

	public String getEndTimeStr() {
		return HBDateUtils.formatDate(new Date(endTime),Constants.DATE_FORMAT_SSS);
	}
	
	public String getStartOnlyHour() {
		return HBDateUtils.formatDate(new Date(startTime),"HH");
	}

	public String getEndOnlyHour() {
		return HBDateUtils.formatDate(new Date(endTime),"HH");
	}
	
	public String getStartMinute() {
		return HBDateUtils.formatDate(new Date(startTime),"yyyy-MM-dd HH:mm:ss");
	}

	public String getEndMinute() {
		return HBDateUtils.formatDate(new Date(endTime),"yyyy-MM-dd HH:mm:ss");
	}

	public String getStartHour() {
		return HBDateUtils.formatDate(new Date(startTime),"yyyyMMddHH");
	}

	public String getEndHour() {
		return HBDateUtils.formatDate(new Date(endTime),"yyyyMMddHH");
	}
	
	public static TimeRange getHourTimeRange(String passtime) throws ParseException{
		TimeRange range=new TimeRange();
		SimpleDateFormat dateFormat = new SimpleDateFormat(Constants.DATE_FORMAT_SSS);
		Date theDate=HBDateUtils.stringToDate(passtime, dateFormat);
		range.setEndTime(HBDateUtils.stringToDate(HBDateUtils.formatDate(theDate, "yyyy-MM-dd HH")+":59:59.999",dateFormat).getTime());
		range.setStartTime(HBDateUtils.stringToDate(HBDateUtils.formatDate(theDate, "yyyy-MM-dd HH")+":00:00.000",dateFormat).getTime());
		return range;
	}
	
	public static TimeRange getDateTimeRange(String passtime) throws ParseException{
		TimeRange range=new TimeRange();
		SimpleDateFormat dateFormat = new SimpleDateFormat(Constants.DATE_FORMAT_SSS);
		Date theDate=HBDateUtils.stringToDate(passtime, dateFormat);
		range.setEndTime(HBDateUtils.stringToDate(HBDateUtils.formatDate(theDate, "yyyy-MM-dd ")+"23:59:59.999",dateFormat).getTime());
		range.setStartTime(HBDateUtils.stringToDate(HBDateUtils.formatDate(theDate, "yyyy-MM-dd ")+"00:00:00.000",dateFormat).getTime());
		return range;
	}
	
	public static TimeRange getMonthTimeRange(String passtime) throws ParseException{
		TimeRange range=new TimeRange();
		SimpleDateFormat dateFormat = new SimpleDateFormat(Constants.DATE_FORMAT_SSS);
		Date theDate=HBDateUtils.stringToDate(passtime, dateFormat);
		range.setEndTime(HBDateUtils.stringToDate(HBDateUtils.formatDate(HBDateUtils.lastDayOfMonth(theDate), "yyyy-MM-dd")+" 23:59:59.999",dateFormat).getTime());
		range.setStartTime(HBDateUtils.stringToDate(HBDateUtils.formatDate(theDate, "yyyy-MM")+"-01 00:00:00.000",dateFormat).getTime());
		return range;
	}
	
	public boolean isStartIntHour(){
		return HBDateUtils.formatDate(new Date(startTime),Constants.DATE_FORMAT_SSS).endsWith(":00:00.000");
	}
	
	public boolean isEndIntHour(){
		return HBDateUtils.formatDate(new Date(endTime),Constants.DATE_FORMAT_SSS).endsWith(":00:00.000");
	}
	
	public boolean isStartIntDate(){
		return HBDateUtils.formatDate(new Date(startTime),Constants.DATE_FORMAT_SSS).endsWith("00:00:00.000");
	}
	
	public boolean isEndIntDate(){
		return HBDateUtils.formatDate(new Date(endTime),Constants.DATE_FORMAT_SSS).endsWith("00:00:00.000");
	}
	
	public boolean isStartIntMonth(){
		return HBDateUtils.formatDate(new Date(startTime),Constants.DATE_FORMAT_SSS).endsWith("00 00:00:00.000");
	}
	
	public boolean isEndIntMonth(){
		return HBDateUtils.formatDate(new Date(endTime),Constants.DATE_FORMAT_SSS).endsWith("00 00:00:00.000");
	}

	public long getLastHourStartTime() {
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMddHH");
		try {
			return HBDateUtils.stringToDate(getStartHour(), dateFormat).getTime()+60*60*1000;
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return 0;
	}

	public long getStartHourEndTime() {
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMddHH");
		try {
			return HBDateUtils.stringToDate(this.getEndHour(), dateFormat).getTime();
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return 0;
	}
	
	public String getStartYear() {
		return  HBDateUtils.formatDate(new Date(startTime),"yyyy");
	}

	public String getEndYear() {
		return  HBDateUtils.formatDate(new Date(endTime),"yyyy");
	}

	public String getStartTimeSolrStr() {
		 return HBDateUtils.formatToSolrDate(new Date(startTime));
	}
	
	public String getEndTimeSolrStr() {
		 return HBDateUtils.formatToSolrDate(new Date(endTime));
	}
}

