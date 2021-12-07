<%@page import="com.homedeco.member.model.MemberService"%>
<%@page import="java.sql.SQLException"%>
<%@page import="com.homedeco.member.model.MemberVO"%>
<%@page import="com.homedeco.product.model.ProductVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../section/top.jsp"%>
<jsp:useBean id="memService" class="com.homedeco.member.model.MemberService" 
	scope="session"></jsp:useBean>
<jsp:useBean id="pdService" class="com.homedeco.product.model.ProductService" 
	scope="session"></jsp:useBean>
<%
	String userid=request.getParameter("userid");
	int pdCode=(Integer)request.getAttribute("pdcode");
	int qty=(Integer)request.getAttribute("qty");
	
	ProductVO pdVo=null;
	MemberVO memVo=null;
	
	try {
		pdVo=pdService.selectByPdCode(pdCode);
		memVo=memService.selectByUserid(userid);
	} catch (SQLException e) {
		e.printStackTrace();
	}
	
	int total=pdVo.getPrice()*qty;
	
	request.setAttribute("userid", userid);
	request.setAttribute("pdCode", pdCode);
	request.setAttribute("qty", qty);
%>

<body class="masthead">
	<section class="page-section" id="portfolio"
		style="padding-top: 0px; padding-bottom: 0px">
		<h2>결제 정보 확인</h2>
		<form name="frmPurchase" method="get" action="purchase_ok.jsp">
			<div>
				<span class="sp1">상품명:</span> <span><%=pdVo.getPdName() %></span><br>
				<span class="sp1">수량:</span> <span><%=qty%></span><br>
				<span class="sp1">지불금액:</span> <span><%=total%></span><br>
				<span class="sp1">보유포인트:</span> <span><%=memVo.getPoint() %></span><br>
			</div>
			<div>
				<p class="checkPurchase">결제하시겠습니까?</p>
				<input type="submit" id="submit" value="결제">
			</div>	
		</form>
	</section>
</body>

<%@include file="../section/footer.jsp"%>