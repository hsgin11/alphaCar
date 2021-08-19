<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
		<div>
			<h3>상품수정</h3>

			<form action="prodEdit" method="post">
				<table class="table table-striped table-bordered">
					<tbody>
						<tr>
							<th>상품이름</th>
							<td>${prod.prodName }</td>
						</tr>

						<tr>
							<th>가격</th>
							<td>${prod.prodPrice }</td>
						</tr>

						<tr>
							<th>카테고리</th>
							<td>${prod.prodCategory }</td>
						</tr>
					</tbody>


				</table>

			</form>

		</div>

	</div>

</body>
</html>