<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="bootstrap3/css/bootstrap.min.css">
<!-- 可选的Bootstrap主题文件（一般不用引入） -->
<link rel="stylesheet" href="bootstrap3/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="bootstrap3/css/docs.min.css">
<link rel="stylesheet" href="bootstrap3/css/1.css">


<!--使效果更好  -->
<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="bootstrap3/js/jquery-2.2.0.min.js"></script>
<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="bootstrap3/js/bootstrap.min.js"></script>
<script src="bootstrap3/js/analytics.js"></script>

</head>
<body class="home-template">

	<header class="navbar navbar-static-top bs-docs-nav" id="top"
		role="banner">
		<div class="container">
			<div class="navbar-header">
				<button class="navbar-toggle collapsed" type="button"
					data-toggle="collapse" data-target="#bs-navbar"
					aria-controls="bs-navbar" aria-expanded="false">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a href="#" class="navbar-brand">Social Cloud</a>
			</div>
			<nav id="bs-navbar" class="collapse navbar-collapse">
				<ul class="nav navbar-nav">
					<li ><a href="index.jsp"
						onclick="_hmt.push(['_trackEvent', 'docv3-navbar', 'click', 'V3导航-起步'])">社交动态</a>
					</li>
					<li><a href="persons"
						onclick="_hmt.push(['_trackEvent', 'docv3-navbar', 'click', 'V3导航-全局CSS样式'])">个人空间</a>
					</li>
					<li class="active"><a href="#"
						onclick="_hmt.push(['_trackEvent', 'docv3-navbar', 'click', 'V3导航-组件'])">聊天室</a>
					</li>
					<li><a href="../javascript/"
						onclick="_hmt.push(['_trackEvent', 'docv3-navbar', 'click', 'V3导航-JavaScript插件'])">添加好友</a>
					</li>
					<li><a href="clouds"
						onclick="_hmt.push(['_trackEvent', 'docv3-navbar', 'click', 'V3导航-网站实例'])"
						target="_blank">云空间</a></li>
				</ul>
				<form class="navbar-form navbar-left" role="search">
					<div class="form-group">
						<input type="text" class="form-control" placeholder="Search">
					</div>
					<button type="submit" class="btn docv3-navbar">Go</button>
				</form>
				<ul class="nav navbar-nav navbar-right">
					<%-- <c:choose>
						<c:when test="${!empty u2}">
							<li><a href="http://www.bootcss.com/"
								onclick="_hmt.push(['_trackEvent', 'docv3-navbar', 'click', 'V3导航-Bootstrap中文网'])"
								target="_blank">Bootstrap中文网</a></li>
								<li><a href="http://www.bootcss.com/"
						onclick="_hmt.push(['_trackEvent', 'docv3-navbar', 'click', 'V3导航-Bootstrap中文网'])"
						target="_blank">张三</a></li>
						</c:when>
						<c:otherwise>
							<li><a href="http://www.bootcss.com/"
								onclick="_hmt.push(['_trackEvent', 'docv3-navbar', 'click', 'V3导航-Bootstrap中文网'])"
								target="_blank">登录</a></li>
							<li><a href="http://www.bootcss.com/"
								onclick="_hmt.push(['_trackEvent', 'docv3-navbar', 'click', 'V3导航-Bootstrap中文网'])"
								target="_blank">注册</a></li>
						</c:otherwise>
					</c:choose> --%>
					
				</ul>
			</nav>
		</div>
	</header>
			
<div class="container">
<div class="jumbotron">
        <h1>Bootstrap Affix</h1>
    </div>
    <div class="row">
        <div class="col-xs-9" id="myScrollspy">
        <div class="Box4">
            <ul class="nav nav-tabs nav-stacked" data-spy="affix" data-offset-top="125">
              <!--   <li><a href="#section-1">第一部分</a></li>
                <li><a href="#section-2">第二部分</a></li>
                <li><a href="#section-3">第三部分</a></li>
                <li><a href="#section-4">第四部分</a></li>
                <li><a href="#section-5">第五部分</a></li> -->
            </ul>
            </div>
            <div class="Box5">
             <form class="form-search">
			<!-- <textarea name="a" style="width:650px;height:80px;">这里写内容</textarea> -->
			<textarea class="form-control" rows="3"></textarea>
			<button type="submit" class="btn btn-default">发送</button>
					</form>
            </div>
        </div>
        <div class="col-xs-3">
            <h2 id="section-1">第一部分</h2>
           
    </div>


</div>
</div>
</body>
</html>