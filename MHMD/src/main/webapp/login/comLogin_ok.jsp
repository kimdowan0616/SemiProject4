<%@page import="java.sql.SQLException"%>
<%@page import="com.homedeco.company.model.CompanyVO"%>
<%@page import="com.homedeco.company.model.CompanyService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="comService" class="com.homedeco.company.model.CompanyService" 
	scope="session"></jsp:useBean>
<%
	request.setCharacterEncoding("utf-8");
	String userid=request.getParameter("userid");
	String pwd=request.getParameter("pwd");
	String chkSave=request.getParameter("chkSave");
	
	//2
	String msg="로그인 처리 실패", url="login.jsp";
	try{
		int result=comService.loginCheck(userid, pwd);
		if(result==CompanyService.LOGIN_OK){
			CompanyVO vo=comService.selectByUserid(userid);
			
			//[1] 세션에 저장
			session.setAttribute("userid", userid);
			session.setAttribute("userName", vo.getComName());
			
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
			
			msg= vo.getComName()+ "님 환영합니다.";
			url="../section/main.jsp";
		}else if(result==CompanyService.PWD_NOT_MATCH){
			msg="비밀번호가 일치하지 않습니다.";	
		}else if(result==CompanyService.USERID_NONE){
			msg="아이디가 존재하지 않습니다.";
		}
	}catch(SQLException e){
		e.printStackTrace();
	}

	request.setAttribute("msg", msg);
	request.setAttribute("url", url);
%>
<jsp:forward page="../common/message.jsp"></jsp:forward>
</body>
</html>