<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/content/common/common.jsp"%>
<c:set var="pageTitle" value="${empty obj ? '添加数据字段转换定义':'修改数据字段转换定义' }" scope="page" />
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
							<form action="${ctx}/etl/taskColumn/edit" class="form-horizontal form_sync"
								method="post" id="form1">
								
								<input type="hidden" value="${obj.id}" name="id">
								<div class="control-group">
									<label class="control-label">数据源定义ID:</label>
									<div class="controls">
										<input type="text" class="span6 m-wrap"
											validate="{required:true}"
											name="dsDefineId" value="${obj.dsDefineId }" />
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">字段ID:</label>
									<div class="controls">
										<input type="text" class="span6 m-wrap"
											validate="{required:true}"
											name="columnIdx" value="${obj.columnIdx }" />
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">列族名:</label>
									<div class="controls">
										<input type="text" class="span6 m-wrap"
											validate="{required:true}"
											name="familyName" value="${obj.familyName }" />
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">列名:</label>
									<div class="controls">
										<input type="text" class="span6 m-wrap"
											validate="{required:true}"
											name="column_name" value="${obj.column_name }" />
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">原数据类别:</label>
									<div class="controls">
										<input type="text" class="span6 m-wrap"
											validate="{required:true}"
											name="fieldSourceType" value="${obj.fieldSourceType }" />
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">字段类别:</label>
									<div class="controls">
										<input type="text" class="span6 m-wrap"
											validate="{required:true}"
											name="fieldType" value="${obj.fieldType }" />
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">字段数据处理函数:</label>
									<div class="controls">
										<input type="text" class="span6 m-wrap"
											validate="{required:true}"
											name="functionName	" value="${obj.functionName	 }" />
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">关键字字段数据处理函数:</label>
									<div class="controls">
										<input type="text" class="span6 m-wrap"
											validate="{required:true}"
											name="pkFunctionName" value="${obj.pkFunctionName }" />
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">字段处理脚本:</label>
									<div class="controls">
										<input type="text" class="span6 m-wrap"
											validate="{required:true}"
											name="script" value="${obj.script }" />
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">脚本类别:</label>
									<div class="controls">
										<input type="text" class="span6 m-wrap"
											validate="{required:true}"
											name="script_type" value="${obj.script_type }" />
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">自定义类名:</label>
									<div class="controls">
										<input type="text" class="span6 m-wrap"
											validate="{required:true}"
											name="class_name" value="${obj.class_name }" />
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">字段排序值:</label>
									<div class="controls">
										<input type="text" class="span6 m-wrap"
											validate="{required:true}"
											name="sort_id" value="${obj.sort_id }" />
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
		App.activeMenu("etl/taskColumn/list");
	});
</script>
</body>
</html>