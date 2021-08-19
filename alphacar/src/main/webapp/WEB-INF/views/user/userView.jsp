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
		<h1 style="padding: 10px;">내 정보</h1>
		<p>고객님께서 가입하신 정보 입니다.<br><br>
		AlphaCar는 고객님의 개인정보를 약관 외 내용으로 사용하지 않습니다.</p>
		<hr>
		<table class="type03">
			<tbody> 
				<tr>
					<th>이름</th>
					<td>${user.userName }</td>
				</tr>
				<tr>
					<th>아이디</th>
					<td>${user.userId }</td>
				</tr>
				<tr>
					<th>이메일</th>
					<td>${user.userEmail }</td>
				</tr>
				<tr>
					<th>구분</th>
					<td>${user.userRole }</td>
				</tr>
				<tr>
					<th>등록일</th>
					<td><input type="date" name="regDate"
						class="form-control input-sm" value='${user.userRegDate }'
						readonly="readonly" style="border: none; background-color: transparent;"></td>
				</tr>
				<tr>
					<th>나이</th>
					<td>${user.userAge }</td>
				</tr>
				<tr>
					<th>성별</th>
					<td>${user.userGender }</td>
				</tr>	
			</tbody>
		</table>
		<div class="d-flex flex-row-reverse bd-highlight">
		 	<div class="p-2 bd-highlight">
				<a href='userEdit?userId=${user.userId }'	class="a-btn" style="margin-right: 150px;"> 
					<i class="bi bi-pencil">&nbsp;</i>수정
				</a>
		 	</div>
		 	
		</div>
	</div>
</body>
</html>