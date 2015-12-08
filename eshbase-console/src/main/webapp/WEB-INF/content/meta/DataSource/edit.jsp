<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/content/common/common.jsp"%>
<c:set var="pageTitle" value="${empty obj ? '添加数据源对象':'修改数据源对象' }" scope="page" />
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
							<form action="${ctx}/meta/dataSource/edit" class="form-horizontal form_sync"
								method="post" id="form1">
								
								<input type="hidden" value="${obj.id}" name="id">
								<div class="control-group">
									<label class="control-label">项目ID:</label>
									<div class="controls">
										<input type="text" class="span6 m-wrap"
											validate="{required:true}"
											name="project" value="${obj.project }" />
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">jdbc driver classname:</label>
									<div class="controls">
										<input type="text" class="span6 m-wrap"
											validate="{required:true}"
											name="driverCLassName" value="${obj.driverCLassName }" />
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">jdbc登录密码:</label>
									<div class="controls">
										<input type="text" class="span6 m-wrap"
											validate="{required:true}"
											name="jdbcPassword" value="${obj.jdbcPassword }" />
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">jdbc连接url:</label>
									<div class="controls">
										<input type="text" class="span6 m-wrap"
											validate="{required:true}"
											name="jdbcUrl" value="${obj.jdbcUrl }" />
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">数据库类别:</label>
									<div class="controls">
										<input type="text" class="span6 m-wrap"
											validate="{required:true}"
											name="dbType" value="${obj.dbType }" />
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">jdbc用户:</label>
									<div class="controls">
										<input type="text" class="span6 m-wrap"
											validate="{required:true}"
											name="jdbcUser" value="${obj.jdbcUser }" />
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">schema名称:</label>
									<div class="controls">
										<input type="text" class="span6 m-wrap"
											validate="{required:true}"
											name="schemaName" value="${obj.schemaName }" />
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">db名称:</label>
									<div class="controls">
										<input type="text" class="span6 m-wrap"
											validate="{required:true}"
											name="dbName" value="${obj.dbName }" />
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">建立者:</label>
									<div class="controls">
										<input type="text" class="span6 m-wrap"
											validate="{required:true}"
											name="createbyId" value="${obj.createbyId }" />
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">更新者:</label>
									<div class="controls">
										<input type="text" class="span6 m-wrap"
											validate="{required:true}"
											name="updatebyId" value="${obj.updatebyId }" />
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">建立世间:</label>
									<div class="controls">
										<input type="text" class="span6 m-wrap"
											validate="{required:true}"
											name="createDate" value="${obj.createDate }" />
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">更新世间:</label>
									<div class="controls">
										<input type="text" class="span6 m-wrap"
											validate="{required:true}"
											name="updateDate" value="${obj.updateDate }" />
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
		App.activeMenu("meta/dataSource/list");
	});
</script>
</body>
</html>