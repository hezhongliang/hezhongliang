<#assign base=request.contextPath />
<!DOCTYPE html>
<html lang="zh_CN" xmlns:th="http://www.thymeleaf.org"
	xmlns:shiro="http://www.pollix.at/thymeleaf/shiro">
<meta charset="utf-8">
<head th:include="include :: header"><#include "../../header.ftl"></head>
<body class="gray-bg">
	<div class="wrapper wrapper-content ">
		<div class="row">
			<div class="col-sm-3">
				<div class="ibox ibox-body">
					<div class="ibox-title">
						<h5>选择部门</h5>
					</div>
					<div class="ibox-content">
						<div id="jstree"></div>
					</div>
				</div>
			</div>
			<div class="col-sm-8">
				<div class="ibox">
					<div class="ibox-body">
						<div class="fixed-table-toolbar">

							<div class="columns pull-left">
								 <@shiro.hasPermission name="sys:user:add">
								<button stype="button"
									class="btn  btn-primary" onclick="add()">
									<i class="fa fa-plus hidden" aria-hidden="true"></i>添加
								</button>
								 </@shiro.hasPermission>
								<@shiro.hasPermission name="sys:user:batchRemove">
								<button shiro:hasPermission="sys:user:batchRemove" type="button"
									class="btn  btn-danger" onclick="batchRemove()">
									<i class="fa fa-trash hidden" aria-hidden="true"></i>删除
								</button>
								</@shiro.hasPermission>
							</div>

							<div class="columns pull-right">
								<button class="btn btn-success" onclick="reLoad()">查询</button>
							</div>

							<div class="columns pull-right col-md-2 nopadding">
								<input id="searchName" type="text" class="form-control"
									placeholder="姓名">
							</div>
						</div>
						<table id="exampleTable" data-mobile-responsive="true">
						</table>
					</div>
				</div>
			</div>
		</div>
		<!--shiro控制bootstraptable行内按钮看见性 来自bootdo的创新方案 -->
		<div>
			<script type="text/javascript">
				var s_edit_h = 'hidden';
				var s_remove_h = 'hidden';
				var s_resetPwd_h = 'hidden';
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
		<div shiro:hasPermission="sys:user:resetPwd">
			<script type="text/javascript">
				var s_resetPwd_h = '';
			</script>
		</div>
	</div>
	<div th:include="include :: footer"></div>
	<#include "../../footer.ftl">
<#--
	<script type="text/javascript" src="${base}/static/js/appjs/sys/user/user.js"></script>
-->

