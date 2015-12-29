package net.iharding.modules.sys.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

import net.iharding.core.orm.IdEntity;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;

/**
 * 多国语言Entity
 * @author Joe.zhang
 * @version 2015-12-23
 */
@Entity
@Table(name = "sys_multi_lang")
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
public class MultiLang extends IdEntity {

	/**
	 * 编码
	 */
	@Column(name="lang_code")
	private String langCode;
	/**
	 * key
	 */
	@Column(name="lang_key")
	private String langKey;
	/**
	 * 内容
	 */
	@Column(name="lang_context")
	private String langContent;
	
	public String getLangCode() {
		return langCode;
	}

	public void setLangCode(String langCode) {
		this.langCode = langCode;
	}
	
	public String getLangKey() {
		return langKey;
	}

	public void setLangKey(String langKey) {
		this.langKey = langKey;
	}
	
	public String getLangContent() {
		return langContent;
	}

	public void setLangContent(String langContent) {
		this.langContent = langContent;
	}
	
	
}