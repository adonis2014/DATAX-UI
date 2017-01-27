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
								<i class="icon-globe"></i>表对象列表  ${msg}
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
		                                          <input type="text" id="filters" class="m-wrap span8" placeholder="数据源,类名,表名,逻辑名,备注"/>
		                                          <select id="clusterName" name="clusterName" class="m-wrap span4">
				                                         	<c:forEach items="${clusters}" var="ds">
				                                         	<option value="${ds.id}">${ds.dsName}</option>
				                                         	</c:forEach>
				                                         </select>
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
							</div>
							<c:if test="${not empty objs}">
							<table width="100%" class="dbform">
									<tbody>
									<tr>
										<th>schema:</th>
										<td>${objs.schemaName}</td>
										<th>名称:</th>
										<td>${objs.dsName}</td>
									</tr>
									<tr>
										<th>类别:</th>
										<td>elasticsearch</td>
										<th>备注:</th>
										<td>${objs.remark}</td>
									</tr>
									<tr>
										<th>建立者:</th>
										<td>${objs.creater.name}</td>
										<th>建立时间:</th>
										<td><fmt:formatDate value="${objs.createDate}" type="both" pattern="yyyy-MM-dd"/></td>
									</tr>
									<tr>
										<th>更新者:</th>
										<td>${objs.updater.name}</td>
										<th>更新时间:</th>
										<td><fmt:formatDate value="${objs.updateDate}" type="both" pattern="yyyy-MM-dd"/></td>
									</tr>
									</tbody>
							</table>
							</c:if>
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
	
	App.activeMenu("meta/DBTable/list");
	
	Page.initData(
		{
			url:"${ctx}/meta/DBTable/page?dsid=${objs.id}",
			pageNo : 1,
			pageSize : 10,
			tableId : "#sample_1"
		},
		null,
		[
			 	{cName:"datasource",cValue:"集群",format:function(i,value,item){
					  return  "<a href='${ctx}/meta/clustermgnt/show/"+item.database.datasource.id+"' >"+item.database.datasource.dsName+"</a>";
				  }},
				  {cName:"database",cValue:"数据库",format:function(i,value,item){
					  return "<a href='${ctx}/meta/Database/show/"+item.database.id+"' >"+item.database.dbname+"</a>";
				  }},
			 	{cName:"tableName",cValue:"表名",format:function(i,value,item){
					  return "<a href='${ctx}/meta/DBTable/show/"+item.id+"' >"+item.tableName+"</a>";
				  }},
			 	{cName:"tablePname",cValue:"逻辑名"},
			 	{cName:"tableType",cValue:"表类别",format:function(i,value,item){
			 		return "elasticsearch";
			 	}},
			 	{cName:"checkLabel",cValue:"是否启用",format:function(i,value,item){
			 		if ("1"==value){
			 		return "已启用";
			 		}else{ 
			 		return "已停用";
			 		}
			 	}},
			 	{cName:"updateDate",cValue:"更新时间",format:function(i,value,item){
					 if(App.isNundef(value)){
						 return new Date(value).format("yyyy-MM-dd hh:mm:ss");
					 }
					 return value;
				 }}
		 ]
	);
});

function doQuery(){
var queryObj = {};
	if(App.isNundef($("#clusterName").val()) ){
		var cname = $("#clusterName").val()
		Page.setUrl("${ctx}/meta/DBTable/page?dsid="+cname);
	}
	
	queryObj["search_LIKES_tableName_OR_tablePname_OR_tableType_OR_remark.name"] = App.isEqPlacehoder($("#filters"));
	Page.doQuery(queryObj);
	
}
</script>
</body>
</html>