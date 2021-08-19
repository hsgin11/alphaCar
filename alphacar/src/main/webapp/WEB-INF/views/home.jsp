<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page session="true" %>
<html>
<head>
<%@include file="/WEB-INF/inc/header.jsp" %>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.hit {
	animation-name: blink;
	animation-duration: 2s;
	animation-timing-function: ease;
	animation-iteration-count: infinite;
	font-size: 12px;
	vertical-align: top;
}

@keyframes blink {
	from {color: white;
	}
	30%	{
	color:rgb(116,96,73);
	}
	to {
	color: rgb(232,193,147);
	
	}
}
.notice-board{	
	width:600px;
	margin-right:14px;
	border: 2px solid rgb(232,193,147); border-bottom-right-radius: 1em; border-top-left-radius: 1em;
	padding: 10px; 
	
}
.best-board{	
	height:180px;
	border: 2px solid rgb(232,193,147); border-bottom-right-radius: 1em; border-top-left-radius: 1em;
	padding-left:0;
	padding-top: 10px;
	padding-right: 0;
	padding-bottom: 10px;	 
}
.notice{
	color: rgb(232,193,147);
	background-color: transparent;
	border-color: transparent;
	border-bottom-color: rgb(232,193,147);	
	border-bottom: 2.5px solid;
	text-align: center;
	padding: 0;
	width: 50%;
	height: 30px;
	float: left;
	border-top-right-radius: 1em;
	border-top-left-radius: 1em;
}
.infoboard-btn{
	color: #c0c0c0;
	background-color: transparent;
	border-color: transparent;	
	text-align: center;
	padding: 0;
	width: 50%;
	height: 30px;
	float: left;
	border-top-right-radius: 1em;
	border-top-left-radius: 1em;
}
.infonotice-btn{
	color: #c0c0c0;
	background-color: transparent;
	border-color: transparent;	
	text-align: center;
	padding: 0;
	width: 50%;
	height: 30px;
	float: left;
	border-top-right-radius: 1em;
	border-top-left-radius: 1em;
}
.qnaboard-btn{
	color: #c0c0c0;
	background-color: transparent;
	border-color: transparent;	
	text-align: center;
	padding: 0;
	width: 50%;
	height: 30px;
	float: left;
	border-top-right-radius: 1em;
	border-top-left-radius: 1em;
}
.qnanotice-btn{
	color: #c0c0c0;
	background-color: transparent;
	border-color: transparent;	
	text-align: center;
	padding: 0;
	width: 50%;
	height: 30px;
	float: left;
	border-top-right-radius: 1em;
	border-top-left-radius: 1em;
}

.info-fo{
	color: rgb(232,193,147);
	background-color: transparent;
	border-color: transparent;
	border-bottom-color: rgb(232,193,147);	
	border-bottom: 2.5px solid;
	text-align: center;
	padding: 0;
	width: 50%;
	height: 30px;
	float: left;
	border-top-right-radius: 1em;
	border-top-left-radius: 1em;
}

.qna-fo{
	color: rgb(232,193,147);
	background-color: transparent;
	border-color: transparent;
	border-bottom: 2.5px solid;
	border-bottom-color: rgb(232,193,147);	
	text-align: center;
	padding: 0;
	width: 50%;
	height: 30px;
	float: left;
	border-top-right-radius: 1em;
	border-top-left-radius: 1em;
}
#table-body{
	
	font-size: 18px;
}
.a1{
	color: #c0c0c0;
	text-decoration: none;
}

table {
  counter-reset: rowNumber;
}

table tr::before {
  display: table-cell;
  counter-increment: rowNumber;
  content: counter(rowNumber) ".";
  padding-right: 0.3em;
  text-align: right;
  color: rgb(232,193,147);
  vertical-align: middle;
  width: 50px;	
}
table tr{
	vertical-align: top;
}
.banner-size{
	width: 1300px;
	height: 300px;
}
</style>
</head>
<body class="bg-dark">
<%@include file="/WEB-INF/inc/top.jsp" %>
    <!-- ===============================================-->
    <!--    Main Content-->
    <!-- ===============================================-->
    <main class="main" id="top">
     

      <section class="py-0" id="outlet" style="margin-top: 30px">

        <div class="container ">
        
  <div id="carouselExampleControls1" class="carousel slide" data-bs-ride="carousel">
  <div class="carousel-inner">
    <div class="carousel-item active">
     <img src="<%=request.getContextPath() %>/resources/etc/banner1.jpg" class="d-block banner-size" alt="...">
    </div>
    <div class="carousel-item">
      <img src="<%=request.getContextPath() %>/resources/etc/banner2.jpg" class="d-block banner-size" alt="...">
    </div>
    <div class="carousel-item">
      <img src="<%=request.getContextPath() %>/resources/etc/banner3.jpg" class="d-block banner-size" alt="...">
    </div>
    
  </div>
  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControls1" data-bs-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Previous</span>
  </button>
  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControls1" data-bs-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Next</span>
  </button>
