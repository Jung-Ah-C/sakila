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
<link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet">
<title>addBoard</title>
<!-- jquery를 사용하기위한 CDN주소 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script>
    $(document).ready(function() {
        $('#addButton').click(function() {
           // 파일들 중 하나라도 첨부되지 않으면 ck = true;
           let ck = false;
           let boardfile = $('.boardfile'); // 배열
           // break 키워드를 사용하기 위해 for 반복문 사용 <-- boardfile.each() 메서드 사용x
           for(let item of boardfile){ // of: foreach문
              if($(item).val() == ''){
                 ck = true;
                 console.log('첨부되지 않은 파일이 있습니다.');
                 break;
              }
           }
           
           if(ck){ // if(ck == true)
              alert('첨부되지 않은 파일이 있습니다.');
           } else if ($('#boardPw').val().length < 4) {
                alert('boardPw는 4자이상 이어야 합니다');
                $('#boardPw').focus();
            } else if ($('#boardTitle').val() == '') {
                alert('boardTitle을 입력하세요');
                $('#boardTitle').focus();
            } else if ($('#boardContent').val() == '') {
                alert('boardContent을 입력하세요');
                $('#boardContent').focus();
            } else if ($('#staffId').val() == '') {
                alert('boardUser을 입력하세요');
                $('#boardUser').focus();
            } else {
                $('#addForm').submit();
            }
        });
        
        // #inputFile input type="file" 마지막에 추가
        $('#addFileBtn').click(function(){
           console.log('#addFileBtn click!');
           $('#inputFile').append('<input type="file" name="boardfile" class="boardfile">');
        })
        
        // #inputFile input type="file" 마지막 태그를 삭제
        $('#delFileBtn').click(function(){
           console.log('#delFileBtn click!');
           $('#inputFile').children().last().remove();
        })
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
                                <h4 class="card-title">Add Board</h4>
                                <hr class="my-2">
                                <div class="table-responsive">
                                    <!-- enctype이 있어야 파일을 넘길 수 있음, 메소드 방식은 post로 해야 함 -->
                                    <form id="addForm" action="${pageContext.request.contextPath}/admin/addBoard" method="post" enctype="multipart/form-data">
	                                    <table class="table table-bordered zero-configuration">
								           <tr>
								              <td>
									              <div>
									                 <button class="btn mb-1 btn-primary" id="addFileBtn" type="button">파일추가</button>
									                 <button class="btn mb-1 btn-primary" id="delFileBtn" type="button">파일삭제</button>
									              </div>
								              </td>
								              <td>
								                  <div id="inputFile"></div>
								              </td>
								           </tr>
								           <tr>
								           	  <th>BoardPw :</th>
								           	  <td>
								           	  	 <input class="form-control" name="board.boardPw" id="boardPw" type="password" />
								           	  </td>
								           </tr>
								           <tr>
								           	  <th>BoardTitle :</th>
								           	  <td>
								           	  	 <input class="form-control" name="board.boardTitle" id="boardTitle" type="text" />
								           	  </td>
								           </tr>
								           <tr>
								           	  <th>BoardContent :</th>
								           	  <td>
								           	  	 <textarea class="form-control" name="board.boardContent" id="boardContent" rows="5" cols="50"></textarea>
								           	  </td>
								           </tr>
								           <tr>
								           	  <th>StaffID :</th>
								           	  <td>
								           	  	 <input class="form-control" name="board.staffId" id="staffId" type="text" value="${staffId}" readonly />
								           	  </td>
								           </tr>
	                                    </table>
	                                    <div>
							                <input class="btn mb-1 btn-primary" id="addButton" type="button" value="작성" />
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