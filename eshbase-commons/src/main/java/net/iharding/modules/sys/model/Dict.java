package net.iharding.modules.sys.model;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OrderBy;
import javax.persistence.Table;

import net.iharding.core.orm.IdEntity;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import org.hibernate.annotations.NotFound;
import org.hibernate.annotations.NotFoundAction;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

/**
 * 数据字典Entity
 * @author Joe.zhang
 * @version 2015-12-23
 */
@Entity
@Table(name = "sys_dict")
@JsonIgnoreProperties(value = { "parent" })
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
public class Dict extends IdEntity {

	
	/**
	 * 实际值
	 */
	@Column(name="code_value")
	private String codeValue;
	/**
	 * 显示名
	 */
	@Column(name="code_name")
	private String codeName;
	/**
	 * 排序id
	 */
	@Column(name="sort_id")
	private Integer sortId;
	/**
	 * 备注
	 */
	private String remark;
	
	/** 父资源 */
	@ManyToOne(targetEntity = Dict.class,fetch = FetchType.LAZY)
    @JoinColumn(name = "code_type",updatable=false,insertable=false)
    @NotFound(action=NotFoundAction.IGNORE)
	@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
	private Dict parent;
	/** 子资源 */
	@OneToMany(targetEntity=Dict.class,fetch = FetchType.LAZY,cascade=CascadeType.ALL)
	@JoinColumn(name="code_type",updatable=false,insertable=false)
	@OrderBy("sort_id ASC")
	/*@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)*/
	private List<Dict> childDict;
	
	public Dict getParent() {
		return parent;
	}

	public void setParent(Dict parent) {
		this.parent = parent;
	}

	public List<Dict> getChildDict() {
		return childDict;
	}

	public void setChildDict(List<Dict> childDict) {
		this.childDict = childDict;
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