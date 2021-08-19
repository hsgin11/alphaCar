<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%request.setCharacterEncoding("UTF-8"); %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="/WEB-INF/inc/header.jsp" %>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
</head>
<body>
<!-- 04includeFile -->
<%@include file="/WEB-INF/inc/top.jsp" %>
<div id="tabs-1">
			<table class="table" id="table2">
			<thead>
				<tr>
					<td class="text-center">글번호</td>
					<td class="text-center">제목</td>
					<td class="text-center">작성자</td>
					<td class="text-center">조회수</td>
				</tr>
			</thead>
			<tbody id="table-body2">
			</tbody>
			</table>
		</div>

</body>
<script type="text/javascript">
	function notice_list() {
		
	}




</script>
</html>











