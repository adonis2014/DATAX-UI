<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/content/common/common.jsp"%>
<html>
<head>
<title>索引对象列表</title>
</head>
<body>
	<div class="page-content">
		<div class="container-fluid">
			<!-- 页面导航 -->
			<tool:navBar pageTitle="索引对象列表" pageTitleContent="元数据管理-索引对象管理-索引对象列表" titleIcon="icon-home"/>
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
		                                          <input type="text" id="filters" class="m-wrap span12" placeholder="索引库名,索引表名,备注">
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
								<tool:operBtns modelKey="dbindex" modelName="meta"></tool:operBtns>
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
	<mytags:dictSelect field="dbtypeMap" id="dbtypeMap" type="map" hasLabel="false" codeType="13" />
	
	App.activeMenu("meta/DBIndex/list");
	
	Page.initData(
		{
			url:"${ctx}/meta/DBIndex/page",
			pageNo : 1,
			pageSize : 10,
			tableId : "#sample_1"
		},
		null,
		[
			 	{cName:"index_name",cValue:"索引库名"},
			 	{cName:"type_name",cValue:"索引名"},
			 	{cName:"indexType",cValue:"索引类别",format:function(i,value,item){
			 		return dbtypeMap.get(item.indexType);
			 	}},
			 	{cName:"creater",cValue:"建立者",format:function(i,value,item){
			 		return item.creater.name;
			 	}},
			 	{cName:"updater",cValue:"更新者",format:function(i,value,item){
			 		return item.updater.name;
			 	}},
			 	{cName:"updateDate",cValue:"更新时间",format:function(i,value,item){
					 if(App.isNundef(value)){
						 return new Date(value).format("yyyy-MM-dd hh:mm");
					 }
					 return value;
				 }},
			  	{cName:"remark",cValue:"备注"}
		 ]
	);
});

function doQuery(){
	var queryObj = {
			search_LIKES_index_name_OR_type_name_OR_remark : App.isEqPlacehoder($("#filters"))
		};
	Page.doQuery(queryObj);
}
</script>
</body>
</html>