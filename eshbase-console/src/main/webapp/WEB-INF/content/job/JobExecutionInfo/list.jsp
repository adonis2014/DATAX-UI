<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/content/common/common.jsp"%>
<html>
<head>
<title>作业任务日志列表</title>
</head>
<body>
	<div class="page-content">
		<div class="container-fluid">
			<!-- 页面导航 -->
			<tool:navBar pageTitle="作业任务日志列表" pageTitleContent="内容管理-作业任务日志管理-作业任务日志列表" titleIcon="icon-home"/>
			<!-- 主体内容 -->
			<div class="row-fluid">
				<div class="span12">
					<div class="portlet box purple">
						<div class="portlet-title">
							<h4>
								<i class="icon-globe"></i>列表
							</h4>
							<div class="tools">
								<a href="javascript:;" class="collapse"></a><a
									href="javascript:;" class="remove"></a>
							</div>
						</div>
						<div class="portlet-body">
							<div class="row-fluid">
								<form class="queryForm span7">
									<div class="row-fluid">
	                                 	<div class="span7 ">
		                                    <div class="control-group">
		                                       <div class="controls">
		                                          <input type="text" id="filters" class="m-wrap span12" placeholder="作业执行ID,分片项,失败跳转,状态,最后启动时间,下次触发时间,最后完成时间,建立者,更新者,建立时间,更新时间,启用标记,备注">
		                                       </div>
		                                    </div>
	                                 	</div>
	                                 	<div class="span5 ">
		                                    <div class="control-group">
		                                       <div class="controls">
		                                         <a class="btn blue" href="javascript:void(0)" onclick="javascript:doQuery();">
		                                         	<i class="icon-search"></i>
		                                         	查询</a>
		                                         <button type="reset" class="btn" onclick="javascript:Page.clearQuery();">
		                                         	<i class="icon-trash"></i>清空
		                                         </button>
		                                       </div>
		                                    </div>
	                                 	</div>
									</div>
								</form>
								<tool:operBtns modelKey="jobexecutioninfo"  modelName="job"></tool:operBtns>
							</div>
							<table class="table table-striped table-bordered table-hover" id="sample_1">
								
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
<%@ include file="/WEB-INF/content/common/plugins/page.jsp"%>
<script type="text/javascript">
$(document).ready(function() {
	
	App.activeMenu("job/JobExecutionInfo/list");
	
	Page.initData(
		{
			url:"${ctx}/job/JobExecutionInfo/page",
			pageNo : 1,
			pageSize : 10,
			tableId : "#sample_1"
		},
		null,
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

function doQuery(){
	var queryObj = {
			search_LIKES_workerId_OR_item_OR_failoverIp_OR_status_OR_lastBeginTime_OR_nextFireTime_OR_lastCompleteTime_OR_createbyId_OR_updatebyId_OR_createDate_OR_updateDate_OR_checkLabel_OR_remark : App.isEqPlacehoder($("#filters"))
		};
	Page.doQuery(queryObj);
}
</script>
</body>
</html>