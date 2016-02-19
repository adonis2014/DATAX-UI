<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/content/common/common.jsp"%>
<c:set var="pageTitle" value="${'查看作业类信息'}" scope="page" />
<html>
<head>
<title>${pageTitle }</title>
</head>
<body>
	<div class="page-content">
		<div class="container-fluid">
			<!-- 页面导航 -->
			<tool:navBar pageTitle="${pageTitle }" pageTitleContent="作业管理-作业类管理-${pageTitle }" titleIcon="icon-home" />
			<!-- 主体内容 -->
			<div class="row-fluid">
				<div class="span12">
					<div class="portlet box blue">
						<div class="portlet-title">
							<h4>
								<i class="icon-reorder"></i>作业类信息
							</h4>
							<div class="tools">
								<a href="${header.Referer }" class="collapse"></a>
							</div>
						</div>
						<div class="portlet-body form">
							<form action="${ctx}/job/JobClass/edit" class="form-horizontal form_sync" method="post" id="form1">
							<input type="hidden" value="${obj.id}" name="id">
								<table width="100%"  class="dbform">
									<tbody>
									<tr>
										<td class="fieldtitle" >作业名:</td>
										<td class="fieldvalue">${obj.name}</td>
										<td class="fieldtitle" >作业类型:</td>
										<td class="fieldvalue"><mytags:dictSelect field="jobType" id="jobType" type="label" defaultVal="${obj.jobType}" hasLabel="false" codeType="19" /></td>
									</tr>
									<tr>
										<td class="fieldtitle">类名:</td>
										<td class="fieldvalue">${obj.className }</td>
										<td class="fieldtitle">版本:</td>
										<td class="fieldvalue">${obj.version }</td>
									</tr>
									<tr>
										<td class="fieldtitle">作业产品ID:</td>
										<td class="fieldvalue">${obj.productId }</td>
										<td class="fieldtitle">备注:</td>
										<td class="fieldvalue">${obj.remark}</td>
									</tr>
									<tr>
										<td class="fieldtitle">建立者:</td>
										<td class="fieldvalue">${obj.creater.name}</td>
										<td class="fieldtitle">更新者:</td>
										<td class="fieldvalue">${obj.updater.name }</td>
									</tr>
									<tr>
										<td class="fieldtitle">建立时间:</td>
										<td class="fieldvalue">${obj.createDate}</td>
										<td class="fieldtitle">更新时间:</td>
										<td class="fieldvalue">${obj.updateDate }</td>
									</tr>
								
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
			App.activeMenu("job/JobClass/list");
		});
	</script>
</body>
</html>