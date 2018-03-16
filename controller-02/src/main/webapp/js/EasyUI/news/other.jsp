<%--
------树
	-----方法1
	//下拉树文本
		<select id="pid" name="pid" class="easyui-combotree" style="width:200px;"   
   		 data-options="url:'<%=request.getContextPath()%>/crud/queryArea.do',required:true,parentField:'pid'"></select> 
		-------java
			@RequestMapping("queryArea")
			@ResponseBody
			public Object queryMenus(){
				List list= userService.queryArea();
				return list;
			}
	//下拉树回显
	  	$("#pid").combotree('setValues',data.pid)
	  	
	-----方法2
		<input id="ctree" name="deptid">  
		$(function(){
			$('#ctree').combotree({    
			    url: '<%=request.getContextPath()%>/menu/queryDept.do',   
			    parentField:"pid",
			    onBeforeSelect:function(node){//节点被转选中前触发，返回false可以取消选择动作
				//isLeaf:判断 是否是叶子节点    返回值为 布尔类型
			    	return $('#ctree').tree('isLeaf',node.target);
			    }
			});  
		});
	-------combobox	
	//combobox下拉框
		<select id="3" class="easyui-combobox" >
				<option value="">请选择</option>
				<c:forEach items="${joblist}" var="l">
					<option value="${l.jobid}">${l.jobname}</option>
				</c:forEach> 
		</select>
		
	//combobox下拉框回显
		$("#pid").combobox('select',data.pid)  
--%>