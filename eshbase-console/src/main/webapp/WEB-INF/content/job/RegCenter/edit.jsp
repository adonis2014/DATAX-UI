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
								<table class="dbform" width="100%">
									<tr>
										<td class="fieldtitle">名称:</td>
										<td class="fieldvalue"><input type="text" validate="{required:true}" name="name" value="${obj.name }" /></td>
										<td class="fieldtitle">ZK列表:</td>
										<td class="fieldvalue"><input type="text"  validate="{required:true}" name="zkQuorumPeer" value="${empty obj? 'localhost:2181':obj.zkQuorumPeer }" /></td>
									</tr>
									<tr>
										<td class="fieldtitle">命名空间:</td>
										<td class="fieldvalue"><input type="text"  validate="{required:true}" name="nameSpace" value="${obj.nameSpace }" /></td>
										<td class="fieldtitle">待重试间隔时间:</td>
										<td class="fieldvalue"><input type="text"  validate="{required:true}" name="baseSleepTime" value="${empty obj ?'1000':obj.baseSleepTime }" /></td>
									</tr>
									<tr>
										<td class="fieldtitle">待重试间隔时间最大值:</td>
										<td class="fieldvalue"><input type="text"  validate="{required:true}" name="maxSleepTime" value="${empty obj ?'3000':obj.maxSleepTime }" /></td>
										<td class="fieldtitle">最大重试次数:</label>
										<td class="fieldvalue"><input type="text"  validate="{required:true}" name="maxRetries" value="${empty obj ?'3':obj.maxRetries }" /></td>
									</tr>
									<tr>
										<td class="fieldtitle">登录凭证:</td>
										<td class="fieldvalue"><input type="text"  name="loginCert" value="${obj.loginCert }" /></td>
										<td class="fieldtitle">启用标记:</td>
										<td class="fieldvalue" ><mytags:dictSelect field="checkLabelMap" id="checkLabelMap" type="label" hasLabel="false" codeType="17" defaultVal="${obj.checkLabel }" /></td>
									</tr>
								<c:if test="${not empty obj}">
									<tr>
										<td class="fieldtitle">建立者:</td>
										<td class="fieldvalue"><input type="text"  name="t" readonly="readonly" value="${obj.creater.name}" /></td>
										<td class="fieldtitle">更新者:</label>
										<td class="fieldvalue"><input type="text"  name="t" readonly="readonly" value="${obj.updater.name}" /></td>
									</tr>
									<tr>
										<td class="fieldtitle">建立时间:</td>
										<td class="fieldvalue"><input type="text"  name="t" readonly="readonly" value="${obj.createDate }" /></td>
										<td class="fieldtitle">更新时间:</td>
										<td class="fieldvalue"><input type="text"  name="t" readonly="readonly" value="${obj.updateDate}" /></td>
									</tr>
									
								</c:if>
								<tr>
										<td class="fieldtitle">备注:</td>
										<td class="fieldvalue" colspan="3"><input type="text"  name="remark" value="${obj.remark }" /></td>
									</tr>
								</table>
								<div class="form-actions" >
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