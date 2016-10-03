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
   <link rel="shortcut icon" href="favicon.ico" />
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
                        <form action="#" class="form-horizontal">
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
                                       <li class="span2">
                                          <a href="#tab3" data-toggle="tab" class="step">
                                          <span class="number">3</span>
                                          <span class="desc"><i class="icon-ok"></i>写入设置</span>   
                                          </a>
                                       </li>
                                       <li class="span2">
                                          <a href="#tab4" data-toggle="tab" class="step">
                                          <span class="number">4</span>
                                          <span class="desc"><i class="icon-ok"></i>字段映射</span>   
                                          </a> 
                                       </li>
                                        <li class="span2">
                                          <a href="#tab5" data-toggle="tab" class="step">
                                          <span class="number">5</span>
                                          <span class="desc"><i class="icon-ok"></i>调度执行</span>   
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
                                 <h4 class="block">基本信息</h4>
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
                                    <h4 class="block">读取任务设置</h4>
                                    <input type="hidden" value="${obj.readerTask.id}" name="readtask.id" id="taskId"/>
                                    <input type="hidden" value="${obj.readerTask.dataSource.id}" name="readtask.datasource.id" id="datasourceId"/>
                                    <table width="100%" class="dbform">
                                    	<tr>
                                    		<th class="fieldtitle">插件</th>
                                    		<td class="fieldvalue">
                                    			<select name="readtask.plugin.id" id="readtask.pluginId">
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
                                    		<td class="fieldvalue"><input type="text" style="width:95%;"  validate="{required:true}" value="${obj.readerTask.taskName}" name="readertask.taskName"/></td>
                                    		<th class="fieldtitle">数据集</th> <input type="hidden" name="readtask.datasetId" />
                                    		<td class="fieldvalue"><input name="readtask.datasetName" id="rdatasetName" value=""/></td>
                                    	</tr>
                                    	<tr>
                                    		<th class="fieldtitle">备注</th>
											<td colspan="3" class="fieldvalue"><input type="text"  style="width:95%;"  value="${obj.readerTask.remark}" name="readertask.remark"/></td>
                                    	</tr>
                                    	<tr>
                                    		<td colspan="4">
                                    			<div id="taskParamters">
	                                    			<table width="100%" class="dbgrid">
														<thead>
															<tr>
																<th>插件参数ID</th>
																<th>参数Key</th>
																<th>参数值</th>
																<th>备注</th>
															</tr>
														</thead>
														<tbody>
														<c:forEach items="${obj.readerTask.taskParams}" var="tparam">
														<tr>
															<td>${tparam.pluginParamId}</td>
															<td>${tparam.paramKey}</td>
															<td><input type="text" name="r_paramValue_${tparam.paramKey}" value="${tparam.paramValue}"/></td>
															<td><input type="text" name="r_paramRemark_${tparam.paramKey}" value="${tparam.remark}"/></td>
														</tr>
														</c:forEach>
														</tbody>
													</table>
                                    			</div>
                                    		</td>
                                    	</tr>
                                    </table>
                                 </div>
                                 <div class="tab-pane" id="tab3">
                                    <h4 class="block">写入任务设置</h4>
                                   <input type="hidden" value="" name="writertask.id" id="writertaskId"/>
                                    <input type="hidden" value="" name="writertask.datasource.id" id="writerDatasourceId"/>
                                    <table width="100%" class="dbform">
                                    	<tr>
                                    		<th class="fieldtitle">插件</th>
                                    		<td class="fieldvalue">
                                    		<select name="writertask.plugin.id" id="pluginId">
                                    				<c:forEach items="${writePlguins}" var="plugin">
                                    				<option value="${plugin.id}" <c:if test="${plugin.id==writerTask.plugin.id}">selected</c:if>>${plugin.pluginName}</option>
                                    				</c:forEach>
                                    			</select></td>
											<th class="fieldtitle">插件类别</th>
                                    		<td class="fieldvalue"><span id="pluginType">写入</span></td>
                                    	</tr>
                                    	<tr>
                                    		<th class="fieldtitle">任务名</th>
                                    		<td class="fieldvalue"><input type="text" style="width:95%;"  validate="{required:true}" value="${writerTask.taskName}" name="writertask.taskName"/></td>
                                    		<th class="fieldtitle">数据集</th> <input type="hidden" name="writertask.datasetId" />
                                    		<td class="fieldvalue"><input name="writertask.datasetName" id="wdatasetName" onfocus="javascript:showTree();" value=""/></td>
                                    	</tr>
                                    	<tr>
                                    		<th class="fieldtitle">备注</th>
											<td colspan="3" class="fieldvalue"><input type="text"  style="width:95%;"  value="${writerTask.remark}" name="writertask.remark"/></td>
                                    	</tr>
                                    	<tr>
                                    		<td colspan="4">
                                    			<div id="taskParamters">
	                                    			<table width="100%" class="dbgrid">
														<thead>
															<tr>
																<th>插件参数ID</th>
																<th>参数Key</th>
																<th>参数值</th>
																<th>备注</th>
															</tr>
														</thead>
														<tbody>
														<c:forEach items="${obj.writerTask.taskParams}" var="tparam">
														<tr>
															<td>${tparam.pluginParamId}</td>
															<td>${tparam.paramKey}</td>
															<td><input type="text" name="w_paramValue_${tparam.paramKey}" value="${tparam.paramValue}"/></td>
															<td><input type="text" name="w_paramRemark_${tparam.paramKey}" value="${tparam.remark}"/></td>
														</tr>
														</c:forEach>
														</tbody>
													</table>
                                    			</div>
                                    		</td>
                                    	</tr>
                                    </table>
                                 </div>
                                 <div class="tab-pane" id="tab4">
                                    <h4 class="block">字段映射</h4>
                                   <table width="100%" class="dbgrid">
                                   		<thead>
                                   			<tr>
                                   				<th>列参数</th>
                                   				<c:forEach items="${taskColumns}" var="taskColumn">
                                   				<th></th>
                                   				</c:forEach>
                                   				<th>新增</th>
                                   			</tr>
                                   		</thead>
                                   		<tbody>
                                   			<tr>
                                   				<td>${obj.readerTask.taskName}</td>
                                   				<c:forEach items="${taskColumns}" var="taskColumn">
                                   				<td>${taskColumn.readColumnName}</td>
                                   				</c:forEach>
                                   				<td><input name="taskColumn.readColumnName" type="text" value=""/></td>
                                   			</tr>
                                   			<tr>
                                   				<td>${obj.writerTask.taskName}</td>
                                   				<c:forEach items="${taskColumns}" var="taskColumn">
                                   				<td>${taskColumn.writeColumnName}</td>
                                   				</c:forEach>
                                   				<td><input name="taskColumn.writeColumnName" type="text" value=""/></td>
                                   			</tr>
                                   			<tr>
                                   				<td>原数据类别</td>
                                   				<c:forEach items="${taskColumns}" var="taskColumn">
                                   				<td>${taskColumn.fieldSourceType}</td>
                                   				</c:forEach>
                                   				<td><input name="taskColumn.fieldSourceType" type="text" value=""/></td>
                                   			</tr>
                                   			<tr>
                                   				<td>字段类别</td>
                                   				<c:forEach items="${taskColumns}" var="taskColumn">
                                   				<td>${taskColumn.fieldType}</td>
                                   				</c:forEach>
                                   				<td><input name="taskColumn.fieldType" type="text" value=""/></td>
                                   			</tr>
                                   			<tr>
                                   				<td>字段数据处理函数</td>
                                   				<c:forEach items="${taskColumns}" var="taskColumn">
                                   				<td>${taskColumn.functionName}</td>
                                   				</c:forEach>
                                   				<td><input name="taskColumn.functionName" type="text" value=""/></td>
                                   			</tr>
                                   			<tr>
                                   				<td>关键字字段数据处理函数</td>
                                   				<c:forEach items="${taskColumns}" var="taskColumn">
                                   				<td>${taskColumn.pkFunctionName}</td>
                                   				</c:forEach>
                                   				<td><input name="taskColumn.pkFunctionName" type="text" value=""/></td>
                                   			</tr>
                                   			<tr>
                                   				<td>字段处理脚本</td>
                                   				<c:forEach items="${taskColumns}" var="taskColumn">
                                   				<td>${taskColumn.script}</td>
                                   				</c:forEach>
                                   				<td><input name="taskColumn.script" type="text" value=""/></td>
                                   			</tr>
                                   			<tr>
                                   				<td>脚本类别</td>
                                   				<c:forEach items="${taskColumns}" var="taskColumn">
                                   				<td>${taskColumn.scriptType}</td>
                                   				</c:forEach>
                                   				<td><input name="taskColumn.scriptType" type="text" value=""/></td>
                                   			</tr>
                                   			<tr>
                                   				<td>自定义类</td>
                                   				<c:forEach items="${taskColumns}" var="taskColumn">
                                   				<td>${taskColumn.class_name}</td>
                                   				</c:forEach>
                                   				<td><input name="taskColumn.class_name" type="text" value=""/></td>
                                   			</tr>
                                   			<tr>
                                   				<td>字段排序值</td>
                                   				<c:forEach items="${taskColumns}" var="taskColumn">
                                   				<td>${taskColumn.sortId}</td>
                                   				</c:forEach>
                                   				<td><input name="taskColumn.sortId" type="text" value=""/></td>
                                   			</tr>
                                   			<tr>
                                   				<td>备注</td>
                                   				<c:forEach items="${taskColumns}" var="taskColumn">
                                   				<td>${taskColumn.remark}</td>
                                   				</c:forEach>
                                   				<td><input name="taskColumn.remark" type="text" value=""/></td>
                                   			</tr>
                                   		</tbody>
                                   </table>
                                 </div>
                                 <div class="tab-pane" id="tab5">
                                    <h4 class="block">调度执行</h4>
                                  	
                                 </div>
                              </div>
                              <div class="form-actions clearfix">
                                 <a href="javascript:;" class="btn button-previous"> <i class="m-icon-swapleft"></i> 上一步  </a>
                                 <a href="javascript:;" class="btn blue button-next"> 下一步 <i class="m-icon-swapright m-icon-white"></i> </a>
                                 <a href="javascript:;" class="btn green button-submit"> 提交 <i class="m-icon-swapright m-icon-white"></i> </a>
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
   <script src="${ctx}/assets/comp/bootstrap-wizard/jquery.bootstrap.wizard.min.js"></script>
   <script type="text/javascript" src="${ctx}/assets/comp/bootstrap-wysihtml5/wysihtml5-0.3.0.js"></script> 
   <script type="text/javascript" src="${ctx}/assets/comp/bootstrap-wysihtml5/bootstrap-wysihtml5.js"></script>
   <script type="text/javascript" src="${ctx}/assets/comp/bootstrap-toggle-buttons/static/js/jquery.toggle.buttons.js"></script>
   <script type="text/javascript" src="${ctx}/assets/comp/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
   <script type="text/javascript" src="${ctx}/assets/comp/bootstrap-daterangepicker/date.js"></script>
   <script type="text/javascript" src="${ctx}/assets/comp/bootstrap-daterangepicker/daterangepicker.js"></script> 
   <script type="text/javascript" src="${ctx}/assets/comp/bootstrap-colorpicker/js/bootstrap-colorpicker.js"></script>  
   <script type="text/javascript" src="${ctx}/assets/comp/bootstrap-timepicker/js/bootstrap-timepicker.js"></script>
   

<script type="text/javascript">
	$(function(){
		App.activeMenu("etl/EtlJob/list");
	});
	
	function showTree(){
		$("#metaDBTree").modal();
	}
	
	function selTable(){
		$obj = $("#tree_1").find("a.selected:first");
		$('#metaDBTree').modal('hide');
		$obj.attr("data-id");
	}

	function setupTask(taskId){
		
	}
	function delTask(taskId){
		self.location.href="${ctx}/etl/EtlTask/delete/"+taskId+"?isEdit=true";
	}
	function showDatasources() {
		$("#datasourceList").modal();
	}
	function selDataSource(obj) {
			var flag = Page.selectsPrompt();
			if (!flag)
				return;
			var obj = $("#datasourceList").find("td :checkbox:checked");
			$('input[id=datasource]').val(obj.first().attr("data-text"));
			$('input[id=datasourceId]').val(flag);
			$('#datasourceList').modal('hide');
	}
</script>
</body>
</html>