</div>
<hr style="color: rgb(232,193,147)">
<div class="row h-50" style="margin-bottom: 50px">
	    	<div class="col-md-6">
		    	<div id="youtube" class="" style="margin-left: 60px;">
		    	</div>
	    	</div>
	    	<div class="col-md-5" style="margin-left: 70px; display: block; margin: auto;">
		    	<div id="carouselExampleControls" class="carousel slide" data-bs-ride="carousel" >
					  <div class="carousel-inner">
					    <div class="carousel-item active">
					    <div class="row">
						    <div class="col-md-12">
						     	<img src="https://post-phinf.pstatic.net/MjAyMTA4MTJfMjAx/MDAxNjI4NzM4NzE0NzUx.pe0b2yMdR4Ma1xtryv5AYo-hayy5LS_bMDMoWso89Qkg.Pe5OH9vq3NHvBA5s6uoj2J0mggQtMtUZzZJcqfvFq-kg.PNG/ImCTv89OwFRvm3J2_pgLTRnbhxbA.jpg?type=f215_143" class="h-70" alt="..." style="width: 100%">
						    </div>
						    <div class="" style="padding: 20px; font-size: 20px;">
						     	<span style="color: white; height: 300px;">BMW 코리아, 8월 온라인 한정으로 뉴 M5 CS 출시</span>
						    </div>
					    </div>
					    </div>
					    <div class="carousel-item row">
					    <div class="row">
						    <div class="col-md-12">
						     	<img src="https://post-phinf.pstatic.net/MjAyMTA4MTJfNjIg/MDAxNjI4NzM2MDcyMzE1.q1E5C5g7DvZ3H8phWc8jRsKSMLm9AmjNQFgLU5wNNSMg.HcH7yrPjZLRVkB5rhGi4DwffOsKYlVxOSqCnm6NAZfog.PNG/If10-84g-EvFXf7xmsD3eFVlMQHA.jpg?type=f215_143" class="h-70" alt="..." style="width: 100%">
						    </div>
						    <div class="" style="padding: 20px; font-size: 20px;">
						     	<span style="color: white; height: 300px;">쉐보레, 버추얼 인플루언서 ‘로지’ 등장한 <br>볼트EUV·볼트EV 숏폼 콘텐츠 공개</span>
						    </div>
					    </div>	
					    </div>
					    <div class="carousel-item">
					     <div class="row">
						    <div class="col-md-12">
						     	<img src="https://post-phinf.pstatic.net/MjAyMTA4MTJfMTA0/MDAxNjI4NzI5OTY5NjMx.4GBvmkd72RnI3nNhL-wkLpRxCJBOEbzBCHqwH7Ck0vog.sxTOchNd6ILyndw6lA1yN2AzfrjFqLCOYVBwz2OY1mog.JPEG/InBpkJzS-x08A825OnIKjKTA35m4.jpg?type=f215_143" class="h-70" alt="..." style="width: 100%; text-align: c">
						    </div>
						    <div class="" style="padding: 20px; font-size: 20px;">
						     	<span style="color: white; height: 300px;">메르세데스 벤츠, 카투엑스 기능 업데이트로 노면 상황 <br>실시간으로 회피 가능</span>
						    </div>
					    </div>
					    </div>
					  </div>
					  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="prev">
					    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
					    <span class="visually-hidden">Previous</span>
					  </button>
					  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="next">
					    <span class="carousel-control-next-icon" aria-hidden="true"></span>
					    <span class="visually-hidden">Next</span>
					  </button>
				</div>
		    </div>
        </div>
<hr style="color: rgb(232,193,147)">

