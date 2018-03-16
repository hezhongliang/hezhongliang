<#assign base=request.contextPath />
<!DOCTYPE html>
<html>
<meta charset="utf-8">
</head>
 <#include "../../header.ftl">
</head>
<body class="gray-bg">
	<div class="wrapper wrapper-content">
		<div class="row">
			<div class="col-sm-12">
				<div class="ibox float-e-margins">
					<div class="ibox-content">
						<div class="col-sm-12">
							<h4>发布文章</h4>
						</div>
						<form class="form-horizontal m-t" id="signupForm">
							<input id="cid" name="cid" type="hidden">
							<div class="form-group">
								<label class="col-sm-1 control-label">标题：</label>
								<div class="col-sm-4">
									<input id="title" name="title" class="form-control" type="text">
								</div>
								<label class="col-sm-1 control-label">作者：</label>
								<div class="col-sm-4">
									<input id="author" name="author" class="form-control"
										type="text">
								</div>
							</div>
							<div class="form-group">
								<input id="content" name="content" type="hidden"> <label
									class="col-sm-1 control-label">内容：</label>
								<div class="col-sm-11">
									<div class="ibox-content no-padding">
										<div id="content_sn" class="summernote"></div>
									</div>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-1 control-label">类型：</label>
								<div class="col-sm-11">
									<input id="categories" name="categories" class="form-control" type="text">
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">开启评论：</label>
								<div class="switch onoffswitch col-sm-1">
									<div class="onoffswitch">
										<input id="allowComment" name="allowComment" checked=""
											type="checkbox" value="1" class="onoffswitch-checkbox"
											id="example1"> <label class="onoffswitch-label"
											for="example1"> <span class="onoffswitch-inner"></span>
											<span class="onoffswitch-switch"></span>
										</label>
									</div>
								</div>

								<label class="col-sm-2 control-label">允许订阅：</label>
								<div class="switch onoffswitch col-sm-2">
									<div class="onoffswitch">
										<input id="allowFeed" name="allowFeed" type="checkbox"
											value="1" class="onoffswitch-checkbox" id="example3">
										<label class="onoffswitch-label" for="example3"> <span
											class="onoffswitch-inner"></span> <span
											class="onoffswitch-switch"></span>
										</label>
									</div>
								</div>
								<input id="status" name="status" type="hidden">
							</div>
							<div class="text-right form-group">
								<a class="btn btn-default waves-effect waves-light"
									onclick="returnList()">返回列表</a>
								<button type="button"
									class="btn btn-primary waves-effect waves-light" type="submit">保存文章</button>
								<button type="button"
									class="btn btn-warning waves-effect waves-light"
									onclick="save(0)">存为草稿</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<#include "../../footer.ftl">
	<script>
        $().ready(function() {

            $('.summernote').summernote({
                height : '220px',
                lang : 'zh-CN',
                callbacks: {
                    onImageUpload: function(files, editor, $editable) {
                        sendFile(files);
                    }
                }
            });
            validateRule();
        });


        $.validator.setDefaults({
            submitHandler : function() {
                save(1);
            }
        });
        function save(status) {
            $("#status").val(status);
       /*     var content_sn = $("#content_sn").summernote('code');
            $("#content").val(content_sn);*/
            $.ajax({
                cache : true,
                type : "POST",
                url : "/blog/bContent/save",
                data : $('#signupForm').serialize(),// 你的formid
                async : false,
                error : function(request) {
                    parent.layer.alert("Connection error");
                },
                success : function(r) {
                    if (r.code == 0) {
                        parent.layer.msg(r.msg);
                        parent.reLoad();
                        $("#cid").val(r.cid);

                    } else {
                        parent.layer.alert(r.msg)
                    }
                }
            });
        }
        function validateRule() {
            var icon = "<i class='fa fa-times-circle'></i> ";
            $("#signupForm").validate({
                rules : {
                    title : "required",
                    author : "required",
                    content : "required"
                },
                messages : {
                    title : "请填写文章标题",
                    author : "请填写文章作者",
                    content : "请填写文章内容"
                }
            });
        }

        function returnList() {
            var index = parent.layer.getFrameIndex(window.name); // 获取窗口索引
            parent.layer.close(index);
        }

	</script>
</body>
</html>
