<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- 引入jquery文件 -->
<script src="${pageContext.request.contextPath }/static/js/jquery-1.11.3.min.js"></script>

<!-- 引入bootstrap  css文件 -->
<link href="${pageContext.request.contextPath }/static/bootstrap-3.3.5-dist/css/bootstrap.min.css" rel="stylesheet">

<!-- 引入bootstrap  js文件 -->
<script src="${pageContext.request.contextPath }/static/bootstrap-3.3.5-dist/js/bootstrap.min.js" ></script>
</head>
<style>
	.spanColor{
		background-color:blue;
		color:white;
	}
	
</style>
<body>
	
	<div class="container">
		<!-- 1、logo部分 -->
		<div class="row">
			<div class="col-md-12"><h1>SSM_CRUD</h1></div>
		</div>
		<!-- 2、添加删除按钮 -->
		<div class="row">
			<div class="col-md-4 col-md-offset-8">
				<button class="btn btn-primary">添加</button>
				<button class="btn btn-danger">删除</button>
			</div>
		</div>
		<!-- 3、显示分页列表 -->
		<div class="row">
			<table class="table table-hover">
				<tr>
					<th>#</th>
					<th>empName</th>
					<th>gender</th>
					<th>Email</th>
					<th>deptName</th>
					<th>操作</th>
				</tr>
				<c:forEach items="${pageInfo.list }" var="emp">
					<tr>
						<td>${emp.empId }</td>
						<td>${emp.empName }</td>
						<td>${emp.empGender=='M'?'男':'女' }</td>
						<td>${emp.empEmail }</td>
						<td>${emp.dept.deptName }</td>
						<td>
							<button class="btn btn-primary btn btn-default btn-sm">
								<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>编辑
							</button>
							<button class="btn btn-danger btn btn-default btn-sm">
								<span class="glyphicon glyphicon-trash" aria-hidden="true"></span>删除
							</button>
						</td>
					</tr>
				</c:forEach>
			</table>
		</div>
		<!-- 4、分页条 -->
		<div class="row">
			<div class="col-md-6">
				总记录数为<span class="spanColor">${pageInfo.total }；</span>
				总页数为<span class="spanColor">${pageInfo.pages }；</span>
				当前页数为<span class="spanColor">${pageInfo.pageNum }；</span>
			</div>
			<div class="col-md-6">
				<nav aria-label="Page navigation">
				  <ul class="pagination">
				  
				  <!-- 如果当前页数等于1就不能点击首页 -->
				  <c:if test="${pageInfo.pageNum==1 }">
				 	 <li class="disabled"><a href="javascript:void(0)">首页</a></li>
				  </c:if>
				  <c:if test="${pageInfo.pageNum!=1 }">
				 	 <li ><a href="${pageContext.request.contextPath }/showEmpPageList?page=1">首页</a></li>
				  </c:if>
				  
				  <!-- 如果有上一页显示上一页的图标-->
				   <c:if test="${pageInfo.hasPreviousPage }">
				    <li >
				      <a href="${pageContext.request.contextPath }/showEmpPageList?page=${pageInfo.pageNum-1}" aria-label="Previous">
				        <span aria-hidden="true">&laquo;</span>
				      </a>
				    </li>
				  </c:if>
				  
				    <!-- 遍历页码 -->
				    <c:forEach items="${pageInfo.navigatepageNums }" var="page">
				    	<c:if test="${page == pageInfo.pageNum }">
				    		<li class="active"><a href="javascript:void(0)">${page }</a></li>
				    	</c:if>
				    	<c:if test="${page != pageInfo.pageNum }">
				    		<li ><a href="${pageContext.request.contextPath }/showEmpPageList?page=${page}">${page }</a></li>
				    	</c:if>
				    </c:forEach>
				    
				    <!-- 如果有下一页才显示下一页的图标-->
				    <c:if test="${pageInfo.hasNextPage }">
					    <li>
					      <a href="${pageContext.request.contextPath }/showEmpPageList?page=${pageInfo.pageNum+1}" aria-label="Next">
					        <span aria-hidden="true">&raquo;</span>
					      </a>
					    </li>
				    </c:if>
				    <!-- 如果尾页等于最大页数就不能点击 -->
				    <c:if test="${pageInfo.pageNum==pageInfo.pages }">
				   		<li class="disabled"><a href="javascript:void(0)">尾页</a></li>
				 	</c:if>
				 	<c:if test="${pageInfo.pageNum!=pageInfo.pages }">
				   		<li ><a href="${pageContext.request.contextPath }/showEmpPageList?page=${pageInfo.pages}">尾页</a></li>
				 	</c:if>
				  </ul>
				</nav>
			</div>
		</div>
	</div>
</body>
</html>