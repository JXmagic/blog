<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- Meta, title, CSS, favicons, etc. -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>博客信息管理</title>

<!-- Bootstrap -->
<link
	href="${pageContext.request.contextPath}/vendors/bootstrap/dist/css/bootstrap.css"
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
<script type="text/javascript"
	src="${pageContext.request.contextPath}/vendors/bootstrap-table/dist/bootstrap-table.css"></script>
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
							<li style="width: 50%;"><h3>博客类别信息管理</h3></li>
						</ul>
					</nav>
				</div>
			</div>
			<!-- /top navigation -->

			<!-- page content -->
			<div class="right_col" role="main">
				<div id="toolbar">
					<button type="button" class="btn" data-target="#myModal"
						value="modify" onclick="modify(this)">修改</button>
					<button type="button" class="btn" value="del" onclick="del()">删除</button>
				</div>
				<table id="table"></table>
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


	<!-- Modal1 -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document" style="width: 78%">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel"></h4>
				</div>
				<form class="form-horizontal" method="post" action="">
					<input type="hidden" id="id" name="id">
					<div class="modal-body">
						<div class="form-group">
							<label for="title" class="col-sm-2 control-label">标题</label>
							<div class="col-sm-9">
								<input type="text" class="form-control" id="title" name="title"
									placeholder="标题">
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
							<div class="col-sm-9">
								<div id="summernote"></div>
							</div>
						</div>

					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
						<button id="save" type="button" class="btn btn-primary" value=""
							onclick="saveBlogtype(this)">保存</button>

					</div>
				</form>
			</div>
		</div>
	</div>
	<!-- Modal2Content -->
	<div class="modal fade" id="myModalContent" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document" style="width: 78%">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel"></h4>
				</div>

				<div class="modal-body" id="modal-body-myModalContent"></div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				</div>

			</div>
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
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/vendors/bootstrap-table/dist/bootstrap-table.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/vendors/bootstrap-table/dist/locale/bootstrap-table-zh-CN.js"></script>
	<script type="text/javascript">
	
	
	
		function modify(button) {
			var a = $("#table").bootstrapTable('getSelections');
			if (a.length === 1) {
				$('#myModal').modal('show'); //删除data-toggle="modal" 手动打开模态框
				$("#typeName").val(a[0].typeName);
				$("#typeId").val(a[0].typeId);
				$("#title").val($(a[0].title).text());
				$("#id").val(a[0].id);
				content = content(a[0].id);
				$('#summernote').summernote('code', content);
	
				$("#myModal #myModalLabel").html($(button).text());
	
				$("#save").val($(button).val());
			} else if (a.length > 1) {
				window.alert("只能选一要修改的数据哦！");
			} else {
				window.alert("请选择一个要修改的数据！");
			}
		}
		//修改保存
		function saveBlogtype(th) {
			id2=$("#id").val();//主键
			title2 = $("#title").val();//标题
			typeId2 = $("#typeId").val();//博客类别id
			content2 = $('#summernote').summernote('code');//内容
			d={id:id2,title:title2,typeId:typeId2,content:content2};
			$.ajax({
			    type:"post",
			    url:"upBlog",
			    dataType:"json",
			    data:d,
			   // contentType:"application/json",
			    success:function(data){
			         if(data.status==1){
			            $('#myModal').modal('hide');//隐藏模态框
			            $("#table").bootstrapTable('refreshOptions', {}); //刷新选项
			         }
			    }
			})
		}
	
		function content(id) { //内容
			var ls;
			$.ajax({
				type : "get",
				url : "getContent?id=" + id,
				async : false, //这里选择同步为false，那么这个程序执行到这里的时候会暂停，等待
				//数据加载完成后才继续执行
				dataType : "json",
				success : function(data) {
					if (data.status == 1) {
						ls = data.data;
					}
				}
			})
			//console.log(ls)
			return ls;
		}
		//向html写入内容
		function getContent(tr, id) {
			// console.log($(tr).html())
			$("#myModalContent #myModalLabel").text($(tr).html());
			$("#modal-body-myModalContent").html(content(id));
		}
		//删除
		function del() {
			if (window.confirm("您确认要删除吗？")) {
				var a = $("#table").bootstrapTable('getSelections');
				//console.log(a)
				d = [];
				for (i = 0; i < a.length; i++) {
					d[i] = a[i].id;
				}
				//console.log(d);
				$.ajax({
					type : "post",
					url : "delBlog",
					dataType : "json",
					data : JSON.stringify(d),
					contentType : "application/json",
					success : function(data) {
						$("#table").bootstrapTable('refreshOptions', {}); //刷新选项
					}
				})
	
	
			}
		}
		$(function() {
			$("#table").bootstrapTable({
				url : 'allBlog', //请求后台的URL（*）
				method : 'get', //请求方式（*）
				toolbar : '#toolbar', //工具按钮用哪个容器
				striped : true, //是否显示行间隔色
				cache : true, //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
				datatype : 'json',
				pagination : true, //是否显示分页（*）
				sortable : false, //是否启用排序
				sortOrder : "asc", //排序方式
				sidePagination : "client", //分页方式：client客户端分页，server服务端分页（*）
				pageNumber : 1, //初始化加载第一页，默认第一页
				pageSize : 10, //每页的记录行数（*）
				pageList : [ 15, 30, 60 ], //可供选择的每页的行数（*）
				strictSearch : true,
				showColumns : true, //是否显示所有的列
				showRefresh : true, //是否显示刷新按钮
				//singleSelect: true, //开启单选,想要获取被选中的行数据必须要有该参数
				// 格式化数据
				responseHandler : function(res) {
					//如果后台返回的json格式不是{rows:[{...},{...}],total:100},可以在这块处理成这样的格式
	
					// 格式化数据
					return formatData(res);
				},
				columns : [ {
					checkbox : true
				}, {
					field : 'id',
					title : '编号',
					width : '10%'
				}, {
					field : 'title',
					title : '标题'
				}, {
					field : 'publishDate',
					title : '发布日期',
					width : '20%'
				}, {
					field : 'typeName',
					title : '博客类别',
					width : '20%'
				}, {
					field : 'typeId',
					title : '博客Id',
					width : '20%' //,
				//visible: false
				} ]
			});
	
			//超文本
			$('#summernote').summernote({
				lang : 'zh-CN', // default: 'en-US'
				minHeight : 300
			});
	            //博客所属类别
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
		})
		var formatData = function(data) {
			var l = [];
			data = data.data;
			//console.log(data)
			for (i = 0; i < data.length; i++) {
				var m = data[i];
	
				var d = {
					"id" : m.id,
					"title" : "<a href='javascript:void(0);' onclick='getContent(this," + m.id + ")' data-toggle='modal' data-target='#myModalContent' style='color:blue'>" + m.title + "</a>",
					"publishDate" : m.publishDate,
					"typeName" : m.listBlogtype[0].typeName,
					"typeId" : m.typeId
				}
				l.push(d)
			}
			return l;
		}
	</script>
</body>
</html>