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
     
<style type="text/css">

th, td, h2{
	color: black;
}

.title{
	color: black;
	text-decoration: none;
}

</style>
</head> 
<body style="background-color: rgb(255,255,255);"> <!-- class="bg-dark" -->
<%@ include file="/WEB-INF/inc/top.jsp" %>

<div style="margin-top: 30px">
<div class="row">
<div class="col-md-3"></div>
<div class="col-md-6">
<h2>정보 게시판</h2>
	<hr>

	
	
</div>

</div>
<div class="row">


<%@ include file="/WEB-INF/inc/sidebarsQ.jsp" %>
<div class="col-md-6">
	<table class="table">
	<thead>
		<tr>
			<th scope="col" class="">번호</th>
			<th scope="col" class="text-center">제목</th>
			<th scope="col" class="">글쓴이</th>
			<th scope="col" class="">작성일</th>
			<th scope="col" class="">조회수</th>			
		</tr>
	</thead>
	<tbody style="font-size: 13px">
		<c:forEach items="${infoBoardList }" var="board">
			<c:if test="${board.infoNoticeYn eq 'Y'}">
				<tr style="background-color: rgb(233,233,233); color: FF6666;"> 
					<td style="width: 5%; font-size: 12px" class="">${board.infoBoardNo }</td>
					<td style="width: 25%; font-size: 14px; font-weight: bold; color: FF6666" class=""><a href="view?infoBoardNo=${board.infoBoardNo }" class="title">${board.infoBoardTitle }</a></td>
					<td style="width: 10%" class="">${board.infoBoardWriter }</td>
					<td style="width: 10%" class="">${board.infoBoardRegDate }</td>
					<td style="width: 10%" class="">${board.infoBoardHit }</td>
				</tr>
			</c:if>
				<c:if test="${board.infoNoticeYn ne 'Y'}">
					<tr>
						<td style="width: 10%; font-size: 12px" class="">${board.infoBoardNo }</td>
						<td style="width: 20%; font-size: 14px;" class=""><a href="view?infoBoardNo=${board.infoBoardNo }" class="title">${board.infoBoardTitle }</a></td>
						<td style="width: 10%" class="">${board.infoBoardWriter }</td>
						<td style="width: 10%" class="">${board.infoBoardRegDate }</td>
						<td style="width: 10%" class="">${board.infoBoardHit }</td>
					</tr>
				</c:if>			
		</c:forEach>
	</tbody>
	</table>
	<!-- 글쓰기 버튼 -->
	<div class="d-flex flex-row-reverse bd-highlight" style="margin-bottom: 10px">
	<a href="infoBoardForm" class="btn btn-secondary"><i class="bi bi-pencil">&nbsp;</i>글쓰기</a>
	</div>

	<!-- 페이지 -->
	<div style="background-color:rgba(220,220,220,0.3); padding-top: 10px;">
	
	
	<nav aria-label="Page navigation example" class="d-flex justify-content-center">
	  <ul class="pagination1">
	    <li class="page-item"><a class="page-link" href="infoBoardList?curPage=1" data-page="1"><span aria-hidden="true">&laquo;</span></a></li>
	    <c:if test="${searchVO.firstPage ne 1 }">
	    <li class="page-item">
	      <a class="page-link" href="${infoBoardList }?curPage=${searchVO.firstPage - 1}" data-page="${searchVO.firstPage - 1}" aria-label="Previous">
	        <span aria-hidden="true">&lt;</span>
	      </a>
	    </li>
	    </c:if>
	    <c:forEach begin="${searchVO.firstPage }" end="${searchVO.lastPage }" step="1" var="i">
					
						<c:if test="${searchVO.curPage ne i }">
							<li class="pagination1"><a class="pagination1" href="infoBoardList?curPage=${i }" data-page="${i }">${i }</a></li>
						</c:if>	
						<c:if test="${searchVO.curPage eq i }">
							<li class="pagination1 active" aria-current="page"><a class="pagination1 active" href="#">${i }</a></li>
						</c:if>
					</c:forEach>
		<c:if test="${searchVO.lastPage ne searchVO.totalPageCount }">
	    <li class="page-item">
	      <a class="page-link" href="infoBoardList?curPage=${searchVO.lastPage + 1}" data-page="${searchVO.lastPage + 1}" aria-label="Next">
	        <span aria-hidden="true">&gt;</span>
	      </a>
	    </li>
	    </c:if>
	    <li class="page-item"><a class="page-link" href="infoBoardList?curPage=${searchVO.totalPageCount}" data-page="${searchVO.totalPageCount}"><span aria-hidden="true">&raquo;</span></a></li>
	  </ul>
	</nav>
	<hr style="margin-top: 10px;">
	<!-- START : 검색 폼  -->
		<div class="panel panel-default" style="padding-bottom: 15px">
			<div class="panel-body">
				<form name="search" action="infoBoardList" method="post" class="form-horizontal">
					<input type="hidden" name="curPage" value="${searchVO.curPage }"> <input type="hidden" name="rowSizePerPage" value="${searchVO.rowSizePerPage }">
					<div class="row form-group">
						<div class="col-sm-2"></div>
						<div class="col-sm-2">
							<select id="id_searchType" name="searchType" class="form-control input-sm">
								<option value="T" ${searchVO.searchType eq "T" ? "selected='selected'" : ""}>제목</option>
								<option value="W" ${searchVO.searchType eq "W" ? "selected='selected'" : ""} >작성자</option>
								<option value="C" ${searchVO.searchType eq "C" ? "selected='selected'" : ""}>내용</option>
							</select>
						</div>
						<div class="col-sm-4">
							<input type="text" name="searchWord" class="form-control input-sm" value="${searchVO.searchWord }" placeholder="검색어를 입력하세요">
						</div>		
						<div class="col-sm-2 text-right">
							<div>
							<button type="submit" class="btn-search">								
							<img class="search-img" src="<%= request.getContextPath() %>/images/logo/search2.png">
							</button>
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
		<!-- END : 검색 폼  -->
	</div>
	</div>
</div>
</div>

</body>

</html>