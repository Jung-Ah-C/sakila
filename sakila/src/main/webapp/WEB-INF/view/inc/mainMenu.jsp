<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width,initial-scale=1">
<title>MainMenu</title>
<!-- Favicon icon -->
<link rel="icon" type="image/png" sizes="16x16" href="images/favicon.png">
<!-- Pignose Calender -->
<link href="./plugins/pg-calendar/css/pignose.calendar.min.css" rel="stylesheet">
<!-- Chartist -->
<link rel="stylesheet" href="./plugins/chartist/css/chartist.min.css">
<link rel="stylesheet" href="./plugins/chartist-plugin-tooltips/css/chartist-plugin-tooltip.css">
<!-- Custom Stylesheet -->
<link href="css/style.css" rel="stylesheet">

<!-- icon -> simple-line-icons -->
<!-- bootstrap을 사용하기 위한 CDN주소 -->
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
</head>
<body>
	<!--  
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
	-->
	
	<!--**********************************
            Sidebar start
        ***********************************-->
        <div class="nk-sidebar">           
            <div class="nk-nav-scroll">
                <ul class="metismenu" id="menu">
                    <li>
                        <a href="${pageContext.request.contextPath}/" aria-expanded="false">
                            <i class="icon-speedometer menu-icon"></i><span class="nav-text">Dashboard</span>
                        </a>
                    </li>
                    
                    <li>
                        <a href="${pageContext.request.contextPath}/admin/getBoardList" aria-expanded="false">
                            <i class="icon-book-open menu-icon"></i><span class="nav-text">BoardList</span>
                        </a>
                    </li>
                    
                    <li>
                        <a href="${pageContext.request.contextPath}/admin/getStaffList" aria-expanded="false">
                            <i class="icon-user menu-icon"></i><span class="nav-text">StaffList</span>
                        </a>
                    </li>
                    
                    <li>
                        <a href="${pageContext.request.contextPath}/admin/getCustomerList" aria-expanded="false">
                            <i class="icon-user menu-icon"></i><span class="nav-text">CustomerList</span>
                        </a>
                    </li>
                    
                    <li>
                        <a href="${pageContext.request.contextPath}/admin/getFilmList" aria-expanded="false">
                            <i class="icon-film menu-icon"></i><span class="nav-text">FilmList</span>
                        </a>
                    </li>
                    
                    <li>
                        <a href="${pageContext.request.contextPath}/admin/getActorList" aria-expanded="false">
                            <i class="icon-people menu-icon"></i><span class="nav-text">ActorList</span>
                        </a>
                    </li>
                    
                    <li>
                        <a href="${pageContext.request.contextPath}/admin/getInventoryList" aria-expanded="false">
                            <i class="icon-drawer menu-icon"></i><span class="nav-text">InventoryList</span>
                        </a>
                    </li>
                    
                    <li>
                        <a href="${pageContext.request.contextPath}/admin/getSalesList" aria-expanded="false">
                            <i class="icon-graph menu-icon"></i><span class="nav-text">SalesList</span>
                        </a>
                    </li>
                   
                    <li>
                        <a href="${pageContext.request.contextPath}/admin/logout" aria-expanded="false">
                            <i class="icon-logout menu-icon"></i><span class="nav-text">Logout</span>
                        </a>
                    </li>
        		</ul>
        	</div>
        </div>
        <!--**********************************
            Sidebar end
        ***********************************-->
        
        <!--**********************************
	        Scripts
	    ***********************************-->
	    <script src="plugins/common/common.min.js"></script>
	    <script src="js/custom.min.js"></script>
	    <script src="js/settings.js"></script>
	    <script src="js/gleek.js"></script>
	    <script src="js/styleSwitcher.js"></script>
	
	    <!-- Chartjs -->
	    <script src="./plugins/chart.js/Chart.bundle.min.js"></script>
	    <!-- Circle progress -->
	    <script src="./plugins/circle-progress/circle-progress.min.js"></script>
	    <!-- Datamap -->
	    <script src="./plugins/d3v3/index.js"></script>
	    <script src="./plugins/topojson/topojson.min.js"></script>
	    <script src="./plugins/datamaps/datamaps.world.min.js"></script>
	    <!-- Morrisjs -->
	    <script src="./plugins/raphael/raphael.min.js"></script>
	    <script src="./plugins/morris/morris.min.js"></script>
	    <!-- Pignose Calender -->
	    <script src="./plugins/moment/moment.min.js"></script>
	    <script src="./plugins/pg-calendar/js/pignose.calendar.min.js"></script>
	    <!-- ChartistJS -->
	    <script src="./plugins/chartist/js/chartist.min.js"></script>
	    <script src="./plugins/chartist-plugin-tooltips/js/chartist-plugin-tooltip.min.js"></script>
	
	    <script src="./js/dashboard/dashboard-1.js"></script>
</body>
</html>