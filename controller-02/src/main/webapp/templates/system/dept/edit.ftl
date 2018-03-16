<#assign base=request.contextPath />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	<#include "../../header.ftl">

</head>

<body class="gray-bg">
<#include "../../footer.ftl">
	<div class="wrapper wrapper-content animated fadeInRight">
		<div class="row">
			<div class="col-sm-12">
				<div class="ibox float-e-margins">
					<div class="ibox-content">
						<form class="form-horizontal m-t" id="signupForm">
							<input id="deptId" name="deptId" value="${sysDept.deptId}"
								class="hidden">
							<div class="form-group">
								<label class="col-sm-3 control-label ">上级部门：</label>
								<div class="col-sm-8">
								<input th:value="${parentDeptName}"
										class="form-control" type="text" readonly="true" />
									<input class="form-control hidden" type="text" id="parentId" name="parentId" value="${sysDept.parentId}">
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label">部门名称：</label>
								<div class="col-sm-8">
									<input id="name" name="name" value="${sysDept.name}"
										class="form-control" type="text">
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label">排序：</label>
								<div class="col-sm-8">
									<input id="orderNum" name="orderNum" value="${sysDept.orderNum}"
										class="form-control" type="text">
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label">状态：</label>
								<div class="col-sm-8">
									<input id="delFlag" name="delFlag" value="${sysDept.delFlag}"
										class="form-control" type="text">
								</div>
							</div>
							<div class="form-group">
								<div class="col-sm-8 col-sm-offset-3">
									<button type="button" class="btn btn-primary" onclick="up()">提交</button>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript" src="${base}/static/js/appjs/system/sysDept/edit.js">
	</script>
</body>
</html>
