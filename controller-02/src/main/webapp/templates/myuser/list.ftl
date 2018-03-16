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
<input type="button" id="psbutton" class="btn btn-primary" value="批量删除">
<input type="button" onclick="plxbutton()" class="btn btn-primary" value="批量新增">
<i class=" icon-plus-sign-alt"></i><input type="button" id="pxbutton" class="btn btn-primary" value="批量修改">
<table class="table" id="menu-table" border="1"></table>

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
<script type="text/javascript">
function search(){
	$("#menu-table").bootstrapTable("refresh",{'pageNumber':1});
}
$(function(){
    $("#menu-table").bootstrapTable({
//      url:"<%=request.getContextPath()%>/crud/queryAll.do",
        url:"${base}/user/queryAll.do",
        striped: true,//隔行变色
//        showColumns:true,//是否显示 内容列下拉框
//        showPaginationSwitch:true,//是否显示 数据条数选择框
        minimumCountColumns:1,//最小留下一个
//        showRefresh:true,//显示刷新按钮
//        showToggle:true,//显示切换视图
//     	search:true,//是否显示搜索框
//     	searchOnEnterKey:true,//设置为 true时，按回车触发搜索方法，否则自动触发搜索方法
        pagination:true,//开启分页
        paginationLoop:true,//开启分页无限循环
        pageNumber:1,//当前页数
        pageSize:2,//每页条数
        pageList:[2,3,4],//如果设置了分页，设置可供选择的页面数据条数。设置为All 则显示所有记录。
        sidePagination:"server",//分页方式：client客户端分页，server服务端分页（*） ，如果不分页，必须干掉！！！
        method:'post',//发送请求的方式
        contentType:"application/x-www-form-urlencoded",//必须的否则条件查询时会乱码
        queryParams:function(param){
        
//                var name= $("#empName").val();
//                 var sex = $("#sex").val();
//                 alert(name+","+sex);
//                 return 的数据 是传递到  action类中的参数

                return {
//                     "emp.empname":name,
                    page:this.pageNumber,//当前页
                    rows:this.pageSize //每页条数
                 }
           },
        columns: [
         {
             checkbox:true,
        },{
            field: 'userID',
            title: '编号',
            width: 100
           
        },{
            field: 'userAcount',
            title: '账号',
            width: 100
           
        },{
            field: 'userPass',
            title: '密码',
            width: 100
           
        },{
            field: 'aa',
            title: '操作',
            width: 100,
            formatter: function(value,row,index){
            	console.info(value);console.info(row.goodsid);console.info(index);
        		return '<input type="button" class="btn btn-primary" onclick="del(\''+row.userID+'\')" value="删除">'+
        		'<input type="button" class="btn btn-primary" onclick="toup(\''+row.userID+'\')" value="修改">'
        		;
        	}
           
        }]
    })
})

			function del(id){
				 $.ajax({
					 					url:"${base}/user/del.do",
		                                type:"post",
										data:{"userID":id},	
										dataType:"text",
		                                success:function(data){
											alert("删除成功")
		                                   location.reload();
		                                }
		                            })

			}
			
			function toup(id){
			location.href="${base}/user/toup.do?userID="+id;

			}
			
			 $("#psbutton").on("click",function(){
				   var rows = $("#menu-table").bootstrapTable('getSelections');  
				    if (rows.length== 0) {  
				        alert("请先选择要删除的记录!");  
				        return;  
				    }else{
				    	
				    	var  ids ="";
						 for (var i = 0; i < rows.length; i++) {
							/*  rows[i].bupordown=='上架' */
								
								ids += rows[i].userID+","
								alert(ids);

					 } 
						 $.ajax({
							 
							 url:'${base}/user/deletes.do', 
							 data:{"ids":ids},
								type:"post",
								dataType:"text",
								success:function(data){
									 $("#menu-table").bootstrapTable("refresh",{'pageNumber':1});
										
								}
						 }) 	
				    }
				   
			   })

			   
	 $("#pxbutton").on("click",function(){
	   var rows = $("#menu-table").bootstrapTable('getSelections');  
	    if (rows.length== 0) {  
	        alert("请选择要修改的信息!");  
	        return;  
	    }else{
	    	
	    	var  ids ="";
			 for (var i = 0; i < rows.length; i++) {
				/*  rows[i].bupordown=='上架' */
					
					ids += rows[i].userID+","
					alert(ids);

		 } 
			location.href="${base}/user/queryUserById1.do?ids1="+ids;
	    }
	   
   })
		function plxbutton(){
		   location.href="${base}/user/toadds.do";
		}
		
			   
</script>
</body>
</html>
