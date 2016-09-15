<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/content/common/common.jsp"%>
<html>
<head>
<title>作业项目列表</title>
</head>
<body>
	<div class="page-content">
		<div class="container-fluid">
			<!-- 页面导航 -->
			<tool:navBar pageTitle="作业流定义列表" pageTitleContent="作业管理-作业项目管理-作业项目列表" titleIcon="icon-home"/>
			<!-- 主体内容 -->
			<div class="row-fluid">
				<div class="span12">
					<div class="portlet box purple">
						<div class="portlet-title">
							<h4>
								<i class="icon-globe"></i>作业项目列表
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
		                                          <input type="text" id="filters" class="m-wrap span10" placeholder="作业项目名称,备注">
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
	var flowTypeMap = new Map();  
	<mytags:dictSelect field="flowTypeMap" id="flowTypeMap" type="map" hasLabel="false" codeType="1050" />
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
			 	{cName:"name",cValue:"作业项目名称"},
			 	{cName:"jobClass",cValue:"作业类",format:function(i,value,item){
					  var $a = $('<a data-original-title="点击访问" data-placement="right" class="tooltips" href="../JobClass/show/'+item.jobclass.id+'" >'+item.jobclass.name+'</a>');
					  return $a;
				  }},
				 {cName:"jobclass",cValue:"执行类",format:function(i,value,item){
						 return "<a href='${ctx}/job/JobClass/show/"+item.jobclass.id+"'>"+value.name+"["+value.className+"#"+value.methodName+"]</a>";
				 }},
				 {cName:"jobclass",cValue:"类型",format:function(i,value,item){
						 if(App.isNundef(value)){
							 return flowTypeMap.get(value.jobType);
						 }
					 }},
				{cName:"checkLabel",cValue:"启用标记",format:function(i,value,item){
			 		return dbtypeMap.get(item.checkLabel);
			 	}},
			  	{cName:"id",cValue:"操作",format:function(i,value,item){
			  		if (item.jobclass.jobType==2){
			  			return "<a href='${ctx}/job/FlowDesign/design/"+item.id+"'>流程设置</a>&nbsp;&nbsp;<a href='javascript:scheduleFlow("+item.id+");'>调度执行</a>";
			  		}else{
			  			return "<a href='javascript:scheduleFlow("+item.id+");'>调度执行</a>";
			  		}
			 	}}
		 ]
	);
});

function scheduleFlow(flowId){
	self.location.href = Page.subUrl() + "/checkJobFlow/"+flowId;
}

function checkObj(){
	var boxes = $("#sample_1").find("td :checkbox:checked");
	if(boxes.length != 1){
		App.alert("请选中一条记录");
		return;
	}
	var id;
	$.each(boxes,function(i,item){
		id = $(item).attr("data-id");
	});
	self.location.href = Page.subUrl() + "/checkJobFlow/"+id;
}

function doQuery(){
	var queryObj = {
			search_LIKES_name_OR_remark : App.isEqPlacehoder($("#filters"))
		};
	Page.doQuery(queryObj);
}
</script>
</body>
</html>