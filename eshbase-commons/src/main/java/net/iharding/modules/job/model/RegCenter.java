package net.iharding.modules.job.model;

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
 * 注册中心Entity
 * @author Joe.zhang
 * @version 2016-01-31
 */
@Entity
@Table(name = "job_reg_center")
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
public class RegCenter extends IdEntity {

	/**
	 * 名称
	 */
	private String name;
	/**
	 * ZK列表
	 */
	@Column(name="zk_quorum_peer")
	private String zkQuorumPeer;
	/**
	 * 命名空间
	 */
	@Column(name="name_space")
	private String nameSpace;
	/**
	 * 待重试间隔时间
	 */
	@Column(name="base_sleep_time")
	private Integer baseSleepTime;
	/**
	 * 待重试间隔时间最大值
	 */
	@Column(name="max_sleep_time")
	private Integer maxSleepTime;
	/**
	 * 最大重试次数
	 */
	@Column(name="max_retries")
	private Integer maxRetries;
	/**
	 * 登录凭证
	 */
	@Column(name="login_cert")
	private String loginCert;
	/**
	 * 最后更新人
	 */
	@ManyToOne(cascade = { CascadeType.PERSIST, CascadeType.MERGE },targetEntity = User.class,fetch = FetchType.LAZY)
	@JoinColumn(name="updateby_id")
	@NotFound(action = NotFoundAction.IGNORE)
	@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
	private User updater;
	/**
	 * 建立人
	 */
	@ManyToOne(cascade = { CascadeType.PERSIST, CascadeType.MERGE },targetEntity = User.class,fetch = FetchType.LAZY)
	@JoinColumn(name="createby_id")
	@NotFound(action = NotFoundAction.IGNORE)
	@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
	private User creater;
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
	/**
	 * 启用标记
	 */
	@Column(name="check_label")
	private Integer checkLabel;
	/**
	 * 备注
	 */
	private String remark;
	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	public String getZkQuorumPeer() {
		return zkQuorumPeer;
	}

	public void setZkQuorumPeer(String zkQuorumPeer) {
		this.zkQuorumPeer = zkQuorumPeer;
	}
	
	public String getNameSpace() {
		return nameSpace;
	}

	public void setNameSpace(String nameSpace) {
		this.nameSpace = nameSpace;
	}
	
	public Integer getBaseSleepTime() {
		return baseSleepTime;
	}

	public void setBaseSleepTime(Integer baseSleepTime) {
		this.baseSleepTime = baseSleepTime;
	}
	
	public Integer getMaxSleepTime() {
		return maxSleepTime;
	}

	public void setMaxSleepTime(Integer maxSleepTime) {
		this.maxSleepTime = maxSleepTime;
	}
	
	public Integer getMaxRetries() {
		return maxRetries;
	}

	public void setMaxRetries(Integer maxRetries) {
		this.maxRetries = maxRetries;
	}
	
	public String getLoginCert() {
		return loginCert;
	}

	public void setLoginCert(String loginCert) {
		this.loginCert = loginCert;
	}
	
	public User getUpdater() {
		return updater;
	}

	public void setUpdater(User updater) {
		this.updater = updater;
	}

	public User getCreater() {
		return creater;
	}

	public void setCreater(User creater) {
		this.creater = creater;
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
	
	public Integer getCheckLabel() {
		return checkLabel;
	}

	public void setCheckLabel(Integer checkLabel) {
		this.checkLabel = checkLabel;
	}
	
	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}
	
	
}