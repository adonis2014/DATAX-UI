<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/content/common/common.jsp" %>
<html>
<head>
    <title>数据字典列表</title>
</head>
<body>
<div class="page-content">
    <div class="container-fluid">
        <!-- 页面导航 -->
        <tool:navBar pageTitle="资源列表" pageTitleContent="系统管理-数据字典管理-数据字典列表"
                     titleIcon="icon-home"/>
        <!-- 主体内容 -->
        <div class="row-fluid">
            <div class="span12">
                <div class="portlet box green">
                    <div class="portlet-title">
                        <h4>
                            <i class="icon-globe"></i>数据字典
                        </h4>
                        <div class="tools">
                            <a href="javascript:;" class="collapse"></a>
                            <a href="javascript:;" class="remove"></a>
                        </div>
                    </div>
                    <div class="portlet-body">
                        <div>
                            <div class="btn-group">
                                <shiro:hasPermission name="sys:dict:add">
                                    <a class="btn green" href="${ctx}/sys/dict/create">
                                        添加 <i class="icon-plus"></i>
                                    </a>
                                </shiro:hasPermission>
                            </div>
                        </div>
                        <div>
                            <table id="treeTable" class="table table-striped table-bordered table-hover tree">
                                <thead>
                                <tr id="dataTr">
                                    <th>ID</th>
                                    <th>显示名</th>
                                    <th>实际值</th>
                                    <th>排序编号</th>
                                    <th>备注</th>
                                   
                                </tr>
                                </thead>
                                <tbody id="treeBody">

                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<%@ include file="/WEB-INF/content/common/plugins/jquery-treegrid.jsp" %>
<script type="text/javascript">

    //根据权限添加按钮
    var btns = [];
    <shiro:hasPermission name="sys:dict:del">
    btns.push({clickFn: "del(this)", name: "删除", icon: "icon-trash"});
    </shiro:hasPermission>
    <shiro:hasPermission name="sys:dict:update">
    btns.push({clickFn: "edit(this)", name: "修改", icon: "icon-pencil"});
    </shiro:hasPermission>
    $(document).ready(function () {
        App.activeMenu("sys/dict/list");
        initTree();
        if (btns.length > 0) {
            $("#dataTr").append($("<th></th>").text("操作"));
        }
    });

    /* 初始化树 */
    function initTree() {
        blockUI();
        $.ajax({
            type: "GET",
            dataType: "json",
            url: "${ctx}/sys/dict/tree",
            success: function (data) {
                $.each(data, function (i, item) {
                    $("#treeBody").append(fillData(item, null));
                    $.each(item.childDict, function (j, cd) {
                        $("#treeBody").append(fillData(cd, item.id));
                        $.each(cd.childDict, function (n, m) {
                            $("#treeBody").append(fillData(m, cd.id));
                        });
                    });
                });
                $('#treeTable').treegrid({initialState: "collapsed",saveState:true});
                unBlockUI();
                registerTdOnclickEvent();
            }
        });
    }

    //填充数据
    function fillData(item, pId) {
        var tr = $("<tr></tr>").attr("id", item.id).addClass("treegrid-" + item.id);
        if (pId != null) {
            tr.addClass("treegrid-parent-" + pId);
        }
        tr.append($("<td></td>").html(item.id));
        tr.append($("<td></td>").html(item.codeName));
        tr.append($("<td></td>").html(item.codeValue));
        tr.append($("<td></td>").html(item.sortId));

        tr.append($("<td></td>").html(item.remark));
        if (btns.length > 0) {
            tr.append($("<td></td>").html(operBtn(item.id)));
        }
        return tr;
    }

    //生产下拉操作按钮
    function operBtn(id) {
        return App.initDropDownBtn({
            icon: "icon-cogs",
            name: "操作",
            group: btns
        });
    }

    
    //编辑
    function edit(obj) {
        var id = $(obj).closest("tr").attr("id");
        window.location.href = ctx + "/sys/dict/update/" + id;
    }
    
    //删除
    function del(obj) {
        var id = $(obj).closest("tr").attr("id");
        window.location.href = ctx + "/sys/dict/delete/" + id;
    }

    //详细
    function show(obj) {
        var id = $(obj).closest("tr").attr("id");
        window.location.href = ctx + "/sys/dict/show/" + id;
    }

    function registerTdOnclickEvent() {
        $("td").click(function () {
            $(this).parent().addClass("selectedTr").siblings().removeClass("selectedTr");
        });
    }
</script>
</body>
</html>
