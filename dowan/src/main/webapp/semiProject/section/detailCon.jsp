<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/ConStyle.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
$(function(){  
	$('#btnImageloading').click(function(){
		/*$('#btnImageloading').html('<img class="i1" src="../assets/img/item/1-2.jpeg" alt="" />' +
			'<img class="i2" src="../assets/img/item/1-3.jpeg" alt="" />' +
			'<img class="i2" src="../assets/img/item/1-4.jpeg" alt="" />' +
			'<img class="i2" src="../assets/img/item/1-5.jpeg" alt="" />' +
			'<img class="i2" src="../assets/img/item/1-6.jpeg" alt="" />'
			);
			
			return false;*/
			$('#image-top').html('<img class="i1" src="../assets/img/item/1-1.jpeg" alt="" />' +
					'<img class="i1" src="../assets/img/item/1-2.jpeg" alt="" />' +
					'<img class="i2" src="../assets/img/item/1-3.jpeg" alt="" />' +
					'<img class="i2" src="../assets/img/item/1-4.jpeg" alt="" />' +
					'<img class="i2" src="../assets/img/item/1-5.jpeg" alt="" />' +
					'<img class="i2" src="../assets/img/item/1-6.jpeg" alt="" />'
					);
			$('#btnImageloading').hide();
	});  
}) ;
</script>
<style type="text/css">
#wrap	{
	width: 1100px;
	margin: 0 auto;
}
	
#container	{
	/*clear: both;*/
	width:96%;margin: 0 auto;

	overflow: auto;
	background: white;
	}
	
/* contents */
#container #contents	{
	float: left;
	background: #fff;
	width: 90.0%;
	/*position: relative;*/
	padding: 1% 0 5% 0; 
	}

/* centerCon */
#container #contents #centerCon	{
	clear: both;
	padding: 3% 2% 0 1%;
	float: left;
	width: 65%;
	}
	
/* rightCon */
#container #contents #rightCon	{
	float: right;
	padding: 0 0 0 1.5%;
	width: 30.5%;
	line-height: 1.5;
	padding-top: 30px;
}
#rightCon div{
	padding-top: 5px;
}

#btnId:hover{
	color: white;
	background: blue;
}
	
.image {
	display: none;
}

.price-info-detail{
	margin-top: 30px;
	font-size: 2.0em;
}

.button__row {
  height: 50px;
  margin: 10px;
}
.button__row > button {
	width: 120px;
	height: 50px;
	border-radius: 5px;
	cursor: pointer;
	outline: none;
	background-color: #ffa9a9;
}

.button__row > button:hover {
  background-color: #FC7174;
}

.table{
	width: 100%;
}

</style>
</head>
<body>
	<div id="wrap">
		<div id="container">
			<section id="contents">
				<article id="centerCon">
					<%@include file="slidePhoto.jsp" %>
				</article>
				<article id="rightCon">
							<div>레트로하우스</div>
							<div style="font-size: 40px">상품이름</div>
							<div class="price-original" style="width: 100%; margin-top: 20px;" >
								<span>상품가격</span>
							</div>
							<div class="price-info-detail">
								<span class="discount"> 55% </span>
								<span class="price"> 39,900<span class="price-unit">원</span></span>
							</div>
							<div id="benefit">
								<table class="box2">
									<colgroup>
										<col style="width:20%;" />
										<col style="width:80%;" />		
									</colgroup>
									<tbody>
										<tr>
											<td style="color: gray;">혜택</td>
											<td style="text-align: right;">  @@P 적립 (회원 1% 적용)</td>
										</tr>
										<tr>
											<td style="color: gray;">배송비</td>
											<td style="text-align: right;">  개당 6,000원</td>
										</tr>
									</tbody>			
								</table>
							</div>
							<div class="button__row">
								<button type="button">장바구니 담기</button>
								<button type="button">바로 구매</button>
							</div>
				</article>
			</section>
			<div id="item-view-body">
			<table>
				<tr><th id="image-top" style="border: 2px solid gray" width="1050px"><img src="../assets/img/item/1-1.jpeg" /></th></tr>
				<tr><th><button class="btnImageloading" id="btnImageloading" type="button"
					style="background-color: white; color: blue; left: 50%; width: 100%; height: 40px;"
				><p>상품설명 더 보기</p></button></th></tr>
				<tr><th><img id="image" class="image" src="../assets/img/item/1-2.jpeg" /></th></tr>
				<tr><th><img id="image" class="image" src="../assets/img/item/1-3.jpeg" /></th></tr>
				<tr><th><img id="image" class="image" src="../assets/img/item/1-4.jpeg" /></th></tr>
				<tr><th><img id="image" class="image" src="../assets/img/item/1-5.jpeg" /></th></tr>
				<tr><th><img id="image" class="image" src="../assets/img/item/1-6.jpeg" /></th></tr>
			</table>
		</div>
	</div>
	</div>
</body>
</html>