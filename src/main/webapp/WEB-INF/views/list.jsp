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
 
 <script type="text/javascript" src="${ APP_PATH }/static/js/jquery.min.js }"></script>
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
			<table class="table table-striped table-hover">
				<tr>
					<th>#</th>
					<th>EmpName</th>
					<th>Gender</th>
					<th>Email</th>
					<th>Department</th>
					<th>操作</th>
				</tr>
				<c:forEach items="${ pageInfo.list }" var="emp">
					<tr>
						<td>${emp.empId }</td>
						<td>${emp.empName }</td>
						<td>${emp.gender=="M" ? "男" : "女" }</td>
						<td>${emp.email }</td>
						<td>${emp.department.deptName }</td>
						<td>
							<button type="button" class="btn btn-primary btn-sm">
 								<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span> 编辑
							</button>
							<button type="button" class="btn btn-danger btn-sm">
 								<span class="glyphicon glyphicon-trash" aria-hidden="true"></span> 删除
							</button>
						</td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>
	<!-- 分页信息 -->
	<div class="row">
		<div class="col-md-6">
			当前${pageInfo.pageNum }页，总${pageInfo.pages }页，总${pageInfo.total }条记录
		</div>
		<div class="col-md-6 col-md-offset-6">
			<nav aria-label="...">
  				<ul class="pagination">
  					<li><a href="${APP_PATH }/emps/?pn=1">首页</a></li>
  					
    				<c:if test="${pageInfo.hasPreviousPage }">
    					<li>
    						<a href="${APP_PATH }/emps/?pn=${pageInfo.prePage }" aria-label="Previous">
    							<span>
        							<span aria-hidden="true">&laquo;</span>
      							</span>
    							</a>
	    				</li>
    				</c:if>
    				<c:forEach items="${pageInfo.navigatepageNums }" var="pageNum">
    					<c:if test="${pageNum == pageInfo.pageNum }">
    						<li class="active"><a href="#">${pageNum }</a></li>
    					</c:if>
    					<c:if test="${pageNum != pageInfo.pageNum }">
    						<li><a href="${APP_PATH }/emps/?pn=${pageNum }">${pageNum }</a></li>
    					</c:if>
    				</c:forEach>
    				<c:if test="${pageInfo.hasNextPage }">
    					<li>
    						<a href="${APP_PATH }/emps/?pn=${pageInfo.nextPage }" aria-label="Next">
    							<span>
        							<span aria-hidden="true">&raquo;</span>
      							</span>
    						</a>
    					</li>
    				</c:if>
  					<li><a href="${APP_PATH }/emps/?pn=${pageInfo.pages }">末页</a></li>
  				</ul>
			</nav>
		</div>
		
	</div>



</div>

</body>
</html>