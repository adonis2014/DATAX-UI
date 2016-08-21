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

/**
 * 元数据注释Entity
 * @author Joe.zhang
 * @version 2016-05-18
 */
@Entity
@Table(name = "\"VIEW_META_COMMENT\"")
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
public class ViewComment extends IdEntity {

	/**
	 * 注释人ID
	 */
	@ManyToOne(cascade = { CascadeType.PERSIST, CascadeType.MERGE },targetEntity = User.class,fetch = FetchType.LAZY)
	@JoinColumn(name="user_id")
	@NotFound(action = NotFoundAction.IGNORE)
	@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
	private User user;
	
	@Column(name="user_id",insertable=false,updatable=false)
	private Long userId;
	
	/**
	 * 注释
	 */
	private String comment;
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
	 * 更新时间
	 */
	@Column(name="update_date")
	private Date updateDate;
	

	@Column(name = "object_name")
	private String objectName;
	
	@Column(name = "object_pname")
	private String objectPname;
	
	@Column(name = "object_remark")
	private String objectRemark;
	
	@Column(name = "check_label")
	private Integer checkLabel;
	

	public Long getUserId() {
		return userId;
	}

	public void setUserId(Long userId) {
		this.userId = userId;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

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
	

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
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
	
	public Date getUpdateDate() {
		return updateDate;
	}

	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}
	
	
}
