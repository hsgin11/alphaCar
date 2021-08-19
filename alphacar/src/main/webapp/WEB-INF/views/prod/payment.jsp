<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%request.setCharacterEncoding("UTF-8"); %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<%@include file="/WEB-INF/inc/header.jsp" %>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
.payment{
	background: rgb(76,76,79);
	margin: 30px;
	color: rgb(232,193,147);
	padding: 0;
}
.div1{
	padding: 20px;
	font-size: 18px;
}

</style>
</head>
<body>
<!-- 04includeFile -->
<%@include file="/WEB-INF/inc/top.jsp" %>
<div class="row">
<div class="col-md-3"></div>
<div class="col-md-6">
<h2 style="padding: 10px;">결제 상태</h2>
	<hr class="dropdown-divider">	
</div>
</div>

<div class="row">
	<div class="col-md-3"></div>
	<div class="col-md-6 payment">
	<div>
		<img class="img-thum" alt="" src="<%=request.getContextPath()%>/images/logo/banner.png">
		<img class="img-thum" alt="" src="<%=request.getContextPath()%>/images/logo/banner.png" style="transform:rotate(90deg); float: right;">
	</div>
		<h1 style="text-align: center;">결제가 완료되었습니다</h1>
		<h5 style="text-align: center;">알파카를 이용해 주셔서 감사합니다</h5>
		<hr>
		<p style="text-align: center; font-size: 40px; margin-bottom: 40px;">주문 상세</p>
		<div class="col">
			<div class="row" id="prodName">
				<div class="col-md-2"></div>
				<div class="div1 col-md-3">
				상품 명 
				</div>
				<div class="div1 col-md-6">
				  ${order[0].prodName} <c:if test="${order.size() > 1 }"> 외 ${order.size()-1}개</c:if>
				</div>			
			</div>
			<div class="row" id="payMent">
				<div class="col-md-2"></div>
				<div class="div1 col-md-3">
				결제 금액  
				</div>
				<div class="div1 col-md-6">
				${sumPrice }
				</div>
			</div>
		</div>
		<div style="float: right; padding: 30px;">
			<a href="prodlist" class="btn btn-secondary">더 둘러보기</a>			
		</div>
	</div>	
</div>







</body>
</html>