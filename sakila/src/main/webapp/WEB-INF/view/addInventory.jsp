<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<!-- bootstrap을 사용하기 위한 CDN주소 -->
<!-- Latest compiled and minified CSS -->

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<!-- jquery를 사용하기위한 CDN주소 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
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
</script>

</head>
<body>
   <div class="container">
      <h1>Add Inventory</h1>
      <form method="post" action="${pageContext.request.contextPath}/admin/addInventory">
         <table class="table table-hover">
         	<tr>
               <td>title</td>
               <td>
               	<select name="filmId" id="film"></select>
               </td>
            </tr>
            <tr>
               <td>storeID</td>
               <td>
                  <select name="storeId" id ="storeId" class="form-control">
                  	<option id="" value="">==선택==</option>
                  	<option id="store1" value="1">store1</option>
                  	<option id="store2" value="2">store2</option>
                  </select>
               </td>
            </tr>
          </table>
         <button id="btn" class="btn btn-secondary" type="submit">등록</button>
      </form>
   </div>
</body>
</html>