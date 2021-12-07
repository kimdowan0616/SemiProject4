<%@page import="com.homedeco.product.model.ProductVO"%>
<%@page import="com.homedeco.product.model.ProductService"%>
<%@page import="com.homedeco.purchase.model.PurchaseService"%>
<%@page import="com.homedeco.member.model.MemberService"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.homedeco.purchase.model.PurchaseVO"%>
<%@page import="java.util.List"%>
<%@page import="com.homedeco.purchase.model.PurchaseDAO"%>
<%@page import="java.sql.SQLException"%>
<%@page import="com.homedeco.member.model.MemberVO"%>
<%@page import="com.homedeco.member.model.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../section/top.jsp"%>

<%
	String userid=request.getParameter("userid");
	
	MemberService memService=new MemberService();
	MemberVO memVo=null;
	
	PurchaseService plService=new PurchaseService();
	List<PurchaseVO> pList=null;
	
	ProductService pdService=new ProductService();
	ProductVO pdVo=null;
	
	
	try {
		memVo=memService.selectByUserid(userid);
		pList=plService.selectByUserid(userid);
		
	} catch (SQLException e) {
		e.printStackTrace();
	}
	
	request.setAttribute("userid", userid);
%>

<body class="masthead">
	<section class="page-section" id="portfolio"
		style="padding-top: 0px; padding-bottom: 0px">
		<h2>마이 페이지</h2>
		<div class="myPage">
			<div class="firstDiv">
				<span class="sp1">내 회원정보</span>
				<hr>
				<span class="sp1">아이디:</span> <span><%=userid %></span><br>
				<span class="sp1">이름:</span> <span><%=memVo.getName() %></span><br>
				<span class="sp1">가입일:</span> <span><%=memVo.getRegdate() %></span><br>
				<span class="sp1">휴대전화: </span> <span><%=memVo.getHp() %></span><br>
				<span class="sp1">보유 포인트:</span> <span><%=memVo.getPoint() %></span>
			</div>
			
			<div class="secondDiv">
				<span class="sp2">내 쇼핑내역</span>
				<hr>
				<span>주문번호</span> <span>상품명</span> <span>수량</span> <span>결제일</span>
				<%
					for (int i=0; i<pList.size(); i++) {
						PurchaseVO vo=pList.get(i);
						
						pdVo=pdService.selectByPdCode(vo.getPdCode());
				%>
						<span><%=vo.getPlCode() %></span> <span><%=pdVo.getPdName() %></span> 
						<span><%=vo.getQty() %></span> <span><%=vo.getRegdate() %></span>
				<%	} %>
			</div>
			
			<div class="memOption">
				<a href='edit.jsp'>내 정보 수정</a> |
	        	<a href='memberOut.jsp'>회원탈퇴</a>
			</div>
		</div>
</section>
</body>

<%@include file="../section/footer.jsp"%>