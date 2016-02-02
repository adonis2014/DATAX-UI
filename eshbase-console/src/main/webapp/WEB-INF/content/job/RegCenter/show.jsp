<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/content/common/common.jsp"%>
<c:set var="pageTitle" value="${'查看注册中心'}" scope="page" />
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
						<div class="portlet-body form">
							<form action="${ctx}/job/RegCenter/edit" class="form-horizontal form_sync" method="post" id="form1">
								<h3 class="form-section">
									作业类信息<a class='btn purple pull-right' href="${header.Referer }">返回</a>
								</h3>
								<input type="hidden" value="${obj.id}" name="id">
								<div class="row-fluid">
									<div class="span6 ">
										<div class="control-group">
											<label class="control-label">名称:</label>
											<div class="controls">
												<span class="text">${obj.name}</span>
											</div>
										</div>
									</div>
									<div class="span6 ">
										<div class="control-group">
											<label class="control-label">ZK列表:</label>
											<div class="controls">
												<span class="text">${obj.zkQuorumPeer }</span>
											</div>
										</div>
									</div>
								</div>
								<div class="row-fluid">
									<div class="span6 ">
										<div class="control-group">
											<label class="control-label">命名空间:</label>
											<div class="controls">
												<span class="text">${obj.nameSpace }</span>
											</div>
										</div>
									</div>
									<div class="span6 ">
										<div class="control-group">
											<label class="control-label">待重试间隔时间:</label>
											<div class="controls">
												<span class="text">${obj.baseSleepTime }</span>
											</div>
										</div>
									</div>
								</div>
								<div class="row-fluid">
									<div class="span6 ">
										<div class="control-group">
											<label class="control-label">待重试间隔时间最大值:</label>
											<div class="controls">
												<span class="text">${obj.maxSleepTime }</span>
											</div>
										</div>
									</div>
									<div class="span6 ">
										<div class="control-group">
											<label class="control-label">最大重试次数:</label>
											<div class="controls">
												<span class="text">${obj.maxRetries }</span>
											</div>
										</div>
									</div>
								</div>
								<div class="row-fluid">
									<div class="span6 ">
										<div class="control-group">
											<label class="control-label">登录凭证:</label>
											<div class="controls">
												<span class="text">${obj.loginCert }</span>
											</div>
										</div>
									</div>
									<div class="span6 ">
										<div class="control-group">
											<label class="control-label">启用标记:</label>
											<div class="controls">
												<span class="text"><mytags:dictSelect field="checkLabelMap" id="checkLabelMap" type="label" hasLabel="false" codeType="17" defaultVal="${obj.checkLabel }" /></span>
											</div>
										</div>
									</div>
								</div>
								<div class="row-fluid">
									<div class="span6 ">
										<div class="control-group">
											<label class="control-label">建立者:</label>
											<div class="controls">
												<span class="text">${obj.creater.name}</span>
											</div>
										</div>
									</div>
									<div class="span6 ">
										<div class="control-group">
											<label class="control-label">更新者:</label>
											<div class="controls">
												<span class="text">${obj.updater.name}</span>
											</div>
										</div>
									</div>
								</div>
								<div class="row-fluid">
									<div class="span6 ">
										<div class="control-group">
											<label class="control-label">建立时间:</label>
											<div class="controls">
												<span class="text">${obj.createDate }</span>
											</div>
										</div>
									</div>
									<div class="span6 ">
										<div class="control-group">
											<label class="control-label">更新时间:</label>
											<div class="controls">
												<span class="text">${obj.updateDate }</span>
											</div>
										</div>
									</div>
								</div>
								<div class="row-fluid">
									<div class="span6 ">

										<div class="control-group">
											<label class="control-label">备注:</label>
											<div class="controls">
												<span class="text">${obj.remark }</span>
											</div>
										</div>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		$(function() {
			App.activeMenu("job/RegCenter/list");
		});
	</script>
</body>
</html>