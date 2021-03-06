<#assign base=request.contextPath />
<!DOCTYPE html>
<html>
<meta charset="utf-8">
<head th:include="include :: header"><#include "../../header.ftl"></head>
<body class="gray-bg">
	<div class="wrapper wrapper-content ">
		<div class="row">
			<div class="col-sm-12">
				<div class="ibox float-e-margins">
					<div class="ibox-content">
						<form class="form-horizontal m-t" id="signupForm">
							<input id="userId" name="userId" type="hidden">
							<div class="form-group">
								<label class="col-sm-3 control-label">姓名：</label>
								<div class="col-sm-8">
									<input id="name" name="name" class="form-control" type="text">
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label">用户名：</label>
								<div class="col-sm-8">
									<input id="username" name="username" class="form-control"
										type="text">
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label">密码：</label>
								<div class="col-sm-8">
									<input id="password" name="password" class="form-control"
										type="password">
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label">部门：</label>
								<div class="col-sm-8">
									<input id="deptId" name="deptId" class="hidden"> <input
										id="deptName" name="deptName" class="form-control" type="text"
										style="cursor: pointer;" onclick="openDept()"
										readonly="readonly" placeholder="所属部门">
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label">E-mail：</label>
								<div class="col-sm-8">
									<input id="email" name="email" class="form-control"
										type="email">
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label">状态:</label>
								<div class="col-sm-8">
									<label class="radio-inline"> <input type="radio"
										name="status" value="1" /> 正常
									</label> <label class="radio-inline"> <input type="radio"
										name="status" value="0" /> 禁用
									</label>
								</div>
							</div>
							<input type="hidden" name="roleIds" id="roleIds">
							<div class="form-group">
								<label class="col-sm-3 control-label">角色</label>
								<div class="col-sm-8">
								<#list roles as role>
                                    <input name="role" type="checkbox" value="${role.roleId}"
                                    >${role.roleName}
								</#list>

								</div>
							</div>
							<div class="form-group">
								<div class="col-sm-8 col-sm-offset-3">
									<button type="submit" class="btn btn-primary">提交</button>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>

	</div>
	<div th:include="include::footer"></div>
		<#include "../../footer.ftl">
	<script type="text/javascript">

        $().ready(function() {
            validateRule();
        });

        $.validator.setDefaults({
            submitHandler : function() {
                save();
            }
        });
        function getCheckedRoles() {
            var adIds = "";
            $("input:checkbox[name=role]:checked").each(function(i) {
                if (0 == i) {
                    adIds = $(this).val();
                } else {
                    adIds += ("," + $(this).val());
                }
            });
            return adIds;
        }
        function save() {
            $("#roleIds").val(getCheckedRoles());
            $.ajax({
                cache : true,
                type : "POST",
                url : "${base}/sysuser/save",
                data : $('#signupForm').serialize(),// 你的formid
                async : false,
                error : function(request) {
                    parent.layer.alert("Connection error");
                },
                success : function(data) {
                    if (data.code == 0) {
                        parent.layer.msg("操作成功");
                        parent.reLoad();
                        var index = parent.layer.getFrameIndex(window.name); // 获取窗口索引
                        parent.layer.close(index);

                    } else {
                        parent.layer.alert(data.msg)
                    }

                }
            });

        }
        function validateRule() {
            var icon = "<i class='fa fa-times-circle'></i> ";
            $("#signupForm").validate({
                rules : {
                    name : {
                        required : true
                    },
                    username : {
                        required : true,
                        minlength : 2,
                        remote : {
                            url : "/sys/user/exit", // 后台处理程序
                            type : "post", // 数据发送方式
                            dataType : "json", // 接受数据格式
                            data : { // 要传递的数据
                                username : function() {
                                    return $("#username").val();
                                }
                            }
                        }
                    },
                    password : {
                        required : true,
                        minlength : 6
                    },
                    confirm_password : {
                        required : true,
                        minlength : 6,
                        equalTo : "#password"
                    },
                    email : {
                        required : true,
                        email : true
                    },
                    topic : {
                        required : "#newsletter:checked",
                        minlength : 2
                    },
                    agree : "required"
                },
                messages : {

                    name : {
                        required : icon + "请输入姓名"
                    },
                    username : {
                        required : icon + "请输入您的用户名",
                        minlength : icon + "用户名必须两个字符以上",
                        remote : icon + "用户名已经存在"
                    },
                    password : {
                        required : icon + "请输入您的密码",
                        minlength : icon + "密码必须6个字符以上"
                    },
                    confirm_password : {
                        required : icon + "请再次输入密码",
                        minlength : icon + "密码必须6个字符以上",
                        equalTo : icon + "两次输入的密码不一致"
                    },
                    email : icon + "请输入您的E-mail",
                }
            })
        }

        var openDept = function(){
            layer.open({
                type:2,
                title:"选择部门",
                area : [ '300px', '450px' ],
                content:"${base}/sysuser/treeView"
            })
        }
        function loadDept( deptId,deptName){
            $("#deptId").val(deptId);
            $("#deptName").val(deptName);
        }

	</script>
</body>
</html>
