<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width,initial-scale=1">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!-- Favicon icon -->
<link rel="icon" type="image/png" sizes="16x16" href="${pageContext.request.contextPath}/images/favicon.png">
<!-- Pignose Calender -->
<link href="${pageContext.request.contextPath}/plugins/pg-calendar/css/pignose.calendar.min.css" rel="stylesheet">
<!-- Chartist -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/chartist/css/chartist.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/chartist-plugin-tooltips/css/chartist-plugin-tooltip.css">
<!-- Custom Stylesheet -->
<link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet">
<script>
$(document).ready(function(){
	console.log('ready...');
	$('#btn').click(function(){
		console.log('click....');
		$('#loginForm').submit();
	});
	
	// RestController 사용
	// 베스트셀러
	console.log('bestSeller');
	$.ajax({
			type:'get',
			url:'${pageContext.request.contextPath}/getBestSeller',
			success: function(jsonData) {
				$(jsonData).each(function(index, item){
					$('#bestSeller').append(
						'<tr><td>'+item.filmId+'</td><td><a href=${pageContext.request.contextPath}/admin/getFilmOne?filmId="'+item.filmId+'">'+item.title+'</td><td>'+item.rentalRate+'</td><td>'+item.cnt+'</td></tr>'
					);
				});
			}
	});
	
	// 월별 매출 차트
	console.log('monthlySales');
	let month = []
	let totalSales = []
	$.ajax({
		    url:'${pageContext.request.contextPath}/monthlySalesList',
		    type:'get',
		    success:function(jsonData){
		       // json -----> data.labels, data.data
		       $(jsonData).each(function(index, item){
		    	   month.push(item.date);
		    	   totalSales.push(item.totalSales);
		       });
		       console.log(month);
		       console.log(totalSales);
			
	   			let data = {
	   			  labels: month,
	   			  datasets: [
	   			    {
	   			      label: 'Store 1',
	   			      data: totalSales,
	   			      borderColor: 'rgb(252, 108, 142)',
	   			      backgroundColor: 'rgb(255,182,193)',
	   			    },
	   			    {
	   			      label: 'Store 2',
	   			      data: totalSales,
	   			      borderColor: 'rgb(117, 113, 249)',
	   			      backgroundColor: 'rgb(255,182,193)',
	   			    }
	   			  ]
	   			};
	   			
	   			// config
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
	   			
	   			// 차트 그리는 코드
	   			var monthlySalesChart = new Chart(
	   			    document.getElementById('monthlySalesChart'),
	   			    config
	   			  );
		    
		    
		    
		    
		    }
	});
	
	
	// 카테고리별 매출 차트
	console.log('SalesByCategory');
	let category = [];
	let categorySales = [];
	$.ajax({
			type:'get',
			url:'${pageContext.request.contextPath}/categorySalesList',
			success: function(jsonData) {
				$(jsonData).each(function(index, item){
					category.push(item.category);
					categorySales.push(item.totalSales);
			    });
				console.log(category);
				console.log(categorySales);
				
				const data = {
				  labels: category,
				  datasets: [
				    {
				      label: 'Sales By Category',
				      data: categorySales,
				      backgroundColor: 'rgb(255,182,193)',
				    }
				  ]
				};
				const config = {
				  type: 'pie',
				  data: data,
				  options: {
				    responsive: true,
				    plugins: {
				      legend: {
				        position: 'top',
				      },
				      title: {
				        display: true,
				        text: 'Sales By Category Chart'
				      }
				    }
				  },
				};
				
				// 차트 그리는 코드
	   			var salesByCategoryChart = new Chart(
	   			    document.getElementById('salesByCategoryChart'),
	   			    config
	   			  );
			}
	});
	
});
</script>
<style type="text/css">
.login {
	position: relative;
    top: 150px;
}
</style>
<title>home</title>
</head>
<body>
	<!-- 로그아웃 시 or 로그인 되어 있지 않을 경우 -->
	<c:if test="${loginStaff == null}">
	<div class="login">    
	    <div class="login-form-bg h-100">
	        <div class="container h-100">
	            <div class="row justify-content-center h-100">
	                <div class="col-xl-6">
	                    <div class="form-input-content">
	                        <div class="card login-form mb-0">
	                            <div class="card-body pt-5">
	                                <a class="text-center" href="${pageContext.request.contextPath}"> <h4>Movie Rental Store</h4></a>
	        
	                                <form id="loginForm" action="${pageContext.request.contextPath}/login" method="post" class="mt-5 mb-5 login-input">
	                                    <div class="form-group">
	                                        <input type="email" class="form-control" id="email" name="email" value="guest@sakilastaff.com">
	                                    </div>
	                                    <div class="form-group">
	                                        <input type="password" class="form-control" id="password" name="password" value="1234">
	                                    </div>
	                                    <button id="btn" class="btn login-form__btn submit w-100">Sign In</button>
	                                </form>
	                            </div>
	                        </div>
	                    </div>
	                </div>
	            </div>
	        </div>
   		</div>
   	</div>
	</c:if>
	
	<!-- 로그인 시 -->
	<c:if test="${loginStaff != null}">
		<!--*******************
        Preloader start (페이지 로딩중일 때 뜨는 아이콘)
	    ********************-->
	    <div id="preloader">
	        <div class="loader">
	            <svg class="circular" viewBox="25 25 50 50">
	                <circle class="path" cx="50" cy="50" r="20" fill="none" stroke-width="3" stroke-miterlimit="10" />
	            </svg>
	        </div>
	    </div>
	    <!--*******************
	        Preloader end
	    ********************-->
		
		<!--**********************************
	        Main wrapper start
	    ***********************************-->
	    <div id="main-wrapper">
	    
	    <!--**********************************
	            Nav header start (로고 자리)
	        ***********************************-->
	    <div class="nav-header">
	        <div class="brand-logo">
	            <a href="${pageContext.request.contextPath}">
	                <b class="logo-abbr"><img src="images/logo.png" alt=""> </b>
	                <span class="logo-compact"><img src="./images/logo-compact.png" alt=""></span>
	                <span class="brand-title">
	                    <img src="images/logo-text.png" alt="">
	                </span>
	            </a>
	        </div>
	    </div>
	    <!--**********************************
	        Nav header end
	    ***********************************-->
	    
	    <!--**********************************
	            Header start
	        ***********************************-->
	    <div class="header">    
	        <div class="header-content clearfix">
	            <div class="nav-control">
	                <div class="hamburger">
	                    <span class="toggle-icon"><i class="icon-menu"></i></span>
	                </div>
	            </div>
	            
	            <div class="header-right">
	                <ul class="clearfix">
	                    <li class="icons dropdown">
	                        <div class="user-img c-pointer position-relative"   data-toggle="dropdown">
	                            <span class="activity active"></span>
	                            <img src="images/user/1.png" height="40" width="40" alt="">
	                        </div>
	                        <div class="drop-down dropdown-profile animated fadeIn dropdown-menu">
	                            <div class="dropdown-content-body">
	                                <ul>
	                                    <li><a href="${pageContext.request.contextPath}/admin/logout"><i class="icon-key"></i> <span>Logout</span></a></li>
	                                </ul>
	                            </div>
	                        </div>
	                    </li>
	                </ul>
	            </div>
	        </div>
	    </div>
	    <!--**********************************
	        Header end ti-comment-alt
	    ***********************************-->
	
		<!-- 사이드 바 메뉴 -->
		<!-- mainMenu -->
		<jsp:include page="/WEB-INF/view/inc/mainMenu.jsp"></jsp:include>
		
		<div class="content-body">
		    <div class="container-fluid mt-3">
		        <h3>Hello, ${loginStaff.username}!</h3>
		        <!-- 베스트 셀러 테이블 -->
		        <div class="row">
		        	<div class="col-lg-12">
			        	<div class="card">
	                    	<div class="card-body">
					        	<h4 class="card-title">Best Seller</h4>
						        	<div class="table-responsive">
				                    	<table class="table">
				                    		<thead>
					                            <tr>
					                                <th>filmID</th>
									                <th>title</th>
									                <th>rentalRate</th>
									                <th>number of rentals</th>
					                            </tr>
					                        </thead>
					                        <tbody id="bestSeller">
					                        </tbody>
				                    	</table>
				                    </div>
			        		</div>
			        	</div>
			        </div>
		        </div>
		        
		        <!-- 월별 매출 / 카테고리별 매출 차트 -->
		        <div class="row">
					<!-- Bar Chart -->
                    <div class="col-lg-7">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="card-title">Monthly Sales</h4>
                                <canvas id="monthlySalesChart" width="500" height="250"></canvas>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-5">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="card-title">Sales By Category</h4>
                                <canvas id="salesByCategoryChart" width="500" height="250"></canvas>
                            </div>
                        </div>
                    </div>
		        </div>
		    </div>
		    <!-- #/ container -->
		</div>
		
	    </div>
	    <!--**********************************
	        Main wrapper end
	    ***********************************-->
	    
	    <div class="footer">
	       <div class="copyright">
	           <p>Copyright &copy; Developed by <a href="https://jung-ah-c.github.io/">JungAh Choi</a> 2021</p>
	           <p>Copyright &copy; Designed by <a href="https://themeforest.net/user/quixlab">Quixlab</a> 2021</p>
	       </div>
	    </div>
	    
	</c:if>
    
