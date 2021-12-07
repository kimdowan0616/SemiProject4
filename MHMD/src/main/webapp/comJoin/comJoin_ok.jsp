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
	<jsp:useBean id="comVo" class="com.homedeco.company.model.CompanyVO"
		scope="page"></jsp:useBean>
	<jsp:useBean id="comService" class="com.homedeco.company.model.CompanyService" 
		scope="session"></jsp:useBean>
	
	<%
		request.setCharacterEncoding("utf-8");
		
		String comName=request.getParameter("name");
		String userid=request.getParameter("userid");
		String pwd=request.getParameter("pwd");
		String zipcode=request.getParameter("zipcode");
		String address=request.getParameter("address");
		String addressDetail=request.getParameter("addressDetail");
		String tel1=request.getParameter("hp1");
		String tel2=request.getParameter("hp2");
		String tel3=request.getParameter("hp3");
		String email1=request.getParameter("email1");
		String email2=request.getParameter("email2");
		String email3=request.getParameter("email3");
		
		String email="", tel="";
		if(tel2!=null && !tel2.isEmpty() && tel3 !=null && !tel3.isEmpty()){
			tel=tel1+"-"+tel2+"-"+tel3;
		}
		
		if(email1!=null && !email1.isEmpty()){
			if(email2.equals("etc")){
				if(email3!=null && !email3.isEmpty()){
					email=email1+"@"+email3;
				}
			}else{
				email=email1+"@"+email2;
			}
		}
		
		String msg="", url="";
		try {
			comVo.setComName(comName);
			comVo.setUserid(userid);
			comVo.setPwd(pwd);
			comVo.setZipcode(zipcode);
			comVo.setAddress(address);
			comVo.setAddressDetail(addressDetail);
			comVo.setTel(tel);
			
			int cnt=comService.insertCompany(comVo);
			
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