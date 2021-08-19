<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
 <%request.setCharacterEncoding("utf-8"); %>
<html>
<head>
<%@include file="/WEB-INF/inc/header.jsp" %>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@include file="/WEB-INF/inc/top.jsp" %>
<div class="container">
	<h3>회원목록</h3>
	<table class = "table table-striped table-bordered">
	<caption class="hidden">회원목록 조회</caption>
	<colgroup>
		<col style="width: 15%" />
	
		<col style="width: 20%" />
		<col style="width: 20%" />
		<col style="width: 15%" />
		<col style="width: 15%" />
		<col style="width: 15%" />
	</colgroup>
	<thead>
		<tr>
		<th>ID</th>
		<th>회원명</th>
		<th>등록일</th>
		<th>나이</th>
		<th>성별</th>
		<th>이메일</th>
		</tr>
		</thead>
	<tbody>
		<c:forEach items="${userList }" var="user">
		<tr>
		<td>${user.userId }</td>
		<td><a href="userView?userId=${user.userId }">
		${user.userName }</a></td>
		<td>${user.userRegDate }</td>
		<td>${user.userAge }</td>
		<td>${user.userGender }</td>
		<td>${user.userEmail }</td>
		</tr>
		</c:forEach>
	</tbody>
	</table>
</div>


</body>
</html>