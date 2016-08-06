<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/content/common/common.jsp"%>
<html>
<head>
<title>作业流程定义列表</title>
</head>
<body>
	<div class="page-content">
		<div class="container-fluid">
			<!-- 页面导航 -->
			<tool:navBar pageTitle="作业流定义列表" pageTitleContent="内容管理-作业流定义管理-作业流定义列表" titleIcon="icon-home"/>
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
	                                 	<div class="span8 ">
		                                    <div class="control-group">
		                                       <div class="controls">
		                                          <input type="text" id="filters" class="m-wrap span10" placeholder="名称,作业类,建立者,更新者,启用标记,备注">
		                                       </div>
		                                    </div>
	                                 	</div>
	                                 	<div class="span4">
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
								<tool:operBtns  modelKey="jobflow" modelName="job"></tool:operBtns>
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
	var dbtypeMap = new Map();  
	<mytags:dictSelect field="dbtypeMap" id="dbtypeMap" type="map" hasLabel="false" codeType="17" />
	
	App.activeMenu("job/JobFlow/list");
	
	Page.initData(
		{
			url:"${ctx}/job/JobFlow/page",
			pageNo : 1,
			pageSize : 10,
			tableId : "#sample_1"
		},
		null,
		[
			 	{cName:"name",cValue:"名称"},
			 	{cName:"jobClass",cValue:"作业类",format:function(i,value,item){
					  var $a = $('<a data-original-title="点击访问" data-placement="right" class="tooltips" href="../JobClass/show/'+item.jobclass.id+'" >'+item.jobclass.name+'</a>');
					  return $a;
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
						 return new Date(value).format("yyyy-MM-dd hh:mm:ss");
					 }
					 return value;
				 }},
			 	{cName:"updateDate",cValue:"更新时间",format:function(i,value,item){
					 if(App.isNundef(value)){
						 return new Date(value).format("yyyy-MM-dd hh:mm:ss");
					 }
					 return value;
				 }},
			 	{cName:"checkLabel",cValue:"启用标记",format:function(i,value,item){
			 		return dbtypeMap.get(item.checkLabel);
			 	}},
			  	{cName:"remark",cValue:"备注"}
		 ]
	);
});

function checkObj(){
	var boxes = $("#sample_1").find("td :checkbox:checked");
	if(boxes.length == 0){
		App.alert("请选中一条记录");
		return;
	}
	var f = document.createElement("form");
	document.body.appendChild(f);
	$.each(boxes,function(i,item){
			var i = document.createElement("input");
			i.type = "hidden";
			i.name = "ids";
			i.value = $(item).attr("data-id");
			f.appendChild(i);
	});
		f.action = Page.subUrl() + "/checkJobFlow";
		f.method = "POST";
		f.submit();
}

function doQuery(){
	var queryObj = {
			search_LIKES_name_OR_jobClassId_OR_createbyId_OR_updatebyId_OR_createDate_OR_updateDate_OR_checkLabel_OR_remark : App.isEqPlacehoder($("#filters"))
		};
	Page.doQuery(queryObj);
}
</script>
</body>
</html>