package net.iharding.modules.sys.model;

import javax.persistence.Entity;
import javax.persistence.Table;

import net.iharding.core.orm.IdEntity;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;

/**
 * 数据字典Entity
 * @author Joe.zhang
 * @version 2015-12-23
 */
@Entity
@Table(name = "sys_dict")
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
public class Dict extends IdEntity {

	/**
	 * 字典类别
	 */
	private Long codeType;
	/**
	 * 实际值
	 */
	private String codeValue;
	/**
	 * 显示名
	 */
	private String codeName;
	/**
	 * 排序id
	 */
	private Integer sortId;
	/**
	 * 备注
	 */
	private String remark;
	
	public Long getCodeType() {
		return codeType;
	}

	public void setCodeType(Long codeType) {
		this.codeType = codeType;
	}
	
	public String getCodeValue() {
		return codeValue;
	}

	public void setCodeValue(String codeValue) {
		this.codeValue = codeValue;
	}
	
	public String getCodeName() {
		return codeName;
	}

	public void setCodeName(String codeName) {
		this.codeName = codeName;
	}
	
	public Integer getSortId() {
		return sortId;
	}

	public void setSortId(Integer sortId) {
		this.sortId = sortId;
	}
	
	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}
	
	
}