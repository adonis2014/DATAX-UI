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
						<div class="portlet-body form">
							<form action="${ctx}/job/JobClass/edit" class="form-horizontal form_sync" method="post" id="form1">
								<input type="hidden" value="${obj.id}" name="id">
								<h3 class="form-section">
									作业类信息<a class='btn purple pull-right' href="${header.Referer }">返回</a>
								</h3>
								<div class="row-fluid">
									<div class="span6 ">
										<div class="control-group">
											<label class="control-label">作业名:</label>
											<div class="controls">
												<span class="text">${obj.name}</span>
											</div>
										</div>
									</div>
									<div class="span6 ">
										<div class="control-group">
											<label class="control-label">作业类型:</label>
											<div class="controls">
												<span class="text"><mytags:dictSelect field="jobType" id="jobType" type="label" defaultVal="${obj.jobType}" hasLabel="false" codeType="19" /></span>
											</div>
										</div>
									</div>
								</div>
<div class="row-fluid">
									<div class="span6 ">
								<div class="control-group">
									<label class="control-label">类名:</label>
									<div class="controls">
										<span class="text">${obj.className }</span>
									</div>
								</div>
								</div>
									<div class="span6 ">
								<div class="control-group">
									<label class="control-label">版本:</label>
									<div class="controls">
										<span class="text">${obj.version }</span>
									</div>
								</div>
								</div></div>
								<div class="row-fluid">
									<div class="span6 ">
								<div class="control-group">
									<label class="control-label">作业产品ID:</label>
									<div class="controls">
										<span class="text">${obj.productId }</span>
									</div>
								</div>
								</div>
								<div class="span6 ">
								<div class="control-group">
									<label class="control-label">备注:</label>
									<div class="controls">
										<span class="text">${obj.remark}</span>
									</div>
								</div>
								</div>
								</div>
								<c:if test="${not empty obj}">
								<div class="row-fluid">
									<div class="span6 ">
									<div class="control-group">
										<label class="control-label">建立者:</label>
										<div class="controls">
											<span class="text">${obj.creater.name}</span>
										</div>
									</div>
									</div>
									<div class="span6 ">
									<div class="control-group">
										<label class="control-label">更新者:</label>
										<div class="controls">
											<span class="text">${obj.updater.name}</span>
										</div>
									</div>
									</div>
									<div class="row-fluid">
									<div class="span6 ">
									<div class="control-group">
										<label class="control-label">建立时间:</label>
										<div class="controls">
											<span class="text">${obj.createDate }</span>
										</div>
									</div>
									</div>
									<div class="span6 ">
									<div class="control-group">
										<label class="control-label">更新时间:</label>
										<div class="controls">
											<span class="text">${obj.updateDate }</span>
										</div>
									</div>
									</div>
									</div>
								</c:if>
								
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