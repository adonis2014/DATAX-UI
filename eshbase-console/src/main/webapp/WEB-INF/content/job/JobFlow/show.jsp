<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/content/common/common.jsp"%>
<c:set var="pageTitle" value="${'查看作业项目定义'}" scope="page" />
<html>
<head>
<title>${pageTitle }</title>
</head>
<body>
	<div class="page-content">
		<div class="container-fluid">
			<!-- 页面导航 -->
			<tool:navBar pageTitle="${pageTitle }" pageTitleContent="作业管理-作业项目管理-${pageTitle }" titleIcon="icon-home" />
			<!-- 主体内容 -->
			<div class="row-fluid">
				<div class="span12">
					<div class="portlet box blue tabbable">
						<div class="portlet-title">
							<h4>
								<i class="icon-reorder"></i>${pageTitle }
							</h4>
						</div>
						<div class="portlet-body form">
							<div class="tabbable portlet-tabs">
								<ul class="nav nav-tabs">
									<li ><a href="#portlet_tab3" data-toggle="tab">运行记录</a></li>
									<li><a href="#portlet_tab2" data-toggle="tab">调度中任务</a></li>
									<li class="active"><a href="#portlet_tab1" data-toggle="tab">基本信息</a></li>
								</ul>
								<div class="tab-content">
									<div class="tab-pane active" id="portlet_tab1">
										<form action="${ctx}/job/JobFlow/show/${obj.id}" class="form-horizontal form_sync" method="post" id="form1">
											<input type="hidden" value="${obj.jobclass.id}" name="jobclass.id" id="jobclassId" /> <input type="hidden" value="${obj.id}" name="id">
											<table class="dbform" width="100%">
												<tr>
													<td class="fieldtitle">名称:</td>
													<td class="fieldvalue">${obj.name }</td>
													<td class="fieldtitle">作业类:</td>
													<td class="fieldvalue">${obj.jobclass.name}</td>
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
											<div class="form-actions">
												<a class='btn' href="${header.Referer }">返回</a>
											</div>

										</form>
									</div>
									<div class="tab-pane" id="portlet_tab2">
										<table class="table table-striped table-bordered table-hover" id="workers" width="100%">
											<thead>
												<tr>
													<th>名称</th>
													<th>类名</th>
													<th>方法</th>
													<th>参数</th>
													<th>作业启动时间的cron表达式</th>
													<th>下次执行时间</th>
													<th>启用标记</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach items="${workers}" var="worker">
												<tr>
													<td>${worker.name}</td>
													<td>${worker.jobClassName}</td>
													<td>${worker.methodName}</td>
													<td>${worker.jobParameter}</td>
													<td>${worker.cron}</td>
													<td>${worker.nextExeDate}</td>
													<td><mytags:dictSelect field="checkLabel" codeType="17" defaultVal="${worker.checkLabel}" type="label" hasLabel="false"/> </td>
												</tr>
												</c:forEach>
											</tbody>
										</table>
									</div>
									<div class="tab-pane" id="portlet_tab3">
											<table class="table table-striped table-bordered table-hover" id="executeLogs"></table>
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
<%@ include file="/WEB-INF/content/common/plugins/page.jsp"%>
	<script type="text/javascript">
		$(function() {
			App.activeMenu("job/JobFlow/list");
			Page.initData(
					{
						url:"${ctx}/job/JobFlow/executionPage",
						pageNo : 1,
						pageSize : 10,
						tableId : "#executeLogs"
					},
					{flowId:${obj.id}},
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
							 {cName:"machine",cValue:"执行机器",format:function(i,value,item){
								 if(App.isNundef(value)){
									 return '<a href="${ctx}/job/Machine/show/'+item.machineId+'">'+item.machine.machineName+"["+item.machine.address+"]"+'</a>';
								 }
								 return value;
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