<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<%
request.setCharacterEncoding("utf-8");
%>
<html>
<head>
<%@include file="/WEB-INF/inc/header.jsp"%>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@include file="/WEB-INF/inc/top.jsp"%>
	<div class="container">
		<h3>수정</h3>
		<form:form action="sellerEdit" method="post">
			<table class="table table-striped table-bordered">
				<tbody>
					<tr>
						<th>번호</th>
						<td>${prod.prodNo }
						</td>
					</tr>
					<tr>
						<th>상품명</th>
						<td><input type="text" name="prodName" class="form-control input-sm"></td>
					</tr>
					<tr>
						<th>상품가격</th>
						<td><input type="text" name="prodPrice" class="form-contol input-sm"></td>
					</tr>
					<tr>
						<th>카테고리</th>
						<td><select name="prodCategory">
								<option value="">상품카테고리</option>
								<option value="oil">오일류</option>
								<option value="indoor">실내용품</option>
								<option value="importedCar">차량부품</option>
								<option value="sale">세일상품</option>
								<option value="safe">안전용품</option>
								<option value="phone">휴대폰용품</option>
								<option value="outdoor">실외용품</option>
								<option value="DIY">제작용품</option>
								<option value="tuning">튜닝용품</option>
								<option value="wash">새차용품</option>
								<option value="aeroParts">에어로파츠</option>
						</select></td>
					</tr>

				</tbody>
				<tr>
					<td colspan="2">
						<button type="submit" class="btn btn-primary">
							<span class="glyphicon glyphicon-home" aria-hidden="true"></span>
							&nbsp;수정
						</button>
			</table>
		</form:form>
	</div>


</body>
</html>