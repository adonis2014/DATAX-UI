<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/content/common/common.jsp"%>
<c:set var="pageTitle" value="${empty obj ? '添加ETL调度作业':'修改ETL调度作业' }" scope="page" />
<html>
<head>
<title>${pageTitle }</title>
 <link rel="stylesheet" type="text/css" href="${ctx}/assets/comp/gritter/css/jquery.gritter.css" />
   <link rel="stylesheet" type="text/css" href="${ctx}/assets/comp/bootstrap-wysihtml5/bootstrap-wysihtml5.css" />
   <link rel="stylesheet" type="text/css" href="${ctx}/assets/comp/bootstrap-datepicker/css/datepicker.css" />
   <link rel="stylesheet" type="text/css" href="${ctx}/assets/comp/bootstrap-timepicker/compiled/timepicker.css" />
   <link rel="stylesheet" type="text/css" href="${ctx}/assets/comp/bootstrap-colorpicker/css/colorpicker.css" />
   <link rel="stylesheet" href="${ctx}/assets/comp/bootstrap-toggle-buttons/static/stylesheets/bootstrap-toggle-buttons.css" />
   <link rel="stylesheet" href="${ctx}/assets/comp/data-tables/DT_bootstrap.css" />
   <link rel="stylesheet" type="text/css" href="${ctx}/assets/comp/bootstrap-daterangepicker/daterangepicker.css" />
   <link rel="shortcut icon" href="${ctx}/assets/favicon.ico" />
