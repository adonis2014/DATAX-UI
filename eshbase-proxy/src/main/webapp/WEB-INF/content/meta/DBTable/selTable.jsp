<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/content/common/common.jsp"%>
<%@ include file="/WEB-INF/content/common/plugins/page.jsp"%>
<script type="text/javascript" src="${ctx}/assets/js/map.js"></script>
<script type="text/javascript">
	$(function(){
		var tabletypeMap = new Map();  
		<mytags:dictSelect field="tabletypeMap" id="tabletypeMap" type="map" hasLabel="false" codeType="12" />
		Page.initData(
				{
					url:"${ctx}/meta/DBTable/page",
					pageNo : 1,
					pageSize : 10,
					checkboxType : 1,
					colName : "tablePname",
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
			 	{cName:"remark",cValue:"备注"}
				 ]
			);
	});
</script>
<div id="tableList" class="modal hide fade" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal"
			aria-hidden="true">&times;</button>
		<h3>选择表</h3>
	</div>
	<div class="modal-body">
		<table class="table table-striped table-bordered table-hover" id="sample_1">
		</table>
	</div>
	<div class="modal-footer">
		<button type="button" class="btn green" onclick="javascript:selTable();">确定</button>
		<button type="button red" class="btn" data-dismiss="modal"
			aria-hidden="true">关闭</button>
	</div>
</div>
