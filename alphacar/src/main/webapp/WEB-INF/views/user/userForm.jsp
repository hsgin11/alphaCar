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
		<h3>회원가입</h3>
		<form action="userRegist" method="post">
			<table class="table table-striped table-bordered">
				<tbody>
					<tr>
						<th>아이디</th>
						<td><input type="text" name="userId"
							class="form-control input-sm" required="required"
							pattern="\w{4,}" title="알파벳과 숫자로 4글자 이상 입력"></td>
					<tr>
						<th>비밀번호</th>
						<td><input type="password" name="userPassword"
							class="form-control input-sm" required="required"
							pattern="\w{4,}" title="알파벳과 숫자로 4글자 이상 입력"></td>
					</tr>
					<tr>
						<th>회원명</th>
						<td><input type="text" name="userName"
							class="form-control input-sm" required="required"
							pattern="[가-힣]{2,}" title="한글로 2글자 이상 입력"></td>
					</tr>
					<tr>
						<th>구분</th>
						<td><input type="text" name="userRole"
							class="form-control input-sm"></td>
					</tr>
					<tr>
						<th>등록일</th>
						<td><input type="date" name="userRegDate"
							class="form-control input-sm"></td>
					</tr>
					<tr>
						<th>나이</th>
						<td><input type="text" name="userAge"
							class="form-control input-sm"></td>
					</tr>
					<tr>
						<th>성</th>
						<td><input type="text" name="userGender"
							class="form-control input-sm"></td>
					</tr>
				</tbody>
				<tr>
					<td colspan="2">
						<button type="submit" class="btn btn-primary">
							<span class="glyphicon glyphicon-home" aria-hidden="true"></span>
							&nbsp;회원가입
						</button> <a href="userList.wow" class="btn btn-info btn-sm"> <span
							class="glyphicon glyphicon-th-list" aria-hidden="true"></span>
							&nbsp;목록
					</a>
					</td>
				</tr>

			</table>
		</form>
	</div>


</body>
</html>