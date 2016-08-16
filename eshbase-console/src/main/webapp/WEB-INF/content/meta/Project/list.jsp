<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/content/common/common.jsp"%>
<html>
<head>
<title>项目对象列表</title>
</head>
<body>
	<div class="page-content">
		<div class="container-fluid">
			<!-- 页面导航 -->
			<tool:navBar pageTitle="项目对象列表" pageTitleContent="元数据管理-项目对象管理-项目对象列表" titleIcon="icon-home"/>
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
	                                 	<div class="span6 ">
		                                    <div class="control-group">
		                                       <div class="controls">
		                                          <input type="text" id="filters" class="m-wrap span12" placeholder="项目编码,项目名称,备注">
		                                       </div>
		                                    </div>
	                                 	</div>
	                                 	<div class="span4 ">
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
								<tool:operBtns modelKey="project" modelName="meta"></tool:operBtns>
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
	App.activeMenu("meta/Project/list");
	var statusMap = new Map();  
	<mytags:dictSelect field="statusMap" id="statusMap" type="map" hasLabel="false" codeType="17" />
	Page.initData(
		{
			url:"${ctx}/meta/Project/page",
			pageNo : 1,
			pageSize : 10,
			tableId : "#sample_1"
		},
		null,
		[
			 	{cName:"projectCode",cValue:"项目编码"},
			 	{cName:"projectName",cValue:"项目名称"},
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
			  	{cName:"checkLabel",cValue:"状态",format:function(i,value,item){
			  		return statusMap.get(item.checkLabel);
				 }}
		 ]
	);
});

function doQuery(){
	var queryObj = {
			search_LIKES_projectCode_OR_projectName_OR_remark : App.isEqPlacehoder($("#filters"))
		};
	Page.doQuery(queryObj);
}

function checkObj(){
	var flag = Page.selectsPrompt();
	if(!flag) return;
	window.location.href = Page.subUrl() + "/setCheckLabel/" + flag;
	
}
</script>
</body>
</html>