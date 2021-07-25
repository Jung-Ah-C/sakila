<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>mainMenu</title>
</head>
<body>
		<div class="nk-sidebar">           
            <div class="nk-nav-scroll">
                <ul class="metismenu" id="menu">
                    <li>
                        <a href="${pageContext.request.contextPath}/" aria-expanded="false">
                            <i class="icon-speedometer menu-icon"></i><span class="nav-text">Dashboard</span>
                        </a>
                    </li>
                    
                    <li>
                        <a href="${pageContext.request.contextPath}/admin/getBoardList" aria-expanded="false">
                            <i class="icon-book-open menu-icon"></i><span class="nav-text">BoardList</span>
                        </a>
                    </li>
                    
                    <li>
                        <a href="${pageContext.request.contextPath}/admin/getStaffList" aria-expanded="false">
                            <i class="icon-user menu-icon"></i><span class="nav-text">StaffList</span>
                        </a>
                    </li>
                    
                    <li>
                        <a href="${pageContext.request.contextPath}/admin/getCustomerList" aria-expanded="false">
                            <i class="icon-user menu-icon"></i><span class="nav-text">CustomerList</span>
                        </a>
                    </li>
                    
                    <li>
                        <a href="${pageContext.request.contextPath}/admin/getFilmList" aria-expanded="false">
                            <i class="icon-film menu-icon"></i><span class="nav-text">FilmList</span>
                        </a>
                    </li>
                    
                    <li>
                        <a href="${pageContext.request.contextPath}/admin/getActorList" aria-expanded="false">
                            <i class="icon-people menu-icon"></i><span class="nav-text">ActorList</span>
                        </a>
                    </li>
                    
                    <li>
                        <a href="${pageContext.request.contextPath}/admin/getInventoryList" aria-expanded="false">
                            <i class="icon-folder menu-icon"></i><span class="nav-text">InventoryList</span>
                        </a>
                    </li>
                    
                    <li>
                        <a href="${pageContext.request.contextPath}/admin/logout" aria-expanded="false">
                            <i class="icon-logout menu-icon"></i><span class="nav-text">Logout</span>
                        </a>
                    </li>
        		</ul>
        	</div>
        </div>
</body>
</html>