<script>


    $(function() {
        var deptId = '';
        getTreeData();
        load(deptId);
    });

    function load(deptId) {
        $('#exampleTable')
                .bootstrapTable(
                        {
                            method : 'get', // 服务器数据的请求方式 get or post
                            url : "/sysuser/list", // 服务器数据的加载地址
                            // showRefresh : true,
                            // showToggle : true,
                            // showColumns : true,
                            iconSize : 'outline',
                            toolbar : '#exampleToolbar',
                            striped : true, // 设置为true会有隔行变色效果
                            dataType : "json", // 服务器返回的数据类型
                            pagination : true, // 设置为true会在底部显示分页条
                            // queryParamsType : "limit",
                            // //设置为limit则会发送符合RESTFull格式的参数
                            singleSelect : false, // 设置为true将禁止多选
                            // contentType : "application/x-www-form-urlencoded",
                            // //发送到服务器的数据编码类型
                            pageSize : 10, // 如果设置了分页，每页数据条数
                            pageNumber : 1, // 如果设置了分布，首页页码
                            // search : true, // 是否显示搜索框
                            showColumns : false, // 是否显示内容下拉框（选择显示的列）
                            sidePagination : "server", // 设置在哪里进行分页，可选值为"client" 或者
                            // "server"
                            queryParams : function(params) {
                                return {
                                    // 说明：传入后台的参数包括offset开始索引，limit步长，sort排序列，order：desc或者,以及所有列的键值对
                                    limit : params.limit,
                                    offset : params.offset,
                                    name : $('#searchName').val(),
                                    deptId : deptId
                                };
                            },
                            // //请求服务器数据时，你可以通过重写参数的方式添加一些额外的参数，例如 toolbar 中的参数 如果
                            // queryParamsType = 'limit' ,返回参数必须包含
                            // limit, offset, search, sort, order 否则, 需要包含:
                            // pageSize, pageNumber, searchText, sortName,
                            // sortOrder.
                            // 返回false将会终止请求
                            columns : [
                                {
                                    checkbox : true
                                },
                                {
                                    field : 'userId', // 列字段名
                                    title : '序号' // 列标题
                                },
                                {
                                    field : 'name',
                                    title : '姓名'
                                },
                                {
                                    field : 'username',
                                    title : '用户名'
                                },
                                {
                                    field : 'email',
                                    title : '邮箱'
                                },
                                {
                                    field : 'status',
                                    title : '状态',
                                    align : 'center',
                                    formatter : function(value, row, index) {
                                        if (value == '0') {
                                            return '<span class="label label-danger">禁用</span>';
                                        } else if (value == '1') {
                                            return '<span class="label label-primary">正常</span>';
                                        }
                                    }
                                },
                                {
                                    title : '操作',
                                    field : 'id',
                                    align : 'center',
                                    formatter : function(value, row, index) {
                                        var e = '<@shiro.hasPermission name="sys:user:edit"><a  class="btn btn-primary btn-sm ' + s_edit_h + '" href="#" mce_href="#" title="编辑" onclick="edit(\''
                                                + row.userId
                                                + '\')"><i class="fa fa-edit "></i></a></@shiro.hasPermission> ';
                                        var d = '<@shiro.hasPermission name="sys:user:remove"><a class="btn btn-warning btn-sm ' + s_remove_h + '" href="#" title="删除"  mce_href="#" onclick="remove(\''
                                                + row.userId
                                                + '\')"><i class="fa fa-remove"></i></a></@shiro.hasPermission> ';
                                        var f = '<@shiro.hasPermission name="sys:user:resetPwd"><a class="btn btn-success btn-sm ' + s_resetPwd_h + '" href="#" title="重置密码"  mce_href="#" onclick="resetPwd(\''
                                                + row.userId
                                                + '\')"><i class="fa fa-key"></i></a></@shiro.hasPermission> ';
                                        return e + d + f;
                                    }
                                } ]
                        });
    }
    function reLoad() {
        $('#exampleTable').bootstrapTable('refresh');
    }
    function add() {
        // iframe层
        layer.open({
            type : 2,
            title : '增加用户',
            maxmin : true,
            shadeClose : false, // 点击遮罩关闭层
            area : [ '800px', '520px' ],
            content :  '/sysuser/add'
        });
    }
    function remove(id) {
        layer.confirm('确定要删除选中的记录？', {
            btn : [ '确定', '取消' ]
        }, function() {
            $.ajax({
                url : "/sysuser/remove",
                type : "post",
                data : {
                    'id' : id
                },
                success : function(r) {
                    if (r.code == 0) {
                        layer.msg(r.msg);
                        reLoad();
                    } else {
                        layer.msg(r.msg);
                    }
                }
            });
        })
    }
    function edit(id) {
        //alert(id);
        layer.open({
            type : 2,
            title : '用户修改',
            maxmin : true,
            shadeClose : false,
            area : [ '800px', '520px' ],
            content : '/sysuser/toedit/' + id // iframe的url
        });
    }
    function resetPwd(id) {
        layer.open({
            type : 2,
            title : '重置密码',
            maxmin : true,
            shadeClose : false, // 点击遮罩关闭层
            area : [ '400px', '260px' ],
            content : prefix + '/resetPwd/' + id // iframe的url
        });
    }
    function batchRemove() {
        var rows = $('#exampleTable').bootstrapTable('getSelections'); // 返回所有选择的行，当没有选择的记录时，返回一个空数组
        if (rows.length == 0) {
            layer.msg("请选择要删除的数据");
            return;
        }
        layer.confirm("确认要删除选中的'" + rows.length + "'条数据吗?", {
            btn : [ '确定', '取消' ]
            // 按钮
        }, function() {
            var ids = new Array();
            // 遍历所有选择的行数据，取每条数据对应的ID
            $.each(rows, function(i, row) {
                ids[i] = row['userId'];
            });
            $.ajax({
                type : 'POST',
                data : {
                    "ids" : ids
                },
                url : prefix + '/batchRemove',
                success : function(r) {
                    if (r.code == 0) {
                        layer.msg(r.msg);
                        reLoad();
                    } else {
                        layer.msg(r.msg);
                    }
                }
            });
        }, function() {});
    }
    function getTreeData() {
        $.ajax({
            type : "GET",
            url : "/demp/tree",
            success : function(tree) {
                loadTree(tree);
            }
        });
    }
    function loadTree(tree) {
        $('#jstree').jstree({
            'core' : {
                'data' : tree
            },
            "plugins" : [ "search" ]
        });
        $('#jstree').jstree().open_all();
    }
    $('#jstree').on("changed.jstree", function(e, data) {
        if (data.selected == -1) {
            var opt = {
                query : {
                    deptId : '',
                }
            }
            $('#exampleTable').bootstrapTable('refresh', opt);
        } else {
            var opt = {
                query : {
                    deptId : data.selected[0],
                }
            }
            $('#exampleTable').bootstrapTable('refresh',opt);
        }

    });
</script>
</body>
</html>