<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/content/common/common.jsp"%>
<c:set var="pageTitle" value="${'作业调度信息' }" scope="page" />
<html>
<head>
<title>${pageTitle }</title>
</head>
<body>
	<div class="page-content">
		<div class="container-fluid">
			<!-- 页面导航 -->
			<tool:navBar pageTitle="${pageTitle }" pageTitleContent="作业管理-作业调度-${pageTitle }" titleIcon="icon-home" />
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
									<li><a href="#portlet_tab2" data-toggle="tab">运行记录</a></li>
									<li class="active"><a href="#portlet_tab1" data-toggle="tab">基本信息</a></li>
								</ul>
								<div class="tab-content">
									<div class="tab-pane active" id="portlet_tab1">
										<input type="hidden" value="${obj.id}" name="id">
										<table class="dbform" width="100%">
											<tr>
												<td class="fieldtitle" style="width: 25%">名称:</td>
												<td class="fieldvalue" style="width: 25%">${obj.name}</td>
												<td class="fieldtitle" style="width: 25%">作业类:</td>
												<td class="fieldvalue" style="width: 25%">${obj.jobclass.name}</td>
											</tr>
											<tr>
												<td class="fieldtitle">逻辑名:</td>
												<td class="fieldvalue">${obj.logicName}</td>
												<td class="fieldtitle">作业类名:</td>
												<td class="fieldvalue"><div style="overflow: auto; width: 150px;">${obj.jobClassName}</div></td>
											</tr>
											<tr>
												<td class="fieldtitle">作业分片总数:</td>
												<td class="fieldvalue">${obj.shardingTotalCount }</td>
												<td class="fieldtitle">作业启动时间的cron表达式:</td>
												<td class="fieldvalue">${obj.cron }</td>
											</tr>
											<tr>
												<td class="fieldtitle">分片序列号和个性化参数对照表:</td>
												<td class="fieldvalue">${obj.shardingItemParameters}</td>
												<td class="fieldtitle">作业自定义参数:</td>
												<td class="fieldvalue">${obj.jobParameter}</td>
											</tr>
											<tr>
												<td class="fieldtitle">监控作业执行时状态:</td>
												<td class="fieldvalue">${obj.monitorExecution }</td>
												<td class="fieldtitle">统计作业处理数据数量的间隔时间:</td>
												<td class="fieldvalue">${obj.processCountInterval }</td>
											</tr>
											<tr>
												<td class="fieldtitle">处理数据的并发线程数:</td>
												<td class="fieldvalue">${obj.dataProcessThread }</td>
												<td class="fieldtitle">每次抓取的数据量:</td>
												<td class="fieldvalue">${obj.fetchDataCount }</td>
											</tr>
											<tr>
												<td class="fieldtitle">最大容忍的本机与注册中心的时间误差秒数:</td>
												<td class="fieldvalue">${obj.maxtimeDiff }</td>
												<td class="fieldtitle">是否开启失效转移:</td>
												<td class="fieldvalue">${obj.failover }</td>
											</tr>
											<tr>
												<td class="fieldtitle">是否开启misfire:</td>
												<td class="fieldvalue">${obj.misfire }</td>
												<td class="fieldtitle">作业分片策略实现类全路径:</td>
												<td class="fieldvalue">${obj.shardingStrategyClass }</td>
											</tr>
											<tr>
												<td class="fieldtitle">作业是否禁止启动:</td>
												<td class="fieldvalue">${obj.disabled }</td>
												<td class="fieldtitle">本地配置是否可覆盖注册中心配置:</td>
												<td class="fieldvalue">${obj.overwrite }</td>
											</tr>
											<c:if test="${not empty obj}">
												<tr>
													<td class="fieldtitle">建立者:</td>
													<td class="fieldvalue">${obj.creater.name}</td>
													<td class="fieldtitle">更新者:</label>
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
												<td class="fieldtitle">启用标记:</td>
												<td class="fieldvalue"><mytags:dictSelect field="checkLabelMap" id="checkLabelMap" type="label" hasLabel="false" codeType="17" defaultVal="${obj.checkLabel }" /></td>
												<td class="fieldtitle">备注:</td>
												<td class="fieldvalue">${obj.remark }</td>
											</tr>
										</table>
										<div class="form-actions">
												<a class='btn' href="${header.Referer }">返回</a>
										</div>
									</div>
									<div class="tab-pane" id="portlet_tab2">
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
			App.activeMenu("job/JobWorker/list");
			Page.initData(
					{
						url:"${ctx}/job/JobExecutionInfo/page",
						pageNo : 1,
						pageSize : 10,
						tableId : "#executeLogs"
					},
					{search_EQL_workerId:${obj.id},orderBy : "lastCompleteTime",
						orderDir : "desc"},
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