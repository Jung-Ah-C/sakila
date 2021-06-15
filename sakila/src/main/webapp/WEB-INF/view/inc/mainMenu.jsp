<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>MainMenu</title>
<!-- bootstrap을 사용하기 위한 CDN주소 -->
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
</head>
<body>
	<div>
		<ul>
			<li><a href="${pageContext.request.contextPath}/">Home</a></li>
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
</body>
</html>