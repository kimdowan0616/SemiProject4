<%@page import="java.sql.SQLException"%>
<%@page import="com.homedeco.member.model.MemberVO"%>
<%@page import="com.homedeco.company.model.CompanyVO"%>
<%@page import="com.homedeco.company.model.CompanyDAO"%>
<%@page import="com.homedeco.member.model.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>whatMemberKind.jsp</title>
</head>
<body>
<%
	String userid=(String)request.getAttribute("userid");

	MemberDAO memDao=new MemberDAO();
	
	try {
		if (memDao.selectByUserid(userid)==null) {
			response.sendRedirect("mypage_company.jsp?userid="+userid);
		} else {
			response.sendRedirect("mypage_consumer.jsp?userid="+userid);
		}
	} catch (SQLException e) {
		e.printStackTrace();
	}
%>
</body>
</html>