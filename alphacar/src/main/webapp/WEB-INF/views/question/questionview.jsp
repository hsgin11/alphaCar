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
   <link href="<%=request.getContextPath() %>/resources/alphacarCss/alphacar.css" rel="stylesheet">  
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<style type="text/css"> 
a { text-decoration:none } 
.a-modify{
	color: gray;
	margin-right: 10px;
	font-weight: bold;
}
</style> 
</head>
<body>
<%@ include file="/WEB-INF/inc/top.jsp" %>



<div style="margin-top: 30px">

<div class="row">
<div class="col-md-3"></div>
<div class="col-md-6">
<h2>문의 게시판</h2>
	<hr>
</div>



<div class="row">


<%@ include file="/WEB-INF/inc/sidebarsQ.jsp" %>
<div class="col-md-6 border" style="padding: 30px;" >
	<div class="content-header">
	  <a href="questionboard">문의 게시판</a>
	  <div class="title">
	  	<h3>${board.questionBoardTitle }</h3>
	  </div>
	 <div class="writer-info row">
	 	<div class="col-md-8 profile">
		 	<div><strong>${board.questionBoardWriter }</strong></div>
		 	<div><span style="color: gray;font-size: 12px">${board.questionBoardRegDate }</span></div>
	 	</div>
		<div class="col-md-2 profile" style="padding-left: 5%">
	 	 	<c:if test="${sessionScope.USER_INFO.userId eq board.questionBoardWriterId or sessionScope.USER_INFO.userRole eq 'admin' }">
				<div class="pull-right">
					<a href="questionform?boNo=${board.questionBoardNo }" class="btn btn-success btn-sm">
						수정
					</a>
					<a href="questionremove?boNo=${board.questionBoardNo }" class="btn btn-sm btn-danger">
						삭제
					</a>	
				</div>
			</c:if> 
 	 	</div>
 	 	<div id="reply-cnt" class="col-md-2 profile">
 	 	</div>
	 </div>
	</div>
	<hr>
	<div class="content-body" style="margin-bottom: 100px">
	 	${board.questionBoardContent }
	</div>
	<div class="content-footer">
		<hr>
		<!-- 댓글 목록 영역 -->
		
		<div id="id_reply_list_area" style="margin-bottom: 10px">
		</div>
		<!-- 댓글 등록 영역 -->
 		<div class="panel panel-default border" style="padding: 20px">
 			<div class="writer-info" style="margin-bottom: 5px"><strong>${sessionScope.USER_INFO.userName}</strong></div>
				<form name="frm_reply" action=""
					method="post" onclick="return false;">
					<input type="hidden" name="reParentNo" value="${board.questionBoardNo }">
					<input type="hidden" name="reCategory" value="question">
					<input type="hidden" name="reMemName" value="${sessionScope.USER_INFO.userName}">
					<div style="margin-bottom: 5px">
						<textarea placeholder="댓글을 입력하세요" rows="1" name="reContent" class="form-control" style="border: 0"></textarea>
					</div>
					<div id="btn_reply_regist" class="d-flex flex-row-reverse bd-highlight"><a href="#">등록</a></div>
				</form>
		</div>
		<br>
		<!-- 댓글 페이징 영역 -->
		<div class="reply-paging">
		
		</div>
		<div class="row" id="reply_utils">
			 
			<div class="col-md-11" style="margin-bottom: 10px"></div>
			<div class="col-md-1" style="margin-bottom: 10px">
				<a href="javascript:window.history.back();" class="a-btn">
			    	목록</a> 
			</div>
		</div>
	</div>
	</div> 