<!--**********************************
       Scripts
   	***********************************-->
<script src="${pageContext.request.contextPath}/plugins/common/common.min.js"></script>
<script src="${pageContext.request.contextPath}/js/custom.min.js"></script>
<script src="${pageContext.request.contextPath}/js/settings.js"></script>
<script src="${pageContext.request.contextPath}/js/gleek.js"></script>
<script src="${pageContext.request.contextPath}/js/styleSwitcher.js"></script>

<!-- Chartjs -->
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

<!-- Circle progress -->
<script src="${pageContext.request.contextPath}/plugins/circle-progress/circle-progress.min.js"></script>
<!-- Datamap -->
<script src="${pageContext.request.contextPath}/plugins/d3v3/index.js"></script>
<script src="${pageContext.request.contextPath}/plugins/topojson/topojson.min.js"></script>
<!-- Morrisjs -->
<script src="${pageContext.request.contextPath}/plugins/raphael/raphael.min.js"></script>
<script src="${pageContext.request.contextPath}/plugins/morris/morris.min.js"></script>
<!-- Pignose Calender -->
<script src="${pageContext.request.contextPath}/plugins/moment/moment.min.js"></script>
<script src="${pageContext.request.contextPath}/plugins/pg-calendar/js/pignose.calendar.min.js"></script>
</body>
</html>