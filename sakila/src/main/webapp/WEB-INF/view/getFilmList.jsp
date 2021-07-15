<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width,initial-scale=1">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!-- Favicon icon -->
<link rel="icon" type="image/png" sizes="16x16" href="${pageContext.request.contextPath}/images/favicon.png">
<!-- Custom Stylesheet -->
<link href="${pageContext.request.contextPath}/plugins/tables/css/datatable/dataTables.bootstrap4.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet">
<title>getFilmList</title>
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
	            <a href="${pageContext.request.contextPath}/">
	                <b class="logo-abbr"><img src="${pageContext.request.contextPath}/images/logo.png" alt=""> </b>
	                <span class="logo-compact"><img src="${pageContext.request.contextPath}/images/logo-compact.png" alt=""></span>
	                <span class="brand-title">
	                    <img src="${pageContext.request.contextPath}/images/logo-text.png" alt="">
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
	                            <img src="${pageContext.request.contextPath}/images/user/1.png" height="40" width="40" alt="">
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
	
		<!--**********************************
            Sidebar start
        ***********************************-->
		<!-- mainMenu -->
		<jsp:include page="/WEB-INF/view/inc/mainMenu.jsp"></jsp:include>
		<!--**********************************
            Sidebar end
        ***********************************-->
		
		<!--**********************************
            Content body start
        ***********************************-->
        <div class="content-body">

            <div class="row page-titles mx-0">
                <div class="col p-md-0">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/admin/getFilmList">FilmList</a></li>
                        <li class="breadcrumb-item active"><a href="${pageContext.request.contextPath}/">Dashboard</a></li>
                    </ol>
                </div>
            </div>
            <!-- row -->
                
            <div class="container-fluid">    
                <div class="row">
                    <div class="col-12">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="card-title">Film List</h4>
                                <hr class="my-2">
                                <div align="right"><a class="btn mb-1 btn-outline-primary" href="${pageContext.request.contextPath}/admin/addFilm">영화 추가</a></div>
                                <div class="table-responsive">
                                    <table class="table table-bordered zero-configuration">
                                        <thead>
                                            <tr>
                                                <th>filmID</th>
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
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- #/ container -->
        </div>

		<!--**********************************
	       Footer
	   	***********************************-->
		
		<div class="footer">
			<div class="copyright">
			    <p>Copyright &copy; Developed by <a href="https://https://jung-ah-c.github.io/">JungAh Choi</a> 2021</p>
			    <p>Copyright &copy; Designed by <a href="https://themeforest.net/user/quixlab">Quixlab</a> 2021</p>
			</div>
		</div>
	
		<!--**********************************
		       Scripts
		   	***********************************-->
		<script src="${pageContext.request.contextPath}/plugins/common/common.min.js"></script>
		<script src="${pageContext.request.contextPath}/js/custom.min.js"></script>
		<script src="${pageContext.request.contextPath}/js/settings.js"></script>
		<script src="${pageContext.request.contextPath}/js/gleek.js"></script>
		<script src="${pageContext.request.contextPath}/js/styleSwitcher.js"></script>
		
		<script src="${pageContext.request.contextPath}/plugins/tables/js/jquery.dataTables.min.js"></script>
		<script src="${pageContext.request.contextPath}/plugins/tables/js/datatable/dataTables.bootstrap4.min.js"></script>
		<script src="${pageContext.request.contextPath}/plugins/tables/js/datatable-init/datatable-basic.min.js"></script>

	<!--**********************************
            Main wrapper end
        ***********************************-->




	<%-- <div> *** UI 적용하면서 사용하지 않는 기능 ***
		 <!-- 검색 내용 폼 -->
		<!-- 
		   1. 카테고리별
		   2. 가격별
		   3. 제목 검색
		   4. 등급별
		   5. 페이징
		   6. 배우검색
		   7. 타이틀 클릭 시 상세보기
		 -->
		<!-- 드롭다운 및 검색 폼 -->
		<form id="filmForm" action="${pageContext.request.contextPath}/admin/getFilmList" method="get">
			<!-- 카테고리 -->
			Category : 
			<select name="category">
				<option value="">카테고리 선택</option>
				<c:forEach var="c" items="${categoryNameList}">
					<!-- 카테고리 선택했을 때 -->
					<c:if test="${c.name == category}">
						<option value="${name}" selected="selected">${c.name}</option>
					</c:if>
					<!-- 카테고리 선택하지 않았을 때 -->
					<c:if test="${c.name != category}">
						<option value="${c.name}">${c.name}</option>
					</c:if>
				</c:forEach>
			</select>
			
			<!-- 가격 -->
			Price : 
			<select name="price">
				<option value="0">가격 선택</option>
				<c:if test="${price == 0.99}">
					<option value="0.99" selected="selected">0.99</option>
				</c:if>
				<c:if test="${price != 0.99}">
					<option value="0.99">0.99</option>
				</c:if>
				
				<c:if test="${price == 2.99}">
					<option value="2.99" selected="selected">2.99</option>
				</c:if>
				<c:if test="${price != 2.99}">
					<option value="2.99">2.99</option>
				</c:if>
				
				<c:if test="${price == 4.99}">
					<option value="4.99" selected="selected">4.99</option>
				</c:if>
				<c:if test="${price != 4.99}">
					<option value="4.99">4.99</option>
				</c:if>
			</select>
			
			<!-- 등급별 -->
			Rating :
			<select name="rating">
				<option value="">등급 선택</option>
				<c:if test="${rating eq 'G'}"> <!-- jstl 문자열 비교, eq -> equals, ne -> != -->
					<option value="G" selected="selected">G</option>
				</c:if>
				<c:if test="${rating ne 'G'}">
					<option value="G">G</option>
				</c:if>
				
				<c:if test="${rating eq 'PG'}">
					<option value="PG" selected="selected">PG</option>
				</c:if>
				<c:if test="${rating ne 'PG'}">
					<option value="PG">PG</option>
				</c:if>
				
				<c:if test="${rating eq 'PG-13'}">
					<option value="PG-13" selected="selected">PG-13</option>
				</c:if>
				<c:if test="${rating ne 'PG-13'}">
					<option value="PG-13">PG-13</option>
				</c:if>
				
				<c:if test="${rating eq 'R'}">
					<option value="R" selected="selected">R</option>
				</c:if>
				<c:if test="${rating ne 'R'}">
					<option value="R">R</option>
				</c:if>
				
				<c:if test="${rating eq 'NC-17'}">
					<option value="NC-17" selected="selected">NC-17</option>
				</c:if>
				<c:if test="${rating ne 'NC-17'}">
					<option value="NC-17">NC-17</option>
				</c:if>
			</select>
			
			<!-- 제목 검색 -->
			Title :
			<input type="text" name="title">
			
			<!-- 배우 검색 -->
			Actors : 
			<input type="text" name="actors">
			
			<button id="btn" type="button">검색</button>
		</form>
	</div> --%>
	
	<%-- <!-- 페이징 --> *** UI 적용으로 사용 안함 ***
	<ul class="pager">
        <c:if test="${currentPage > 1}">
            <li class="previous"><a href="${pageContext.request.contextPath}/admin/getFilmList?currentPage=${currentPage-1}&category=${category}&price=${price}&rating=${rating}&title=${title}&actors=${actors}">이전</a></li>
        </c:if>
        <c:if test="${currentPage < lastPage}">
            <li class="next"><a href="${pageContext.request.contextPath}/admin/getFilmList?currentPage=${currentPage+1}&category=${category}&price=${price}&rating=${rating}&title=${title}&actors=${actors}">다음</a></li>
        </c:if>
    </ul> --%>
</body>
</html>