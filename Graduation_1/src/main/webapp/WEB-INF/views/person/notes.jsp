<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html >
<html lang="zh-CN">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Social Cloud</title>
<link rel="stylesheet" href="bootstrap3/css/bootstrap.min.css">
<!-- 可选的Bootstrap主题文件（一般不用引入） -->
<link rel="stylesheet" href="bootstrap3/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="bootstrap3/css/docs.min.css">
<link rel="stylesheet" href="bootstrap3/css/1.css">
<link rel="stylesheet" href="bootstrap3/css/login.css">

<!--使效果更好  -->
<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="bootstrap3/js/jquery-2.2.0.min.js"></script>
<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="bootstrap3/js/bootstrap.min.js"></script>
<script src="bootstrap3/js/modelChange.js"></script>
</head>
<body class="home-template">

	<!-- *************************************通过javascript调用静态框，静态框一般放在body的子元素 -->
	<div class="modal fade bs-example-modal-lg" id="myModal" tabindex="-1"
		role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">

				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<!-- <h4 class="modal-title" id="myModalLabel">登录</h4> -->
					<ul class="nav nav-tabs">
						<li role="presentation" class="active" id="q1" name="aaa"><a
							id="#">分享文件</a></li>
						<li role="presentation" class="default" id="q2" name="bbb"><a
							id="#">好友聊天</a></li>
					</ul>
				</div>
				<div class="modal-body">
					<div class="Box_finf_friend">
						<form class="form-inline">
							<div class="form-group">
								<label class="sr-only">Email</label>
								<p class="form-control-static">查找好友</p>
							</div>
							<div class="form-group has-success">
								<label for="inputPassword2" class="sr-only">好友ID或电话号码</label> <input
									type="text" class="form-control" id="inputPassword2"
									placeholder="好友ID或电话号码">
							</div>
							<button type="submit" class="btn btn-default">查找</button>
						</form>
					</div>

				</div>


			</div>
		</div>
	</div>
	<!-- 模态框结束 -->
	<a id="skippy" class="sr-only sr-only-focusable" href="#content">
		<div class="container">
			<span class="skiplink-text">Skip to main content</span>
		</div>
	</a>
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
					<li class="active"><a href="index"
						onclick="_hmt.push(['_trackEvent', 'docv3-navbar', 'click', 'V3导航-起步'])">云分享</a>
					</li>
					<li><a href="#"
						onclick="_hmt.push(['_trackEvent', 'docv3-navbar', 'click', 'V3导航-全局CSS样式'])">云笔记</a>
					</li>
					<li><a href="javascript:openDialog();"
						onclick="_hmt.push(['_trackEvent', 'docv3-navbar', 'click', 'V3导航-JavaScript插件'])">云协作</a>
					</li>
					<li><a href="socket"
						onclick="_hmt.push(['_trackEvent', 'docv3-navbar', 'click', 'V3导航-组件'])">个人空间</a>
					</li>
					<li><a href="clouds"
						onclick="_hmt.push(['_trackEvent', 'docv3-navbar', 'click', 'V3导航-网站实例'])"
						target="_blank">个人设置</a></li>
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
	<div class="bs-docs-header" id="content" tabindex="-1">
		<div class="container">
			<div style="width: 50px; height: 50px; border: 1px solid black;">
				<a href=""><img style="width:100%;height:100%;" alt="" src="bootstrap3/image/45.png"></a>
			    <h6>记录一下生活吧！</h6>
			</div>
			
		</div>
	</div>
	<div class="container"></div>
	<section class="content-wrap">
		<div class="container">
			<div class="row">

				<main class="col-md-8 main-content">
				<div>
					<div class="bs-example">
						<div class="media">
							<a class="media-left" href="#"> <img
								data-src="holder.js/64x64" alt="64x64"
								src="data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iVVRGLTgiIHN0YW5kYWxvbmU9InllcyI/PjxzdmcgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB3aWR0aD0iNjQiIGhlaWdodD0iNjQiIHZpZXdCb3g9IjAgMCA2NCA2NCIgcHJlc2VydmVBc3BlY3RSYXRpbz0ibm9uZSI+PGRlZnMvPjxyZWN0IHdpZHRoPSI2NCIgaGVpZ2h0PSI2NCIgZmlsbD0iI0VFRUVFRSIvPjxnPjx0ZXh0IHg9IjE0LjUiIHk9IjMyIiBzdHlsZT0iZmlsbDojQUFBQUFBO2ZvbnQtd2VpZ2h0OmJvbGQ7Zm9udC1mYW1pbHk6QXJpYWwsIEhlbHZldGljYSwgT3BlbiBTYW5zLCBzYW5zLXNlcmlmLCBtb25vc3BhY2U7Zm9udC1zaXplOjEwcHQ7ZG9taW5hbnQtYmFzZWxpbmU6Y2VudHJhbCI+NjR4NjQ8L3RleHQ+PC9nPjwvc3ZnPg=="
								data-holder-rendered="true" style="width: 64px; height: 64px;">
							</a>
							<div class="media-body">
								<h4 class="media-heading">Top aligned media</h4>
								<p>Cras sit amet nibh libero, in gravida nulla. Nulla vel
									metus scelerisque ante sollicitudin commodo. Cras purus odio,
									vestibulum in vulputate at, tempus viverra turpis. Fusce
									condimentum nunc ac nisi vulputate fringilla. Donec lacinia
									congue felis in faucibus.</p>

							</div>
						</div>
						<div class="media">
							<a class="media-left media-middle" href="#"> <img
								data-src="holder.js/64x64" alt="64x64"
								src="data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iVVRGLTgiIHN0YW5kYWxvbmU9InllcyI/PjxzdmcgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB3aWR0aD0iNjQiIGhlaWdodD0iNjQiIHZpZXdCb3g9IjAgMCA2NCA2NCIgcHJlc2VydmVBc3BlY3RSYXRpbz0ibm9uZSI+PGRlZnMvPjxyZWN0IHdpZHRoPSI2NCIgaGVpZ2h0PSI2NCIgZmlsbD0iI0VFRUVFRSIvPjxnPjx0ZXh0IHg9IjE0LjUiIHk9IjMyIiBzdHlsZT0iZmlsbDojQUFBQUFBO2ZvbnQtd2VpZ2h0OmJvbGQ7Zm9udC1mYW1pbHk6QXJpYWwsIEhlbHZldGljYSwgT3BlbiBTYW5zLCBzYW5zLXNlcmlmLCBtb25vc3BhY2U7Zm9udC1zaXplOjEwcHQ7ZG9taW5hbnQtYmFzZWxpbmU6Y2VudHJhbCI+NjR4NjQ8L3RleHQ+PC9nPjwvc3ZnPg=="
								data-holder-rendered="true" style="width: 64px; height: 64px;">
							</a>
							<div class="media-body">
								<h4 class="media-heading">Middle aligned media</h4>
								<p>Cras sit amet nibh libero, in gravida nulla. Nulla vel
									metus scelerisque ante sollicitudin commodo. Cras purus odio,
									vestibulum in vulputate at, tempus viverra turpis. Fusce
									condimentum nunc ac nisi vulputate fringilla. Donec lacinia
									congue felis in faucibus.</p>
							</div>
						</div>

					</div>
				</div>

				<nav class="pagination" role="navigation">
					<span class="page-number">第 1 页 ⁄ 共 5 页</span> <a
						class="older-posts" href="/page/2/"><i
						class="fa fa-angle-right"></i></a>
				</nav>


				</main>

				<aside class="col-md-4 sidebar">
					<div class="list-group">
						<a href="#" class="list-group-item active">笔记分类 </a> <a href="#"
							class="list-group-item"> <span class="badge">14</span>Dapibus
							ac facilisis in
						</a> <a href="#" class="list-group-item"> <span class="badge">1</span>Morbi
							leo risus
						</a> <a href="#" class="list-group-item"> <span class="badge">5</span>Porta
							ac consectetur ac
						</a> <a href="#" class="list-group-item"> <span class="badge">3</span>Vestibulum
							at eros
						</a>
					</div>

				</aside>

			</div>
		</div>
	</section>

	<footer id="footer" class="">
		<div class="container">

			<div class="row">
				<div class="col-sm-12 col-md-4 center-xs left-md">
					<ul>
						<li class="credit">© 2016 Social Cloud | bulid by</li>
						<li><a href="/terms">hun</a></li>

					</ul>
				</div>
				<div class="col-sm-12 col-md-4 center-xs">
					<ul>

					</ul>
				</div>
				<div class="col-sm-12 col-md-4 center-xs right-md">
					<ul>
						<li><a href="/privacy">github</a></li>
						<li><a href="/faq">关于作者</a></li>
					</ul>
				</div>
			</div>

		</div>
	</footer>
</body>
</html>