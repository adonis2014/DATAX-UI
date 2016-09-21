package net.iharding.modules.meta.datamodel;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;

import net.iharding.core.orm.IdEntity;

/**
 * 数据模型
 * @author zhangxuhui
 *
 */
@Entity
@Table(name = "meta_data_model")
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
public class DataModel extends IdEntity {
	
	@Column(name = "model_name")
	private String modelName;

	@Column(name = "fact_table")
	private String factTable;
	
	@Column(name = "datasource_id")
	private Long datasourceId;
	
	@Column(name = "remark")
	private String remark;
	
	@Column(name = "json")
	private String json;

	public String getModelName() {
		return modelName;
	}

	public void setModelName(String modelName) {
		this.modelName = modelName;
	}

	public String getFactTable() {
		return factTable;
	}

	public void setFactTable(String factTable) {
		this.factTable = factTable;
	}

	public Long getDatasourceId() {
		return datasourceId;
	}

	public void setDatasourceId(Long datasourceId) {
		this.datasourceId = datasourceId;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public String getJson() {
		return json;
	}

	public void setJson(String json) {
		this.json = json;
	}
	
	
}