</head>
<body>
<%@ include file="/WEB-INF/content/meta/Dataset/selTable.jsp" %>
	<div class="page-content">
		<div class="container-fluid">
			<!-- 页面导航 -->
			<tool:navBar pageTitle="${pageTitle }"
				pageTitleContent="ETL管理-调度管理-${pageTitle }" titleIcon="icon-home" />
			<!-- 主体内容 -->
			<div class="row-fluid">
			 <div class="span12">
                  <div class="portlet box blue" id="form_wizard_1">
                     <div class="portlet-title">
                        <h4  class="page-title">
                           <i class="icon-reorder"></i> ${pageTitle } - <span class="step-title">Step 1 of 4</span>
                        </h4>
                        <div class="tools hidden-phone">
                           <a href="javascript:;" class="collapse"></a>
                           <a href="#portlet-config" data-toggle="modal" class="config"></a>
                           <a href="javascript:;" class="reload"></a>
                           <a href="javascript:;" class="remove"></a>
                        </div>
                     </div>
                     <div class="portlet-body form">
                        <form action="${ctx}/etl/EtlJob/edit" class="form-horizontal" method="POST"  id="form_wizard">
                           <div class="form-wizard">
                              <div class="navbar steps">
                                 <div class="navbar-inner">
                                    <ul class="row-fluid">
                                       <li class="span3">
                                          <a href="#tab1" data-toggle="tab" class="step active">
                                          <span class="number">1</span>
                                          <span class="desc"><i class="icon-ok"></i>基本信息</span>   
                                          </a>
                                       </li>
                                       <li class="span3">
                                          <a href="#tab2" data-toggle="tab" class="step">
                                          <span class="number">2</span>
                                          <span class="desc"><i class="icon-ok"></i>读取设置</span>   
                                          </a>
                                       </li>
                                       <li class="span3">
                                          <a href="#tab3" data-toggle="tab" class="step">
                                          <span class="number">3</span>
                                          <span class="desc"><i class="icon-ok"></i>写入设置</span>   
                                          </a>
                                       </li>
                                       <li class="span3">
                                          <a href="#tab4" data-toggle="tab" class="step">
                                          <span class="number">4</span>
                                          <span class="desc"><i class="icon-ok"></i>字段映射</span>   
                                          </a> 
                                       </li>
                                      
                                    </ul>
                                 </div>
                              </div>
                              <div id="bar" class="progress progress-success progress-striped">
                                 <div class="bar"></div>
                              </div>
                              <div class="tab-content">
                                 <div class="tab-pane active" id="tab1">
                                       <input type="hidden" value="${obj.id}" name="id">
										<table class="dbform" width="100%">
											<tr>
												<td class="fieldtitle">调度作业名:</td>
												<td class="fieldvalue"><input type="text" validate="{required:true}" name="jobName" value="${obj.jobName }" /></td>
												<td class="fieldtitle">ETL类型:</td>
												<td class="fieldvalue"><mytags:dictSelect field="etlType" id="etlType" type="select" hasLabel="false" defaultVal="${obj.etlType}" codeType="1034" hasPSel="false"/></td>
											</tr>
										<c:if test="${not empty obj.creater}">
											<tr>
												<td class="fieldtitle">状态:</td>
												<td class="fieldvalue"><mytags:dictSelect field="status" id="status" type="label" hasLabel="false" defaultVal="${obj.status}" codeType="1003" /></td>
												<td class="fieldtitle">启用标记:</td>
												<td class="fieldvalue"><mytags:dictSelect field="checkLabel" id="checkLabel" type="label" hasLabel="false" defaultVal="${obj.checkLabel}" codeType="17" /></td>
											</tr>
											<tr>
												<td class="fieldtitle">建立者:</td>
												<td class="fieldvalue">${obj.creater.name}</td>
												<td class="fieldtitle">更新者:</td>
												<td class="fieldvalue">${obj.updater.name}</td>
										</tr>
										<tr>
											<td class="fieldtitle">建立时间:</td>
											<td class="fieldvalue">${obj.createDate }</td>
											<td class="fieldtitle">更新时间:</td>
											<td class="fieldvalue">${obj.updateDate }</td>
										</tr>
										</c:if>
										<tr>
											<td class="fieldtitle">备注:</td>
											<td class="fieldvalue" colspan="3"><input type="text"  name="remark" value="${obj.remark }" /></td>
										</tr>
										</table>
                                 </div>
                                 <div class="tab-pane" id="tab2">
                                    <input type="hidden" value="${obj.readerTask.id}" name="readtask.id" id="taskId"/>
                                    <input type="hidden" value="${obj.readerTask.dataset.id}" name="readtask.dataset.id" id="datasetId"/>
                                    <table width="100%" class="dbform">
                                    	<tr>
                                    		<th class="fieldtitle">插件</th>
                                    		<td class="fieldvalue">
                                    			<select name="readtask.plugin.id" id="readtaskPluginId" onchange="javascript:changeWizard(1);">
                                    				<c:forEach items="${readPlguins}" var="plugin">
                                    				<option value="${plugin.id}" <c:if test="${plugin.id==obj.readerTask.plugin.id}">selected</c:if>>${plugin.pluginName}</option>
                                    				</c:forEach>
                                    			</select>
                                    		</td>
											<th class="fieldtitle">插件类别</th>
                                    		<td class="fieldvalue"><span id="pluginType">读取</span></td>
                                    	</tr>
                                    	<tr>
                                    		<th class="fieldtitle">任务名</th>
                                    		<td class="fieldvalue"><input type="text" style="width:95%;"  validate="{required:true}" id="readerTaskName" value="${obj.readerTask.taskName}" name="readertask.taskName"/></td>
                                    		<th class="fieldtitle">数据集</th> <input type="hidden" value="${obj.readerTask.datasetId}" id="rdatasetId" name="readtask.datasetId" />
                                    		<td class="fieldvalue"><input name="readtask.datasetName" id="rdatasetName" value="${obj.readerTask.dataset.datasetPname}[${obj.readerTask.dataset.datasetName}]"  onfocus="javascript:showTree(1);"/></td>
                                    	</tr>
                                    	<tr>
                                    		<th class="fieldtitle">备注</th>
											<td colspan="3" class="fieldvalue"><input type="text"  style="width:95%;"  value="${obj.readerTask.remark}" name="readertask.remark"/></td>
                                    	</tr>
                                    	<tr>
                                    		<td colspan="4">
                                    			<div id="readerTaskParamters">
	                                    			
                                    			</div>
                                    		</td>
                                    	</tr>
                                    </table>
                                 </div>
                                 <div class="tab-pane" id="tab3">
                                   <input type="hidden" value="" name="writertask.id" id="writertaskId"/>
                                    <input type="hidden" value="" name="writertask.dataset.id" id="writerDatasetId"/>
                                    <table width="100%" class="dbform">
                                    	<tr>
                                    		<th class="fieldtitle">插件</th>
                                    		<td class="fieldvalue">
                                    		<select name="writertask.plugin.id" id="writertaskPluginId"  onchange="javascript:changeWizard(2);">
                                    				<c:forEach items="${writePlguins}" var="plugin">
                                    				<option value="${plugin.id}" <c:if test="${plugin.id==obj.writerTask.plugin.id}">selected</c:if>>${plugin.pluginName}</option>
                                    				</c:forEach>
                                    			</select></td>
											<th class="fieldtitle">插件类别</th>
                                    		<td class="fieldvalue"><span id="pluginType">写入</span></td>
                                    	</tr>
                                    	<tr>
                                    		<th class="fieldtitle">任务名</th>
                                    		<td class="fieldvalue"><input type="text" style="width:95%;"  validate="{required:true}"  id="writerTaskName" value="${obj.writerTask.taskName}" name="writertask.taskName"/></td>
                                    		<th class="fieldtitle">数据集</th> <input type="hidden"  value="${obj.writerTask.datasetId}"  id="wdatasetId" name="writertask.datasetId" />
                                    		<td class="fieldvalue"><input name="writertask.datasetName" value="${obj.writerTask.dataset.datasetPname}[${obj.writerTask.dataset.datasetName}]" id="wdatasetName" onfocus="javascript:showTree(2);" value=""/></td>
                                    	</tr>
                                    	<tr>
                                    		<th class="fieldtitle">备注</th>
											<td colspan="3" class="fieldvalue"><input type="text"  style="width:95%;"  value="${obj.writerTask.remark}" name="writertask.remark"/></td>
                                    	</tr>
                                    	<tr>
                                    		<td colspan="4">
                                    			<div id="writerTaskParamters">
	                                    			
                                    			</div>
                                    		</td>
                                    	</tr>
                                    </table>
                                 </div>
                                 <div class="tab-pane" id="tab4">
                                   	<div id="taskColumns" style="overflow:auto;width:100%;">
	                                 </div>
                                 </div>
                                
                              </div>
                              <div class="form-actions clearfix">
                                 <a href="javascript:;" class="btn button-previous"> <i class="m-icon-swapleft"></i> 上一步  </a>
                                 <a href="javascript:;" class="btn blue button-next"> 下一步 <i class="m-icon-swapright m-icon-white"></i> </a>
                                 <a href="javascript:;" class="btn green button-addpair"> 增加行 <i class="m-icon-white"></i> </a>
                                 <a href="javascript:;" class="btn green button-submit"> 提交 <i class="m-icon-white"></i> </a>
                              </div>
                           </div>
                        </form>
                     </div>
                  </div>
               </div>
			
			</div>
		</div>
	</div>
