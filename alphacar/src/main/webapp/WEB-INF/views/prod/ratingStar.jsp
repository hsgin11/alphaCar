<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<%request.setCharacterEncoding("UTF-8"); %>
<html>
<head>

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<!-- rating js, css -->
	<script src="<%=request.getContextPath() %>/resources/ratingResource/rating.js"></script>
   <link href="<%=request.getContextPath() %>/resources/ratingResource/rating.css" rel="stylesheet">

  <div class="wrap">
        <h1>${prod.prodName}의 후기</h1>
        <form name="reviewform" class="reviewform" method="post" action="prodSave">
            <input type="hidden" name="rate" id="rate" value="0"/>
            <input type="hidden" name="prodNo" value="${prod.prodNo}"/>
            
            <p class="title_star">별점과 상품후기를 남겨주세요.</p>
     
            <div class="review_rating rating_point">
                <div class="warning_msg">별점을 선택해 주세요.</div>
                <div class="rating">
                    <div class="ratefill"></div>
                    <!-- [D] 해당 별점이 선택될 때 그 점수 이하의 input엘리먼트에 checked 클래스 추가 -->
                    <input type="radio" name="rating" id="rating11" value="1" class="rate_radio" title="1점">
                    <label for="rating11"></label>
                    <input type="radio" name="rating" id="rating12" value="2" class="rate_radio" title="2점">
                    <label for="rating12"></label>
                    <input type="radio" name="rating" id="rating13" value="3" class="rate_radio" title="3점" >
                    <label for="rating13"></label>
                    <input type="radio" name="rating" id="rating14" value="4" class="rate_radio" title="4점">
                    <label for="rating14"></label>
                    <input type="radio" name="rating" id="rating15" value="5" class="rate_radio" title="5점">
                    <label for="rating15"></label>
                </div>
            </div>            
    
            <div class="review_contents">
                <br>
                <div class="warning_msg">5자 이상의 리뷰 내용을 작성해 주세요.</div>
                <textarea rows="10" name="prodComment" class="review_textarea"></textarea>
            </div>   
            <div class="cmd">
                <input type="submit" name="save" id="save" value="등록">
              <!--   <button name="save" id="save" >등록</button> -->
            </div>
        </form>
    </div>
</body>
</html>