<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/content/common/common.jsp"%>
<c:set var="pageTitle" value="${empty obj ? '添加作业类信息':'修改作业类信息' }" scope="page" />
<html>
<head>
<title>${pageTitle }</title>
</head>
<body>
	<div class="page-content">
		<div class="container-fluid">
			<!-- 页面导航 -->
			<tool:navBar pageTitle="${pageTitle }" pageTitleContent="作业管理-作业类注册管理-${pageTitle }" titleIcon="icon-home" />
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
							<form action="${ctx}/job/JobClass/edit" class="form-horizontal form_sync" method="post" id="form1">
								<input type="hidden" value="${obj.id}" name="id">
								<input type="hidden" value="${obj.checkLabel}" name="checkLabel">
								<table class="dbform" width="100%">
									<tr>
										<td class="fieldtitle">作业名:</td>
										<td class="fieldvalue"><input type="text"  validate="{required:true}" name="name" value="${obj.name }" /></td>
										<td class="fieldtitle">作业类型:</td>
										<td class="fieldvalue"><mytags:dictSelect field="jobType" id="jobType" defaultVal="${obj.jobType}" hasLabel="false" codeType="21" hasPSel="false"/></td>
									</tr>
									<tr>
										<td class="fieldtitle">类名:</td>
										<td class="fieldvalue"><input type="text"  validate="{required:true}" name="className" value="${obj.className }" /></td>
										<td class="fieldtitle">版本:</td>
										<td class="fieldvalue"><input type="text"  validate="{required:true}" name="version" value="${obj.version }" /></td>
									</tr>
									<tr>
										<td class="fieldtitle">方法:</td>
										<td class="fieldvalue"><input type="text"  validate="{required:true}" name="methodName" value="${obj.methodName }" /></td>
										<td class="fieldtitle">备注:</td>
										<td class="fieldvalue"><input type="text"   name="remark" value="${obj.remark }" /></td>
									</tr>
								<c:if test="${not empty obj}">
								<tr>
										<td class="fieldtitle">建立者:</td>
										<td class="fieldvalue"><input type="text"  name="t" readonly="readonly" value="${obj.creater.name}" /></td>
										<td class="fieldtitle">更新者:</label>
										<td class="fieldvalue"><input type="text"  name="t" readonly="readonly" value="${obj.updater.name}" /></td>
									</tr>
									<tr>
										<td class="fieldtitle">建立时间:</td>
										<td class="fieldvalue"><input type="text"  name="t" readonly="readonly" value="${obj.createDate }" /></td>
										<td class="fieldtitle">更新时间:</td>
										<td class="fieldvalue"><input type="text"  name="t" readonly="readonly" value="${obj.updateDate}" /></td>
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
			App.activeMenu("job/JobClass/list");
		});
	</script>
</body>
</html>