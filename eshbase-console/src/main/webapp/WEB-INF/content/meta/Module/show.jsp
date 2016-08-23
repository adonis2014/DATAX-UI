<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/content/common/common.jsp"%>
<c:set var="pageTitle" value="${'模块详细信息'}" scope="page" />
<html>
<head>
<title>${pageTitle }</title>
</head>
<body>
	<div class="page-content">
		<div class="container-fluid">
			<!-- 页面导航 -->
			<tool:navBar pageTitle="${pageTitle }" pageTitleContent="元数据管理-模块管理-${pageTitle }" titleIcon="icon-home" />
			<!-- 主体内容 -->
			<div class="row-fluid">
				<div class="span12">
					<div class="portlet box blue">
						<div class="portlet-title">
							<h4>
								<i class="icon-reorder"></i>${pageTitle }
							</h4>
							<div class="tools">
								<a href="javascript:;" class="collapse"></a> <a href="javascript:;" class="remove"></a>
							</div>
						</div>
						<div class="portlet-body form">
							<form action="${ctx}/meta/module/edit" class="form-horizontal form_sync" method="post" id="form1">

								<input type="hidden" value="${obj.id}" name="id">
								<table width="100%" class="dbform">
									<tr>
										<td class="fieldtitle">项目:</td>
										<td class="fieldvalue"><a href="${ctx}/meta/Project/show/${obj.project.id}" target="_blank">${obj.project.projectName}</a></td>
										<td class="fieldtitle">数据源:</td>
										<td class="fieldvalue">
										<a href="${ctx}/meta/DataSource/show/${obj.datasource.id}" target="_blank">${obj.datasource.dsName}</a>
										</td>
									</tr>
									<tr>
										<td class="fieldtitle">模块编码:</td>
										<td class="fieldvalue">${obj.moduleCode }</td>
										<td class="fieldtitle">模块名:</td>
										<td class="fieldvalue">${obj.moduleName }</td>
									</tr>
									<tr>
										<td class="fieldtitle">包名:</td>
										<td class="fieldvalue">${obj.packageName }</td>
										<td class="fieldtitle">备注:</td>
										<td class="fieldvalue">${obj.remark }</td>
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
								</table>
								<div class="form-actions">
									<button type="submit" class="btn blue">提交</button>
									<a class='btn' href="${header.Referer }">返回</a>
								</div>
								<div class="portlet-body">
								<table width="100%" class="dbgrid">
									<thead>
										<tr>
											<th>数据源</th>
											<th>表名</th>
											<th>逻辑名</th>
											<th>表类别</th>
											<th>建立者</th>
											<th>最后更新者</th>
											<th>最后更新时间</th>
											<th>备注</th>
										</tr>
									</thead>
									<tbody>
									<c:forEach items="${obj.tables}" var="table">
										<tr>
											<td><a href="${ctx}/meta/DataSource/show/${table.datasource.id}">${table.datasource.dsName}</a></td>
											<td><a href='${ctx}/meta/DBTable/show/${table.id}' >${table.tableName}</a></td>
											<td>${table.tablePname}</td>
											<td><mytags:dictSelect field="tableType" defaultVal="${table.tableType}" type="label" hasLabel="false"/> </td>
											<td>${table.creater.name}</td>
											<td>${table.updater.name}</td>
											<td>${table.updateDate}</td>
											<td>${table.remark}</td>
										</tr>
									</c:forEach>
									</tbody>
							</table>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="/WEB-INF/content/common/plugins/jquery-validation.jsp"%>
	<script type="text/javascript">
		$(function() {
			App.activeMenu("meta/Module/list");
		});
	</script>
</body>
</html>