package net.iharding.utils;


/**
 * 自己维护的序列号，至少从1开始增长
 */
public abstract class IncrementNumber {
	
	public IncrementNumber() {}
	
	public IncrementNumber(long interval, long maxNum) {
		this.interval = interval;
		this.maxNum = maxNum;
	}
	
	public synchronized long cal()  {
		if (serialNum == -1) {
			serialNum = initStartNum(); // 已经使用的序列号一定 小于 缓存的序列号
			intervalMax = serialNum + interval;
			updateStartNum(intervalMax);
			return serialNum;
		}
		if (isMax(serialNum)) { // 达到预定的最大值
			resetSerialNum();
			return serialNum;
		}
		serialNum++;
		if (serialNum >= (intervalMax - 1)) { // 到达区间最大值
			intervalMax += interval;
			updateStartNum(intervalMax);
		}
		return serialNum;
	}
	
	/**
	 * 初始化序列号，从缓存系统中来，比如数据库、文件等
	 * @return 初始序列号
	 * @throws Exception
	 */
	public abstract long initStartNum() ;
	
	/**
	 * 更新区间最大值到缓存系统，比如数据库、文件中。
	 * @param intervalMax 区间最大值
	 * @throws Exception
	 */
	public abstract void updateStartNum(long intervalMax) ;
	
	/**
	 * 重置序列号，从1开始
	 */
	protected void resetSerialNum()  {
		this.serialNum = 1;
		intervalMax = serialNum + interval;
		updateStartNum(intervalMax);
	}
	
	/**
	 * 是否是最大值
	 * @param num
	 * @return
	 */
	private boolean isMax(long num) {
		return num >= maxNum;
	}
	
	public long getInterval() {
		return this.interval;
	}
	
	public long getMaxNum() {
		return this.maxNum;
	}
	
	/** 区间最大值 */
	protected long intervalMax = 0;
	
	/** 每次增加量 */
	protected long interval = 1000;
	
	/** 预定的最大值 */
	protected long maxNum = Long.MAX_VALUE;
	
	/** 序列号 */
	protected long serialNum = -1;
	
	protected String tableName;
	
	protected String dictName;
}
