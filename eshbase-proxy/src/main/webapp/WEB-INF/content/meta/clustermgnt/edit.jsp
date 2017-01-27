<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/content/common/common.jsp"%>
<c:set var="pageTitle" value="${empty obj ? '添加集群设置':'修改集群设置' }" scope="page" />
<html>
<head>
<title>${pageTitle }</title>
</head>
<body>
	<div class="page-content">
		<div class="container-fluid">
			<!-- 页面导航 -->
			<tool:navBar pageTitle="${pageTitle }" pageTitleContent="集群管理-${pageTitle }" titleIcon="icon-home" />
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
							<form action="${ctx}/meta/clustermgnt/edit" class="form-horizontal form_sync" method="post" id="form1">
								<input type="hidden" value="${obj.id}" name="id" /> 
								<div class="control-group">
									<label class="control-label">schema:</label>
									<div class="controls">
										<input type="text" class="span6 m-wrap" validate="{required:true}" name="schemaName" value="${obj.schemaName }" />
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">名称:</label>
									<div class="controls">
										<input type="text" class="span6 m-wrap" validate="{required:true}" name="dsName" value="${obj.dsName }" />
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">类别:</label>
									<div class="controls">
										<select name="dbType">
											<option value="1">elasticsearch</option>
										</select>
									</div>
								</div>
								<c:if test="${not empty obj}">
									<div class="control-group">
										<label class="control-label">建立者:</label>
										<div class="controls">${obj.creater.name}</div>
									</div>
									<div class="control-group">
										<label class="control-label">更新者:</label>
										<div class="controls">${obj.updater.name}</div>
									</div>
									<div class="control-group">
										<label class="control-label">建立时间:</label>
										<div class="controls">${obj.createDate }</div>
									</div>
									<div class="control-group">
										<label class="control-label">更新时间:</label>
										<div class="controls">${obj.updateDate }</div>
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
			App.activeMenu("meta/clustermgnt/list");
		});
	</script>
</body>
</html>