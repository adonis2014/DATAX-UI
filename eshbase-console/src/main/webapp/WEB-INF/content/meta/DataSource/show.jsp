<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/content/common/common.jsp"%>
<c:set var="pageTitle" value="${'查看数据源对象'}" scope="page" />
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
								<i class="icon-reorder"></i>数据源详细信息
							</h4>
							<div class="tools">
								<a href="javascript:;" class="collapse"></a>
							</div>
						</div>
						<div class="portlet-body form">
							<div class="form-horizontal form-view">
								<h3 class="form-section">数据源信息<a class='btn purple pull-right' href="${header.Referer }">返回</a></h3>
								<div class="row-fluid">
									<div class="span12 ">
										<div class="control-group">
											<label class="control-label">项目:</label>
											<div class="controls">
													<span class="text bold">
														${obj.project.projectName}
													</span>
											</div>
										</div>
									</div>
								</div>
								<div class="row-fluid">
									<div class="span6 ">
										<div class="control-group">
											<label class="control-label" >schema名称:</label>
											<div class="controls">
												<span class="text">${obj.schemaName}</span>
											</div>
										</div>
									</div>
									<!--/span-->
									<div class="span6 ">
										<div class="control-group">
											<label class="control-label" >db名称:</label>
											<div class="controls">
												<span class="text">${obj.dbName}</span>
											</div>
										</div>
									</div>
								</div>
								<div class="row-fluid">
									<div class="span6 ">
										<div class="control-group">
											<label class="control-label" >jdbc class:</label>
											<div class="controls">
												<span class="text">${obj.driverClassName}</span>
											</div>
										</div>
									</div>
									<!--/span-->
									<div class="span6 ">
										<div class="control-group">
											<label class="control-label" >jdbc url:</label>
											<div class="controls">
												<span class="text">${obj.jdbcUrl}</span>
											</div>
										</div>
									</div>
								</div>
								<div class="row-fluid">
									<div class="span6 ">
										<div class="control-group">
											<label class="control-label" >jdbc 用户:</label>
											<div class="controls">
												<span class="text">${obj.jdbcUser}</span>
											</div>
										</div>
									</div>
									<!--/span-->
									<div class="span6 ">
										<div class="control-group">
											<label class="control-label">jdbc 登录密码:</label>
											<div class="controls">
												<span class="text">${obj.jdbcPassword}</span>
											</div>
										</div>
									</div>
								</div>
								<div class="row-fluid">
									<div class="span12 ">
										<div class="control-group">
											<label class="control-label">数据库类别:</label>
											<div class="controls">
													<span class="text">
														<mytags:dictSelect field="dbType" type="text" id="dbType" defaultVal="${obj.dbType}" hasLabel="false" codeType="10" />
													</span>
											</div>
										</div>
									</div>
								</div>
								<div class="row-fluid">
									<div class="span6 ">
										<div class="control-group">
											<label class="control-label" >建立者:</label>
											<div class="controls">
												<span class="text">${obj.creater.name}</span>
											</div>
										</div>
									</div>
									<!--/span-->
									<div class="span6 ">
										<div class="control-group">
											<label class="control-label">建立时间:</label>
											<div class="controls">
												<span class="text">${obj.createDate }</span>
											</div>
										</div>
									</div>
								</div>
								<div class="row-fluid">
									<div class="span6 ">
										<div class="control-group">
											<label class="control-label" >更新者:</label>
											<div class="controls">
												<span class="text">${obj.updater.name}</span>
											</div>
										</div>
									</div>
									<!--/span-->
									<div class="span6 ">
										<div class="control-group">
											<label class="control-label">更新时间:</label>
											<div class="controls">
												<span class="text">${obj.updateDate }</span>
											</div>
										</div>
									</div>
								</div>
								<div class="row-fluid">
									<div class="span12 ">
										<div class="control-group">
											<label class="control-label">备注:</label>
											<div class="controls">
													<span class="text">
														${obj.remark }
													</span>
											</div>
										</div>
									</div>
								</div>
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