package net.iharding.modules.meta.model;

import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import net.iharding.core.orm.IdEntity;

import org.guess.sys.model.User;
import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import org.hibernate.annotations.NotFound;
import org.hibernate.annotations.NotFoundAction;


@Entity
@Table(name = "\"VIEW_META_WATCH\"")
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
public class ViewWatch extends IdEntity {

	/**
	 * 关注人
	 */
	@ManyToOne(cascade = { CascadeType.PERSIST, CascadeType.MERGE },targetEntity = User.class,fetch = FetchType.LAZY)
	@JoinColumn(name="user_id")
	@NotFound(action = NotFoundAction.IGNORE)
	@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
	private User user;
	
	@Column(name="user_id",insertable=false,updatable=false)
	private Long userId;
	/**
	 * 关联对象类别
	 */
	@Column(name="object_type")
	private Integer objectType;
	/**
	 * 关联对象Id
	 */
	@Column(name="object_id")
	private Long objectId;
	/**
	 * 建立时间
	 */
	@Column(name="create_date")
	private Date createDate;
	/**
	 * 备注
	 */
	private String remark;
	

	public Long getUserId() {
		return userId;
	}

	public void setUserId(Long userId) {
		this.userId = userId;
	}

	@Column(name = "object_name")
	private String objectName;
	
	@Column(name = "object_pname")
	private String objectPname;
	
	@Column(name = "object_remark")
	private String objectRemark;
	
	@Column(name = "check_label")
	private Integer checkLabel;
	
	public String getObjectName() {
		return objectName;
	}

	public void setObjectName(String objectName) {
		this.objectName = objectName;
	}

	public String getObjectPname() {
		return objectPname;
	}

	public void setObjectPname(String objectPname) {
		this.objectPname = objectPname;
	}

	public String getObjectRemark() {
		return objectRemark;
	}

	public void setObjectRemark(String objectRemark) {
		this.objectRemark = objectRemark;
	}

	public Integer getCheckLabel() {
		return checkLabel;
	}

	public void setCheckLabel(Integer checkLabel) {
		this.checkLabel = checkLabel;
	}
	
	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Integer getObjectType() {
		return objectType;
	}

	public void setObjectType(Integer objectType) {
		this.objectType = objectType;
	}
	
	public Long getObjectId() {
		return objectId;
	}

	public void setObjectId(Long objectId) {
		this.objectId = objectId;
	}
	
	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	
	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}
	
	
}