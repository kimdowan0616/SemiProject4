<%@page import="com.homedeco.member.model.MemberService"%>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="memService" class="com.homedeco.member.model.MemberService" 
	scope="session"></jsp:useBean>

<%
	request.setCharacterEncoding("utf-8");
	String userid=(String)session.getAttribute("userid");
	String pwd=request.getParameter("pwd");
	
	String msg="탈퇴에 실패하였습니다.", url="memberOut.jsp";
	try {
		int result=memService.loginCheck(userid, pwd);
		
		if(result==MemberService.LOGIN_OK){
			int cnt=memService.withdrawMember(userid);
			
			//3
			if(cnt>0){
				msg="탈퇴가 완료되었습니다.";
				session.invalidate();
				
				Cookie ck = new Cookie("ck_userid", userid);
				ck.setMaxAge(0);
				ck.setPath("/");
				response.addCookie(ck);
				
				url="../section/main.jsp";
			}
		}else if(result==MemberService.PWD_NOT_MATCH){
			msg="비밀번호가 일치하지 않습니다.";	
		}else{
			msg="비밀번호 체크 실패";	
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