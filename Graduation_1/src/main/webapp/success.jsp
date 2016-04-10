<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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
</head>
<body>

<div style="display: none;" id="olark">
		<olark>
		<iframe frameborder="0" id="olark-loader"></iframe></olark>
	</div>

	<div
		class="navbar navbar-default navbar-static-top navbar-large  navbar-border"
		role="navigation">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#navbar-content">
					<span class="sr-only">Toggle navigation</span> <span
						class="fa fa-bars"></span>
				</button>
				<a class="navbar-brand" href="#" style="color:#563d7c">  <span>Social Cloud</span>
				</a>
			</div>


			<div id="navbar-content"
				class="collapse navbar-collapse navbar-right">

				<ul class="nav navbar-nav navbar-left">
					<li><a href="#" class="navbar-link" style="color:#563d7c">关于社交云</a></li>
					<li><a href="#" class="navbar-link" style="color:#563d7c">更多</a></li>
				</ul>

				<ul class="nav navbar-nav">
					<li><a href="#"
						class="btn btn-success navbar-btn m-right-xs-30 m-right-sm-0">登录
							</a></li>
					<li><a href="register.jsp" style="color:#563d7c"
						class="btn btn-transparent navbar-btn m-right-xs-30 m-right-sm-0">注册
							</a></li>
				</ul>
			</div>

		</div>
	</div>


	<div class="container">
		<div class="row m-top-xs-60">
			<div
				class="nice-box col-sm-10 col-sm-offset-1 col-md-8 col-md-offset-2">
				<div class="nice-title" >注册成功</div>
				<div class="nice-body">

					<div class="row">
						<div class="col-xs-12">
						 <div id="personResponse" style="color: red"></div>
							
							 <b><span id=jump>5</span> 秒钟后页面将自动返回登录页面...</b>  
							
							
						</div>
					</div>

				</div>
			</div>
			
			
		</div>
	</div>



	<footer id="footer" class="   ">
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
<%response.setHeader("Refresh","5;URL=login.jsp");%>
      
          <script>
                      function countDown(secs){
                           jump.innerText=secs;
                           if(--secs>0)
                                    setTimeout("countDown("+secs+" )",1000);
                    }
                     countDown(5);
            </script>
 
</body>
</html>