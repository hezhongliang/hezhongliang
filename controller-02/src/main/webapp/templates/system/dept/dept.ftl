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
<div class="wrapper wrapper-content ">
    <div class="col-sm-12">
        <div class="ibox">
            <div class="ibox-body">
                <div class="fixed-table-toolbar">
                    <div class="columns pull-left">
                        <button shiro:hasPermission="system:sysDept:add" type="button" class="btn  btn-primary"
                                onclick="add(0)">
                            <i class="fa fa-plus hidden" aria-hidden="true"></i>添加
                        </button>
                        <button shiro:hasPermission="system:sysDept:batchRemove" type="button" class="btn  btn-danger"
                                onclick="batchRemove()">
                            <i class="fa fa-trash" aria-hidden="true"></i>删除
                        </button>
                    </div>
                    <div class="columns pull-right">
                        <button class="btn btn-success" onclick="reLoad()">查询</button>
                    </div>

                    <div class="columns pull-right col-md-2 nopadding">
                        <input id="searchName" type="text" class="form-control"
                               placeholder="">
                    </div>
                </div>
                <table id="exampleTable" data-mobile-responsive="true">
                </table>
            </div>
        </div>
    </div>
</div>
<!--shiro控制bootstraptable行内按钮看见性 来自bootdo的创新方案 -->
<div>
    <script type="text/javascript">
        var s_add_h = 'hidden';
        var s_edit_h = 'hidden';
        var s_remove_h = 'hidden';
        var s_resetPwd_h = 'hidden';
    </script>
</div>
<div shiro:hasPermission="system:sysDept:edit">
    <script type="text/javascript">
        s_edit_h = '';
    </script>
</div>
<div shiro:hasPermission="system:sysDept:add">
    <script type="text/javascript">
        s_add_h = '';
    </script>
</div>
<div shiro:hasPermission="system:sysDept:remove">
    <script type="text/javascript">
        var s_remove_h = '';
    </script>
</div>
<div shiro:hasPermission="system:sysDept:resetPwd">
    <script type="text/javascript">
        var s_resetPwd_h = '';
    </script>
</div>
</div>

<script type="text/javascript" src="${base}/static/js/appjs/system/sysDept/sysDept.js"></script>
</body>
</html>