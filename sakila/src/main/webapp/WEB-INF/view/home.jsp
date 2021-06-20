<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script>
$(document).ready(function(){
	console.log('ready...');
	$('#btn').click(function(){
		console.log('click....');
		$('#loginForm').submit();
	});
});
</script>

<title>home</title>
</head>
<body>
	<h1><a href="${pageContext.request.contextPath}">Home</a></h1>
	<!-- 로그아웃 시... -->
	<c:if test="${loginStaff == null}">
		<form id="loginForm" action="${pageContext.request.contextPath}/login" method="post">
			<div>email :</div>
			<div><input type="text" id="email" name="email"></div>
			<div>password :</div>
			<div><input type="password" id="password" name="password"></div>
			<div>
				<button id="btn" type="submit">로그인</button>
			</div>
		</form>
	</c:if>
	
	<!-- 로그인 시... -->
	<c:if test="${loginStaff != null}">
		<div>Hello, ${loginStaff.username}!</div>
		<div>
			<ul>
				<li><a href="${pageContext.request.contextPath}/admin/getBoardList">BoardList</a></li>
				<li><a href="${pageContext.request.contextPath}/admin/getStaffList">StaffList</a></li>
				<li><a href="${pageContext.request.contextPath}/admin/getSalesList">SalesList</a></li>
				<li><a href="${pageContext.request.contextPath}/admin/getCustomerList">CustomerList</a></li>
				<li><a href="${pageContext.request.contextPath}/admin/getFilmList">FilmList</a></li>
				<li><a href="${pageContext.request.contextPath}/admin/getActorList">ActorList</a></li>
				<li><a href="${pageContext.request.contextPath}/admin/getInventoryList">InventoryList</a></li>
				<li><a href="${pageContext.request.contextPath}/admin/logout">Logout</a></li>
			</ul>
		</div>
	</c:if>
</body>
</html>