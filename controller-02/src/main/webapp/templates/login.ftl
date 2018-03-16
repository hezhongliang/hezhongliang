<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
    <title>BootDo</title>
    <meta name="keywords" content="BootDo管理系统">
    <meta name="description" content="BootDo管理系统">
    <#include "header.ftl">
    <link href="${base}/static/css/bootstrap.min.css" rel="stylesheet">
    <link href="${base}/static/css/font-awesome.css?v=4.4.0" rel="stylesheet">
    <link href="${base}/static/css/animate.css" rel="stylesheet">
    <link href="${base}/static/css/style.css" rel="stylesheet">
    <link href="${base}/static/css/login.css" rel="stylesheet">
    <!--[if lt IE 9]>
    <meta http-equiv="refresh" content="0;ie.html"/>
    <![endif]-->
    <script>
        if (window.top !== window.self) {
            window.top.location = window.location;
        }
    </script>

</head>

<body class="signin">
<div class="signinpanel">
    <div class="row">
        <div class="col-sm-7">
            <div class="signin-info">
                <div class="logopanel m-b">
                    <h1>BootDo</h1>
                </div>
                <div class="m-b"></div>
                <h3>
                    欢迎使用 <strong>BootDo管理系统</strong>
                </h3>
                <ul class="m-b">
                    <li><i class="fa fa-arrow-circle-o-right m-r-xs"></i>
                        springBoot
                    </li>
                    <li><i class="fa fa-arrow-circle-o-right m-r-xs"></i> mybatis</li>
                    <li><i class="fa fa-arrow-circle-o-right m-r-xs"></i> shiro</li>
                    <li><i class="fa fa-arrow-circle-o-right m-r-xs"></i>
                        thymeleaf
                    </li>
                    <li><i class="fa fa-arrow-circle-o-right m-r-xs"></i>
                        bootstrap
                    </li>

                </ul>

            </div>
        </div>
        <div class="col-sm-5">
            <form id="signupForm">
                <h3 class="text-center">用户登录</h3>
                <p class="m-t-md text-center">欢迎登录bootdo后台管理系统</p>
                <input type="text" name="username" class="form-control uname"
                       value="admin"/>
                <input type="password" name="password"
                       class="form-control pword m-b" value="111111"/>
                验证码:<input type="text" name="auth"/><img src="${base}/authImage" onclick="F5(this)"/>
                <button class="btn btn-login btn-block">登录</button>
                <!--按钮模块-->
                <div class="outside-login">
                    <div class="outside-login-tit">
                        <span>代码链接</span>
                    </div>
                    <div class="outside-login-cot">
                        <a class="outside-login-btn wxoa actived oschina J-btnSwitchLoginType" target="_Blank"
                           href="https://www.oschina.net/p/bootdo">
                            <em><i class="fa fa-home"></i></em>
                            <span>oschina主页</span>
                        </a>
                        <a class="outside-login-btn wxoa actived my J-btnSwitchLoginType" target="_Blank"
                           href="https://gitee.com/lcg0124/bootdo">
                            <em><i class="fa fa-git-square"></i></em>
                            <span>码云仓库</span>
                        </a>
                        <a class="outside-login-btn wxoa actived git J-btnSwitchLoginType" target="_Blank"
                           href="https://github.com/lcg0124/bootdo">
                            <em><i class="fa fa-github"></i></em>
                            <span>GitHub仓库</span>
                        </a>
                    </div>
                </div>

            </form>
        </div>
    </div>
    <div class="signup-footer">
        <div class="pull-left">&copy; 2017 All Rights Reserved. BootDo
        </div>
    </div>
</div>
<#include "footer.ftl">
<!-- 全局js -->
<script src="${base}/static/js/jquery.min.js?v=2.1.4" th:src="@{/js/jquery.min.js?v=2.1.4}"></script>
<script src="${base}/static/js/bootstrap.min.js?v=3.3.6" th:src="@{/js/bootstrap.min.js?v=3.3.6}"></script>

<!-- 自定义js -->
<script src="${base}/static/js/content.js?v=1.0.0" th:src="@{/js/content.js?v=1.0.0}"></script>

<!-- jQuery Validation plugin javascript-->
<script src="${base}/static/js/plugins/validate/jquery.validate.min.js" th:src="@{/js/plugins/validate/jquery.validate.min.js}"></script>
<script src="${base}/static/js/plugins/validate/messages_zh.min.js" th:src="@{/js/plugins/validate/messages_zh.min.js}"></script>
<script src="${base}/static/js/plugins/layer/layer.min.js" th:src="@{/js/plugins/layer/layer.min.js}"></script>
<script type="text/javascript">
    $(document).ready(function () {


        validateRule();

    });

    $.validator.setDefaults({
        submitHandler: function () {
            login();
        }
    });

    function login() {
        $.ajax({
            type: "POST",
            url: "${base}/login",
            data: $('#signupForm').serialize(),
            success: function (r) {
                console.info(r)
                if (r.code == 0) {
                    top.location.href = '/';
                } else {
                    layer.msg(r.msg);
                }
            }
        });
    }

    function validateRule() {
        var icon = "<i class='fa fa-times-circle'></i> ";
        $("#signupForm").validate({
            rules: {
                username: {
                    required: true
                },
                password: {
                    required: true
                }
            },
            messages: {
                username: {
                    required: icon + "请输入您的用户名",
                },
                password: {
                    required: icon + "请输入您的密码",
                }
            }
        })
    }

    function F5(obj){
        obj.src="${base}/authImage?"+Math.random();
    }
</script>

</body>


</html>