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
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.8.js" ></script>
<%@include file="/WEB-INF/inc/header.jsp"%>

<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

body {
	background-color: rgb(46,46,49);
}

.form1{
	padding: 20px;
	color: white;
	
}
.table1{
	color: #c0c0c0;
}

.input-join{
	width: 70%;
	height: 35px;
	background-color: rgb(46,46,49);
	border-color: white;
	border-radius: 0.5em;
	color: white;
}
.check-btn{
	background-color: rgba(232,193,147,0.3);
	color: white;
	border-color: rgb(232,193,147);
	border-radius: 0.5em;	
}
.next-btn{
	color: rgb(232,193,147);
	background-color: transparent;
	border: none;
	margin-bottom: 200px;
	font-weight: bold;
}

.select {
    padding: 15px 10px;
}
.select input[type=radio]{
    display: none;
}
.select input[type=radio]+label{
    display: inline-block;
    cursor: pointer;
    height: 30px;
    width: 90px;
    border: 1px solid #333;
    line-height: 24px;
    text-align: center;
    font-weight:bold;
    font-size:15px;
    
}
.select input[type=radio]+label{
    background-color: #c0c0c0;
    color: #333;
}
.select input[type=radio]:checked+label{
    background-color: rgb(232,193,147);
    color: #fff;
}




.select8 {
    padding: 15px 10px;
}
.select9 input[type=radio]{
    display: none;
}
.select9 input[type=radio]+label{
    display: inline-block;
    cursor: pointer;
    height: 30px;
    width: 90px;
    border: 1px solid #333;
    line-height: 24px;
    text-align: center;
    font-weight:bold;
    font-size:15px;
    
}
.select9 input[type=radio]+label{
    background-color: #c0c0c0;
    color: #333;
}
.select9 input[type=radio]:checked+label{
    background-color: rgb(232,193,147);
    color: #fff;
}








.select3 {
	color:white;
    -webkit-appearance: none; 
    -moz-appearance: none;
    appearance: none;
    background: url(<%=request.getContextPath()%>/resources/logo/down-arrow.png) no-repeat 95% 50%; 
    background-color: rgb(46,46,49);
}


.select3::-ms-expand {
    display: none;
}


</style>
</head>
<body>
	<%@include file="/WEB-INF/inc/top.jsp"%>

<div class="container">
	 	<div class="row">
	 	<div class="col-md-2"></div>
			<div class="col-md-8">
			
		<form:form action="regist" method="post" cssClass="form1">
					<h3 style="padding: 30px;">회원가입 2단계</h3>
					<div style="text-align: right; font-size: 14px;"><span style="color: rgb(232,193,147);">*</span> 필수입력사항</div>
					<hr><br>
				
				<table class="table table1">
				<colgroup>
					<col width="20%">
				</colgroup>
				<tbody>
					<tr>
						<th>아이디 <span style="color: rgb(232,193,147);">*</span></th>
						<td><input type="text" name="userId" id="idInput" 
							class="input-join" required="required"
							pattern="^(?=.*[a-zA-Z])(?=.*[0-9]).{4,12}$" title="알파벳과 숫자로 4~12글자 입력" placeholder="알파벳과 숫자로 4~12글자 입력">
						<button onclick="idCheck()" class="check-btn">중복체크</button>
						<br><span id="id-pattern-vaild"></span>
						</td>
					<tr>
						<th>비밀번호 <span style="color: rgb(232,193,147);">*</span></th>
						<td><input type="password" name="userPassword"
							class="input-join" required="required"
							pattern="^(?=.*[a-zA-Z])(?=.*[0-9]).{4,}$" title="알파벳과 숫자로 4글자 이상 입력" placeholder="알파벳과 숫자로 4글자 이상 입력"></td>
					</tr>
					<tr>
						<th>회원명 <span style="color: rgb(232,193,147);">*</span></th>
						<td><input type="text" name="userName"
							class="input-join" required="required"
							pattern="[가-힣]{2,}" title="한글로 2글자 이상 입력" placeholder="한글로 2글자 이상 입력">
							<button type="button" id="auth" class="check-btn">본인인증</button>
							</td>
					</tr>
					<tr>
						<th>E-mail <span style="color: rgb(232,193,147);">*</span></th>
						<td><input type="text" name="userEmail"
							class="input-join" required="required"
							pattern="[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]$" title="이메일 양식에 맞게 적어주세요." placeholder="ex) ○○○○@naver.com">							
						</td>
					</tr>
					<tr>
						<th>구분</th>
						<td class="select">						
							<input type="radio" id="select" name="userRole" class="" value="customer"> <label for="select">customer</label>
							<input type="radio" id="select2" name="userRole" class="" value="seller"><label for="select2">seller</label>
						</td>
					</tr>
					<tr>
						<th>차량선택 <span style="color: rgb(232,193,147);">*</span></th>
						<td>
							<select id="fac" required="required" class="select3">
								<option value="">선택</option>
								 <c:forEach items="${carFacList }" var="carFac">
									<option value="${carFac.carFacturerCd }">${carFac.carFacturerNm }</option>
								</c:forEach> 
							</select>
							<select name="carId" id="select-car" required="required" class="select3" style="width: 175px;">
								<option value="">제조사를 선택하세요</option>
								  
							</select>
						</td>
					</tr>
					<tr>
						<th>나이</th>
						<td><input type="text" name="userAge"
							class="input-join" placeholder="ex) 24" pattern="^[0-9]{1,3}$"></td>
					</tr>
					<tr>
						<th>성별</th>						
						<td class="select">						
							<input type="radio" id="select8" name="userGender" class="" value="M"> <label for="select8">man</label>
							<input type="radio" id="select9" name="userGender" class="" value="W"><label for="select9">woman</label>
						</td>						
					</tr>
				</tbody>
				</table>
					<div style="float: left;">
						<a href="${pageContext.request.contextPath}/join/cancel" style="color: #c0c0c0; text-decoration: none;">◀ 취 소</a>
					</div>				
					<div style="float: right;">
						<button type="submit" class="next-btn">회원가입 ▶</button>
					</div>
					</form:form>							
				</div>
		</div>
