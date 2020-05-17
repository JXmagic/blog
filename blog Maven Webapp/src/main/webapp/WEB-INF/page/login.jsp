<%@ page language="java" pageEncoding="utf-8"
	contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- Meta, title, CSS, favicons, etc. -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>个人博客</title>

<!-- Bootstrap -->
<link
	href="${pageContext.request.contextPath}/vendors/bootstrap/dist/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Font Awesome -->
<link
	href="${pageContext.request.contextPath}/vendors/font-awesome-4.7.0/css/font-awesome.min.css"
	rel="stylesheet">
<!-- NProgress -->
<link
	href="${pageContext.request.contextPath}/vendors/nprogress/nprogress.css"
	rel="stylesheet">
<!-- Animate.css -->
<link
	href="${pageContext.request.contextPath}/vendors/animate.css/animate.min.css"
	rel="stylesheet">

<!-- Custom Theme Style -->
<link href="${pageContext.request.contextPath}/css/custom.min.css"
	rel="stylesheet">
<link rel="shortcut icon" href="${pageContext.request.contextPath}/favicon.ico">	
</head>

<body class="login">
	<div>
		<a class="hiddenanchor" id="signup"></a> <a class="hiddenanchor"
			id="signin"></a>

		<div class="login_wrapper">
			<div class="animate form login_form">
				<section class="login_content">
					<form id="login">
						<h1>登录</h1>
						<div>
							<input type="text" class="form-control" id="username"
								name="username" placeholder="用户名" required="" />
						</div>
						<div>
							<input type="password" class="form-control" id="password"
								name="password" placeholder="密码" required="" />
						</div>
						 <p id="message" style="color: red"></p>
						<div>
							<a onclick="login()" class="btn btn-default">登录</a> 
							
							<a class="reset_pass" href="#">忘记密码?</a>
						</div>

						<div class="clearfix"></div>

						<div class="separator">
							<p class="change_link">
								新用户? <a href="#signup" class="to_register"> 创建账号 </a>
							</p>

							<div class="clearfix"></div>
							<br />

							<div>
								<h1>
									<i class="fa fa-paw"></i> zjxmagic@163.com!
								</h1>
								<p>©2020 保留所有权</p>
							</div>
						</div>
					</form>
				</section>
			</div>

			<div id="register" class="animate form registration_form">
				<section class="login_content">
					<form id="regist">
						<h1>创建账户</h1>
						<div>
							<input type="text" class="form-control" name="username" value=""
								placeholder="用户名" required="" />
						</div>

						<div>
							<input type="password" class="form-control" name="password" placeholder="密码"
								required="" />
						</div>
						<div>
							<a class="btn btn-default submit" onclick="register()" >注册</a>
						</div>

						<div class="clearfix"></div>

						<div class="separator">
							<p class="change_link">
								已经注册账号 ? <a href="#signin" class="to_register"> 登录 </a>
							</p>

							<div class="clearfix"></div>
							<br />

							<div>
								<h1>
									<i class="fa fa-paw"></i> zjxmagic@163.com!
								</h1>
								<p>©2020 保留所有权</p>
							</div>
						</div>
					</form>
				</section>
			</div>
		</div>
	</div>
	<!-- jQuery -->
	<script
		src="${pageContext.request.contextPath}/vendors/jquery/dist/jquery.min.js"></script>
	
	<script type="text/javascript">
       $(function(){
    
        
       })
        //登录  
         function  login(){
             //$username= $("#login :input[name='username']");
             //$password = $("#login :input[name='password']");
             //d = {username:$username.val(),password:$password.val()};
             console.log($("#login").serialize());
            d = $("#login").serialize();
              $.ajax({
                 type:"post",
                 url:"${pageContext.request.contextPath}/page/doLogin",
                 dataType: "json",
                 data: d,    
                 success:function(data){
	         	     console.log(data);
	         	     if(data.status==0){
	         	        $("#message").text(data.msg);
	         	     }else if(data.status==1){
	         	         $("#message").text("");
	         	         window.location.href="${pageContext.request.contextPath}/page/blogtype";
	         	     }
	         	     
	         	   
                 }
             }) 
         }
         
         function register(){
           
              console.log($("#regist").serialize());
             d = $("#regist").serialize();
                                
             $.ajax({
                 type:"post",
                 url:"page/register",
                 dataType: "json",
                 data:d,
                 success:function(data){
                     console.log(data)
                 }
             }) 
         }
    </script>
</body>
</html>
