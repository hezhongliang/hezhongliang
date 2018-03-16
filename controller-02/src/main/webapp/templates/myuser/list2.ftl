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




		 <form id="updateform"  method="post">
		 <#list list as l>
		 <input  name="userID" type="hidden" value="${l.userID}">
   		 账号		<input  name="userAcount"  value="${l.userAcount}">
   		密码         		<input  name="userPass" value="${l.userPass}"><br>
   			
   </#list>
   </form>

  <input type="button" id="updatesbutton" class="btn btn-primary" value="批量">
<#include "../footer.ftl">
<script type="text/javascript">

    BootstrapDialog.show({
	    title: '添加问题',
	    message:$('#updateform'),
	    buttons: [{
	        label: '确认',
	        action: function(dialog) {
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
    	alert("123")
    	var user_info_arr = [];
			var arr_1 = $("input[name='userAcount']");
			var arr_2 = $("input[name='userPass']");
			var arr_3 = $("input[name='userID']");
			for (var i = 0; i < arr_1.length; i++) {
				user_info_arr.push({
					userID:arr_3[i].value,
					userAcount:arr_1[i].value,
					userPass:arr_2[i].value
					
				});
			}
    	$.ajax({
    		
    		url:"${base}/user/updateUserAll.do",
    		type:"post",
    		dataType:"json",
    		contentType:'application/json;charset=utf-8', //设置请求头信息
			data:JSON.stringify(user_info_arr),
    		success:function(data){
    			  alert("123")
    			  location.herf="${base}/user/toindex.do";
    			
    		},
    		
    	})
    	
    
		       }
	    }, {
	        label: '关闭',
	        action: function(dialog) {
	         
	        	dialog.close();  
	        }
	    }]
	});	

</script>
</body>
</html>
