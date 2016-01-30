<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/content/common/common.jsp"%>
<c:set var="pageTitle" value="${empty obj ? '添加ETL插件':'修改ETL插件' }" scope="page" />
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
							<form action="${ctx}/etl/etlPlugin/edit" class="form-horizontal form_sync"
								method="post" id="form1">
								
								<input type="hidden" value="${obj.id}" name="id">
								<div class="control-group">
									<label class="control-label">插件名:</label>
									<div class="controls">
										<input type="text" class="span6 m-wrap"
											validate="{required:true}"
											name="pluginName" value="${obj.pluginName }" />
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">插件类别:</label>
									<div class="controls">
										<input type="text" class="span6 m-wrap"
											validate="{required:true}"
											name="pluginType" value="${obj.pluginType }" />
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">类名:</label>
									<div class="controls">
										<input type="text" class="span6 m-wrap"
											validate="{required:true}"
											name="className" value="${obj.className }" />
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">版本:</label>
									<div class="controls">
										<input type="text" class="span6 m-wrap"
											validate="{required:true}"
											name="version" value="${obj.version }" />
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">数据源目标:</label>
									<div class="controls">
										<input type="text" class="span6 m-wrap"
											validate="{required:true}"
											name="target" value="${obj.target }" />
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">jar包名:</label>
									<div class="controls">
										<input type="text" class="span6 m-wrap"
											validate="{required:true}"
											name="jarName" value="${obj.jarName }" />
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">备注:</label>
									<div class="controls">
										<input type="text" class="span6 m-wrap"
											validate="{required:true}"
											name="remark" value="${obj.remark }" />
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">线程数:</label>
									<div class="controls">
										<input type="text" class="span6 m-wrap"
											validate="{required:true}"
											name="maxThreadNum" value="${obj.maxThreadNum }" />
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">启用标记:</label>
									<div class="controls">
										<input type="text" class="span6 m-wrap"
											validate="{required:true}"
											name="checkLabel" value="${obj.checkLabel }" />
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
		App.activeMenu("etl/etlPlugin/list");
	});
</script>
</body>
</html>