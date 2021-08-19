<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<%request.setCharacterEncoding("UTF-8"); %>
<html>
<head>
<%@include file="/WEB-INF/inc/header.jsp"%>
<link href="<%=request.getContextPath() %>/resources/alphacarCss/alphacar.css" rel="stylesheet">
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 알파카 css -->
     <link href="<%=request.getContextPath() %>/resources/alphacarCss/alphacar.css" rel="stylesheet">  

</head>
<style>
.formMargin{
	margin-top: 30px;

}
</style>
<body>
	<%@include file="/WEB-INF/inc/top.jsp"%>
<div class="container">
	
	
	<!-- 판매 등록 -->
	<br>
	<h3>상품판매</h3><small class="text-muted">*표시가 입력된 곳은 필수입력</small> 
	<hr>
	<form action="file" method="post" enctype="multipart/form-data">

		<div class="container" style="margin-left: 70px">
			<div class="row">
				<div class="col-2 formMargin">상품명* </div>
				<div class="col-8 formMargin">
					<input type="text" name="prodName" class="form-control input-sm">
					<br>
					<hr>
				</div>
				<div class="col-2">
				</div>
				<div class="col-2 formMargin">상품 이미지 업로드*</div>
				<div class="col-8 formMargin">

					<div class="inputArea">
						<label for="gdsImg">이미지</label> <input type="file" id="gdsImg"
							name="file" />
						<div class="select_img">
							<img src="" />
						</div>
					</div>
					<br>
					<hr>
				</div>
				<div class="col-2">
				</div>
				<div class="col-2 formMargin">판매가격*</div>
				<div class="col-8 formMargin">
					<input type="text" name="prodPrice" class="form-control input-sm">
					<br>
					<hr>
				</div>
				<div class="col-2">
				</div>
				<div class="col-2 formMargin">판매자*</div>
				<div class="col-8 formMargin">
				   <p>${USER_INFO.userName}(회원 아이디)</p>	
				   <br>
				   <hr>				
				</div>
				<div class="col-2">
				</div>
				<div class="col-2 formMargin">상품카테고리</div>
				<div class="col-8 formMargin">
					<select name="prodCategory" class="form-select form-select-lg mb-3">
						<option value="">선택</option>
						<option value="oil">오일류</option>
						<option value="indoor">실내용품</option>
						<option value="importedCar">차량부품</option>
						<option value="sale">세일상품</option>
						<option value="safe">안전용품</option>
						<option value="phone">휴대폰용품</option>
						<option value="outdoor">실외용품</option>
						<option value="DIY">제작용품</option>
						<option value="tuning">튜닝용품</option>
						<option value="wash">새차용품</option>
						<option value="aeroParts">에어로파츠</option>
					</select>
					<br>
					<br>
					<hr>
				</div>
				<div class="col-2">
				</div>
				
				<div id="addDiv" class="row formMargin">
					<h4>상품옵션</h4>
					<div class="col-10">
					<hr>
					</div>
					<div>
					<input type="button" id="addOption" value="+" style="background-color: rgb(46,46,49); color: white; border-radius: 0.5em; border: none; margin: 10px;">
				<small class="text-muted">버튼을 누르면 옵션을 추가 하실 수 있습니다.</small> 
				</div>
					<div id="optionArea">
					
					</div>
					
				</div><!-- end #addDiv -->
				<br> <br>
				<hr>
			</div>


		</div>
<div style="margin-bottom: 50px; margin-top: 50px" class="d-flex justify-content-center">

		
		<a href="/alphacar/seller?userId=${sessionScope.USER_INFO.userId }" class="a-btn" style="border: none; padding: 5px; margin-right: 10px;"> <span
			class="glyphicon glyphicon-th-list" aria-hidden="true"></span>
			<i class="bi bi-house"></i>&nbsp;판매자 홈으로
		</a>
		<button type="submit" class="a-btn" style="border: none; padding: 5px;">
			<span class="glyphicon glyphicon-home" aria-hidden="true"></span>
			<i class="bi bi-save"></i>&nbsp;판매등록
		</button>
		
</div>

	</form>
</div>
	<script>
		$("#gdsImg")
				.change(
						function() {
							if (this.files && this.files[0]) {
								var reader = new FileReader;
								reader.onload = function(data) {
									$(".select_img img").attr("src",
											data.target.result).width(500);
								}
								reader.readAsDataURL(this.files[0]);
							}
						});
	</script>

	<script type="text/javascript">
		// --- 전역변수 영역 ----
		var $optionArea = $('#optionArea');

		// --- 일반함수 영역 ---
		var fn_option_rename = function() {
			$optionArea.find('div.option').each(
					function(i, el) {
						$el = $(el);
						$el.find('input[type=hidden][name$=optionNo]').attr(
								'name', 'options[' + i + '].optionNo');
						$el.find('input[type=hidden][name$=optionNo]').val(
								i + 1);
						$el.find('input[type=text][name$=optionName]').attr(
								'name', 'options[' + i + '].optionName');
						$el.find('input[type=text][name$=optionPrice]').attr(
								'name', 'options[' + i + '].optionPrice');
						// $el.find('span:first').text('문항 ' + (i + 1));
					});
		} // fn_option_rename

		// --- 이벤트 영역 ---
		$('#addOption')
				.click(
						function(e) {
							var num = $('div.option', $optionArea).size();
							console.log('num', num);
							var str = '<div class="option">';
							str += '  <div class="row">';
							str += '    <div class="col-2 formMargin">옵션이름</div>';
							str += '    <div class="col-8 formMargin">';
							str += '      <input type="hidden" name="options['
									+ num + '].optionNo" value="' + (num + 1)
									+ '" >';
							str += '      <input type="text" name="options[' + num +'].optionName" class="form-control input-sm">';
							str += '    </div>';
							str += '    <div class="col-2 formMargin">';
							str += '      <button class="btn-option-remove " style="background-color: rgb(46,46,49); color: white; border-radius: 0.5em; border: none; margin: 10px;">X</button>';
							str += '    </div>';
							str += '  </div>';
							str += '  <div class="row">';
							str += '    <div class="col-2 text">옵션가격</div>';
							str += '    <div class="col-8">';
							str += '      <input type="text" name="options[' + num +'].optionPrice" class="form-control input-sm">';
							str += '    </div>';
							str += '  </div>';
							str += '</div>'
							console.log('str', str);
							$optionArea.append(str);

						}); // end #addOption.click

		$optionArea.on('click', '.btn-option-remove', function() {
			console.log('this', this);
			$this = $(this);
			$this.closest('div.option').remove();
			fn_option_rename();
		}); // end $optionArea.on('click','.btn-option-remove

		// --- 초기화 영역 ---
	</script>


</body>
</html>