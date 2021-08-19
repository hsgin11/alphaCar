<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<%request.setCharacterEncoding("UTF-8"); %>
<html>
<head>

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>



            <div class="container p-3 mb-2 border">
              <div class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">
                <ul class="nav col-12 col-lg-auto me-lg-auto mb-2 justify-content-center mb-md-0">
                  <li><a href="#" class="d-block link-dark text-decoration-none">home&nbsp;</a></li>
                  <span><i class="bi bi-chevron-right"></i></span>
                  <li> <a href="#" class="d-block link-dark text-decoration-none dropdown-toggle" id="dropdownUser1" data-bs-toggle="dropdown" aria-expanded="false">
                    카테고리
                  </a>
                  <ul class="dropdown-menu text-small" aria-labelledby="dropdownUser1">
                    <li><a class="dropdown-mylist" href="#">New project...</a></li>
                    <li><a class="dropdown-mylist" href="#">Settings</a></li>
                    <li><a class="dropdown-mylist" href="#">Profile</a></li>
                    <li><hr class="dropdown-divider"></li>
                    <li><a class="dropdown-mylist" href="#">Sign out</a></li>
                  </ul></li>
                  <span><i class="bi bi-chevron-right"></i></span>
                  
                  <li> <a href="#" class="d-block link-dark text-decoration-none dropdown-toggle" id="dropdownUser1" data-bs-toggle="dropdown" aria-expanded="false">
                    카테고리
                  </a>
                 <ul class="dropdown-menu text-small" aria-labelledby="dropdownUser1">
                <li><a class="dropdown-mylist" href="/alphacar/mypage">마이페이지</a></li>
                <li><a class="dropdown-mylist" href="#">내 정보 수정</a></li>
                <li><a class="dropdown-mylist" href="#">차량 관리</a></li>
                <li><hr style="color: rgb(232,193,147);"></li>
                <li><a class="dropdown-mylist" href="#">로그아웃</a></li>
                     
                  </ul></li>
                  <li> <a href="#" class="d-block link-dark text-decoration-none dropdown-toggle" id="dropdownUser1" data-bs-toggle="dropdown" aria-expanded="false">
                  <span><i class="bi bi-chevron-right"></i></span>
                    카테고리
                  </a>
                  <ul class="dropdown-menu text-small" aria-labelledby="dropdownUser1">
                    <li><a class="dropdown-mylist" href="#">New project...</a></li>
                    <li><a class="dropdown-mylist" href="#">Settings</a></li>
                    <li><a class="dropdown-mylist" href="#">Profile</a></li>
                    <li><hr class="dropdown-divider"></li>
                    <li><a class="dropdown-mylist" href="#">Sign out</a></li>
                  </ul></li>
                </ul>
        
               <!--  <form class="col-12 col-lg-auto mb-3 mb-lg-0 me-lg-3">
                  <input type="search" class="form-control" placeholder="Search..." aria-label="Search">
                </form> -->
        
              </div>
            </div>


</body>
</html>