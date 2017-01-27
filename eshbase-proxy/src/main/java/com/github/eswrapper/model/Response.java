package com.github.eswrapper.model;


import java.util.ArrayList;
import java.util.List;

import com.github.eswrapper.util.Constants;


/**
 * <b>应用层接口调用返回值类</b> <br>
 * 一般Response的start()方法和endXXX()方法配对使用<br>
 * 
 * <b>Data</b>属性说明： <br>
 * 
 * 
 * @author: zhangxuhui
 * @date: 15-7-30 上午11:11
 */
public class Response<T> implements java.io.Serializable{

	
	private static final long serialVersionUID = 1910717693392643012L;
	private String id = ""; // Response ID
	private long startTime = Constants.INVALIDATE_VALUE; // 起始时间
	private long endTime = Constants.INVALIDATE_VALUE; // 结束时间
	private long start = Constants.INVALIDATE_VALUE; // 数据起始位置
	private long total = Constants.INVALIDATE_VALUE; // 数据总数
	private long consuming=0l;//消耗时间
	private String version = "1.0";
	@SuppressWarnings("unused")
	private String allMessages="";
	private List<String> messages = new ArrayList<String>(); // 消息列表，如果中间有出错，会有消息显示在这里
	private String msg = "";
	public T data = null; // 序列化后的结果数据
	private int status;
	private int fromCache=0;//来自缓存

	public void setAllMessages(String allMessages) {
		this.allMessages = allMessages;
	}

	public Response() {
		super();
	}

	public long getConsuming() {
		return consuming;
	}

	public int getFromCache() {
		return fromCache;
	}

	public void setFromCache(int fromCache) {
		this.fromCache = fromCache;
	}

	public void setConsuming(long consuming) {
		this.consuming = consuming;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public String getId() {
		return id;
	}

	public Response<T> setId(String id) {
		this.id = id;
		return this;
	}

	public String getVersion() {
		return version;
	}

	public void setVersion(String version) {
		this.version = version;
	}

	public long getStartTime() {
		return startTime;
	}

	public Response<T> setStartTime(long startTime) {
		this.startTime = startTime;
		return this;
	}

	public long getEndTime() {
		return endTime;
	}

	public Response<T> setEndTime(long endTime) {
		this.endTime = endTime;
		return this;
	}

	public List<String> getMessages() {
		return messages;
	}

	public String getAllMessages() {
		StringBuffer sb = new StringBuffer();
		for (String message : messages) {
			sb.append("\n" + message);
		}
		return sb.toString();
	}

	public Response<T> setMessages(List<String> messages) {
		this.messages = messages;
		return this;
	}

	public T getData() {
		return data;
	}

	public void setData(T data) {
		this.data = data;
	}

	/**
	 * 获取数据起始位置
	 * 
	 * @return
	 */
	public long getStartIndex() {
		return start;
	}

	/**
	 * 设置数据起始位置
	 * 
	 * @param start
	 */
	public void setStartIndex(long start) {
		this.start = start;
	}

	public long getStart() {
		return start;
	}

	public void setStart(long start) {
		this.start = start;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	/**
	 * 设置数据总数
	 * 
	 * @return
	 */
	public long getTotal() {
		return total;
	}

	/**
	 * 获取数据总数
	 * 
	 * @param total
	 */
	public void setTotal(long total) {
		this.total = total;
	}

	/**
	 * 设置状态和起始时间，表示操作正在进行
	 */
	public Response<T> start() {
		this.setStatus(Constants.STATUS_RUNNING);
		this.setStartTime(System.currentTimeMillis());
		return this;
	}

	/**
	 * 设置状态和时间，表示操作结束，没有失败
	 */
	public Response<T> end() {
		if (messages.size() == 0) {
			status = Constants.STATUS_OK;
		} else {
			this.setStatus(status);
		}
		this.setEndTime(System.currentTimeMillis());
		this.consuming=this.endTime-this.startTime;
		return this;
	}
	
	public Response<T> copyResponse(){
		Response<T> rm=new Response<T>();
		rm.setId(this.id);
		rm.setEndTime(this.endTime);
		rm.setStartTime(this.startTime);
		rm.setMessages(this.messages);
		rm.setMsg(this.msg);
		rm.setStart(this.start);
		rm.setStatus(this.status);
		rm.setTotal(this.total);
		rm.setVersion(this.version);
		rm.setConsuming(this.consuming);
		return rm;
	}

	/**
	 * 设置状态和时间，表示操作结束，并且失败
	 */
	public Response<T> endAndFailed() {
		this.setStatus(Constants.STATUS_FAIL);
		this.setEndTime(System.currentTimeMillis());
		this.consuming=this.endTime-this.startTime;
		return this;
	}

	@Override
	public String toString() {
		return "Response{" + "status=" + status + ", id='" + id + '\'' + ", startTime=" + startTime + ", endTime=" + endTime + ", start=" + start + ", total=" + total
				+ ", messages=" + messages + ", data=" + data + '}';
	}

	public void error(String message) {
		this.messages.add(message);
		
	}
}

