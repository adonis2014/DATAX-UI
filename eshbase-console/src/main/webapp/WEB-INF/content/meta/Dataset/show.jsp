<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/content/common/common.jsp"%>
<c:set var="pageTitle" value="${'查看数据集'}" scope="page" />
<html>
<head>
<title>${pageTitle }</title>
</head>
<body>
<jsp:include page="/WEB-INF/content/meta/Comment/comments.jsp">
	<jsp:param value="${obj.id}" name="objectId"/>
	<jsp:param value="2" name="objectType"/>
</jsp:include>
	<div class="page-content">
		<div class="container-fluid">
			<!-- 页面导航 -->
			<tool:navBar pageTitle="${pageTitle }" pageTitleContent="元数据管理-数据集管理-${pageTitle }" titleIcon="icon-home" />
			<!-- 主体内容 -->
			<div class="row-fluid">
				<div class="span12">
					<div class="portlet box blue">
						<div class="portlet-title">
							<h4>
								<i class="icon-reorder"></i>数据集设置信息
							</h4>
							<div class="tools">
								<a href="javascript:;" class="collapse"></a> <a href="javascript:;" class="remove"></a>
							</div>
						</div>
						<div class="portlet-body form">
							<form action="${ctx}/meta/Dataset/edit" class="form-horizontal form_sync" method="post" id="form1">
								<div class="row-fluid">
									<table width="100%" class="dbform">
									<tr>
										<td class="fieldtitle">数据库说明:</td>
										<td class="fieldvalue">${obj.database.remark}</td>
										<td class="fieldtitle">数据库名:</td>
										<td class="fieldvalue"><a href="${ctx}/meta/Database/show/${obj.database.id}">${obj.database.dbname}</a></td>
									</tr>
									<tr>
										<td class="fieldtitle">数据集:</td>
										<td class="fieldvalue">${obj.datasetName }</td>
										<td class="fieldtitle">逻辑名:</td>
										<td class="fieldvalue">${obj.datasetPname}</td>
									</tr>
								<c:if test="${not empty obj}">
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
									<tr>
										<td class="fieldtitle">类名:</td>
										<td class="fieldvalue">${obj.className}</td>
										<td class="fieldtitle">启用标记:</td>
										<td class="fieldvalue">
										<mytags:dictSelect field="checkLabel" type="label" id="checkLabel" defaultVal="${obj.checkLabel}" hasLabel="false" codeType="17" />
										</td>
									</tr>
								</c:if>
								<tr>
									<td class="fieldtitle">数据集类别:</td>
									<td class="fieldvalue"><mytags:dictSelect field="tableType" type="label" id="tableType" defaultVal="${obj.datasetType}" hasLabel="false" codeType="12" /></td>
									<td class="fieldtitle">备注:</td>
									<td class="fieldvalue" >${obj.remark}</td>
								</tr>
								</table>
								</div>
							</form>
						</div>
					</div>
					<c:if test="${not empty obj.dbIndexs}">
					<div class="portlet box blue">
						<div class="portlet-title">
							<h4>
								<i class="icon-reorder"></i>索引
							</h4>
							<div class="tools">
								<a href="javascript:;" class="collapse"></a> <a href="javascript:;" class="remove"></a>
							</div>
						</div>
						<div class="portlet-body form">
							<table class="table table-striped table-bordered table-hover" id="sample_1">
								<thead>
									<tr>
									<th>索引库名</th>
									<th>索引名</th>
									<th>索引类别</th>
									<th>建立时间</th>
									<th>更新时间</th>
									<th>备注</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${obj.dbIndexs}" var="dbindex">
									<tr>
										<td>${dbindex.index_name}</td>
										<td>${dbindex.type_name}</td>
										<td>${dbindex.indexType}</td>
										<td>${dbindex.createDate}</td>
										<td>${dbindex.updateDate}</td>
										<td>${dbindex.remark}</td>
									</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
					</c:if>
					<c:if test="${not empty obj.columns}">
					<div class="portlet box blue">
						<div class="portlet-title">
							<h4>
								<i class="icon-reorder"></i>字段
							</h4>
							<div class="tools">
								<a href="javascript:;" class="collapse"></a> <a href="javascript:;" class="remove"></a>
							</div>
						</div>
						<div class="portlet-body form">
							<table class="table table-striped table-bordered table-hover" id="sample_2">
								<thead>
									<tr>
										<th>字段编码</th>
										<th>字段名</th>
										<th>逻辑名</th>
										<th>字段类别</th>
										<th>是否必须</th>
										<th>备注</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="column" items="${obj.columns}">
									<tr>
										<td><a href='${ctx}/meta/DBColumn/show/${column.id}' >${column.fieldCode}</a></td>
										<td>${column.columnName}</td>
										<td>${column.columnPname}</td>
										<td>${column.type}</td>
										<td>${column.required}</td>
										<td>${table.remark}</td>
									</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
					</c:if>
					<div class="form-actions">
					<a href="javascript:addFavorite();" class="icon-btn span2">
										<i class="icon-star"></i>
										<div id="favoriteTxt"><c:if test="${not empty favorite}">取消收藏</c:if>
										<c:if test="${empty favorite}">收藏</c:if></div>
										<span class="badge badge-info" id="favoriteNum">${favoriteNum}</span>
									</a>
									<a href="javascript:addWatch();" class="icon-btn span2">
										<i class="icon-eye-open"></i>
										<div id="watchTxt">
										<c:if test="${not empty watch}">取消关注</c:if>
										<c:if test="${empty watch}">关注</c:if></div>
										<span class="badge badge-info" id="watchNum">${watchNum}</span>
									</a>
									<a href="javascript:addOwner();" class="icon-btn span2">
										<i class="icon-user"></i>
										<div id="ownerTxt"><c:if test="${not empty owner}">取消拥有</c:if>
										<c:if test="${empty owner}">拥有</c:if></div>
										<span class="badge badge-info" id="ownerNum">${ownerNum}</span>
									</a>
									<a href="javascript:addComment();" class="icon-btn span2">
										<i class="icon-comment"></i>
										<div>注释</div>
										<span class="badge badge-info" id="commentNum">${commentNum}</span>
									</a>
									<a href="${ctx}/meta/Dataset/update/${obj.id}" class="icon-btn span2">
										<i class="icon-edit"></i>
										<div>修改</div>
									</a>
									<a href="${header.Referer }" class="icon-btn span2">
										<i class="icon-arrow-left"></i>
										<div>返回</div>
									</a>
								</div>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="/WEB-INF/content/common/plugins/jquery-validation.jsp"%>
	<script type="text/javascript">
		$(function() {
			App.activeMenu("meta/Dataset/list");
		});

		function countNum(eleId,opId){
			var curNum=$("#"+eleId).text();
			if (opId==1){
				var newNum=parseInt(curNum)+1;
				$("#"+eleId).text(newNum);
			}else{
				var newNum=parseInt(curNum)-1;
				$("#"+eleId).text(newNum);
			}
		}
		
		function addFavorite(){
			$.ajax({
                url:"${ctx}/meta/Favorite/save?objectType=2&objectId=${obj.id}",
                dataType:"text",
                type:"post",
               success:function(data){
                  if(data=="0"){
                      alert("操作失败！");
                  }else if (data=="2"){
                      alert("取消收藏成功！");
                      countNum("favoriteNum",0);
                      $("#favoriteTxt").text('收藏');
                  }else{
                      alert("收藏成功！");
                      countNum("favoriteNum",1);
                      $("#favoriteTxt").text('取消收藏');
                  }
               }
             });
		}
		
		function addWatch(){
			$.ajax({
                url:"${ctx}/meta/Watch/save?objectType=2&objectId=${obj.id}",
                dataType:"text",
                type:"post",
               success:function(data){
                  if(data=="0"){
                      alert("操作失败！");
                  }else if (data=="2"){
                      alert("取消关注成功！");
                      countNum("watchNum",0);
                      $("#watchTxt").text('关注');
                  }else{
                      alert("关注成功！");
                      countNum("watchNum",1);
                      $("#watchTxt").text('取消关注');
                  }
               }
             });
		}
		
		function addComment(){
			$("#commentsList").modal();
		}
		
		
		
		function addOwner(){
			$.ajax({
                url:"${ctx}/meta/Owner/save?objectType=2&objectId=${obj.id}",
                dataType:"text",
                type:"post",
               success:function(data){
                  if(data=="0"){
                      alert("操作失败！");
                  }else if (data=="2"){
                      alert("取消拥有成功！");
                      countNum("ownerNum",0);
                      $("#ownerTxt").text('拥有');
                  }else{
                      alert("拥有成功！");
                      countNum("ownerNum",1);
                      $("#ownerTxt").text('取消拥有');
                  }
               }
             });
		}
	</script>
</body>
</html>