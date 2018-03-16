<#assign base=request.contextPath />
<#assign ftp="ftp://root:admin@192.168.31.149/1708A" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<#include "../header.ftl">
</head>
<body class="gray-bg">

<div class="wrapper wrapper-content" id="app">
    <div class="row">
        <div class="col-sm-3">
            <div class="ibox float-e-margins">
                <div class="ibox-content">
                    <div class="file-manager">
                        <button type="button" class="layui-btn" id="test1" style="width: 100%;">
                            <i class="fa fa-cloud"></i>上传文件
                        </button>
                        <div class="hr-line-dashed"></div>
                        <ul class="folder-list" style="padding: 0">
                            <li><a href="#" class="file-control "
                                   onclick="changeType('')"><i class="fa fa-folder"></i>所有文件</a></li>
                            <li><a href="javascript:void(0)"
                                   class="file-control" href="javascript:void(0)"
                                   onclick="changeType(0)"><i class="fa fa-folder"></i>图片</a></li>
                            <li><a href="javascript:void(0)"
                                   onclick="changeType(1)" class="file-control"><i class="fa fa-folder"></i>文档</a></li>
                            <li><a href="javascript:void(0)" onclick="changeType(2)"
                                   class="file-control"><i class="fa fa-folder"></i>视频</a></li>
                            <li><a href="javascript:void(0)"
                                   onclick="changeType(3)" class="file-control"><i class="fa fa-folder"></i>音乐</a>
                            <li><a href="javascript:void(0)" onclick="changeType(99)"
                                   class="file-control"><i class="fa fa-folder"></i>其他</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-sm-9 animated fadeInRight">
            <div class="row">
                <div class="col-sm-12">
                    <div class="file-box" v-for="row in rows">
                        <div class="file">
                            <a href="#">
                                <span class="corner"></span>
                                <div class="image">
                                    <img alt="image" class="img-responsive" :src="'${ftp}'+row.url">
                                </div>
                                <div class="file-name">
                                    <br/>
                                    <small>{{row.createDate}}</small>
                                </div>
                                &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;<button
                                    class="btn btn-warning btn-xs copy" :url="row.url">复制
                            </button>&nbsp; &nbsp; &nbsp; &nbsp;<button class="btn btn-danger btn-xs"
                                                                        @click="remove(row.id)">删除
                            </button>
                            </a>
                        </div>
                    </div>
                    <div id="incomeNum"></div>
                </div>
            </div>
            <div>
                <ul id="page"></ul>
            </div>
        </div>
    </div>
</div>



<#include "../footer.ftl">
<script>
    var app = new Vue({
        el: '#app',
        data: {
            limit: 12,
            offset: 0,
            total: 0,
            file: '',
            type: '',
            rows: '',
        },
        methods: {
            getData: function () {
                $.getJSON("${base}/file/toquerylist", {
                    limit: this.limit,
                    offset: this.offset,
                    type: this.type
                }, function (r) {
                    app.total = r.total;
                    app.rows = r.rows;
                    app.page();
                });
            },
            page: function () {
                var options = {
                    currentPage: app.offset / 12 + 1, //当前页
                    totalPages: app.total / (12 + 1) + 1, //总页数
                    numberofPages: 4, //显示的页数
                    bootstrapMajorVersion: 3,
                    alignment: 'center',
                    size: 'large',
                    shouldShowPage: true,
                    itemTexts: function (type, page, current) { //修改显示文字
                        switch (type) {
                            case "first":
                                return "首页";
                            case "prev":
                                return "上一页";
                            case "next":
                                return "下一页";
                            case "last":
                                return "尾页";
                            case "page":
                                return page;
                        }
                    },
                    onPageClicked: function (event, originalEvent, type, page) {
                        app.offset = (page - 1) * 12;
                        app.getData();
                    }
                };
                $('#page').bootstrapPaginator(options);
            },
            remove: function (id) {
            alert(id)
                layer.confirm('确定要删除选中的记录？', {
                    btn: ['确定', '取消']
                }, function () {
                    $.ajax({
                        url: "${base}/file/deleteByIdFile",
                        type: "post",
                        data: {
                            'id': id
                        },
                        success: function (r) {
                            if (r.code == 0) {
                                layer.msg(r.msg);
                                 app.getData();
                                 //location.href();
                            } else {
                                layer.msg(r.msg);
                            }
                        }
                    });
                })
            }
        },
        created: function () {
            this.getData();
        }
    });
</script>
<script type="text/javascript">
    var clipboard = new Clipboard('button.copy', {
        text: function (list) {
            layer.msg('文件路径已复制到粘贴板');
            return $(list).attr('url');
        }
    });
    layui.use('upload', function () {
        var upload = layui.upload;
        //执行实例
        var uploadInst = upload.render({
            elem: '#test1', //绑定元素
            url: '${base}/file/uploadFileOne', //上传接口
            size: 1000,
            accept: 'file',
            done: function (r) {
                layer.msg(r.msg);
                app.getData();
            },
            error: function (r) {
                layer.msg(r.msg);
            }
        });
    });
    function changeType(i) {
        app.type = i;
        app.offset = 0;
        app.getData();
    }
</script>
</body>
</html>