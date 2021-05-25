<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>getFilmList</title>
<!-- bootstrap을 사용하기 위한 CDN주소 -->
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
   $(document).ready(function() {
       $('#btn').click(function() {
          console.log('btn click...');
            $('#filmForm').submit();   
         });
   });
</script>
</head>
<body>
<div class="container">
	<h1>FilmList</h1>
	<div>
		<!-- 검색 내용 폼 -->
		<!-- 
		   1. 카테고리별
		   2. 가격별
		   3. 등급별
		   4. 배우 검색
		   5. 제목 검색
		   6. 페이징
		 -->
		<form id="filmForm" action="${pageContext.request.contextPath}/admin/getFilmList" method="get">
			Category : 
			<select name="categoryName">
				<option value="">카테고리 선택</option>
				<c:forEach var="name" items="${categoryNameList}">
					<!-- 카테고리 선택했을 때 -->
					<c:if test="${name == categoryName}">
						<option value="${name}" selected="selected">${name}</option>
					</c:if>
					<!-- 카테고리 선택하지 않았을 때 -->
					<c:if test="${name != categoryName}">
						<option value="${name}">${name}</option>
					</c:if>
				</c:forEach>
			</select>
			<button id="btn" type="button">검색</button>
		</form>
	</div>
	<table class="table table-striped">
		<thead>
			<tr>
				<th>FID</th>
				<th>title</th>
				<th>category</th>
				<th>price</th>
				<th>rating</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="m" items="${filmList}">
				<tr>
				   <td>${m.FID}</td>
					<td><a href="${pageContext.request.contextPath}/admin/getFilmOne?filmId=${m.FID}">${m.title}</a></td>
					<td>${m.category}</td>
					<td>${m.price}</td>
					<td>${m.rating}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>
</body>
</html>