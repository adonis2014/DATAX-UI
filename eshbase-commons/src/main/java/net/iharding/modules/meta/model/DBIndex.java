package net.iharding.modules.meta.model;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.Table;

import net.iharding.core.orm.IdEntity;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;

/**
 * 索引对象Entity
 * @author Joe.zhang
 * @version 2015-12-08
 */
@Entity
@Table(name = "meta_dbindex")
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
public class DBIndex extends IdEntity {

	/**
	 * 数据表
	 */
	private DBTable dbtable;
	/**
	 * 索引库名
	 */
	private String index_name;
	/**
	 * 索引表名
	 */
	private String type_name;
	/**
	 * 索引类别
	 */
	private Integer indexType;
	/**
	 * 建立者
	 */
	private Long createbyId;
	/**
	 * 更新者
	 */
	private Long updatebyId;
	/**
	 * 建立世间
	 */
	private Date createDate;
	/**
	 * 更新世间
	 */
	private Date updateDate;
	/**
	 * 备注
	 */
	private String remark;
	
	public DBTable getDbtable() {
		return dbtable;
	}

	public void setDbtable(DBTable dbtable) {
		this.dbtable = dbtable;
	}
	
	public String getIndex_name() {
		return index_name;
	}

	public void setIndex_name(String index_name) {
		this.index_name = index_name;
	}
	
	public String getType_name() {
		return type_name;
	}

	public void setType_name(String type_name) {
		this.type_name = type_name;
	}
	
	public Integer getIndexType() {
		return indexType;
	}

	public void setIndexType(Integer indexType) {
		this.indexType = indexType;
	}
	
	public Long getCreatebyId() {
		return createbyId;
	}

	public void setCreatebyId(Long createbyId) {
		this.createbyId = createbyId;
	}
	
	public Long getUpdatebyId() {
		return updatebyId;
	}

	public void setUpdatebyId(Long updatebyId) {
		this.updatebyId = updatebyId;
	}
	
	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	
	public Date getUpdateDate() {
		return updateDate;
	}

	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}
	
	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}
	
	
}