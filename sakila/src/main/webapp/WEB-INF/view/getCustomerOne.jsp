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
<!-- jquery�� ����ϱ����� CDN�ּ� -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script>
$(document).ready(function(){
	// RestApi ��� (RestController)
	$.ajax({
			type:'get',
			url:'/filmTitle',
			success: function(jsonData) {
				$('#film').append('<option value="">==����==</option>');
				$(jsonData).each(function(index, item){
					$('#film').append(
						'<option value="'+item.filmId+'">'+item.title+'</option>'
					);
				});
			}
	});
	
	// film ������ �Ϸ�� �� inventory ����Ʈ �����ֱ�
	$('#film').change(function(){
		console.log('inventory���');
		$('#inventory').empty();
		$('#inventory').append('<option value="">==����==</option>');
		if($('#film').val() != '') { // film���� ���õǾ��ٸ�
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
	
	// �ݳ� ��ư Ŭ�� �� controller�� �Ķ���� �� �ѱ�� (filmId, rentalId, overdue)
	$('#returnBtn').click(function() { // UI ����ÿ� .returnBtn (classŸ��)���� �����ϱ�
		console.log('�ݳ� ����');
		$('#parameters').empty(); // �ݳ� ������ ���� �� ������ �Ű����� ������ ����� ���ؼ�
		
		// ���� ��ư�� Ŭ���� Row ã��(<tr>)
		var btn = $(this);
		var tr = btn.parent().parent(); // button -> td -> tr
		var rentalId = tr.children().eq(0).text();
		var filmId = tr.children().eq(2).text(); // children() tr�� �ڽĳ�带 ã�� ��, �� td
		var overdue = tr.children().eq(7).text();
		
		// �� �����
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
        Preloader start (������ �ε����� �� �ߴ� ������)
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
	            Nav header start (�ΰ� �ڸ�)
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
                                    <!-- �� ������ ���̺� -->
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
                                    <a class="btn mb-1 btn-primary" href="${pageContext.request.contextPath}/admin/getCustomerList">�����</a>
                                </div>    
						        
						        <br>
						        <!-- ��ȭ �뿩 ���̺� -->
					            <h4 class="card-title">Rental</h4>
                                <hr class="my-2">
                                <div class="table-responsive">
                                    <form action="${pageContext.request.contextPath}/admin/addRental" method="post" id="rentalForm">
	                                    <!-- staffID�� controller���� ó���ϱ�! -->
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
								    				<!-- select ������ ó���ϱ� ���ؼ� restController ��� -->
								    				<td>
								    					<select name="filmId" id="film"></select>
								    				</td>
								    				<td>
								    					<select name="inventoryId" id="inventory"></select>
								    				</td>
								    				<td>
								    					<button class="btn mb-1 btn-primary" id="rentalSubmitBtn">�뿩</button>
								    				</td>
								    			</tr>
								    		</tbody>
	                                    </table>
	                                </form>
                                </div>
                                
                                <!-- �� �뿩����Ʈ ���̺� --> 
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
										    				<c:if test="${r.returnDate == null}"><button class="btn mb-1 btn-primary" type ="submit" id="returnBtn">�ݳ�</button></c:if>
										    				<c:if test="${r.returnDate != null}"></c:if>
										    			</td>
											    	</tr>
									    		</c:forEach>
									    	</tbody>
									    </table>
									    <!-- �� �뿩����Ʈ ����¡ -->
									    <div id="pager">
									    	<c:if test="${currentPage > 1}">
									    		<a class="btn mb-1 btn-primary" href="${pageContext.request.contextPath}/admin/getCustomerOne?customerId=${customerOne.customerId}&currentPage=${currentPage-1}">����</a>
									    	</c:if>
									    	<c:if test="${currentPage < lastPage}">
									    		<a class="btn mb-1 btn-primary" href="${pageContext.request.contextPath}/admin/getCustomerOne?customerId=${customerOne.customerId}&currentPage=${currentPage+1}">����</a>
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