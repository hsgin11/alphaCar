<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<%request.setCharacterEncoding("UTF-8"); %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <link href="<%=request.getContextPath() %>/resources/bootstrap-5.0.2-dist/css/sidebars.css" rel="stylesheet">
    
<style type="text/css">

</style> 
</head>
<body>
	<c:if test="${sessionScope.USER_INFO ne null }">
		<c:choose>
			<c:when test="${sessionScope.USER_INFO.userRole eq 'admin' }">
			<div class="col-md-3">		
				<div style="padding: 15%; padding-top: 0">
			        <div class="d-flex flex-column flex-shrink-0 p-3 " style="width: 100%; text-align: left; margin: auto;">             
			        <div class="row">
			        	<div class="col" style="font-size: 20px; text-align: center;">
			        		<strong>게시판 관리자</strong>
			        	</div>        
			        </div>
			        </div>
			           <hr>
			            <ul class="nav nav-pills flex-column mb-auto">
			              <li class="nav-item">
			                <a href="<%=request.getContextPath() %>" class="nav-link link-dark" aria-current="page">
			                    <i class="bi bi-house"></i>&nbsp;
			                  <span>Home</span>
			                </a>
			              </li>
			              <li>
			                <a href="infoBoardList" class="nav-link link-dark">
			                    <i class="bi bi-truck"></i>&nbsp;
			                  <span>정보게시판</span>
			                </a>
			              </li>
			              <li>
			                <a href="questionboard" class="nav-link link-dark">
			                    <i class="bi bi-upc-scan"></i>&nbsp;
			                 <span>문의게시판</span>
			                </a>
			              </li>
			            </ul>
			            <hr>
			            <div class="dropdown">
			              <a href="#" class="d-flex align-items-center link-dark text-decoration-none dropdown-toggle" id="dropdownUser2" data-bs-toggle="dropdown" aria-expanded="false">
			                <img src="https://github.com/mdo.png" alt="" width="32" height="32" class="rounded-circle me-2">
			                <strong>userName</strong>
			              </a>
			              <ul class="dropdown-menu text-small shadow" aria-labelledby="dropdownUser2">
			                <li><a class="dropdown-item" href="#">New project...</a></li>
			                <li><a class="dropdown-item" href="#">Settings</a></li>
			                <li><a class="dropdown-item" href="#">Profile</a></li>
			                <li><hr class="dropdown-divider"></li>
			                <li><a class="dropdown-item" href="#">Sign out</a></li>
			              </ul>
			            </div>
			          </div>          
			      </div>
			</c:when>
			<c:otherwise>
				<div class="col-md-3">		
				<div style="padding: 15%;">
			        <div class="d-flex flex-column flex-shrink-0 p-3 " style="width: 100%; text-align: left; margin: auto;">      
			        <img class="car-img" alt="" src="${sessionScope.CAR_INFO.carImageUrl }">
			        <br>        
			        <div class="row">
			        	<div class="col" style="font-size: 20px;">
			        	${sessionScope.CAR_INFO.carName}차주
			        	${sessionScope.USER_INFO.userName }님
			        	</div>        
			        </div>
			        <div class="row">
			        	<div class="col font">
			        	게시물 수
			        	<br>
			        	${sessionScope.COUNT_INFO.boardCount }
			        	</div>
			        	
			        	<div class="col font">
			        	조회 수
			        	<br>
			        	${sessionScope.COUNT_INFO.boardHitCount }
			        	</div>
			        	
			        	<div class="col font">
			        	댓글 수
			        	<br>
			        	${sessionScope.COUNT_INFO.boardReplyCount }
			        	</div>
			        </div>
			        </div>
			           <hr>
			            <ul class="nav nav-pills flex-column mb-auto">
			              <li class="nav-item">
			                <a href="<%=request.getContextPath() %>" class="nav-link link-dark" aria-current="page">
			                    <i class="bi bi-house"></i>&nbsp;
			                  <span>Home</span>
			                </a>
			              </li>
			              <li>
			                <a href="infoBoardList" class="nav-link link-dark">
			                    <i class="bi bi-truck"></i>&nbsp;
			                  <span>정보게시판</span>
			                </a>
			              </li>
			              <li>
			                <a href="questionboard" class="nav-link link-dark">
			                    <i class="bi bi-upc-scan"></i>&nbsp;
			                 <span>문의게시판</span>
			                </a>
			              </li>
			            </ul>
			            <hr>
			            <div class="dropdown">
			              <a href="#" class="d-flex align-items-center link-dark text-decoration-none dropdown-toggle" id="dropdownUser2" data-bs-toggle="dropdown" aria-expanded="false">
			                <img src="https://github.com/mdo.png" alt="" width="32" height="32" class="rounded-circle me-2">
			                <strong>userName</strong>
			              </a>
			              <ul class="dropdown-menu text-small shadow" aria-labelledby="dropdownUser2">
			                <li><a class="dropdown-item" href="#">New project...</a></li>
			                <li><a class="dropdown-item" href="#">Settings</a></li>
			                <li><a class="dropdown-item" href="#">Profile</a></li>
			                <li><hr class="dropdown-divider"></li>
			                <li><a class="dropdown-item" href="#">Sign out</a></li>
			              </ul>
			            </div>
			          </div>          
			      </div>
			</c:otherwise>
		</c:choose>
	</c:if>
	
      <script type="text/javascript">
        	var mOver = 'nav-link link-dark'
        	var mout = 'active';
        	$('ul li a').on('mouseover',function() {
        		$(this).addClass(mout);
        	});
        	
        	$('ul li a').on('mouseout',function() {
        		$(this).removeClass(mout);
        	});
        </script>


</body>
</html>