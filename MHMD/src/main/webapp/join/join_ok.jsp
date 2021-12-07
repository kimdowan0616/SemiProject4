<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>join_ok.jsp</title>
</head>
<body>
	<jsp:useBean id="memVo" class="com.homedeco.member.model.MemberVO" 
		scope="page"></jsp:useBean>
	<jsp:useBean id="memService" class="com.homedeco.member.model.MemberService" 
		scope="session"></jsp:useBean>
	
	<%
		request.setCharacterEncoding("utf-8");
		
		String name=request.getParameter("name");
		String userid=request.getParameter("userid");
		String pwd=request.getParameter("pwd");
		String zipcode=request.getParameter("zipcode");
		String address=request.getParameter("address");
		String addressDetail=request.getParameter("addressDetail");
		String hp1=request.getParameter("hp1");
		String hp2=request.getParameter("hp2");
		String hp3=request.getParameter("hp3");
		
		String hp="";
		if (hp2!=null && !hp2.isEmpty() && hp3!=null && !hp3.isEmpty()) {
			hp=hp1+"-"+hp2+"-"+hp3;
		}
		
		String msg="", url="";
		try {
			memVo.setName(name);
			memVo.setUserid(userid);
			memVo.setPwd(pwd);
			memVo.setZipcode(zipcode);
			memVo.setAddress(address);
			memVo.setAddressDetail(addressDetail);
			memVo.setHp(hp);
			
			int cnt=memService.insertMember(memVo);
			
			if (cnt>0) {
				msg="회원가입이 완료되었습니다.";
				url="../section/main.jsp";
			} else {
				msg="회원가입에 실패했습니다. 다시 시도해주세요.";
				url="join.jsp";
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