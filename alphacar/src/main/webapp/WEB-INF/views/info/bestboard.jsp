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
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>

</head>
<body>
	<%@include file="/WEB-INF/inc/top.jsp"%>
		<div id="tabs-1">
			<table class="table" id="table1">
			<thead>
				<tr>
					<td class="text-center">글번호</td>
					<td class="text-center">제목</td>
					<td class="text-center">작성자</td>
					<td class="text-center">조회수</td>
				</tr>
			</thead>
			<tbody id="table-body">
			</tbody>
			</table>
		</div>
		
	


</body>

<script type="text/javascript">
	function best_list() {
		$.ajax({
			type : "post",
			url : "<c:url value='/infobestboard'/>",
			dataType : "JSON",
			success : function(data) {
				//console.log(data.data)
				$div = $("#table-body");
				var str = '';
				$.each(data.data, function(index, element) {
					//console.log(element.infoBoardNo);

					str += '<tr>';
					str += '<td>' + element.infoBoardNo + '</td>';					
					str += '<td><a href="view?infoBoardNo='+ element.infoBoardNo+'">' + element.infoBoardTitle + '</a>';
					if(element.infoBoardHit >= 50){
					str += '<span class="hit"> hot!!!</span>';	
					}
					str +=	'</td>';
					str += '<td>' + element.infoBoardWriter + '</td>';
					str += '<td>' + element.infoBoardHit + '</td>';
					str += '</tr>';
				});
				$div.append(str);
			}
		})
	}
	best_list();
</script>

</html>