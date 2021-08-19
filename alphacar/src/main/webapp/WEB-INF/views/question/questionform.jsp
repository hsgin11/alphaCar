<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/inc/header.jsp" %>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 알파카 css -->
     <link href="<%=request.getContextPath() %>/resources/alphacarCss/alphacar.css" rel="stylesheet">  
</head>
<body>
<%@ include file="/WEB-INF/inc/top.jsp" %>
<div style="margin-top: 30px">
	<form action="questionregist">
	<c:if test="${1 eq 1 }">
	<c:choose>
		<c:when test="${board eq null }">
			<form action="questionregist" method="POST" name="questionBoard">
		</c:when>
		<c:otherwise>
			<form action="questionmodify" method="POST" name="questionBoard">
				<input type="hidden" name="questionBoardNo" value="${board.questionBoardNo }">
		</c:otherwise>
	</c:choose>
</c:if>
	<div class="row">
		<%@ include file="/WEB-INF/inc/sidebarsQ.jsp" %>
		<div class="col-sm-6">
			<div class="row write-header">
				<div class="col-sm-8">
					<h3>글쓰기</h3>
				</div>
				<div class="col-sm-4 d-flex flex-row-reverse bd-highlight">
					<button class="a-btn" style="margin-bottom: 10px;">등록</button>
					<c:if test="${sessionScope.USER_INFO.userRole eq 'admin' }">
							<input type="checkbox" name="questionNoticeYn" value="Y" class="btn-check" id="btncheck1" autocomplete="off">
		  					<label class="btn btn-outline-primary" for="btncheck1">공지사항</label>
					</c:if>
				</div>
				<input type="hidden" name="questionBoardWriterId" value="${sessionScope.USER_INFO.userId }">
				<input type="hidden" name="questionBoardWriter" value="${sessionScope.USER_INFO.userName }">
			</div>
			<hr>
			<div class="row write-body">
				<div class="col-sm-12" style="margin-bottom: 50px" >
					<input class="form-control" type="text" name="questionBoardTitle" placeholder="제목을 입력해 주세요." value="${board.questionBoardTitle }">
					<br>
					
				</div>
				<div>
					  <textarea name="questionBoardContent" class="form-control" placeholder="Leave a comment here" style="height: 300px; padding: 20px">${board.questionBoardContent }</textarea>
				</div>
			</div>
		</div>
		<div class="col-sm-2"></div> 
	</div>
	</form>
</div>



</body>
</html>