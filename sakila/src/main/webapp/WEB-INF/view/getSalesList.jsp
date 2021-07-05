<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>getSalesList</title>
<!-- bootstrap을 사용하기 위한 CDN주소 -->
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<!-- 차트 사용을 위한 API -->
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script>
$(document).ready(function() {
    $('#btn').click(function() {
       console.log('btn click...');
        $('#IDForm').submit();   
     });  
});
</script>
<!-- 차트 부분 -->
<script>
// setup 부분
const DATA_COUNT = 12;
const NUMBER_CFG = {count: DATA_COUNT, min: 0, max: 15000};

const labels = Utils.months({count: 12});
const data = {
  labels: labels,
  datasets: [
    {
      label: 'Store 1',
      data: Utils.numbers(NUMBER_CFG),
      borderColor: Utils.CHART_COLORS.red,
      backgroundColor: Utils.transparentize(Utils.CHART_COLORS.red, 0.5),
    },
    {
      label: 'Store 2',
      data: Utils.numbers(NUMBER_CFG),
      borderColor: Utils.CHART_COLORS.blue,
      backgroundColor: Utils.transparentize(Utils.CHART_COLORS.blue, 0.5),
    }
  ]
};

// config 부분
const config = {
  type: 'bar',
  data: data,
  options: {
    responsive: true,
    plugins: {
      legend: {
        position: 'top',
      },
      title: {
        display: true,
        text: 'Monthly Sales Chart'
      }
    }
  },
};

// === include 'setup' then 'config' above ===
var myChart = new Chart(
	document.getElementById('myChart'),
	config
);
</script>

</head>
<body>
<!-- mainMenu -->
<jsp:include page="/WEB-INF/view/inc/mainMenu.jsp"></jsp:include>

<div class="container">
    <h1><a href="${pageContext.request.contextPath}/admin/getSalesList">SalesList</a></h1>
    <div>
	    <h2>Best Seller (Top 10)</h2>
	    <table class="table table-striped">
	        <thead>
	            <tr>
	                <th>filmID</th>
	                <th>title</th>
	                <th>rentalRate</th>
	                <th>number of rentals</th>
	            </tr>
	        </thead>
	        <tbody>
	            <c:forEach var="b" items="${bestSellerList}">
	                <tr>
	                	<td>${b.filmId}</td>
	                    <td><a href="${pageContext.request.contextPath}/admin/getFilmOne?filmId=${b.filmId}">${b.title}</a></td>
	                    <td>${b.rentalRate}</td>
	                    <td>${b.cnt}</td>
	                </tr>
	            </c:forEach>
	        </tbody>
	    </table>
    </div>
    
    <div>
		<h2>Monthly Sales By Store</h2>
		
		<div>
  			<canvas id="myChart"></canvas>
		</div>
		
		<!-- 매장별 조회 드롭다운 -->
		<form id="IDForm" action="${pageContext.request.contextPath}/admin/getSalesList" method="get">
			Store:
			<select name="storeId">
				<option value="0">선택</option>
				<c:if test="${storeId == 1}">
					<option value="1" selected="selected">1호점</option>
				</c:if>
				<c:if test="${storeId != 1}">
					<option value="1">1호점</option>
				</c:if>
				<c:if test="${storeId == 2}">
					<option value="2" selected="selected">2호점</option>
				</c:if>
				<c:if test="${storeId != 2}">
					<option value="2">2호점</option>
				</c:if>
			</select>
			<button id="btn" type="button">조회</button>
		</form>
	   
		<!-- 월별 매출액 리스트 -->
		<table class="table table-striped">
			<thead>
				<tr>
					<th>storeId</th>
					<th>store</th>
					<th>manager</th>
					<th>YEAR</th>
					<th>MONTH</th>
					<th>total Sales</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="m" items="${monthlySalesList}">
					<tr>
						<td>${m.storeId}</td>
						<td>${m.store}</td>
						<td>${m.manager}</td>
						<td>${m.YEAR}</td>
						<td>${m.MONTH}</td>
						<td>${m.totalSales}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		
		<!-- 카테고리별 매출 -->
		<h2>Sales By Category</h2>
		<table class="table table-striped">
			<thead>
				<tr>
					<th>categoryName</th>
					<th>total Sales</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="c" items="${categorySalesList}">
					<tr>
						<td>${c.category}</td>
						<td>${c.totalSales}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</div>
</body>
</html>