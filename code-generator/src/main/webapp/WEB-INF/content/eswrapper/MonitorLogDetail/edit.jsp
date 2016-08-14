<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/content/common/common.jsp"%>
<c:set var="pageTitle" value="${empty obj ? '添加监控记录明细':'修改监控记录明细' }" scope="page" />
<html>
<head>
<title>${pageTitle }</title>
</head>
<body>
	<div class="page-content">
		<div class="container-fluid">
			<!-- 页面导航 -->
			<tool:navBar pageTitle="${pageTitle }"
				pageTitleContent="内容管理-{functionName}管理-${pageTitle }" titleIcon="icon-home" />
			<!-- 主体内容 -->
			<div class="row-fluid">
				<div class="span12">
					<div class="portlet box blue">
						<div class="portlet-title">
							<h4>
								<i class="icon-reorder"></i>请填写表单
							</h4>
							<div class="tools">
								<a href="javascript:;" class="collapse"></a> <a
									href="javascript:;" class="remove"></a>
							</div>
						</div>
						<div class="portlet-body form">
							<form action="${ctx}/eswrapper/monitorLogDetail/edit" class="form-horizontal form_sync"
								method="post" id="form1">
								
								<input type="hidden" value="${obj.id}" name="id">
								<div class="control-group">
									<label class="control-label">集群名:</label>
									<div class="controls">
										<input type="text" class="span6 m-wrap"
											validate="{required:true}"
											name="clusterName" value="${obj.clusterName }" />
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">接点:</label>
									<div class="controls">
										<input type="text" class="span6 m-wrap"
											validate="{required:true}"
											name="node" value="${obj.node }" />
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">成功次数:</label>
									<div class="controls">
										<input type="text" class="span6 m-wrap"
											validate="{required:true}"
											name="successCount" value="${obj.successCount }" />
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">成功TPS:</label>
									<div class="controls">
										<input type="text" class="span6 m-wrap"
											validate="{required:true}"
											name="successTps" value="${obj.successTps }" />
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">失败次数:</label>
									<div class="controls">
										<input type="text" class="span6 m-wrap"
											validate="{required:true}"
											name="failureCount" value="${obj.failureCount }" />
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">失败Tps:</label>
									<div class="controls">
										<input type="text" class="span6 m-wrap"
											validate="{required:true}"
											name="failureTps" value="${obj.failureTps }" />
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">线程池最小值:</label>
									<div class="controls">
										<input type="text" class="span6 m-wrap"
											validate="{required:true}"
											name="concurrentMin" value="${obj.concurrentMin }" />
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">线程池平均值:</label>
									<div class="controls">
										<input type="text" class="span6 m-wrap"
											validate="{required:true}"
											name="concurrentAve" value="${obj.concurrentAve }" />
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">线程池最大值:</label>
									<div class="controls">
										<input type="text" class="span6 m-wrap"
											validate="{required:true}"
											name="concurrentMax" value="${obj.concurrentMax }" />
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">logId:</label>
									<div class="controls">
										<input type="text" class="span6 m-wrap"
											validate="{required:true}"
											name="logId" value="${obj.logId }" />
									</div>
								</div>
								
								
								<div class="form-actions">
									<button type="submit" class="btn blue">提交</button>
									<a class='btn' href="${header.Referer }">返回</a>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
<%@ include file="/WEB-INF/content/common/plugins/jquery-validation.jsp"%>
<script type="text/javascript">
	$(function(){
		App.activeMenu("eswrapper/monitorLogDetail/list");
	});
</script>
</body>
</html>