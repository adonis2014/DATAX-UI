<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/content/common/common.jsp"%>
<c:set var="pageTitle" value="${empty obj ? '添加数据源对象':'修改数据源对象' }" scope="page" />
<html>
<head>
<title>${pageTitle }</title>
</head>
<body>
	<%@ include file="/WEB-INF/content/meta/Project/selProject.jsp"%>

	<div class="page-content">
		<div class="container-fluid">
			<!-- 页面导航 -->
			<tool:navBar pageTitle="${pageTitle }" pageTitleContent="数据源管理-${pageTitle }" titleIcon="icon-home" />
			<!-- 主体内容 -->
			<div class="row-fluid">
				<div class="span12">
					<div class="portlet box blue">
						<div class="portlet-title">
							<h4>
								<i class="icon-reorder"></i>请填写表单
							</h4>
							<div class="tools">
								<a href="javascript:;" class="collapse"></a> <a href="javascript:;" class="remove"></a>
							</div>
						</div>
						<div class="portlet-body form">
							<form action="${ctx}/meta/DataSource/edit" class="form-horizontal form_sync" method="post" id="form1">
								<input type="hidden" value="${obj.id}" name="id" />
								<table width="100%" class="dbform">
									<tr>
										<td class="fieldtitle">schema名称:</td>
										<td class="fieldvalue"><input type="text" class="span6 m-wrap" validate="{required:true}" name="schemaName" value="${obj.schemaName }" /></td>
										<td class="fieldtitle">ds名称:</td>
										<td class="fieldvalue"><input type="text" class="span6 m-wrap" validate="{required:true}" name="dsName" value="${obj.dsName }" /></td>
									</tr>
									<tr>
										<td class="fieldtitle">数据库类别:</td>
										<td class="fieldvalue"><mytags:dictSelect field="dbType" id="dbType" defaultVal="${obj.dbType}" hasLabel="false" codeType="10" /></td>
										<td class="fieldtitle">备注:</td>
										<td class="fieldvalue"><input type="text" class="span6 m-wrap"  name="remark" value="${obj.remark }" /></td>
									</tr>
									<c:if test="${not empty obj}">
									<tr>
										<td class="fieldtitle">建立者:</td>
										<td class="fieldvalue">${obj.creater.name}</td>
										<td class="fieldtitle">更新者:</td>
										<td class="fieldvalue">${obj.updater.name}</td>
									</tr>
									<tr>
										<td class="fieldtitle">建立时间:</td>
										<td class="fieldvalue">${obj.createDate }</td>
										<td class="fieldtitle">更新时间:</td>
										<td class="fieldvalue">${obj.updateDate }</td>
									</tr>
								</c:if>
								</table>
								
								<div class="form-actions">
									<button type="submit" class="btn blue">提交</button>
									<a class='btn' href="${header.Referer }">返回</a>
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
			App.activeMenu("meta/DataSource/list");
		});
		function showProject() {
			$("#projectList").modal();
		}
		function selProject(obj) {
			var flag = Page.selectsPrompt();
			if (!flag)
				return;

			var obj = $("#sample_1").find("td :checkbox:checked");
			$('input[id=projectName]').val(obj.first().attr("data-text"));
			$('input[id=projectId]').val(flag);
			$('#projectList').modal('hide');
		}
	</script>
</body>
</html>