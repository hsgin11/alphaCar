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
<style type="text/css">
*{margin: 0; padding: 0; box-sizing: boder-box;}
body{
	font-family: 'Noto Sans KR', sans-serif;
	display: flex;
	justify-content: center;
	align-items: center;
	height: 100vh;	
	background-size: cover;
	overflow: hidden;
}


.login-form{ position: relative; z-index: 2;}
.login-form h1{
	font-size: 32px; color: rgb(232,193,147);
	text-align: center;
	margin-bottom: 60px;
}
.int-area{
	width: 100%; position: relative;
	margin-top: 20px;
}
.int-area:first-child{margin-top: 0;}
.int-area input{
	width: 100%;
	padding: 20px 10px 10px;
	background-color: transparent;
	border: none;
	border-bottom: 1px solid rgb(232,193,147);
	font-size: 18px; color: rgb(232,193,147);
	outline: none;
}
.int-area label {
	position: absolute; left: 10px; top: 15px;
	font-size: 18px; color: rgb(232,193,147);
	transition: all .5s ease;
}

.int-area input:focus + label,
.int-area input:valid + label{
	top: -2px;
	font-size: 13px; color: #166cea;	
}

.int-area label.warning{
	color: red !important;
	animation: warning .3s ease;
	animation-iteration-count: 3;
}
@keyframes warning{
	0% {transform: translateX(-8px);}
	25% {transform: translateX(8px);}
	50% {transform: translateX(-8px);}
	75% {transform: translateX(8px);}
}

.btn-area{margin-top: 30px;}
.btn-area button{
	
	width: 100%; height: 10px;
	background: rgba(46,46,49,0.8);
	color: rgb(232,193,147);
	font-size: 18px;
	border: 0;
	border-radius: 25px;
	cursor: pointer;
	opacity: 80%;
	outline: none;
	
}
/*버튼 호버 */
button{
  background:#1AAB8A;
  background-color: transparent;
  color:#fff;
  border:none;
  position:relative;
  height:60px;
  font-size:1.6em;
  padding:0 2em;
  cursor:pointer;
  transition:800ms ease all;
  outline:none;
}
button:hover{
  background:rgba(232,193,147,0.7);
  color: 	#1E90FF;
}


/*버튼 호버 */
.caption{
	margin-top: 20px;
	text-align: center;
}
.caption a{
	font-size: 15px; color: white;
	text-decoration: none;
}


section{
	padding: 1%;
	background: rgb(46,46,49);
	opacity: 80%;
	border-radius: 25px;
} 



</style>
</head>
<body>
<%-- <%@include file="/WEB-INF/inc/top.jsp" %> --%>

	<div>
	<video src="<%=request.getContextPath()%>/resources/video/bgr_video.mp4" autoplay="autoplay" muted="muted" loop="loop" style="position: absolute;
     top: 0px;
     left: 0px;
     min-width: 100%;
     min-height: 100%;
     width: auto;
     height: auto;
     z-index: -1;
     overflow: hidden;"></video>
	</div>	

	<section class="login-form">
		<div class="text-center">
		<a href="<%=request.getContextPath()%>/"><img alt="" src="<%=request.getContextPath()%>/resources/logo/logo4.png" width="500px" height="300px" ></a>
		</div>
		<form action="login" class="loginForm" method="post">
			<div class="int-area">
				<input type="text" name="userId" id="id" autocomplete="off" required>
				<label for="id">USER NAME</label>
			</div>
			<div class="int-area">
				<input type="password" name="userPass" id="pw" autocomplete="off" required>
				<label for="pw">PASSWORD</label>
			</div>			
			<div class="btn-area">
				<button style="background-color: transparent;" type="submit" id="btn">LOGIN</button>				
			</div>
			<div class="btn-area">
				<button style="background-color: transparent;" onclick="location.href='join/step1'">SIGN</button>
			</div>
		</form>
		<div class="caption">
			<a href="user/findPw">Forget Password?</a>
		</div>
	</section>

</body>
<script type="text/javascript">
	let id = $('#id');
	let pw = $('#pw');
	let btn = $('#btn');
	
	$(btn).on('click', function() {
		if($(id).val() == ""){
			$(id).next('label').addClass('warning');
			setTimeout(function() {
				$('label').removeClass('warning');
			},1500);
		}
		else if($(pw).val() == ""){
			$(pw).next('label').addClass('warning');
		}
	});
	
	
</script>
</html>