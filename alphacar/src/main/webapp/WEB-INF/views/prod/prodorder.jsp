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
 <!--css -->
    <link href="<%=request.getContextPath() %>/resources/orderCss/styles.css" rel="stylesheet">
    
    <link href="<%=request.getContextPath() %>/resources/orderCss/form-validation.css" rel="stylesheet">
</head>
<body>
<%@include file="/WEB-INF/inc/top.jsp" %>
<div class="container">
  <main>
    <div class="py-5 text-center">
      
      <h2>결제하기</h2>
    </div>

    <div class="row g-5">
      <div class="col-md-5 col-lg-4 order-md-last">
        <h4 class="d-flex justify-content-between align-items-center mb-3">
          <span class="text-primary">장바구니</span>
          <%-- <span class="badge bg-primary rounded-pill">${orders.options.size() }</span> --%>
        </h4>
        <ul class="list-group mb-3">
        
        	<c:forEach items="${orderList}" var="order">
        		<c:forEach items="${order.options }" var="option">
		          <li class="list-group-item d-flex justify-content-between lh-sm">
		            <div>
		              <h6 class="my-0">${order.prodName }</h6>
		              <small class="text-muted"></small>
		            </div>
		             <span class="text-muted">${option.optionPrice * option.prodQty }원</span> 
		          </li>
        		</c:forEach>
        	</c:forEach>
          <li class="list-group-item d-flex justify-content-between">
            <span>총 금액 (KRW))</span>
            <strong id="total-price"><%=request.getParameter("sumPrice") %></strong><strong>원</strong>
          </li>
        </ul>
      </div>
      <div class="col-md-7 col-lg-8">
        <h4 class="mb-3">배송 정보</h4>
        <form name="payment" class="needs-validation" novalidate method="post" action="orderregist">
          <div class="row g-3">
            <div class="col-sm-12">
              <label for="userId" class="form-label">아이디</label>
              <p>${sessionScope.USER_INFO.userId }</p>
              <c:forEach items="${orderList }" var="order" varStatus="st">
              	<input type="hidden" name="orders[${st.index }].userId" value="${sessionScope.USER_INFO.userId }">
	              <input type="hidden" name="orders[${st.index }].prodNo" value="${order.prodNo }">
	              <input type="hidden" name="orders[${st.index }].prodName" value="${order.prodName }">
	              <input type="hidden" name="orders[${st.index }].sellerId" value="${order.sellerId }">
	             	<c:forEach items="${order.options}" var="option" varStatus="status">
	             		<input type="hidden" name="orders[${st.index }].options[${status.index }].prodQty" value="${option.prodQty }">
	             		<input type="hidden" name="orders[${st.index }].options[${status.index }].optionPrice" value="${option.optionPrice }">
	             		<input type="hidden" name="orders[${st.index }].options[${status.index }].optionNo" value="${option.optionNo }">
	             	</c:forEach>
             	</c:forEach>
              <input type="hidden" name="sumPrice" value="<%=request.getParameter("sumPrice") %>">
              <div class="invalid-feedback"> 
                	이름을 입력하세요.
              </div>
            </div>
            <div class="col-12">
              <label for="username" class="form-label">이름</label>
              <div class="input-group has-validation">
                <input type="text" class="form-control" id="username" placeholder="이름을 입력하세요." required>
              <div class="invalid-feedback">
                 이름을 입력하세요
                </div>
              </div>
            </div>
           <div class="col-12">
              <label for="email" class="form-label">Email 정보</label>
              <div class="input-group has-validation">
	              <input type="text" name="userMail" class="form-control" id="email" placeholder="" required>
	              <c:forEach items="${orderList }" var="order" varStatus="st">
	              	<input class="mail" type="hidden" name="orders[${st.index }].userMail" value="">
	              </c:forEach>
	              <div class="invalid-feedback">
	                	이메일을 입력하세요.
	              </div>
            </div>
           </div>
			<!-- 카카오 지도 API 사용 -->
			<br>
            <div class="col-10">
              <label for="address" class="form-label">주소</label>
				<input type="text" name="orderAddress" class="form-control" id="sample3_address" placeholder="주소를 입력하세요" required readonly="readonly">
				
              <c:forEach items="${orderList }" var="order" varStatus="st">
             		<input class="orderAddress" type="hidden" name="orders[${st.index }].orderAddress" value="">
              </c:forEach>
              
              <div class="invalid-feedback">
                	주소를 입력하세요
              </div>
            </div>
            <div class="col-2" style="padding-top: 5%;">
	            <input style="" class="btn btn-primary" type="button" onclick="sample3_execDaumPostcode()" value="주소 검색">
           	 </div>
			<div id="wrap" style="display:none;border:1px solid;width:500px;height:300px;margin:5px 0;position:relative">
			<img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnFoldWrap" style="cursor:pointer;position:absolute;right:0px;top:-1px;z-index:3" onclick="foldDaumPostcode()" alt="접기 버튼">
			</div>
            <div class="col-9">
              <label for="address2" class="form-label">상세주소 <span class="text-muted">(Optional)</span></label>
              <input type="text" name="orderAddressDetail" class="form-control" id="sample3_detailAddress" placeholder="상세주소">
              <c:forEach items="${orderList }" var="order" varStatus="st">
             		<input class="orderAddressDetail" type="hidden" name="orders[${st.index }].orderAddressDetail" value="">
              </c:forEach>
              <div class="invalid-feedback">
                	상세 주소를 입력하세요
              </div>
            </div>
            <div class="col-md-3">
              <label for="zip" class="form-label">우편번호</label>
              <input type="text" name="orderZipCode" class="form-control" id="sample3_postcode" placeholder="우편번호" required required readonly="readonly"> 
              <c:forEach items="${orderList }" var="order" varStatus="st">
             		<input class="orderZipCode" type="hidden" name="orders[${st.index }].orderZipCode" value="">
              </c:forEach>
              <div class="invalid-feedback">
                Zip code required.
              </div>
            </div>
          </div> <!-- end 카카오 지도 API 사용 -->
          <hr class="my-4">
			<!-- 동의 -->
          <div class="form-check">
            <input type="checkbox" class="form-check-input" id="same-address" required>
            <label class="form-check-label" for="same-address">배송 정보가 정확하지 않아 생기는 불이익은 당사에서 책임지지 않습니다.</label>
            <div class="invalid-feedback">
                	제출하기 전에 동의해야 합니다.
            </div>
          </div>

          <div class="form-check">
            <input type="checkbox" class="form-check-input" id="save-info" required>
            <label class="form-check-label" for="save-info">정말로 결제를 진행하시겠습니까?</label>
            <div class="invalid-feedback">
              		제출하기 전에 동의해야 합니다.
            </div>
          </div>
          <hr class="my-4">
			<!-- 결제 정보 -->
			<br>
          <h4 class="mb-3">Payment</h4>
          <div class="my-3">
            <div class="form">
              <input id="kakaopay" name="paymentMethod" type="radio" class="form-input" checked="checked">
              <label class="form-check-label" for="kakaopay">kakaoPay</label>
            </div>
          </div>
          <hr class="my-4">
          <div id="submitdiv" style="text-align: center;">
          <button id="kakaopaybtn" style="background : none; border : 0" type="button"><img src="<%=request.getContextPath()%>/resources/etc/kakaom.png"></button>
          </div>
        </form>
      </div>
    </div>
  </main>

  <footer class="my-5 pt-5 text-muted text-center text-small">
    <p class="mb-1">&copy; 2017–2021 Company Name</p>
    <ul class="list-inline">
      <li class="list-inline-item"><a href="#">Privacy</a></li>
      <li class="list-inline-item"><a href="#">Terms</a></li>
      <li class="list-inline-item"><a href="#">Support</a></li>
    </ul>
  </footer>
