<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
<body class="color_scheme-Dark">

  <div class="navbar navbar-default navbar-static-top navbar-large  navbar-border" role="navigation">
    <div class="container">
      <div class="navbar-header">
        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar-content">
          <span class="sr-only">Toggle navigation</span>
          <span class="fa fa-bars"></span>
        </button>
        <a class="navbar-brand" href="/" style="color:#563d7c">
          <!-- <img src="/static/img/wakatime-120.png"> -->
          <span>Social Cloud</span>
        </a>
      </div>

      
        <div id="navbar-content" class="collapse navbar-collapse navbar-right">
          
            <ul class="nav navbar-nav navbar-left">
					<li><a href="#" class="navbar-link" style="color:#563d7c">关于社交云</a></li>
					<li><a href="#" class="navbar-link" style="color:#563d7c">更多</a></li>
				</ul>
          
          <ul class="nav navbar-nav">
            
            <li><a href="login.jsp" class="btn btn-transparent navbar-btn m-right-xs-30 m-right-sm-0">登录</a></li>
          </ul>
        </div>
      
    </div>
  </div>


  <div class="container">
    <div class="row m-top-xs-60">
      <div class="nice-box col-sm-10 col-sm-offset-1 col-md-8 col-md-offset-2">
        <div class="nice-title">创建一个新的帐号</div>
        <div class="nice-body">

          <div class="row m-top-xs-20 m-bottom-xs-20">
            <div class="col-lg-offset-1 col-lg-10">
             <div id="checkResponse" style="color: red"></div>
             <div id="registerResponse" style="color: red"></div>
              <form  id="registerform" class="signup" method="POST" action="">
            
                <div class="form-group">
                  <label for="email" >邮箱</label>
                   <input type="email" name="userId" onmouseout="validationed();"  id="inputEmail" class="form-control" placeholder="Email address" required="" autofocus="">
                  <div id="flash-email" class="text-danger"></div>
                  
                </div>
                	<input class="form-control" type="hidden" name="userName"
											id="userName" value="" placeholder="请输入邮箱..." style="width: 80%;">
								
                <div class="form-group">
                  <label for="password">密码</label>
                  <input class="form-control" name="password" type="password"  id="password" placeholder="请输入6位密码">
                  
                </div>
                 <div class="form-group">
                  <label for="password">密码确认</label>
                  <input class="form-control" name="password1" type="password1" id="password1" placeholder="再次确认密码">
                  
                </div>
                	
											<input class="form-control" type="hidden" name="email"
											id="email" value="" placeholder="请输入邮箱..." style="width: 80%;">
											<input class="form-control" type="hidden" name="num"
											id="num" value="" placeholder="请输入邮箱..." style="width: 80%;">
											<input class="form-control" type="hidden" name="tel"
											id="tel" value="" placeholder="请输入邮箱..." style="width: 80%;">
											<input class="form-control" type="hidden" name="qq"
											id="qq" value="" placeholder="请输入邮箱..." style="width: 80%;">
											
                <div class="form-group">
                  <button id="buttons" type="submit"  disabled="disabled" class="btn btn-success btn-lg p-left-xs-40 p-right-xs-40" data-loading-text="loading...">创建帐号</button>
                </div>
              </form>
            </div>
          </div>

          <div class="row m-top-xs-20 m-bottom-xs-20">
            <div class="col-xs-12 col-sm-10 col-sm-offset-1">
              <div class="strike">
                <span>or</span>
              </div>
            </div>
          </div>

          <div class="row m-top-xs-20 m-bottom-xs-20">
            <div class="col-xs-12 center-xs">
              <a href="/oauth/github/authorize?reason=login&amp;next=%2Fdashboard" class="btn btn-default btn-lg p-left-xs-40 p-right-xs-40"><i class="fa fa-github m-right-xs-5"></i>Sign up with GitHub</a>
            </div>
          </div>

          <div class="row m-top-xs-40 m-bottom-xs-20">
            <div class="col-xs-12 center-xs">
              已经拥有帐号? <a href="login.jsp">登录</a>.
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
             <li class="credit">© 2016 Social Cloud | bulid by</li>
					<li><a href="/terms">hun</a></li>
					
              
            </ul>
          </div>
          <div class="col-sm-12 col-md-4 center-xs">
            <ul>
              <li><a href="https://github.com/wakatime"><i class="fa fa-github-square"></i></a></li>
              <li><a href="https://twitter.com/WakaTime"><i class="fa fa-twitter-square"></i></a></li>
              <li><a href="https://www.facebook.com/WakaTime"><i class="fa fa-facebook-square"></i></a></li>
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
  function validationed(){
	        var personId = $('#inputEmail').val();
	       // alert(personId+"111")
	       console.info(personId+"111")
		 $.post('check?email='+personId, $(this).serialize(),function(person) {
				//console.info(person)
				
				if(person=="true"){
					//alert(566)
					 console.info(566)
					//锁定提交按钮
					 $("#buttons").attr("disabled","disabled");
					 $('#checkResponse').text("用户已存在");
				}else{
					//alert(666)
					console.info(666)
					$("#buttons").removeAttr("disabled")
					$('#checkResponse').text("");
				}
			});

		  }
  
  $(document).ready(function() {
		console.info("1-----------")
		
		$('#registerform').submit(function(e) {
			console.info("2-----------")
			$.post('register', $(this).serialize(),function(person) {
				//console.info(person)
				//alert(person)
				if(person=="true"){
					//alert("1111")
					window.location.href="success.jsp";
				}else{
					$('#registerResponse').text("信息可能有误，请再次填写信息");
				}
			});
			e.preventDefault(); // prevent actual form submit
		});	
	
		
	});
	
	
	

  
  </script>


  </body>
</html>