<#assign base=request.contextPath />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="${base}/js/bootstrap/css/bootstrap-theme.min.css" rel="stylesheet">
<!-- Bootstrap 核心css -->
<link href="${base}/js/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<!-- Bootstrap TreeView css -->
<link href="${base}/js/bootstrap-treeview/dist/bootstrap-treeview.min.css" rel="stylesheet">
<!-- Bootstrap addTabs css -->
<link href="${base}/js/bootStrap-addTabs/bootstrap.addtabs.css" rel="stylesheet">
<!-- Bootstrap table css -->
<link href="${base}/js/bootstrap-table/dist/bootstrap-table.css" rel="stylesheet">
<!-- bootstrap-datetimepicker css -->
<link href="${base}/js/bootstrap-datetimepicker/css/bootstrap-datetimepicker.css" rel="stylesheet">
<!-- bootstrap-dialog css -->
<link href="${base}/js/bootstrap-dialog/dist/css/bootstrap-dialog.css" rel="stylesheet">
<!-- bootstrap-fileinput css -->
<link href="${base}/js/bootstrap-fileinput/css/fileinput.css" rel="stylesheet">  

</head>
<body>
<form id="myform"> 
	账号<input name="userAcount" value="${u.userAcount}">
	密码<input name="userPass"  value="${u.userPass}">
	<input name="userID"  value="${u.userID}" >
	<input type="button" class="btn btn-primary" onclick="add1()" value="修改">
</form>

<script src="${base}/js/jquery.min.js"></script>
<!-- bootstrap 核心js文件 -->
<script src="${base}/js/bootstrap/js/bootstrap.min.js"></script>
<!-- bootStrap TreeView -->
<script src="${base}/js/bootstrap-treeview/dist/bootstrap-treeview.min.js"></script>
<!-- bootStrap addTabs -->
<script src="${base}/js/bootStrap-addTabs/bootstrap.addtabs.js"></script>
<!-- bootStrap table -->
<script src="${base}/js/bootstrap-table/dist/bootstrap-table.js"></script>
<!-- bootStrap table 语言包中文-->
<script src="${base}/js/bootstrap-table/dist/locale/bootstrap-table-zh-CN.js"></script>
<!-- bootstrap-datetimepicker -->
<script src="${base}/js/bootstrap-datetimepicker/js/bootstrap-datetimepicker.js"></script>
<script src="${base}/js/bootstrap-datetimepicker/js/locales/bootstrap-datetimepicker.zh-CN.js"></script>
<!-- bootstrap-dialog -->
<script src="${base}/js/bootstrap-dialog/dist/js/bootstrap-dialog.js"></script>
<!-- bootstrap-fileinput -->
<script src="${base}/js/bootstrap-fileinput/js/fileinput.js"></script>
<script src="${base}/js/bootstrap-fileinput/js/locales/zh.js"></script>
<script type="text/javascript">

			function add1(){
				 $.ajax({
					 					url:"<%=request.getContextPath()%>/user/ups.do",
		                                type:"post",
										data:$("#myform").serialize(),	
										dataType:"text",
		                                success:function(data){
											alert("修改成功")
		                                   location.href="../../index.jsp";
		                                }
		                            })

			}
 					
</script>
</body>
</html>