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
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
</head>
<body>
<%@include file="/WEB-INF/inc/top.jsp" %>
<div id="tabs-1">
	<table class="table" id="table1">
	<thead>
	<tr>
		<th>제목</th>
	</tr>
	</thead>
	<tbody id="table-body">
	</tbody>
	</table>
</div>


</body>

<script type="text/javascript">
function qna_list() {
	$.ajax({
		type:"post",
		url:"<c:url value='/questlist'/>",
		dataType: "JSON",
		success : function(data){
			$div = $("#table-body");
			var str = '';
			$.each(data.data, function (index, element) {

				str += '<tr>';
				str += '<td><a href="questionview?boNo='+ element.questionBoardNo+'">' + element.questionBoardTitle + '</a>';
				if(element.questionBoardHit >= 50){
				str += '<span class="hit"> hot!!!</span>';		
				}
				str +=	'</td>';
				str += '</tr>';
			});
			$div.append(str)
		} 
	})
}

qna_list();

</script>
</html>