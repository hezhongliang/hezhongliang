<#assign base=request.contextPath />
<!DOCTYPE html>
<html>

<head>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">


<title></title>
<meta name="keywords" content="">
<meta name="description" content="">
<#include "../../header.ftl">
<link rel="shortcut icon" href="favicon.ico">
<link href="/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
<link href="/css/font-awesome.css?v=4.4.0" rel="stylesheet">
<link href="/css/animate.css" rel="stylesheet">
<link href="/css/style.css?v=4.1.0" rel="stylesheet">
</head>
<body class="gray-bg">
	<div class="wrapper wrapper-content">
		<div class="row">
			<div class="col-sm-12">
				<div class="ibox float-e-margins">
					<div class="ibox-content">
						<form class="form-horizontal m-t" id="signupForm">
							<input id="parentId" name="parentId" type="hidden"
								value="${pId}" /> <input id="menuId" name="menuId"
								type="hidden" value="${menu.menuId}" />
							<div class="form-group">
								<label class="col-sm-3 control-label">上级菜单：</label>
								<div class="col-sm-8">
									<input id="" name="" class="form-control" type="text"
										value="${pName}" readonly>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label">菜单类型：</label>
								<div class="col-sm-8">
									<input type="radio" <#if menu.type == 0 >checked</#if> name="type" value="0"  > 目录
                                    <input type="radio" <#if menu.type == 1 >checked</#if> name="type" value="1"  > 菜单
                                    <input type="radio" <#if menu.type == 2 >checked</#if> name="type" value="2"  > 按钮
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label">菜单名称：</label>
								<div class="col-sm-8">
									<input id="name" name="name" class="form-control" type="text"
										value="${menu.name}" required>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label">链接地址：</label>
								<div class="col-sm-8">
									<input  id="url" name="url" class="form-control" type="text"
										value="${menu.url}">
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label">权限标识：</label>
								<div class="col-sm-8">
									<input id="perms" name="perms" class="form-control" type="text"
										value="${menu.perms}">
								</div>
							</div>
								<div class="form-group">
								<label class="col-sm-3 control-label">排序号：</label>
								<div class="col-sm-8">
									<input id="orderNum" name="orderNum" class="form-control"
										type="text" value="${menu.orderNum}">
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label">图标：</label>
								<div class="col-sm-5">
									<input id="icon" name="icon" class="form-control" type="text"
										placeholder="例如：fa fa-circle-o" value="${menu.icon}">
								</div>
								<input id="ico-btn" class="btn btn-warning" type="button" value="选择图标">
							</div>
							<div class="form-group">
								<div class="col-sm-8 col-sm-offset-3">
									<button type="button" class="btn btn-info" onclick="update()">提交</button>
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
	<script>


        $(function() {
            validateRule();

            //打开图标列表
            $("#ico-btn").click(function(){
                layer.open({
                    type: 2,
                    title:'图标列表',
                    content: '${base}/menu/toFont',
                    area: ['480px', '90%'],
                    success: function(layero, index){
                        //var body = layer.getChildFrame('.ico-list', index);
                        //console.log(layero, index);
                    }
                });
            });

        });
        $.validator.setDefaults({
            submitHandler : function() {
                update();
            }
        });
        function update() {
            $.ajax({
                cache : true,
                type : "POST",
                url :  "${base}/menu/update",
                data : $('#signupForm').serialize(),// 你的formid
                async : false,
                error : function(request) {
                    laryer.alert("Connection error");
                },
                success : function(data) {
                    if (data.code == 0) {
                        parent.layer.msg("保存成功");
                        parent.reLoad();
                        var index = parent.layer.getFrameIndex(window.name); // 获取窗口索引
                        parent.layer.close(index);

                    } else {
                        layer.alert(data.msg)
                    }

                }
            });

        }
        function validate() {
            var icon = "<i class='fa fa-times-circle'></i> ";
            $("#signupForm").validate({
                rules : {
                    name : {
                        required : true
                    },
                    type : {
                        required : true
                    }
                },
                messages : {
                    name : {
                        required : icon + "请输入菜单名"
                    },
                    type : {
                        required : icon + "请选择菜单类型"
                    }
                }
            })
        }
        function validateRule() {
            var icon = "<i class='fa fa-times-circle'></i> ";
            $("#signupForm").validate({
                rules : {
                    name : {
                        required : true
                    },
                    type : {
                        required : true
                    }
                },
                messages : {
                    name : {
                        required : icon + "请输入菜单名"
                    },
                    type : {
                        required : icon + "请选择菜单类型"
                    }
                }
            })
        }

	</script>
</body>

</html>