<%@ include file="/WEB-INF/content/common/plugins/jquery-validation.jsp"%>
<%@ include file="/WEB-INF/content/common/plugins/datepicker.jsp"%>

   <script src="${ctx}/assets/comp/bootstrap-wizard/jquery.bootstrap.wizard.min.js"></script>
   <script type="text/javascript" src="${ctx}/assets/comp/bootstrap-wysihtml5/wysihtml5-0.3.0.js"></script> 
   <script type="text/javascript" src="${ctx}/assets/comp/bootstrap-wysihtml5/bootstrap-wysihtml5.js"></script>
   <script type="text/javascript" src="${ctx}/assets/comp/bootstrap-toggle-buttons/static/js/jquery.toggle.buttons.js"></script>
   <script type="text/javascript" src="${ctx}/assets/comp/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
   <script type="text/javascript" src="${ctx}/assets/comp/bootstrap-daterangepicker/date.js"></script>
   <script type="text/javascript" src="${ctx}/assets/comp/bootstrap-daterangepicker/daterangepicker.js"></script> 
   <script type="text/javascript" src="${ctx}/assets/comp/bootstrap-colorpicker/js/bootstrap-colorpicker.js"></script>  
   <script type="text/javascript" src="${ctx}/assets/comp/bootstrap-timepicker/js/bootstrap-timepicker.js"></script>
   	<%@ include file="/WEB-INF/content/common/plugins/bootstrap-tree.jsp"%>
   

<script type="text/javascript">
	$(function(){
		App.activeMenu("etl/EtlJob/list");
		$('#form_wizard_1').bootstrapWizard('show',${empty param.tabid?0:param.tabid});
		changeWizard(1);
		changeWizard(2);
		changeDataset();
	});
	
	function showTab(index){
		if (index==3){
			changeDataset();
             $('#form_wizard_1').find('.button-addpair').show();
		}else{
			$('#form_wizard_1').find('.button-addpair').hide();
		}
	}
	
	var datasetype=1;
	function showTree(dtype){
		datasetype=dtype;
		$("#metaDBTree").modal();
	}
	
	function submit_form_wizard(){
		form_wizard.action="${ctx}/etl/EtlJob/edit";
		form_wizard.submit();
	}
	
	function changeDataset(){
		$("#taskColumns").empty();
		if ($("#rdatasetId").val()){
		$("#taskColumns").load(
				"${ctx}/etl/EtlJob/params/taskColumns",
				{rdatasetId: $("#rdatasetId").val(),
					wdatasetId:$("#wdatasetId").val()},
				function(resp,status){
				  
				});  
		}
	}
	
	function changeWizard(id){
		if (id==1){
			$("#readerTaskParamters").empty();
			$("#readerTaskParamters").load(
					"${ctx}/etl/EtlJob/params/readerTaskParams",
					{readtaskPluginId: $("#readtaskPluginId").val()},
					function(resp,status){
					   if ($("#readerTaskName").val()=='')$("#readerTaskName").val($("#readtaskPluginId option:selected").text());
					});  
		}else{
			$("#writerTaskParamters").empty();
			$("#writerTaskParamters").load(
					"${ctx}/etl/EtlJob/params/writerTaskParams",
					{writertaskPluginId: $("#writertaskPluginId").val()},
					function(resp,status){
					   if ($("#writerTaskName").val()=='')$("#writerTaskName").val($("#writertaskPluginId option:selected").text());
					}); 
		}
		 
	}
	
	function selTable(){
		$obj = $("#tree_1").find("a.selected:first");
		$('#metaDBTree').modal('hide');
		if (datasetype==1){
			$('#rdatasetName').val($obj.text());
			$('#rdatasetId').val($obj.attr("data-id"));
			
		}else{
			$('#wdatasetName').val($obj.text());
			$('#wdatasetId').val($obj.attr("data-id"));
		}
	}

	function setupTask(taskId){
		
	}
	function delTask(taskId){
		self.location.href="${ctx}/etl/EtlTask/delete/"+taskId+"?isEdit=true";
	}
	
</script>
</body>
</html>
