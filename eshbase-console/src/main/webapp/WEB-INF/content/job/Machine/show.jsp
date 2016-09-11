<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/content/common/common.jsp"%>
<c:set var="pageTitle" value="${'查看作业终端'}" scope="page" />
<html>
<head>
<title>${pageTitle }</title>
<style type="text/css">
A { text-decoration: none} 
</style>
</head>
<body>
	<div class="page-content">
		<div class="container-fluid">
			<!-- 页面导航 -->
			<tool:navBar pageTitle="${pageTitle }" pageTitleContent="作业管理-作业终端管理-${pageTitle }" titleIcon="icon-home" />
			<!-- 主体内容 -->
			<div class="row-fluid">
				<div class="span12">
				<!-- BEGIN TAB PORTLET-->   
						<div class="portlet box blue tabbable">
							<div class="portlet-title">
								<h4><i class="icon-reorder"></i>${pageTitle }</h4>
							</div>
							<div class="portlet-body  form">
								<div class="tabbable portlet-tabs">
									<ul class="nav nav-tabs">
										<li ><a href="#portlet_tab2" data-toggle="tab">运行记录</a></li>
										<li  class="active"><a href="#portlet_tab1" data-toggle="tab">基本信息</a></li>
									</ul>
									<div class="tab-content">
										<div class="tab-pane active" id="portlet_tab1">
											<form action="${ctx}/job/Machine/show" class="form-horizontal form_sync" method="post" id="form1">
												<input type="hidden" value="${obj.id}" name="id">
												<table class="dbform" width="100%">
													<tr>
														<td class="fieldtitle">终端名:</td>
														<td class="fieldvalue">${obj.machineName }</td>
														<td class="fieldtitle">终端地址:</td>
														<td class="fieldvalue">${obj.address }</td>
													</tr>
													<tr>
														<td class="fieldtitle">机器名:</td>
														<td class="fieldvalue" colspan="3">${obj.hostName }</td>
													</tr>
													<tr>
														<td class="fieldtitle">ssh端口:</td>
														<td class="fieldvalue">${obj.sshPort }</td>
														<td class="fieldtitle">工作路径:</td>
														<td class="fieldvalue">${obj.userDir }</td>
													</tr>
													<tr>
															<td class="fieldtitle">登录名:</td>
															<td class="fieldvalue">${obj.loginName }</td>
															<td class="fieldtitle">登录密码:</td>
															<td class="fieldvalue">${obj.loginPassword }</td>
													</tr>
												<c:if test="${not empty obj}">
													<tr>
														<td class="fieldtitle">建立者:</td>
														<td class="fieldvalue">${obj.creater.name}</td>
														<td class="fieldtitle">更新者:</td>
														<td class="fieldvalue">${obj.updater.name}</td>
													</tr>
													<tr>
														<td class="fieldtitle">建立时间:</td>
														<td class="fieldvalue">${obj.createDate }</td>
														<td class="fieldtitle">更新时间:</td>
														<td class="fieldvalue">${obj.updateDate}</td>
													</tr>
												</c:if>
													<tr>
														<td class="fieldtitle">备注:</td>
														<td class="fieldvalue" colspan="3">${obj.remark }</td>
													</tr>
												</table>
				
				
												
											</form>
										</div>
										<div class="tab-pane" id="portlet_tab2">
											<table class="table table-striped table-bordered table-hover" id="executeLogs">
								
											</table>
										</div>
									</div>
								</div>
							</div>
						</div>
				</div>
				<div class="form-actions">
					<a class='btn' href="${header.Referer }">返回</a>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="/WEB-INF/content/common/plugins/jquery-validation.jsp"%>
	<%@ include file="/WEB-INF/content/common/plugins/page.jsp"%>
	<script type="text/javascript" src="${ctx}/assets/js/map.js"></script>
	<script type="text/javascript">
		$(function() {
			App.activeMenu("job/Machine/list");
			Page.initData(
					{
						url:"${ctx}/job/JobExecutionInfo/page",
						pageNo : 1,
						pageSize : 10,
						tableId : "#executeLogs"
					},
					{search_EQL_machineId:${obj.id}},
					[
						 	{cName:"id",cValue:"ID",format:function(i,value,item){
								 if(App.isNundef(value)){
									 return '<a href="${ctx}/job/JobExecutionInfo/show/'+value+'">'+value+'</a>';
								 }
								 return value;
							 }},
						 	{cName:"workerId",cValue:"执行作业",format:function(i,value,item){
								 if(App.isNundef(value)){
									 return '<a href="${ctx}/job/JobWorker/show/'+value+'">'+item.worker.name+'</a>';
								 }
								 return value;
							 }},
						 	{cName:"worker",cValue:"执行类",format:function(i,value,item){
								 if(App.isNundef(value)){
									 return  '<a href="${ctx}/job/JobClass/show/'+item.worker.jobclass.id+'">'+item.worker.jobClassName+'#'+item.worker.methodName+'</a>';
								 }
								 return  value;
							 }},
							{cName:"lastBeginTime",cValue:"启动时间",format:function(i,value,item){
								 if(App.isNundef(value)){
									 return new Date(value).format("yyyy-MM-dd hh:mm:ss");
								 }
								 return value;
							 }
						},
						{cName:"lastCompleteTime",cValue:"完成时间",format:function(i,value,item){
							 if(App.isNundef(value)){
								 return new Date(value).format("yyyy-MM-dd hh:mm:ss");
							 }
							 return value;
						 }
					},{cName:"nextFireTime",cValue:"下次触发时间",format:function(i,value,item){
								 if(App.isNundef(value)){
									 return new Date(value).format("yyyy-MM-dd hh:mm:ss");
								 }
								 return value;
							 }
						},
						
						{cName:"exeResult",cValue:"执行结果",format:function(i,value,item){
							 if(value=="0"){
								 return "成功";
							 }else if(value=="-1"){
								 return "失败";
							 }else{
								 return value;
							 }
						 }}
					 ]
				);
		});
	</script>
</body>
</html>