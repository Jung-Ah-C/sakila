<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<title>addInventory</title>
<script>
//RestApi 사용 (RestController)
$(document).ready(function(){
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
});
</script>

</head>
<body>
    <div class="container">
        <h1>Add Inventory</h1>
        <form id="addForm" action="${pageContext.request.contextPath}/admin/addInventory" method="post">
            <div class="form-group">
                <label for="filmId">title :</label> 
                <select name="filmId" id="film" class="form-control"></select>
            </div>
            <div class="form-group">
                <label for="storeId">storeId :</label>
                <select name="storeId" id ="storeId" class="form-control">
                  	<option id="" value="">==선택==</option>
                  	<option id="store1" value="1">1</option>
                  	<option id="store2" value="2">2</option>
                </select>
            </div>
            <div>
                <input class="btn btn-default" id="btn" type="submit" value="재고추가" /> 
                <input class="btn btn-default" type="reset" value="초기화" /> 
                <a class="btn btn-default" href="${pageContext.request.contextPath}/admin/getInventoryList">재고목록</a>
            </div>
        </form>
    </div>
</body>
</html>