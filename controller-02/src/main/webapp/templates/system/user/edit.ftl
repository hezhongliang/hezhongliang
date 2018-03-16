<#assign base=request.contextPath />
<!DOCTYPE html>
<html>
<meta charset="utf-8">
<head th:include="include :: header"><#include "../../header.ftl"></head>
<body class="gray-bg">
	<div class="wrapper wrapper-content animated fadeInRight">
		<div class="row">
			<div class="col-sm-12">
				<div class="ibox-content">
					<form class="form-horizontal m-t" id="signupForm">
						<input id="userId" name="userId" value="${user.userId}"
							type="hidden">
						<div class="form-group">
							<label class="col-sm-3 control-label">姓名：</label>
							<div class="col-sm-8">
								<input id="name" name="name" class="form-control" type="text"
									value="${user.name}">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-3 control-label">用户名：</label>
							<div class="col-sm-8">
								<input id="username" name="username" class="form-control"
									type="text" value="${user.username}" readonly>
							</div>
						</div>
						<div class="form-group">
								<label class="col-sm-3 control-label">部门：</label>
								<div class="col-sm-8">
									<input id="deptId" name="deptId" class="hidden" value="${user.deptId}">
									 <input id="deptName" name="deptName"
										class="form-control" type="text" style="cursor: pointer;"
										onclick="openDept()" readonly="readonly" placeholder="所属部门" value="${user.deptName}">
								</div>
							</div>
						<div class="form-group">
							<label class="col-sm-3 control-label">E-mail：</label>
							<div class="col-sm-8">
								<input id="email" name="email" class="form-control" type="email"
									value="${user.email}">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-3 control-label">状态:</label>
							<div class="col-sm-8">
								<label class="radio-inline"> <input
									field="${user.status}" type="radio" name="status" value="1" id="zheng" <#if user.status==1>checked</#if>/>
									正常
								</label> <label class="radio-inline"> <input
									field="${user.status}" type="radio" name="status" value="0" id="jin" <#if user.status==0>checked</#if>/>
									禁用
								</label>
							</div>
						</div>
						<input type="hidden" name="roleIds" id="roleIds" >
						<div class="form-group">
							<label class="col-sm-3 control-label">角色</label>
							<div class="col-sm-8">
                                <label class="checkbox-inline">
								<#list roles as role>
								<input name="role" type="checkbox" value="${role.roleId}"
									   text="${role.roleName}"
								<#if role.roleSign=='true'>checked</#if>
								>${role.roleName}

								</#list>
                                </label>
							<#--	<label each="role:${roles}" class="checkbox-inline">
									<input name="role" type="checkbox" value="${role.roleId}"
									text="${role.roleName}" checked="${role.roleSign}">
								</label>-->
							</div>
						</div>
						<div class="form-group">
							<div class="col-sm-8 col-sm-offset-3">
                                <button type="button" class="btn btn-primary" onclick="update()">提交</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<div include="include::footer"></div>
	<#include "../../footer.ftl">
	<script type="text/javascript" src="${base}/static/js/appjs/sys/user/edit.js">
	</script>
<script>

</script>
</body>
</html>
