<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/content/common/common.jsp"%>
<html>
<head>
<title>元数据注释列表</title>
</head>
<body>
	<div class="page-content">
		<div class="container-fluid">
			<!-- 页面导航 -->
			<tool:navBar pageTitle="元数据注释列表" pageTitleContent="内容管理-元数据注释管理-元数据注释列表" titleIcon="icon-home"/>
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
		                                          <input type="text" id="filters" class="m-wrap span12" placeholder="注释,对象名">
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
								<tool:operBtns modelKey="comment"  modelName="meta"></tool:operBtns>
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
	
	App.activeMenu("meta/Comment/list");
	var objtypeMap = new Map();  
	<mytags:dictSelect field="objtypeMap" id="objtypeMap" type="map" hasLabel="false" codeType="20" />
	
	Page.initData(
		{
			url:"${ctx}/meta/Comment/page?userId=${param.userId}",
			pageNo : 1,
			pageSize : 10,
			tableId : "#sample_1"
		},
		null,
		[
			 	{cName:"user",cValue:"注释人",format:function(i,value,item){
			 		return  item.user.name;
				 }},
			 	{cName:"comment",cValue:"注释"},
			 	{cName:"objectType",cValue:"关联对象类别",format:function(i,value,item){
			  		return objtypeMap.get(item.objectType);
				}},
				{cName:"objectName",cValue:"对象名",format:function(i,value,item){
					return "<a href='${ctx}/meta/Comment/showObj/"+item.objectType+"/"+item.objectId+"' target='_blank'>"+item.objectName+"</a>";
				}},
			 	{cName:"objectPname",cValue:"逻辑名",format:function(i,value,item){
					return "<a href='${ctx}/meta/Comment/showObj/"+item.objectType+"/"+item.objectId+"' target='_blank'>"+item.objectPname+"</a>";
				}},
			 	{cName:"createDate",cValue:"建立时间",format:function(i,value,item){
					 if(App.isNundef(value)){
						 return new Date(value).format("yyyy-MM-dd hh:mm");
					 }
					 return value;
				 }}
		 ]
	);
});

function doQuery(){
	var queryObj = {
			search_LIKES_comment_OR_objectName_OR_objectPname_OR_objectRemark : App.isEqPlacehoder($("#filters"))
		};
	Page.doQuery(queryObj);
}
</script>
</body>
</html>