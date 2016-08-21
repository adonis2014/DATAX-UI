<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/content/common/common.jsp"%>
<c:set var="pageTitle" value="${'查看数据源对象'}" scope="page" />
<html>
<head>
<title>${pageTitle }</title>
</head>
<body>
<jsp:include page="/WEB-INF/content/meta/Comment/comments.jsp">
	<jsp:param value="${obj.id}" name="objectId"/>
	<jsp:param value="0" name="objectType"/>
</jsp:include>
	<div class="page-content">
		<div class="container-fluid">
			<!-- 页面导航 -->
			<tool:navBar pageTitle="${pageTitle }" pageTitleContent="数据源管理-${pageTitle }" titleIcon="icon-home" />
			<!-- 主体内容 -->
			<div class="row-fluid">
				<div class="span12">
					<div class="portlet box blue">
						<div class="portlet-title">
							<h4>
								<i class="icon-reorder"></i>数据源详细信息
							</h4>
							<div class="tools">
								<a href="javascript:;" class="collapse"></a>
							</div>
						</div>
						<div class="portlet-body form">
							<div class="form-horizontal form-view">
								
								<table width="100%" class="dbform">
									<tbody>
										<tr>
											<th class="fieldtitle">schema:</th>
											<td class="fieldvalue">${obj.schemaName}</td>
											<th class="fieldtitle">名称:</th>
											<td class="fieldvalue">${obj.dsName}</td>
										</tr>
										<tr>
											<th class="fieldtitle">类别:</th>
											<td class="fieldvalue"><mytags:dictSelect field="dbtype" id="dbType" defaultVal="${obj.dbType}" hasLabel="false" codeType="10" type="label" /></td>
											<th class="fieldtitle">备注:</th>
											<td class="fieldvalue">${obj.remark}</td>
										</tr>
										<tr>
											<th class="fieldtitle">建立者:</th>
											<td class="fieldvalue">${obj.creater.name}</td>
											<th class="fieldtitle">建立时间:</th>
											<td class="fieldvalue"><fmt:formatDate value="${obj.createDate}" type="both" pattern="yyyy-MM-dd" /></td>
										</tr>
										<tr>
											<th class="fieldtitle">更新者:</th>
											<td class="fieldvalue">${obj.updater.name}</td>
											<th class="fieldtitle">更新时间:</th>
											<td class="fieldvalue"><fmt:formatDate value="${obj.updateDate}" type="both" pattern="yyyy-MM-dd" /></td>
										</tr>
										<c:forEach items="${properties}" var="metaPro" varStatus="status">
											<c:if test="${empty currGroup or metaPro.group!=currGroup}">
												<tr>
													<td colspan="4" class="info-title">${metaPro.groupName}<c:set var="currGroup" value="${metaPro.group}"></c:set> <c:set var="id" value="0"></c:set>
													</td>
												</tr>
												<tr>
											</c:if>
											<c:set var="id" value="${id+1}"></c:set>
											<th class="fieldtitle">${metaPro.remark}:</th>
											<td class="fieldvalue">${metaPro.propertyValue}</td>
											<c:if test="${id % 2 == 0}">
												</tr>
												<tr>
											</c:if>
										</c:forEach>
									</tbody>
								</table>
								<c:if test="${not empty obj.databases }">
									<br />

									<div class="row-fluid">
										<table width="100%" class="dbgrid">
											<thead>
												<tr>
													<th>数据库名</th>
													<th>schema名</th>
													<th>更新时间</th>
													<th>建立时间</th>
													<th>启用标记</th>
													<th>备注</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach var="table" items="${obj.databases}">
													<tr>
														<td><a href='${ctx}/meta/Database/show/${table.id}'>${table.dbname}</a></td>
														<td>${table.schemaName}</td>
														<td><fmt:formatDate value="${table.updateDate}" type="both" pattern="yyyy-MM-dd" /></td>
														<td><fmt:formatDate value="${table.createDate}" type="both" pattern="yyyy-MM-dd" /></td>
														<td>${table.checkLabel}</td>
														<td>${table.remark}</td>
													</tr>
												</c:forEach>
											</tbody>
										</table>
									</div>
								</c:if>
							</div>
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
									<a href="${ctx}/meta/DataSource/update/${obj.id}" class="icon-btn span2">
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
		</div>

		<%@ include file="/WEB-INF/content/common/plugins/jquery-validation.jsp"%>
		<script type="text/javascript">
			$(function() {
				App.activeMenu("meta/DataSource/list");
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
	                url:"${ctx}/meta/Favorite/save?objectType=0&objectId=${obj.id}",
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
	                url:"${ctx}/meta/Watch/save?objectType=0&objectId=${obj.id}",
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
	                url:"${ctx}/meta/Owner/save?objectType=0&objectId=${obj.id}",
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