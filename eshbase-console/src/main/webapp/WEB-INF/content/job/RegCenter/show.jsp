<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/content/common/common.jsp"%>
<c:set var="pageTitle" value="${'查看注册中心'}" scope="page" />
<html>
<head>
<title>${pageTitle }</title>
</head>
<body>
	<div class="page-content">
		<div class="container-fluid">
			<!-- 页面导航 -->
			<tool:navBar pageTitle="${pageTitle }" pageTitleContent="作业管理-注册中心管理-${pageTitle }" titleIcon="icon-home" />
			<!-- 主体内容 -->
			<div class="row-fluid">
				<div class="span12">
					<div class="portlet box blue tabbable">
						<div class="portlet-title">
							<h4>
								<i class="icon-reorder"></i>注册中心
							</h4>
							
						</div>
						<div class="portlet-body form">
							<div class="tabbable portlet-tabs">
									<ul class="nav nav-tabs">
										<li ><a href="#portlet_tab4" data-toggle="tab">运行记录</a></li>
										<li ><a href="#portlet_tab3" data-toggle="tab">调度作业</a></li>
										<li ><a href="#portlet_tab2" data-toggle="tab">运行终端</a></li>
										<li  class="active"><a href="#portlet_tab1" data-toggle="tab">基本信息</a></li>
									</ul>
									<div class="tab-content">
										<div class="tab-pane active" id="portlet_tab1">
											<form action="${ctx}/job/RegCenter/show" class="form-horizontal form_sync" method="post" id="form1">
												<input type="hidden" value="${obj.id}" name="id">
												<table width="100%"  class="dbform">
													<tbody>
													<tr>
														<td class="fieldtitle" >名称:</td>
														<td class="fieldvalue">${obj.name}</td>
														<td class="fieldtitle" >ZK列表:</td>
														<td class="fieldvalue">${obj.zkQuorumPeer }</td>
													</tr>
													<tr>
														<td class="fieldtitle">命名空间:</td>
														<td class="fieldvalue">${obj.nameSpace}</td>
														<td class="fieldtitle">待重试间隔时间:</td>
														<td class="fieldvalue">${obj.baseSleepTime }</td>
													</tr>
													<tr>
														<td class="fieldtitle">待重试间隔时间最大值:</td>
														<td class="fieldvalue">${obj.maxSleepTime}</td>
														<td class="fieldtitle">最大重试次数:</td>
														<td class="fieldvalue">${obj.maxRetries }</td>
													</tr>
													<tr>
														<td class="fieldtitle">登录凭证:</td>
														<td class="fieldvalue">${obj.loginCert}</td>
														<td class="fieldtitle">启用标记:</td>
														<td class="fieldvalue"><mytags:dictSelect field="checkLabelMap" id="checkLabelMap" type="label" hasLabel="false" codeType="17" defaultVal="${obj.checkLabel }" /></td>
													</tr>
													<tr>
														<td class="fieldtitle">建立者:</td>
														<td class="fieldvalue">${obj.creater.name}</td>
														<td class="fieldtitle">更新者:</td>
														<td class="fieldvalue">${obj.updater.name }</td>
													</tr>
													<tr>
														<td class="fieldtitle">建立时间:</td>
														<td class="fieldvalue">${obj.createDate}</td>
														<td class="fieldtitle">更新时间:</td>
														<td class="fieldvalue">${obj.updateDate }</td>
													</tr>
													<tr>
														<td class="fieldtitle">备注:</td>
														<td colspan="3" class="fieldvalue">${obj.remark}</td>
													</tr>
													</tbody>
												</table>								
											</form>
										</div>
										<div class="tab-pane" id="portlet_tab2">
										<table width="100%"  class="dbgrid">
											<thead>
												<tr>
													<th>终端名</th>
													<th>终端地址</th>
													<th>机器名</th>
													<th>ssh端口</th>
													<th>登录名</th>
													<th>登录密码</th>
													<th>工作路径</th>
													<th>启用标记</th>
													<th>备注</th>
												</tr>
											</thead>
											<tbody>
											<c:forEach items="${machines}" var="machine">
											<tr>
												<td>${machine.machineName}</td>
												<td>${machine.address}</td>
												<td>${machine.hostName}</td>
												<td>${machine.sshPort}</td>
												<td>${machine.loginName}</td>
												<td>${machine.loginPassword}</td>
												<td>${machine.userDir}</td>
												<td><mytags:dictSelect field="checkLabelMap" id="checkLabelMap" type="label" hasLabel="false" codeType="17" defaultVal="${machine.checkLabel}"/></td>
												<td>${machine.remark}</td>
											</tr>
											</c:forEach>
											</tbody>
										</table>
										</div>
										<div class="tab-pane" id="portlet_tab3">
											<table width="100%"  class="dbgrid">
												<thead>
													<tr>
														<th>名称</th>
														<th>逻辑名</th>
														<th>作业分片总数</th>
														<th>作业启动时间的cron表达式</th>
														<th>监控作业执行时状态</th>
														<th>启用标记</th>
													</tr>
												</thead>
												<tbody>
												<c:forEach items="${workers}" var="worker">
												<tr>
													<td>${worker.name}</td>
													<td>${worker.logicName}</td>
													<td>${worker.shardingTotalCount}</td>
													<td>${worker.cron}</td>
													<td>${worker.monitorExecution}</td>
													<td><mytags:dictSelect field="checkLabelMap" id="checkLabelMap" type="label" hasLabel="false" codeType="17" defaultVal="${worker.checkLabel}"/></td>
												</tr>
												</c:forEach>
												</tbody>
											</table>
										</div>
										<div class="tab-pane" id="portlet_tab4">
											<table class="table table-striped table-bordered table-hover" id="executeLogs">
								
											</table>
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
	<script type="text/javascript" src="${ctx}/assets/js/map.js"></script>	
	<script type="text/javascript">
		$(function() {
			App.activeMenu("job/RegCenter/list");
			Page.initData(
					{
						url:"${ctx}/job/JobExecutionInfo/page",
						pageNo : 1,
						pageSize : 10,
						tableId : "#executeLogs"
					},
					{search_EQL_regId:${obj.id}},
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