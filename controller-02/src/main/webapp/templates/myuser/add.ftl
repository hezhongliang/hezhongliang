<#assign base=request.contextPath />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<form id="myform"> 
	账号<input name="userAcount">
	密码<input name="userPass">
	<input type="button" class="btn btn-primary" onclick="add1()" value="新增">
</form>
<script type="text/javascript">
			function add1(){
				 $.ajax({
					 					url:"${base}/user/add.do",
		                                type:"post",
										data:$("#myform").serialize(),	
										dataType:"text",
		                                success:function(data){
		                                   location.reload();
		                                }
		                            })

			}
 					
</script>
</body>
</html>