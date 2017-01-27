<%@ tag language="java" pageEncoding="UTF-8" description="页面顶部导航栏"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ attribute name="modelKey" type="java.lang.String" required="true" description="模块key" %>
<%@ attribute name="modelName" type="java.lang.String" required="false" description="模块名" rtexprvalue="true"%>
<div class="span7 pull-right">
	<shiro:hasPermission name="${empty modelName?'sys':modelName}:${modelKey }:add">
		<a class="btn green" href="javascript:void(0)" onclick="Page.addObj();">
			添加 <i class="icon-plus"></i>
		</a>
	</shiro:hasPermission>
	<shiro:hasPermission name="${empty modelName?'sys':modelName}:${modelKey }:update">
	<a class="btn blue" href="javascript:void(0);" onclick="Page.updateObj();">
			修改<i class="icon-pencil"></i>
	</a>
	</shiro:hasPermission>
	<shiro:hasPermission name="${empty modelName?'sys':modelName}:${modelKey }:delete">
	<a class="btn red" href="javascript:void(0);" onclick="Page.deleteObj();">
			删除<i class="icon-trash"></i>
	</a>
	</shiro:hasPermission>
	<shiro:hasPermission name="${empty modelName?'sys':modelName}:${modelKey }:show">
	<a class="btn blue" href="javascript:void(0);" onclick="Page.viewObj();">
			详细<i class="icon-search"></i>
	</a>
	</shiro:hasPermission>
	<shiro:hasPermission name="${empty modelName?'sys':modelName}:${modelKey }:setup">
		<a class="btn blue" href="javascript:void(0);" onclick="setupObj();">
			参数设置</i>
		</a>
	</shiro:hasPermission>
	<shiro:hasPermission name="${empty modelName?'sys':modelName}:${modelKey }:start">
		<a class="btn blue" href="javascript:void(0);" onclick="startObj();">
			启用/停用</i>
		</a>
	</shiro:hasPermission>
	<shiro:hasPermission name="${empty modelName?'sys':modelName}:${modelKey }:monitor">
		<a class="btn blue" href="javascript:void(0);" onclick="monitorObj();">
			监控</i>
		</a>
	</shiro:hasPermission>
</div>
