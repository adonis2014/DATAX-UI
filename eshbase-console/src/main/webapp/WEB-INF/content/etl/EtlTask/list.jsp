<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/content/common/common.jsp"%>
<html>
<head>
<title>ETL任务列表</title>
</head>
<body>
	<div class="page-content">
		<div class="container-fluid">
			<!-- 页面导航 -->
			<tool:navBar pageTitle="ETL任务列表" pageTitleContent="ETL管理-ETL任务管理-ETL任务列表" titleIcon="icon-home"/>
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
								<form class="queryForm span8">
									<div class="row-fluid">
	                                 	<div class="span7 ">
		                                    <div class="control-group">
		                                       <div class="controls">
		                                          <input type="text" id="filters" class="m-wrap span12" placeholder="任务名,调度id,插件id,建立者,更新者,建立时间,更新时间,备注">
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
								<tool:operBtns modelKey="etltask"  modelName="etl"></tool:operBtns>
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
	
	App.activeMenu("etl/EtlTask/list");
	
	Page.initData(
		{
			url:"${ctx}/etl/EtlTask/page",
			pageNo : 1,
			pageSize : 10,
			tableId : "#sample_1"
		},
		null,
		[
			 	{cName:"taskName",cValue:"任务名"},

			 	{cName:"job",cValue:"调度工作",format:function(i,value,item){
					 if(App.isNundef(value)){
						 return value.jobName;
					 }
				 }},

			 	{cName:"plugin",cValue:"插件",format:function(i,value,item){
					 if(App.isNundef(value)){
						 return value.pluginName;
					 }
				 }},

			 	{cName:"creater",cValue:"建立者",format:function(i,value,item){
					 if(App.isNundef(value)){
						 return value.name;
					 }
				 }},

			 	{cName:"updater",cValue:"更新者",format:function(i,value,item){
					 if(App.isNundef(value)){
						 return value.name;
					 }
				 }},

			 	{cName:"createDate",cValue:"建立时间",format:function(i,value,item){
					 if(App.isNundef(value)){
						 return new Date(value).format("yyyy-MM-dd");
					 }
					 return value;
				 }},

			 	{cName:"updateDate",cValue:"更新时间",format:function(i,value,item){
					 if(App.isNundef(value)){
						 return new Date(value).format("yyyy-MM-dd");
					 }
					 return value;
				 }},

			  	{cName:"remark",cValue:"备注"}
		 ]
	);
});

function doQuery(){
	var queryObj = {
			search_LIKES_taskName_OR_jobId_OR_pluginId_OR_createbyId_OR_updatebyId_OR_createDate_OR_updateDate_OR_remark : App.isEqPlacehoder($("#filters"))
		};
	Page.doQuery(queryObj);
}
</script>
</body>
</html>
