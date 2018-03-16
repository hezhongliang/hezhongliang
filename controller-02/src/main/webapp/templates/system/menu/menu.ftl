<#assign base=request.contextPath />
<!DOCTYPE html>
<html lang="zh_CN" xmlns:th="http://www.thymeleaf.org"
	xmlns:shiro="http://www.pollix.at/thymeleaf/shiro">
<meta charset="utf-8">
<head th:include="include :: header"><#include "../../header.ftl"></head>
<body class="gray-bg">
	<div class="wrapper wrapper-content ">
		<div class="col-sm-12">
			<div class="ibox">
				<div class="ibox-body">
					<div id="exampleToolbar" role="group" class="t-bar">
						<@shiro.hasPermission name="sys:menu:add">
						<button shiro:hasPermission="sys:menu:add" type="button"
							class="btn btn-primary" title="在根节点下添加菜单" onclick="add('0')">
							<i class="fa fa-plus" aria-hidden="true"></i>添加
						</button>
						</@shiro.hasPermission>
						<@shiro.hasPermission name="sys:menu:batchRemove">
						<button shiro:hasPermission="sys:menu:batchRemove" type="button"
							class="btn btn-danger" onclick="batchRemove()">
							<i class="fa fa-trash" aria-hidden="true"></i>删除
						</button>
						</@shiro.hasPermission>
					</div>
					<table id="exampleTable" data-mobile-responsive="true">
					</table>
				</div>
			</div>
		</div>
		<!--shiro控制bootstraptable行内按钮看见性 来自bootdo的创新方案 -->
		<div>
			<script type="text/javascript">
				var s_add_h = 'hidden';
				var s_edit_h = 'hidden';
				var s_remove_h = 'hidden';
			</script>
		</div>
		<div shiro:hasPermission="sys:menu:add">
			<script type="text/javascript">
				s_add_h = '';
			</script>
		</div>
		<div shiro:hasPermission="sys:user:edit">
			<script type="text/javascript">
				s_edit_h = '';
			</script>
		</div>
		<div shiro:hasPermission="sys:user:remove">
			<script type="text/javascript">
				var s_remove_h = '';
			</script>
		</div>
	</div>
	<div th:include="include::footer"></div>
	<#include "../../footer.ftl">
	<#--<script src="${base}/static/js/appjs/sys/menu/menu.js">


	</script>-->
<script>


    var prefix = "/sys/menu"
    $(document).ready(function() {
        load();
    });
    var load = function() {
        $('#exampleTable')
                .bootstrapTreeTable(
                        {
                            id : 'menuId',
                            code :'menuId',
                            parentCode : 'parentId',
                            type : "GET", // 请求数据的ajax类型
                            url : '/menu/list', // 请求数据的ajax的url
                            ajaxParams : {}, // 请求数据的ajax的data属性
                            expandColumn : '1',// 在哪一列上面显示展开按钮
                            striped : true, // 是否各行渐变色
                            bordered : true, // 是否显示边框
                            expandAll : false, // 是否全部展开
                            // toolbar : '#exampleToolbar',
                            columns : [
                                {
                                    title : '编号',
                                    field : 'menuId',
                                    visible : false,
                                    align : 'center',
                                    valign : 'middle',
                                    width : '50px'
                                },
                                {
                                    title : '名称',
                                    field : 'name'
                                },

                                {
                                    title : '图标',
                                    field : 'icon',
                                    align : 'center',
                                    valign : 'middle',
                                    formatter : function(item, index) {
                                        return item.icon == null ? ''
                                                : '<i class="' + item.icon
                                                + ' fa-lg"></i>';
                                    }
                                },
                                {
                                    title : '类型',
                                    field : 'type',
                                    align : 'center',
                                    valign : 'middle',
                                    formatter : function(item, index) {
                                        if (item.type === 0) {
                                            return '<span class="label label-primary">目录</span>';
                                        }
                                        if (item.type === 1) {
                                            return '<span class="label label-success">菜单</span>';
                                        }
                                        if (item.type === 2) {
                                            return '<span class="label label-warning">按钮</span>';
                                        }
                                    }
                                },
                                {
                                    title : '地址',
                                    field : 'url'
                                },
                                {
                                    title : '权限标识',
                                    field : 'perms'
                                },
                                {
                                    title : '操作',
                                    field : 'id',
                                    align : 'center',
                                    formatter : function(item, index) {
                                        var e = '<@shiro.hasPermission name="sys:menu:add"><a class="btn btn-primary btn-sm '
                                                + s_edit_h
                                                + '" href="#" mce_href="#" title="编辑" onclick="edit(\''
                                                + item.menuId
                                                + '\')"><i class="fa fa-edit"></i></a> </@shiro.hasPermission>';
                                        var p = '<@shiro.hasPermission name="sys:user:edit"><a class="btn btn-primary btn-sm '
                                                + s_add_h
                                                + '" href="#" mce_href="#" title="添加下级" onclick="add(\''
                                                + item.menuId
                                                + '\')"><i class="fa fa-plus"></i></a> </@shiro.hasPermission>';
                                        var d = '<@shiro.hasPermission name="sys:user:remove"><a class="btn btn-warning btn-sm '
                                                + s_remove_h
                                                + '" href="#" title="删除"  mce_href="#" onclick="remove(\''
                                                + item.menuId
                                                + '\')"><i class="fa fa-remove"></i></a> </@shiro.hasPermission>';
                                        return e + d + p;
                                    }
                                } ]
                        });
    }
    function reLoad() {
        load();
    }
    function add(pId) {
        layer.open({
            type : 2,
            title : '增加菜单',
            maxmin : true,
            shadeClose : false, // 点击遮罩关闭层
            area : [ '800px', '520px' ],
            content :  '/menu/add/' + pId // iframe的url
        });
    }
    function remove(id) {
        layer.confirm('确定要删除选中的记录？', {
            btn : [ '确定', '取消' ]
        }, function() {
            $.ajax({
                url :  "/menu/remove",
                type : "post",
                data : {
                    'id' : id
                },
                success : function(data) {
                    if (data.code == 0) {
                        layer.msg("删除成功");
                        reLoad();
                    } else {
                        layer.msg(data.msg);
                    }
                }
            });
        })
    }
    function edit(id) {
        layer.open({
            type : 2,
            title : '菜单修改',
            maxmin : true,
            shadeClose : false, // 点击遮罩关闭层
            area : [ '800px', '520px' ],
            content :'/menu/edit/' + id // iframe的url
        });
    }
    function batchRemove() {
        // var rows = $('#exampleTable').bootstrapTable('getSelections');

    }


</script>
</body>

</html>