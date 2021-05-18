<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>getBoardOne(spring mvc 방식)</title>
<!-- bootstrap을 사용하기 위한 CDN주소 -->
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
	$(document).ready(function(){
		$('#commentBtn').click(function(){
			console.log("btn click!");
			// 폼 유효성 검사
			$('#commentForm').submit();
		});
	});
</script>
</head>
<body>
<div class="container">
    <h1>getBoardOne</h1>
     <table class="table">
         <tbody>
             <tr>
                <td>board_id :</td>
                <td>${boardMap.boardId}</td>
               </tr>
            <tr>
                   <td>board_title :</td>
                   <td>${boardMap.boardTitle}</td>
            </tr>
            <tr>
                   <td>board_content :</td>
                   <td>${boardMap.boardContent}</td>
            </tr>
            <tr>
                   <td>username :</td>
                   <td>${boardMap.username}</td>
            </tr>
            <tr>
                   <td>insert_date :</td>
                   <td>${boardMap.insertDate}</td>
            </tr>
        </tbody>
    </table>
	<a class="btn btn-default" href="${pageContext.request.contextPath}/admin/modifyBoard?boardId=${boardMap.boardId}">수정</a>
	<a class="btn btn-default" href="${pageContext.request.contextPath}/admin/removeBoard?boardId=${boardMap.boardId}">삭제</a>
	<a class="btn btn-default" href="${pageContext.request.contextPath}/admin/getBoardList">글목록</a>
    <!-- 댓글 목록 -->
    <div>
    	<!-- 댓글 추가 -->
    	<form id="commentForm" action="${pageContext.request.contextPath}/admin/addComment" method="post">
	    	<input type="hidden" name="boardId" value="${boardMap.boardId}">
	    	<div>Username : <input type="text" name="username"></div>
	    	<div>Comment : <textarea id="commentContent" name="commentContent" rows="3" cols="150"></textarea></div>
	    	<div><input class="btn btn-default" id="commentBtn" type="button" value="댓글추가" /></div>
    	</form>
    	
    	<!-- 댓글 목록 출력 -->
    	<table class="table">
			<c:forEach var="c" items="${commentList}">
				<tr>
					<td>${c.commentContent}</td>
					<td>${c.username}</td>
					<td>${c.insertDate}</td>
					<td><a href="${pageContext.request.contextPath}/admin/deleteCommentByCommentId?boardId=${boardMap.boardId}&commentId=${c.commentId}"><button type="button">삭제</button></a></td>
	    		</tr>
			</c:forEach>
    		
    	</table>
    </div>
</div>
</body>
</html>