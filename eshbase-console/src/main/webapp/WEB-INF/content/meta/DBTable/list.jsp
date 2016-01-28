<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/content/common/common.jsp"%>
<html>
<head>
<title>表对象列表</title>
</head>
<body>
	<div class="page-content">
		<div class="container-fluid">
			<!-- 页面导航 -->
			<tool:navBar pageTitle="表对象列表" pageTitleContent="元数据管理-表对象管理-表对象列表" titleIcon="icon-home"/>
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
		                                          <input type="text" id="filters" class="m-wrap span12" placeholder="数据源,类名,表名,逻辑名,表类别,建立者,更新者,建立世间,更新世间,备注">
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
								<tool:operBtns modelKey="role"></tool:operBtns>
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
	var tabletypeMap = new Map();  
	<mytags:dictSelect field="tabletypeMap" id="tabletypeMap" type="map" hasLabel="false" codeType="12" />

	App.activeMenu("meta/DBTable/list");
	
	Page.initData(
		{
			url:"${ctx}/meta/DBTable/page",
			pageNo : 1,
			pageSize : 10,
			tableId : "#sample_1"
		},
		null,
		[
			 	{cName:"datasource",cValue:"数据源",format:function(i,value,item){
					  var $a = $('<a data-original-title="点击访问" data-placement="right" class="tooltips" href="../DataSource/show/'+item.datasource.id+'" >'+item.datasource.dbName+'</a>');
					  return $a;
				  }},
			 	{cName:"className",cValue:"类名"},
			 	{cName:"tableName",cValue:"表名"},
			 	{cName:"tablePname",cValue:"逻辑名"},
			 	{cName:"tableType",cValue:"表类别",format:function(i,value,item){
			 		return tabletypeMap.get(item.tableType);
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
			  	{cName:"remark",cValue:"备注"}
		 ]
	);
});

function doQuery(){
	var queryObj = {
			search_LIKES_datasource_OR_className_OR_tableName_OR_tablePname_OR_tableType_OR_createbyId_OR_updatebyId_OR_createDate_OR_updateDate_OR_remark : App.isEqPlacehoder($("#filters"))
		};
	Page.doQuery(queryObj);
}
</script>
</body>
</html>