
package net.iharding.tag.base;

import java.io.IOException;

import javax.servlet.jsp.JspTagException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;

import net.iharding.modules.sys.service.MultiLangService;

import org.guess.core.utils.spring.SpringContextUtil;
import org.springframework.beans.factory.annotation.Autowired;


/**
 * 类描述：MutiLang标签处理类
 * 
 * @author 
 * @date： 日期：2012-12-7 时间：上午10:17:45
 * @version 1.0
 */
@SuppressWarnings({ "serial", "rawtypes", "unchecked", "static-access" })
public class MutiLangTag extends TagSupport {
	protected String langKey;
	protected String langArg;

	@Autowired
	private static MultiLangService mutiLangService;
	
	public int doStartTag() throws JspTagException {
		return EVAL_PAGE;
	}

	public int doEndTag() throws JspTagException {
		try {
			JspWriter out = this.pageContext.getOut();
			out.print(end().toString());
			out.flush();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return EVAL_PAGE;
	}

	public StringBuffer end() {
		if (mutiLangService == null){
			mutiLangService = SpringContextUtil.getBean(MultiLangService.class);	
		}
		String lang_context = mutiLangService.getLang(langKey, langArg);
		
		return new StringBuffer(lang_context);
	}

	public void setLangKey(String langKey) {
		this.langKey = langKey;
	}
	
	public void setLangArg(String langArg) {
		this.langArg = langArg;
	}
}