</div>
</div>
</div>
</body>
<script type="text/javascript">

	
	var comCnt = 0;
	// 댓글목록을 구하는 함수
		function fn_reply_list(curPage) {
		// 반족 사용되기 때문에 하나의 function으로 묶었다. ajax에서 요청해 db접근 후 replyVO list를 가져와서 화면에 출력
		// 새로고침하지 않고 바로 화면에 적용
		var params = {"curPage" : curPage, "rowSizePerPage" : 10, "reParentNo" : "${board.questionBoardNo}", "reCategory" : "question"}
		$.ajax({
			 type :"POST"
			,url : "<c:url value='/reply/replyList'/>"
			,dataType : "JSON"// 서버(Controller 메소드 리턴)에서 받을 데이터 타입
			,data : params
			,success : function(data) {
				console.log(data)
				if(data.result){
					console.log(data.searchVO);
					$div=$('#id_reply_list_area');
					$div.html('<div style="margin-bottom: 10px"><strong style="font-size: 20px;">댓글</strong></div>');
					$.each(data.data, function(index, element) {
						
						var str = '';
						str += '<div class="row" data-re-no ='+ element.reNo +'>';
						str +='<div class="" style="margin-bottom: 5px"><strong>'+element.reMemName+'</strong></div>';
						str +='<div class="" style="margin-bottom: 5px">';
						str +='<pre style="margin-bottom: 0">'+element.reContent+'</pre>';
						str +='</div>';
						if(element.reModDate == null){
							str +='<div style="font-size: 12px; margin-bottom: 10px;color: gray;">';							
							str += element.reRegDate + '</div>';							
						}
						str +='<div class="d-flex flex-row-reverse bd-highlight">';
						if(element.reMemId == '${sessionScope.USER_INFO.userId}'){
							str += '<div class="">';
							str += '<button class="btn dropdown-toggle" type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false"></button>';
							str += '<ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">'
							str += '<li><a id="btn_reply_edit" class="dropdown-item">수정</a></li>';
							str += '<li><a id="btn_reply_delete" class="dropdown-item">삭제</a></li>';
							str += '</ul><div>';
						}
						str +='</div>';
						str +='</div></div><hr>';
						
						$div.append(str);
					});
					comCnt = data.count;
					$('#reply-cnt').html('').append('댓글 ' + comCnt);
					
					var page = '<nav aria-label="Page navigation example" class="d-flex justify-content-center">'
						page += '<ul class="pagination1">';
						page += '<li class="page-item"><a class="page-link" href="javascript:fn_reply_list(1)"><span aria-hidden="true">&laquo;</span></a></li>';
						if(data.searchVO.firstPage != 1){
							page += '<li class="page-item">';
							page += '<a class="page-link" href="javascript:fn_reply_list(data.searchVO.firstPage - 1)'+'" aria-label="Previous">';
							page += '<span aria-hidden="true">&lt;</span>';
							page += '</a>';
							page += '</li>';
						}
						for(var i = data.searchVO.firstPage; i <= data.searchVO.lastPage; i++){
							if(data.searchVO.curPage != i){
								page += '<li class="page-item"><a class="pagination1" href="javascript:fn_reply_list('+i+')">'+i+'</a></li>';
							}
							if(data.searchVO.curPage == i){
								page += '<li class="page-item active" aria-current="page"><a class="pagination1 active" href="#">'+i+'</a></li>';
							}
						}
						if(data.searchVO.lastPage != data.searchVO.totalPageCount){
							page += '<li class="page-item">';
							page += '<a class="page-link" href="javascript:fn_reply_list(searchVO.lastPage + 1)"aria-label="Next">';
							page += '<span aria-hidden="true">&gt;</span>';
							page += '</a>';
							page += '</li>';
						}
						page += '<li class="page-item"><a class="page-link" href="javascript:fn_reply_list(searchVO.totalPageCount)"><span aria-hidden="true">&raquo;</span></a></li>';
						page += '</ul>';
						page += '</nav>';
						}
						$('.reply-paging').html('');
						$('.reply-paging').append(page);
				}
			,error :function(e) {
				alert("에러")
			}
		});
	} 
	
		$(document).ready(
				function() {
					$("#btn_reply_regist").click(function(e) {
						// 등록버튼의 상위 div 찾고 , textarea 찾기
						// textarea의 내용, parentNo, Ip, reCategory 파라미터로 넘기기
						// 등록 영역 내용 지우기, 등록된 댓글 바로 적용	
						$btn = $(this);
						$form = $btn.closest('form[name=frm_reply]');
						e.preventDefault();
						if(Swal.fire({
							  icon: 'success',
							  title: '댓글을 등록했습니다.',					  
							})){
							
							
							$.ajax({
								 type : 'POST'
							   	,url : '<c:url value="/reply/replyRegist" />'
							   	,data : $form.serialize()
							   	,dataType:'JSON'
							   	,success: function(data) {
									console.log(data)	
									$textarea = $form.find("textarea[name=reContent]").val('');
									$('#id_reply_list_area').html('');
									fn_reply_list(1);
								}
								,error: function(req, st, err) {
									console.log(req);
									console.log(st);
									console.log(err);
								}
							})	
						}
						
					}); // 등록 버튼 클릭
					
					$('#id_reply_list_area').on('click','#btn_reply_edit', function(e) {
						$btn = $(this);
						$div = $btn.closest('div.row');
						var ori = $div.html();
						
						$pre = $div.find('pre');
						var content = $pre.html();
						var reNo = $div.data('re-no');
						var reMemId = $div.find('strong').html();
						html = '<div class="panel panel-default border" style="padding: 20px">'
						html += '<div class="writer-info" style="margin-bottom: 5px"><strong>${sessionScope.USER_INFO.userId}</strong></div>'
						html += '<form name="modify" action=""'
						html += 'method="post" onclick="return false;">'
						html += '<input type="hidden" name="reParentNo" value="${board.questionBoardNo}">'
						html += '<input type="hidden" name="reCategory" value="question">'
						html += '<input type="hidden" name="reNo" value="'+reNo+'">'
						html += '<div style="margin-bottom: 5px">'
						html += '<textarea rows="4" name="reContent" class="form-control" style="border: 0">'+content+'</textarea>'
						html += '</div>'
						html += '<div class="d-flex flex-row-reverse bd-highlight"><a id="cancel" class="a-modify" href="#">취소</a><a id="modify" class="a-modify" href="#">수정</a></div>'
						html += '</form>'
						html += '</div><hr style="margin-top : 10px">'
						
						$div.html(html)
						
						
						$("#cancel").click(function() {
							$div.html(ori);
							$div.find($('#dropdownMenuButton1')).removeClass("show");
							$div.find('ul').removeClass('show');
						})
						$('#modify').click(function() {
							$form = $('form[name=modify]');
							$.ajax({
								 type:"POST"
								,url:"<c:url value='/reply/replyModify' />"
								,data:$form.serialize()
								,dataType:"JSON"
								,success: function(data) {
									$('#id_reply_list_area').html('');
									fn_reply_list(1);
								}
								,error: function() {
									
								}
							})
						})
					}); // btn_reply_edit.click
					
					
					$('#id_reply_list_area').on('click','#btn_reply_delete', function(e) {
						// 파라미터로 reNo 넘기고 Controller -> DB 삭제
						// success 시 해당 버튼의 댓글 div.row 제거
						$btn = $(this);
						e.preventDefault();
						$div = $btn.closest('div.row')
						if(Swal.fire({
							  icon: 'error',
							  title: '댓글을 삭제했습니다.',					  
							})
							){
							$.ajax({
								 type:"POST"
								,url:"<c:url value='/reply/replyDelete' />"
								,data: {"reNo": $div.data('re-no')}
								,dataType:"JSON"
								,success: function(data) {
									$div.remove();
									comCnt = comCnt - 1;
									$('#reply-cnt').html('').append('댓글 ' + comCnt);
									fn_reply_list(1)
								}
								,error: function(req,st,err) {
								}
							})
						}
					});
					fn_reply_list(1); // 처음 list 출력
				});
</script>
</html>