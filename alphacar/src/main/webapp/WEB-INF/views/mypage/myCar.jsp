<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<%request.setCharacterEncoding("UTF-8"); %>
<html>
<head>
<%@include file="/WEB-INF/inc/header.jsp" %>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@include file="/WEB-INF/inc/top.jsp" %>
<%@include file="/WEB-INF/inc/sidebars.jsp" %>

<div class="container">


<br>
	<h2>My Car</h2>
	<hr>
	<div class="row">
		<div class="col-6 d-flex justify-content-center" >
			<div style="margin: 5%">
			 <img alt="" src="${car.carImageUrl }">
			
			</div>
		</div>	
		<div class="col-6" style="border-radius: 10px; background-color: rgb(46,46,49)">
	<form action="carUpdate" name="frmMyCar">
		<br>
		<strong style="color:rgb(232,193,147) ">자신의 차량을 변경하실 수 있습니다.</strong>
		<hr>
		 <span style="color: rgb(232,193,147);">차량선택</span>
							<select id="fac" required="required"  class="form-select form-select-lg mb-3">
								<option value="">선택</option>
								 <c:forEach items="${carFacList}" var="carFac">
									<option value="${carFac.carFacturerCd }">${carFac.carFacturerNm }</option>
								</c:forEach> 
							</select>
							<select name="carId" id="select-car" required="required" class="form-select form-select-lg mb-3" style="width: 175px;">
								<option value="">제조사를 선택하세요</option>
							</select>
							<div>
							<br>
							<input type="button" value="초기화"> <input type="submit" value="차량변경하기">
							</div>
						<br>
			</form>
		</div>	
		<div class="row">
			<div class="col-6 d-flex justify-content-center">
				<div>
				<br>
				<img width="50px" alt="" src="<%=request.getContextPath() %>/resources/etc/free-icon-exchange-152371.png">
				
				</div>
			</div>
		</div>
		<div class="col-6"></div>
		</div>
<br>
	<div class="row">
		<div class="col-6 d-flex justify-content-center" style ="border-radius: 10px; " >
			<div style="margin: 5%">
			 <img id="modify-car" width="360px" height="180px" alt="" src="<%=request.getContextPath() %>/resources/etc/future-car-material (2).jpg">
			
			</div>
		</div>	
		<div class="col-6">
		</div>	
	</div>
	

</div>
</body>
<script type="text/javascript">
$fac = $('#fac');
$fac.change(getCarList);


$('#select-car').change(function() {
	var url = $('#select-car option:selected').data('image-url');
	$('#modify-car').attr('src', url);
})

function getCarList(){
	var param = { "carFacCd" : $fac.val()}
	$.ajax({
			 type :"POST"
			,url : "<c:url value='/carlist'/>"
			,dataType : "JSON"
			,data : param
			,success : function(data) {
				if(data.result){
					$('#select-car').text('');
					var str = '';
					$.each(data.data, function(index, element) {
						str += '<option value="'+element.carId+'" data-image-url="' + element.carImageUrl + '"  >'+element.carName+'</option>'
					})
					$('#select-car').append(str);
				}
			}
			,error :function(e) {
				alert("잘못된 접근입니다. 올바른 경로로 시도하세요.")
			}
		});
	}
	

$('form[name=frmMyCar]').submit(function(e){
	e.preventDefault();
	updateMyCar();	
});
	
function updateMyCar(){
	var param = $('form[name=frmMyCar]').serialize();
	$.ajax({
			 type :"POST"
			,url : "<c:url value='/carUpdate'/>"
			,dataType : "JSON"
			,data : param
			,success : function(data) {
				if(data.result){	
					alert("차량변경을 성공했습니다.");
					location.href = "<c:url value='/mypage?userId=${sessionScope.USER_INFO.userId}'/>";
				}else{
					alert("차량변경에 문제가 있습니다. 다시 확인해 주세요!!");
				}
			}
			,error :function(e) {
				alert("잘못된 접근입니다. 올바른 경로로 시도하세요.")
			}
		});
	}	

</script>
</html>