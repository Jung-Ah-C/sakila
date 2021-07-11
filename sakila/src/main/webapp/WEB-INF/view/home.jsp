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
	                                <a class="text-center" href="index.html"> <h4>Movie Rental Store</h4></a>
	        
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
	            <a href="index.html">
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
		
		<!-- salesList 매출 차트 넣을 예정 -->
		<div class="content-body">
		    <div class="container-fluid mt-3">
		        <h3>Hello, ${loginStaff.username}!</h3>
		        <div class="row">
		            <div class="col-lg-3 col-sm-6">
		                <div class="card gradient-1">
		                    <div class="card-body">
		                        <h3 class="card-title text-white">Products Sold</h3>
		                        <div class="d-inline-block">
		                            <h2 class="text-white">4565</h2>
		                            <p class="text-white mb-0">Jan - March 2019</p>
		                        </div>
		                        <span class="float-right display-5 opacity-5"><i class="fa fa-shopping-cart"></i></span>
		                    </div>
		                </div>
		            </div>
		            <div class="col-lg-3 col-sm-6">
		                <div class="card gradient-2">
		                    <div class="card-body">
		                        <h3 class="card-title text-white">Net Profit</h3>
		                        <div class="d-inline-block">
		                            <h2 class="text-white">$ 8541</h2>
		                            <p class="text-white mb-0">Jan - March 2019</p>
		                        </div>
		                        <span class="float-right display-5 opacity-5"><i class="fa fa-money"></i></span>
		                    </div>
		                </div>
		            </div>
		            <div class="col-lg-3 col-sm-6">
		                <div class="card gradient-3">
		                    <div class="card-body">
		                        <h3 class="card-title text-white">New Customers</h3>
		                        <div class="d-inline-block">
		                            <h2 class="text-white">4565</h2>
		                            <p class="text-white mb-0">Jan - March 2019</p>
		                        </div>
		                        <span class="float-right display-5 opacity-5"><i class="fa fa-users"></i></span>
		                    </div>
		                </div>
		            </div>
		            <div class="col-lg-3 col-sm-6">
		                <div class="card gradient-4">
		                    <div class="card-body">
		                        <h3 class="card-title text-white">Customer Satisfaction</h3>
		                        <div class="d-inline-block">
		                            <h2 class="text-white">99%</h2>
		                            <p class="text-white mb-0">Jan - March 2019</p>
		                        </div>
		                        <span class="float-right display-5 opacity-5"><i class="fa fa-heart"></i></span>
		                    </div>
		                </div>
		            </div>
		        </div>
		
		        <div class="row">
		            <div class="col-lg-12">
		                <div class="row">
		                    <div class="col-12">
		                        <div class="card">
		                            <div class="card-body pb-0 d-flex justify-content-between">
		                                <div>
		                                    <h4 class="mb-1">Product Sales</h4>
		                                    <p>Total Earnings of the Month</p>
		                                    <h3 class="m-0">$ 12,555</h3>
		                                </div>
		                                <div>
		                                    <ul>
		                                        <li class="d-inline-block mr-3"><a class="text-dark" href="#">Day</a></li>
		                                        <li class="d-inline-block mr-3"><a class="text-dark" href="#">Week</a></li>
		                                        <li class="d-inline-block"><a class="text-dark" href="#">Month</a></li>
		                                    </ul>
		                                </div>
		                            </div>
		                            <div class="chart-wrapper">
		                                <canvas id="chart_widget_2"></canvas>
		                            </div>
		                            <div class="card-body">
		                                <div class="d-flex justify-content-between">
		                                    <div class="w-100 mr-2">
		                                        <h6>Pixel 2</h6>
		                                        <div class="progress" style="height: 6px">
		                                            <div class="progress-bar bg-danger" style="width: 40%"></div>
		                                        </div>
		                                    </div>
		                                    <div class="ml-2 w-100">
		                                        <h6>iPhone X</h6>
		                                        <div class="progress" style="height: 6px">
		                                            <div class="progress-bar bg-primary" style="width: 80%"></div>
		                                        </div>
		                                    </div>
		                                </div>
		                            </div>
		                        </div>
		                    </div>
		                </div>
		            </div>
		        </div>
		
		        <div class="row">
		            <div class="col-lg-6 col-md-12">
		                <div class="card">
		                    <div class="card-body">
		                        <h4 class="card-title">Order Summary</h4>
		                        <div id="morris-bar-chart"></div>
		                    </div>
		                </div>
		                
		            </div>    
		            <div class="col-lg-3 col-md-6">
		                <div class="card card-widget">
		                    <div class="card-body">
		                        <h5 class="text-muted">Order Overview </h5>
		                        <h2 class="mt-4">5680</h2>
		                        <span>Total Revenue</span>
		                        <div class="mt-4">
		                            <h4>30</h4>
		                            <h6>Online Order <span class="pull-right">30%</span></h6>
		                            <div class="progress mb-3" style="height: 7px">
		                                <div class="progress-bar bg-primary" style="width: 30%;" role="progressbar"><span class="sr-only">30% Order</span>
		                                </div>
		                            </div>
		                        </div>
		                        <div class="mt-4">
		                            <h4>50</h4>
		                            <h6 class="m-t-10 text-muted">Offline Order <span class="pull-right">50%</span></h6>
		                            <div class="progress mb-3" style="height: 7px">
		                                <div class="progress-bar bg-success" style="width: 50%;" role="progressbar"><span class="sr-only">50% Order</span>
		                                </div>
		                            </div>
		                        </div>
		                        <div class="mt-4">
		                            <h4>20</h4>
		                            <h6 class="m-t-10 text-muted">Cash On Develery <span class="pull-right">20%</span></h6>
		                            <div class="progress mb-3" style="height: 7px">
		                                <div class="progress-bar bg-warning" style="width: 20%;" role="progressbar"><span class="sr-only">20% Order</span>
		                                </div>
		                            </div>
		                        </div>
		                    </div>
		                </div>
		                
		            </div>
		            <div class="col-lg-3 col-md-6">
		                <div class="card">
		                    <div class="card-body px-0">
		                        <h4 class="card-title px-4 mb-3">Todo</h4>
		                        <div class="todo-list">
		                            <div class="tdl-holder">
		                                <div class="tdl-content">
		                                    <ul id="todo_list">
		                                        <li><label><input type="checkbox"><i></i><span>Get up</span><a href='#' class="ti-trash"></a></label></li>
		                                        <li><label><input type="checkbox" checked><i></i><span>Stand up</span><a href='#' class="ti-trash"></a></label></li>
		                                        <li><label><input type="checkbox"><i></i><span>Don't give up the fight.</span><a href='#' class="ti-trash"></a></label></li>
		                                        <li><label><input type="checkbox" checked><i></i><span>Do something else</span><a href='#' class="ti-trash"></a></label></li>
		                                    </ul>
		                                </div>
		                                <div class="px-4">
		                                    <input type="text" class="tdl-new form-control" placeholder="Write new item and hit 'Enter'...">
		                                </div>
		                            </div>
		                        </div>
		                    </div>
		                </div>
		            </div>
		        </div>
		        
		        <div class="row">
		            <div class="col-lg-3 col-sm-6">
		                <div class="card">
		                    <div class="card-body">
		                        <div class="text-center">
		                            <img src="./images/users/8.jpg" class="rounded-circle" alt="">
		                            <h5 class="mt-3 mb-1">Ana Liem</h5>
		                            <p class="m-0">Senior Manager</p>
		                            <!-- <a href="javascript:void()" class="btn btn-sm btn-warning">Send Message</a> -->
		                        </div>
		                    </div>
		                </div>
		            </div>
		            <div class="col-lg-3 col-sm-6">
		                <div class="card">
		                    <div class="card-body">
		                        <div class="text-center">
		                            <img src="./images/users/5.jpg" class="rounded-circle" alt="">
		                            <h5 class="mt-3 mb-1">John Abraham</h5>
		                            <p class="m-0">Store Manager</p>
		                            <!-- <a href="javascript:void()" class="btn btn-sm btn-warning">Send Message</a> -->
		                        </div>
		                    </div>
		                </div>
		            </div>
		            <div class="col-lg-3 col-sm-6">
		                <div class="card">
		                    <div class="card-body">
		                        <div class="text-center">
		                            <img src="./images/users/7.jpg" class="rounded-circle" alt="">
		                            <h5 class="mt-3 mb-1">John Doe</h5>
		                            <p class="m-0">Sales Man</p>
		                            <!-- <a href="javascript:void()" class="btn btn-sm btn-warning">Send Message</a> -->
		                        </div>
		                    </div>
		                </div>
		            </div>
		            <div class="col-lg-3 col-sm-6">
		                <div class="card">
		                    <div class="card-body">
		                        <div class="text-center">
		                            <img src="./images/users/1.jpg" class="rounded-circle" alt="">
		                            <h5 class="mt-3 mb-1">Mehedi Titas</h5>
		                            <p class="m-0">Online Marketer</p>
		                            <!-- <a href="javascript:void()" class="btn btn-sm btn-warning">Send Message</a> -->
		                        </div>
		                    </div>
		                </div>
		            </div>
		
		        </div>
		
		        <div class="row">
		            <div class="col-lg-12">
		                <div class="card">
		                    <div class="card-body">
		                        <div class="active-member">
		                            <div class="table-responsive">
		                                <table class="table table-xs mb-0">
		                                    <thead>
		                                        <tr>
		                                            <th>Customers</th>
		                                            <th>Product</th>
		                                            <th>Country</th>
		                                            <th>Status</th>
		                                            <th>Payment Method</th>
		                                            <th>Activity</th>
		                                        </tr>
		                                    </thead>
		                                    <tbody>
		                                        <tr>
		                                            <td><img src="./images/avatar/1.jpg" class=" rounded-circle mr-3" alt="">Sarah Smith</td>
		                                            <td>iPhone X</td>
		                                            <td>
		                                                <span>United States</span>
		                                            </td>
		                                            <td>
		                                                <div>
		                                                    <div class="progress" style="height: 6px">
		                                                        <div class="progress-bar bg-success" style="width: 50%"></div>
		                                                    </div>
		                                                </div>
		                                            </td>
		                                            <td><i class="fa fa-circle-o text-success  mr-2"></i> Paid</td>
		                                            <td>
		                                                <span>Last Login</span>
		                                                <span class="m-0 pl-3">10 sec ago</span>
		                                            </td>
		                                        </tr>
		                                        <tr>
		                                            <td><img src="./images/avatar/2.jpg" class=" rounded-circle mr-3" alt="">Walter R.</td>
		                                            <td>Pixel 2</td>
		                                            <td><span>Canada</span></td>
		                                            <td>
		                                                <div>
		                                                    <div class="progress" style="height: 6px">
		                                                        <div class="progress-bar bg-success" style="width: 50%"></div>
		                                                    </div>
		                                                </div>
		                                            </td>
		                                            <td><i class="fa fa-circle-o text-success  mr-2"></i> Paid</td>
		                                            <td>
		                                                <span>Last Login</span>
		                                                <span class="m-0 pl-3">50 sec ago</span>
		                                            </td>
		                                        </tr>
		                                        <tr>
		                                            <td><img src="./images/avatar/3.jpg" class=" rounded-circle mr-3" alt="">Andrew D.</td>
		                                            <td>OnePlus</td>
		                                            <td><span>Germany</span></td>
		                                            <td>
		                                                <div>
		                                                    <div class="progress" style="height: 6px">
		                                                        <div class="progress-bar bg-warning" style="width: 50%"></div>
		                                                    </div>
		                                                </div>
		                                            </td>
		                                            <td><i class="fa fa-circle-o text-warning  mr-2"></i> Pending</td>
		                                            <td>
		                                                <span>Last Login</span>
		                                                <span class="m-0 pl-3">10 sec ago</span>
		                                            </td>
		                                        </tr>
		                                        <tr>
		                                            <td><img src="./images/avatar/6.jpg" class=" rounded-circle mr-3" alt=""> Megan S.</td>
		                                            <td>Galaxy</td>
		                                            <td><span>Japan</span></td>
		                                            <td>
		                                                <div>
		                                                    <div class="progress" style="height: 6px">
		                                                        <div class="progress-bar bg-success" style="width: 50%"></div>
		                                                    </div>
		                                                </div>
		                                            </td>
		                                            <td><i class="fa fa-circle-o text-success  mr-2"></i> Paid</td>
		                                            <td>
		                                                <span>Last Login</span>
		                                                <span class="m-0 pl-3">10 sec ago</span>
		                                            </td>
		                                        </tr>
		                                        <tr>
		                                            <td><img src="./images/avatar/4.jpg" class=" rounded-circle mr-3" alt=""> Doris R.</td>
		                                            <td>Moto Z2</td>
		                                            <td><span>England</span></td>
		                                            <td>
		                                                <div>
		                                                    <div class="progress" style="height: 6px">
		                                                        <div class="progress-bar bg-success" style="width: 50%"></div>
		                                                    </div>
		                                                </div>
		                                            </td>
		                                            <td><i class="fa fa-circle-o text-success  mr-2"></i> Paid</td>
		                                            <td>
		                                                <span>Last Login</span>
		                                                <span class="m-0 pl-3">10 sec ago</span>
		                                            </td>
		                                        </tr>
		                                        <tr>
		                                            <td><img src="./images/avatar/5.jpg" class=" rounded-circle mr-3" alt="">Elizabeth W.</td>
		                                            <td>Notebook Asus</td>
		                                            <td><span>China</span></td>
		                                            <td>
		                                                <div>
		                                                    <div class="progress" style="height: 6px">
		                                                        <div class="progress-bar bg-warning" style="width: 50%"></div>
		                                                    </div>
		                                                </div>
		                                            </td>
		                                            <td><i class="fa fa-circle-o text-warning  mr-2"></i> Pending</td>
		                                            <td>
		                                                <span>Last Login</span>
		                                                <span class="m-0 pl-3">10 sec ago</span>
		                                            </td>
		                                        </tr>
		                                    </tbody>
		                                </table>
		                            </div>
		                        </div>
		                    </div>
		                </div>                        
		            </div>
		        </div>
		
		        <div class="row">
		            <div class="col-xl-3 col-lg-6 col-sm-6 col-xxl-6">
		
		                <div class="card">
		                    <div class="chart-wrapper mb-4">
		                        <div class="px-4 pt-4 d-flex justify-content-between">
		                            <div>
		                                <h4>Sales Activities</h4>
		                                <p>Last 6 Month</p>
		                            </div>
		                            <div>
		                                <span><i class="fa fa-caret-up text-success"></i></span>
		                                <h4 class="d-inline-block text-success">720</h4>
		                                <p class=" text-danger">+120.5(5.0%)</p>
		                            </div>
		                        </div>
		                        <div>
		                                <canvas id="chart_widget_3"></canvas>
		                        </div>
		                    </div>
		                    <div class="card-body border-top pt-4">
		                        <div class="row">
		                            <div class="col-sm-6">
		                                <ul>
		                                    <li>5% Negative Feedback</li>
		                                    <li>95% Positive Feedback</li>
		                                </ul>
		                                <div>
		                                    <h5>Customer Feedback</h5>
		                                    <h3>385749</h3>
		                                </div>
		                            </div>
		                            <div class="col-sm-6">
		                                <div id="chart_widget_3_1"></div>
		                            </div>
		                        </div>
		                    </div>
		                </div>
		            </div>
		            <div class="col-xl-3 col-lg-6 col-sm-6 col-xxl-6">
		                <div class="card">
		                    <div class="card-body">
		                        <h4 class="card-title">Activity</h4>
		                        <div id="activity">
		                            <div class="media border-bottom-1 pt-3 pb-3">
		                                <img width="35" src="./images/avatar/1.jpg" class="mr-3 rounded-circle">
		                                <div class="media-body">
		                                    <h5>Received New Order</h5>
		                                    <p class="mb-0">I shared this on my fb wall a few months back,</p>
		                                </div><span class="text-muted ">April 24, 2018</span>
		                            </div>
		                            <div class="media border-bottom-1 pt-3 pb-3">
		                                <img width="35" src="./images/avatar/2.jpg" class="mr-3 rounded-circle">
		                                <div class="media-body">
		                                    <h5>iPhone develered</h5>
		                                    <p class="mb-0">I shared this on my fb wall a few months back,</p>
		                                </div><span class="text-muted ">April 24, 2018</span>
		                            </div>
		                            <div class="media border-bottom-1 pt-3 pb-3">
		                                <img width="35" src="./images/avatar/2.jpg" class="mr-3 rounded-circle">
		                                <div class="media-body">
		                                    <h5>3 Order Pending</h5>
		                                    <p class="mb-0">I shared this on my fb wall a few months back,</p>
		                                </div><span class="text-muted ">April 24, 2018</span>
		                            </div>
		                            <div class="media border-bottom-1 pt-3 pb-3">
		                                <img width="35" src="./images/avatar/2.jpg" class="mr-3 rounded-circle">
		                                <div class="media-body">
		                                    <h5>Join new Manager</h5>
		                                    <p class="mb-0">I shared this on my fb wall a few months back,</p>
		                                </div><span class="text-muted ">April 24, 2018</span>
		                            </div>
		                            <div class="media border-bottom-1 pt-3 pb-3">
		                                <img width="35" src="./images/avatar/2.jpg" class="mr-3 rounded-circle">
		                                <div class="media-body">
		                                    <h5>Branch open 5 min Late</h5>
		                                    <p class="mb-0">I shared this on my fb wall a few months back,</p>
		                                </div><span class="text-muted ">April 24, 2018</span>
		                            </div>
		                            <div class="media border-bottom-1 pt-3 pb-3">
		                                <img width="35" src="./images/avatar/2.jpg" class="mr-3 rounded-circle">
		                                <div class="media-body">
		                                    <h5>New support ticket received</h5>
		                                    <p class="mb-0">I shared this on my fb wall a few months back,</p>
		                                </div><span class="text-muted ">April 24, 2018</span>
		                            </div>
		                            <div class="media pt-3 pb-3">
		                                <img width="35" src="./images/avatar/3.jpg" class="mr-3 rounded-circle">
		                                <div class="media-body">
		                                    <h5>Facebook Post 30 Comments</h5>
		                                    <p class="mb-0">I shared this on my fb wall a few months back,</p>
		                                </div><span class="text-muted ">April 24, 2018</span>
		                            </div>
		                        </div>
		                    </div>
		                </div>
		            </div>
		            <div class="col-xl-6 col-lg-12 col-sm-12 col-xxl-12">
		                <div class="card">
		                    <div class="card-body">
		                            <h4 class="card-title mb-0">Store Location</h4>
		                        <div id="world-map" style="height: 470px;"></div>
		                    </div>        
		                </div>
		            </div>
		        </div>
		
		        
		
		        <div class="row">
		                <div class="col-lg-3 col-sm-6">
		                    <div class="card">
		                        <div class="social-graph-wrapper widget-facebook">
		                            <span class="s-icon"><i class="fa fa-facebook"></i></span>
		                        </div>
		                        <div class="row">
		                            <div class="col-6 border-right">
		                                <div class="pt-3 pb-3 pl-0 pr-0 text-center">
		                                    <h4 class="m-1">89k</h4>
		                                    <p class="m-0">Friends</p>
		                                </div>
		                            </div>
		                            <div class="col-6">
		                                <div class="pt-3 pb-3 pl-0 pr-0 text-center">
		                                    <h4 class="m-1">119k</h4>
		                                    <p class="m-0">Followers</p>
		                                </div>
		                            </div>
		                        </div>
		                    </div>
		                </div>
		                <div class="col-lg-3 col-sm-6">
		                    <div class="card">
		                        <div class="social-graph-wrapper widget-linkedin">
		                            <span class="s-icon"><i class="fa fa-linkedin"></i></span>
		                        </div>
		                        <div class="row">
		                            <div class="col-6 border-right">
		                                <div class="pt-3 pb-3 pl-0 pr-0 text-center">
		                                    <h4 class="m-1">89k</h4>
		                                    <p class="m-0">Friends</p>
		                                </div>
		                            </div>
		                            <div class="col-6">
		                                <div class="pt-3 pb-3 pl-0 pr-0 text-center">
		                                    <h4 class="m-1">119k</h4>
		                                    <p class="m-0">Followers</p>
		                                </div>
		                            </div>
		                        </div>
		                    </div>
		                </div>
		                <div class="col-lg-3 col-sm-6">
		                    <div class="card">
		                        <div class="social-graph-wrapper widget-googleplus">
		                            <span class="s-icon"><i class="fa fa-google-plus"></i></span>
		                        </div>
		                        <div class="row">
		                            <div class="col-6 border-right">
		                                <div class="pt-3 pb-3 pl-0 pr-0 text-center">
		                                    <h4 class="m-1">89k</h4>
		                                    <p class="m-0">Friends</p>
		                                </div>
		                            </div>
		                            <div class="col-6">
		                                <div class="pt-3 pb-3 pl-0 pr-0 text-center">
		                                    <h4 class="m-1">119k</h4>
		                                    <p class="m-0">Followers</p>
		                                </div>
		                            </div>
		                        </div>
		                    </div>
		                </div>
		                <div class="col-lg-3 col-sm-6">
		                    <div class="card">
		                        <div class="social-graph-wrapper widget-twitter">
		                            <span class="s-icon"><i class="fa fa-twitter"></i></span>
		                        </div>
		                        <div class="row">
		                            <div class="col-6 border-right">
		                                <div class="pt-3 pb-3 pl-0 pr-0 text-center">
		                                    <h4 class="m-1">89k</h4>
		                                    <p class="m-0">Friends</p>
		                                </div>
		                            </div>
		                            <div class="col-6">
		                                <div class="pt-3 pb-3 pl-0 pr-0 text-center">
		                                    <h4 class="m-1">119k</h4>
		                                    <p class="m-0">Followers</p>
		                                </div>
		                            </div>
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
	           <p>Copyright &copy; Developed by <a href="https://https://jung-ah-c.github.io/">JungAh Choi</a> 2021</p>
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
<script src="${pageContext.request.contextPath}/plugins/chart.js/Chart.bundle.min.js"></script>
<!-- Circle progress -->
<script src="${pageContext.request.contextPath}/plugins/circle-progress/circle-progress.min.js"></script>
<!-- Datamap -->
<script src="${pageContext.request.contextPath}/plugins/d3v3/index.js"></script>
<script src="${pageContext.request.contextPath}/plugins/topojson/topojson.min.js"></script>
<script src="${pageContext.request.contextPath}/plugins/datamaps/datamaps.world.min.js"></script>
<!-- Morrisjs -->
<script src="${pageContext.request.contextPath}/plugins/raphael/raphael.min.js"></script>
<script src="${pageContext.request.contextPath}/plugins/morris/morris.min.js"></script>
<!-- Pignose Calender -->
<script src="${pageContext.request.contextPath}/plugins/moment/moment.min.js"></script>
<script src="${pageContext.request.contextPath}/plugins/pg-calendar/js/pignose.calendar.min.js"></script>
<!-- ChartistJS -->
<script src="${pageContext.request.contextPath}/plugins/chartist/js/chartist.min.js"></script>
<script src="${pageContext.request.contextPath}/plugins/chartist-plugin-tooltips/js/chartist-plugin-tooltip.min.js"></script>

<script src="${pageContext.request.contextPath}/js/dashboard/dashboard-1.js"></script>
</body>
</html>