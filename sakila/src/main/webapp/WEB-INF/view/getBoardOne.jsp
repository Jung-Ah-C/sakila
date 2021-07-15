<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
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
<title>getBoardOne</title>
<!-- jquery를 사용하기위한 CDN주소 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script>
$(document).ready(function() {
	console.log("document ready!");
	// 댓글 폼 유효성 검사
	$('#btn').click(function() {
		console.log("btn click!");
		if ($('#username').val().length < 3) {
			alert('username는 3자이상 이어야 합니다');
			$('#username').focus();
		} else if ($('#commentContent').val().length < 10) {
			alert('commentContent는 10자이상 이어야 합니다');
			$('#commentContent').focus();
		} else {
			$('#commentForm').submit();
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
                        <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/admin/getBoardList">BoardList</a></li>
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
                                <h4 class="card-title">BoardOne</h4>
                                <hr class="my-2">
                                <div class="table-responsive">
                                    <table class="table table-bordered zero-configuration">
										<tr>
											<th>boardID</th>
											<td>${boardMap.boardId}</td>
										</tr>
								        <tr>
											<th>board_title</th>
											<td>${boardMap.boardTitle}</td>
								        </tr>
								        <tr>
											<th>board_content</th>
											<td>${boardMap.boardContent}</td>
								        </tr>
								        <tr>
											<th>username</th>
											<td>${boardMap.username}</td>
								        </tr>
								        <tr>
											<th>insertDate</th>
											<td>${boardMap.insertDate}</td>
								        </tr>
								        <tr>
											<th>boarfile</th>
											<td>
									       		<div>
									       			<a href="${pageContext.request.contextPath}/admin/addBoardfile?boardId=${boardMap.boardId}"><button class="btn mb-1 btn-primary" type="button">파일추가</button></a>
												</div>
												<!-- 보드파일을 출력하는 반복문 코드 구현 -->
												<c:forEach var="f" items="${boardfileList}">
													<div>
														<a href="${pageContext.request.contextPath}/resource/${f.boardfileName}">${f.boardfileName}</a>
														<a href="${pageContext.request.contextPath}/admin/removeBoardfile?boardId=${boardMap.boardId}"><button type="button">파일삭제</button></a>
													</div>
												</c:forEach>
											</td>
								        </tr>
                                    </table>
                                    <div>
						                <a class="btn mb-1 btn-primary" href="${pageContext.request.contextPath}/admin/modifyBoard?boardId=${boardMap.boardId}">수정</a>
										<a class="btn mb-1 btn-primary" href="${pageContext.request.contextPath}/admin/removeBoard?boardId=${boardMap.boardId}">삭제</a>
										<a class="btn mb-1 btn-primary" href="${pageContext.request.contextPath}/admin/getBoardList">게시판 목록</a>
						            </div>
                                    
                                    <!-- 댓글 목록 -->
								    <div>
								    	<!-- 댓글 추가 -->
								    	<form id="commentForm" action="${pageContext.request.contextPath}/admin/addComment" method="post">
									    	<input type="hidden" name="boardId" value="${boardMap.boardId}">
									    	<div>Username : <input class="form-control input-default" type="text" id="username" name="username"></div>
									    	<div>Comment : <br><textarea class="form-control h-150px" id="commentContent" name="commentContent" rows="3" cols="150"></textarea></div>
									    	<div><input class="btn mb-1 btn-primary" id="btn" type="button" value="댓글추가" /></div>
								    	</form>
								    	
								    	<!-- 댓글 목록 출력 -->
								    	<table class="table table-bordered zero-configuration">
											<c:forEach var="c" items="${commentList}">
												<tr>
													<td>${c.commentContent}</td>
													<td>${c.username}</td>
													<td>${c.insertDate}</td>
													<td><a href="${pageContext.request.contextPath}/admin/deleteCommentByCommentId?boardId=${boardMap.boardId}&commentId=${c.commentId}"><button class="btn mb-1 btn-primary" type="button">삭제</button></a></td>
									    		</tr>
											</c:forEach>
								    	</table>
								    </div>
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