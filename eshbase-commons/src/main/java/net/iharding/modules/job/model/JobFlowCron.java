package net.iharding.modules.job.model;

public class JobFlowCron extends JobFlow {
	private String strategy;
	private String crondate;
	private String crontime;
	private String cronutc;
	private String cronrepeat="0";
	private String cronrepeatimes;
	private String cronunit;
	private String isLast;//是否最后一天

	private String remark;
	
	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public String getIsLast() {
		return isLast;
	}

	public void setIsLast(String isLast) {
		this.isLast = isLast;
	}

	public String getStrategy() {
		return strategy;
	}

	public void setStrategy(String strategy) {
		this.strategy = strategy;
	}

	public String getCrondate() {
		return crondate;
	}

	public void setCrondate(String crondate) {
		this.crondate = crondate;
	}

	public String getCrontime() {
		return crontime;
	}

	public void setCrontime(String crontime) {
		this.crontime = crontime;
	}

	public String getCronutc() {
		return cronutc;
	}

	public void setCronutc(String cronutc) {
		this.cronutc = cronutc;
	}

	public String getCronrepeat() {
		return cronrepeat;
	}

	public void setCronrepeat(String cronrepeat) {
		this.cronrepeat = cronrepeat;
	}

	public String getCronrepeatimes() {
		return cronrepeatimes;
	}

	public void setCronrepeatimes(String cronrepeatimes) {
		this.cronrepeatimes = cronrepeatimes;
	}

	public String getCronunit() {
		return cronunit;
	}

	public void setCronunit(String cronunit) {
		this.cronunit = cronunit;
	}

}
