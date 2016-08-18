<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/content/common/common.jsp"%>
<html>
<head>
<title>数据库列表</title>
</head>
<body>
	<div class="page-content">
		<div class="container-fluid">
			<!-- 页面导航 -->
			<tool:navBar pageTitle="数据库列表" pageTitleContent="内容管理-数据库管理-数据库列表" titleIcon="icon-home"/>
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
		                                          <input type="text" id="filters" class="m-wrap span12" placeholder="数据库名,schema名,备注">
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
								<tool:operBtns modelKey="Database" modelName="meta"></tool:operBtns>
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
	App.activeMenu("meta/Database/list");
	var dbtypeMap = new Map();  
	<mytags:dictSelect field="dbtypeMap" id="dbtypeMap" type="map" hasLabel="false" codeType="10" />
	var statusMap = new Map();  
	<mytags:dictSelect field="statusMap" id="statusMap" type="map" hasLabel="false" codeType="17" />
	
	Page.initData(
		{
			url:"${ctx}/meta/Database/page",
			pageNo : 1,
			pageSize : 10,
			tableId : "#sample_1"
		},
		null,
		[
			 	{cName:"dbname",cValue:"数据库名",format:function(i,value,item){
			 		return "<a href='${ctx}/meta/Database/show/"+item.id+"'>"+ item.dbname+"</a>";
				 }},
			 	{cName:"schemaName",cValue:"schema名"},
			 	{cName:"datasource",cValue:"数据源",format:function(i,value,item){
			 		return "<a href='${ctx}/meta/DataSource/show/"+item.datasource.id+"'>"+item.datasource.dsName+"</a>";
				 }},
			 	{cName:"datasource",cValue:"类别",format:function(i,value,item){
			 		return dbtypeMap.get(item.datasource.dbType);
			 	}},
			 	{cName:"creater",cValue:"建立者",format:function(i,value,item){
			 		return item.creater.name;
			 	}},
			 	{cName:"updateDate",cValue:"更新时间",format:function(i,value,item){
					 if(App.isNundef(value)){
						 return new Date(value).format("yyyy-MM-dd hh:mm");
					 }
					 return value;
				 }},
			 	{cName:"checkLabel",cValue:"启用标记",format:function(i,value,item){
			  		return statusMap.get(item.checkLabel);
				}},
			  	{cName:"remark",cValue:"备注"}
		 ]
	);
});

function doQuery(){
	var queryObj = {
			search_LIKES_dbname_OR_schemaName_OR_remark : App.isEqPlacehoder($("#filters"))
		};
	Page.doQuery(queryObj);
}
</script>
</body>
</html>