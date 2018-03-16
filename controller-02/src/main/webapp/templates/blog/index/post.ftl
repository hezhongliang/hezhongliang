<#assign base=request.contextPath />
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<title>bootdo面向学习型的开源框架</title>
<link href="${base}/static/css/bootstrap.min.css" rel="stylesheet">
<link href="${base}/static/css/blog/clean-blog.css" rel="stylesheet">
<link href="${base}/static/css/font-awesome.min.css" rel="stylesheet" type="text/css">
	<#include "../../header.ftl">
<style type="text/css">
    @media (max-width:768px){
        .side{ display:none;  }
    }
    @media (min-width:768px){
        .side{ display:block;  }
    }
    .side{
        position: fixed;
        width: 50px;
        right: 5%;
        bottom: 15%;
        z-index: 100;
    }
    .side ul{
        list-style:none;
    }
    .side ul li {
        width: 35px;
        height: 35px;
        float: left;
        position: relative;
        margin-top: 9px;
    }
    .side ul li .qqbdimg {
        padding: 7px;
        margin-top: 5px;
        margin-bottom: 1px;
        /* margin-left: 22px; */
        position: absolute;
        width: 53px;
        height: 54px;
        /* margin-left: 9px; */
        bottom: 0;
        right: -7px;
        transition: all 0.3s;
        background: #fff;
        opacity: 0;
        filter: Alpha(opacity=80);
        color: #fff;
        font: 14px/54px "微软雅黑";
        overflow: hidden;
    }
    .side ul li .qqbdimg:hover{
        overflow:hidden;
        padding: 7px;
        margin-top: 5px;
        width:124px;
        height:124px;
        opacity:1;
        z-index:100;
        right:0;
        background:rgb(142, 142, 142);
    }
    .side ul li img {
        width: 100%;
        height: 100%;
    }
    .side ul li .sidetop {
        height: 100%;
        display: block;
        background: #2f4050;
        padding: 2px 0px;
        text-align: center;
        color: #fff;
        border-radius: 50%;
        opacity: .5;
    }
    nav .intro-header{ height:369px !important;}
    .post-heading{
        position: absolute;
        top: -328px;
    }
</style>
</head>
<body>
	<nav >  <div class="container">
        <header class="intro-header"
                style="background-image: url('${base}/static/img/blog/post-bg.jpg')">
        <div class="navbar-header page-scroll">
            <button type="button" class="navbar-toggle" data-toggle="collapse"
                    data-target="#bs-example-navbar-collapse-1">
                <span class="sr-only">Toggle navigation</span> <span
                    class="icon-bar"></span> <span class="icon-bar"></span> <span
                    class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="index.html" style="font-size: 24px;">BootDo</a>
        </div>
        <div class="collapse navbar-collapse"
             id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav navbar-right">
                <li><a href="/">主页</a></li>
                <li><a href="/blog/open/page/about">关于</a></li>
                <li><a href="/blog/open/page/communication">交流</a></li>
                <li><a href="/login">登录</a></li>
            </ul>
        </div>
    </div>
	</nav>
	<!-- Page Header -->
	<div class="intro-header"
		style="background-image: url('/img/blog/post-bg.jpg')">
		<div class="container">
			<div class="row">
				<div class="col-lg-8 col-lg-offset-2 col-md-10 col-md-offset-1">
					<div class="post-heading">
						<h1 text="${bContent.title}></h1>
						<span class="meta">作者 <a href="#"
							text="${bContent.author}"></a>&nbsp;&nbsp;<a href="#"
							<#--text="${gtmModified}"-->></a>
						</span>
					</div>
				</div>
			</div>
		</div>
	</div>
	<input type="hidden" id="mycontent" value="${bContent.content}" >
	<!-- Post Content -->
	<article>
		<div class="container">
			<div class="col-sm-11">
				<div id="content" class="summernote"></div>
			</div>

		</div>
	</article>
	<hr>
<#--	<div include="blog/index/include_blog::footer"></div>-->
    <div class="container">
        <div class="row">
            <div class="col-lg-8 col-lg-offset-2 col-md-10 col-md-offset-1">
                <ul class="list-inline text-center">
                    <li><a href="https://jq.qq.com/?_wv=1027&k=5ICuFaQ"> <span
                            class="fa-stack fa-lg"> <i
                            class="fa fa-circle fa-stack-2x"></i> <i
                            class="fa fa-qq fa-stack-1x fa-inverse"></i>
							</span>
                    </a></li>
                    <li><a href="https://www.oschina.net/p/bootdo"> <span
                            class="fa-stack fa-lg"> <i
                            class="fa fa-circle fa-stack-2x"></i> <i
                            class="fa fa-home fa-stack-1x fa-inverse"></i>
							</span>
                    </a></li>
                    <li><a href="https://github.com/lcg0124/bootdo.git"> <span
                            class="fa-stack fa-lg"> <i
                            class="fa fa-circle fa-stack-2x"></i> <i
                            class="fa fa-github fa-stack-1x fa-inverse"></i>
							</span>
                    </a></li>
                </ul>
                <p class="copyright text-muted">Copyright &copy; bootdo.com
                    2017</p>
                <p class="copyright text-muted">鲁ICP备17042918号</p>

            </div>
        </div>
    </div>
    <div class="side" >
        <ul>
            <li>
                <div class="qqbdimg">
                    <img src="${base}/static/img/blog/qqbootdo.png" title="学习交流"/>
                </div>
                <a class="sidetop" id="qqbd" href="javascript:scroll(0,0)" title="学习交流"><i
                        class="fa fa-qq"></i></a>

            </li>
            <li>
                <a class="sidetop" href="javascript:scroll(0,0)" title="返回顶部"><i
                        class="fa fa-arrow-up"></i></a>

            </li>
        </ul>

    </div>
    <script src="${base}/static/js/jquery.min.js"></script>
    <script src="${base}/static/js/bootstrap.min.js"></script>
    <script src="${base}/static/js/appjs/blog/clean-blog.min.js"></script>
    <script src="${base}/static/js/plugins/summernote/summernote.min.js"></script>
    <script src="${base}/static/js/plugins/summernote/summernote-zh-CN.js"></script>

	<script type="text/javascript" inline="javascript">
		$().ready(function() {
			$('.summernote').summernote({
				lang : 'zh-CN'
			});
			var qq = $('#mycontent').val();
			$('#content').code(qq);
			$('.summernote').destroy();
		});
	</script>
</body>
</html>
