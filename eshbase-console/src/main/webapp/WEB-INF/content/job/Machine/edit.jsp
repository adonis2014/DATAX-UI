<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/content/common/common.jsp"%>
<c:set var="pageTitle" value="${empty obj ? '添加作业终端':'修改作业终端' }" scope="page" />
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
							<form action="${ctx}/job/Machine/edit" class="form-horizontal form_sync" method="post" id="form1">

								<input type="hidden" value="${obj.id}" name="id">
								<div class="control-group">
									<label class="control-label">终端名:</label>
									<div class="controls">
										<input type="text" class="span6 m-wrap" validate="{required:true}" name="machineName" value="${obj.machineName }" />
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">终端地址:</label>
									<div class="controls">
										<input type="text" class="span6 m-wrap" validate="{required:true}" name="address" value="${obj.address }" />
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">ssh端口:</label>
									<div class="controls">
										<input type="text" class="span6 m-wrap" validate="{required:true}" name="sshPort" value="${obj.sshPort }" />
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">登录名:</label>
									<div class="controls">
										<input type="text" class="span6 m-wrap" validate="{required:true}" name="loginName" value="${obj.loginName }" />
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">登录密码:</label>
									<div class="controls">
										<input type="text" class="span6 m-wrap" validate="{required:true}" name="loginPassword" value="${obj.loginPassword }" />
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">工作路径:</label>
									<div class="controls">
										<input type="text" class="span6 m-wrap" validate="{required:true}" name="userDir" value="${obj.userDir }" />
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">建立者:</label>
									<div class="controls">
										<input type="text" class="span6 m-wrap" validate="{required:true}" name="createbyId" value="${obj.createbyId }" />
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">更新者:</label>
									<div class="controls">
										<input type="text" class="span6 m-wrap" validate="{required:true}" name="updatebyId" value="${obj.updatebyId }" />
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">建立时间:</label>
									<div class="controls">
										<input type="text" class="span6 m-wrap" validate="{required:true}" name="createDate" value="${obj.createDate }" />
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">更新时间:</label>
									<div class="controls">
										<input type="text" class="span6 m-wrap" validate="{required:true}" name="updateDate" value="${obj.updateDate }" />
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">启用标记:</label>
									<div class="controls">
										<input type="text" class="span6 m-wrap" validate="{required:true}" name="checkLabel" value="${obj.checkLabel }" />
									</div>
								</div>
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
			App.activeMenu("job/Machine/list");
		});
	</script>
</body>
</html>