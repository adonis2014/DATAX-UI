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
								<input type="hidden" value="${obj.id}" name="id">
								<table width="100%">
									<thead>
										<tr>
											<th  style="text-align:left;font-size:20px;padding-left:20px;" colspan="3">注册中心</th>
											<th><a class='btn purple pull-right' href="${header.Referer }">返回</a></th>
										</tr>
									</thead>
									<tbody>
									<tr>
										<td style="text-align:right;padding-right:20px;">名称:</td>
										<td>${obj.name}</td>
										<td style="text-align:right;padding-right:20px;">ZK列表:</td>
										<td>${obj.zkQuorumPeer }</td>
									</tr>
									<tr>
										<td style="text-align:right;padding-right:20px;">命名空间:</td>
										<td>${obj.nameSpace}</td>
										<td style="text-align:right;padding-right:20px;">待重试间隔时间:</td>
										<td>${obj.baseSleepTime }</td>
									</tr>
									<tr>
										<td style="text-align:right;padding-right:20px;">待重试间隔时间最大值:</td>
										<td>${obj.maxSleepTime}</td>
										<td style="text-align:right;padding-right:20px;">最大重试次数:</td>
										<td>${obj.maxRetries }</td>
									</tr>
									<tr>
										<td style="text-align:right;padding-right:20px;">登录凭证:</td>
										<td>${obj.loginCert}</td>
										<td style="text-align:right;padding-right:20px;">启用标记:</td>
										<td><mytags:dictSelect field="checkLabelMap" id="checkLabelMap" type="label" hasLabel="false" codeType="17" defaultVal="${obj.checkLabel }" /></td>
									</tr>
									<tr>
										<td style="text-align:right;padding-right:20px;">建立者:</td>
										<td>${obj.creater.name}</td>
										<td style="text-align:right;padding-right:20px;">更新者:</td>
										<td>${obj.updater.name }</td>
									</tr>
									<tr>
										<td style="text-align:right;padding-right:20px;">建立时间:</td>
										<td>${obj.createDate}</td>
										<td style="text-align:right;padding-right:20px;">更新时间:</td>
										<td>${obj.updateDate }</td>
									</tr>
									<tr>
										<td style="text-align:right;padding-right:20px;">备注:</td>
										<td colspan="3">${obj.remark}</td>
									</tr>
									</tbody>
								</table>
								
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		$(function() {
			App.activeMenu("/job/RegCenter/list");
		});
	</script>
</body>
</html>