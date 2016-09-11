package net.iharding.modules.job.model;

import javax.persistence.Entity;
import javax.persistence.Table;

import net.iharding.core.orm.IdEntity;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;

/**
 * 流程节点类Entity
 * @author Joe.zhang
 * @version 2016-09-10
 */
@Entity
@Table(name = "job_jobActivityClass")
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
public class JobActivityClass extends IdEntity {

	/**
	 * spring code
	 */
	private String code;
	/**
	 * 名称
	 */
	private String name;
	/**
	 * 参数
	 */
	private String params;
	/**
	 * 方法名
	 */
	private String methodName;
	/**
	 * 输出数据
	 */
	private String output;
	/**
	 * 备注
	 */
	private String remark;
	
	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}
	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	public String getParams() {
		return params;
	}

	public void setParams(String params) {
		this.params = params;
	}
	
	public String getMethodName() {
		return methodName;
	}

	public void setMethodName(String methodName) {
		this.methodName = methodName;
	}
	
	public String getOutput() {
		return output;
	}

	public void setOutput(String output) {
		this.output = output;
	}
	
	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}
	
	
}