</div>
</body>
<script type="text/javascript">
function idCheck() {
	event.preventDefault();	
	var idInput = document.getElementById("idInput").value;
	if(idInput === ''){
		return;
	}
	$.ajax({
		type: "POST",
		url: "idCheck",
		data : {"id":idInput},
		success : function(data){
			if (data == 'Y') {
				if ($('#idInput').val() != '') {
					alert(idInput + '사용가능합니다.')
				}
			}
		else{
			alert('아이디가 이미 존재합니다.')
			 $("#idInput").val('');
			 $("#idInput").focus();
		}
		}
	})
}
$fac = $('#fac');
$fac.change(getCarList);

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
						str += '<option value="'+element.carId+'">'+element.carName+'</option>'
					})
					$('#select-car').append(str);
				}
			}
			,error :function(e) {
				alert("잘못된 접근입니다. 올바른 경로로 시도하세요.")
			}
		});
	}


$("#auth").click(function() {
	
	
	event.preventDefault();	
	var IMP = window.IMP; // 생략가능
	IMP.init('iamport'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
	 
	
	IMP.certification({
	    merchant_uid : 'merchant_' + new Date().getTime() //본인인증과 연관된 가맹점 내부 주문번호가 있다면 넘겨주세요
	    ,popup : true
	    
	}, function(rsp) {
	    if ( rsp.success ) {
	         // 인증성공
	        console.log(rsp);
	        $("#auth").prop('disabled',true);
	        $("#auth").append(rsp.name);
	            
	    } else {
	         // 인증취소 또는 인증실패
	        var msg = '인증에 실패하였습니다.';
	        msg += '에러내용 : ' + rsp.error_msg;
	 
	        alert(msg);
	    }
	});
})

$('#idInput').on("change keyup paste", function() {
	re = new RegExp("^(?=.*[a-zA-Z])(?=.*[0-9]).{4,12}$");
	
	
	if(re.test($('#idInput').val())){
		$('#id-pattern-vaild').text('올바른 아이디 입니다.');
		return;
	}else{
		$('#id-pattern-vaild').text('아이디 형식이 올바르지 않습니다.');
	}
});
 
 $('#pwInput').on("change keyup paste", function() {
	re = new RegExp("^(?=.*[a-zA-Z])(?=.*[0-9]).{4,}$");
	
	
	if(re.test($('#pwInput').val())){
		$('#pw-pattern-vaild').text('올바른 비밀번호 입니다.');
		return;
	}else{
		$('#pw-pattern-vaild').text('비밀번호 형식이 올바르지 않습니다.');
	}
});

</script>

</html>


