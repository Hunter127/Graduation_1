<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="bootstrap3/js/jquery-2.2.0.min.js"></script>
</head>
<body>
<form id="formforlogins1" class="login form-horizontal" method="POST" action="">
                              
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
							
<script type="text/javascript">
	
	 $(document).ready(function() {
			console.info("1-----------")
			
			$('#formforlogins1').submit(function(e) {
				console.info("2-----------")
				$.post('logins', $(this).serialize(),function(person) {
					if(person){
						window.location.href="toindex";
					}else{
						$('#personResponse1').text("用户名或密码错误");
					}
				});
				e.preventDefault(); // prevent actual form submit
			});	
		
			
		});
	
	

	</script>
</body>
</html>