<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/content/common/common.jsp"%>
<c:set var="pageTitle" value="${empty obj ? '添加数据源对象':'修改数据源对象' }" scope="page" />
<html>
<head>
<title>${pageTitle }</title>
</head>
<body>
<%@ include file="/WEB-INF/content/meta/Project/selProject.jsp" %>

	<div class="page-content">
		<div class="container-fluid">
			<!-- 页面导航 -->
			<tool:navBar pageTitle="${pageTitle }"
				pageTitleContent="数据源管理-${pageTitle }" titleIcon="icon-home" />
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
							<form action="${ctx}/meta/DataSource/edit" class="form-horizontal form_sync" method="post" id="form1">
								<input type="hidden" value="${obj.id}" name="id"/>
								<input type="hidden" value="${obj.project.id}" name="project.id" id="projectId"/>
								<div class="control-group">
									<label class="control-label">项目:</label>
									<div class="controls">
										<input type="text" class="span6 m-wrap" validate="{required:true}"	name="project.projectName" id="projectName" value="${obj.project.projectName}" readonly="readonly" onfocus="showProject()" />
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
									<label class="control-label">jdbc driver classname:</label>
									<div class="controls">
										<input type="text" class="span6 m-wrap"
											validate="{required:true}"
											name="driverClassName" value="${obj.driverClassName }" />
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
									<label class="control-label">jdbc用户:</label>
									<div class="controls">
										<input type="text" class="span6 m-wrap"
											validate="{required:true}"
											name="jdbcUser" value="${obj.jdbcUser }" />
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
									<label class="control-label">数据库类别:</label>
									<div class="controls">
									<mytags:dictSelect field="dbType" id="dbType" defaultVal="${obj.dbType}" hasLabel="false" codeType="10" />
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
	function showProject(){
		$("#projectList").modal();
	}
	function selProject(obj){
		var flag = Page.selectsPrompt();
		if(!flag) return;
		
		var obj = $("#sample_1").find("td :checkbox:checked");
		$('input[id=projectName]').val(obj.first().attr("data-text"));
		$('input[id=projectId]').val(flag);
		$('#projectList').modal('hide');
	}
</script>
</body>
</html>