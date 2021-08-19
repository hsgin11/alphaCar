<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/inc/header.jsp"%>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 알파카 css -->
     <link href="<%=request.getContextPath() %>/resources/alphacarCss/alphacar.css" rel="stylesheet">  
     
<style type="text/css">
.inpo{
	margin-left: 100px;
}
.td1{
	width: 150px;
}
.tb{
	padding: 10px;
}
</style>
</head>
<body>
	<%@ include file="/WEB-INF/inc/top.jsp"%>
	<%@include file="/WEB-INF/inc/sidebars.jsp"%>
	<!-- 주문 상세 보기 -->
	<div class="container">
		<h1 style="padding: 10px;">주문 관리</h1>

		<div class="row tb">
			<div class="col-md-2"></div>
			<div class="col-md-6">
				<h3>상품 정보</h3>
				<table class="table">
					<tbody>
						<tr>
							<td class="td1">상품번호</td>
							<td>${order.prodNo }</td>
						</tr>
						<tr>
							<td class="td1">상품명</td>
							<td>${order.prodName }</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
		
		<div class="row tb">
			<div class="col-md-2"></div>
			<div class="col-md-6">
				<h3>주문 정보</h3>
				<table class="table">
					<tbody>
						<tr>
							<td class="td1">주문 번호</td>
							<td>{order.orderNo }</td>
						</tr>
						<tr>
							<td class="td1">주문 개수</td>
							<td>${order.prodQty }</td>
						</tr>
						<tr>
							<td class="td1">주문 총액</td>
							<td>${order.orderPrice }</td>
						</tr>
						<tr>
							<td class="td1">주문 일시</td>
							<td>${order.orderDate }</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
		
		<div class="row tb">
			<div class="col-md-2"></div>
			<div class="col-md-6">
				<h3>배송 정보</h3>
				<table class="table">
					<tbody>
						<tr>
							<td class="td1">주문자</td>
							<td>${order.userId }</td>
						</tr>
						<tr>
							<td class="td1">주문자 메일</td>
							<td>${order.userMail }</td>
						</tr>
						<tr>
							<td class="td1">배송지 주소</td>
							<td>${order.orderZipCode }/${order.orderAddress }/
				${order.orderAddressDetail }</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
		<div class="row" style="height: 50px;">
			<div class="col-md-2"></div>
			<div class="col-md-6">
				<a href="/alphacar/seller/orderlist?sellerId=${sessionScope.USER_INFO.userId}" class="a-btn">
			                    <i class="bi bi-reply-fill"></i>&nbsp;뒤로가기</a>
			</div>
		</div>		
	</div>



</body>
</html>