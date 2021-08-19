<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<%request.setCharacterEncoding("UTF-8"); %>
<html>
<head>
<%@include file="/WEB-INF/inc/header.jsp" %>
    <link href="<%=request.getContextPath() %>/resources/cartResource/10-11.css" rel="stylesheet">
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 알파카 css -->
     <link href="<%=request.getContextPath() %>/resources/alphacarCss/alphacar.css" rel="stylesheet">  
<style type="text/css">

.order-btn{
	width:150px;
	background-color: rgb(235,235,235);
	height:40px;
	display: inline-block;
  	margin-right: 10px;
  	border-radius: 0;
	color: #b2876f;  	
  	font-weight: bold;
  	font-size: 0.778rem;
  	letter-spacing: 2px;
  	text-transform: uppercase;
  	text-decoration: none;
	background: linear-gradient(to right, rgba(#b2876f, 0) 25%, rgba(#b2876f, .8) 75%);
	background-position: 1% 50%;
	background-size: 400% 300%;
	border: 1.5px solid #b2876f;
	transition: all 0.5s; 
	}
	
.order-btn:hover{
		color: white;
    	color: #fff;
    	background-color: rgb(232,193,147);
    	background-position: 99% 50%;
	
}

</style>
</head>
<body>
<%@include file="/WEB-INF/inc/top.jsp" %>
<%@include file="/WEB-INF/inc/sidebars.jsp" %>

<div class="container">
<h3 style="padding: 10px;">${sessionScope.USER_INFO.userName}님의 ${sessionScope.CAR_INFO.carName}</h3>
<hr>
  <div style="margin: 3%;height : 90%; overflow : auto" class="row">
    <div class="col-gx-5 p-5 text-white bg-dark rounded-3">
      <div class="text-center">
      <img alt="" src="${car.carImageUrl }">
      </div>
      <br> 
    </div>
    <div id="changeCar">
    </div>
    <div class="col-gx-5">
      <hr>
      <h4>장바구니</h4>
      <div class="basketdiv " id="basket">
                <div class="row head">
                    <div class="subdiv">
                        <div class="pname">상품명</div>
                    </div>
                    <div class="subdiv">
                        <div class="basketprice">가격</div>
                        <div class="basketprice" style="text-align: ;">수량</div>
                    </div>
                    <div class="split"></div>
                </div>
                <form action="<%=request.getContextPath()%>/prodorder" method="post" name="orders">
	                <div id="basket-info" class="row body">
	                </div>
	                
	                
	                <input type="hidden" name="sumPrice" value="0">
                </form>
                	
    </div>
  </div>
  <div class="row">
	<hr>
	<h4>주문목록</h4>
	<div class="basketdiv " id="basket">
                <div class="row head">
                    <div class="subdiv">
                        <div class="pname">상품명</div>
                    </div>
                    <div class="subdiv">
                        <div class="basketprice">상품 가격</div>
                        <div class="basketprice" style="text-align: right;">수량</div>
                        <div class="basketprice" style="text-align: right;">총 가격</div>
                    </div>
                </div>
                <div class="row body">
                <c:forEach items="${orders }" var="order" varStatus="status">
                <div class="row">
                 <div class="subdiv">
                     <div class="pname"> 
                 		<c:choose>
                 			<c:when test="${order.reviewY eq 'Y'}">
								<span>${order.prodName }</span>
                 			</c:when>
								<c:otherwise>
                        	<a href="javascript:rating(${order.prodNo});">${order.prodName }</a>								
								</c:otherwise>
                 		</c:choose>
						</div>								
                </div>
                    <div class="subdiv">
                        <div class="basketprice">${order.orderPrice}</div>
                        <div class="basketprice" style="text-align: right;">${order.prodQty }</div>
                        <div class="basketprice" style="text-align: right;">${order.orderPrice * order.prodQty }</div>
                    </div>
                </div>
                </c:forEach>
                </div>
    </div>
  </div>
 </div>
</div>
</body>
<script type="text/javascript">

	function add_buy_btn(){
		
		if(sessionStorage.length != 0){
		
        var str = '';
		 str += '<div class="d-flex flex-row-reverse bd-highlight">';
		 str += '<div class="p-2 bd-highlight"></div>';
		 str += '<div class="p-2 bd-highlight"></div>';
		 str += '<div class="p-2 bd-highlight"></div>';
		 str += '<div class="p-2 bd-highlight"></div>';
		 str += '<div class="p-2 bd-highlight">';
		 str += '<button id="basket-order" type="submit" class="order-btn"><i class="bi bi-hand-index-thumb"></i>  주문하기</button>';
		 str += '</div>';
		 str += '</div>';
		
		$('form[name=orders]').append(str);
		}
	}
	function calc() {
		var totalPrice = 0;
		document.querySelectorAll(".p_qty").forEach(function(item) {
			var count = parseInt(item.getAttribute('value'));
			var price = parseInt(item.previousElementSibling.previousElementSibling.getAttribute('value'));
			totalPrice += count * price;
		}, this);
		$('input[name=sumPrice]').val(totalPrice);
	}
	function getBasket() {
		for(var i = 0; i < sessionStorage.length; i++){
			var key = sessionStorage.key(i);
			var value = JSON.parse(sessionStorage.getItem(key));
			var str = "";
			var idx = 0;
			if (value.userId == "${sessionScope.USER_INFO.userId}") {
				str += '<input type="hidden" name="orders['+i+'].userId" value="${sessionScope.USER_INFO.userId }">';
				str += '<input type="hidden" name="orders['+i+'].sellerId" value="'+value.prodSeller+'">';
				str += '<input type="hidden" name="orders['+i+'].prodName" value="'+value.prodName+'">'
				for(var j = 0; j < value.optionNo.length;j++){
					str += '<div class="row '+key+'">';
					str += '<div class="subdiv">';
					str += '<input type="hidden" name="orders['+i+'].prodNo" value="'+value.prodNo+'">'
					str += '<div class="pname">'+ value.prodName+" ("+ value.optionNo[j] +'번 상품)</div>';
					str += '<input type="hidden" name="orders['+i+'].options['+j+'].optionNo" value="'+ value.optionNo[j] +'">'
					str += '</div>';
					str += '<div class="subdiv">'; 
					str += '<div class="basketprice" style="text-align: right;">'+ value.optionPrice[j] +'</div>';
					str += '<input type="hidden" class="p_price" id="p_price'+[idx]+'" name="orders['+i+'].options['+j+'].optionPrice" value="'+ value.optionPrice[j] +'">'
					str += '<div class="basketprice" style="text-align: right;">'+ value.prodQty[j] +'</div>';
					str += '<input type="hidden" class="p_qty" id="p_qty'+[idx]+'" name="orders['+i+'].options['+j+'].prodQty" value="'+ value.prodQty[j] +'">'
					str += '<div class="basketprice" style="text-align: right;">'+
							'<button class="delbtn btn btn-secondary a-btn" >장바구니 제거</button></div>';
					str += '</div>';
					str += '</div>';
					idx += 1;
				}
			}
			$('#basket-info').append(str);
		}
		$('.delbtn').on('click', function() {
			var keys = $(this).closest('.row').attr("class").split(' ')[1];
			console.log(keys);
 			var row = $(this).closest('.'+keys);
 			var idx = row.index('.'+keys);
			
			console.log(row);
			console.log(idx);
			
			var nValue = JSON.parse(sessionStorage.getItem(keys));
			nValue.optionNo.splice(idx,1);
			nValue.optionPrice.splice(idx,1);
			nValue.prodQty.splice(idx,1);
			if(nValue.optionNo.length == 0){
				sessionStorage.removeItem(keys);
			}else{
				sessionStorage.setItem(keys, JSON.stringify(nValue));
			}
		$(this).closest('.row').remove();
	})
	
	}
	function rating(prodNo) {
		var win = window.open('prod/rating?prodNo='+prodNo, '별점입력하기', 'top=10, left=10, width=500, height=600, status=no, menubar=no, toolbar=no, resizable=no');
		
		var inter = window.setInterval(function() {
			if(win.closed){
				window.clearInterval(inter);
				document.location.href = 'prodview?prodNo='+prodNo;	
			}
		}, 100)
		
		
		
	}
	getBasket();
	add_buy_btn();
	calc();
	
</script>
</html>