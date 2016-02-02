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
			<tool:navBar pageTitle="${pageTitle }" pageTitleContent="作业管理-{functionName}管理-${pageTitle }" titleIcon="icon-home" />
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
								<div class="control-group">
									<label class="control-label">作业名:</label>
									<div class="controls">
										<input type="text" class="span6 m-wrap" validate="{required:true}" name="name" value="${obj.name }" />
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">作业类型:</label>
									<div class="controls">
										<mytags:dictSelect field="jobType" id="jobType" defaultVal="${obj.jobType}" hasLabel="false" codeType="19" />
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">类名:</label>
									<div class="controls">
										<input type="text" class="span6 m-wrap" validate="{required:true}" name="className" value="${obj.className }" />
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">版本:</label>
									<div class="controls">
										<input type="text" class="span6 m-wrap" validate="{required:true}" name="version" value="${obj.version }" />
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">作业产品ID:</label>
									<div class="controls">
										<input type="text" class="span6 m-wrap" validate="{required:true}" name="productId" value="${obj.productId }" />
									</div>
								</div>
								<c:if test="${not empty obj}">
								<div class="control-group">
									<label class="control-label">建立者:</label>
									<div class="controls">
										${obj.creater.name}
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">更新者:</label>
									<div class="controls">
										${obj.updater.name}
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">建立时间:</label>
									<div class="controls">
										${obj.createDate }
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">更新时间:</label>
									<div class="controls">
										${obj.updateDate }
									</div>
								</div>
								</c:if>
								<div class="control-group">
									<label class="control-label">备注:</label>
									<div class="controls">
										<input type="text" class="span6 m-wrap" validate="{required:true}" name="remark" value="${obj.remark }" />
									</div>
								</div>
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