<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/content/common/common.jsp"%>
<%@ include file="/WEB-INF/content/common/plugins/page.jsp"%>
<script type="text/javascript" src="${ctx}/assets/js/map.js"></script>
<script type="text/javascript">
	$(function(){
		var etlTypeMap = new Map();  
		<mytags:dictSelect field="etlTypeMap" id="etlTypeMap" type="map" hasLabel="false" codeType="1034" />
		var statusMap = new Map();  
		<mytags:dictSelect field="statusMap" id="statusMap" type="map" hasLabel="false" codeType="1003" />
		Page.initData(
				{
					url:"${ctx}/etl/EtlJob/page",
					pageNo : 1,
					pageSize : 10,
					checkboxType : 1,
					colName : "jobName",
					tableId : "#jobs"
				},
				null,
				[
					{cName:"jobName",cValue:"调度作业名"},
					{cName:"etlType",cValue:"etl类别",format:function(i,value,item){
				 		return etlTypeMap.get(item.etlType);
				 	}},
				 	{cName:"status",cValue:"状态",format:function(i,value,item){
				 		return statusMap.get(item.status);
				 	}},
					{cName:"remark",cValue:"备注"}
				 ]
			);
	});
</script>
<div id="jobsList" class="modal hide fade" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		<h3>选择调度工作</h3>
	</div>
	<div class="modal-body">
		<table class="table table-striped table-bordered table-hover" id="jobs">
		</table>
	</div>
	<div class="modal-footer">
		<button type="button" class="btn green" onclick="javascript:selJob();">确定</button>
		<button type="button red" class="btn" data-dismiss="modal" aria-hidden="true">关闭</button>
	</div>
</div>
