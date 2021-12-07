<%@page import="java.sql.SQLException"%>
<%@page import="com.homedeco.member.model.MemberVO"%>
<%@page import="com.homedeco.product.model.ProductVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="plService" class="com.homedeco.purchase.model.PurchaseService" 
	scope="session"></jsp:useBean>
<jsp:useBean id="pdService" class="com.homedeco.product.model.ProductService" 
	scope="session"></jsp:useBean>
<jsp:useBean id="memService" class="com.homedeco.member.model.MemberService" 
	scope="session"></jsp:useBean>
<%

	int pdCode=(Integer)request.getAttribute("pdcode");
	int qty=(Integer)request.getAttribute("qty");
	String userid=(String)request.getAttribute("userid");
	
	String msg="", url="";
	try {
		MemberVO member=memService.selectByUserid(userid);
		ProductVO pd=pdService.selectByPdCode(pdCode);
		
		int cnt=plService.insertPurchaseList(member, pd, qty);
		
		if (cnt>0) {
			msg="결제가 완료되었습니다.";
			url="purchase_complete.jsp";
			memService.updatePointInfo(member, pd.getPrice()*qty);
		} else {
			msg="결제에 실패했습니다. 다시 시도해주세요.";
			url="purchase.jsp";
		}
	} catch (SQLException e) {
		e.printStackTrace();
	}
	
	request.setAttribute("msg", msg);
	request.setAttribute("url", url);
%>
<jsp:forward page="../common/message.jsp"></jsp:forward>
</body>
</html>