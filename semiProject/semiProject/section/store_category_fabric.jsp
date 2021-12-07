<%@page import="java.text.DecimalFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.SQLException"%>
<%@page import="com.product.model.productVO"%>
<%@page import="java.util.List"%>
<%@page import="com.product.model.productDAO"%>
<%@page import="java.util.ArrayList"%>
<%
	//1
	request.setCharacterEncoding("utf-8");
	String category = "패브릭";
	
	//2
	productDAO dao = new productDAO();
	
	List<productVO> list=null;
	try{
		list=dao.selectByCategory(category);
	}catch(SQLException e){
		e.printStackTrace();		
	}
	
	DecimalFormat df = new DecimalFormat("###,###");
%>

<%@include file="top.jsp"%>
<article>
	<section class="page-section portfolio" id="portfolio">
		<div class="container">
			<h1>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</h1>
			<!-- text-secondary : 글씨 색상 
				mb-0 : margin-bottom !important https://www.codingfactory.net/10372
			-->
			<h2	class="page-section-heading text-center text-uppercase text-secondary mb-0"
				style="margin-top: 20px">내집내꾸 베스트</h2>
			<!-- Icon Divider-->
			<div class="divider-custom">	<!-- ㅡ★ㅡ을 가운데로 잡아줌 -->
				<div class="divider-custom-line"></div> <!-- ㅡ -->
				<div class="divider-custom-icon text-secondary">	
					<i class="fas fa-star"></i>	<!-- 별 -->
				</div>
				<div class="divider-custom-line"></div>
			</div>
			
			<!-- 테스트 그리드 -->
			<div class="row justify-content-center">	<!-- 가로축 기준으로 center정렬 -->
				<div class="row justify-content-between" style="border-radius: 15px; border: solid black;" >	<!-- 요소들 사이에 동일 간격 -->
						<%
						productVO vo;
						
						int i = 0;
						while (i<list.size()){
							int j = i+1;
							if(i==(list.size()-1)){
								vo = list.get(i); 
								%>
					<!-- 테스트 Item 1 / 3rd -->
					<div class="col-md-3 col-lg-3 mb-5 mt-3">	<!-- 메모장 참고 -->
						<!-- 금메달 -->
						<div class="mx-1" style="position: relative; float: left;">
							<div style="position: absoulte; top: 10px; left: 10px;">
								<img src="../assets/img/portfolio/rank-<%=j %>.png" width="30px"
									height="30px" style=""></img>
							</div>
						</div>
						<!-- 금메달 끝 -->
						<div class="portfolio-item mx-auto" data-bs-toggle="modal"
							data-bs-target="#modaltest1">	<!-- modal : 부트스트랩에서의 팝업 -->
							<div
								class="portfolio-item-caption d-flex align-items-center justify-content-center h-100 w-100">
								<!-- 메모장 참고 -->
								<div
									class="portfolio-item-caption-content text-center text-white">
									<i class="fas fa-plus fa-3x"></i>	<!-- fas fa-plus 아이콘 중 fa-3x는 +모양 -->
								</div>
							</div>
							<img class="img-fluid" src="../images/mood1.jpg" alt="..." />
						</div>
						
						<div class="item-desc" style="margin-left:40px">
							<div class="brand">레트로하우스</div>
							<div class="name"><%=vo.getPdname() %></div>
							<div class="price-info">
								<span class="discount"> 55% </span> <span class="price">
									39,900<span class="price-unit">원</span>
								</span>
							</div>
							<div class="price-original" style="right: 5px">
								<span><%=df.format(vo.getPrice()) %></span>
							</div>
							<div class="review">
								<img
									src="//cdn.ggumim.co.kr/storage/20201124131919ibuV8ryVUZ.png"
									alt=""> <span class="rate">4.9</span> <span class="count">(43)</span>
							</div>
						</div>
					</div>
					<!-- 테스트 Item 1 끝 -->
								<% 
							}else{
								vo = list.get(i); %>
					<!-- 테스트 Item 2-->
					<div class="col-md-3 col-lg-3 mb-5 mt-3">	<!-- 메모장 참고 -->
						<!-- 금메달 -->
						<div class="mx-1" style="position: relative; float: left;">
							<div style="position: absoulte; top: 10px; left: 10px;">
								<img src="../assets/img/portfolio/rank-<%=j %>.png" width="30px"
									height="30px" style=""></img>
							</div>
						</div>
						<!-- 금메달 끝 -->
						<div class="portfolio-item mx-auto" data-bs-toggle="modal"
							data-bs-target="#modaltest1">	<!-- modal : 부트스트랩에서의 팝업 -->
							<div
								class="portfolio-item-caption d-flex align-items-center justify-content-center h-100 w-100">
								<!-- 메모장 참고 -->
								<div
									class="portfolio-item-caption-content text-center text-white">
									<i class="fas fa-plus fa-3x"></i>	<!-- fas fa-plus 아이콘 중 fa-3x는 +모양 -->
								</div>
							</div>
							<img class="img-fluid" src="../images/mood1.jpg" alt="..." />
						</div>
						
						<div class="item-desc" style="margin-left:40px">
							<div class="brand">레트로하우스</div>
							<div class="name"><%=vo.getPdname() %></div>
							<div class="price-info">
								<span class="discount"> 55% </span> <span class="price">
									39,900<span class="price-unit">원</span>
								</span>
							</div>
							<div class="price-original" style="right: 5px">
								<span><%=df.format(vo.getPrice()) %></span>
							</div>
							<div class="review">
								<img
									src="//cdn.ggumim.co.kr/storage/20201124131919ibuV8ryVUZ.png"
									alt=""> <span class="rate">4.9</span> <span class="count">(43)</span>
							</div>
						</div>
					</div>
					<!-- 테스트 Item 2 끝 -->
						<%	}
							// else문 끝
							if(i==2) break;
							
							i++;
						} %>
						<!-- while문 끝 -->
				</div>
			</div> <!-- 테스트 그리드 끝 -->
			
			<!-- 베스트 끝남@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
			
			<h4 class="text-left text-secondary mb-2" style="margin-top: 15px">검색 키워드 : <%=category %></h4>
			<!-- 테스트 그리드 -->
			<div class="row justify-content-center">	<!-- 가로축 기준으로 center정렬 -->
				<div class="row justify-content-between" style="border-radius: 15px; border: solid black;" >	<!-- 요소들 사이에 동일 간격 -->
						<%
						i = 0;
						while (i<list.size()){
							if(i==(list.size()-1)){
								vo = list.get(i); %>
					<!-- 테스트 Item 1-->
					<div class="col-md-3 col-lg-3 mb-5 mt-3">	<!-- 메모장 참고 -->
						<div class="portfolio-item mx-auto" data-bs-toggle="modal"
							data-bs-target="#modaltest1">	<!-- modal : 부트스트랩에서의 팝업 -->
							<div
								class="portfolio-item-caption d-flex align-items-center justify-content-center h-100 w-100">
								<!-- 메모장 참고 -->
								<div
									class="portfolio-item-caption-content text-center text-white">
									<i class="fas fa-plus fa-3x"></i>	<!-- fas fa-plus 아이콘 중 fa-3x는 +모양 -->
								</div>
							</div>
<!-- @@@@@@@@@@@@@ -->		<a href="detailComplete.jsp?pdcode=<%=vo.getPdcode()%>">
								<img class="img-fluid" src="<%=vo.getImage() %><%=vo.getPdcode() %>_slide_1.jpg" alt="..." />
							</a>
						</div>
						
						<div class="item-desc">
							<div class="brand">레트로하우스</div>
							<div class="name"><%=vo.getPdname() %></div>
							<div class="price-info">
								<span class="discount"> 55% </span> <span class="price">
									39,900<span class="price-unit">원</span>
								</span>
							</div>
							<div class="price-original" style="right: 5px">
								<span><%=df.format(vo.getPrice()) %></span>
							</div>
							<div class="review">
								<img
									src="//cdn.ggumim.co.kr/storage/20201124131919ibuV8ryVUZ.png"
									alt=""> <span class="rate">4.9</span> <span class="count">(43)</span>
							</div>
						</div>
					</div>
					<!-- 테스트 Item 1 끝 -->
								<% break; 
							}else{
								vo = list.get(i); %>
					<!-- 테스트 Item 2-->
					<div class="col-md-3 col-lg-3 mb-5 mt-3">	<!-- 메모장 참고 -->
						<div class="portfolio-item mx-auto" data-bs-toggle="modal"
							data-bs-target="#modaltest1">	<!-- modal : 부트스트랩에서의 팝업 -->
							<div
								class="portfolio-item-caption d-flex align-items-center justify-content-center h-100 w-100">
								<!-- 메모장 참고 -->
								<div
									class="portfolio-item-caption-content text-center text-white">
									<i class="fas fa-plus fa-3x"></i>	<!-- fas fa-plus 아이콘 중 fa-3x는 +모양 -->
								</div>
							</div>
							<a href="detailComplete.jsp?pdcode=<%=vo.getPdcode()%>">
								<img class="img-fluid" src="<%=vo.getImage() %><%=vo.getPdcode() %>_slide_1.jpg" alt="..." />
							</a>
						</div>
						
						<div class="item-desc">
							<div class="brand">레트로하우스</div>
							<div class="name"><%=vo.getPdname() %></div>
							<div class="price-info">
								<span class="discount"> 55% </span> <span class="price">
									39,900<span class="price-unit">원</span>
								</span>
							</div>
							<div class="price-original" style="right: 5px">
								<span><%=df.format(vo.getPrice()) %></span>
							</div>
							<div class="review">
								<img
									src="//cdn.ggumim.co.kr/storage/20201124131919ibuV8ryVUZ.png"
									alt=""> <span class="rate">4.9</span> <span class="count">(43)</span>
							</div>
						</div>
					</div>
					<!-- 테스트 Item 2 끝 -->
						<%	}
							// else문 끝
							i++;
						} %>
						<!-- while문 끝 -->
				</div>
			</div> <!-- 테스트 그리드 끝 -->
			
		</div>
	</section>
</article>
<%@include file="footer.jsp"%>