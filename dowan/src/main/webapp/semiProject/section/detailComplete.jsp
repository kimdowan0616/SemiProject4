<%@page import="java.sql.SQLException"%>
<%@page import="com.product.model.productVO"%>
<%@page import="com.product.model.productDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	$(function() {
		$('#btnImageloading')
				.click(
						function() {
							/*$('#btnImageloading').html('<img class="i1" src="../assets/img/item/1-2.jpeg" alt="" />' +
								'<img class="i2" src="../assets/img/item/1-3.jpeg" alt="" />' +
								'<img class="i2" src="../assets/img/item/1-4.jpeg" alt="" />' +
								'<img class="i2" src="../assets/img/item/1-5.jpeg" alt="" />' +
								'<img class="i2" src="../assets/img/item/1-6.jpeg" alt="" />'
								);
								
								return false;*/
							$('#image-top')
									.html(
											'<img class="i1" src="../assets/img/item/1-1.jpg" alt="" />'
													+ '<img class="i1" src="../assets/img/item/1-2.jpg" alt="" />'
													+ '<img class="i2" src="../assets/img/item/1-3.jpg" alt="" />'
													+ '<img class="i2" src="../assets/img/item/1-4.jpg" alt="" />'
													+ '<img class="i2" src="../assets/img/item/1-5.jpg" alt="" />'
													+ '<img class="i2" src="../assets/img/item/1-6.jpg" alt="" />');
							$('#btnImageloading').hide();
						});
	});
</script>
<%
String pdcode = request.getParameter("pdcode");
if (pdcode == null || pdcode.isEmpty()) {
%>
<script type="text/javascript">
	alert("잘못된 url입니다.");
	location.href = "main.jsp";
</script>
<%
return;
}

//2
productDAO dao = new productDAO();

productVO vo = null;
try {
vo = dao.selectBypdCode(pdcode);
} catch (SQLException e) {
e.printStackTrace();
}
%>
<style type="text/css">
#wrap {
	width: 1100px;
	margin: 0 auto;
	padding-top: 100px;
}

#container {
	/*clear: both;*/
	width: 96%;
	margin: 0 auto;
	overflow: auto;
	background: white;
}

/* contents */
#container #contents {
	float: left;
	background: #fff;
	width: 90.0%;
	/*position: relative;*/
	padding: 1% 0 5% 0;
}

/* centerCon */
#container #contents #centerCon {
	clear: both;
	padding: 3% 2% 0 1%;
	float: left;
	width: 65%;
}

/* rightCon */
#container #contents #rightCon {
	float: right;
	padding: 0 0 0 1.5%;
	width: 30.5%;
	line-height: 1.5;
	padding-top: 30px;
}

#rightCon div {
	padding-top: 5px;
}

#btnId:hover {
	color: white;
	background: blue;
}

.image {
	display: none;
}

.price-info-detail {
	margin-top: 30px;
	font-size: 2.0em;
}

.button__row {
	height: 50px;
	margin: 10px;
}

.button__row>button {
	width: 120px;
	height: 50px;
	border-radius: 5px;
	cursor: pointer;
	outline: none;
	background-color: #ffa9a9;
}

.button__row>button:hover {
	background-color: #FC7174;
}

.table {
	width: 100%;
}
</style>
</head>
<body>
	<%@include file="top.jsp"%>
	<div id="wrap">
		<div id="container">
			<section id="contents">
				<article id="centerCon">
					<meta name="viewport"
						content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">
					<!-- Link Swiper's CSS -->
					<link rel="stylesheet"
						href="https://unpkg.com/swiper/swiper-bundle.min.css">

					<!-- Demo styles -->
					<style>
html, body {
	position: relative;
	height: 100%;
}

body {
	background: #eee;
	font-family: Helvetica Neue, Helvetica, Arial, sans-serif;
	font-size: 14px;
	color: #000;
	margin: 0;
	padding: 0;
}

.swiper {
	width: 100%;
	height: 100%;
}

.swiper-slide {
	text-align: center;
	font-size: 18px;
	background: #fff;
	/* Center slide text vertically */
	display: -webkit-box;
	display: -ms-flexbox;
	display: -webkit-flex;
	display: flex;
	-webkit-box-pack: center;
	-ms-flex-pack: center;
	-webkit-justify-content: center;
	justify-content: center;
	-webkit-box-align: center;
	-ms-flex-align: center;
	-webkit-align-items: center;
	align-items: center;
}

.swiper-slide img {
	display: block;
	width: 100%;
	height: 100%;
	object-fit: cover;
}

