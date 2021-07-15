<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
<title>getCustomerOne</title>
<!-- jquery를 사용하기위한 CDN주소 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script>
$(document).ready(function(){
	// RestApi 사용 (RestController)
	$.ajax({
			type:'get',
			url:'/filmTitle',
			success: function(jsonData) {
				$('#film').append('<option value="">==선택==</option>');
				$(jsonData).each(function(index, item){
					$('#film').append(
						'<option value="'+item.filmId+'">'+item.title+'</option>'
					);
				});
			}
	});
	
	// film 선택이 완료된 후 inventory 리스트 보여주기
	$('#film').change(function(){
		console.log('inventory목록');
		$('#inventory').empty();
		$('#inventory').append('<option value="">==선택==</option>');
		if($('#film').val() != '') { // film값이 선택되었다면
			$.ajax({
					type:'get',
					url:'/inventory',
					data:{filmId : $('#film').val()},
					success: function(jsonData) {
						$(jsonData).each(function(index, item){
							$('#inventory').append(
									'<option value="'+item+'">'+item+'</option>'
							);
						});
					}
			});
		}
	});
	
	// 반납 버튼 클릭 시 controller로 파라미터 값 넘기기 (filmId, rentalId, overdue)
	$('#returnBtn').click(function() { // UI 적용시에 .returnBtn (class타입)으로 수정하기
		console.log('반납 실행');
		$('#parameters').empty(); // 반납 여러번 실행 시 이전의 매개변수 값들을 지우기 위해서
		
		// 현재 버튼이 클릭된 Row 찾기(<tr>)
		var btn = $(this);
		var tr = btn.parent().parent(); // button -> td -> tr
		var rentalId = tr.children().eq(0).text();
		var filmId = tr.children().eq(2).text(); // children() tr의 자식노드를 찾는 것, 즉 td
		var overdue = tr.children().eq(7).text();
		
		// 값 디버깅
		console.log(rentalId);
		console.log(filmId);
		console.log(overdue);
		
		$('#parameters').append('<input type = "hidden" name ="rentalId" value ="'+rentalId+'">');
		$('#parameters').append('<input type = "hidden" name ="filmId" value ="'+filmId+'">');
		$('#parameters').append('<input type = "hidden" name ="overdue" value ="'+overdue+'">');
		
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
                        <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/admin/getCustomerList">CustomerList</a></li>
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
                                <h4 class="card-title">CustomerOne</h4>
                                <hr class="my-2">
                                <div class="table-responsive">
                                    <!-- 고객 상세정보 테이블 -->
                                    <table class="table table-bordered zero-configuration">
										<tr>
								            <th>customerID :</th>
								            <td>${customerOne.customerId}</td>
							            </tr>
							            <tr>
											<th>firstName :</th>
											<td>${customerOne.firstName}</td>
							            </tr>
							            <tr>
											<th>lastName :</th>
											<td>${customerOne.lastName}</td>
							            </tr>
							            <tr>
											<th>email :</th>
											<td>${customerOne.email}</td>
							            </tr>
							            <tr>
											<th>totalPayment :</th>
											<td>$${customerOne.totalPayment}</td>
							            </tr>
							            <tr>
											<th>storeID :</th>
											<td>${customerOne.storeId}</td>
							            </tr>
							            <tr>
											<th>active :</th>
											<td>${customerOne.active}</td>
							            </tr>
                                    </table>
                                    <a class="btn mb-1 btn-primary" href="${pageContext.request.contextPath}/admin/getCustomerList">고객목록</a>
                                </div>    
						        
						        <br>
						        <!-- 영화 대여 테이블 -->
					            <h4 class="card-title">Rental</h4>
                                <hr class="my-2">
                                <div class="table-responsive">
                                    <form action="${pageContext.request.contextPath}/admin/addRental" method="post" id="rentalForm">
	                                    <!-- staffID는 controller에서 처리하기! -->
								    	<input type="hidden" name="customerId" value="${customerOne.customerId}">
								    	<input type="hidden" name="staffId" value="">
	                                    <table class="table table-bordered zero-configuration" id="rentalTable">
											<thead>
								    			<tr>
								    				<th>film</th>
								    				<th>inventory</th>
								    				<th>rental</th>
								    			</tr>
								    		</thead>
								    		<tbody>
								    			<tr>
								    				<!-- select 값들을 처리하기 위해서 restController 사용 -->
								    				<td>
								    					<select name="filmId" id="film"></select>
								    				</td>
								    				<td>
								    					<select name="inventoryId" id="inventory"></select>
								    				</td>
								    				<td>
								    					<button class="btn mb-1 btn-primary" id="rentalSubmitBtn">대여</button>
								    				</td>
								    			</tr>
								    		</tbody>
	                                    </table>
	                                </form>
                                </div>
                                
                                <!-- 고객 대여리스트 테이블 --> 
                                <h4 class="card-title">Rental History</h4>
                                <hr class="my-2">
                                <div class="table-responsive">
                                   	<form action="${pageContext.request.contextPath}/admin/addReturn" method="post">
									<input type="hidden" name="customerId" value="${customerOne.customerId}">
									<div id="parameters"></div>
									    <table class="table table-bordered zero-configuration">
									    	<thead>
									    		<tr>
									    			<th>rentalID</th>
									    			<th>storeID</th>
									    			<th>filmID</th>
									    			<th>title</th>
									    			<th>rentalDuration</th>
									    			<th>rentalDate</th>
									    			<th>returnDate</th>
									    			<th>overdue</th>
									    			<th>return</th>
									    		</tr>
									    	</thead>
									    	<tbody>
									    		<c:forEach var="r" items="${rentalList}">
									    			<tr>
										    			<td>${r.rentalId}</td>	
										    			<td>${r.storeId}</td>
										    			<td>${r.filmId}</td>
										    			<td><a href="${pageContext.request.contextPath}/admin/getFilmOne?filmId=${r.filmId}">${r.title}</a></td>
										    			<td>${r.rentalDuration}</td>
										    			<td><fmt:formatDate value="${r.rentalDate}" pattern="yyyy-MM-dd"/></td>
										    			<td><fmt:formatDate value="${r.returnDate}" pattern="yyyy-MM-dd"/></td>
										    			<td>
										    				<c:if test="${r.returnDate == null}">${r.overdue}</c:if>
										    				<c:if test="${r.returnDate != null}"></c:if>
										    			</td>
										    			<td>
										    				<c:if test="${r.returnDate == null}"><button class="btn mb-1 btn-primary" type ="submit" id="returnBtn">반납</button></c:if>
										    				<c:if test="${r.returnDate != null}"></c:if>
										    			</td>
											    	</tr>
									    		</c:forEach>
									    	</tbody>
									    </table>
									    <!-- 고객 대여리스트 페이징 -->
									    <div id="pager">
									    	<c:if test="${currentPage > 1}">
									    		<a class="btn mb-1 btn-primary" href="${pageContext.request.contextPath}/admin/getCustomerOne?customerId=${customerOne.customerId}&currentPage=${currentPage-1}">이전</a>
									    	</c:if>
									    	<c:if test="${currentPage < lastPage}">
									    		<a class="btn mb-1 btn-primary" href="${pageContext.request.contextPath}/admin/getCustomerOne?customerId=${customerOne.customerId}&currentPage=${currentPage+1}">다음</a>
									    	</c:if>
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