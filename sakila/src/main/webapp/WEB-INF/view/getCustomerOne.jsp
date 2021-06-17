<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>getCustomerOne</title>
<!-- bootstrap�� ����ϱ� ���� CDN�ּ� -->
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
$(document).ready(function(){
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
		$('#inventory').append('<option value="">����</option>');
		if($('#film').val() != '') { // film���� ���õǾ��ٸ�
			$.ajax({
					type:'get',
					url:'/inventory',
					data:{filmId : $('#film').val()},
					success: function(jsonData) {
						$('#inventory').append(
							'<option value="'+item+'"'+item+'</option>'
						);
					}
			});
		}
	});
});

</script>
</head>
<body>
<div class="container">
    <h1>CustomerOne</h1>
    <!-- �� ������ ���̺� -->
    <table class="table">
         <tbody>
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
        </tbody>
    </table>
    
    <!-- ��ȭ �뿩 ���̺� -->
    <h2>Rental</h2>
    <form action="${pageContext.request.contextPath}/admin/addRental" method="post" id="rentalForm">
    	<!-- staffID�� controller���� ó���ϱ�! -->
    	<input type="hidden" name="customerId" value="${customerOne.customerId}">
    	<input type="hidden" name="staffId" value="">
    	<table class="table" id="rentalTable">
    		<thead>
    			<tr>
    				<th>film</th>
    				<th>inventoryID</th>
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
    					<select name="inventoryId" id="inventoryId"></select>
    				</td>
    				<td>
    					<button id="rentalSubmitBtn">�뿩</button>
    				</td>
    			</tr>
    		</tbody>
    	</table>
    </form>
    
    <!-- �� �뿩����Ʈ ���̺� -->
    <h2>Rental History</h2>
    <table class="table">
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
	    				<c:if test="${r.returnDate == null}"><a href=""><button>�ݳ�</button></a></c:if>
	    				<c:if test="${r.returnDate != null}"></c:if>
	    			</td>
		    	</tr>
    		</c:forEach>
    	</tbody>
    </table>
    
    <!-- �� �뿩����Ʈ ����¡ -->
    <ul class="pager">
    	<c:if test="${currentPage > 1}">
    		<li class="previous"><a href="${pageContext.request.contextPath}/admin/getCustomerOne?customerId=${customerOne.customerId}&currentPage=${currentPage-1}">����</a></li>
    	</c:if>
    	<c:if test="${currentPage < lastPage}">
    		<li class="next"><a href="${pageContext.request.contextPath}/admin/getCustomerOne?customerId=${customerOne.customerId}&currentPage=${currentPage+1}">����</a></li>
    	</c:if>
    </ul>
	<a class="btn btn-default" href="${pageContext.request.contextPath}/admin/getCustomerList">�����</a>
</div>
</body>
</html>