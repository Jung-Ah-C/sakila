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
<title>addCustomer</title>
<!-- jquery를 사용하기위한 CDN주소 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script>
    $(document).ready(function(){
    	console.log('country 목록');
    	$('#country').empty();
    	$('#country').append('<option value="">===선택===</option>');
    	$.ajax({
    	   type:'get',
    	   url:'/country',
    	   success: function(jsonData) {
    		   $(jsonData).each(function(index, item) {
    			   $('#country').append( // country select 태그 안에 option 태그를 추가해줌
    					   '<option value="'+item.countryId+'">'+item.country+'</option>'
    				);
    		   });
    	   }
       });
       
       $('#country').change(function(){
    	   console.log('city 목록');
    	   $('#city').empty();
    	   $('#city').append('<option value="">===선택===</option>');
    	   $.ajax({
    		   type:'get',
    		   url:'/city',
    		   data:{countryId : $('#country').val()},
    		   success:function(jsonData) {
    			   $(jsonData).each(function(index, item) {
    				  $('#city').append( // city select 태그 안에 option 태그를 추가해줌
    						'<option value="'+item.cityId+'">'+item.city+'</option>'
    				  ); 
    			   });
    		   }
    	   });
       });
    	
    	// 폼 유효성 검사
	   	$('#addButton').click(function() { // submit 버튼을 클릭했을 때, 채워지지 않은 부분이 있으면 alert
			if($('#storeId').val() == ''){
				alert('storeId을 선택하세요.');
				$('#storeId').focus();
			} else if($('#firstName').val() == '') {
				alert('firstName을 입력하세요.');
				$('#firstName').focus();
	       	} else if($('#lastName').val() == '') {
				alert('lastName을 입력하세요.');
				$('#lastName').focus();
			} else if($('#email').val() == '') {
				alert('email을 입력하세요.');
				$('#email').focus();
			} else if ($('#country').val() == '') {
				alert('country를 선택하세요.');
				$('#country').focus();
			} else if ($('#city').val() == '') {
				alert('city를 선택하세요.');
				$('#city').focus();
			} else if ($('#address').val() == '') {
				alert('address를 입력하세요.');
				$('#address').focus();
			} else if ($('#postalCode').val() == '') {
				alert('postalCode를 입력하세요.');
				$('#postalCode').focus();
			} else if ($('#phone').val() == '') {
				alert('phone을 선택하세요.');
				$('#phone').focus();
			} else {
			    $('#addForm').submit();
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
                                <h4 class="card-title">Add Customer</h4>
                                <hr class="my-2">
                                <div class="table-responsive">
                                    <form id="addForm" action="${pageContext.request.contextPath}/admin/addCustomer" method="post">
	                                    <table class="table table-bordered zero-configuration">
								           <tr>
								           	  <th>StoreID</th>
								           	  <td>
								           	  	<select name="customer.storeId" id="storeId">
								                	<option value="">==선택==</option>
								                	<option value="1">1</option>
								                	<option value="2">2</option>
								              	</select>
								           	  </td>
								           </tr>
								           <tr>
								           	  <th>FirstName</th>
								           	  <td>
								           	  	 <input class="form-control" name="customer.firstName" id="firstName" type="text" />
								           	  </td>
								           </tr>
								           <tr>
								           	  <th>LastName</th>
								           	  <td>
								           	  	 <input class="form-control" name="customer.lastName" id="lastName" type="text" />
								           	  </td>
								           </tr>
								           <tr>
								           	  <th>Email</th>
								           	  <td>
								           	  	 <input class="form-control" name="customer.email" id="email" type="text" />
								           	  </td>
								           </tr>
								           <tr>
								           	  <th>Country</th>
								           	  <td><select name="address.country" id="country"></select></td>
								           </tr>
								           <tr>
								           	  <th>City</th>
								           	  <td><select name="address.cityId" id="city"></select></td>
								           </tr>
								           <tr>
								           	  <th>Address</th>
								           	  <td><input class="form-control" name="address.address" id="address" type="text" /></td>
								           </tr>
								           <tr>
								           	  <th>Address2</th>
								           	  <td><input class="form-control" name="address.address2" id="address2" type="text" /></td>
								           </tr>
								           <tr>
								           	  <th>District</th>
								           	  <td><input class="form-control" name="address.district" id="district" type="text" /></td>
								           </tr>
								           <tr>
								           	  <th>PostalCode</th>
								           	  <td><input class="form-control" name="address.postalCode" id="postalCode" type="text" /></td>
								           </tr>
								           <tr>
								           	  <th>Phone</th>
								           	  <td><input class="form-control" name="address.phone" id="phone" type="text" /></td>
								           </tr>
	                                    </table>
	                                    <div>
							                <input class="btn mb-1 btn-primary" id="addButton" type="button" value="고객 추가" />
							                <input class="btn mb-1 btn-primary" type="reset" value="초기화" />
							                <a class="btn mb-1 btn-primary" href="${pageContext.request.contextPath}/admin/getCustomerList">고객 목록</a>
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