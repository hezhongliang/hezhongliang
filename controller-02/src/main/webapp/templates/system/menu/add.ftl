<#assign base=request.contextPath />
<!DOCTYPE html>
<html>
<meta charset="utf-8">
<head th:include="include :: header"><#include "../../header.ftl"></head>
<body class="gray-bg">
	<div class="wrapper wrapper-content">
		<div class="row">
			<div class="col-sm-12">
				<div class="ibox float-e-margins">
					<div class="ibox-content">
						<form class="form-horizontal m-t" id="signupForm">
							<input id="parentId" name="parentId" type="hidden"
								value="${pId}">
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
									<label class="radio-inline"> <input type="radio"
										name="type" value="0" /> 目录
									</label> <label class="radio-inline"> <input type="radio"
										name="type" value="1" /> 菜单
									</label> <label class="radio-inline"> <input type="radio"
										name="type" value="2" /> 按钮
									</label>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label">菜单名称：</label>
								<div class="col-sm-8">
									<input id="name" name="name" class="form-control" type="text">
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label">链接地址：</label>
								<div class="col-sm-8">
									<input id="url" name="url" class="form-control" type="text">
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label">权限标识：</label>
								<div class="col-sm-8">
									<input id="perms" name="perms" class="form-control" type="text">
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label">排序号：</label>
								<div class="col-sm-8">
									<input id="orderNum" name="orderNum" class="form-control"
										type="text">
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label">图标：</label>
								<div class="col-sm-6">
									<input id="icon" name="icon" class="form-control" type="text"
										placeholder="例如：fa fa-circle-o">
								</div>
								<input id="ico-btn" class="btn btn-warning" type="button" value="选择图标">
							</div>


							<div class="form-group">
								<div class="col-sm-8 col-sm-offset-3">
									<#--<button type="submit" class="btn btn-primary">提交</button>-->
									<input type="button" onclick="submit01()" value="提交" class="btn btn-primary">
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
        var prefix = "/sys/menu"
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
                submit01();
            }
        });
        function submit01() {
            $.ajax({
                cache : true,
                type : "POST",
                url :  "${base}/menu/save",
                data : $('#signupForm').serialize(),
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
