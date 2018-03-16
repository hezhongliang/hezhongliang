<!DOCTYPE html>
<html>
<meta charset="utf-8">
<#include "../../header.ftl">
<head th:include="system/user/include :: header"></head>

<body class="gray-bg">
	<div class="wrapper wrapper-content animated fadeInRight">

		<div class="row">
			<div class="col-sm-12">

				<div class="ibox-content">
					<form class="form-horizontal m-t" id="signupForm">
						<input id="userId" name="userDO.userId" value="${user.userId}"
							type="hidden">
						<div class="form-group">
							<label class="col-sm-3 control-label">输入密码：</label>
							<div class="col-sm-8">
								<input id="password" name="pwdNew" class="form-control"
									type="password" value="111111">
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


	<#include "../../footer.ftl">
	<!-- 全局js -->
	<script src="/js/jquery.min.js?v=2.1.4"></script>
	<script src="/js/bootstrap.min.js?v=3.3.6"></script>

	<!-- 自定义js -->
	<script src="/js/content.js?v=1.0.0"></script>

	<!-- jQuery Validation plugin javascript-->
	<script src="/js/plugins/validate/jquery.validate.min.js"></script>
	<script src="/js/plugins/validate/messages_zh.min.js"></script>


	<!-- script src="/js/demo/form-validate-demo.js"></script> -->


	<script type="text/javascript">
		$(document).ready(function() {
			validateRule();
			//setCheckedRoles();
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
				url : "/sys/user/adminResetPwd",
				data : $('#signupForm').serialize(),// 你的formid
				async : false,
				error : function(request) {
					parent.layer.msg("系统错误，联系管理员");
				},
				success : function(data) {
					if (data.code == 0) {
						parent.layer.msg(data.msg);
						parent.reLoad();
						var index = parent.layer.getFrameIndex(window.name); //获取窗口索引
						parent.layer.close(index);

					} else {
						parent.layer.msg(data.msg);
					}

				}
			});

		}

		function validateRule() {
			var icon = "<i class='fa fa-times-circle'></i> ";
			$("#signupForm").validate({
				rules : {

					password : {
						required : true,
						minlength : 6
					}
				},
				messages : {
					password : {
						required : icon + "请输入您的密码",
						minlength : icon + "密码必须6个字符以上"
					}
				}
			})
		}
	</script>
</body>

</html>
