<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- Meta, title, CSS, favicons, etc. -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>博客</title>

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

<!-- Custom Theme Style -->
<link href="${pageContext.request.contextPath}/css/custom.css"
	rel="stylesheet">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/vendors/bootstrap-table/dist/bootstrap-table.css"></script>

</head>

<body class="nav-md">
	<div class="container body">
		<div class="main_container">
			<div class="col-md-3 left_col">
				<div class="left_col scroll-view">
					<div class="navbar nav_title" style="border: 0;">
						<a href="index.html" class="site_title"><i class="fa fa-paw"></i>
							<span>张三的博客</span></a>
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
							<h2>张三</h2>
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
								aria-expanded="false"> <img src="images/img.jpg" alt="">张三
									<span class=" fa fa-angle-down"></span>
							</a>
								<ul class="dropdown-menu dropdown-usermenu pull-right">
									<li><a href="login.html"><i
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
					<button type="button" class="btn" data-toggle="modal" data-target="#myModal"
						value="add" onclick="add(this)">添加</button>
					<button type="button" class="btn"  data-target="#myModal"
						value="modify"  onclick="modify(this)">修改</button>
					<button type="button" class="btn"
						value="del" onclick="del()">删除</button>
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


	<!-- Modal -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
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
							<label for="typeName" class="col-sm-3 control-label">博客类型名称</label>
							<div class="col-sm-9">
								<input type="text" class="form-control" id="typeName" name="typeName"
									placeholder="博客类型名称">
							</div>
						</div>
						<div class="form-group">
							<label for="orderNo" class="col-sm-3 control-label">排序序号</label>
							<div class="col-sm-9">
								<input type="text" class="form-control" id="orderNo" name="orderNo"
									placeholder="排序序号">
							</div>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
						<button id="save" type="button" class="btn btn-primary"  value="" onclick="saveBlogtype(this)">保存</button>
					  
					</div>
				</form>
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

	<!-- Custom Theme Scripts -->
	<script src="${pageContext.request.contextPath}/js/custom.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/vendors/bootstrap-table/dist/bootstrap-table.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/vendors/bootstrap-table/dist/locale/bootstrap-table-zh-CN.js"></script>
	<script type="text/javascript">

		function add(button) {
		    $("#myModalLabel").html($(button).text());
			$("#save").val($(button).val());	
		}
		
		
		function modify(button) {
		    var a= $("#table").bootstrapTable('getSelections');
		    if(a.length===1){
                $('#myModal').modal('show');//删除data-toggle="modal" 手动打开模态框
		        $("#typeName").val(a[0].typeName);
		        $("#orderNo").val(a[0].orderNo);
		        $("#id").val(a[0].id);
		        $("#myModalLabel").html($(button).text());
		        $("#save").val($(button).val());
		    }else if(a.length>1) {
		        window.alert("只能选一要修改的数据哦！");
		    }else{
		        window.alert("请选择一个要修改的数据！");
		    }    
		}

	    function saveBlogtype(value){
		    $type = $(value).val();//add & modify
		    switch($type){
		        case 'add':
		             d={typeName:$("#typeName").val(), orderNo:$("#orderNo").val()}
		             $.ajax({
		                type:"post",
		                url:"addBlogtype",
		                dataType:"json",
		                data:JSON.stringify(d),
		                contentType:"application/json",
		                success:function(data){
		                  $("#table").bootstrapTable('refreshOptions', {});//刷新选项
		                  $("#myModal").modal("hide");
		                  $("#typeName").val("")
		                  $("#orderNo").val("")
		                }
		             })
		             break;
		        case 'modify':
		              d={id:$("#id").val(),typeName:$("#typeName").val(), orderNo:$("#orderNo").val() };
		              console.log(d)
		              $.ajax({
		                  type:"post",
		                  url:"updBlogtype",
		                  dataType:"json",
		                  data:JSON.stringify(d),
		                  contentType:"application/json",
		                  success:function(data){
		                     $("#table").bootstrapTable('refreshOptions', {});//刷新选项
		                     $("#myModal").modal("hide");
		                     $("#typeName").val("")
		                     $("#orderNo").val("")
		                  }
		              })
		              break;
		    }
		    
		}
		$(function() {
			$("#table").bootstrapTable({
				url : 'getAllBlogtype', //请求后台的URL（*）
				method : 'get', //请求方式（*）
				toolbar : '#toolbar', //工具按钮用哪个容器
				striped : true, //是否显示行间隔色
				cache : true, //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
				pagination : true, //是否显示分页（*）
				sortable : false, //是否启用排序
				sortOrder : "asc", //排序方式
				sidePagination : "client", //分页方式：client客户端分页，server服务端分页（*）
				pageNumber : 1, //初始化加载第一页，默认第一页
				pageSize : 10, //每页的记录行数（*）
				pageList : [ 10, 25, 50 ], //可供选择的每页的行数（*）
				strictSearch : true,
				showColumns : true, //是否显示所有的列
				showRefresh : true, //是否显示刷新按钮
				//singleSelect: true, //开启单选,想要获取被选中的行数据必须要有该参数
				columns : [ {
					checkbox : true
				}, {
					field : 'id',
					title : '编号',
					width : '10%'
				}, {
					field : 'typeName',
					title : '博客类型名称'
				}, {
					field : 'orderNo',
					title : '排序序号',
					width : '20%'
				} ]
			});
	

             
	    
		})
		
		function del(){
		    var r = window.confirm("您确定要删除？");
		    
		    if(r==true){
		        edit();
		    }
		}
		
	     function edit(){
	          var a= $("#table").bootstrapTable('getSelections');
	          //console.log(a)
	          d=[];
	          for(i = 0;i<a.length;i++){
	                d[i]=a[i].id;
	          }
	         // console.log(d);
	          $.ajax({
	         	 type:"post",
	         	 url:"delBlogtype",
	         	 dataType:"json",
	         	 data:JSON.stringify(d),
	         	 contentType: "application/json",
	         	 success:function(data){
	         	    // console.log(data);
	         	     //location.reload();
	         	     $("#table").bootstrapTable('refreshOptions', {});//刷新选项
	         	}
	         }) 
	     }
		
	</script>
</body>
</html>