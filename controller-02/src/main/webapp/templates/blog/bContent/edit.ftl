
<!DOCTYPE html>
<html>
<meta charset="utf-8">
<#include "../../header.ftl">
<head th:include="include :: header"></head>
<body class="gray-bg">
<div class="wrapper wrapper-content ">
    <div class="row">
        <div class="col-sm-12">
            <div class="ibox float-e-margins">
                <div class="ibox-content">
                    <div class="col-sm-12">
                        <h4>发布文章</h4>
                    </div>
                    <form class="form-horizontal m-t" id="updateForm">
                        <input id="cid" name="cid" type="hidden"
                               value="${bContent.cid}">
                        <div class="form-group">
                            <label class="col-sm-1 control-label">标题：</label>
                            <div class="col-sm-4">
                                <input id="title" name="title" class="form-control" type="text"
                                       value="${bContent.title}">
                            </div>
                            <label class="col-sm-1 control-label">作者：</label>
                            <div class="col-sm-4">
                                <input id="author" name="author" class="form-control"
                                       type="text" value="${bContent.author}">
                            </div>
                        </div>
                        <div class="form-group">
                            <input id="content" name="content" type="hidden"
                                   value="${bContent.content}"> <label
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
                                <input value="${bContent.type}" id="categories"
                                       name="type" class="form-control" type="text">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">开启评论：</label>
                            <div class="switch onoffswitch col-sm-1">
                                <div class="onoffswitch">
                                    <input id="allowComment" name="allowComment" checked=""
                                           type="checkbox" value="1" class="onoffswitch-checkbox"
											<#if bContent.allowComment==1>checked</#if>/> <label
                                        class="onoffswitch-label" for="allowComment"> <span
                                        class="onoffswitch-inner"></span> <span
                                        class="onoffswitch-switch"></span>
                                </label>
                                </div>
                            </div>

                            <label class="col-sm-2 control-label">允许订阅：</label>
                            <div class="switch onoffswitch col-sm-2">
                                <div class="onoffswitch">
                                    <input id="allowFeed" name="allowFeed" type="checkbox"
                                           checked="" value="1" class="onoffswitch-checkbox"
											<#if bContent.allowFeed==1>checked</#if>/> <label
                                        class="onoffswitch-label" for="allowFeed"> <span
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
                                    class="btn btn-primary waves-effect waves-light"
                                    onclick="update(1)">保存文章</button>
                            <button type="button"
                                    class="btn btn-warning waves-effect waves-light"
                                    onclick="update(0)">存为草稿</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<div th:include="include::footer"></div>
	<#include "../../footer.ftl">
<script type="text/javascript" src="${base}/static/js/appjs/blog/bContent/edit.js">

</script>

<script type="text/javascript">
    $().ready(function() {
        $('.summernote').summernote({
            height : '220px',
            lang : 'zh-CN',
            callbacks: {
                onImageUpload: function(files, editor, $editable) {
                    console.log("onImageUpload");
                    sendFile(files);
                }
            }
        });
        var content = $("#content").val();

        $('#content_sn').summernote('code', content);
        validateRule();
    });

    $.validator.setDefaults({
        submitHandler : function() {
            update();
        }
    });
    function update(status) {
       /* $("#status").val(status);*/

        /*var content_sn = $("#content_sn").summernote('code');
        $("#content").val(content_sn);*/
        $.ajax({
            cache : true,
            type : "POST",
            url : "${base}/blog/updates?status="+status,
            data : $('#updateForm').serialize(),// 你的formid
            async : false,
            /*error : function(request) {
                parent.layer.alert("Connection error");
            },*/
            success : function(data) {
                if (data > 0) {
                    parent.layer.msg("操作成功");
                    parent.reLoad();
                    var index = parent.layer.getFrameIndex(window.name); // 获取窗口索引
                    parent.layer.close(index);

                } else {
                    parent.layer.alert(data.msg)
                }

            }
        });

    }

</script>
</body>
</html>

