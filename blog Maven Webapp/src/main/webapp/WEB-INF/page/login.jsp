<%@ page language="java" pageEncoding="utf-8" contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Gentelella Alela! | </title>

    <!-- Bootstrap -->
    <link href="${pageContext.request.contextPath}/vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="${pageContext.request.contextPath}/vendors/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet">
    <!-- NProgress -->
    <link href="${pageContext.request.contextPath}/vendors/nprogress/nprogress.css" rel="stylesheet">
    <!-- Animate.css -->
    <link href="${pageContext.request.contextPath}/vendors/animate.css/animate.min.css" rel="stylesheet">

    <!-- Custom Theme Style -->
    <link href="${pageContext.request.contextPath}/css/custom.min.css" rel="stylesheet">
  </head>

  <body class="login">
    <div>
      <a class="hiddenanchor" id="signup"></a>
      <a class="hiddenanchor" id="signin"></a>

      <div class="login_wrapper">
        <div class="animate form login_form">
          <section class="login_content">
            <form action="" method="post" id="login">
              <h1>登录</h1>
              <div>
                <input type="text" class="form-control" name="username" placeholder="用户名" required="" />
              </div>
              <div>
                <input type="password" class="form-control" name="password" placeholder="密码" required="" />
              </div>
              <div>
                <button class="btn btn-default" onclick="login()">登录</button>
                <a class="reset_pass" href="#">忘记密码?</a>
              </div>

              <div class="clearfix"></div>

              <div class="separator">
                <p class="change_link">新用户?
                  <a href="#signup" class="to_register"> 创建账号 </a>
                </p>

                <div class="clearfix"></div>
                <br />

                <div>
                  <h1><i class="fa fa-paw"></i> zjxmagic@163.com!</h1>
                  <p>©2020 保留所有权</p>
                </div>
              </div>
            </form>
          </section>
        </div>

        <div id="register" class="animate form registration_form">
          <section class="login_content">
            <form>
              <h1>创建账户</h1>
              <div>
                <input type="text" class="form-control" name="userName" value="" placeholder="用户名" required="" />
              </div>

              <div>
                <input type="password" class="form-control"  placeholder="密码" required="" />
              </div>
              <div>
                <a class="btn btn-default submit" href="#">注册</a>
              </div>

              <div class="clearfix"></div>

              <div class="separator">
                <p class="change_link">已经注册账号 ?
                  <a href="#signin" class="to_register"> 登录 </a>
                </p>

                <div class="clearfix"></div>
                <br />

                <div>
                  <h1><i class="fa fa-paw"></i> zjxmagic@163.com!</h1>
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
             alert(123)
            $n= $("#login > input[name='username']");
             console.log($n.val());
         }
    </script>
  </body>
</html>
