<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> --%>
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
<body class="color_scheme-Dark">
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
				<div class="nice-title" >登录</div>
				<div class="nice-body">

					<div class="row">
						<div class="col-xs-12">
						 <div id="personResponse" style="color: red"></div>
							<form id="formforlogins" class="login form-horizontal" method="POST" action="logins">
                              
								<div class="form-group">
									<label class="col-lg-2 control-label" for="userId" >邮箱</label>
									<div class="col-lg-10">
										<input class="form-control" type="text" name="userId"
											id="userId"  placeholder="请输入邮箱..." style="width: 80%;">
									</div>
								</div>
								
								<input class="form-control" type="hidden" name="userName"
											id="userName" value="" placeholder="请输入邮箱..." style="width: 80%;">
											
							<div class="form-group">
									<label class="col-lg-2 control-label" for="password" >密码</label>
									<div class="col-lg-10">
										<input class="form-control" name="password" type="password"
											id="password" placeholder="请输入密码..." style="width: 80%;">


										<div class="m-top-xs-5 m-left-xs-5 m-bottom-xs-5">
											<a href="/reset_password" >忘记密码?</a>
										</div>

									</div>
								</div>			
											
											<input class="form-control" type="hidden" name="password1"
											id="password1" value="" placeholder="请输入邮箱..." style="width: 80%;">
											<input class="form-control" type="hidden" name="email"
											id="email" value="" placeholder="请输入邮箱..." style="width: 80%;">
											<input class="form-control" type="hidden" name="num"
											id="num" value="" placeholder="请输入邮箱..." style="width: 80%;">
											<input class="form-control" type="hidden" name="tel"
											id="tel" value="" placeholder="请输入邮箱..." style="width: 80%;">
											<input class="form-control" type="hidden" name="qq"
											id="qq" value="" placeholder="请输入邮箱..." style="width: 80%;">
											
							
								<div class="form-group">
									<div class="col-lg-10 col-lg-offset-2">
										<button type="submit" 
											class="btn btn-default btn-lg p-left-xs-40 p-right-xs-40"
											data-loading-text="loading...">登录</button>
									</div>
								</div>
							</form>
						</div>
					</div>

					<div class="row m-top-xs-20 m-bottom-xs-20">
						<div class="col-xs-12 col-sm-10 col-sm-offset-1">
							<div class="strike" style="color:#563d7c">
								<span>or</span>
							</div>
						</div>
					</div>

					<div class="row m-top-xs-20 m-bottom-xs-20">
						<div class="col-xs-12 center-xs">
							<a  style="color:#563d7c"
								href=""
								class="btn btn-default btn-lg p-left-xs-40 p-right-xs-40"><i
								class="fa fa-github m-right-xs-5"></i>Log in with GitHub</a>
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
	
	<script type="text/javascript">
	
	 $(document).ready(function() {
			console.info("1-----------")
			
			$('#formforlogins').submit(function(e) {
				console.info("2-----------")
				$.post('logins', $(this).serialize(),function(person) {
					//console.info(person)
					//alert(person)
					if(person=="true"){
						window.location.href="toindex";
					}else{
						$('#personResponse').text("用户名或密码错误");
					}
				});
				e.preventDefault(); // prevent actual form submit
			});	
		
			
		});
	
	

	</script>
</body>
</html>