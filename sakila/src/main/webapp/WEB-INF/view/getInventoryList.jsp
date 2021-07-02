<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>getInventoryList</title>
<!-- bootstrap을 사용하기 위한 CDN주소 -->
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
</head>
<body>
<!-- mainMenu -->
<jsp:include page="/WEB-INF/view/inc/mainMenu.jsp"></jsp:include>

<div class="container">
    <h1><a href="${pageContext.request.contextPath}/admin/getInventoryList">InventoryList</a></h1>
    
    <div align="right">
	    <form action="${pageContext.request.contextPath}/admin/getInventoryList" method="get">
	        <!-- 드롭다운으로 storeId 선택 가능하게 하기 -->
	        Store :
		    <select name="storeId">
	            <option value="">선택</option>
	               <c:if test="${storeId == 1}">
	                   <option value="1" selected="selected">store 1</option>
	                </c:if>
	                <c:if test="${storeId != 1}">
	                   <option value="1">store 1</option>
	                </c:if>
	                <c:if test="${storeId == 2}">
	                   <option value="2" selected="selected">store 2</option>
	                </c:if>
	                <c:if test="${storeId != 2}">
	                   <option value="2">store 2</option>
	                </c:if>
			</select>
	        
	        <!-- 검색어 입력창 -->
	        <label for="searchWord">검색어(영화 제목) :</label> 
	        <input name="searchWord" type="text">
	        <button type="submit">검색</button>
	    </form>
	</div>
    
    <table class="table table-striped">
        <thead>
            <tr>
                <th>storeID</th>
                <th>title</th>
                <th>totalInventory</th>
                <th>totalRental</th>
                <th>totalStock</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="i" items="${inventoryList}">
                <tr>
                	<td>${i.storeId}</td>
                    <td>${i.title}</td>
                    <td>${i.totalInventory}</td>
                    <td>${i.rental}</td>
                    <td>${i.stock}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    
    <!-- 페이징 -->
    <ul class="pager">
        <c:if test="${currentPage > 1}">
            <li class="previous"><a href="${pageContext.request.contextPath}/admin/getInventoryList?currentPage=${currentPage-1}&searchWord=${searchWord}&storeId=${storeId}">이전</a></li>
        </c:if>
        <c:if test="${currentPage < lastPage}">
            <li class="next"><a href="${pageContext.request.contextPath}/admin/getInventoryList?currentPage=${currentPage+1}&searchWord=${searchWord}&storeId=${storeId}">다음</a></li>
        </c:if>
    </ul>
    
    <!-- 재고 추가, 삭제 버튼 -->
    <div>
        <a class="btn btn-default" href="${pageContext.request.contextPath}/admin/addInventory">재고 추가</a>
        <a class="btn btn-default" href="${pageContext.request.contextPath}/admin/removeInventory">재고 삭제</a>
    </div>
    
</div>
</body>
</html>