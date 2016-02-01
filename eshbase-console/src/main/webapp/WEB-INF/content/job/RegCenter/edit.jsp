<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/content/common/common.jsp"%>
<c:set var="pageTitle" value="${empty obj ? '添加注册中心':'修改注册中心' }" scope="page" />
<html>
<head>
<title>${pageTitle }</title>
</head>
<body>
	<div class="page-content">
		<div class="container-fluid">
			<!-- 页面导航 -->
			<tool:navBar pageTitle="${pageTitle }" pageTitleContent="作业管理-注册中心管理-${pageTitle }" titleIcon="icon-home" />
			<!-- 主体内容 -->
			<div class="row-fluid">
				<div class="span12">
					<div class="portlet box blue">
						<div class="portlet-title">
							<h4>
								<i class="icon-reorder"></i>请填写表单
							</h4>
							<div class="tools">
								<a href="javascript:;" class="collapse"></a> <a href="javascript:;" class="remove"></a>
							</div>
						</div>
						<div class="portlet-body form">
							<form action="${ctx}/job/RegCenter/edit" class="form-horizontal form_sync" method="post" id="form1">

								<input type="hidden" value="${obj.id}" name="id">
								<div class="control-group">
									<label class="control-label">名称:</label>
									<div class="controls">
										<input type="text" class="span6 m-wrap" validate="{required:true}" name="name" value="${obj.name }" />
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">ZK列表:</label>
									<div class="controls">
										<input type="text" class="span6 m-wrap" validate="{required:true}" name="zkQuorumPeer" value="${empty obj? 'localhost:2181':obj.zkQuorumPeer }" />
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">命名空间:</label>
									<div class="controls">
										<input type="text" class="span6 m-wrap" validate="{required:true}" name="nameSpace" value="${obj.nameSpace }" />
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">待重试间隔时间:</label>
									<div class="controls">
										<input type="text" class="span6 m-wrap" validate="{required:true}" name="baseSleepTime" value="${empty obj ?'1000':obj.baseSleepTime }" />
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">待重试间隔时间最大值:</label>
									<div class="controls">
										<input type="text" class="span6 m-wrap" validate="{required:true}" name="maxSleepTime" value="${empty obj ?'3000':obj.maxSleepTime }" />
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">最大重试次数:</label>
									<div class="controls">
										<input type="text" class="span6 m-wrap" validate="{required:true}" name="maxRetries" value="${empty obj ?'3':obj.maxRetries }" />
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">登录凭证:</label>
									<div class="controls">
										<input type="text" class="span6 m-wrap"  name="loginCert" value="${obj.loginCert }" />
									</div>
								</div>
								<c:if test="${not empty obj}">
								<div class="control-group">
									<label class="control-label">建立者:</label>
									<div class="controls">
										${obj.creater.name}
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">更新者:</label>
									<div class="controls">
										${obj.updater.name}
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">建立时间:</label>
									<div class="controls">
										${obj.createDate }
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">更新时间:</label>
									<div class="controls">
										${obj.updateDate }
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">启用标记:</label>
									<div class="controls">
									<mytags:dictSelect field="checkLabelMap" id="checkLabelMap" type="label" hasLabel="false" codeType="17" defaultVal="${obj.checkLabel }"/>
									</div>
								</div>
								</c:if>
								<div class="control-group">
									<label class="control-label">备注:</label>
									<div class="controls">
										<input type="text" class="span6 m-wrap"  name="remark" value="${obj.remark }" />
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
		$(function() {
			App.activeMenu("job/RegCenter/list");
		});
	</script>
</body>
</html>