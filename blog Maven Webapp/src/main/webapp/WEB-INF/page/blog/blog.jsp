<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
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
	href="${pageContext.request.contextPath}/vendors/font-awesome/css/font-awesome.min.css"
	rel="stylesheet">
<!-- NProgress -->
<link
	href="${pageContext.request.contextPath}/vendors/nprogress/nprogress.css"
	rel="stylesheet">
<!-- summernote -->
<link
	href="${pageContext.request.contextPath}/vendors/summernote-0.8.16-dist/summernote.css"
	rel="stylesheet">
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
						class="main_menu_side hidden-print main_menu">

						<!--  <div class="menu_section" id=menu0>
               
                <h3>General</h3>
                <ul class="nav side-menu">
                  <li><a><i class="fa fa-home"></i> Home <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                      <li><a href="index.html">Dashboard</a></li>
                      <li><a href="index2.html">Dashboard2</a></li>
                      <li><a href="index3.html">Dashboard3</a></li>
                    </ul>
                  </li>
                </ul>
              </div>
              <div class="menu_section" id=menu1>
                <h3>Live On</h3>
                <ul class="nav side-menu">
                  <li><a><i class="fa fa-sitemap"></i> Multilevel Menu <span class="fa fa-chevron-down"></span></a>
                    
                    <ul class="nav child_menu">
                        <li><a href="#level1_1">Level One</a>
                        <li><a>Level One<span class="fa fa-chevron-down"></span></a>
                         
                          <ul class="nav child_menu">
                            <li class="sub_menu"><a href="level2.html">Level Two</a>
                            </li>
                            <li><a href="#level2_1">Level Two</a>
                            </li>
                            <li><a href="#level2_2">Level Two</a>
                            </li>
                          </ul>
                        </li>
                        <li><a href="#level1_2">Level One</a>
                        </li>
                    </ul>
                  </li>                  
                
                </ul>
              </div> -->

					</div>
					<!-- /sidebar menu -->


				</div>
			</div>

			<!-- top navigation -->
			<div class="top_nav">
				<div class="nav_menu">
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
			<div class="right_col" role="main">
				<form class="form-horizontal" id="form" method="post"  role="form">
					<div class="form-group">
						<label for="title" class="col-sm-2 control-label">博客标题</label>
						<div class="col-sm-6">
							<input type="text" class="form-control" id="title" name="title"
								placeholder="博客标题">
						</div>
					</div>
					<div class="form-group">
						<label for="typeId" class="col-sm-2 control-label">所属类别</label>
						<div class="col-sm-3">
							<select class="form-control" id="typeId" name="typeId">
							     <option value="-1">请选择博客类别</option>
							</select>
						</div>
					</div>
					<div class="form-group">
						<label for="content" class="col-sm-2 control-label">博客内容</label>
						
						<div class="col-sm-10">
						    <div   id="summernote">
						        
						    </div>
						</div>
					</div>

					<div class="form-group" >
						
						<div class="col-sm-offset-2 col-sm-10" >
							<button type="button" onclick="publish()" class="btn btn-default">发布</button>
							 <p style="text-align: right;" id="msg"></p>
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
	<!-- summernote -->
	<script
		src="${pageContext.request.contextPath}/vendors/summernote-0.8.16-dist/summernote.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/vendors/summernote-0.8.16-dist/lang/summernote-zh-CN.js"></script>
	<!-- Custom Theme Scripts -->
	<script src="${pageContext.request.contextPath}/js/custom.js"></script>

	<script type="text/javascript">
		$(document).ready(function() {
		    
			$('#summernote').summernote({
				lang : 'zh-CN', // default: 'en-US'
				height : 500
				
			});
			
	        //所属类别
	        $.ajax({
	            type:"post",
	            url:"type_id",
	            dataType:"json",
	            success:function(data){
	               //console.log(data.data)
	               d = data.data;
	               for(i = 0 ; i<d.length;i++){
	                   //console.log(d[i])
	                   $("#typeId").append('<option value="'+d[i].id+'">'+d[i].typeName+'</option>')
	               }
	            }
	        })
		});
		//发布
		function publish(){
		   var markupStr = $('#summernote').summernote('code');
		   d={title:$("#title").val(),typeId:$("#typeId").val(),content:markupStr}
		   $.ajax({
		       type:"post",
		       url:"publish",
		       dataType:"json",
		       data:d,
		       success:function(data){
		          console.log(data.status)
		          $("#msg").text(data.msg);
		          if(data.status==1){
		            var markupStr = '';
                    $('#summernote').summernote('code', markupStr);
                    $('#title').val("");
                    $('#typeId').val(-1); 
		          }
		       }
		   })
		}
	</script>
</body>
</html>