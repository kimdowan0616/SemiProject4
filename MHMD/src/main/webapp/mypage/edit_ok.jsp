<%@page import="com.homedeco.member.model.MemberService" %>
<%@page import="java.sql.SQLException" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="memVo" class="com.homedeco.member.model.MemberVO" 
	scope="page"></jsp:useBean>
<jsp:useBean id="memService" class="com.homedeco.member.model.MemberService" 
	scope="session"></jsp:useBean>
<%
	request.setCharacterEncoding("utf-8");	
	String userid=(String)session.getAttribute("userid");
	
	String pwd=request.getParameter("pwd");
	String zipcode=request.getParameter("zipcode");
	String address=request.getParameter("address");
	String addressDetail=request.getParameter("addressDetail");
	String hp1=request.getParameter("hp1");
	String hp2=request.getParameter("hp2");
	String hp3=request.getParameter("hp3");
	
	String hp="";
	if(hp2!=null && !hp2.isEmpty() && hp3 !=null && !hp3.isEmpty()){
		hp=hp1+"-"+hp2+"-"+hp3;
	}
	
	String msg="회원정보 수정에 실패하였습니다.", url="memberEdit.jsp";
	try{
		int result=memService.loginCheck(userid, pwd);
	
		if(result==MemberService.LOGIN_OK){
			memVo.setUserid(userid);
			memVo.setAddress(address);
			memVo.setAddressDetail(addressDetail);
			memVo.setHp(hp);
			memVo.setPwd(pwd);
			memVo.setUserid(userid);
			memVo.setZipcode(zipcode);
			int cnt=memService.updateMember(memVo);
			
			//3
			if(cnt>0){
				msg="회원정보 수정되었습니다.";
			}
		}else if(result==MemberService.PWD_NOT_MATCH){
			msg="비밀번호가 일치하지 않습니다.";	
		}else{
			msg="비밀번호 체크 실패";	
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