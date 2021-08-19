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
<!-- 알파카 css -->
     <link href="<%=request.getContextPath() %>/resources/alphacarCss/alphacar.css" rel="stylesheet">  
     
<style type="text/css">

table.type03 {
  border-collapse: collapse;  
  text-align: left;
  line-height: 1.5;
  border-top: 1px solid #ccc;
  border-left: 3px solid #c0c0c0;
  margin : 20px 10px;
  margin-left: auto; margin-right: auto;
}
table.type03 th {
  width: 250px;
  padding: 10px;
  font-weight: bold;
  vertical-align: top;
  text-align:center;
  color: black;
  border-right: 1px solid #ccc;
  border-bottom: 1px solid #ccc;

}
table.type03 td {
  width: 75%;
  padding: 10px;
  vertical-align: top;
  border-right: 1px solid #ccc;
  border-bottom: 1px solid #ccc;
}


</style>
</head>
<body>
	<%@include file="/WEB-INF/inc/top.jsp"%>
	<div class="container">
	<h1 style="padding: 10px;">내 정보 수정</h1>
		<p>변경할 정보를 입력 후 저장하세요.<br><br>
		비밀번호 등 개인정보는 절대 타인에게 노출되지 않도록 주의하세요.</p>
	<hr>
	<form:form action="userModify" method="post" modelAttribute="user">

		<table class="type03">
			<tbody>
				<tr>
					<th>아이디</th>
					<td>${user.userId }<form:hidden path="userId" /> <form:errors
							path="userId" />
					</td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td><form:password path="userPassword"
							cssClass="form-control input-sm" /> <form:errors
							path="userPassword" /></td>
				</tr>
					<tr>
					<th>비밀번호 확인</th>
					<td><form:password path=""	cssClass="form-control input-sm" />
				</tr>
				<tr>
					<th>회원명</th>
					<td><form:input path="userName"
							cssClass="form-control input-sm" /> <form:errors path="userName" />
					</td>
				</tr>
				<tr>
					<th>이메일</th>
					<td><form:input path="userEmail"
							cssClass="form-control input-sm" /> <form:errors path="userEmail" />
					</td>
				</tr>

				<tr>
					<th>구분</th>
					<td><form:input path="userRole"
							cssClass="form-control input-sm" /> <form:errors path="userName" />
					</td>
				<tr>
					<th>등록일</th>
					<td><input type="date" name="userRegDate"
						class="form-control input-sm" value='${user.userRegDate }'>
					</td>
				</tr>
				<tr>
					<th>연령</th>
					<td><form:input path="userAge"
							cssClass="form-control input-sm" /> <form:errors path="userAge" />
					</td>
				</tr>
				<tr>
					<th>성별</th>
					<td><form:input path="userGender"
							cssClass="form-control input-sm" /> <form:errors path="userGender" />
					</td>
				</tr>

			</tbody>

		</table>
		<div class="row">
		<div class="col-md-1"></div>
		<div class="col-md-2">
			<div class="d-flex flex-row bd-highlight mb-3">
			  <div class="p-2 bd-highlight">
				<a href="javascript:window.history.back();" class="btn btn-secondary" style="border-radius: 7px;">
					<i class="bi bi-backspace">&nbsp;</i><span>이전</span>
				</a>
			  </div>
			</div>
		</div>
		<div class="col-md-6"></div>
		<div class="col-md-2">
			<div class="d-flex flex-row-reverse bd-highlight">
			 <div class="p-2 bd-highlight">
				<button type="submit" class="a-btn" style="border: none;">
					<i class="bi bi-save">&nbsp;</i><span>저장</span>
				</button>
			</div>  			
			</div>
		</div>
		</div>
	</form:form>
	</div>
</body>
</html>