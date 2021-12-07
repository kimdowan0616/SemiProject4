<%@page import="java.sql.SQLException"%>
<%@page import="com.homedeco.member.model.MemberVO"%>
<%@page import="com.homedeco.member.model.MemberService"%>
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
	String userid=request.getParameter("userid");
	String pwd=request.getParameter("pwd");
	String chkSave=request.getParameter("chkSave");
	
	//2
	String msg="로그인 처리 실패", url="login.jsp";
	try{
		int result=memService.loginCheck(userid, pwd);
		if(result==MemberService.LOGIN_OK){
			MemberVO vo=memService.selectByUserid(userid);
			
			//[1] 세션에 저장
			session.setAttribute("userid", userid);
			session.setAttribute("userName", vo.getName());
			
			//[2] 쿠키에 저장					
			if(chkSave != null ){  //체크한 경우
				Cookie ck = new Cookie("ck_userid", userid);
				ck.setMaxAge(1000*24*60*60);
				ck.setPath("/");
				response.addCookie(ck);
			}else{
				Cookie ck = new Cookie("ck_userid", userid);
				ck.setMaxAge(0);  //쿠키 제거
				ck.setPath("/");
				response.addCookie(ck);				
			}
			
			msg= vo.getName()+ "님 환영합니다.";
			url="../section/main.jsp";
		}else if(result==MemberService.PWD_NOT_MATCH){
			msg="비밀번호가 일치하지 않습니다.";	
		}else if(result==MemberService.USERID_NONE){
			msg="아이디가 존재하지 않습니다.";
		}
	}catch(SQLException e){
		e.printStackTrace();
	}

	request.setAttribute("msg", msg);
	request.setAttribute("url", url);
	request.setAttribute("userid", userid);
%>
<jsp:forward page="../common/message.jsp"></jsp:forward>
</body>
</html>