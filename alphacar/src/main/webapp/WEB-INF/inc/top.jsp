<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style type="text/css">
.menu{
	color: #c0c0c0;
 	padding: 0.5rem 3rem;	
	text-decoration: none;
	transition: color 0.15s ease-in-out, background-color 0.15s ease-in-out, border-color 0.15s ease-in-out;
	text-align: center; 	
}
.header-logo{
	text-align: center;
}
.a-color:hover{
	color: rgb(232,193,147);
}

.dropdown{
	position: absolute;
  z-index: 1000;
  display: none;
  min-width: 10rem;
  padding: 0.5rem 0;
  margin: 0;
  font-size: 1rem;
  color: #212529;
  text-align: left;
  list-style: none;
  background-color: rgb(46,46,49);
  background-clip: padding-box;
  border: 1px solid rgba(0, 0, 0, 0.15);
  border-radius: 0.25rem;
}

.dropdown-mylist{  
  display: block;
  width: 100%;
  padding: 0.25rem 1rem;
  clear: both;
  font-weight: 400;
  color: #c0c0c0;
  text-align: inherit;
  text-decoration: none;
  white-space: nowrap;
  background-color: rgb(46,46,49);
  border: 0;
}

/* search */

.searchform {  
  margin-bottom: 25px;
  overflow: hidden;
  width: 50%;
  display:inline-block;
  
}

.input1[type="text"] {
  color: #c0c0c0;
  border: 2px solid #737373;
  border-radius:25px;
  background-color: transparent;
  font: 18px "Open Sans", sans-serif;
  padding: 0.125em 0.225em;
  width: 80%;
  float: none;
  text-align: center;
}
.input1[type="text"]:focus {
  color: rgb(232,193,147);
  border-color: rgb(232,193,147);
  outline: none;
  transition: color 0.15s ease-in-out, background-color 0.15s ease-in-out, border-color 0.15s ease-in-out;
}
.search_btn_ok{
    background-color: transparent; /* make the button transparent */
    background-repeat: no-repeat;  /* make the background image appear only once */
    background-position: 0px 0px;  /* equivalent to 'top left' */
    border: none;           /* assuming we don't want any borders */
    cursor: pointer;        /* make the cursor like hovering over an <a> element */
    height: 16px;           /* make this the size of your image */
    padding-left: 3px;     /* make text start to the right of the image */
    
    
}
#search_img{
 height: 20px;           /* make this the size of your image */
 margin-bottom: 7px; 
}
</style>
<header class="p-3 mb-3 border-bottom bg-dark">

	<div class="header-logo"> <a href="/alphacar"><img style="width: 10%; "  src="<%=request.getContextPath() %>/resources/logo/logo4.png" alt=""> </a></div>
	
<!--				    	===========search============							 -->
        <div class="container">       
<div style=" height:70px; text-align: center;">
	<form class="searchform group" action="prodlist" name="search" method="post">	
	  <label for="search-box">
	    <span class="fa fa-2x fa-search"></span>
	  </label>	  
	  <input class="input1" type="text" id="search-box" value="${searchVO.searchWord }" name="searchWord" placeholder="상품을 검색하세요.">
	  <button class="search_btn_ok" type="submit"><img id="search_img" src="<%= request.getContextPath() %>/resources/logo/search.png"></button>	  	    
	</form>
	