</div>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">


$("#kakaopaybtn").click(pay);
	
	function pay() {
	
		var itemName = "${orderList['0'].prodName }";
		if(${orderList.size()} > 1){
			itemName = "${orderList['0'].prodName } 외 " + "${orderList.size()-1}개" 
		}
		var params = {"itemName" : itemName, "totalAmount" : $('#total-price').text(), "user" : "${sessionScope.USER_INFO.userId }"};
		$.ajax({
			url : 'kakao',
			dataType : 'json',
			data : params,
			success: function(data) {
				console.log(data);
				var box = data.next_redirect_pc_url;
						 
				if("${basket}" == "basket"){
				 <c:forEach items="${orderList }" var="order">
					sessionStorage.removeItem("${order.prodNo }");
	            	</c:forEach>
				}
				var win = window.open(box,"결제", "width=100");

				var inter = window.setInterval(function() {
					if(win.document.location.href.indexOf('successpayment') != -1){
						win.close();	
						window.clearInterval(inter);
						var f = document.forms['payment'];
						f.submit();
					}else if(win.document.location.href.indexOf('failpayment') != -1){
						win.close();	
						window.clearInterval(inter);
						alert("결제에 실패하였습니다. 다시 시도하세요.");
					}else if(win.document.location.href.indexOf('cancelpayment') != -1){
						win.close();	
						window.clearInterval(inter);
						alert("결제를 취소하였습니다. 다시 시도하세요.");
					}
				}, 100)
			},
			error: function(error) {
				alert("에러");
			}
		})
	}
$('input[name=userMail]').on('change keyup paste',function() {
	$('.mail').each(function(i, element) {
		$(element).val($('input[name=userMail]').val());
		
	});
});

$('input[name=orderAddressDetail]').on('change keyup paste',function() {
	$('.orderAddressDetail').each(function(i, element) {
		$(element).val($('input[name=orderAddressDetail]').val());
		
	});
});


////////////////////////////////////////////////////// 카카오 맵
    var element_wrap = document.getElementById('wrap');

    function foldDaumPostcode() {
        // iframe을 넣은 element를 안보이게 한다.
        element_wrap.style.display = 'none';
    }

    function sample3_execDaumPostcode() {
        // 현재 scroll 위치를 저장해놓는다.
        var currentScroll = Math.max(document.body.scrollTop, document.documentElement.scrollTop);
        new daum.Postcode({
            oncomplete: function(data) {
                // 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }
                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample3_postcode').value = data.zonecode;
            	$('.orderZipCode').each(function(i, element) {
            		$(element).val(data.zonecode);
            		
            	});
                document.getElementById("sample3_address").value = addr;
            	$('.orderAddress').each(function(i, element) {
            		$(element).val(addr);
            		
            	});
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample3_detailAddress").focus();

                // iframe을 넣은 element를 안보이게 한다.
                // (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
                element_wrap.style.display = 'none';

                // 우편번호 찾기 화면이 보이기 이전으로 scroll 위치를 되돌린다.
                document.body.scrollTop = currentScroll;
            },
            // 우편번호 찾기 화면 크기가 조정되었을때 실행할 코드를 작성하는 부분. iframe을 넣은 element의 높이값을 조정한다.
            onresize : function(size) {
                element_wrap.style.height = size.height+'px';
            },
            width : '100%',
            height : '100%'
        }).embed(element_wrap);

        // iframe을 넣은 element를 보이게 한다.
        element_wrap.style.display = 'block';
    }
</script> 
</body>
</html>