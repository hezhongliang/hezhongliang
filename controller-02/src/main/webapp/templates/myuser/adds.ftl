<#assign base=request.contextPath />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<#include "../header.ftl">
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
<script src="${base}/js/jquery.min.js"></script>
<!-- bootstrap 核心js文件 -->
<script type="text/javascript" src="${base}/js/bootstrap-dialog/dist/js/bootstrap-dialog.min.js"></script>
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

<form id="user_info_form">
	<span id="user_info_span_1" class="user_info_span">
	账号：<input name="userAcount">
	密码：<input name="userPass">
	<div class="btn btn-lg btn-success" onclick="apend_userinfo()">追加一条</div>
	</span>
	<br>
	
</form>
<#include "../footer.ftl">
<script type="text/javascript">
	function apend_userinfo() {
		var user_info_span_arr = $(".user_info_span");
		if (user_info_span_arr.length < 5) {
			var user_span_1 = $("#user_info_span_1");
			var aaaa = user_span_1.html();
			user_span_1.after("<hr><span class='user_info_span'>" + aaaa + "</span>");
		} else {
			alert("最多添加5条数据")
		}
	}
	
	BootstrapDialog.show({
    title: '添加问题',
    message:$('#user_info_form'),
    buttons: [{
        label: '确认',
        action: function(dialog) {
		var f = 0;
		var input_arr = $("#user_info_form :input").each(function() {
			if (null == $(this).val() || "" == $(this).val()) {
				f = 1;
			}
		});
		if (1 == f) {
			alert("不允许出现空值");
			return;
		}
		
		var user_info_arr = [];
		var arr_1 = $("input[name='userAcount']");
		var arr_2 = $("input[name='userPass']");
		for (var i = 0; i < arr_1.length; i++) {
			user_info_arr.push({
				userAcount:arr_1[i].value,
				userPass:arr_2[i].value
			});
		}
		$.ajax({
			url:"${base}/user/insertUsers.do",
			contentType:'application/json;charset=utf-8', //设置请求头信息
			data:JSON.stringify(user_info_arr),
			dataType:"json",
			type:"post",
			success:function(data) {
				alert("请求已受理，请耐心等待");
			}
		});	
	
   }
    }, {
        label: '关闭',
        action: function(dialog) {
         
        	dialog.close();  
        }
    }]
})
</script>
</body>
</html>




