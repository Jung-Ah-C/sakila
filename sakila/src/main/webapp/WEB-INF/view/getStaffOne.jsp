<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>getStaffOne</title>
<!-- bootstrap�� ����ϱ� ���� CDN�ּ� -->
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
    <h1>getStaffOne</h1>
     <table class="table">
         <tbody>
             <tr>
                <td>ID :</td>
                <td>${staffOne.ID}</td>
               </tr>
            <tr>
				<td>name :</td>
				<td>${staffOne.name}</td>
            </tr>
            <tr>
				<td>address :</td>
				<td>${staffOne.address}</td>
            </tr>
            <tr>
				<td>zip code :</td>
				<td>${staffOne.zipCode}</td>
            </tr>
            <tr>
				<td>phone :</td>
				<td>${staffOne.phone}</td>
            </tr>
            <tr>
				<td>city :</td>
				<td>${staffOne.city}</td>
            </tr>
            <tr>
				<td>country :</td>
				<td>${staffOne.country}</td>
            </tr>
            <tr>
				<td>SID(Store ID) :</td>
				<td>${staffOne.SID}</td>
            </tr>
        </tbody>
    </table>
	<a class="btn btn-default" href="${pageContext.request.contextPath}/admin/getStaffList">�������</a>
</div>
</body>
</html>