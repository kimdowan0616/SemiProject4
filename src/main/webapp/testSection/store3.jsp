<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="top.jsp"%>
<article>
	<section class="page-section portfolio" id="portfolio">
		<div class="container">
			<h1>dowan</h1>
			<!-- text-secondary : 글씨 색상 
				mb-0 : margin-bottom !important https://www.codingfactory.net/10372
			-->
			<h2	class="page-section-heading text-center text-uppercase text-secondary mb-0"
				style="margin-top: 20px">내집내꾸 베스트</h2>
			<!-- Icon Divider-->
			<div class="divider-custom">	<!-- ㅡ★ㅡ을 가운데로 잡아줌 -->
				<div class="divider-custom-line"></div> <!-- ㅡ -->
				<div class="divider-custom-icon">	
					<i class="fas fa-star"></i>	<!-- 별 -->
				</div>
				<div class="divider-custom-line"></div>
			</div>
			
			<h4 class="text-left text-secondary mb-0">[카테고리명] 베스트</h4>
			<!-- 테스트 그리드 -->
			<div class="row justify-content-center">	<!-- 가로축 기준으로 center정렬 -->
				<div class="row justify-content-between" style="border-radius: 15px; border: solid black;" >	<!-- 요소들 사이에 동일 간격 -->
				<!-- 테스트 Item 1-->
					<div class="col-md-3 col-lg-3 mb-5">	<!-- 메모장 참고 -->
						<div class="portfolio-item mx-auto" data-bs-toggle="modal"
							data-bs-target="#modaltest1">	<!-- modal : 부트스트랩에서의 팝업 -->
							<div style="float: left;">aaa</div>
							<div>&nbsp;</div>
							<div
								class="portfolio-item-caption d-flex align-items-center justify-content-center h-100 w-100">
								<!-- 메모장 참고 -->
								<div
									class="portfolio-item-caption-content text-center text-white">
									<i class="fas fa-plus fa-3x"></i>	<!-- fas fa-plus 아이콘 중 fa-3x는 +모양 -->
								</div>
							</div>
							bbb <img class="img-fluid" src="../images/mood1.jpg" alt="..." style=""/>ccc
						</div>
						1
					</div>
				</div>
			</div>
		</div>
	</section>
</article>
<%@include file="footer.jsp"%>