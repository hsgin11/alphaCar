<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<%request.setCharacterEncoding("UTF-8"); %>
<html>
<head>
<%@include file="/WEB-INF/inc/header.jsp" %>
<meta charset="UTF-8">
<title>Insert title here</title>
 	<!-- 알파카 css -->
     <link href="<%=request.getContextPath() %>/resources/alphacarCss/alphacar.css" rel="stylesheet">  
<style type="text/css">



</style>
</head>
<body>
<%@include file="/WEB-INF/inc/top.jsp" %>
<%@include file="/WEB-INF/inc/sidebars.jsp" %>
	<div class="container">
		<h2 style="padding: 10px;">${sessionScope.USER_INFO.userName}님의 페이지 </h2>
		<hr>
		<table class="table">
		<i class="bi bi-newspaper" >판매목록리스트</i>
  <thead>
    <tr>
      <th scope="col">번호</th>
      <th scope="col">상품이미지</th>
      <th scope="col">상품명</th>
      <th scope="col" colspan="2">가격</th>
    </tr>
  </thead>
  <tbody>
  <c:forEach items="${prodSellerList}" var="prod">
    <tr>
      <th scope="row">${prod.prodNo} </th>
      <td><img style="width: 30px; height: 30px" src="<c:url value="/images/${prod.prodCategory }/${prod.prodFileName }"/>" alt="..." /></td>
      <td>${prod.prodName} </td>
      <td>${prod.prodPrice}원</td>
      <td><span style="text-align: right;"><a style="background-color: #FA5858; border:1px solid; border-radius: 0.8em;" class="btn btn-sm btn-danger" href="seller/delete?prodNo=${prod.prodNo }"><i class="bi bi-trash"></i><span></span></a></span></td>
      
    </tr>
  	
  </c:forEach>

  </tbody>
</table>
	<nav aria-label="Page navigation example" class="d-flex justify-content-center">
	  <ul class="pagination1"> 
	    <li class="page-item"><a class="page-link" href="seller?curPage=1<c:if test="${searchVO.searchCategory ne null }">&searchCategory=${searchVO.searchCategory }</c:if>" data-page="1"><span aria-hidden="true">&laquo;</span></a></li>
	    <c:if test="${searchVO.firstPage ne 1 }">
	    <li class="page-item">
	      <a class="page-link" href="${linkPage }?curPage=${searchVO.firstPage - 1}<c:if test="${searchVO.searchCategory ne null }">&searchCategory=${searchVO.searchCategory }</c:if>" data-page="${searchVO.firstPage - 1}" aria-label="Previous">
	        <span aria-hidden="true">&lt;</span>
	      </a>
	    </li>
	    </c:if>
	    <c:forEach begin="${searchVO.firstPage }" end="${searchVO.lastPage }" step="1" var="i">
					
						<c:if test="${searchVO.curPage ne i }">
							<li class="page-item"><a class="pagination1" href="seller?curPage=${i }<c:if test="${searchVO.searchCategory ne null }">&searchCategory=${searchVO.searchCategory }</c:if>" data-page="${i }">${i }</a></li>
						</c:if>	
						<c:if test="${searchVO.curPage eq i }">
							<li class="page-item active" aria-current="page"><a class="pagination1 active" href="#">${i }</a></li>
						</c:if>
					</c:forEach> 
		<c:if test="${searchVO.lastPage ne searchVO.totalPageCount }">
	    <li class="page-item">
	      <a class="page-link" href="seller?curPage=${searchVO.lastPage + 1}<c:if test="${searchVO.searchCategory ne null }">&searchCategory=${searchVO.searchCategory }</c:if>" data-page="${searchVO.lastPage + 1}" aria-label="Next">
	        <span aria-hidden="true">&gt;</span>
	      </a>
	    </li>
	    </c:if>
	    <li class="page-item"><a class="page-link" href="seller?curPage=${searchVO.totalPageCount}<c:if test="${searchCategory ne null }">&searchCategory=${searchVO.searchCategory }</c:if>" data-page="${searchVO.totalPageCount}"><span aria-hidden="true">&raquo;</span></a></li>
	  </ul>
	</nav>
	</div>

</body>
</html>