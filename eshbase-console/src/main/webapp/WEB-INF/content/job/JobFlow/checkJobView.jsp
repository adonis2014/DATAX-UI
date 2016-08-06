<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/content/common/common.jsp"%>
<html>
<head>
<title>${pageTitle }</title>
<%@ include file="/WEB-INF/content/common/plugins/datepicker.jsp"%>
<%@ include file="/WEB-INF/content/common/plugins/jquery-validation.jsp"%>
</head>
<body>
	<div class="page-content">
		<div class="container-fluid">
			<!-- 页面导航 -->
			<tool:navBar pageTitle="${pageTitle }" pageTitleContent="作业管理-设置作业执行" titleIcon="icon-home" />
			<!-- 主体内容 -->
			<div class="row-fluid">
				<div class="span12">
					<div class="portlet box blue">
						<div class="portlet-title">
							<h4>
								<i class="icon-reorder"></i>设置作业执行
							</h4>
							<div class="tools">
								<a href="javascript:;" class="collapse"></a> <a href="javascript:;" class="remove"></a>
							</div>
						</div>
						<div class="portlet-body form">
							<form action="${ctx}/job/JobFlow/generateJob" class="form-horizontal form_sync" method="post" id="form1">
								<input type="hidden" value="${obj.id}" name="id">
								<table class="dbform" width="100%">
									<tr>
										<td class="fieldtitle">名称:</td>
										<td class="fieldvalue"><input type="text"  validate="{required:true}" name="name" value="${obj.name }" /></td>
										<td class="fieldtitle">作业类ID:</td>
										<td class="fieldvalue"><input type="text"  validate="{required:true}" name="jobClassId" value="${obj.jobclass.id }" /></td>
									</tr>
									<tr>
										<td class="fieldtitle">逻辑名:</td>
										<td class="fieldvalue"><input type="text"  validate="{required:true}" name="logicName" value="${obj.jobclass.name }" /></td>
										<td class="fieldtitle">作业类名:</td>
										<td class="fieldvalue"><input type="text"  validate="{required:true}" name="jobClassName" value="${obj.jobclass.className }" /></td>
									</tr>
									<tr>
										<td class="fieldtitle">个性化参数对照表:</td>
										<td class="fieldvalue"><input type="text"   name="shardingItemParameters" value="" /></td>
										<td class="fieldtitle">任务分割策略:</td>
										<td class="fieldvalue"><input type="text"  readonly="readonly" name="strategy" value="" /></td>
									</tr>
									<tr>
										<td class="fieldtitle">日期:</td>
										<td class="fieldvalue" colspan="3">
										<div class="input-append date form_datetime" data-date-format="yyyy-mm-dd">
			<input class="m-wrap" id="crondate" name="crondate" type="text" value="" validate="{required:true}" readonly="readonly"> 
			<span class="add-on"> <i class="icon-th"></i> </span>
		</div></td>
									</tr>
									<tr>
										<td class="fieldtitle">时间:</td>
										<td class="fieldvalue"><div class="input-append date form_datetime" data-date-format="HH:mm:ss">
			<input class="m-wrap" id="crontime" name="crontime" type="text"
				validate="{required:true}" readonly="readonly"> 
			<span class="add-on"> <i class="icon-th"></i> </span>
		</div></td>
										<td class="fieldtitle">时区:</td>
										<td class="fieldvalue"><select name="cronutc">
																	<option value="utc">UTC</option>
																	<option value="cst">CST</option>
																</select></td>
									</tr>
									<tr>
										<td class="fieldtitle">循环:</td>
										<td class="fieldvalue" colspan="3">
											<input type="checkbox" name="cronrepeat" value="1"/>&nbsp;&nbsp;
											<input type="text" value="1"  style="width:60px;" validate="{required:true}" name="cronrepeatimes"  />&nbsp;&nbsp;
											<select name="cronunit" style="width:60px;"><option value="d">天</option>
                      <option value="h">小时</option>
                      <option value="m">分</option>
                      <option value="M">月</option>
                      <option value="w">周</option></select>
										</td>
									</tr>
								<tr>
										<td class="fieldtitle">备注:</td>
										<td class="fieldvalue" colspan="3"><input type="text"  validate="{required:true}" name="remark" value="${obj.remark }" /></td>
								</tr>
								</table>
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
			App.activeMenu("job/JobFlow/list");
		});
	</script>
</body>
</html>