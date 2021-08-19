<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<%
request.setCharacterEncoding("UTF-8");
%>
<html>
<head>
<%@include file="/WEB-INF/inc/header.jsp"%>
<link
	href="<%=request.getContextPath()%>/resources/alphacarCss/alphacar.css"
	rel="stylesheet">
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 알파카 css -->
     <link href="<%=request.getContextPath() %>/resources/alphacarCss/alphacar.css" rel="stylesheet">  
    
<style type="text/css">

.order-list{
	padding: 10px; 
	background-color: transparent;
	border: 2px solid;
	border-left-color: #c0c0c0;
	border-right-color: #c0c0c0;
	border-bottom: none;
	border-top: none;
}

</style>
</head>
<body>
	<%@include file="/WEB-INF/inc/top.jsp"%>
	<%@include file="/WEB-INF/inc/sidebars.jsp"%>
	<!-- 받은 주문 목록 -->
	<div class="container">
		<h1 style="padding: 10px;">주문 관리</h1>
		<div class="row text-center">
			<div class="col-md-2" style="margin-bottom: 10px;">주문 번호</div>
			<div class="col-md-8">상품명</div>
			<div class="col-md-2">주문일자</div>
			<hr>
		</div>
		<c:forEach items="${orderList }" var="order">
			<div class="row text-center order-list">				
				<div class="col-md-2" style="background-color: rgb(240,240,240); padding: 5px; border-bottom-left-radius: 1em; border-top-left-radius: 1em;">${order.orderNo }</div>
				<div class="col-md-8" style="background-color: rgb(240,240,240); padding: 5px;"><a href="orderdetail?orderNo=${order.orderNo }" style=" text-decoration: none; c">${order.prodName }</a></div>
				<div class="col-md-2" style="background-color: rgb(240,240,240); padding: 5px; border-top-right-radius: 1em; border-bottom-right-radius: 1em;">${order.orderDate }</div>
			</div>
		</c:forEach>
	</div>




</body>
</html>