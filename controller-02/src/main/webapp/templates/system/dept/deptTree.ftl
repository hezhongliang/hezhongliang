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

				<div class="ibox-content">
					<div id="deptTree"></div>
				</div>
				<div class="form-group hidden">
					<div class="col-sm-12 col-sm-offset-12">
						<button type="submit" class="btn btn-primary">提交</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div th:include="include :: footer"></div>


	<script type="text/javascript">
		$(document).ready(function() {
			getTreeData()
		});
		function getTreeData() {
			$.ajax({
				type : "GET",
				url : "${base}/demp/tree",
				success : function(tree) {
					loadTree(tree);
				}
			});
		}
		function loadTree(tree) {
			$('#deptTree').jstree({
				'core' : {
					'data' : tree
				},
				"plugins" : [ "search" ]
			});
			$('#deptTree').jstree().open_all();
		}
		$('#deptTree').on("changed.jstree", function(e, data) {
			if(data.node.id!=-1){
				parent.loadDept(data.node.id,data.node.text);
				var index = parent.layer.getFrameIndex(window.name); // 获取窗口索引
				parent.layer.close(index);
			}
			
		});
		
	</script>
</body>

</html>
