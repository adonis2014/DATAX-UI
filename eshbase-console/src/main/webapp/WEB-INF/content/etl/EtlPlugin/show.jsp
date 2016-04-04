<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/content/common/common.jsp"%>
<c:set var="pageTitle" value="${'查看ETL插件'}" scope="page" />
<html>
<head>
<title>${pageTitle }</title>
</head>
<body>
	<div class="page-content">
		<div class="container-fluid">
			<!-- 页面导航 -->
			<tool:navBar pageTitle="${pageTitle }" pageTitleContent="ETL管理-插件管理-${pageTitle }" titleIcon="icon-home" />
			<!-- 主体内容 -->
			<div class="row-fluid">
				<div class="span12">
					<div class="portlet box blue">
						<div class="portlet-title">
							<h4>
								<i class="icon-reorder"></i>查看ETL插件
							</h4>
							<div class="tools">
								<a href="javascript:;" class="collapse"></a> <a href="javascript:;" class="remove"></a>
							</div>
						</div>
						<div class="portlet-body form">
							<table class="dbform" width="100%">
								<tr>
									<td class="fieldtitle">插件名:</td>
									<td class="fieldvalue">${obj.pluginName }</td>
									<td class="fieldtitle">插件类别:</td>
									<td class="fieldvalue">${obj.pluginType }</td>
								</tr>
								<tr>
									<td class="fieldtitle">类名:</td>
									<td class="fieldvalue">${obj.className}</td>
									<td class="fieldtitle">版本:</td>
									<td class="fieldvalue">${obj.version }</td>
								</tr>
								<tr>
									<td class="fieldtitle">数据源目标:</td>
									<td class="fieldvalue">${obj.target }</td>
									<td class="fieldtitle">jar包名:</td>
									<td class="fieldvalue">${obj.jarName }</td>
								</tr>
								<tr>
									<td class="fieldtitle">最大线程数:</td>
									<td class="fieldvalue">${obj.maxThreadNum }</td>
									<td class="fieldtitle">备注:</td>
									<td class="fieldvalue">${obj.remark }</td>
								</tr>
							</table>
						</div>
						<div class="portlet-title">
							<h4>
								<i class="icon-reorder"></i>参数
							</h4>
							<div class="tools"></div>
						</div>
						<div class="portlet-body">
							<table width="100%" class="dbgrid">
								<thead>
									<tr>
										<th>名称</th>
										<th>范围</th>
										<th>是否必须</th>
										<th>默认值</th>
										<th>是否列</th>
										<th>备注</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${obj.pluginParams}" var="pparam">
										<tr>
											<td>${pparam.name}</td>
											<td>${pparam.range}</td>
											<td><mytags:dictSelect field="mandatory" id="mandatory" type="label" hasLabel="false" codeType="1002" defaultVal="${pparam.mandatory}" /></td>
											<td>${pparam.defaultValue}</td>
											<td><mytags:dictSelect field="isColumn" id="isColumn" type="label" hasLabel="false" codeType="1002" defaultVal="${pparam.isColumn}" /></td>
											<td>${pparam.description}</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="/WEB-INF/content/common/plugins/jquery-validation.jsp"%>
	<script type="text/javascript">
		$(function() {
			App.activeMenu("etl/EtlPlugin/list");
		});
	</script>
</body>
</html>
