<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/content/common/common.jsp"%>
<c:set var="pageTitle" value="${'查看项目对象'}" scope="page" />
<html>
<head>
<title>${pageTitle }</title>
</head>
<body>
	<div class="page-content">
		<div class="container-fluid">
			<!-- 页面导航 -->
			<tool:navBar pageTitle="${pageTitle }" pageTitleContent="项目管理-${pageTitle }" titleIcon="icon-home" />
			<!-- 主体内容 -->
			<div class="row-fluid">
				<div class="span12">
					<div class="portlet box blue">
						<div class="portlet-title">
							<h4>
								<i class="icon-reorder"></i>项目详细信息
							</h4>
							<div class="tools">
								<a href="javascript:;" class="collapse"></a> <a href="javascript:;" class="remove"></a>
							</div>
						</div>
						<div class="portlet-body form">
							<form action="${ctx}/meta/Project/edit" class="form-horizontal form_sync" method="post" id="form1">
								<input type="hidden" name="id" value="${obj.id}" />
								<table width="100%" class="dbform">
									<tr>
										<th class="fieldtitle">项目编码:</th><td class="fieldvalue">${obj.projectCode }</td>
										<th class="fieldtitle">项目名称:</th><td class="fieldvalue">${obj.projectName }</td>
									</tr>
									<c:if test="${not empty obj}">
								<tr>
										<th class="fieldtitle">建立者:</th><td class="fieldvalue">${obj.creater.name}</td>
										<th class="fieldtitle">更新者:</th><td class="fieldvalue">${obj.updater.name}</td>
								</tr>
								<tr>
										<th class="fieldtitle">建立时间:</th>
										<td class="fieldvalue">${obj.createDate }</td>
										<th class="fieldtitle">更新时间:</th>
										<td class="fieldvalue">${obj.updateDate }</td>
								</tr>
								</c:if>
								<tr>
										<th class="fieldtitle">备注:</th>
										<td class="fieldvalue" >${obj.remark }</td>
										<th class="fieldtitle">启停状态:</th>
										<td class="fieldvalue"><mytags:dictSelect field="checkLabel" hasLabel="false" type="label" codeType="17" defaultVal="${obj.checkLabel}"/> </td>
								</tr>
								
								</table>
								
								<div class="form-actions">
									<a class='btn' href="${header.Referer }">返回</a>
								</div>
							</form>
						</div>
						<div class="portlet-body">
							<table width="100%" class="dbgrid">
									<thead>
										<tr>
											<th>数据源</th>
											<th>模块编码</th>
											<th>模块名</th>
											<th>包名</th>
											<th>建立者</th>
											<th>最后更新者</th>
											<th>最后更新时间</th>
											<th>备注</th>
										</tr>
									</thead>
									<tbody>
									<c:forEach items="${obj.modules}" var="module">
										<tr>
											<td><a href="">${module.datasource.dsName}</a></td>
											<td>${module.moduleCode}</td>
											<td>${module.moduleName}</td>
											<td>${module.packageName}</td>
											<td>${module.creater.name}</td>
											<td>${module.updater.name}</td>
											<td>${module.updateDate}</td>
											<td>${module.remark}</td>
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
			App.activeMenu("meta/Project/list");
		});
	</script>
</body>
</html>