<div class="container">
  <div class="row">
  <!-- 공지사항 -->
  <div class="col-md-1"></div>
     <div class="col-md-6 notice-board">
    	<div class="row row-2">
		<button class="infonotice-btn info-fo" onclick="notice_list('info')">정보게시판 공지사항</button>
		<button class="qnanotice-btn" onclick="notice_list('qna')">문의게시판 공지사항</button>				
		</div>				
    <div class="row row-6">
			<table  id="table2">
			<tbody id="table-body2">
			</tbody>
			</table>
    </div>
    </div>
    <!-- 베스트 -->
    <div class="col-md-4 best-board ">           
    	<div class="row row-2">    	
    		<div>
				<button class="infoboard-btn info-fo" onclick="best_list('info')">정보게시판</button>		
				<button class="qnaboard-btn" onclick="best_list('qna')">QnA</button>    		
    		</div>
		</div>				
    <div class="row row-6">
			<table  id="table1">
			<tbody id="table-body">
			</tbody>
			</table>
    </div>
    </div>
  </div>
</div>
</div>

</body>
<script type="text/javascript">
	// bestBoard-btn
	$(".infoboard-btn").click(function() {
		$(".infoboard-btn").addClass("info-fo");
		$(".qnaboard-btn").removeClass("qna-fo");
	});
	$(".qnaboard-btn").click(function() {
		$(".infoboard-btn").removeClass("info-fo");
		$(".qnaboard-btn").addClass("qna-fo");
	});
	// noticeBoard-btn
	$(".infonotice-btn").click(function() {
		$(".infonotice-btn").addClass("info-fo");
		$(".qnanotice-btn").removeClass("qna-fo");
	});
	$(".qnanotice-btn").click(function() {
		$(".infonotice-btn").removeClass("info-fo");
		$(".qnanotice-btn").addClass("qna-fo");
	});
	
	function notice_list(board) {
		var a = {"a" : board};
		$.ajax({
			type : "post",
			url : "<c:url value='/notice'/>",
			data : a,
			dataType : "JSON",
			success : function(data) {
				$div = $("#table-body2");
				var str = '';
				$div.text('');
				$.each(data.data, function(index, element) {
					str += '<tr>';
					
					if(data.board == "info"){
						str += '<td><a class="a1" href="view?infoBoardNo='+ element.infoBoardNo+'">' + element.infoBoardTitle;
					}else{
						str += '<td><a class="a1" href="questionview?boNo='+ element.questionBoardNo+'">' + element.questionBoardTitle;
					}
					str +=	'</td>';
					str += '</tr>';
				});
				$div.append(str);
			}
		})
	}	
	
	
	// bestList
	function best_list(board) {		
		var a = {"a" : board};
		
		$.ajax({
			type : "post",
			url : "<c:url value='/best'/>",
			data : a,
			dataType : "JSON",
			success : function(data) {
				//console.log(data.data)
				$div = $("#table-body");
				var str = '';
				$div.text('');
				$.each(data.data, function(index, element) {
					console.log(element.infoBoardNo);
					console.log(element);
					str += '<tr>';
					
					if(data.board == "info"){
						str += '<td><a class="a1" href="view?infoBoardNo='+ element.infoBoardNo+'">' + element.infoBoardTitle;
					}else{
						
						str += '<td><a class="a1" href="questionview?boNo='+ element.questionBoardNo+'">' + element.questionBoardTitle;
					}
					
					if(element.infoBoardHit >= 30){
						str += '<span class="hit">  Best</span>'+ '</a>';		
					}else if(element.questionBoardHit >= 30){
						str += '<span class="hit">  Best</span>'+ '</a>';
					}
					str +=	'</td>';
					str += '</tr>';
				});
				
				$div.append(str);
			}
		})
	}
	best_list("info");
	notice_list("info");
	
	 var key = "AIzaSyAipdJiERI44y3sWSA-W2lBn-j6NQc-x_Y";
     var item = [];
     var primaryUrl = "https://www.googleapis.com/youtube/v3/videos?part=snippet&key=" + key + "&chart=mostPopular&videoCategoryId=2&regionCode=kr&maxResults=1";
     function videoSearch() {
         $.ajax({
           type: "GET",
           url: primaryUrl,
           dataType: "jsonp",
           success: function (jdata) {
             $(".video-container").empty();
             iframe(jdata.items);
           },
           error: function (e) {
             console.log(e);
             alert("에러");
             return;
           }
         });
       }
     function iframe(item) {
         for (var i = 0; i < item.length; i++) {
             $('#youtube').append('<iframe style="width : 100%;height:100%" id="player" src="https://www.youtube.com/embed/' + item[i].id + '?controls=2"loading="lazy"></iframe>')
         }
       }
     videoSearch();
	
</script>
</html>
