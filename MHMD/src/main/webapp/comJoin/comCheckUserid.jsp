<%@page import="java.sql.SQLException"%>
<%@page import="com.homedeco.company.model.CompanyService" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="comService" class="com.homedeco.company.model.CompanyService" 
	scope="session"></jsp:useBean>
<%
	request.setCharacterEncoding("utf-8");
	String userid=request.getParameter("userid");
	
	int result=0;
	if (userid!=null && !userid.isEmpty()) {
		try {
			result=comService.duplicateId(userid);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>checkUserid.jsp</title>
<link rel="stylesheet" type="text/css" 
	href="<%=request.getContextPath()%>/css/styles.css"/>
<script type="text/javascript" 
	src="<%=request.getContextPath()%>/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	$(function(){
		$("#submit").click(function(){	
			if($('#userid').val().length<1){ 
				alert("아이디를 입력하세요"); 
				$('#userid').focus(); 
				event.preventDefault();
			}
		});

		$('#btUse').click(function(){
			$(opener.document).find('#userid').val('<%=userid%>');
			$(opener.document).find('#chkId').val('Y');
			
			self.close();
		});
	});
</script>	
</head>
<body>
<h2>아이디 중복 검사</h2><br>
	<form name="frmId" method="post" action="comCheckUserid.jsp">
		<input type="text" name="userid" id="userid" 
			title="아이디입력" value="<%=userid%>">
		<input type="submit"  id="submit" value="아이디 확인">
		<%if(result==CompanyService.EXIST_ID) {%>
			<p>이미 사용 중인 아이디입니다. 다른 아이디를 입력하세요.</p>	
		<%}else if(result==CompanyService.NON_EXIST_ID){	%>
			<input type="button" value="사용하기" id="btUse">
			<p>사용 가능한 아이디입니다. 계속하시려면 [사용하기] 버튼을 눌러주세요.</p>			
		<%} %>
	</form>
</body>
</html>