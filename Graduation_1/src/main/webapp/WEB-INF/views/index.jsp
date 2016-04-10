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
<div class="modal fade bs-example-modal-lg" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
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
                          <label for="inputPassword2" class="sr-only">好友ID或电话号码</label>
                           <input type="text" class="form-control" id="inputPassword2" placeholder="好友ID或电话号码">
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
		</div></a>
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
					<li class="active"><a href="#"
						onclick="_hmt.push(['_trackEvent', 'docv3-navbar', 'click', 'V3导航-起步'])">云分享</a>
					</li>
					<li><a href="notes"
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
        <h1>漫步云端</h1>
        <p>一起与好友分享视频，音频吧！ueditor</p>
      </div>
    </div>
<div class="container">
    
    <ul class="nav nav-tabs">
       <li role="presentation"  class="active"><a href="#">视频</a></li>
       <li role="presentation" ><a href="index.jsp">音乐</a></li>
        <li role="presentation" ><a href="index.jsp">文档</a></li>
         <li role="presentation" ><a href="index.jsp">图片</a></li>
          <li role="presentation" ><a href="index.jsp">种子</a></li>
           <li role="presentation" ><a href="index.jsp">其他</a></li>
            <li role="presentation" ><a href="index.jsp">回收站</a></li>
     </ul>
    
    
    </div>
    <section class="content-wrap">
        <div class="container">
            <div class="row">

                <main class="col-md-8 main-content">
               <div> 
                         回收站应该只有个人中心有
               </div>

                     <nav class="pagination" role="navigation">
                          <span class="page-number">第 1 页 ⁄ 共 5 页</span>
                            <a class="older-posts" href="/page/2/"><i class="fa fa-angle-right"></i></a>
                     </nav>


                </main>

                <aside class="col-md-4 sidebar">
                    asasa

              </aside>

            </div>
        </div>
    </section>
   
<footer id="footer" class="">
	<div class="container">

		<div class="row">
			<div class="col-sm-12 col-md-4 center-xs left-md">
				<ul>
					<li class="credit" >© 2016 Social Cloud | bulid by</li>
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