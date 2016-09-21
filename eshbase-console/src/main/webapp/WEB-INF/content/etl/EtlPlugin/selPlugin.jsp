<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/content/common/common.jsp"%>
<%@ include file="/WEB-INF/content/common/plugins/page.jsp"%>
<script type="text/javascript" src="${ctx}/assets/js/map.js"></script>
<script type="text/javascript">
	$(function(){
		var pluginTypeMap = new Map();  
		<mytags:dictSelect field="pluginTypeMap" id="pluginTypeMap" type="map" hasLabel="false" codeType="1031" />
		Page.initData(
				{
					url:"${ctx}/etl/EtlPlugin/page",
					pageNo : 1,
					pageSize : 10,
					checkboxType : 1,
					colName : "pluginName",
					colDataType : "pluginType",
					tableId : "#sample_1"
				},
				null,
				[
					{cName:"pluginName",cValue:"插件名"},
					{cName:"pluginType",cValue:"插件类别",format:function(i,value,item){
						return pluginTypeMap.get(item.pluginType);
					}},
					{cName:"version",cValue:"版本"},
					{cName:"target",cValue:"数据源目标"},
					{cName:"remark",cValue:"备注"}
				 ]
			);
	});
</script>
<div id="pluginList" class="modal hide fade" style="width:640px;height:480px;" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		<h3>选择插件</h3>
	</div>
	<div class="modal-body">
		<table class="table table-striped table-bordered table-hover" id="sample_1">
		</table>
	</div>
	<div class="modal-footer">
		<button type="button" class="btn green" onclick="javascript:selPlugin();">确定</button>
		<button type="button red" class="btn" data-dismiss="modal" aria-hidden="true">关闭</button>
	</div>
</div>
