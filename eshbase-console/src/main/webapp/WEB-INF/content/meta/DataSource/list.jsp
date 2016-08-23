<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/content/common/common.jsp"%>
<html>
<head>
<title>数据源对象列表</title>
</head>
<body>
	<div class="page-content">
		<div class="container-fluid">
			<!-- 页面导航 -->
			<tool:navBar pageTitle="数据源对象列表" pageTitleContent="元数据管理-数据源对象管理-数据源对象列表" titleIcon="icon-home"/>
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
								<form class="queryForm span5">
									<div class="row-fluid">
	                                 	<div class="span7 ">
		                                    <div class="control-group">
		                                       <div class="controls">
		                                          <input type="text" id="filters" class="m-wrap span10" placeholder="schema名称,ds名称,备注">
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
								<tool:operBtns modelKey="datasource" modelName="meta" spannum="7"></tool:operBtns>
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
	<mytags:dictSelect field="dbtypeMap" id="dbtypeMap" type="map" hasLabel="false" codeType="10" />
	var statusMap = new Map();  
	<mytags:dictSelect field="statusMap" id="statusMap" type="map" hasLabel="false" codeType="17" />
	App.activeMenu("meta/DataSource/list");
	
	Page.initData(
		{
			url:"${ctx}/meta/DataSource/page",
			pageNo : 1,
			pageSize : 10,
			tableId : "#sample_1"
		},
		null,
		[
		 	{cName:"dsName",cValue:"ds名"},
		 	{cName:"schemaName",cValue:"schema"},
		 	{cName:"dbType",cValue:"类别",format:function(i,value,item){
			 		return dbtypeMap.get(item.dbType);
			 }},
			{cName:"remark",cValue:"备注"},
			{cName:"checkLabel",cValue:"状态",format:function(i,value,item){
			  		return statusMap.get(item.checkLabel);
			}},{cName:"operate",cValue:"元数据",format:function(i,value,item){
			  		return '<a href="${ctx}/meta/DataSource/importMeta/'+item.id+'">导入</a>&nbsp;&nbsp;<a href="${ctx}/meta/DataSource/addJob/'+item.id+'">调度作业</a>';
			}}
		 ]
	);
});

function doQuery(){
	var queryObj = {
			search_LIKES_schemaName_OR_dsName_OR_remark : App.isEqPlacehoder($("#filters"))
		};
	Page.doQuery(queryObj);
}
function checkObj(){
	var flag = Page.selectsPrompt();
	if(!flag) return;
	window.location.href = Page.subUrl() + "/setCheckLabel/" + flag;
}
function setupParam(){
	var flag = Page.selectsPrompt();
	if(!flag) return;
	window.location.href = Page.subUrl() + "/setupParam/" + flag;
}
</script>
</body>
</html>