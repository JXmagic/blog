<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- Meta, title, CSS, favicons, etc. -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>个人信息管理</title>

<!-- Bootstrap -->
<link
	href="${pageContext.request.contextPath}/vendors/bootstrap/dist/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Font Awesome -->
<link
	href="${pageContext.request.contextPath}/vendors/font-awesome/css/font-awesome.min.css"
	rel="stylesheet">
<!-- NProgress -->
<link
	href="${pageContext.request.contextPath}/vendors/nprogress/nprogress.css"
	rel="stylesheet">
<!-- summernote -->
<!-- Custom Theme Style -->
<link href="${pageContext.request.contextPath}/css/custom.css"
	rel="stylesheet">

<link rel="shortcut icon"
	href="${pageContext.request.contextPath}/favicon.ico">
</head>

<body class="nav-md">
	<div class="container body">
		<div class="main_container">
			<div class="col-md-3 left_col">
				<div class="left_col scroll-view">
					<div class="navbar nav_title" style="border: 0;">
						<a href="index.html" class="site_title"><i class="fa fa-paw"></i>
							<span>${user.username}的博客</span></a>
					</div>

					<div class="clearfix"></div>

					<!-- menu profile quick info -->
					<div class="profile clearfix">
						<div class="profile_pic">
							<img src="images/img.jpg" alt="..."
								class="img-circle profile_img">
						</div>
						<div class="profile_info">
							<span>欢迎,</span>
							<h2>${user.username}</h2>
						</div>
					</div>
					<!-- /menu profile quick info -->

					<br />

					<!-- sidebar menu -->
					<div id="sidebar-menu"
						class="main_menu_side hidden-print main_menu"></div>
					<!-- /sidebar menu -->


				</div>
			</div>

			<!-- top navigation -->
			<div class="top_nav" >
				<div class="nav_menu" >
					<nav>

						<ul class="nav navbar-nav navbar-right">
							<li class=""><a href="javascript:;"
								class="user-profile dropdown-toggle" data-toggle="dropdown"
								aria-expanded="false"> <img src="images/img.jpg" alt="">${user.username}
									<span class=" fa fa-angle-down"></span>
							</a>
								<ul class="dropdown-menu dropdown-usermenu pull-right">
									<li><a href="logout"><i
											class="fa fa-sign-out pull-right"></i> 退出</a></li>
								</ul></li>
						</ul>
					</nav>
					<nav>
						<ul>
							<li style="width: 50%;"><h3>写博客</h3></li>
						</ul>
					</nav>
				</div>
			</div>
			<!-- /top navigation -->

			<!-- page content -->
			<div class="right_col" role="main" >
				<form class="form-horizontal" id="form" method="post" role="form" style="margin: 120px auto;">


					<div class="form-group">
						<label for="imagName" class="col-sm-2 control-label">头像</label>
						<div class="col-sm-2">
							<input type="file" class="form-control" id="imagName"
								name="imagName" placeholder="头像">
						</div>
					</div>


					<div class="form-group">
						<label for="username" class="col-sm-2 control-label">用户名</label>
						<div class="col-sm-2">
							<input type="text" class="form-control" id="username" value="${user.username}" disabled="disabled"
								name="username" placeholder="用户名">
						</div>
					</div>
					<div class="form-group">
						<label for="nickname" class="col-sm-2 control-label">昵称</label>
						<div class="col-sm-2">
							<input type="text" class="form-control" id="nickname"
								name="nickname" placeholder="昵称">
						</div>
					</div>
					<div class="form-group">
						<label for="sign" class="col-sm-2 control-label">个性签名</label>
						<div class="col-sm-6">
							<textarea class="form-control" rows="2" id="sign" name="sign"
								placeholder="个性签名"></textarea>
						</div>
					</div>
					<div class="form-group">
						<label for="personalInformation" class="col-sm-2 control-label">个人信息</label>
						<div class="col-sm-6">
							<textarea class="form-control" rows="6" id="personalInformation"
								name="personalInformation" placeholder="个人信息"></textarea>
						</div>
					</div>

					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-10">
							<button type="button" onclick="modify()" class="btn btn-default">修改个人信息</button>
							<p style="text-align: right;color: fuchsia;" id="msg"></p>
						</div>

					</div>
				</form>
              
			</div>
			<!-- /page content -->

			<!-- footer content -->
			<footer>
				<div class="pull-right">
					Gentelella - Bootstrap Admin Template by Colorlib. More Templates <a
						href="http://www.cssmoban.com/" target="_blank" title="模板之家">模板之家</a>
					- Collect from <a href="http://www.cssmoban.com/" title="网页模板"
						target="_blank">网页模板</a>
				</div>
				<div class="clearfix"></div>
			</footer>
			<!-- /footer content -->
		</div>
	</div>



	<!-- jQuery -->
	<script
		src="${pageContext.request.contextPath}/vendors/jquery/dist/jquery.min.js"></script>
	<!-- Bootstrap -->
	<script
		src="${pageContext.request.contextPath}/vendors/bootstrap/dist/js/bootstrap.min.js"></script>
	<!-- FastClick -->
	<script
		src="${pageContext.request.contextPath}/vendors/fastclick/lib/fastclick.js"></script>
	<!-- NProgress -->
	<script
		src="${pageContext.request.contextPath}/vendors/nprogress/nprogress.js"></script>

	<!-- Custom Theme Scripts -->
	<script src="${pageContext.request.contextPath}/js/custom.js"></script>

	<script type="text/javascript">
       $.ajax({
           type:"get",
           url:"getBloggerinformation",
           dataType:"json",
           success:function(data){
              //console.log(data.data)
              $("#nickname").val(data.data.nickname);
              $("#sign").val(data.data.sign);
              $("#personalInformation").val(data.data.personalInformation);
                
           }
       })
       //修改个人信息
       function modify(){
          d={nickname:$("#nickname").val(),sign:$("#sign").val(), personalInformation:$("#personalInformation").val()}
          $.ajax({
              type:"post",
              url:"upBloggerinformation",
              dataType:"json",
              data:d,
              success:function(data){
                  console.log(data)
                  if(data.status==1){
                      $("#msg").text(data.msg);
                  } 
              }
          })
       }
	</script>
</body>
</html>