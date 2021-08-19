<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%request.setCharacterEncoding("UTF-8"); %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<%@include file="/WEB-INF/inc/header.jsp" %>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 알파카 css -->
     <link href="<%=request.getContextPath() %>/resources/alphacarCss/alphacar.css" rel="stylesheet">  
</head>
<body>
<!-- 04includeFile -->
<%@include file="/WEB-INF/inc/top.jsp" %>

<div style="margin-top: 30px">
<c:if test="${1 eq 1 }">
	<c:choose>
		<c:when test="${board eq null }">
			<form action="infoBoardRegist" method="POST" name="infoBoard">
				<input type="hidden" name="infoBoardWriterId" value="${sessionScope.USER_INFO.userId }">
				<input type="hidden" name="infoBoardWriter" value="${sessionScope.USER_INFO.userName }">
		</c:when>
		<c:otherwise>
			<form action="infoBoardModify" method="POST" name="infoBoard">
				<input type="hidden" name="infoBoardNo" value="${board.infoBoardNo }">
				<input type="hidden" name="infoBoardWriterId" value="${board.infoBoardWriterId }">
				<input type="hidden" name="infoBoardWriter" value="${board.infoBoardWriter }">
		</c:otherwise>
	</c:choose>
</c:if>
	<div class="row">
		<%@include file="/WEB-INF/inc/sidebarsQ.jsp" %>
		<div class="col-sm-6">
			<div class="row write-header">
				<div class="col-sm-8">
					<h2>글쓰기</h2>
				</div>
				<div class="col-sm-4 d-flex flex-row-reverse bd-highlight">
					<button class="a-btn" style="margin-bottom: 10px;">등록</button>
					<c:if test="${sessionScope.USER_INFO.userRole eq 'admin' }">
						<input type="checkbox" name="infoNoticeYn" value="Y" class="btn-check" id="btncheck1" autocomplete="off">
	  					<label class="btn btn-outline-primary" for="btncheck1">공지사항</label>
					</c:if>
				</div>
				
				
			</div>
			<hr>
			<div class="row write-body">
				<div class="col-sm-12" style="margin-bottom: 50px" >
					<input class="form-control" type="text" name="infoBoardTitle" placeholder="제목을 입력해 주세요." value="${board.infoBoardTitle }">
				</div>
				<div>
					  <textarea name="infoBoardContent" class="form-control" placeholder="Leave a comment here" style="height: 300px; padding: 20px">${board.infoBoardContent }</textarea>
				</div>
			</div>
		</div>
		<div class="col-sm-2"></div> 
	</div>
	</form>
</div>


</body>
</html>