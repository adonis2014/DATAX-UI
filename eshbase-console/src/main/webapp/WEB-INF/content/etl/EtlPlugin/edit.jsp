<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/content/common/common.jsp"%>
<c:set var="pageTitle" value="${empty obj ? '添加ETL插件':'修改ETL插件' }" scope="page" />
<html>
<head>
<title>${pageTitle }</title>

</head>
<body>
	<div class="page-content">
		<div class="container-fluid">
			<!-- 页面导航 -->
			<tool:navBar pageTitle="${pageTitle }" pageTitleContent="ETL管理-插件管理-${pageTitle }" titleIcon="icon-home" />
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
							<form action="${ctx}/etl/EtlPlugin/edit" class="form-horizontal form_sync" method="post" id="form1">
								<input type="hidden" value="${obj.id}" name="id">
									<table class="dbform" width="100%">
										<tr>
											<td class="fieldtitle">插件名:</td>
											<td class="fieldvalue"><input type="text"  validate="{required:true}" name="pluginName" value="${obj.pluginName }" /></td>
											<td class="fieldtitle">插件类别:</td>
											<td class="fieldvalue"><mytags:dictSelect field="pluginType" id="pluginType" type="select" hasLabel="false" defaultVal="${obj.pluginType}" codeType="1031" /></td>
										</tr>
										<tr>	
											<td class="fieldtitle">类名:</td>
											<td class="fieldvalue"><input type="text"  validate="{required:true}" name="className" value="${obj.className }" /></td>
											<td class="fieldtitle">版本:</td>
											<td class="fieldvalue"><input type="text"  validate="{required:true}" name="version" value="${obj.version }" /></td>
										</tr>
										<tr>	
											<td class="fieldtitle">数据源目标:</td>
											<td class="fieldvalue"><input type="text"  validate="{required:true}" name="target" value="${obj.target }" /></td>
											<td class="fieldtitle">jar包名:</td>
											<td class="fieldvalue"><input type="text"  validate="{required:true}" name="jarName" value="${obj.jarName }" /></td>
										</tr>
										<tr>	
											<td class="fieldtitle">最大线程数:</td>
											<td class="fieldvalue"><input type="text"  validate="{required:true}" name="maxThreadNum" value="${obj.maxThreadNum }" /></td>
											<td class="fieldtitle">备注:</td>
											<td class="fieldvalue"><input type="text"  validate="{required:true}" name="remark" value="${obj.remark }" /></td>
										</tr>
										<tr>	
											<td style="text-align:center;" colspan="4"><button type="submit" class="btn blue">提交</button>
									<a class='btn' href="${header.Referer }">返回</a>
											</td>
										</tr>
								</table>
							</form>
						</div>
						<div class="portlet-title">
							<h4>
								<i class="icon-reorder"></i>参数
							</h4>
							<div class="tools">
								
							</div>
						</div>
						<form action="${ctx}/etl/EtlPluginParam/edit" class="form-horizontal form_sync" method="post" id="form1">
								<input type="hidden" value="${obj.id}" name="plugin.id">
						<div class="portlet-body form">
							<table width="100%" class="dbgrid">
									<thead>
										<tr>
											<th>名称</th>
											<th>范围</th>
											<th>是否必须</th>
											<th>默认值</th>
											<th>是否列</th>
											<th>备注</th>
											<th>操作 </th>
										</tr>
									</thead>
									<tbody>
									<c:forEach items="${obj.pluginParams}" var="pparam">
									<tr>
										<td>${pparam.name}</td>
										<td>${pparam.range}</td>
										<td><mytags:dictSelect field="mandatory" id="mandatory" type="label" hasLabel="false" codeType="1002" defaultVal="${pparam.mandatory}"/></td>
										<td>${pparam.defaultValue}</td>
									    <td><mytags:dictSelect field="isColumn" id="isColumn" type="label" hasLabel="false" codeType="1002" defaultVal="${pparam.isColumn}"/></td>
										<td>${pparam.description}</td>
										<td><button type="button" class="btn blue" onclick="javascript:delParam(${pparam.id});">删除</button></td>
									</tr>
									</c:forEach>
									<tr>
										<td><input type="text" style="width:60px;"  validate="{required:true}" name="name"/></td>
										<td><input type="text" style="width:60px;"   name="range"/></td>
										<td><mytags:dictSelect field="mandatory" hasPSel="false"   styleText="width:60px;" id="mandatory" type="select" hasLabel="false" codeType="1002" defaultVal="0" /></td>
										<td><input type="text" style="width:60px;"   name="defaultValue"/></td>
									    <td><mytags:dictSelect field="isColumn" hasPSel="false"  styleText="width:60px;" id="isColumn" type="select" hasLabel="false" codeType="1002" defaultVal="0" /></td>
										<td><input type="text"  style="width:60px;" validate="{required:true}" name="description"/></td>
										<td><button type="submit" class="btn blue">添加</button></td>
									</tr>
									</tbody>
								</table>
						</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="/WEB-INF/content/common/plugins/jquery-validation.jsp"%>
	<script type="text/javascript">
		$(function() {
			App.activeMenu("etl/EtlPlugin/list");
		});
		function delParam(id){
			self.location.href="${ctx}/etl/EtlPluginParam/delete/"+id;
		}
	</script>
</body>
</html>
