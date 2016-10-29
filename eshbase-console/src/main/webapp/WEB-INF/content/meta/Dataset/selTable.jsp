<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/content/common/common.jsp"%>
<script type="text/javascript">
	$(function(){
		$.ajax({
			type : "GET",
			dataType : "json",
			url : ctx+"/meta/DataSource/metaDBTree",
			success : function(data){
				$.each(data,function(i,item){
					$("#tree_1").append(insertData(item));
				});
			},
			error : function(error){
					
			}
		});
	});
	
	function insertData(data){
		var flag = data.childNode.length > 0;
		var li = $("<li></li>");
		var a = $("<a href='javascript:void(0);' onclick='javascript:selTree(this);' data-id="+data.id+"></a>");
		if(flag){
			a.attr("data-role","branch").attr("data-toggle","branch").attr("data-value","Bootstrap_Tree").addClass("tree-toggle").text(data.name+"["+data.code+"]");
		}else{
			a.attr("data-role","leaf").append($("<i class=icon-cog></i>")).append(data.name+"["+data.code+"]");
		}
		var ul = "";
		if(flag){
			ul = $('<ul class="branch in"></ul>');
			$.each(data.childNode,function(i,item){
				ul.append(insertData(item));
			});
		}else{
			ul = "";
		}
		li.append(a).append(ul);
		return li;
	}
	
	//切换选中状态
	function selTree(obj){
		$(obj).closest(".tree").find("a").removeClass("selected");
		$(obj).addClass("selected");
	}
</script>
<div id="metaDBTree" class="modal hide fade" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal" 	aria-hidden="true">&times;</button>
		<h3>选择表</h3>
	</div>
	<div class="modal-body">
		<ul class="tree" id="tree_1">
			
		</ul> 
	</div>
	<div class="modal-footer">
		<button type="button" class="btn green" onclick="javascript:selTable();">确定</button>
		<button type="button" class="btn red" data-dismiss="modal" aria-hidden="true">关闭</button>
	</div>
</div>
