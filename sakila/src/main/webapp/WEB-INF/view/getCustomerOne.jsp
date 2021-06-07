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
     <table class="table">
         <tbody>
             <tr>
                <td>customerID :</td>
                <td>${customerOne.customerId}</td>
               </tr>
            <tr>
				<td>firstName :</td>
				<td>${customerOne.firstName}</td>
            </tr>
            <tr>
				<td>lastName :</td>
				<td>${customerOne.lastName}</td>
            </tr>
            <tr>
				<td>email :</td>
				<td>${customerOne.email}</td>
            </tr>
            <tr>
				<td>totalPayment :</td>
				<td>${customerOne.totalPayment}</td>
            </tr>
            <tr>
				<td>storeID :</td>
				<td>${customerOne.storeId}</td>
            </tr>
            <tr>
				<td>active :</td>
				<td>${customerOne.active}</td>
            </tr>
        </tbody>
    </table>
	<a class="btn btn-default" href="">수정</a>
	<a class="btn btn-default" href="">삭제</a>
	<a class="btn btn-default" href="${pageContext.request.contextPath}/admin/getCustomerList">고객목록</a>
</div>
</body>
</html>