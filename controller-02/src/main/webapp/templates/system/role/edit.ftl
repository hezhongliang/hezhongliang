<#assign base=request.contextPath />
<!DOCTYPE html>
<html>
<meta charset="utf-8">
<head th:include="include::header"> <#include "../../header.ftl"></head>
<body class="gray-bg">
	<div class="wrapper wrapper-content animated fadeInRight">
		<div class="row">
			<div class="col-sm-12">
				<div class="ibox float-e-margins">
					<div class="ibox-content">
						<form class="form-horizontal m-t" id="signupForm">
							<input id="roleId" name="roleId" type="hidden"
								value="${role.roleId}"> <input id="menuIds"
								name="menuIds" type="hidden">
							<div class="form-group">
								<label class="col-sm-3 control-label">角色名：</label>
								<div class="col-sm-8">
									<input id="roleName" name="roleName" class="form-control"
										type="text" value="${role.roleName}">
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label">备注：</label>
								<div class="col-sm-8">
									<input id="remark" name="remark" class="form-control"
										type="text" value="${role.remark}">
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label">菜单权限：</label>
								<div class="col-sm-8">
									<div id="menuTree"></div>
								</div>
							</div>

							<div class="form-group">
								<div class="col-sm-8 col-sm-offset-3">
                                    <button type="button" class="btn btn-primary" onclick="update()">提交</button>
								</div>
							</div>
						</form>
					</div
				</div>
			</div>
		</div>
	</div>
	<div th:include="include::footer"></div>
	<#include "../../footer.ftl">
    <script type="text/javascript" >

        var menuIds;
        $(function() {
            getMenuTreeData();
            validateRule();
        });
        $.validator.setDefaults({
            submitHandler : function() {
                getAllSelectNodes();
                update();
            }
        });
        function loadMenuTree(menuTree) {
            $('#menuTree').jstree({
                "plugins" : [ "wholerow", "checkbox" ],
                'core' : {
                    'data' : menuTree
                },
                "checkbox" : {
                    //"keep_selected_style" : false,
                    //"undetermined" : true
                    //"three_state" : false,
                    //"cascade" : ' up'
                }
            });
            $('#menuTree').jstree('open_all');
        }
        function getAllSelectNodes() {
            var ref = $('#menuTree').jstree(true); // 获得整个树
            menuIds = ref.get_selected(); // 获得所有选中节点的，返回值为数组
            $("#menuTree").find(".jstree-undetermined").each(function(i, element) {
                menuIds.push($(element).closest('.jstree-node').attr("id"));
            });
            console.log(menuIds);
        }
        function getMenuTreeData() {
            var roleId = $('#roleId').val();
            $.ajax({
                type : "GET",
                url : "/menu/tree1/" + roleId,
                success : function(data) {
                    loadMenuTree(data);
                }
            });
        }
        function update() {
            getAllSelectNodes();
            $('#menuIds').val(menuIds);
            var role = $('#signupForm').serialize();
            $.ajax({
                cache : true,
                type : "POST",
                url : "/role/update",
                data : role, // 你的formid
                async : false,
                error : function(request) {
                    alert("Connection error");
                },
                success : function(r) {
                    if (r.code == 0) {
                        parent.layer.msg(r.msg);
                        parent.reLoad();
                        var index = parent.layer.getFrameIndex(window.name); // 获取窗口索引
                        parent.layer.close(index);

                    } else {
                        parent.layer.msg(r.msg);
                    }

                }
            });
        }
        function validateRule() {
            var icon = "<i class='fa fa-times-circle'></i> ";
            $("#signupForm").validate({
                rules : {
                    roleName : {
                        required : true
                    }
                },
                messages : {
                    roleName : {
                        required : icon + "请输入角色名"
                    }
                }
            });
        }
	</script>
</body>

</html>
