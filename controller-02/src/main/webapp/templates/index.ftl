<#assign base=request.contextPath />
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="renderer" content="webkit">
    <title>面向学习型的开源框架，简洁高效，减少过渡封装，展现技术本质</title>
    <meta name="keywords" content="面向学习型的开源框架，简洁高效，杜绝过渡封装，展现技术本质本质">
    <meta name="description" content="面向学习型的开源框架，简洁高效，杜绝过渡封装，展现技术本质本质">
    <!--[if lt IE 9]>
    <meta http-equiv="refresh" content="0;ie.html"/>
    <![endif]-->
    <link rel="shortcut icon" href="favicon.ico">

    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
	<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/bootstrap-table/1.11.1/bootstrap-table.min.css">
	<!--
    <link href="${base}/static/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
    -->
    <link href="${base}/static/css/font-awesome.min.css?v=4.4.0" rel="stylesheet">
    <link href="${base}/static/css/plugins/toastr/toastr.min.css" rel="stylesheet">
    <link href="${base}/static/css/animate.css" rel="stylesheet">
    <link href="${base}/static/css/style.css?v=4.1.0" rel="stylesheet">
</head>
<body class="fixed-sidebar full-height-layout gray-bg"
      style="overflow: hidden">
<div id="wrapper">
    <!--左侧导航开始-->
    <nav class="navbar-default navbar-static-side" role="navigation">
        <div class="nav-close">
            <i class="fa fa-times-circle"></i>
        </div>
        <div class="sidebar-collapse">
            <ul class="nav" id="side-menu">
                <li class="nav-header">
                    <div>
                        <span><img alt="image" class="img-circle" height="60" width="60" th:src=""/></span>
                        <h3 class="" style="color: #ffffff">
                            </i>BootDo后台管理系统
                        </h3>
                    </div>
                    <div class="dropdown profile-element hidden">

                        <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                            <span class="clear">
                            <span class="block m-t-xs"><strong class="font-bold"
                                                               th:text="">admin</strong></span>
                            <span class="text-muted text-xs block">超级管理员<b class="caret"></b></span>
                             </span>
                        </a>
                        <ul class="dropdown-menu animated fadeInRight m-t-xs">
                            <li><a @click="personal" href="#">修改头像</a>
                            </li>
                            <li><a @click="personal" href="#">个人资料</a>
                            </li>
                            <li><a @click="personal" href="#">密码修改</a>
                            </li>
                            <li><a @click="personal" href="#">信箱</a>
                            </li>
                            <li class="divider"></li>
                            <li><a href="/logout">安全退出</a>
                            </li>
                        </ul>
                        <div class="logo-element">BootDo</div>
                    </div>
                </li>
                <li><a href="#"> <i class="fa fa-home"></i> <span
                        class="nav-label">主页</span> <span class="fa arrow"></span>
                </a>
                    <ul class="nav nav-second-level">
                        <li><a id="index001" class="J_menuItem" href="index_v1.html"
                               data-index="0" th:href="@{/main}">了解BootDo</a></li>
                       <li><a id="index002" class="J_menuItem" href="${base}/user/tolist.do"
                       data-index="0" th:href="@{/main}">用户管理</a></li>

                    </ul>
                </li>
                <li th:each="menu : []"><a href="#"> <i
                        class="fa fa fa-bar-chart-o" th:class=""></i>
                    <span class="nav-label" th:text="">基础管理</span> <span
                            class="fa arrow"></span>
                </a>
                    <ul class="nav nav-second-level">
                        <li th:each="cmenu : []"><a class="J_menuItem" href="${base}/file/toFileListPage"
                                                                  th:text=""
                                                                  th:href="">文件管理</a></li>
                    </ul>
                </li>
                <li th:each="menu : []"><a href="#"> <i
                        class="fa fa fa-bar-chart-o" th:class=""></i>
                    <span class="nav-label" th:text="">系统管理</span> <span
                            class="fa arrow"></span>
                </a>
                    <ul class="nav nav-second-level">
                        <li th:each="cmenu : []"><a class="J_menuItem" href="${base}/demp/toDempListPage"
                                                                  th:text=""
                                                                  th:href="">部门管理</a></li>
                        <li th:each="cmenu : []"><a class="J_menuItem" href="${base}/sysuser/tosysuserList"
                                                    th:text=""
                                                    th:href="">用户管理</a></li>
                        <li th:each="cmenu : []"><a class="J_menuItem" href="${base}/role/toroleList"
                                                    th:text=""
                                                    th:href="">角色管理</a></li>
                        <li th:each="cmenu : []"><a class="J_menuItem" href="${base}/menu/tomenuList"
                                                    th:text=""
                                                    th:href="">系统菜单</a></li>
                    </ul>



                </li>






                <li th:each="menu : []"><a href="#"> <i
                        class="fa fa-rss-square" th:class=""></i>
                    <span class="nav-label" th:text="">博客</span> <span
                            class="fa arrow"></span>
                </a>
                    <ul class="nav nav-second-level">
                        <li th:each="cmenu : []"><a class="J_menuItem" href="${base}/blog/toadd"
                                                    th:text=""
                                                    th:href="">发布文章</a></li>

                    </ul>
                    <ul class="nav nav-second-level">
                        <li th:each="cmenu : []"><a class="J_menuItem" href="${base}/blog/bComments"
                                                    th:text=""
                                                    th:href="">文章列表</a></li>

                    </ul>

                </li>


                <li th:each="menu : []"><a href="#"> <i
                        class="fa fa fa-bar-chart-o" th:class=""></i>
                    <span class="nav-label" th:text="">系统监控</span> <span
                            class="fa arrow"></span>
                </a>
                    <ul class="nav nav-second-level">
                        <li th:each="cmenu : []"><a class="J_menuItem" href="${base}/online/lists"
                                                    th:text=""
                                                    th:href="">在线用户</a></li>

                    </ul>

                </li>



            </ul>
        </div>
    </nav>
    <!--左侧导航结束-->
    <!--右侧部分开始-->
    <div id="page-wrapper" class="gray-bg dashbard-1">
        <div class="row border-bottom">
            <nav class="navbar navbar-static-top" role="navigation"
                 style="margin-bottom: 0">
                <div class="navbar-header">

                    <a class="navbar-minimalize minimalize-styl-2 btn btn-default "
                       href="#" title="收起菜单"><i class="fa fa-bars"></i> </a>
                    <form role="search" class="navbar-form-custom"
                          method="post" action="">
                        <div class="form-group">
                            <input type="text" placeholder="请输入您需要查找的内容 …"
                                   class="form-control" name="top-search" id="top-search">
                        </div>
                    </form>
                </div>
                <ul class="nav navbar-top-links navbar-right">
                    <li class="hidden-xs"><a href="/blog" target="_Blank"
                                             class=""><i class="fa fa-rss-square"></i>博客</a></li>
                    <li class="dropdown"><a class="dropdown-toggle count-info"
                                            data-toggle="dropdown" href="#"> <i class="fa fa-envelope"></i>
                        <span class="label label-warning">{{total}}</span>通知
                    </a>
                        <ul class="dropdown-menu dropdown-messages">
                            <li v-for="row in rows" class="m-t-xs">
                                <div class="dropdown-messages-box">
                                    <a class="pull-left"> <i
                                            class="fa fa-server"></i>
                                    </a>
                                    <div class="media-body">
                                        <small class="pull-right">{{row.before}}</small>
                                        <strong>{{row.sender}}</strong>
                                        {{row.title}} <br>
                                        <small class="text-muted">{{row.updateDate}}</small>
                                    </div>
                                </div>
                                <div class="divider"></div>
                            </li>
                            <li>
                                <div class="text-center link-block">
                                    <a class="J_menuItem" href="/oa/notify/selfNotify"> <i
                                            class="fa fa-envelope"></i> <strong> 查看所有消息</strong>
                                    </a>
                                </div>
                            </li>
                        </ul>
                    </li>
                    <li class="hidden-xs"><a @click="personal" href="#" ><i class="fa fa-id-card"></i> 个人</a></li>
                    <li class="dropdown hidden-xs"><a
                            class="right-sidebar-toggle" aria-expanded="false"> <i
                            class="fa fa-tasks"></i> 主题
                    </a></li>
                </ul>
            </nav>
        </div>
        <div class="row content-tabs">
            <button class="roll-nav roll-left J_tabLeft">
                <i class="fa fa-backward"></i>
            </button>
            <nav class="page-tabs J_menuTabs">
                <div class="page-tabs-content">
                    <a href="javascript:;" class="active J_menuTab"
                       data-id="index_v1.html">首页</a>
                </div>
            </nav>
            <button class="roll-nav roll-right J_tabRight">
                <i class="fa fa-forward"></i>
            </button>
            <div class="btn-group roll-nav roll-right">
                <button class="dropdown J_tabClose" data-toggle="dropdown">
                    关闭操作<span class="caret"></span>
                </button>
                <ul role="menu" class="dropdown-menu dropdown-menu-right">
                    <li class="J_tabShowActive"><a>定位当前选项卡</a></li>
                    <li class="divider"></li>
                    <li class="J_tabCloseAll"><a>关闭全部选项卡</a></li>
                    <li class="J_tabCloseOther"><a>关闭其他选项卡</a></li>
                </ul>
            </div>
            <a href="/logout" class="roll-nav roll-right J_tabExit"><i
                    class="fa fa fa-sign-out"></i> 退出</a>
        </div>
        <div class="row J_mainContent" id="content-main">
            <iframe class="J_iframe" name="iframe0" width="100%" height="100%"
                    src="" th:src="@{/main}" frameborder="0" data-id="index_v1.html"
                    seamless></iframe>
        </div>
        <div class="footer">
            <div class="pull-right">BootDo面向学习型的开源框架</div>
        </div>
    </div>
    <!--右侧部分结束-->
    <!--右侧边栏开始-->
    <div id="right-sidebar">
        <div class="sidebar-container">
            <ul class="nav nav-tabs navs-3">

                <li class="active"><a data-toggle="tab" href="#tab-1"> <i
                        class="fa fa-gear"></i> 主题
                </a></li>
                <li class=""><a data-toggle="tab" href="#tab-2"> 通知 </a></li>
                <li><a data-toggle="tab" href="#tab-3"> 项目进度 </a></li>
            </ul>
            <div class="tab-content">
                <div id="tab-1" class="tab-pane active">
                    <div class="sidebar-title">
                        <h3>
                            <i class="fa fa-comments-o"></i> 主题设置
                        </h3>
                        <small><i class="fa fa-tim"></i>
                            你可以从这里选择和预览主题的布局和样式，这些设置会被保存在本地，下次打开的时候会直接应用这些设置。
                        </small>
                    </div>
                    <div class="skin-setttings">
                        <div class="title">主题设置</div>
                        <div class="setings-item">
                            <span>收起左侧菜单</span>
                            <div class="switch">
                                <div class="onoffswitch">
                                    <input type="checkbox" name="collapsemenu"
                                           class="onoffswitch-checkbox" id="collapsemenu"> <label
                                        class="onoffswitch-label" for="collapsemenu"> <span
                                        class="onoffswitch-inner"></span> <span
                                        class="onoffswitch-switch"></span>
                                </label>
                                </div>
                            </div>
                        </div>
                        <div class="setings-item">
                            <span>固定顶部</span>

                            <div class="switch">
                                <div class="onoffswitch">
                                    <input type="checkbox" name="fixednavbar"
                                           class="onoffswitch-checkbox" id="fixednavbar"> <label
                                        class="onoffswitch-label" for="fixednavbar"> <span
                                        class="onoffswitch-inner"></span> <span
                                        class="onoffswitch-switch"></span>
                                </label>
                                </div>
                            </div>
                        </div>
                        <div class="setings-item">
                            <span> 固定宽度 </span>
                            <div class="switch">
                                <div class="onoffswitch">
                                    <input type="checkbox" name="boxedlayout"
                                           class="onoffswitch-checkbox" id="boxedlayout"> <label
                                        class="onoffswitch-label" for="boxedlayout"> <span
                                        class="onoffswitch-inner"></span> <span
                                        class="onoffswitch-switch"></span>
                                </label>
                                </div>
                            </div>
                        </div>
                        <div class="title">皮肤选择</div>
                        <div class="setings-item default-skin nb">
								<span class="skin-name "> <a href="#" class="s-skin-0">
										默认皮肤 </a>
								</span>
                        </div>
                        <div class="setings-item blue-skin nb">
								<span class="skin-name "> <a href="#" class="s-skin-1">
										蓝色主题 </a>
								</span>
                        </div>
                        <div class="setings-item yellow-skin nb">
								<span class="skin-name "> <a href="#" class="s-skin-3">
										黄色/紫色主题 </a>
								</span>
                        </div>
                    </div>
                </div>
                <div id="tab-2" class="tab-pane">

                    <div class="sidebar-title">
                        <h3>
                            <i class="fa fa-comments-o"></i> 最新通知
                        </h3>
                        <small><i class="fa fa-tim"></i> 您当前有10条未读信息</small>
                    </div>
                </div>
                <div id="tab-3" class="tab-pane">

                    <div class="sidebar-title">
                        <h3>
                            <i class="fa fa-cube"></i> 最新任务
                        </h3>
                        <small><i class="fa fa-tim"></i> 您当前有14个任务，10个已完成</small>
                    </div>
                </div>
            </div>

        </div>
    </div>