.swiper {
	margin-left: auto;
	margin-right: auto;
}
</style>
					</head>
					<!-- Item Slide 시작 -->
					<body>
						<!-- Swiper -->
						<div
							class="swiper mySwiper swiper-initialized swiper-horizontal swiper-pointer-events">
							<div class="swiper-wrapper" id="swiper-wrapper-bc48b346f2a7d954"
								aria-live="polite"
								style="transition-duration: 0ms; transform: translate3d(-19500px, 0px, 0px);">
								<div
									class="swiper-slide swiper-slide-duplicate swiper-slide-next swiper-slide-duplicate-prev"
									data-swiper-slide-index="8" role="group" aria-label="9 / 9"
									style="width: 1920px; margin-right: 30px;"></div>
								<div class="swiper-slide swiper-slide-duplicate-active"
									data-swiper-slide-index="0" role="group" aria-label="1 / 6"
									style="width: 1920px; margin-right: 30px;">
									<img src="../assets/img/item/<%=vo.getPdcode() %>_slide_1.jpg"
										style="width: 300px; height: 300px;" />
								</div>
								<div class="swiper-slide" data-swiper-slide-index="1"
									role="group" aria-label="2 / 6"
									style="width: 1920px; margin-right: 30px;">
									<img src="../assets/img/item/<%=vo.getPdcode() %>_slide_2.jpg"
										style="width: 300px; height: 300px;" />
								</div>
								<div class="swiper-slide" data-swiper-slide-index="2"
									role="group" aria-label="3 / 6"
									style="width: 1920px; margin-right: 30px;">
									<img src="../assets/img/item/<%=vo.getPdcode() %>_slide_3.jpg"
										style="width: 300px; height: 300px;" />
								</div>
								<div class="swiper-slide" data-swiper-slide-index="3"
									role="group" aria-label="4 / 6"
									style="width: 1920px; margin-right: 30px;">
									<img src="../assets/img/portfolio/table4.jpg"
										style="width: 300px; height: 300px;" />
								</div>
								<div class="swiper-slide" data-swiper-slide-index="4"
									role="group" aria-label="5 / 6"
									style="width: 1920px; margin-right: 30px;">
									<img src="../assets/img/portfolio/table5.jpg"
										style="width: 300px; height: 300px;" />
								</div>
								<div
									class="swiper-slide swiper-slide-prev swiper-slide-duplicate-next"
									data-swiper-slide-index="6" role="group" aria-label="6 / 6"
									style="width: 1920px; margin-right: 30px;">
									<img src="../assets/img/portfolio/table6.jpg"
										style="width: 300px; height: 300px;" />
								</div>
								<div
									class="swiper-slide swiper-slide-duplicate swiper-slide-active"
									data-swiper-slide-index="0" role="group" aria-label="1 / 6"
									style="width: 1920px; margin-right: 30px;"></div>
							</div>
							<div class="swiper-button-next" tabindex="0" role="button"
								aria-label="Next slide"
								aria-controls="swiper-wrapper-bc48b346f2a7d954"></div>
							<div class="swiper-button-prev" tabindex="0" role="button"
								aria-label="Previous slide"
								aria-controls="swiper-wrapper-bc48b346f2a7d954"></div>
							<div
								class="swiper-pagination swiper-pagination-clickable swiper-pagination-bullets swiper-pagination-horizontal">
								<span
									class="swiper-pagination-bullet swiper-pagination-bullet-active"
									tabindex="0" role="button" aria-label="Go to slide 1"></span> <span
									class="swiper-pagination-bullet" tabindex="0" role="button"
									aria-label="Go to slide 2"></span> <span
									class="swiper-pagination-bullet" tabindex="0" role="button"
									aria-label="Go to slide 3"></span> <span
									class="swiper-pagination-bullet" tabindex="0" role="button"
									aria-label="Go to slide 4"></span> <span
									class="swiper-pagination-bullet" tabindex="0" role="button"
									aria-label="Go to slide 5"></span> <span
									class="swiper-pagination-bullet" tabindex="0" role="button"
									aria-label="Go to slide 6"></span>
							</div>
							<span class="swiper-notification" aria-live="assertive"
								aria-atomic="true"></span>
						</div>

						<!-- Swiper JS -->
						<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>

						<!-- Initialize Swiper -->
						<script>
							var swiper = new Swiper(".mySwiper", {
								slidesPerView : 1,
								spaceBetween : 30,
								loop : true,
								pagination : {
									el : ".swiper-pagination",
									clickable : true,
								},
								navigation : {
									nextEl : ".swiper-button-next",
									prevEl : ".swiper-button-prev",
								},
							});
						</script>
					</body>
				</article>
				<!-- Item Slide 끝 -->
				
				<!-- 상단 Item Info 시작  -->
				<article id="rightCon">
					<div>레트로하우스</div>
					<div style="font-size: 40px"><%=vo.getPdname()%></div>
					<div class="price-original" style="width: 100%; margin-top: 20px;">
						<span><%=vo.getPrice()%></span>
					</div>
					<div class="price-info-detail">
						<span class="discount"> 55% </span> <span class="price">
							39,900<span class="price-unit">원</span>
						</span>
					</div>
					<div id="benefit">
						<table class="box2">
							<colgroup>
								<col style="width: 20%;" />
								<col style="width: 80%;" />
							</colgroup>
							<tbody>
								<tr>
									<td style="color: gray;">혜택</td>
									<td style="text-align: right;"><%=vo.getPrice() / 100%>P 적립
										(회원 1% 적용)</td>
								</tr>
								<tr>
									<td style="color: gray;">배송비</td>
									<td style="text-align: right;">개당 6,000원</td>
								</tr>
							</tbody>
						</table>
					</div>
					<div class="button__row">
						<button type="button">장바구니 담기</button>
						<button type="button">바로 구매</button>
					</div>
				</article>
				<!-- 상단 Item Info 끝  -->
			</section>
			
			<!-- 메인 Item Info 시작 -->
			<div id="item-view-body">
				<table>
					<tr>
						<th><h2 style="margin-left: 10px;">제품 설명</h2></th>
					</tr>
					<tr>
						<th id="image-top" style="border: 2px solid gray" width="1050px"><img
							src="../assets/img/item/1-1.jpg" /></th>
					</tr>
					<tr>
						<th><button class="btnImageloading" id="btnImageloading"
								type="button"
								style="background-color: white; color: blue; left: 50%; width: 100%; height: 40px;">
								<p>상품설명 더 보기</p>
							</button></th>
					</tr>
				</table>
			</div>
			<!-- 메인 Item Info 끝 -->
		</div>
	</div>

	<%@include file="footer.jsp"%>
</body>
</html>