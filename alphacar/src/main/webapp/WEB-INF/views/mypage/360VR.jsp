<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<%request.setCharacterEncoding("UTF-8"); %>
<html>
<head>
<%@include file="/WEB-INF/inc/header.jsp" %>
    <link href="<%=request.getContextPath() %>/resources/cartResource/10-11.css" rel="stylesheet">
    <!-- 알파카 css -->
     <link href="<%=request.getContextPath() %>/resources/alphacarCss/alphacar.css" rel="stylesheet">  
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
	.show1{
	display: none;
	}
	.show2{
	display: none;
	}
	.show3{
	display: none;
	}
	.show4{
	display: none;
	}
</style>
<body>
<%@include file="/WEB-INF/inc/top.jsp" %>
<%@include file="/WEB-INF/inc/sidebars.jsp" %>
	<div class="container">
	<h2>360˚ VR</h2>
	<hr>
		<div class="row picBox">
		<div class="col-1">
		
		</div>
		<div class="col-8">
		
		
			<h1><i class="bi bi-badge-vr-fill"></i></h1>  
			<img
				style="-webkit-user-drag: none;" class="pic"
				src="https://www.hyundai.com/contents/vr360/CN01/exterior/WAW/001.png" />
			<div class="btn d-flex justify-content-center">
				<button class="beforeBtn a-btn">&laquo;</button>
				<button class="change-btn a-btn">변경</button>
				<button class="afterBtn a-btn">&raquo;</button>
			</div>
			<div class="row">
				<select id="selectCar" class="form-select form-select-lg mb-3">
					<option value="">차종</option>
					<option value="CN01">AVANTE</option>
					<option value="CN02">AVANTE N Line</option>
					<option value="CN03">AVANTE Hybrid</option>
					<option value="DN08">SONATA</option>
					<option value="DN09">SONATA Hybrid</option>
					<option value="DN10">SONATA N</option>
					<option value="IG10">GRANGER</option>
					<option value="IG11">GRANGER Hybrid</option>
					<option value="OS11">KONA</option>
					<option value="OS12">KONA Hybrid</option>
					<option value="NX01">TUCSAN</option>
					<option value="NX02">TUCSAN Hybrid</option>


				</select>

			</div>
			<div id="avante" class="row show1">
				<select id="selectColor1" class="form-select form-select-lg mb-3">
					<option value="">차량색상</option>
					<option value="WAW">흰색</option>
					<option value="M6T">회색</option>
					<option value="PR2">빨강</option>
					<option value="NKA">검정</option>
					<option value="YR2">주황</option>
					<option value="YP5">파랑</option>
				</select>

			</div>
			<div id="Sotgrd" class="row show2">
				<select id="selectColor2" class="form-select form-select-lg mb-3">
					<option value="">차량색상</option>
					<option value="WC9">흰색</option>
					<option value="NT2">회색</option>
					<option value="NB9">검정</option>

				</select>

			</div>

			<div id="kona" class="row show3">
				<select id="selectColor3" class="form-select form-select-lg mb-3">
					<option value="">차량색상</option>
					<option value="SAW">흰색</option>
					<option value="C5G">회색</option>
					<option value="YG7">검정</option>
					<option value="V7U">파랑</option>

				</select>

			</div>

			<div id="tucson" class="row show4">
				<select id="selectColor4" class="form-select form-select-lg mb-3">
					<option value="">차량색상</option>
					<option value="TW3">흰색</option>
					<option value="R2T">회색</option>
					<option value="TCM">검정</option>
					<option value="YP6">빨강</option>

				</select>
			</div>
		<div class="d-flex justify-content-center">
		<img alt="" width="300" src="<%=request.getContextPath() %>/resources/etc/hyundai.png">
		</div>
		
		
		</div>
		<div class="col-3"></div>
		
				</div>
	</div>
	<script>
        let pic = document.querySelector(".pic");
        let picNo = document.querySelector(".picNo");
   
        let i = 1;
        var carCode = 'CN01';
        var 
		carColor = 'WAW';
		
        document.querySelector(".change-btn").addEventListener(
				'click',
				function(idx) {

					if (idx) {
						if (i == 60)
							return i = 1;
						i++;
					}
					if (i > 10) {
						pic.setAttribute("src",
								"https://www.hyundai.com/contents/vr360/"
										+ carCode + "/exterior/" + carColor
										+ "/0" + i + ".png");
					} else {
						pic.setAttribute("src",
								"https://www.hyundai.com/contents/vr360/"
										+ carCode + "/exterior/" + carColor
										+ "/00" + i + ".png");
					}

					picNo.innerHTML = i;

				});
        
		document.querySelector(".afterBtn").addEventListener(
				'click',
				function(idx) {

					if (idx) {
						if (i == 60)
							return i = 1;
						i++;
					}
					if (i > 10) {
						pic.setAttribute("src",
								"https://www.hyundai.com/contents/vr360/"
										+ carCode + "/exterior/" + carColor
										+ "/0" + i + ".png");
					} else {
						pic.setAttribute("src",
								"https://www.hyundai.com/contents/vr360/"
										+ carCode + "/exterior/" + carColor
										+ "/00" + i + ".png");
					}

					picNo.innerHTML = i;

				});

		document.querySelector(".beforeBtn").addEventListener(
				'click',
				function(idx) {

					if (idx) {
						if (i == 1)
							return i = 60;
						i--;
					}
					if (i > 10) {
						pic.setAttribute("src",
								"https://www.hyundai.com/contents/vr360/"
										+ carCode + "/exterior/" + carColor
										+ "/0" + i + ".png");
					} else {
						pic.setAttribute("src",
								"https://www.hyundai.com/contents/vr360/"
										+ carCode + "/exterior/" + carColor
										+ "/00" + i + ".png");
					}
					picNo.innerHTML = i;
				});

		flag = false;

		var carDiv = $('.picBox');
		var X;
		carDiv.mousedown(function(event) {
			X = event.clientX;
			flag = true;
			console.log(X);

		});
		carDiv.mouseup(function(event) {
			flag = false;
			X = event.clientX;
			console.log(X);

		});
		carDiv.mousemove(function(event) {
			if (flag == true) {
				var moveX = event.clientX;
				var msg = "Handler for .mousemove() called at ";
				msg += moveX;
				console.log(msg);
				if (X > moveX) {
					if (event) {
						if (i == 60)
							return i = 1;
						i++;
					}
					if (i > 10) {
						pic.setAttribute("src",
								"https://www.hyundai.com/contents/vr360/"
										+ carCode + "/exterior/" + carColor
										+ "/0" + i + ".png");
					} else {
						pic.setAttribute("src",
								"https://www.hyundai.com/contents/vr360/"
										+ carCode + "/exterior/" + carColor
										+ "/00" + i + ".png");
					}
				} else {
					if (event) {
						if (i == 1)
							return i = 60;
						i--;
					}
					if (i > 10) {
						pic.setAttribute("src",
								"https://www.hyundai.com/contents/vr360/"
										+ carCode + "/exterior/" + carColor
										+ "/0" + i + ".png");
					} else {
						pic.setAttribute("src",
								"https://www.hyundai.com/contents/vr360/"
										+ carCode + "/exterior/" + carColor
										+ "/00" + i + ".png");
					}
				}
			}

		});
		$('#selectCar')
				.change(
						function() {
							carCode = $('#selectCar option:selected').val();
							if ($('#selectCar option:selected').val().indexOf(
									'CN') >= 0) {
								$('.show1').show();
								$('.show2').hide();
								$('.show3').hide();
								$('.show4').hide();
							} else if ($('#selectCar option:selected').val()
									.indexOf('DN') >= 0) {
								$('.show1').hide();
								$('.show2').show();
								$('.show3').hide();
								$('.show4').hide();
							} else if ($('#selectCar option:selected').val()
									.indexOf('IG') >= 0) {
								$('.show1').hide();
								$('.show2').show();
								$('.show3').hide();
								$('.show4').hide();
							} else if ($('#selectCar option:selected').val()
									.indexOf('OS') >= 0) {
								$('.show1').hide();
								$('.show2').hide();
								$('.show3').show();
								$('.show4').hide();
							} else if ($('#selectCar option:selected').val()
									.indexOf('NX') >= 0) {
								$('.show1').hide();
								$('.show2').hide();
								$('.show3').hide();
								$('.show4').show();
							}
						});
		$('#selectColor1').change(function() {
			carColor = $('#selectColor1 option:selected').val();
		});
		$('#selectColor2').change(function() {
			carColor = $('#selectColor2 option:selected').val();
		});
		$('#selectColor3').change(function() {
			carColor = $('#selectColor3 option:selected').val();
		});
		$('#selectColor4').change(function() {
			carColor = $('#selectColor4 option:selected').val();
		});
	</script>

</body>
</html>