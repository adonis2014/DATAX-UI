<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/content/common/common.jsp"%>
<html>
<head>
<title>ETL调度作业列表</title>
</head>
<body>
	<div class="page-content">
		<div class="container-fluid">
			<!-- 页面导航 -->
			<tool:navBar pageTitle="ETL调度作业列表" pageTitleContent="ETL管理-ETL调度作业管理-ETL调度作业列表" titleIcon="icon-home"/>
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
								<form class="queryForm span6">
									<div class="row-fluid">
	                                 	<div class="span6 ">
		                                    <div class="control-group">
		                                       <div class="controls">
		                                          <input type="text" id="filters" class="m-wrap span12" placeholder="调度作业名,备注">
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
								<tool:operBtns modelKey="etljob" modelName="etl"></tool:operBtns>
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
<script type="text/javascript" src="${ctx}/assets/js/map.js"></script>

<script type="text/javascript">
$(document).ready(function() {
	
	App.activeMenu("etl/EtlJob/list");
	var etlTypeMap = new Map();  
	<mytags:dictSelect field="etlTypeMap" id="etlTypeMap" type="map" hasLabel="false" codeType="1034" />
	var statusMap = new Map();  
	<mytags:dictSelect field="statusMap" id="statusMap" type="map" hasLabel="false" codeType="1003" />
	Page.initData(
		{
			url:"${ctx}/etl/EtlJob/page",
			pageNo : 1,
			pageSize : 10,
			tableId : "#sample_1"
		},
		null,
		[
			 	{cName:"jobName",cValue:"调度作业名"},
			 	{cName:"etlType",cValue:"etl类别",format:function(i,value,item){
			 		return etlTypeMap.get(item.etlType);
			 	}},
			 	{cName:"status",cValue:"状态",format:function(i,value,item){
			 		return statusMap.get(item.status);
			 	}},

			 	{cName:"creater",cValue:"建立者",format:function(i,value,item){
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
				 {cName:"updater",cValue:"更新者",format:function(i,value,item){
					 if(App.isNundef(value)){
						 return value.name;
					 }
				 }},
			 	{cName:"checkLabel",cValue:"启用标记",format:function(i,value,item){
					<shiro:hasPermission name="etl:EtlJob:check">
					 var $a = $('<a href="javascript:void(0)" data-id="'+item.id+'" data-placement="right"   onclick="javascript:check(this)" ></a>');
					 if(value === 1){
						 return $a.clone().attr("data-original-title","点击停用").html('&nbsp;已启用');
					 }
					 return $a.attr("data-original-title","点击启用").html('&nbsp;已停用');
				 	</shiro:hasPermission>
					 if(value == 1){
					 	return "<span class='label label-success'>已启用</span>";
					 }
				 	return "<span class='label label-danger'>已停用</span>";
			 }}
		 ]
	);
});

function checkObj(){
	var flag = Page.selectsPrompt();
	if(!flag) return;
	window.location.href = Page.subUrl() + "/setCheckLabel/" + flag;
}
function doQuery(){
	var queryObj = {
			search_LIKES_jobName_OR_remark : App.isEqPlacehoder($("#filters"))
		};
	Page.doQuery(queryObj);
}
</script>
</body>
</html>
