<%@ tag language="java" pageEncoding="UTF-8" description="页面顶部导航栏"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ attribute name="modelKey" type="java.lang.String" required="true" description="模块key" %>
<%@ attribute name="modelName" type="java.lang.String" required="false" description="模块名" rtexprvalue="true"%>

<div class="span5 pull-right">
	<shiro:hasPermission name="${modelName}:${modelKey }:add">
		<a class="btn green" href="javascript:void(0)" onclick="Page.addObj();">
			添加 <i class="icon-plus"></i>
		</a>
	</shiro:hasPermission>
	<shiro:hasPermission name="${modelName}:${modelKey }:edit">
	<a class="btn blue" href="javascript:void(0);" onclick="Page.updateObj();">
			修改<i class="icon-pencil"></i>
	</a>
	</shiro:hasPermission>
	<shiro:hasPermission name="${modelName}:${modelKey }:delete">
	<a class="btn red" href="javascript:void(0);" onclick="Page.deleteObj();">
			删除<i class="icon-trash"></i>
	</a>
	</shiro:hasPermission>
	<shiro:hasPermission name="${modelName}:${modelKey }:show">
	<a class="btn blue" href="javascript:void(0);" onclick="Page.viewObj();">
			详细<i class="icon-search"></i>
	</a>
	</shiro:hasPermission>
	<shiro:hasPermission name="${modelName}:${modelKey }:check">
	<a class="btn blue" href="javascript:void(0);" onclick="checkObj();">
			启停<i class="icon-search"></i>
	</a>
	</shiro:hasPermission>
	<shiro:hasPermission name="${modelName}:${modelKey }:execute">
	<a class="btn blue" href="javascript:void(0);" onclick="checkObj();">
			执行<i class="icon-search"></i>
	</a>
	</shiro:hasPermission>
</div>
