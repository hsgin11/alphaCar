<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<%request.setCharacterEncoding("UTF-8"); %>
<html>
<head>

    <!-- sidebars css -->
    <link href="<%=request.getContextPath() %>/resources/bootstrap-5.0.2-dist/css/sidebars.css" rel="stylesheet"> 
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<main>
      
        <div class="d-flex flex-column flex-shrink-0 p-3 " style="width: 280px; margin-top: 30px;">
            <ul class="nav nav-pills flex-column mb-auto">
              <li class="nav-item">
                <a href="/alphacar" class="nav-link link-dark" aria-current="page">
                    <i class="bi bi-house"></i>&nbsp;
                  Home
                </a>
              </li>
              <c:if test="${sessionScope.USER_INFO ne null }">
          			<c:choose>
   						<c:when test="${sessionScope.USER_INFO.userRole eq 'customer' }">
			              <li>
			                <a href="/alphacar/mycar?userId=${sessionScope.USER_INFO.userId }" class="nav-link link-dark">
			                    <i class="bi bi-truck"></i>&nbsp;
			                  My car 관리
			                </a>
			              </li>
			              <li>
			                <a href="#" class="nav-link link-dark">
			                    <i class="bi bi-upc-scan"></i>&nbsp;
			                주문내역
			                </a>
			              </li>
			              <li>
			                <a href="/alphacar/360VR" class="nav-link link-dark">
			                    <i class="bi bi-file-earmark-arrow-up"></i>&nbsp;
			                 360VR관
			                </a>
			              </li>
			              <hr>
			              <li>
			                <a href="/alphacar/user/userView?userId=${sessionScope.USER_INFO.userId }" class="nav-link link-dark">
			                    <i class="bi bi-person-lines-fill"></i>&nbsp;
			                  개인정보 변경
			                </a>
			              </li>
			              <li>
			                <a href="/alphacar/logout" class="nav-link link-dark">
			                    <i class="bi bi-person-check"></i>&nbsp;
			                  계정전환
			                </a>
			              </li>
              		</c:when>
              		<c:otherwise>
              			<li>
			                <a href="/alphacar/seller?userId=${sessionScope.USER_INFO.userId}" class="nav-link link-dark">
			                    <i class="bi bi-truck"></i>&nbsp;상품 목록
			                </a>
			              </li>
			              <li>
			                <a href="/alphacar/seller/regist?userId=${sessionScope.USER_INFO.userId}" class="nav-link link-dark">
			                    <i class="bi bi-upc-scan"></i>&nbsp;상품 등록
			                </a>
			              </li>
			                <li>
			                <a href="/alphacar/seller/orderlist?sellerId=${sessionScope.USER_INFO.userId}" class="nav-link link-dark">
			                    <i class="bi bi-upc-scan"></i>&nbsp;주문 관리
			                </a>
			              </li>
			              <hr>
			              <li>
			                <a href="/alphacar/user/userView?userId=${sessionScope.USER_INFO.userId}" class="nav-link link-dark">
			                    <i class="bi bi-person-lines-fill"></i>&nbsp;
			                  회원 정보
			                </a>
			              </li>
              		</c:otherwise>
              	</c:choose>
              </c:if>
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