<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>getCustomerOne</title>
<!-- bootstrap을 사용하기 위한 CDN주소 -->
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>
<div class="container">
    <h1>CustomerOne</h1>
    <!-- 고객 상세정보 테이블 -->
    <table class="table">
         <tbody>
             <tr>
                <th>customerID :</th>
                <td>${customerOne.customerId}</td>
               </tr>
            <tr>
				<th>firstName :</th>
				<td>${customerOne.firstName}</td>
            </tr>
            <tr>
				<th>lastName :</th>
				<td>${customerOne.lastName}</td>
            </tr>
            <tr>
				<th>email :</th>
				<td>${customerOne.email}</td>
            </tr>
            <tr>
				<th>totalPayment :</th>
				<td>$${customerOne.totalPayment}</td>
            </tr>
            <tr>
				<th>storeID :</th>
				<td>${customerOne.storeId}</td>
            </tr>
            <tr>
				<th>active :</th>
				<td>${customerOne.active}</td>
            </tr>
        </tbody>
    </table>
    
    <!-- 고객 대여리스트 테이블 -->
    <h2>RentalList</h2>
    <table class="table">
    	<thead>
    		<tr>
    			<th>filmID</th>
    			<th>title</th>
    			<th>rentalID</th>
    			<th>rentalDate</th>
    			<th>returnDate</th>
    			<th>storeID</th>
    		</tr>
    	</thead>
    	<tbody>
    		<c:forEach var="r" items="${rentalList}">
	    		<tr>	
	    			<td>${r.filmId}</td>
	    			<td><a href="${pageContext.request.contextPath}/admin/getFilmOne?filmId=${r.filmId}">${r.title}</a></td>
	    			<td>${r.rentalId}</td>
	    			<td>${r.rentalDate}</td>
	    			<td>${r.returnDate}</td>
	    			<td>${r.storeId}</td>
	    		</tr>
    		</c:forEach>
    	</tbody>
    </table>
    
    <!-- 고객 대여리스트 페이징 -->
    <ul class="pager">
    	<c:if test="${currentPage > 1}">
    		<li class="previous"><a href="${pageContext.request.contextPath}/admin/getCustomerOne?customerId=${customerOne.customerId}&currentPage=${currentPage-1}">이전</a></li>
    	</c:if>
    	<c:if test="${currentPage > lastPage}">
    		<li class="next"><a href="${pageContext.request.contextPath}/admin/getCustomerOne?customerId=${customerOne.customerId}&currentPage=${currentPage+1}">다음</a></li>
    	</c:if>
    </ul>
	<a class="btn btn-default" href="">수정</a>
	<a class="btn btn-default" href="">삭제</a>
	<a class="btn btn-default" href="${pageContext.request.contextPath}/admin/getCustomerList">고객목록</a>
</div>
</body>
</html>