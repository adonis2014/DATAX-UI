package net.iharding.modules.meta.model;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.Table;

import org.guess.core.orm.IdEntity;
import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;

/**
 * 表对象Entity
 * @author Joe.zhang
 * @version 2015-12-01
 */
@Entity
@Table(name = "meta_Table")
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
public class DBTable extends IdEntity {

	/**
	 * 数据源ID
	 */
	private Long datasourceId;
	/**
	 * 表名
	 */
	private String tableName;
	/**
	 * 逻辑名
	 */
	private String tablePname;
	/**
	 * 表类别
	 */
	private Integer tableType;
	/**
	 * 备注
	 */
	private String remark;
	/**
	 * 最后更新人
	 */
	private Long updatebyId;
	/**
	 * 建立人
	 */
	private Long createbyId;
	/**
	 * 最后更新时间
	 */
	private Date updateDate;
	/**
	 * 建立时间
	 */
	private Date createDate;
	
	public Long getDatasourceId() {
		return datasourceId;
	}

	public void setDatasourceId(Long datasourceId) {
		this.datasourceId = datasourceId;
	}
	
	public String getTableName() {
		return tableName;
	}

	public void setTableName(String tableName) {
		this.tableName = tableName;
	}
	
	public String getTablePname() {
		return tablePname;
	}

	public void setTablePname(String tablePname) {
		this.tablePname = tablePname;
	}
	
	public Integer getTableType() {
		return tableType;
	}

	public void setTableType(Integer tableType) {
		this.tableType = tableType;
	}
	
	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}
	
	public Long getUpdatebyId() {
		return updatebyId;
	}

	public void setUpdatebyId(Long updatebyId) {
		this.updatebyId = updatebyId;
	}
	
	public Long getCreatebyId() {
		return createbyId;
	}

	public void setCreatebyId(Long createbyId) {
		this.createbyId = createbyId;
	}
	
	public Date getUpdateDate() {
		return updateDate;
	}

	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}
	
	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	
	
}