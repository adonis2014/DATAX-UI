package net.iharding.modules.meta.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

import net.iharding.core.orm.IdEntity;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;

/**
 * 元数据关注Entity
 * @author Joe.zhang
 * @version 2016-05-18
 */
@Entity
@Table(name = "meta_property")
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
public class MetaProperty extends IdEntity {

	/**
	 * 属性Key
	 */
	@Column(name = "property_key")
	private String propertyKey;
	/**
	 * 属性值
	 */
	@Column(name = "property_value")
	private String propertyValue;
	/**
	 * 关联对象类别
	 */
	@Column(name = "ref_type")
	private Integer refType;
	/**
	 * 关联对象Id
	 */
	@Column(name = "ref_id")
	private Long refId;
	/**
	 * 备注
	 */
	private String remark;
	
	public String getPropertyKey() {
		return propertyKey;
	}

	public void setPropertyKey(String propertyKey) {
		this.propertyKey = propertyKey;
	}
	
	public String getPropertyValue() {
		return propertyValue;
	}

	public void setPropertyValue(String propertyValue) {
		this.propertyValue = propertyValue;
	}
	
	public Integer getRefType() {
		return refType;
	}

	public void setRefType(Integer refType) {
		this.refType = refType;
	}
	
	public Long getRefId() {
		return refId;
	}

	public void setRefId(Long refId) {
		this.refId = refId;
	}
	
	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}
	
	
}