</div>
          <div class="row"> 
          <div class="col-md-2">
          </div>           
         
            <ul class="nav col-8 justify-content-center mb-md-0" >              
              <li><a href="/alphacar/prodlist" class="menu a-color">Shop</a></li>
              <li><a href="/alphacar/infoBoardList" class="menu a-color">InfoBoard</a></li>
              <li><a href="/alphacar/questionboard" class="menu a-color">QnA</a></li>
              <c:if test="${sessionScope.USER_INFO eq null }">
              <li><a href="/alphacar/login" class="menu a-color">Login & Sign</a></li>
              </c:if>
              <c:if test="${sessionScope.USER_INFO ne null }">
              <li><a href="/alphacar/logout" class="menu a-color">Logout</a></li>
              </c:if>                     
            </ul>    
                          
               <c:if test="${sessionScope.USER_INFO ne null }">
               <c:choose>
               	<c:when test="${sessionScope.USER_INFO.userRole eq 'seller'}">
               <div class="col-md-2 d-flex justify-content-center">
              <a href="#" class="d-block link-light2 text-decoration-none dropdown-toggle a-color" id="dropdownUser1" data-bs-toggle="dropdown" aria-expanded="false">
               <span style="font-size: 15px; color: rgb(232,193,147);">${sessionScope.USER_INFO.userName }님, 환영합니다.</span>
                <img src="${sessionScope.CAR_INFO.carImageUrl }" alt="mdo" width="50" height="20" class="">
              </a>              
              <ul class="dropdown-menu text-small" style="background-color: rgb(46,46,49);" aria-labelledby="dropdownUser1">
                <li><a class="dropdown-mylist a-color" href="/alphacar/seller?userId=${sessionScope.USER_INFO.userId }">판매자페이지</a></li>
                <li><a class="dropdown-mylist a-color" href="/alphacar/seller/regist?userId=${sessionScope.USER_INFO.userId }">판매등록하기</a></li>
                <li><a class="dropdown-mylist a-color" href="/alphacar/user/userView?userId=${sessionScope.USER_INFO.userId }">판매자정보수정</a></li>
                <li><hr style="color: rgb(232,193,147);"></li>
                <li><a class="dropdown-mylist a-color" href="/alphacar/logout">로그아웃</a></li>
              </ul>            
               </div>  
               	</c:when>
             		<c:when test="${sessionScope.USER_INFO.userRole eq 'admin' }">
             			<div class="col-md-2 d-flex justify-content-center">
			              <a href="#" class="d-block link-light2 text-decoration-none dropdown-toggle a-color" id="dropdownUser1" data-bs-toggle="dropdown" aria-expanded="false">
			               <span style="font-size: 15px; color: rgb(232,193,147);">관리자로 접속하셨습니다.</span>
			              </a>              
			              <ul class="dropdown-menu text-small" style="background-color: rgb(46,46,49);" aria-labelledby="dropdownUser1">
			                <li><a class="dropdown-mylist a-color" href="/alphacar/user/userList">사용자 정보 확인</a></li>
			                <li><hr style="color: rgb(232,193,147);"></li>
			                <li><a class="dropdown-mylist a-color" href="/alphacar/logout">로그아웃</a></li>
			              </ul>            
		               </div>
             		</c:when>
                 <c:otherwise>
                <div class="col-md-2 d-flex justify-content-center">
              <a href="#" class="d-block link-light2 text-decoration-none dropdown-toggle a-color" id="dropdownUser1" data-bs-toggle="dropdown" aria-expanded="false">
               <span style="font-size: 15px; color: rgb(232,193,147);">${sessionScope.USER_INFO.userName }님, 환영합니다.</span>
                <img src="${sessionScope.CAR_INFO.carImageUrl }" alt="mdo" width="50" height="20" class="">
              </a>              
              <ul class="dropdown-menu text-small" style="background-color: rgb(46,46,49);" aria-labelledby="dropdownUser1">
                <li><a class="dropdown-mylist a-color" href="/alphacar/mypage?userId=${sessionScope.USER_INFO.userId }">마이페이지</a></li>
                <li><a class="dropdown-mylist a-color" href="/alphacar/user/userView?userId=${sessionScope.USER_INFO.userId }">내 정보 수정</a></li>
                <li><a class="dropdown-mylist a-color" href="/alphacar/mycar?userId=${sessionScope.USER_INFO.userId }">차량 관리</a></li>
                <li><hr style="color: rgb(232,193,147);"></li>
                <li><a class="dropdown-mylist a-color" href="/alphacar/logout">로그아웃</a></li>
              </ul>            
               </div>       
                 </c:otherwise>
                  </c:choose>
              </c:if>
            
              
          </div>
        </div>
        
        <script type="text/javascript">
        var main = function() {
        	  /* Push the body and the nav over by 285px over */
        	  var isOpened = false;

        	  $('.menu').on("mouseover", function() {
        	    clearInterval(walk_through);
        	  });

        	  $('.icon-menu').on("mouseover", function() {
        	    clearInterval(walk_through);
        	  });
        	  $('.icon-menu').click(function() {
        	    isOpened = true;

        	    $('.menu').animate({
        	      left: "0px"
        	    }, 200);

        	    $('body').animate({
        	      left: "285px"
        	    }, 200);
        	  });

        	  /* Then push them back */
        	  $('.icon-close').on("mouseover", function() {
        	    clearInterval(walk_through);
        	  });
        	  $('.icon-close').click(function() {
        	    isOpened = false;

        	    $('.menu').animate({
        	      left: "-285px"
        	    }, 200);

        	    $('body').animate({
        	      left: "0px"
        	    }, 200);
        	  });

        	  // Walkthrough the menu
        	  var walk_through = setInterval(function() {
        	      if (!isOpened){
        	        $('.icon-menu').trigger('click');
        	      }
        	      else if (isOpened){
        	        $('.icon-close').trigger('click');
        	      }
        	    }, 3000);
        	};

        	$(document).ready(main);
        	
        	
        	
        	
        	
        </script>
      </header>