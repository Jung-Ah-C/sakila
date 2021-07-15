<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet">
<title>modifyBoard</title>
<!-- jquery를 사용하기위한 CDN주소 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script>
	$(document).ready(function(){
		// 폼 유효성 검사
		$('#btn').click(function() { // submit 버튼을 클릭했을 때, 채워지지 않은 부분이 있으면 alert
			// 체크박스 몇개 선택됐는지 확인
			var cnt = $("input[name=film.specialFeatures]:checkbox:checked").length;
			console.log(cnt);
			if($('#title').val() == ''){
				alert('FilmTitle을 입력하세요.');
				$('#title').focus();
			} else if($('#category').val() == '') {
				alert('category를 선택하세요.');
				$('#category').focus();
			} else if($('#description').val() == '') {
				alert('description을 입력하세요.');
				$('#description').focus();
			} else if($('#releaseYear').val() == '') {
				alert('releaseYear을 입력하세요.');
				$('#releaseYear').focus();
			} else if($('#language').val() == '') {
				alert('language를 선택하세요.');
				$('#language').focus();
			} else if($('#originalLanguage').val() == '') {
				alert('originalLanguage을 입력하세요.');
				$('#originalLanguage').focus();
			} else if($('#rentalDuration').val() == '') {
				alert('rentalDuration을 입력하세요.');
				$('#rentalDuration').focus();
			} else if($('#rentalRate').val() == '') {
				alert('rentalRate를 입력하세요.');
				$('#rentalRate').focus();
			} else if($('#length').val() == '') {
				alert('length을 입력하세요.');
				$('#length').focus();
			} else if($('#replacementCost').val() == '') {
				alert('replacementCost을 입력하세요.');
				$('#replacementCost').focus();
			} else if($('#rating').val() == '') {
				alert('rating을 선택하세요.');
				$('#rating').focus();
			} else if(cnt < 1) {
				alert('speacialFeatures을 선택하세요.');
			} else {
			    $('#modifyForm').submit();
			}
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
	            <a href="index.html">
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
                                <h4 class="card-title">Modify Film</h4>
                                <hr class="my-2">
                                <div class="table-responsive">
							      <form id="modifyForm" action="${pageContext.request.contextPath}/admin/modifyFilm" method="post">
							         <input name="film.filmId" value="${filmOne.filmId}" type="hidden">
							         <table class="table table-bordered zero-configuration">
							            <tr>
							               <td>title</td>
							               <td>
							                  <input type="text" name="film.title" id="title" value="${filmOne.title}" class="form-control">
							               </td>
							            </tr>
							            <tr>
							               <td>category</td>
							               <td>
							                  <select name="category.categoryId" id ="category" class="form-control">
							                     <c:forEach var="c" items="${categoryList}">
							                        <option value="${c.categoryId}">${c.name}</option>
							                     </c:forEach>
							                  </select>
							               </td>
							            </tr>
							            <tr>
							               <td>description</td>
							               <td>
							                  <textarea rows="5" cols="100" name="film.description" id="description" class="form-control">${filmOne.description}</textarea>
							               </td>
							            </tr>
							            <tr>
							               <td>releaseYear</td>
							               <td>
							                  <input type="text" name="film.releaseYear" id="releaseYear" value="${filmOne.releaseYear}" class="form-control">
							               </td>
							            </tr>
							            <tr>
							               <td>language</td>
							               <td>
							                  <select name="film.languageId" id ="language" class="form-control">
							                     <c:forEach var="lang" items="${languageList}">
							                        <option value="${lang.languageId}">${lang.name}</option>
							                     </c:forEach>
							                  </select>
							               </td>
							            </tr>
							            <tr>
							               <td>originalLanguage</td>
							               <td>
							                  <select name="film.originalLanguageId" id ="originalLanguage" class="form-control">
							                     <c:forEach var="lang" items="${languageList}">
							                        <option value="${lang.languageId}">${lang.name}</option>
							                     </c:forEach>
							                  </select>
							               </td>
							            </tr>
							            <tr>
							               <td>rentalDuration</td>
							               <td>
							                  <input type="text" name="film.rentalDuration" id="rentalDuration" value="${filmOne.rentalDuration}" class="form-control">               
							               </td>
							            </tr>
							            <tr>
							               <td>rentalRate</td>
							               <td>
							                  <input type="text" name="film.rentalRate" id="rentalRate" value="${filmOne.rentalRate}" class="form-control">
							               </td>
							            </tr>
							            <tr>
							               <td>length</td>
							               <td>
							                  <input type="text" name="film.length" id="length" value="${filmOne.length}" class="form-control">
							               </td>
							            </tr>
							            <tr>
							               <td>replacementCost</td>
							               <td>
							                  <input type="text" name="film.replacementCost" id="replacementCost" value="${filmOne.replacementCost}" class="form-control">
							               </td>
							            </tr>
							            <tr>
							               <td>rating</td>
							               <td>
							                  <select name="film.rating" id ="rating" class="form-control">
							                     <option value="G">G</option>
							                     <option value="PG">PG</option>
							                     <option value="PG-13">PG-13</option>
							                     <option value="R">R</option>
							                     <option value="NC-17">NC-17</option>
							                  </select>
							               </td>
							            </tr>
							            <tr>
							               <td>specialFeatures</td>
							               <td>
							                  <input type="checkbox" name="film.specialFeatures" value="Trailers">Trailers&nbsp;
							                  <input type="checkbox" name="film.specialFeatures" value="Commentaries">Commentaries&nbsp;
							                  <input type="checkbox" name="film.specialFeatures" value="Deleted Scenes">Deleted Scenes&nbsp;
							                  <input type="checkbox" name="film.specialFeatures" value="Behind the Scenes">Behind the Scenes
							               </td>
							            </tr>
							         </table>
							         <div>
						                <input class="btn mb-1 btn-primary" id="btn" type="button" value="게시물 수정" />
						                <input class="btn mb-1 btn-primary" type="reset" value="초기화" />
						                <a class="btn mb-1 btn-primary" href="${pageContext.request.contextPath}/admin/getBoardList">게시판 목록</a>
						          	 </div>
							      </form>
						      </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- #/ container -->
        </div>
        <!--**********************************
            Content body end
        ***********************************-->
        
        </div>
	    <!--**********************************
	        Main wrapper end
	    ***********************************-->
        
        
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
</body>
</html>