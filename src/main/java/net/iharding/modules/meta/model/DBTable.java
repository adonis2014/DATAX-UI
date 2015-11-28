package net.iharding.modules.meta.model;

import javax.persistence.Entity;
import javax.persistence.Table;

import org.guess.core.orm.IdEntity;
import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;

/**
 * 数据表Entity
 * @author Joe.zhang
 * @version 2015-11-29
 */
@Entity
@Table(name = "meta_DBTable")
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
public class DBTable extends IdEntity {

	/**
	 * 表ID
	 */
	private Integer tableId;
	/**
	 * 数据源ID
	 */
	private Integer datasourceId;
	/**
	 * 表名
	 */
	private String tableName;
	/**
	 * 表中文名
	 */
	private String tablePName;
	/**
	 * 备注
	 */
	private String remark;
	/**
	 * 表类别
	 */
	private Integer tableType;
	
	public Integer getTableId() {
		return tableId;
	}

	public void setTableId(Integer tableId) {
		this.tableId = tableId;
	}
	
	public Integer getDatasourceId() {
		return datasourceId;
	}

	public void setDatasourceId(Integer datasourceId) {
		this.datasourceId = datasourceId;
	}
	
	public String getTableName() {
		return tableName;
	}

	public void setTableName(String tableName) {
		this.tableName = tableName;
	}
	
	public String getTablePName() {
		return tablePName;
	}

	public void setTablePName(String tablePName) {
		this.tablePName = tablePName;
	}
	
	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}
	
	public Integer getTableType() {
		return tableType;
	}

	public void setTableType(Integer tableType) {
		this.tableType = tableType;
	}
	
	
}