</div>
<!-- 全局js -->
<script src="https://cdn.bootcss.com/jquery/1.11.1/jquery.min.js"></script>
<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/bootstrap-table/1.11.1/bootstrap-table.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/bootstrap-table/1.11.1/locale/bootstrap-table-zh-CN.min.js"></script>
<!--
<script src="${base}/static/js/jquery.min.js?v=2.1.4"></script>
<script src="${base}/static/js/bootstrap.min.js?v=3.3.6"></script>
-->
<script src="${base}/static/js/plugins/metisMenu/jquery.metisMenu.js"></script>
<script src="${base}/static/js/plugins/slimscroll/jquery.slimscroll.min.js"></script>
<script src="${base}/static/js/plugins/layer/layer.min.js"></script>
<!-- 自定义js -->
<script src="${base}/static/js/app.js?v=4.1.0"></script>
<script type="text/javascript" src="${base}/static/js/contabs.js"></script>
<!-- 第三方插件 -->
<script src="${base}/static/js/plugins/pace/pace.min.js"></script>
<!-- vue -->
<script type="text/javascript"
        src="${base}/static/js/vue.min.js">

</script>
<script src="${base}/static/js/appjs/oa/webSocket/sockjs.min.js"></script>
<script src="${base}/static/js/appjs/oa/webSocket/stomp.min.js"></script>
<!-- Toastr script -->
<script src="${base}/static/js/plugins/toastr/toastr.min.js"></script>
<script type="text/javascript">
    var stompClient = null;
    $(function () {
        connect();
    });

    function connect() {
        var sock = new SockJS("/endpointChat");
        var stomp = Stomp.over(sock);
        stomp.connect('guest', 'guest', function(frame) {

            /**  订阅了/user/queue/notifications 发送的消息,这里雨在控制器的 convertAndSendToUser 定义的地址保持一致, 
             *  这里多用了一个/user,并且这个user 是必须的,使用user 才会发送消息到指定的用户。 
             *  */
            stomp.subscribe("/user/queue/notifications", handleNotification);
            stomp.subscribe('/topic/getResponse', function (response) { //订阅/topic/getResponse 目标发送的消息。这个是在控制器的@SendTo中定义的。
                toastr.options = {
                    "closeButton": true,
                    "debug": false,
                    "progressBar": true,
                    "positionClass": "toast-bottom-right",
                    "onclick": null,
                    "showDuration": "400",
                    "hideDuration": "1000",
                    "timeOut": "7000",
                    "extendedTimeOut": "1000",
                    "showEasing": "swing",
                    "hideEasing": "linear",
                    "showMethod": "fadeIn",
                    "hideMethod": "fadeOut"
                }
                toastr.info(JSON.parse(response.body).responseMessage);
            });
        });
        function handleNotification(message) {
            wrapper.notify();
            toastr.info(message.body);
        }
    }

    var wrapper = new Vue({
        el: '#wrapper',
        data: {
            total: '',
            rows: '',
        },
        methods: {
            notify: function () {
                $.getJSON('/oa/notify/message', function (r) {
                    wrapper.total = r.total;
                    wrapper.rows = r.rows;
                });
            },
            personal: function () {
                layer.open({
                    type: 2,
                    title: '个人设置',
                    maxmin: true,
                    shadeClose: false,
                    area: ['800px', '600px'],
                    content: '${base}/user/personal'
                });
            }
        },
        created: function () {
            this.notify()
        }
    })
</script>
</body>
</html>
