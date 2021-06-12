<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<!-- bootstrap을 사용하기 위한 CDN주소 -->
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
    href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
    integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
    crossorigin="anonymous">
<!-- Optional theme -->
<link rel="stylesheet"
    href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css"
    integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp"
    crossorigin="anonymous">
 
<!-- jquery를 사용하기위한 CDN주소 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
 
<!-- bootstrap javascript소스를 사용하기 위한 CDN주소 -->
<!-- Latest compiled and minified JavaScript -->
<script
    src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
    integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
    crossorigin="anonymous"></script>
 
<script>
    $(document).ready(function() {
    	console.log('country 목록');
    	$.ajax({
    	   type:'get'
    	   url:'/country'
    	   success: function(jsonData) {
    		   $('#country').empty();
    		   $(jsonData).each(function(index, item) {
    			   $('#country').append( // country select 태그 안에 option 태그를 추가해줌
    					   '<option value="'+item.countryId+'">'+item.country+'</option>'
    				);
    		   });
    	   }
       });
       
       $('#country').change(function(){
    	   console.log('city 목록');
    	   $.ajax({
    		   type:'get'
    		   url:'/city'
    		   data:{countryId : $('#country').val()},
    		   success:function(jsonData) {
    			   $('#city').empty();
    			   $(jsonData).each(function(index, item) {
    				  $('#city').append( // city select 태그 안에 option 태그를 추가해줌
    						'<option value="'+item.cityId+'">'+item.city+'</option>'
    				  ); 
    			   });
    		   }
    	   });
       });
    	
    	// alert 기능
	   	$('#btn').click(function() { // submit 버튼을 클릭했을 때, 채워지지 않은 부분이 있으면 alert
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
<title>addCustomer</title>
</head>
<body>
    <div class="container">
        <h1>Add Customer</h1>
        <form id="addForm" action="${pageContext.request.contextPath}/admin/addCustomer" method="post">
            <!-- storeId -->
            <div class="form-group">
                <label for="storeId">storeID :</label> 
                <select name="storeId" id="storeId">
                	<option value="">선택</option>
                	<option value="1">1</option>
                	<option value="2">2</option>
                </select>
            </div>
            <div class="form-group">
                <label for="firstName">firstName :</label> <input class="form-control"
                    name="firstName" id="firstName" type="text" />
            </div>
            <div class="form-group">
                <label for="lastName">lastName :</label> <input
                    class="form-control" name="lastName" id="lastName" type="text" />
            </div>
            <div class="form-group">
                <label for="email">email :</label> <input
                    class="form-control" name="email" id="email" type="text" />
            </div>
            
            <!-- address --> <!-- addressId는 서비스단에서 직접 넣어주기 -->
            <div class="form-group">
                <label for="address">Address :</label>
               	<select name="country" id="country"></select>
               	<select name="cityId" id="city"></select>
               	<input class="form-control" name="address" id="address" type="text" />
               	<input class="form-control" name="address2" id="address2" type="text" />
               	<input class="form-control" name="district" id="district" type="text" />
               	<input class="form-control" name="postalCode" id="postalCode" type="text" />
               	<input class="form-control" name="phone" id="phone" type="text" />
            </div>
            <div>
                <input class="btn btn-default" id="btn" type="button" value="고객추가" /> 
                <input class="btn btn-default" type="reset" value="초기화" /> 
                <a class="btn btn-default" href="${pageContext.request.contextPath}/admin/getCustomerList">고객목록</a>
            </div>
        </form>
    </div>
</body>
</html>