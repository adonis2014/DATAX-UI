<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/content/common/common.jsp"%>
<c:set var="pageTitle" value="${empty obj ? '添加插件参数':'修改插件参数' }" scope="page" />
<html>
<head>
<title>${pageTitle }</title>
</head>
<body>
	<div class="page-content">
		<div class="container-fluid">
			<!-- 页面导航 -->
			<tool:navBar pageTitle="${pageTitle }"
				pageTitleContent="内容管理-{functionName}管理-${pageTitle }" titleIcon="icon-home" />
			<!-- 主体内容 -->
			<div class="row-fluid">
				<div class="span12">
					<div class="portlet box blue">
						<div class="portlet-title">
							<h4>
								<i class="icon-reorder"></i>请填写表单
							</h4>
							<div class="tools">
								<a href="javascript:;" class="collapse"></a> <a
									href="javascript:;" class="remove"></a>
							</div>
						</div>
						<div class="portlet-body form">
							<form action="${ctx}/etl/etlPluginParam/edit" class="form-horizontal form_sync"
								method="post" id="form1">
								
								<input type="hidden" value="${obj.id}" name="id">
								<div class="control-group">
									<label class="control-label">插件ID:</label>
									<div class="controls">
										<input type="text" class="span6 m-wrap"
											validate="{required:true}"
											name="pluginId" value="${obj.pluginId }" />
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">任务参数ID:</label>
									<div class="controls">
										<input type="text" class="span6 m-wrap"
											validate="{required:true}"
											name="taskParamId" value="${obj.taskParamId }" />
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">插件名:</label>
									<div class="controls">
										<input type="text" class="span6 m-wrap"
											validate="{required:true}"
											name="name" value="${obj.name }" />
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">是否必须:</label>
									<div class="controls">
										<input type="text" class="span6 m-wrap"
											validate="{required:true}"
											name="mandatory" value="${obj.mandatory }" />
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">默认值:</label>
									<div class="controls">
										<input type="text" class="span6 m-wrap"
											validate="{required:true}"
											name="default" value="${obj.default }" />
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">是否列:</label>
									<div class="controls">
										<input type="text" class="span6 m-wrap"
											validate="{required:true}"
											name="isColumn" value="${obj.isColumn }" />
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">备注:</label>
									<div class="controls">
										<input type="text" class="span6 m-wrap"
											validate="{required:true}"
											name="description" value="${obj.description }" />
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
	$(function(){
		App.activeMenu("etl/etlPluginParam/list");
	});
</script>
</body>
</html>