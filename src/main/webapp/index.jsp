<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>员工列表</title>

<!--  web 路径问题：
	1. 不以/开始的相对路径，找资源，以当前资源路径为基准，经常容易出问题；
	2. 以/开始的相对路径，找资源，以服务器的路径为基准(http://localhost:3306): 需要加上项目项目名(ssm-curd);
 -->
 <%
 	pageContext.setAttribute("APP_PATH", request.getContextPath());
 %>
 
 <script src="${ APP_PATH }/static/js/jquery-1.12.4.js"></script>
 <link href="${ APP_PATH }/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
 <script src="${ APP_PATH }/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script> 
 
</head>
<body>
	<!-- 使用bootstrap搭建页面 -->
	<div class="container">
		<!-- 标题 -->
		<div class="row">
			<div class="col-md-12">
				<h1>SSM-CRUD</h1>
			</div>
		</div>
		<!-- 按钮 -->
		<div class="row">
			<div class="col-md-4 col-md-offset-8">
				<button type="button" class="btn btn-primary">新增</button>
				<button type="button" class="btn btn-danger">删除</button>
			</div>
		</div>
		<!-- 表格数据 -->
		<div class="row">
			<div class="col-md-12">
				<table class="table table-striped table-hover", id="emps_table">
					<thead>
						<tr>
							<th>#</th>
							<th>EmpName</th>
							<th>Gender</th>
							<th>Email</th>
							<th>Department</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody>
					
					</tbody>
				</table>
			</div>
		</div>
		<!-- 分页信息 -->
		<div class="row">
			<div class="col-md-6" id="page_info_area">
				<%-- 当前${pageInfo.pageNum }页，总${pageInfo.pages }页，总${pageInfo.total }条记录 --%>
			</div>
			<div class="col-md-6 col-md-offset-6" id="page_nav_area">
				<!-- <nav aria-label="...">
					<ul class="pagination">

					</ul>
				</nav> -->
			</div>
		</div>
	</div>
	
	<!-- 此处页面加载完成， 发送ajax请求 -->
	<script type="text/javascript">
		$(function(){
			to_page(1)
		});
		
		function to_page(pn) {
			$.ajax({
				url:"${APP_PATH}/emps",
				data:"pn=" + pn,
				type:"GET",
				success:function(result){
					
					console.log(result);
					//1. 解析并显示员工数据
					build_emps_table(result);
					//2. 解析并显示分页信息
					build_info_area(result);
					//3. 解析并显示导航信息
					build_page_nav(result);
				}
			});
		}
		
		function build_emps_table(result) {
			$("#emps_table tbody").empty();
			 
			var emps = result.extend.pageInfo.list;
			$.each(emps, function(index, item) {
				
				var empIdTd = $("<td></td>").append(item.empId);
				var empNameTd = $("<td></td>").append(item.empName);
				var genderTd = $("<td></td>").append(item.gender=='M' ? "男" : "女");
				var emailTd = $("<td></td>").append(item.email);
				var deptNameTd = $("<td></td>").append(item.department.deptName);
				var editBtn = $("<button></button>").addClass("btn btn-primary btn-sm")
								.append($("<span></span>")).addClass("glyphicon glyphicon-pencil").append("编辑");
				var deleteBtn = $("<button></button>").addClass("btn btn-danger btn-sm")
								.append($("<span></span>")).addClass("glyphicon glyphicon-trash").append("删除");
				var btnTd = $("<td></td>").append(editBtn).append(" ").append(deleteBtn);
				
				$("<tr></tr>").append(empIdTd)
					.append(empNameTd)
					.append(genderTd)
					.append(emailTd)
					.append(deptNameTd)
					.append(btnTd).appendTo("#emps_table tbody");
			});
		}

		function build_info_area(result) {
			$("#page_info_area").empty();
			$("#page_info_area").append("当前" + result.extend.pageInfo.pageNum + "页，总" + result.extend.pageInfo.pages + "页，总" + result.extend.pageInfo.total + "条记录");
		}
		

		function build_page_nav(result) {

			$("#page_nav_area").empty();
			
			var ul =  $("<ul></ul>").addClass("pagination");
			var firstPageLi = $("<li></li>").append($("<a></a>").append("首页"));
			var prePageLi = $("<li></li>").append($("<a></a>").append("&laquo;"));
			if (result.extend.pageInfo.hasPreviousPage == false) {
				firstPageLi.addClass("disabled");
				prePageLi.addClass("disabled");
			} else {
				firstPageLi.click(function(){
					to_page(1);
				});
				prePageLi.click(function(){
					to_page(result.extend.pageInfo.prePage);
				});
			}
			ul.append(firstPageLi).append(prePageLi);	
			
			

			$.each(result.extend.pageInfo.navigatepageNums, function(index, item) {
				var numLi = $("<li></li>").append($("<a></a>").append(item));
				if (item == result.extend.pageInfo.pageNum) {
					numLi.addClass("active");	
				}
				numLi.click(function(){
					to_page(item);
				});
				ul.append(numLi);
			});
			
			
			var nextPageLi = $("<li></li>").append($("<a></a>").append("&raquo;"));
			nextPageLi.click(function(){
				to_page(result.extend.pageInfo.nextPage);
			});
			var lastPageLi = $("<li></li>").append($("<a></a>").attr("href","#").append("末页"));
			if (result.extend.pageInfo.hasNextPage == false) {
				nextPageLi.addClass("disabled");
				lastPageLi.addClass("disabled");
			} else {
				lastPageLi.click(function(){
					to_page(result.extend.pageInfo.pages);
				});
			}
			ul.append(nextPageLi).append(lastPageLi);
	
			$("<nav></nav>").append(ul).appendTo("#page_nav_area");
		}
	</script>
</body>


</html>